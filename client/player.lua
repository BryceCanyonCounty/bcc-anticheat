if Config.PlayerStatus.active then
    -- Anti Health 
CreateThread(function()
    while true do
        Wait(1)
        local ped = PlayerPedId()
        local health  = GetEntityHealth(ped)
        if health > Config.PlayerStatus.health then
            TriggerServerEvent("ac:kick", Config.PlayerStatus.lang.kickreason)
        end
    end
end)
end


