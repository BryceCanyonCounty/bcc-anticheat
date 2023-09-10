if Config.Weapons.active then
    -- Anti Blacklist Weapons
    CreateThread(function()
        while true do
            Wait(1)
            for k, v in pairs(Config.Weapons.blacklist) do
                local ped = PlayerPedId()
                Citizen.InvokeNative(0x4899CB088EDF59B8, ped, k, true, 0xF77DE93D)
            end
        end
    end)
end

if Config.InfiniteAmmo.active then
    --- Anti Infinite Ammo
    CreateThread(function()
        while true do
            Wait(1)
            Citizen.InvokeNative(0xFBAA1E06B6BCA741, PlayerPedId(), false)
        end
    end)
end
