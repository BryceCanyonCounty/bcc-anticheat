if Config.KickOnResourceStop.active then
    AddEventHandler("onClientResourceStop", function(resourceName)
        TriggerServerEvent("ac:kick", Config.KickOnResourceStop.lang.kickreason)
    end)
    
    AddEventHandler('onResourceStop', function(resourceName)
        if (GetCurrentResourceName() ~= resourceName) then
            return
        end

        TriggerServerEvent("ac:kick", Config.KickOnResourceStop.lang.kickreason)
    end)
end