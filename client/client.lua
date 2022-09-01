VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    if Config.AFK.active then
        startAFKChecks()
    end

    if Config.SpamClick.active then
        startMouseSpamCheck()
    end
end)