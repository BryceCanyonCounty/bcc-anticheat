Config = {}

Config.Net = {
    active = true,
    graceperiod = 10000, -- Milisecond - This must be greater than the checkinrate
    checkinrate = 5000, -- Milisecond
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
        hours = ' hours',
        minutes = ' minutes',
        seconds = ' seconds',
        kickreason = 'You were afk.'
    }
}

Config.SpamClick = {
    active = true,
    infractions = 0,
    maxspaminfractions = 5,
    spamsensitivity = 250, -- Higher is less sensitive
    lang = {
        kickreason = 'You were caught spam clicking',
        warning = "You are spam clicking! This will lead to being kicked."
    }
}