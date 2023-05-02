Discord = {}

Discord.sendNewMessage = function (name, description, embeds, webhookurl, webhookname, webhookavatar, api)
    local wname =  Config.Discord.webhookname
    local avatar = Config.Discord.webhookavatar
    local webhook = Config.Discord.webhook

    if webhookurl ~= nil then
        webhook = webhookurl
    end

    if webhookavatar ~= nil then
        avatar = webhookavatar
    end

    if webhookname ~= nil then
        wname = webhookname
    end

    if embeds == nil then
        embeds = {{
            color = 11342935,
            title = name,
            description = description
        }}
    end

    local payload = {
        username = wname,
        avatar_url = avatar,
        type = 'rich',
        embeds = embeds
    }

    if Config.Discord.active or api == true then
        PerformHttpRequest(webhook, function(err, text, headers)end, 'POST', json.encode(payload), {
            ['Content-Type'] = 'application/json'
        })
    else
        print(name, description)
    end
end

Discord.sendMessage = function (_source, description)
    local name
    if _source then
        name = GetPlayerName(_source)
    else
        name = "Player"
    end
    Discord.sendNewMessage(name, description)
end

exports('discord',function()
    local self = {}

    self.sendMessage = function(webhookurl, webhookname, webhookavatar, name, description, embeds)
        Discord.sendNewMessage(name, description, embeds, webhookurl, webhookname, webhookavatar, true)
    end

    return self
end)