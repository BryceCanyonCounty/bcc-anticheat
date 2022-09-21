if Config.ResourceInject.active then
    RegisterNetEvent(GetCurrentResourceName().. ".verify")
    AddEventHandler(GetCurrentResourceName().. ".verify", function()
        TriggerServerEvent("ac:kick", Config.ResourceInject.lang.engine)
    end)

    CreateThread(function()
        while true do
            Wait(500) -- Give the check a bit of breathing room
            
            local resources = {}
            for i = 0, GetNumResources() - 1 do
                resources[i+1] = GetResourceByFindIndex(i)
            end

            Wait(100) -- bit more room
            TriggerServerEvent("ac:checkresources", resources)
        end
    end)
end 
