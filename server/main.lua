RegisterServerEvent('qb-doorlock:server:setupDoors')
AddEventHandler('qb-doorlock:server:setupDoors', function()
	TriggerClientEvent("qb-doorlock:client:setDoors", QB.Doors)
end)

RegisterServerEvent('qb-doorlock:server:updateState')
AddEventHandler('qb-doorlock:server:updateState', function(doorID, state)
	QB.Doors[doorID].locked = state

	TriggerClientEvent('qb-doorlock:client:setState', -1, doorID, state)
end)
