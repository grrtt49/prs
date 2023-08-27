PRSinv = PRSinv or {}

PRSinv.inventoryTable = PRSinv.inventoryTable or {} 

PRSinv.container = PRSinv.container or Geyser.ScrollBox:new({
  name = "inventoryScrollBox",
  height = "100%",
  width = "100%",
  x = 0,
  y = 0
}, GUI.tabwindow2.Inventorycenter)

PRSinv.gmcpGetItem = function (id)
  send("gmcp item " .. id, false)
end

PRSinv.currentInventoryIndex = 1

PRSinv.getNextInventoryItem = function ()
  if not PRSutil.isTabActive("Inventory") then
    return
  end
  
  if PRSinv.currentInventoryIndex <= #gmcp.Char.inventory then
    local iid = gmcp.Char.inventory[PRSinv.currentInventoryIndex]
    if not PRSinv.inventoryTable[iid] then
      echo("Getting inventory item " .. PRSinv.currentInventoryIndex .. "/" .. #gmcp.Char.inventory .. "\n")
      PRSinv.gmcpGetItem(iid)
      PRSinv.currentInventoryIndex = PRSinv.currentInventoryIndex + 1
    else
      echo("Already got " .. PRSinv.currentInventoryIndex .. "/" .. #gmcp.Char.inventory .. "\n")
      PRSinv.currentInventoryIndex = PRSinv.currentInventoryIndex + 1
      PRSinv.getNextInventoryItem()
    end
  else
    PRSinv.displayAllInventory()
  end
end

PRSinv.gmcpStoreItemData = function ()
  if not gmcp or not gmcp.Item or not gmcp.Item.Info then
    echo("Item not set...\n")
    return
  end
  
  PRSinv.inventoryTable[gmcp.Item.Info.iid] = PRSutil.tableCopy(gmcp.Item, nil)
  echo("Stored: " .. gmcp.Item.Info.iid .. "\n")
  PRSinv.getNextInventoryItem()
end

PRSinv.getAllInventoryData = function ()
  if PRSutil.isTabActive("Inventory") then
    display("Getting inventory...")
    PRSinv.currentInventoryIndex = 1
    PRSinv.getNextInventoryItem()
  else
    display("Not in inventory tab...")
  end
end

PRSinv.labels = PRSinv.labels or {}

PRSinv.displayAllInventory = function ()
  local lastIndex = 0
  for i, iid in ipairs(gmcp.Char.inventory) do
    PRSinv.displayItem(i, iid)
    lastIndex = i
  end
  
  for i = lastIndex + 1, #PRSinv.labels, 1 do
    PRSinv.labels[i]:hide()
  end
end

PRSinv.showItemMenu = function (iid)
  local item = PRSinv.inventoryTable[iid]
  if not item then
    return
  end
  
  GUI.floating_menu:show()
  PRSinv.itemLabel = PRSinv.itemLabel or Geyser.Label:new({
    x = 0,
    y = 0,
    width = "100%",
    height = 40,
    name = "menuItemLabel"
  }, GUI.floatingMenuWindow)
  PRSinv.itemLabel:cecho("L" .. item.Info.level .. " " .. item.Info.amount .. "x " .. PRSutil.getCechoColor(item.Info.colorName))
end

PRSinv.labelHeight = 35
PRSinv.labelGapHeight = 2

PRSinv.displayItem = function (i, iid)
  local y = (i - 1) * (PRSinv.labelGapHeight + PRSinv.labelHeight)
  PRSinv.labels[i] = PRSinv.labels[i] or Geyser.Label:new({
    name = "invLabel" .. i,
    x = 0,
    y = y,
    width = "100%-20px",
    height = PRSinv.labelHeight
  }, PRSinv.container)
  local label = PRSinv.labels[i]
  label:setStyleSheet([[
    padding-left: 10px;
    background-color: #222222;
  ]])
  label:setClickCallback(function (event)
    PRSinv.showItemMenu(iid)
  end)
  label:show()
  
  local item = PRSinv.inventoryTable[iid]
  if item then
    label:cecho("L" .. item.Info.level .. " " .. item.Info.amount .. "x " .. PRSutil.getCechoColor(item.Info.colorName))
  end
end

if PRSinv.invEventHandler then
    killAnonymousEventHandler(PRSinv.invEventHandler)
end -- clean up any already registered handlers for this function
PRSinv.invEventHandler = registerAnonymousEventHandler("gmcp.Item", PRSinv.gmcpStoreItemData)

if PRSinv.getInvEventHandler then
    killAnonymousEventHandler(PRSinv.getInvEventHandler)
end -- clean up any already registered handlers for this function
PRSinv.getInvEventHandler = registerAnonymousEventHandler("gmcp.Char.inventory", PRSinv.getAllInventoryData)

if PRSinv.getTabChangeHandler then
    killAnonymousEventHandler(PRSinv.getTabChangeHandler)
end -- clean up any already registered handlers for this function
PRSinv.getTabChangeHandler = registerAnonymousEventHandler("tab_activated", PRSinv.getAllInventoryData)
