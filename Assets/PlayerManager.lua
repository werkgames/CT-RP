local playerRoleManager = require("PlayerRoleManager")
local playerListModule = require("PlayerListModule")

local eventHandler = require("EventHandler")

-- local updatePlayerListEvent = eventHandler.createEvent("UpdatePlayerListEvent")

local playerList = {}

local function onPlayerConnected(player)

    local playerObject = {}

    playerObject.player = player
    playerObject.role = playerRoleManager:getStarterRole()

    playerList[player.id] = playerObject

    playerListModule:updatePlayerList(playerList)

    print(playerObject.role)

end

local function onPlayerDisconnected(player)
    -- clear player from player list once disconnected
    playerList[player.id] = nil

    playerListModule:updatePlayerList(playerList)

    -- eventHandler.fireEvent("UpdatePlayerListEvent", playerList)
end

function self:ServerAwake()
    server.PlayerConnected:Connect(onPlayerConnected)
    server.PlayerDisconnected:Connect(onPlayerDisconnected)
end