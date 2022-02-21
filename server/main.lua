local QBCore = exports['qb-core']:GetCoreObject()
local Config = Config

-- Functions

local function showWarning(msg)
	print(('^3%s: %s^0'):format(Lang:t("general.warning"), msg))
end

local function checkItems(Player, items, needsAll, checkRemove)
	if needsAll == nil then needsAll = true end
	if type(items) == 'table' then
		local count = 0
		local finalcount = 0
		for k, v in pairs(items) do
			if type(k) == 'string' then
				finalcount = 0
				for _ in pairs(items) do finalcount += 1 end
				local item = Player.Functions.GetItemByName(k)
				if item then
					if item.amount >= v then
						if needsAll then
							count += 1
							if count == finalcount then
								if checkRemove then
									for i in pairs(items) do
										item = Player.Functions.GetItemByName(i)
										if item and Config.Consumables[i] then
											Player.Functions.RemoveItem(i, item.amount >= Config.Consumables[i] and Config.Consumables[i] or 1)
										end
									end
								end
								return true
							end
						else
							if checkRemove and Config.Consumables[item.name] then
								Player.Functions.RemoveItem(item.name, item.amount >= Config.Consumables[item.name] and Config.Consumables[item.name] or 1)
							end
							return true
						end
					end
				end
			else
				finalcount = #items
				local item = Player.Functions.GetItemByName(v)
				if item then
					if needsAll then
						count += 1
						if count == finalcount then
							if checkRemove then
								for _, j in pairs(items) do
									item = Player.Functions.GetItemByName(j)
									if item and Config.Consumables[j] then
										Player.Functions.RemoveItem(j, item.amount >= Config.Consumables[j] and Config.Consumables[j] or 1)
									end
								end
							end
							return true
						end
					else
						if checkRemove and Config.Consumables[item.name] then
							Player.Functions.RemoveItem(item.name, item.amount >= Config.Consumables[item.name] and Config.Consumables[item.name] or 1)
						end
						return true
					end
				end
			end
		end
	else
		local item = Player.Functions.GetItemByName(items)
		if item then
			if checkRemove and Config.Consumables[item.name] then
				Player.Functions.RemoveItem(item.name, item.amount >= Config.Consumables[item.name] and Config.Consumables[item.name] or 1)
			end
			return true
		end
	end
	return false
end

local function isAuthorized(Player, door, usedLockpick)
	if door.allAuthorized then return true end

	if Config.AdminAccess and QBCore.Functions.HasPermission(Player.PlayerData.source, Config.AdminPermission) then
		if Config.Warnings then
			showWarning(Lang:t("general.warn_admin_privilege_used", {player = Player.PlayerData.name, license = Player.PlayerData.license}))
		end
		return true
	end

	if (door.pickable or door.lockpick) and usedLockpick then return true end

	if door.authorizedJobs then
		if door.authorizedJobs[Player.PlayerData.job.name] and Player.PlayerData.job.grade.level >= door.authorizedJobs[Player.PlayerData.job.name] then
			return true
		elseif type(door.authorizedJobs[1]) == 'string' then
			for _, job in pairs(door.authorizedJobs) do -- Support for old format
				if job == Player.PlayerData.job.name then return true end
			end
		end
	end

	if door.authorizedGangs then
		if door.authorizedGangs[Player.PlayerData.gang.name] and Player.PlayerData.gang.grade.level >= door.authorizedGangs[Player.PlayerData.gang.name] then
			return true
		elseif type(door.authorizedGangs[1]) == 'string' then
			for _, gang in pairs(door.authorizedGangs) do -- Support for old format
				if gang == Player.PlayerData.gang.name then return true end
			end
		end
	end

	if door.authorizedCitizenIDs then
		if door.authorizedCitizenIDs[Player.PlayerData.citizenid] then
			return true
		elseif type(door.authorizedCitizenIDs[1]) == 'string' then
			for _, id in pairs(door.authorizedCitizenIDs) do -- Support for old format
				if id == Player.PlayerData.citizenid then return true end
			end
		end
	end

	if door.items then return checkItems(Player, door.items, door.needsAllItems, true) end

	return false
end

-- Callbacks

QBCore.Functions.CreateCallback('qb-doorlock:server:setupDoors', function(_, cb)
	cb(Config.DoorList)
end)

QBCore.Functions.CreateCallback('qb-doorlock:server:checkItems', function(source, cb, items, needsAll)
	local Player = QBCore.Functions.GetPlayer(source)
	cb(checkItems(Player, items, needsAll, false))
end)

-- Events

