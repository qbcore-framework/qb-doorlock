local QBCore = exports['qb-core']:GetCoreObject()
local closestDoorKey, closestDoorValue = nil, nil
local maxDistance = 1.25
local PlayerData = QBCore.Functions.GetPlayerData()
local doorFound = false

-- Functions

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

local function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
end

local function openDoorAnim()
	loadAnimDict("anim@heists@keycard@")
	TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
	SetTimeout(400, function()
		ClearPedTasks(PlayerPedId())
	end)
end

local function setDoorLocking(doorId, key)
	doorId.locking = true
	openDoorAnim()
	SetTimeout(400, function()
		doorId.locking = false
		doorId.locked = not doorId.locked
		TriggerServerEvent('qb-doorlock:server:updateState', key, doorId.locked)
	end)
end

local function lockpickFinish(success)
	if success then
		QBCore.Functions.Notify(Lang:t("success.lockpick_success"), 'success', 2500)
		setDoorLocking(closestDoorValue, closestDoorKey)
	else
		QBCore.Functions.Notify(Lang:t("error.lockpick_fail"), 'error', 2500)
	end
end

local function IsAuthorized(doorID)
	if allAuthorized then return true end

	if doorID.authorizedJobs then
		if doorID.authorizedJobs[PlayerData.job.name] and PlayerData.job.grade.level >= doorID.authorizedJobs[PlayerData.job.name] then
			return true
		elseif type(doorID.authorizedJobs[1]) == 'string' then
			for _, job in pairs(doorID.authorizedJobs) do -- Support for old format
				if job == PlayerData.job.name then
					return true
				end
			end
		end
	end

	if doorID.authorizedGangs then
		if doorID.authorizedGangs[PlayerData.gang.name] and PlayerData.gang.grade.level >= doorID.authorizedGangs[PlayerData.gang.name] then
			return true
		elseif type(doorID.authorizedGangs[1]) == 'string' then
			for _, gang in pairs(doorID.authorizedGangs) do
				if gang == PlayerData.gang.name then
					return true
				end
			end
		end
	end

	if doorID.authorizedCitizenID then
		if doorID.authorizedCitizenID[PlayerData.citizenid] then
			return true
		elseif type(doorID.authorizedCitizenID[1]) == 'string' then
			for _, id in pairs(doorID.authorizedCitizenID) do -- Support for old format
				if id == PlayerData.citizenid then
					return true
				end
			end
		end
	end

	return false
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	TriggerServerEvent("qb-doorlock:server:setupDoors")
	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
end)

RegisterNetEvent('qb-doorlock:client:setState', function(doorID, state)
	QB.Doors[doorID].locked = state
	local current = QB.Doors[doorID]
	if current.doors then
		for a = 1, #current.doors do
			local currentDoor = current.doors[a]
			local doorHash = type(currentDoor.objName) == 'number' and currentDoor.objName or GetHashKey(currentDoor.objName)
			if not currentDoor.object or not DoesEntityExist(currentDoor.object) then
				currentDoor.object = GetClosestObjectOfType(currentDoor.objCoords, 1.0, doorHash, false, false, false)
			end
			FreezeEntityPosition(currentDoor.object, current.locked)
			if current.locked and currentDoor.objYaw and GetEntityRotation(currentDoor.object).z ~= currentDoor.objYaw then
				SetEntityRotation(currentDoor.object, 0.0, 0.0, currentDoor.objYaw, 2, true)
			end
		end
	else
		local doorHash = type(current.objName) == 'number' and current.objName or GetHashKey(current.objName)
		if not current.object or not DoesEntityExist(current.object) then
			if doorHash == 741314661 then -- TEMPORARY FIX FOR `prop_gate_prison_01`
				current.object = GetClosestObjectOfType(current.objCoords, 5.0, doorHash, false, false, false)
			else
				current.object = GetClosestObjectOfType(current.objCoords, 1.0, doorHash, false, false, false)
			end
		end
		FreezeEntityPosition(current.object, current.locked)
		if current.locked and current.objYaw and GetEntityRotation(current.object).z ~= current.objYaw then
			SetEntityRotation(current.object, 0.0, 0.0, current.objYaw, 2, true)
		end
	end
end)

