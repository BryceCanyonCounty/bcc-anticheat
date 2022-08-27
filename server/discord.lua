Discord = {}

Discord.sendMessage = function (_source, description)
    local logs = {}
    
    local name = GetPlayerName(_source)
    local wname = Config.Discord.webhookname
    local avatar = Config.Discord.webhookavatar
    local color = 11342935

    local payload = {
        username = wname,
        avatar_url = avatar,
        type = 'rich',
        embeds = {{
            color = color,
            title = name,
            description = description
        }}
    }

    if Config.Discord.active then
        PerformHttpRequest(Config.Discord.webhook, function(err, text, headers)end, 'POST', json.encode(payload), {
            ['Content-Type'] = 'application/json'
        })
    else
        print(name, description)
    end
end
