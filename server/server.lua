VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

RegisterServerEvent("ac:kick")
AddEventHandler("ac:kick", function(reason)
    local _source = source
    Discord.sendMessage(_source, Config.Discord.lang.kick .. reason)
    DropPlayer(_source, Config.Discord.lang.kick .. reason)
end)

if Config.FX.active  then 


local fxWhitelist = {
    "FX_EVENT_NAME_1",
    "FX_EVENT_NAME_2",
    -- Add other fx event names here
}

local fxCounts = {}  -- Table to keep track of each player's fx event count

-- Utility function to check if a value is in a table
local function isInTable(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

-- Utility function to convert a table to a string
local function tableToString(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            v = tableToString(v)
        else
            v = tostring(v)
        end
        result = result .. string.format("[%s] = %s, ", tostring(k), v)
    end
    if result ~= "{" then
        result = result:sub(1, -3) 
    end
    return result .. "}"
end

AddEventHandler('ptFxEvent', function(sender, eventName, eventData)
    local eventDataString = (type(eventData) == "table") and tableToString(eventData) or tostring(eventData)


    if not isInTable(Config.fx.fxWhitelist, eventName) then
        fxCounts[sender] = (fxCounts[sender] or 0) + 1

        if fxCounts[sender] > Config.fx.limit then
            local message = string.format('[BCC Anticheat]: Player %s caused event %s too many times with data %s', sender, eventName, eventDataString)
            CancelEvent()
            DropPlayer(sender, message)
        end
    end
end)
end
