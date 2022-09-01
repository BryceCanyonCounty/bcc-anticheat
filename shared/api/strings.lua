exports('strings',function()
    local self = {}

    self.xss = function (str) 
        local cname = str:gsub("%s+", "")

        if string.find(cname, "<" or ">") then
            return true
        else
            return false
        end
    end

    return self
end)