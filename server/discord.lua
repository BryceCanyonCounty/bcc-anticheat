Discord = {}

Discord.sendNewMessage = function (name, description, embeds)
    local wname = Config.Discord.webhookname
    local avatar = Config.Discord.webhookavatar
    local color = 11342935

    if embeds == nil then
        embeds = {{
            color = color,
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

    if Config.Discord.active then
        PerformHttpRequest(Config.Discord.webhook, function(err, text, headers)end, 'POST', json.encode(payload), {
            ['Content-Type'] = 'application/json'
        })
    else
        print(name, description)
    end
end

Discord.sendMessage = function (_source, description)
    local name = GetPlayerName(_source)
    Discord.sendNewMessage(name, description)
end
