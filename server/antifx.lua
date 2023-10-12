if Config.FX.active then
    local fxCounts = {} -- Table to keep track of each player's fx event count

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
                CancelEvent()
                DropPlayer(sender, Config.fx.lang.kickreason)
            end
        end
    end)
end