RegisterNetEvent('qb-doorlock:server:updateState', function(doorID, locked, src, usedLockpick, unlockAnyway, enableSounds, enableAnimation, sentSource)
	local playerId = sentSource or source
	local Player = QBCore.Functions.GetPlayer(playerId)
	if not Player then return end
	if type(doorID) ~= 'number' and type(doorID) ~= 'string' then
		if Config.Warnings then
			showWarning((Lang:t("general.warn_wrong_doorid_type", {player = Player.PlayerData.name, license = Player.PlayerData.license, doorID = doorID})))
		end
		return
	end

	if type(locked) ~= 'boolean' then
		if Config.Warnings then
			showWarning((Lang:t("general.warn_wrong_state", {player = Player.PlayerData.name, license = Player.PlayerData.license, state = locked})))
		end
		return
	end

	if not Config.DoorList[doorID] then
		if Config.Warnings then
			showWarning(Lang:t("general.warn_wrong_doorid", {player = Player.PlayerData.name, license = Player.PlayerData.license, doorID = doorID}))
		end
		return
	end

	if not unlockAnyway and not isAuthorized(Player, Config.DoorList[doorID], usedLockpick) then
		if Config.Warnings then
			showWarning(Lang:t("general.warn_no_authorisation", {player = Player.PlayerData.name, license = Player.PlayerData.license, doorID = doorID}))
		end
		return
	end

	Config.DoorList[doorID].locked = locked
	TriggerClientEvent('qb-doorlock:client:setState', -1, playerId, doorID, locked, src or false, enableSounds, enableAnimation)

	if not Config.DoorList[doorID].autoLock then return end
	SetTimeout(Config.DoorList[doorID].autoLock, function()
		if Config.DoorList[doorID].locked then return end
		Config.DoorList[doorID].locked = true
		TriggerClientEvent('qb-doorlock:client:setState', -1, playerId, doorID, true, src or false, enableSounds, enableAnimation)
	end)
end)

RegisterNetEvent('qb-doorlock:server:saveNewDoor', function(data, doubleDoor)
	local src = source
	if not QBCore.Functions.HasPermission(src, Config.CommandPermission) and not IsPlayerAceAllowed(src, 'command') then
		if Config.Warnings then
			showWarning(Lang:t("general.warn_no_permission_newdoor", {player = GetPlayerName(src), license = QBCore.Functions.GetIdentifier(src, 'license'), source = src}))
		end
		return
	end
	local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end
	local configData = {}
	local jobs, gangs, cids, items, doorType
	if data.job then configData.authorizedJobs = { [data.job] = 0 } jobs = "['"..data.job.."'] = 0" end
	if data.gang then configData.authorizedGangs = { [data.gang] = 0 } gangs = "['"..data.gang.."'] = 0" end
	if data.cid then configData.authorizedCitizenIDs = { [data.cid] = true } cids = "['"..data.cid.."'] = true" end
	if data.item then configData.items = { [data.item] = 1 } items = "['"..data.item.."'] = 1" end
	configData.locked = data.locked
	configData.pickable = data.pickable
	configData.distance = data.distance
	configData.doorType = data.doortype
	configData.hideNUI = data.hidenui
	configData.doorRate = 1.0
	configData.audioRemote = false
	doorType = "'"..data.doortype.."'"
	if doubleDoor then
		configData.doors = {
			{objName = data.model[1], objYaw = data.heading[1], objCoords = data.coords[1]},
			{objName = data.model[2], objYaw = data.heading[2], objCoords = data.coords[2]}
		}
	else
		configData.objName = data.model
		configData.objYaw = data.heading
		configData.objCoords = data.coords
		configData.fixText = false
	end
	local path = GetResourcePath(GetCurrentResourceName())
	if data.configfile then
		local tempfile, err = io.open(path:gsub('//', '/')..'/configs/'..string.gsub(data.configfile, ".lua", "")..'.lua', 'a+')
		if tempfile then
			tempfile:close()
			path = path:gsub('//', '/')..'/configs/'..string.gsub(data.configfile, ".lua", "")..'.lua'
		else
			return error(err)
		end
	else
		path = path:gsub('//', '/')..'/config.lua'
	end

	local file = io.open(path, 'a+')
	local label = "\n\n-- "..data.doorname.." ".. Lang:t("general.created_by") .." "..Player.PlayerData.name.."\nConfig.DoorList['"..data.doorname.."'] = {"
	file:write(label)
	for k, v in pairs(configData) do
		if k == 'authorizedJobs' or k == 'authorizedGangs' or k == 'authorizedCitizenIDs' or k == 'items' then
			local auth = jobs
			if k == 'authorizedGangs' then
				auth = gangs
			elseif k == 'authorizedCitizenIDs' then
				auth = cids
			elseif k == 'items' then
				auth = items
			end
			local str = ("\n    %s = { %s },"):format(k, auth)
			file:write(str)
		elseif k == 'doors' then
			local doors = {}
			for i = 1, 2 do
				doors[i] = ("    {objName = %s, objYaw = %s, objCoords = %s}"):format(configData.doors[i].objName, configData.doors[i].objYaw, configData.doors[i].objCoords)
			end
			local str = ("\n    %s = {\n    %s,\n    %s\n    },"):format(k, doors[1], doors[2])
			file:write(str)
		elseif k == 'doorType' then
			local str = ("\n    %s = %s,"):format(k, doorType)
			file:write(str)
		else
			local str = ("\n    %s = %s,"):format(k, v)
			file:write(str)
		end
	end
	file:write("\n    --audioLock = {[\'file\'] = \'metal-locker.ogg\', [\'volume\'] = 0.6},\n    --audioUnlock = {[\'file\'] = \'metallic-creak.ogg\', [\'volume\'] = 0.7},\n    --autoLock = 1000,\n}")
	file:close()

	Config.DoorList[data.doorname] = configData
	TriggerClientEvent('qb-doorlock:client:newDoorAdded', -1, configData, data.doorname)
end)

-- Commands

QBCore.Commands.Add('newdoor', Lang:t("general.newdoor_command_description"), {}, false, function(source)
	TriggerClientEvent('qb-doorlock:client:addNewDoor', source)
end, Config.CommandPermission)