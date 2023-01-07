-- Close the scoreboard when the user presses the Escape key or clicks the close button
RegisterNUICallback('hideUI', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)

-- Receive the player list from the server
local playerListEventName = "sc:playerList"
RegisterNetEvent(playerListEventName)
AddEventHandler(playerListEventName, function(dataFromServer)
    SendNUIMessage({
        action = 'setScoreboard',
        data = dataFromServer
    })
end)

-- Show the scoreboard when the user presses the Up Arrow key and request the player list from the server
CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 27) then
            SendNUIMessage({
                action = 'setVisible',
                data = true
            })
            SetNuiFocus(true, true)
            -- Request the player list from the server
            TriggerServerEvent("sc:request:playerList")
        end
    end
end)