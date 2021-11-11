RegisterNetEvent('qb-doorlock:server:setupDoors', function()
	TriggerClientEvent("qb-doorlock:client:setDoors", QB.Doors)
end)

RegisterNetEvent('qb-doorlock:server:updateState', function(doorID, state)
	QB.Doors[doorID].locked = state
	TriggerClientEvent('qb-doorlock:client:setState', -1, doorID, state)
end)
