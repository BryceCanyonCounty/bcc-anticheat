if Config.XSS.active then
    AddEventHandler("playerConnecting", function (name, kickreason, deferrals)
        deferrals.defer()

        local _source = source
        local cname = string.gsub(name, "%s+", "")
        deferrals.update(Config.XSS.lang.update)

        if string.find(cname, "<" or ">") then
            deferrals.done(Config.XSS.lang.kick)
            CancelEvent()
            Discord.sendMessage(_source, Config.Discord.lang.kick .. Config.XSS.lang.reason)
        else
            deferrals.done()
        end
    end)
end