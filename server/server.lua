-- create a list of players and send it to the client
function CreateAndSendList(playerId)
    -- If the playerId is nil, set it to -1
    if playerId == nil then
        playerId = -1
    end
    
    -- Create a list of players
    local playerList = {};
    for _, playerId in ipairs(GetPlayers()) do
        local name = GetPlayerName(playerId)
        playerList[#playerList + 1] = {
            id = playerId,
            name = name
        }
    end

    -- Get the scoreboard header from the resource metadata
    local scoreboardHeader = GetResourceMetadata(GetCurrentResourceName(), "scoreboard_header", 0)

    -- If the scoreboard header is not set, use a default value
    if scoreboardHeader == nil then
        scoreboardHeader = "Scoreboard"
    end

    -- Send the player list to the client
    local data = {
        header = scoreboardHeader,
        players = playerList
    }

    TriggerClientEvent("sc:playerList", playerId, data)
end

-- Client request for player list
RegisterNetEvent("sc:request:playerList")
AddEventHandler("sc:request:playerList", function()
    CreateAndSendList(source)
end)