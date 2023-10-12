
if Config.AFK.active then
    local GetSteamID = function(src)
        local sid = GetPlayerIdentifiers(src)[1] or false
    
        if (sid == false or sid:sub(1,5) ~= "steam") then
            return false
        end
    
        return sid
    end

    local createTable = function()
        local result = exports.ghmattimysql:executeSync([[
            CREATE TABLE IF NOT EXISTS `bccacwl` (
                `id` INT(20) NOT NULL AUTO_INCREMENT,
                `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
                `charidentifier` INT(30) NOT NULL DEFAULT '0',
                `afk` TINYINT(2) NOT NULL DEFAULT '0',
                PRIMARY KEY (`id`),
                INDEX `identifier` (`identifier`)
            ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

        ]])
        if result and result.warningStatus > 1 then
            print("ERROR: Failed to create AFK WL Table")
        end
    end

    Citizen.CreateThread(function()
		createTable()
    end)

    RegisterCommand("ac-addAFKWL", function(source, args, rawCommand)
        local _source = source
        local _target = args[1]

        if _target == nil or _target == '' then
            TriggerClientEvent("vorp:TipBottom", _source, Config.AFK.lang.whitelist.id, 5000)
            return
        end

        local Character = VorpCore.getUser(_source).getUsedCharacter
        local group = Character.group

        if group == 'admin' then

            local steamid = GetSteamID(_target)
            local User = VorpCore.getUser(_target)
            local charId = User.getUsedCharacter.charIdentifier


            exports.ghmattimysql:execute("INSERT INTO bccacwl (identifier, charidentifier, afk) VALUES (@identifier, @charidentifier, @afk)", {["@identifier"] = steamid, ["@charidentifier"] = charId, ["@afk"] = true}, function(result)
                if result ~= nil then
                    TriggerClientEvent("vorp:TipBottom", _source, Config.AFK.lang.whitelist.wladded, 5000)
                    TriggerClientEvent("bccac-updateafk", _source, false)
                else
                    TriggerClientEvent("vorp:TipBottom", _source, Config.AFK.lang.whitelist.err, 5000)
                end
            end)
        end
    end)

    RegisterCommand("ac-removeAFKWL", function(source, args, rawCommand)
        local _source = source
        local _target = args[1]

        if _target == nil or _target == '' then
            TriggerClientEvent("vorp:TipBottom", _source, Config.AFK.lang.whitelist.id, 5000)
            return
        end

        local Character = VorpCore.getUser(_source).getUsedCharacter
        local group = Character.group

        if group == 'admin' then
            local steamid = GetSteamID(_target)
            local User = VorpCore.getUser(_target)
            local charId = User.getUsedCharacter.charIdentifier

            exports.ghmattimysql:execute("UPDATE bccacwl SET afk = false  WHERE identifier = @identifier AND charidentifier = @charidentifier ", {["@identifier"] = steamid, ["@charidentifier"] = charId}, function(result)
                if result ~= nil then
                    TriggerClientEvent("vorp:TipBottom", _source, Config.AFK.lang.whitelist.wlremoved, 5000)
                    TriggerClientEvent("bccac-updateafk", _source, true)
                else
                    TriggerClientEvent("vorp:TipBottom", _source, Config.AFK.lang.whitelist.err, 5000)
                end
            end)
        end
    end)

    RegisterServerEvent('bccac-rolecheck')
    AddEventHandler('bccac-rolecheck', function()
        local _source = source
        local steamid = GetSteamID(_source)
        local User = VorpCore.getUser(_source)
        local charId = User.getUsedCharacter.charIdentifier

        exports.ghmattimysql:execute("SELECT * FROM bccacwl WHERE identifier = @identifier AND charidentifier = @charidentifier", {["@identifier"] = steamid, ["@charidentifier"] = charId}, function(result)
            local pass = false
            if result[1] ~= nil and result[1].afk ~= nil then
                pass = result[1].afk
            end

            TriggerClientEvent("bccac-rolecheck-r", _source, pass)
        end)
    end)
end