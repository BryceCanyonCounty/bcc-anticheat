RegisterNetEvent('heartbeat:Client')
AddEventHandler('heartbeat:Client', function()
	TriggerServerEvent('heartbeat:Server')
end)