function getTimeString(time)
    if time < 60 then
        return time .. Config.AFK.lang.seconds
    end






    if time >= 60 and time < 3600 then
        return math.floor(time / 60) .. Config.AFK.lang.minutes .. ' ' .. (time % 60) .. Config.AFK.lang.seconds
    end

    if time < 3600 then
        local rdown =  math.floor(time)
        return math.floor(rdown / 3600) .. Config.AFK.lang.hours .. ' ' .. math.floor(time / 60) .. Config.AFK.lang.minutes .. ' ' .. (time % 60) .. Config.AFK.lang.seconds
    end
end

function startAFKChecks()
    local kicktime = Config.AFK.kicktime
    local warntime = Config.AFK.warntime
    local player = {
        last = nil,
        current = nil,
        timer = 0
    }

    local function runCheck()
        while true do
            Wait(1000)

            local ped = PlayerPedId()
            if ped then
                local isdead = IsEntityDead(ped)
                if not isdead then
    
                    player.current = GetEntityCoords(ped, true)
                    if player.current == player.last or IsPedRagdoll(ped) then
                        if player.timer >= kicktime then
                            TriggerServerEvent("ac:kick", Config.AFK.lang.kickreason)
                            return
                        end
                        if player.timer >= warntime then
                            local timeleft = kicktime - player.timer
                            local printtime = getTimeString(timeleft)
                            VORPcore.NotifyCenter(Config.AFK.lang.kick .. printtime .. Config.AFK.lang.kick2, 1000)
                        end
                        player.timer = player.timer + 1
                    else
                        player.timer = 0
                    end
    
                    player.last = player.current
                end
            end
        end
    end

    RegisterNetEvent('bccac-updateafk')
    AddEventHandler('bccac-updateafk', function(state)
        runCheck()
    end)

    Citizen.CreateThread(function()
        TriggerServerEvent('bccac-rolecheck')
    end)

    RegisterNetEvent('bccac-rolecheck-r')
    AddEventHandler('bccac-rolecheck-r', function(response)
        if not response then
            runCheck()
        end
    end)
end
