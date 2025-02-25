-- Procedural Realms Script (PRS) Stats Gauges for Mudlet
-- by Stack (https://ilpdev.com/prs) & Dalem
PRSstats = PRSstats or {}
PRSstats.events = PRSstats.events or {}

local SUG = require("PRS.sug")

local function vitalsHeader()
    local header = Geyser.HBox:new({
        name = "header",
        height = 25,
        width = "93%"
    }, GUI.tabwindow1.Vitalscenter)
    local name = Geyser.Label:new({
        name = "name"
    }, header)
    name:setFontSize(12)
    name:setColor(0, 0, 0, 0)
    name:echo(gmcp.Char.player.name, "#f9f1a5", "l")
    local class = Geyser.Label:new({
        name = "class"
    }, header)
    class:setFontSize(12)
    class:setColor(0, 0, 0, 0)
    class:echo(gmcp.Char.player.class, "#b4009e", "c")
    if PRSstats.events.classChange_id then
        killAnonymousEventHandler(PRSstats.events.classChange_id)
    end
    PRSstats.events.classChange_id = registerAnonymousEventHandler("gmcp.Char.player.class", function()
        if gmcp.Char.player.class then
            class:echo(gmcp.Char.player.class, "#b4009e", "c")
        end
    end)
    local level = Geyser.Label:new({
        name = "level"
    }, header)
    level:setFontSize(12)
    level:setColor(0, 0, 0, 0)
    level:echo("Level " .. gmcp.Char.player.level, "#ababab", "r")
    if PRSstats.events.levelChange_id then
        killAnonymousEventHandler(PRSstats.events.levelChange_id)
    end
    PRSstats.events.levelChange_id = registerAnonymousEventHandler("gmcp.Char.player.level", function()
        if gmcp.Char.player.level then
            level:echo("Level " .. gmcp.Char.player.level, "#ababab", "r")
        end
    end)
end

local function statsTab()
    local statsVBox = Geyser.VBox:new({
        name = "statsVBox",
        height = "95%",
        width = "93%"
    }, GUI.tabwindow1.Statscenter)
    local abilitiesTitle = Geyser.Label:new({
        name = "abilitiesTitle",
        height = 30
    }, statsVBox)
    abilitiesTitle:setColor(0, 0, 0, 0)
    abilitiesTitle:setFontSize(12)
    abilitiesTitle:echo("Abilities", "#f2f2f2", "c")
        -- Strength
        local strengthHBox = Geyser.HBox:new({
            name = "strengthHBox",
            width = "93%"
        }, statsVBox)
        local strengthTitle = Geyser.Label:new({
            name = "strengthTitle"
        }, strengthHBox)
        strengthTitle:setColor(0, 0, 0, 0)
        strengthTitle:setFontSize(9)
        strengthTitle:echo("Strength:", "#aaaaaa", "r")
        local strength = Geyser.Label:new({
            name = "strength"
        }, strengthHBox)
        strength:setColor(0, 0, 0, 0)
        strength:setFontSize(9)
        strength:echo(gmcp.Char.player.strength, "#e74856", "c")
        if PRSstats.events.strengthChange_id then
            killAnonymousEventHandler(PRSstats.events.strengthChange_id)
        end
        PRSstats.events.strengthChange_id = registerAnonymousEventHandler("gmcp.Char.player.strength", function()
            if gmcp.Char.player.strength then
                strength:echo(gmcp.Char.player.strength, "#e74856", "c")
            end
        end)
        local _strength = Geyser.Label:new({
            name = "_strength"
        }, strengthHBox)
        _strength:setColor(0, 0, 0, 0)
        _strength:setFontSize(9)
        _strength:echo("(" .. gmcp.Char.player._strength .. ")", "#c50f1f", "l")
        if PRSstats.events._strengthChange_id then
            killAnonymousEventHandler(PRSstats.events._strengthChange_id)
        end
        PRSstats.events._strengthChange_id = registerAnonymousEventHandler("gmcp.Char.player._strength", function()
            if gmcp.Char.player._strength then
                _strength:echo("(" .. gmcp.Char.player._strength .. ")", "#c50f1f", "l")
            end
        end)
        -- Agility
        local agilityHBox = Geyser.HBox:new({
            name = "agilityHBox",
            width = "93%"
        }, statsVBox)
        local agilityTitle = Geyser.Label:new({
            name = "agilityTitle"
        }, agilityHBox)
        agilityTitle:setColor(0, 0, 0, 0)
        agilityTitle:setFontSize(9)
        agilityTitle:echo("Agility:", "#aaaaaa", "r")
        local agility = Geyser.Label:new({
            name = "agility"
        }, agilityHBox)
        agility:setColor(0, 0, 0, 0)
        agility:setFontSize(9)
        agility:echo(gmcp.Char.player.agility, "#f9f1a5", "c")
        if PRSstats.events.agilityChange_id then
            killAnonymousEventHandler(PRSstats.events.agilityChange_id)
        end
        PRSstats.events.agilityChange_id = registerAnonymousEventHandler("gmcp.Char.player.agility", function()
            if gmcp.Char.player.agility then
                agility:echo(gmcp.Char.player.agility, "#f9f1a5", "c")
            end
        end)
        local _agility = Geyser.Label:new({
            name = "_agility"
        }, agilityHBox)
        _agility:setColor(0, 0, 0, 0)
        _agility:setFontSize(9)
        _agility:echo("(" .. gmcp.Char.player._agility .. ")", "#c19c00", "l")
        if PRSstats.events._agilityChange_id then
            killAnonymousEventHandler(PRSstats.events._agilityChange_id)
        end
        PRSstats.events._agilityChange_id = registerAnonymousEventHandler("gmcp.Char.player._agility", function()
            if gmcp.Char.player._agility then
                _agility:echo("(" .. gmcp.Char.player._agility .. ")", "#c19c00", "l")
            end
        end)
        -- Magic
        local magicHBox = Geyser.HBox:new({
            name = "magicHBox",
            width = "93%"
        }, statsVBox)
        local magicTitle = Geyser.Label:new({
            name = "magicTitle"
        }, magicHBox)
        magicTitle:setColor(0, 0, 0, 0)
        magicTitle:setFontSize(9)
        magicTitle:echo("Magic:", "#aaaaaa", "r")
        local magic = Geyser.Label:new({
            name = "magic"
        }, magicHBox)
        magic:setColor(0, 0, 0, 0)
        magic:setFontSize(9)
        magic:echo(gmcp.Char.player.magic, "#61d6d6", "c")
        if PRSstats.events.magicChange_id then
            killAnonymousEventHandler(PRSstats.events.magicChange_id)
        end
        PRSstats.events.magicChange_id = registerAnonymousEventHandler("gmcp.Char.player.magic", function()
            if gmcp.Char.player.magic then
                magic:echo(gmcp.Char.player.magic, "#61d6d6", "c")
            end
        end)
        local _magic = Geyser.Label:new({
            name = "_magic"
        }, magicHBox)
        _magic:setColor(0, 0, 0, 0)
        _magic:setFontSize(9)
        _magic:echo("(" .. gmcp.Char.player._magic .. ")", "#3a96dd", "l")
        if PRSstats.events._magicChange_id then
            killAnonymousEventHandler(PRSstats.events._magicChange_id)
        end
        PRSstats.events._magicChange_id = registerAnonymousEventHandler("gmcp.Char.player._magic", function()
            if gmcp.Char.player._magic then
                _magic:echo("(" .. gmcp.Char.player._magic .. ")", "#3a96dd", "l")
            end
        end)
        -- Spirit
        local spiritHBox = Geyser.HBox:new({
            name = "spiritHBox",
            width = "93%"
        }, statsVBox)
        local spiritTitle = Geyser.Label:new({
            name = "spiritTitle"
        }, spiritHBox)
        spiritTitle:setColor(0, 0, 0, 0)
        spiritTitle:setFontSize(9)
        spiritTitle:echo("Spirit:", "#aaaaaa", "r")
        local spirit = Geyser.Label:new({
            name = "spirit"
        }, spiritHBox)
        spirit:setColor(0, 0, 0, 0)
        spirit:setFontSize(9)
        spirit:echo(gmcp.Char.player.spirit, "#16c60c", "c")
        if PRSstats.events.spiritChange_id then
            killAnonymousEventHandler(PRSstats.events.spiritChange_id)
        end
        PRSstats.events.spiritChange_id = registerAnonymousEventHandler("gmcp.Char.player.spirit", function()
            if gmcp.Char.player.spirit then
                spirit:echo(gmcp.Char.player.spirit, "#16c60c", "c")
            end
        end)
        local _spirit = Geyser.Label:new({
            name = "_spirit"
        }, spiritHBox)
        _spirit:setColor(0, 0, 0, 0)
        _spirit:setFontSize(9)
        _spirit:echo("(" .. gmcp.Char.player._spirit .. ")", "#13a10e", "l")
        if PRSstats.events._spiritChange_id then
            killAnonymousEventHandler(PRSstats.events._spiritChange_id)
        end
        PRSstats.events._spiritChange_id = registerAnonymousEventHandler("gmcp.Char.player._spirit", function()
            if gmcp.Char.player._spirit then
                _spirit:echo("(" .. gmcp.Char.player._spirit .. ")", "#13a10e", "l")
            end
        end)
    
    local combatTitle = Geyser.Label:new({
        name = "combatTitle",
        height = 30
    }, statsVBox)
    combatTitle:setColor(0, 0, 0, 0)
    combatTitle:setFontSize(12)
    combatTitle:echo("Combat", "#f2f2f2", "c")
        -- Damage
        local damageHBox = Geyser.HBox:new({
            name = "damageHBox",
            width = "93%"
        }, statsVBox)
        local damageTitle = Geyser.Label:new({
            name = "damageTitle"
        }, damageHBox)
        damageTitle:setColor(0, 0, 0, 0)
        damageTitle:setFontSize(9)
        damageTitle:echo("Damage:", "#aaaaaa", "r")
        local damage = Geyser.Label:new({
            name = "damage"
        }, damageHBox)
        damage:setColor(0, 0, 0, 0)
        damage:setFontSize(9)
        damage:echo(string.format("%0.0f", gmcp.Char.player.damLow) .. "-" .. string.format("%0.0f", gmcp.Char.player.damHigh), "#e74856", "c")
        if PRSstats.events.damLowChange_id then
            killAnonymousEventHandler(PRSstats.events.damLowChange_id)
        end
        PRSstats.events.damLowChange_id = registerAnonymousEventHandler("gmcp.Char.player.damLow", function()
            if gmcp.Char.player.damLow then
                damage:echo(string.format("%0.0f", gmcp.Char.player.damLow) .. "-" .. string.format("%0.0f", gmcp.Char.player.damHigh), "#e74856", "c")
            end
        end)
        if PRSstats.events.damHighChange_id then
            killAnonymousEventHandler(PRSstats.events.damHighChange_id)
        end
        PRSstats.events.damHighChange_id = registerAnonymousEventHandler("gmcp.Char.player.damHigh", function()
            if gmcp.Char.player.damHigh then
                damage:echo(string.format("%0.0f", gmcp.Char.player.damLow) .. "-" .. string.format("%0.0f", gmcp.Char.player.damHigh), "#e74856", "c")
            end
        end)
        local dpr = Geyser.Label:new({
            name = "dpr"
        }, damageHBox)
        dpr:setColor(0, 0, 0, 0)
        dpr:setFontSize(9)
        dpr:echo(string.format("%0.1f", gmcp.Char.player.dpr) .. " dpr", "#c50f1f", "l")
        if PRSstats.events.dprChange_id then
            killAnonymousEventHandler(PRSstats.events.dprChange_id)
        end
        PRSstats.events.dprChange_id = registerAnonymousEventHandler("gmcp.Char.player.dpr", function()
            if gmcp.Char.player.dpr then
                dpr:echo(string.format("%0.1f", gmcp.Char.player.dpr) .. " dpr", "#c50f1f", "l")
            end
        end)
        -- Armor
        local armorHBox = Geyser.HBox:new({
            name = "armorHBox",
            width = "93%"
        }, statsVBox)
        local armorTitle = Geyser.Label:new({
            name = "armorTitle"
        }, armorHBox)
        armorTitle:setColor(0, 0, 0, 0)
        armorTitle:setFontSize(9)
        armorTitle:echo("Armor:", "#aaaaaa", "r")
        local armor = Geyser.Label:new({
            name = "armor"
        }, armorHBox)
        armor:setColor(0, 0, 0, 0)
        armor:setFontSize(9)
        armor:echo(gmcp.Char.player.armor, "#f2f2f2", "c")
        if PRSstats.events.armorChange_id then
            killAnonymousEventHandler(PRSstats.events.armorChange_id)
        end
        PRSstats.events.armorChange_id = registerAnonymousEventHandler("gmcp.Char.player.armor", function()
            if gmcp.Char.player.armor then
                armor:echo(gmcp.Char.player.armor, "#f2f2f2", "c")
            end
        end)
        local armorAbsorbtion = Geyser.Label:new({
            name = "armorAbsorbtion"
        }, armorHBox)
        armorAbsorbtion:setColor(0, 0, 0, 0)
        armorAbsorbtion:setFontSize(9)
        armorAbsorbtion:echo(gmcp.Char.player.armorAbsorbtion .. " absorb", "#f2f2f2", "l")
        if PRSstats.events.armorAbsorbtionChange_id then
            killAnonymousEventHandler(PRSstats.events.armorAbsorbtionChange_id)
        end
        PRSstats.events.armorAbsorbtionChange_id = registerAnonymousEventHandler("gmcp.Char.player.armorAbsorbtion", function()
            if gmcp.Char.player.armorAbsorbtion then
                armorAbsorbtion:echo(gmcp.Char.player.armorAbsorbtion .. " absorb", "#f2f2f2", "l")
            end
        end)
        -- Speed
        local speedHBox = Geyser.HBox:new({
            name = "speedHBox",
            width = "93%"
        }, statsVBox)
        local speedTitle = Geyser.Label:new({
            name = "speedTitle"
        }, speedHBox)
        speedTitle:setColor(0, 0, 0, 0)
        speedTitle:setFontSize(9)
        speedTitle:echo("Speed:", "#aaaaaa", "r")
        local speed = Geyser.Label:new({
            name = "speed"
        }, speedHBox)
        speed:setColor(0, 0, 0, 0)
        speed:setFontSize(9)
        speed:echo(gmcp.Char.player.speed, "#f9f1a5", "c")
        if PRSstats.events.speedChange_id then
            killAnonymousEventHandler(PRSstats.events.speedChange_id)
        end
        PRSstats.events.speedChange_id = registerAnonymousEventHandler("gmcp.Char.player.speed", function()
            if gmcp.Char.player.speed then
                speed:echo(gmcp.Char.player.speed, "#f9f1a5", "c")
            end
        end)
        local apr = Geyser.Label:new({
            name = "apr"
        }, speedHBox)
        apr:setColor(0, 0, 0, 0)
        apr:setFontSize(9)
        apr:echo(string.format("%0.2f", gmcp.Char.player.apr) .. " apr", "#f9f1a5", "l")
        if PRSstats.events.aprChange_id then
            killAnonymousEventHandler(PRSstats.events.aprChange_id)
        end
        PRSstats.events.aprChange_id = registerAnonymousEventHandler("gmcp.Char.player.apr", function()
            if gmcp.Char.player.apr then
                apr:echo(stringfortmat("%0.2f", gmcp.Char.player.apr) .. " apr", "#f9f1a5", "l")
            end
        end)
        -- Critical
        local criticalHBox = Geyser.HBox:new({
            name = "criticalHBox",
            width = "93%"
        }, statsVBox)
        local criticalTitle = Geyser.Label:new({
            name = "criticalTitle"
        }, criticalHBox)
        criticalTitle:setColor(0, 0, 0, 0)
        criticalTitle:setFontSize(9)
        criticalTitle:echo("Critical:", "#aaaaaa", "r")
        local criticalChance = Geyser.Label:new({
            name = "criticalChance"
        }, criticalHBox)
        criticalChance:setColor(0, 0, 0, 0)
        criticalChance:setFontSize(9)
        criticalChance:echo(string.format("%0.2f", gmcp.Char.player.criticalChance) .. "%", "#f9f1a5", "c")
        if PRSstats.events.criticalChanceChange_id then
            killAnonymousEventHandler(PRSstats.events.criticalChanceChange_id)
        end
        PRSstats.events.criticalChanceChange_id = registerAnonymousEventHandler("gmcp.Char.player.criticalChance", function()
            if gmcp.Char.player.criticalChance then
                criticalChance:echo(string.format("%0.2f", gmcp.Char.player.criticalChance) .. "%", "#f9f1a5", "c")
            end
        end)
        local criticalMultiplier = Geyser.Label:new({
            name = "criticalMultiplier"
        }, criticalHBox)
        criticalMultiplier:setColor(0, 0, 0, 0)
        criticalMultiplier:setFontSize(9)
        criticalMultiplier:echo(string.format("%0.2f", gmcp.Char.player.criticalMultiplier) .. "x", "#e74856", "l")
        if PRSstats.events.criticalMultiplierChange_id then
            killAnonymousEventHandler(PRSstats.events.criticalMultiplierChange_id)
        end
        PRSstats.events.criticalMultiplierChange_id = registerAnonymousEventHandler("gmcp.Char.player.criticalMultiplier", function()
            if gmcp.Char.player.criticalMultiplier then
                criticalMultiplier:echo(string.format("%0.2f", gmcp.Char.player.criticalMultiplier) .. "x", "#e74856", "l")
            end
        end)
        -- Magic Damage & Casting
        local magicDamageHBox = Geyser.HBox:new({
            name = "magicDamageHBox",
            width = "93%"
        }, statsVBox)
        local magicDamageBonusTitle = Geyser.Label:new({
            name = "magicDamageBonusTitle"
        }, magicDamageHBox)
        magicDamageBonusTitle:setColor(0, 0, 0, 0)
        magicDamageBonusTitle:setFontSize(9)
        magicDamageBonusTitle:echo("Magic:", "#aaaaaa", "r")
        local magicDamageBonus = Geyser.Label:new({
            name = "magicDamageBonus"
        }, magicDamageHBox)
        magicDamageBonus:setColor(0, 0, 0, 0)
        magicDamageBonus:setFontSize(9)
        magicDamageBonus:echo("+" .. gmcp.Char.player.magicDamageBonus, "#b4009e", "c")
        if PRSstats.events.magicDamageBonusChange_id then
            killAnonymousEventHandler(PRSstats.events.magicDamageBonusChange_id)
        end
        PRSstats.events.magicDamageBonusChange_id = registerAnonymousEventHandler("gmcp.Char.player.magicDamageBonus", function()
            if gmcp.Char.player.magicDamageBonus then
                magicDamageBonus:echo("+" .. gmcp.Char.player.magicDamageBonus, "#b4009e", "c")
            end
        end)
        local magicCasting = Geyser.Label:new({
            name = "magicCasting"
        }, magicDamageHBox)
        magicCasting:setColor(0, 0, 0, 0)
        magicCasting:setFontSize(9)
        magicCasting:echo("cast " .. string.format("%0.2f", gmcp.Char.player.magicCastingTimeBonus) .. "s", "#61d6d6", "l")
        if PRSstats.events.magicCastingChange_id then
            killAnonymousEventHandler(PRSstats.events.magicCastingChange_id)
        end
        PRSstats.events.magicCastingChange_id = registerAnonymousEventHandler("gmcp.Char.player.magicCastingTimeBonus", function()
            if gmcp.Char.player.magicCasting then
                magicCasting:echo("cast " .. string.format("%0.2f", gmcp.Char.player.magicCastingTimeBonus) .. "s", "#61d6d6", "l")
            end
        end)
        -- Focus
        local focusHBox = Geyser.HBox:new({
            name = "focusHBox",
            width = "93%"
        }, statsVBox)
        local focusTitle = Geyser.Label:new({
            name = "focusTitle"
        }, focusHBox)
        focusTitle:setColor(0, 0, 0, 0)
        focusTitle:setFontSize(9)
        focusTitle:echo("Focus:", "#aaaaaa", "r")
        local focus = Geyser.Label:new({
            name = "focus"
        }, focusHBox)
        focus:setColor(0, 0, 0, 0)
        focus:setFontSize(9)
        focus:echo(gmcp.Char.player.focus, "#3b78ff", "c")
        if PRSstats.events.focusChange_id then
            killAnonymousEventHandler(PRSstats.events.focusChange_id)
        end
        PRSstats.events.focusChange_id = registerAnonymousEventHandler("gmcp.Char.player.focus", function()
            if gmcp.Char.player.focus then
                focus:echo(gmcp.Char.player.focus, "#3b78ff", "c")
            end
        end)
        local focusChance = Geyser.Label:new({
            name = "focusChance"
        }, focusHBox)
        focusChance:setColor(0, 0, 0, 0)
        focusChance:setFontSize(9)
        focusChance:echo(string.format("%0.2f", gmcp.Char.player.focusChance) .. "%", "#3b78ff", "l")
        if PRSstats.events.focusChanceChange_id then
            killAnonymousEventHandler(PRSstats.events.focusChanceChange_id)
        end
        PRSstats.events.focusChanceChange_id = registerAnonymousEventHandler("gmcp.Char.player.focusChance", function()
            if gmcp.Char.player.focusChance then
                focusChance:echo(string.format("%0.2f", gmcp.Char.player.focusChance) .. "%", "#3b78ff", "l")
            end
        end)
    local resistancesTitle = Geyser.Label:new({
        name = "resistancesTitle",
        height = 30
    }, statsVBox)
    resistancesTitle:setColor(0, 0, 0, 0)
    resistancesTitle:setFontSize(12)
    resistancesTitle:echo("Resistances", "#f2f2f2", "c")
        -- Bludgeon & Arcane
        local resist1HBox = Geyser.HBox:new({
            name = "resist1HBox",
            width = "93%"
        }, statsVBox)
        local resistBludgeoningTitle = Geyser.Label:new({
            name = "resistBludgeoningTitle"
        }, resist1HBox)
        resistBludgeoningTitle:setColor(0, 0, 0, 0)
        resistBludgeoningTitle:setFontSize(9)
        resistBludgeoningTitle:echo("Bludgeon: ", "#aaaaaa", "r")
        local resistBludgeoning = Geyser.Label:new({
            name = "resistBludgeoning"
        }, resist1HBox)
        resistBludgeoning:setColor(0, 0, 0, 0)
        resistBludgeoning:setFontSize(9)
        resistBludgeoning:echo(gmcp.Char.player.resistBludgeoning, "#c19c00", "l")
        if PRSstats.events.resistBludgeoningChange_id then
            killAnonymousEventHandler(PRSstats.events.resistBludgeoningChange_id)
        end
        PRSstats.events.resistBludgeoningChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistBludgeoning", function()
            if gmcp.Char.player.resistBludgeoning then
                focus:echo(gmcp.Char.player.resistBludgeoning, "#c19c00", "l")
            end
        end)
        local arcaneTitle = Geyser.Label:new({
            name = "arcaneTitle"
        }, resist1HBox)
        arcaneTitle:setColor(0, 0, 0, 0)
        arcaneTitle:setFontSize(9)
        arcaneTitle:echo("Arcane: ", "#aaaaaa", "r")
        local resistArcane = Geyser.Label:new({
            name = "arcane"
        }, resist1HBox)
        resistArcane:setColor(0, 0, 0, 0)
        resistArcane:setFontSize(9)
        resistArcane:echo(gmcp.Char.player.resistArcane, "#61d6d6", "l")
        if PRSstats.events.resistArcaneChange_id then
            killAnonymousEventHandler(PRSstats.events.resistArcaneChange_id)
        end
        PRSstats.events.resistArcaneChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistArcane", function()
            if gmcp.Char.player.resistArcane then
                resistArcane:echo(gmcp.Char.player.resistArcane, "#61d6d6", "l")
            end
        end)
        -- Slash & Electric
        local resist2HBox = Geyser.HBox:new({
            name = "resist2HBox",
            width = "93%"
        }, statsVBox)
        local resistSlashingTitle = Geyser.Label:new({
            name = "resistSlashingTitle"
        }, resist2HBox)
        resistSlashingTitle:setColor(0, 0, 0, 0)
        resistSlashingTitle:setFontSize(9)
        resistSlashingTitle:echo("Slash: ", "#aaaaaa", "r")
        local resistSlashing = Geyser.Label:new({
            name = "resistSlashing"
        }, resist2HBox)
        resistSlashing:setColor(0, 0, 0, 0)
        resistSlashing:setFontSize(9)
        resistSlashing:echo(gmcp.Char.player.resistSlashing, "#e74856", "l")
        if PRSstats.events.resistSlashingChange_id then
            killAnonymousEventHandler(PRSstats.events.resistSlashingChange_id)
        end
        PRSstats.events.resistSlashingChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistSlashing", function()
            if gmcp.Char.player.resistSlashing then
                focus:echo(gmcp.Char.player.resistSlashing, "#e74856", "l")
            end
        end)
        local resistElectricTitle = Geyser.Label:new({
            name = "resistElectricTitle"
        }, resist2HBox)
        resistElectricTitle:setColor(0, 0, 0, 0)
        resistElectricTitle:setFontSize(9)
        resistElectricTitle:echo("Electric: ", "#aaaaaa", "r")
        local resistElectric = Geyser.Label:new({
            name = "Electric"
        }, resist2HBox)
        resistElectric:setColor(0, 0, 0, 0)
        resistElectric:setFontSize(9)
        resistElectric:echo(gmcp.Char.player.resistElectric, "#f9f1a5", "l")
        if PRSstats.events.resistElectricChange_id then
            killAnonymousEventHandler(PRSstats.events.resistElectricChange_id)
        end
        PRSstats.events.resistElectricChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistElectric", function()
            if gmcp.Char.player.resistElectric then
                resistElectric:echo(gmcp.Char.player.resistElectric, "#f9f1a5", "l")
            end
        end)
        -- Pierce & Fire
        local resist3HBox = Geyser.HBox:new({
            name = "resist3HBox",
            width = "93%"
        }, statsVBox)
        local resistPiercingTitle = Geyser.Label:new({
            name = "resistPiercingTitle"
        }, resist3HBox)
        resistPiercingTitle:setColor(0, 0, 0, 0)
        resistPiercingTitle:setFontSize(9)
        resistPiercingTitle:echo("Pierce: ", "#aaaaaa", "r")
        local resistPiercing = Geyser.Label:new({
            name = "resistPiercing"
        }, resist3HBox)
        resistPiercing:setColor(0, 0, 0, 0)
        resistPiercing:setFontSize(9)
        resistPiercing:echo(gmcp.Char.player.resistPiercing, "#c50f1f", "l")
        if PRSstats.events.resistPiercingChange_id then
            killAnonymousEventHandler(PRSstats.events.resistPiercingChange_id)
        end
        PRSstats.events.resistPiercingChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistPiercing", function()
            if gmcp.Char.player.resistPiercing then
                focus:echo(gmcp.Char.player.resistPiercing, "#c50f1f", "l")
            end
        end)
        local resistFireTitle = Geyser.Label:new({
            name = "resistFireTitle"
        }, resist3HBox)
        resistFireTitle:setColor(0, 0, 0, 0)
        resistFireTitle:setFontSize(9)
        resistFireTitle:echo("Fire: ", "#aaaaaa", "r")
        local resistFire = Geyser.Label:new({
            name = "Fire"
        }, resist3HBox)
        resistFire:setColor(0, 0, 0, 0)
        resistFire:setFontSize(9)
        resistFire:echo(gmcp.Char.player.resistFire, "#e74856", "l")
        if PRSstats.events.resistFireChange_id then
            killAnonymousEventHandler(PRSstats.events.resistFireChange_id)
        end
        PRSstats.events.resistFireChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistFire", function()
            if gmcp.Char.player.resistFire then
                resistFire:echo(gmcp.Char.player.resistFire, "#e74856", "l")
            end
        end)
        -- Poison & Ice
        local resist4HBox = Geyser.HBox:new({
            name = "resist4HBox",
            width = "93%"
        }, statsVBox)
        local resistPoisonTitle = Geyser.Label:new({
            name = "resistPoisonTitle"
        }, resist4HBox)
        resistPoisonTitle:setColor(0, 0, 0, 0)
        resistPoisonTitle:setFontSize(9)
        resistPoisonTitle:echo("Poison: ", "#aaaaaa", "r")
        local resistPoison = Geyser.Label:new({
            name = "resistPoison"
        }, resist4HBox)
        resistPoison:setColor(0, 0, 0, 0)
        resistPoison:setFontSize(9)
        resistPoison:echo(gmcp.Char.player.resistPoison, "#13a10e", "l")
        if PRSstats.events.resistPoisonChange_id then
            killAnonymousEventHandler(PRSstats.events.resistPoisonChange_id)
        end
        PRSstats.events.resistPoisonChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistPoison", function()
            if gmcp.Char.player.resistPoison then
                focus:echo(gmcp.Char.player.resistPoison, "#13a10e", "l")
            end
        end)
        local resistIceTitle = Geyser.Label:new({
            name = "resistIceTitle"
        }, resist4HBox)
        resistIceTitle:setColor(0, 0, 0, 0)
        resistIceTitle:setFontSize(9)
        resistIceTitle:echo("Ice: ", "#aaaaaa", "r")
        local resistIce = Geyser.Label:new({
            name = "Ice"
        }, resist4HBox)
        resistIce:setColor(0, 0, 0, 0)
        resistIce:setFontSize(9)
        resistIce:echo(gmcp.Char.player.resistIce, "#3b78ff", "l")
        if PRSstats.events.resistIceChange_id then
            killAnonymousEventHandler(PRSstats.events.resistIceChange_id)
        end
        PRSstats.events.resistIceChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistIce", function()
            if gmcp.Char.player.resistIce then
                resistIce:echo(gmcp.Char.player.resistIce, "#3b78ff", "l")
            end
        end)
        -- Pierce & Fire
        local resist3HBox = Geyser.HBox:new({
            name = "resist3HBox",
            width = "93%"
        }, statsVBox)
        local resistPiercingTitle = Geyser.Label:new({
            name = "resistPiercingTitle"
        }, resist3HBox)
        resistPiercingTitle:setColor(0, 0, 0, 0)
        resistPiercingTitle:setFontSize(9)
        resistPiercingTitle:echo("Pierce: ", "#aaaaaa", "r")
        local resistPiercing = Geyser.Label:new({
            name = "resistPiercing"
        }, resist3HBox)
        resistPiercing:setColor(0, 0, 0, 0)
        resistPiercing:setFontSize(9)
        resistPiercing:echo(gmcp.Char.player.resistPiercing, "#c50f1f", "l")
        if PRSstats.events.resistPiercingChange_id then
            killAnonymousEventHandler(PRSstats.events.resistPiercingChange_id)
        end
        PRSstats.events.resistPiercingChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistPiercing", function()
            if gmcp.Char.player.resistPiercing then
                focus:echo(gmcp.Char.player.resistPiercing, "#c50f1f", "l")
            end
        end)
        local resistFireTitle = Geyser.Label:new({
            name = "resistFireTitle"
        }, resist3HBox)
        resistFireTitle:setColor(0, 0, 0, 0)
        resistFireTitle:setFontSize(9)
        resistFireTitle:echo("Fire: ", "#aaaaaa", "r")
        local resistFire = Geyser.Label:new({
            name = "Fire"
        }, resist3HBox)
        resistFire:setColor(0, 0, 0, 0)
        resistFire:setFontSize(9)
        resistFire:echo(gmcp.Char.player.resistFire, "#e74856", "l")
        if PRSstats.events.resistFireChange_id then
            killAnonymousEventHandler(PRSstats.events.resistFireChange_id)
        end
        PRSstats.events.resistFireChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistFire", function()
            if gmcp.Char.player.resistFire then
                resistFire:echo(gmcp.Char.player.resistFire, "#e74856", "l")
            end
        end)
        -- Acid & Holy
        local resist5HBox = Geyser.HBox:new({
            name = "resist5HBox",
            width = "93%"
        }, statsVBox)
        local resistAcidTitle = Geyser.Label:new({
            name = "resistAcidTitle"
        }, resist5HBox)
        resistAcidTitle:setColor(0, 0, 0, 0)
        resistAcidTitle:setFontSize(9)
        resistAcidTitle:echo("Acid: ", "#aaaaaa", "r")
        local resistAcid = Geyser.Label:new({
            name = "resistAcid"
        }, resist5HBox)
        resistAcid:setColor(0, 0, 0, 0)
        resistAcid:setFontSize(9)
        resistAcid:echo(gmcp.Char.player.resistAcid, "#16c60c", "l")
        if PRSstats.events.resistAcidChange_id then
            killAnonymousEventHandler(PRSstats.events.resistAcidChange_id)
        end
        PRSstats.events.resistAcidChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistAcid", function()
            if gmcp.Char.player.resistAcid then
                focus:echo(gmcp.Char.player.resistAcid, "#16c60c", "l")
            end
        end)
        local resistHolyTitle = Geyser.Label:new({
            name = "resistHolyTitle"
        }, resist5HBox)
        resistHolyTitle:setColor(0, 0, 0, 0)
        resistHolyTitle:setFontSize(9)
        resistHolyTitle:echo("Holy: ", "#aaaaaa", "r")
        local resistHoly = Geyser.Label:new({
            name = "Holy"
        }, resist5HBox)
        resistHoly:setColor(0, 0, 0, 0)
        resistHoly:setFontSize(9)
        resistHoly:echo(gmcp.Char.player.resistHoly, "#f2f2f2", "l")
        if PRSstats.events.resistHolyChange_id then
            killAnonymousEventHandler(PRSstats.events.resistHolyChange_id)
        end
        PRSstats.events.resistHolyChange_id = registerAnonymousEventHandler("gmcp.Char.player.resistHoly", function()
            if gmcp.Char.player.resistHoly then
                resistHoly:echo(gmcp.Char.player.resistHoly, "#f2f2f2", "l")
            end
        end)
