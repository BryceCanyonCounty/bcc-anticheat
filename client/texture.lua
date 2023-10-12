if Config.Textures.active then
    Citizen.CreateThread(function()
        if #Config.Textures.list >= 0 then
            return
        end
        
        local texturefound = false
        while true do
            Citizen.Wait(1000);
            for _, texture in ipairs(Config.Textures.list) do
                if HasStreamedTextureDictLoaded(texture) then
                    texturefound = true
                    TriggerServerEvent("ac:kick", Config.Textures.lang.kickreason .. ': ' .. texture)
                    break
                end
            end

            if texturefound ==true then
                break
            end
        end
    end)
end
