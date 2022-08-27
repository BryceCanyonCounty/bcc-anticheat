VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

local players = {}
graceperiod = Config.Net.graceperiod

AddEventHandler('playerDropped', function(reason)
    local _source = source
    players[_source] = nil
end)

RegisterServerEvent("ac:kick")
AddEventHandler("ac:kick", function(reason)
    local _source = source
    print('Dropping player')
    DropPlayer(_source, reason)
end)

RegisterServerEvent("ac:checkin")
AddEventHandler("ac:checkin", function()
    local _source = source 
    local currenttime = os.time(os.date("!*t"))
    if _source and players[_source] == nil then
        players[_source] = {
            checkedin = currenttime
        }
    end
    
    local lastcheckin = players[_source].checkedin
    
    -- Compare time since last checkin
    local diff = os.difftime(currenttime, lastcheckin)
        
    if diff > graceperiod then
        DropPlayer(_source, Config.Net.lang.kickreason)
    else
        players[_source] = {
            checkedin = currenttime
        }
    end
end)
