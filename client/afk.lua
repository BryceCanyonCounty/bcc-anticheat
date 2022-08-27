
function getTimeString(time)
    if time < 60 then
        return time .. Config.AFK.lang.seconds
    end 
    if time >= 60 and time < 3600 then
        return time/60 .. Config.AFK.lang.minutes
    end

    if time < 3600 then
        return time/3600 .. Config.AFK.lang.hours
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

    Citizen.CreateThread(function()
		while true do
			Wait(1000)
            
            local ped = PlayerPedId()
            if ped then
                if not isdead then
                    local isdead = IsEntityDead(ped)
                    
                    player.current = GetEntityCoords(ped, true)    
                    if player.current == player.last then
                        if player.timer >= kicktime then
                            TriggerServerEvent("ac:kick", Config.AFK.lang.kickreason)
                            return
                        end
                        
                        if player.timer >= warntime then
                            local timeleft = kicktime - player.timer
                            local printtime = getTimeString(timeleft)
                            VORPcore.NotifyCenter(Config.AFK.lang.kick .. printtime .. Config.AFK.lang.kick2 , 1000)
                        end
                        player.timer = player.timer + 1 
                    else
                        player.timer = 0
                    end
        
                    player.last = player.current
                end
            end
        end
    end)
end