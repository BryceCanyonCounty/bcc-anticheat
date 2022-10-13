-- local players = {}

-- AddEventHandler('playerDropped', function(reason)
--     local _source = source
--     players[tostring(_source)] = nil
-- end)

-- RegisterServerEvent('addonlineplayer')
-- AddEventHandler('addonlineplayer', function()
--     local _source = source
    
-- 	if not players[tostring(_source)] then
--         local User = VorpCore.getUser(_source)
--         local Character = User.getUsedCharacter
-- 		players[tostring(_source)] = {
--             character = User.getUsedCharacter,
--             id = Character.charIdentifier,
--             firstname = Character.firstname,
--             lastname = Character.lastname
--         }
-- 	end

--     TriggerClientEvent('receiveplayers', -1, players)
-- end)
