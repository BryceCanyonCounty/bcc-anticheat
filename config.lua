Config = {}

Config.Discord = {
    active = false,
    webhookavatar = "https://cdn2.iconfinder.com/data/icons/frosted-glass/256/Danger.png",
    webhookname = "Anti Cheat",
    webhook = "",
    lang = {
        kick = "Kicked for: "
    }
}

Config.DB = {
    active = true,
    adminpingrate = 50000,
    rolechecks = {
        "admin", "mod"
    },
    lang = {
        discord = {
            title = "DB Group Change",
            description = "Players group has been changed to admin!",
            playername = "Player name",
            steam = "Steam identifier",
            character = "Character identifier"
        }
    }
}

Config.XSS = {
    active = true,
    lang = {
        reason = "XSS Injection Attempt Detected",
        update = "Validating Steam Username",
        kick = "You cant join due to your username"
    }
}

Config.Speed = {
    active = true,
    lang = {
        reason = "Speed Hacking"
    }
}

Config.ResourceInject = {
    active = true,
    lang = {
        reason = "Only approved resources allowed",
        engine = "Cheat Engine Menu Detected"
    }
}

Config.Net = {
    active = true,
    allowedoffenses = 2,
    checkinrate = 1500, -- Milisecond
    kickrate = 10000,
    lang = {
        kickreason = "You must be connected to the internet."
    }
}

Config.AFK = {
    active = true,
    kicktime = 1800, -- Seconds
    warntime = 1500, -- Seconds
    lang = {
        kick = "You will be kicked in ",
        kick2 = " for AFK",
        hours = " hours",
        minutes = " minutes",
        seconds = " seconds",
        kickreason = "AFK",
        whitelist = {
            id = "You must include a user id",
            wladded = "User Added to Whitelist",
            wlremoved = "User Removed from Whitelist",
            err = "An Error has Occurred"
        }
    }
}

Config.SpamClick = {
    active = true,
    infractions = 0,
    maxspaminfractions = 5,
    spamsensitivity = 250, -- Higher is less sensitive
    lang = {
        kickreason = "Spam Clicking",
        warning = "You are spam clicking! This will lead to being kicked."
    }
}