end

local function add_gauges()
    -- Hit Points Gauge
    HPbar = SUG:new({
        name = "HP",
        y = 80,
        height = 25,
        width = "95%", -- everything up to here is standard Geyser.Gauge
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "HP: |c / |m  (|p%)", -- gauge will show "HP: 500/1000 (50%)" as the text if you had 500 current and 1000 max hp
        currentVariable = "gmcp.Char.player.hp", -- if gmcp.Char.Vitals.hp is nil or unreachable, it will use the defaultCurrent of 50
        maxVariable = "gmcp.Char.player.maxHp" -- if gmcp.Char.Vitals.maxhp is nil or unreachable, it will use the defaultMax of 100
    }, GUI.tabwindow1.Vitalscenter)
    HPbar.front:setStyleSheet([[background-color: #63e2b7;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    HPbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    HPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Energy Points Gauge
    ENbar = SUG:new({
        name = "EN",
        y = 115,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "EN: |c / |m  (|p%)",
        currentVariable = "gmcp.Char.player.energy",
        maxVariable = "gmcp.Char.player.maxEnergy"
    }, GUI.tabwindow1.Vitalscenter)
    ENbar.front:setStyleSheet([[background-color: #cccccc;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    ENbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    ENbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Stamina Points Gauge
    STbar = SUG:new({
        name = "ST",
        y = 150,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "ST: |c / |m  (|p%)",
        currentVariable = "gmcp.Char.player.stamina",
        maxVariable = "gmcp.Char.player.maxStamina"
    }, GUI.tabwindow1.Vitalscenter)
    STbar.front:setStyleSheet([[background-color: #f2c97d;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;]])
    STbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;]])
    STbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Food Points Gauge
    FPbar = SUG:new({
        name = "FP",
        y = 185,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "Food: |c / |m  (|p%)",
        currentVariable = "gmcp.Char.player.food",
        maxVariable = "gmcp.Char.player.maxFood"
    }, GUI.tabwindow1.Vitalscenter)
    FPbar.front:setStyleSheet([[background-color: #63e2b7;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    FPbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    FPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Rage Points Gauge
    RPbar = SUG:new({
        name = "RP",
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "Rage: |c",
        currentVariable = "gmcp.Char.player.rage",
        maxVariable = "gmcp.Char.player.maxRage"
    }, GUI.tabwindow2.Combatcenter)
    RPbar.front:setStyleSheet([[background-color: #e74856;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    RPbar.back:setStyleSheet([[background-color: #303030;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    RPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Combo Points Gauge
    CPbar = SUG:new({
        name = "CP",
        y = 45,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "Combo: |c",
        currentVariable = "gmcp.Char.player.combo",
        maxVariable = "gmcp.Char.player.maxCombo"
    }, GUI.tabwindow2.Combatcenter)
    CPbar.front:setStyleSheet([[background-color: #e74856;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    CPbar.back:setStyleSheet([[background-color: #303030;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    CPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Experience Points Gauge
    XPbar = SUG:new({
        name = "XP",
        y = 45,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "gmcp.Char.player",
        textTemplate = "Hero"
    }, GUI.tabwindow1.Vitalscenter)
    XPbar.front:setStyleSheet([[background-color: #70c0e8;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;
        textTemplate = "Hero",
        currentVariable = "PRSstats.xp.current",
        maxVariable = "PRSstats.xp.current"
      ]])
    XPbar.back:setStyleSheet([[background-color: #70c0e8;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;
      ]])
    XPbar.text:setStyleSheet([[
        padding-left: 5px;
      ]])

    if gmcp.Char.player.xpForNextLevel then

        PRSstats.xp = PRSstats.xp or {}
        PRSstats.xp.current = gmcp.Char.player.xp - gmcp.Char.player.xpForCurrentLevel
        PRSstats.xp.tnl = gmcp.Char.player.xpForNextLevel - gmcp.Char.player.xpForCurrentLevel

        XPbar = SUG:new({
            name = "XP",
            y = 45,
            height = 25,
            width = "95%",
            updateTime = 0,
            updateEvent = "gmcp.Char.player",
            textTemplate = "XP: |c / |m   (|p%)",
            currentVariable = "PRSstats.xp.current",
            maxVariable = "PRSstats.xp.tnl"
        }, GUI.tabwindow1.Vitalscenter)
        XPbar.front:setStyleSheet([[background-color: #70c0e8;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;
      ]])
        XPbar.back:setStyleSheet([[background-color: #303030;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;
      ]])
        XPbar.text:setStyleSheet([[
        padding-left: 5px;
      ]])

        if PRSstats.events.xp_id then
            killAnonymousEventHandler(PRSstats.events.xp_id)
        end
        PRSstats.events.xp_id = registerAnonymousEventHandler("gmcp.Char.player.xp", function()
            PRSstats.xp.current = gmcp.Char.player.xp - gmcp.Char.player.xpForCurrentLevel
        end)

        if PRSstats.events.xpForCurrentLevel_id then
            killAnonymousEventHandler(PRSstats.events.xpForCurrentLevel_id)
        end
        PRSstats.events.xpForCurrentLevel_id = registerAnonymousEventHandler("gmcp.Char.player.xpForCurrentLevel",
            function()
                PRSstats.xp.current = gmcp.Char.player.xp - gmcp.Char.player.xpForCurrentLevel
                PRSstats.xp.tnl = gmcp.Char.player.xpForNextLevel - gmcp.Char.player.xpForCurrentLevel
            end)

        if PRSstats.events.xpForNextLevel_id then
            killAnonymousEventHandler(PRSstats.events.xpForNextLevel_id)
        end
        PRSstats.events.xpForNextLevel_id = registerAnonymousEventHandler("gmcp.Char.player.xpForNextLevel", function()
            if gmcp.Char.player.xpForNextLevel then
                PRSstats.xp.tnl = gmcp.Char.player.xpForNextLevel - gmcp.Char.player.xpForCurrentLevel
            end
        end)
    end
end

function PRSstats.stats()
    if gmcp and gmcp.Char and gmcp.Char.player then
        vitalsHeader()
        statsTab()
        add_gauges()
    else
        local initialize_ev_handler = registerAnonymousEventHandler("gmcp.Char.player", function()
            if gmcp and gmcp.Char and gmcp.Char.player and gmcp.Char.player.name then
                vitalsHeader()
                statsTab()
                add_gauges()
            end
        end, true)
    end
end
