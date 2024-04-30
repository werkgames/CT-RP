local playerRoleManager = require("PlayerRoleManager")

local eventHandler = require("EventHandler")

local updatePlayerListEvent = eventHandler.createEvent("UpdatePlayerListEvent")
local updatePlayerInListEvent = eventHandler.createEvent("UpdatePlayerInListEvent")

local playerList = {}

local function onPlayerConnected(player)

    local playerObject = {}

    playerObject.player = player
    playerObject.role = playerRoleManager:getStarterRole()

    playerList[player.id] = playerObject

    eventHandler.fireEvent("UpdatePlayerListEvent", playerList)

    print(playerObject.role)

end

local function onPlayerDisconnected(player)
    -- clear player from player list once disconnected
    playerList[player.id] = nil
    eventHandler.fireEvent("UpdatePlayerListEvent", playerList)
end

local function onUpdatePlayerInListEvent(targetPlayerObject)
    playerList[targetPlayerObject.player.id] = targetPlayerObject
    eventHandler.fireEvent("UpdatePlayerListEvent")
end
updatePlayerInListEvent.connectEvent("UpdatePlayerInListEvent", onUpdatePlayerInListEvent)

server.PlayerConnected:Connect(onPlayerConnected)
server.PlayerDisconnected:Connect(onPlayerDisconnected)