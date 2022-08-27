local infractions = Config.SpamClick.infractions
local maxspaminfractions = Config.SpamClick.maxspaminfractions
local spamsensitivity = Config.SpamClick.spamsensitivity
local kicked = false

local keylist = {
    0x9D2AEA88,
    0x1C559F2E,
    0xE474F150,
    0x27568539
}

local lastclick = nil

function startMouseSpamCheck() 
    Citizen.CreateThread(function()
        while true do
            Wait(1)

            if infractions > maxspaminfractions and kicked == false then
                TriggerServerEvent("ac:kick", Config.SpamClick.lang.kickreason)
                kicked = true
            end

            for i, v in ipairs(keylist) do
                if IsControlJustPressed(1, v) then
                    local currenttime = GetNetworkTime()

                    if lastclick then
                        local diff = GetTimeDifference(currenttime, lastclick)
                        if (diff * -1) < spamsensitivity then
                            infractions = infractions + 1
                            VORPcore.NotifyCenter(Config.SpamClick.lang.warning, 4000)
                        end 
                    end
                    lastclick = currenttime
                end
            end
        end
    end)
end