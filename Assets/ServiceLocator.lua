local services = {}
local serviceModules = {
    PlayerRoleManager = "PlayerRoleManager",
    PlayerManager = "PlayerManager"
}

function getService(name)
    if not services[name] and serviceModules[name] then
        services[name] = require(serviceModules[name])
    end
    return services[name]
end