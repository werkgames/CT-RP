local playerRoleUpdatedSCEvent = Event.new("PlayerRoleUpdatedSCEvent")

local updatePlayerRoleCSEvent = Event.new("UpdatePlayerRoleCSEvent")

function self:ServerAwake()
    local eventHandler = require("EventHandler")

    local playerList = {}

    local roleList = {
        role0 = "No Role",
        role1 = "Nurse",
        role2 = "Doctor",
        role3 = "Police Officer",
        role4 = "Criminal",
        role5 = "Park Ranger",
        role6 = "Cleaner",
        role7 = "Cashier"
    }

    function getStarterRole()
        return roleList["role0"]
    end

    -- function listAllPlayerRoles()
    --     for playerId, playerObject in playerList do
    --         print(tostring(playerId) .. ": " .. playerObject.role)
    --     end
    -- end

    local function onPlayerListUpdated(updatedPlayerList)
        playerList = updatedPlayerList
        -- print("onPlayerListUpdated event works")
        -- listAllPlayerRoles()
    end
    eventHandler.connectEvent("UpdatePlayerListEvent", onPlayerListUpdated)

    function onUpdatePlayerRoleCS(player, newRole)
        if roleList[newRole] == nil then
            return
        end
        -- get player object from player list update his role in player object then store him back into the list
        local targetPlayerObject = playerList[player.playerId]
        
        targetPlayerObject.role = newRole
        -- send new player info to playerManager so playerlist is updated with correct information
        eventHandler.fireEvent("UpdatePlayerInListEvent", targetPlayerObject)

        -- send new updated player info to all clients        
        playerRoleUpdatedSCEvent:FireAllClients(targetPlayerObject) -- have to actually set up this event
    end
    updatePlayerRoleCSEvent:Connect(onUpdatePlayerRoleCS)
end

-- client code
function self:ClientAwake()
    local playerList = {}

    local roleList = {
        role0 = "No Role",
        role1 = "Nurse",
        role2 = "Doctor",
        role3 = "Police Officer",
        role4 = "Criminal",
        role5 = "Park Ranger",
        role6 = "Cleaner",
        role7 = "Cashier"
    }

    function onPlayerRoleUpdatedSC(targetPlayerObject)
        --update target player on client player list
        -- fire client event to notify player role ui of change
    end
    playerRoleUpdatedSCEvent:Connect(onPlayerRoleUpdatedSC)

    function changeLocalPlayerRole(newRole)
        updatePlayerRoleCSEvent:FireServer(newRole)
    end
    
end