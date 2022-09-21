if Config.Speed.active then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(30000)
			TriggerServerEvent("ac:spdr")
		end
	end)
end