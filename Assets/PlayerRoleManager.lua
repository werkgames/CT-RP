local playerListModule = require("PlayerListModule")
local playerRoleList = {
    starterRole = "No Role",
    role1 = "TestRole1",
    role2 = "TestRole2",
    role3 = "TestRole3"
}

function getStarterRole()
    return playerRoleList["starterRole"]
end

-- function listAllPlayerRoles()
--     local playerList = playerManager:getPlayerList()

--     for playerId, playerRole in playerList do
--         print(tostring(playerId) .. ": " .. playerRole)
--     end
-- end

-- function self:ServerAwake()
--     listAllPlayerRoles()
-- end