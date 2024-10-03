local reactive_vars = {}

setmetatable(_G, {
    __index = function(self, key)
        if info := reactive_vars[key] then
            return info.value
        end
        return rawget(self, key)
    end,
    __newindex = function(self, key, value)
        if info := reactive_vars[key] then
            info.value = value
            info.fn(value)
        else
            rawset(self, key, value)
        end
    end
})

function makereactive(name, fn)
    local value = rawget(_G, name)
    initreactive(name, value, fn)
end

function initreactive(name, value, fn)  
    rawset(_G, name, nil)
    reactive_vars[name] = { value = value, fn = fn }
end
