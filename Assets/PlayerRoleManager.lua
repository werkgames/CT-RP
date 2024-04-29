local playerListModule = require("PlayerListModule")
local eventHandler = require("EventHandler")

local playerList = {}

local playerRoleList = {
    starterRole = "No Role",
    role1 = "TestRole1",
    role2 = "TestRole2",
    role3 = "TestRole3"
}

function getStarterRole()
    return playerRoleList["starterRole"]
end

function listAllPlayerRoles()
    local playerList = playerListModule:getPlayerList()

    for playerId, playerRole in playerList do
        print(tostring(playerId) .. ": " .. playerRole)
    end
end

function self:ServerAwake()
    listAllPlayerRoles()
end

local function onPlayerListUpdated(updatedPlayerList)
    playerList = updatedPlayerList
    print("onPlayerListUpdated event works")
end

-- eventHandler.connectEvent("UpdatePlayerListEvent", onPlayerListUpdated)