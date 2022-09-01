VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

RegisterServerEvent("ac:kick")
AddEventHandler("ac:kick", function(reason)
    local _source = source
    Discord.sendMessage(_source, Config.Discord.lang.kick .. reason)
    DropPlayer(_source, Config.Discord.lang.kick .. reason)
end)