RegisterNetEvent('qb-doorlock:client:setDoors', function(doorList)
	QB.Doors = doorList
end)

RegisterNetEvent('lockpicks:UseLockpick', function()
	local pos = GetEntityCoords(PlayerPedId())
	for k, v in pairs(QB.Doors) do
		local dist = #(pos - vector3(QB.Doors[k].textCoords.x, QB.Doors[k].textCoords.y, QB.Doors[k].textCoords.z))
		if dist < 1.5 then
			if QB.Doors[k].pickable then
				if QB.Doors[k].locked then
					QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
						if hasItem then
							closestDoorKey, closestDoorValue = k, v
							TriggerEvent('qb-lockpick:client:openLockpick', lockpickFinish)
						else
							QBCore.Functions.Notify(Lang:t("error.screwdriverset_not_found"), "error")
						end
					end, "screwdriverset")
					break
				else
					QBCore.Functions.Notify(Lang:t("error.door_not_locked"), 'error', 2500)
					break
				end
			else
				QBCore.Functions.Notify(Lang:t("error.door_not_lockpickable"), 'error', 2500)
				break
			end
		end
	end
end)

-- Threads

CreateThread(function()
	while true do
		local sleep = 1000
		local playerCoords, awayFromDoors = GetEntityCoords(PlayerPedId()), true
		for i = 1, #QB.Doors do
			local current = QB.Doors[i]
			local distance

			if current.doors then
				distance = #(playerCoords - current.doors[1].objCoords)
			else
				distance = #(playerCoords - current.objCoords)
			end

			if current.distance then
				maxDistance = current.distance
			end

			if distance < 3.0 and not doorFound then
				awayFromDoors = false
				if current.doors then
					for a = 1, #current.doors do
						local currentDoor = current.doors[a]
						local doorHash = type(currentDoor.objName) == 'number' and currentDoor.objName or GetHashKey(currentDoor.objName)
						if not currentDoor.object or not DoesEntityExist(currentDoor.object) then
							currentDoor.object = GetClosestObjectOfType(currentDoor.objCoords, 1.0, doorHash, false, false, false)
						end
						FreezeEntityPosition(currentDoor.object, current.locked)
						if current.locked and currentDoor.objYaw and GetEntityRotation(currentDoor.object).z ~= currentDoor.objYaw then
							SetEntityRotation(currentDoor.object, 0.0, 0.0, currentDoor.objYaw, 2, true)
						end
					end
				else
					local doorHash = type(current.objName) == 'number' and current.objName or GetHashKey(current.objName)
					if not current.object or not DoesEntityExist(current.object) then
						current.object = GetClosestObjectOfType(current.objCoords, 1.0, doorHash, false, false, false)
					end
					FreezeEntityPosition(current.object, current.locked)
					if current.locked and current.objYaw and GetEntityRotation(current.object).z ~= current.objYaw then
						SetEntityRotation(current.object, 0.0, 0.0, current.objYaw, 2, true)
					end
				end
			end

			if distance < maxDistance then
				local displayText = ""
				awayFromDoors = false
				doorFound = true

				local isAuthorized = IsAuthorized(current)

				if isAuthorized then
					if current.locked then
						displayText = Lang:t("general.locked_button")
					elseif not current.locked then
						displayText = Lang:t("general.unlocked_button")
					end
				elseif not isAuthorized then
					if current.locked then
						displayText = Lang:t("general.locked")
					elseif not current.locked then
						displayText = Lang:t("general.unlocked")
					end
				end

				if current.locking then
					if current.locked then
						displayText = Lang:t("general.unlocking")
					else
						displayText = Lang:t("general.locking")
					end
				end

				if not current.objCoords then
					current.objCoords = current.textCoords
				end

				sleep = 0
				DrawText3Ds(current.objCoords.x, current.objCoords.y, current.objCoords.z, displayText)
				if IsControlJustReleased(0, 38) then
					if isAuthorized then
						setDoorLocking(current, i)
					else
						QBCore.Functions.Notify(Lang:t("error.not_authorized"), 'error')
					end
					sleep = 100
				end
			end
		end

		if awayFromDoors then
			doorFound = false
			sleep = 1000
		end
		Wait(sleep)
	end
end)