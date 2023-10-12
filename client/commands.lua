-- Credit: Badger
if Config.Commands.active then
    Citizen.CreateThread(function()
        Citizen.Wait(1000);
        while true do
            Citizen.Wait(500);
            local blacklistedCommands = Config.Commands.list
            local registeredCommands = GetRegisteredCommands()
            local cheatCommandFound = false
            for _, command in ipairs(registeredCommands) do
                for _, blacklistedCommand in pairs(blacklistedCommands) do
                    local commandName = string.lower(command.name)
                    if (commandName == string.lower(blacklistedCommand) or
                            commandName == string.lower('+' .. blacklistedCommand) or
                            commandName == string.lower('_' .. blacklistedCommand) or
                            commandName == string.lower('-' .. blacklistedCommand) or
                            commandName == string.lower('/' .. blacklistedCommand)) then
                        cheatCommandFound = true

                        TriggerServerEvent("ac:kick", Config.Commands.lang.kickreason .. ': ' .. blacklistedCommand)
                        break
                    end
                end

                if cheatCommandFound == true then
                    break
                end
            end
        end
    end)
end
