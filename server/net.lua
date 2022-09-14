
if Config.Net.active then
    local players = {}

    AddEventHandler('playerDropped', function(reason)
        local _source = source
        players[tostring(_source)] = nil
    end)

    Citizen.CreateThread(function()
        while true do
            for k, v in ipairs(GetPlayers()) do
                if GetPlayerPed(v) ~= 0 then
                    if players[v] then
                        if players[v].callback == false then
                            Discord.sendMessage(v, Config.Discord.lang.kick .. Config.Net.lang.kickreason)
                            DropPlayer(v, Config.Discord.lang.kick .. Config.Net.lang.kickreason)
                        else
                            players[v].callback = false
                            TriggerClientEvent('heartbeat:Client', v)
                        end
                    else
                        players[v] = {name = GetPlayerName(v), id = v, callback = nil}
                    end
                end
            end
            Citizen.Wait(Config.Net.checkinrate)
        end
    end)

    RegisterServerEvent('heartbeat:Server')
    AddEventHandler('heartbeat:Server', function()
        local _source = source
        local v = tostring(_source)
        if players[v] then
            players[v].callback = true
        else
            print('No user on hearbeat')
        end
    end)
end