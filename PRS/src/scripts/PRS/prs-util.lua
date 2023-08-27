PRSutil = {}

PRSutil.colorTable = {
  ["{{r"] = "<ansi_red>",
  ["{{R"] = "<ansi_light_red>",
  ["{{g"] = "<ansi_green>",
  ["{{G"] = "<ansi_light_green>",
  ["{{y"] = "<ansi_yellow>",
  ["{{Y"] = "<ansi_light_yellow>",
  ["{{b"] = "<ansi_blue>",
  ["{{B"] = "<ansi_light_blue>",
  ["{{m"] = "<ansi_magenta>",
  ["{{M"] = "<ansi_light_magenta>",
  ["{{c"] = "<ansi_cyan>",
  ["{{C"] = "<ansi_light_cyan>",
  ["{{w"] = "<ansi_white>",
  ["{{W"] = "<ansi_light_white>",
  ["{{K"] = "<ansi_light_black>"
}

PRSutil.getCechoColor = function (string)
  local formatted = string
  for placeholder, colorCode in pairs(PRSutil.colorTable) do
    formatted = formatted:gsub(placeholder, colorCode)
  end
  return formatted
end

PRSutil.removeColor = function (string)
  local formatted = string
  for placeholder, colorCode in pairs(PRSutil.colorTable) do
    formatted = formatted:gsub(placeholder, "")
  end
  return formatted
end

PRSutil.tableConcat = function (t1,t2)
  local t3 = {}
  for i=1,#t1 do
      t3[i] = t1[i]
  end
  for i=1,#t2 do
      t3[#t1+i] = t2[i]
  end
  return t3
end

PRSutil.tableCopy = function (obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[PRSutil.tableCopy(k, s)] = PRSutil.tableCopy(v, s) end
  return res
end

PRSutil.isInArray = function(array, target)
  for _, value in ipairs(array) do
    if value == target then
      return true
    end
  end
  return false
end

PRSutil.isTabActive = function(tab)
  local windows = {GUI.tabwindow1, GUI.tabwindow2, GUI.tabwindow3, GUI.tabwindow4}
  for i, window in ipairs(windows) do
    if window.current == tab then
      return true
    end
  end
  return false
end

PRSutil.getWindowFromTab = function(tab)
  local windows = {GUI.tabwindow1, GUI.tabwindow2, GUI.tabwindow3, GUI.tabwindow4}
  for i, window in ipairs(windows) do
    if PRSutil.isInArray(window.tabs, tab) then
      return window
    end
  end
  return nil
end

PRSutil.setTabFromWindow = function(tab, window)
  window:activateTab(tab)
end

PRSutil.setTab = function(tab)
  PRSutil.getWindowFromTab(tab):activateTab(tab)
end