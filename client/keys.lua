-- Credit: Badger
if Config.Keys.active then
    Citizen.CreateThread(function()
        while true do
            Wait(0);
            local blacklistedKeys = Config.Keys.list;

            for i = 1, #blacklistedKeys do
                local keyCombo = blacklistedKeys[i][1];
                local keyStr = blacklistedKeys[i][2];

                if #keyCombo == 1 then
                    local key1 = keyCombo[1];
                    if IsDisabledControlJustReleased(0, key1) then
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr)
                    end
                elseif #keyCombo == 2 then
                    local key1 = keyCombo[1];
                    local key2 = keyCombo[2];
                    if IsDisabledControlPressed(0, key1) and IsDisabledControlPressed(0, key2) then
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr)
                        Wait(20000); -- Wait 20 seconds
                    end
                elseif #keyCombo == 3 then
                    local key1 = keyCombo[1];
                    local key2 = keyCombo[2];
                    local key3 = keyCombo[3];
                    if IsDisabledControlPressed(0, key1) and IsDisabledControlPressed(0, key2) and IsDisabledControlPressed(0, key3) then
                            TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr)
                    end
                    Wait(20000); -- Wait 20 seconds
                elseif #keyCombo == 4 then
                    local key1 = keyCombo[1];
                    local key2 = keyCombo[2];
                    local key3 = keyCombo[3];
                    local key4 = keyCombo[4];
                    if IsDisabledControlPressed(0, key1) and IsDisabledControlPressed(0, key2) and IsDisabledControlPressed(0, key3) and IsDisabledControlPressed(0, key4) then
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr)
                    end
                    Wait(20000); -- Wait 20 seconds
                end
            end
        end
    end)
end
