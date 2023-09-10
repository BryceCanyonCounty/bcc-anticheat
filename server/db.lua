local dbchars = {}

local function checkRole(current, old, role)
    if old.group ~= role and current.group == role then
        local embeds = {
            {
                color = 11342935,
                title = Config.DB.lang.discord.title,
                description = Config.DB.lang.discord.description,
                fields = {
                    {
                        name = Config.DB.lang.discord.playername,
                        value = current.firstname..' '..current.lastname,
                    },
                    {
                        name = Config.DB.lang.discord.steam,
                        value = current.identifier
                    },
                    {
                        name = Config.DB.lang.discord.character,
                        value = current.charidentifier
                    }
                }
            }
        }
        Discord.sendNewMessage(current.firstname..' '..current.lastname, Config.DB.lang.discord.title, embeds)
        return false
    end
    return true
end

if Config.DB.active then
    Citizen.CreateThread(function()
        while true do
            if #Config.DB.rolechecks > 0 then
                exports.ghmattimysql:execute('SELECT `identifier`,  `steamname`,  `charidentifier`, `group`, `firstname`, `lastname` FROM characters', {}, function(characters)
                    if #characters > 0 then
                        local temp = {}
                        for k, current in ipairs(characters) do
                            temp[current.charidentifier] = current
        
                            if dbchars[current.charidentifier] == nil then
                                dbchars[current.charidentifier] = current
                                return
                            end
        
                            local old = dbchars[current.charidentifier]
        
                            for index, role in ipairs(Config.DB.rolechecks) do
                                local pass = checkRole(current, old, role)
                                if pass == false then
                                    break
                                end
                            end
                        end
        
                        dbchars = temp
                    end
                end)
            end
            
            Citizen.Wait(Config.DB.adminpingrate)
        end
    end) 
end