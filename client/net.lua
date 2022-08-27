function startOnlineChecks()
    local checkinrate = Config.Net.checkinrate
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(checkinrate)
            TriggerServerEvent("ac:checkin")
        end
    end)
end