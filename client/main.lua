local closestDoorKey, closestDoorValue = nil, nil
local maxDistance = 1.25
local PlayerGang = {}
local PlayerJob = {}
local doorFound = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("qb-doorlock:server:setupDoors")
	PlayerJob = QBCore.Functions.GetPlayerData().job
	PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('qb-doorlock:client:setState')
AddEventHandler('qb-doorlock:client:setState', function(doorID, state)
	QB.Doors[doorID].locked = state
	local current = QB.Doors[doorID]
	if current.doors then
		for a = 1, #current.doors do
			local currentDoor = current.doors[a]
			if not currentDoor.object or not DoesEntityExist(currentDoor.object) then
				currentDoor.object = GetClosestObjectOfType(currentDoor.objCoords, 1.0, GetHashKey(currentDoor.objName), false, false, false)
			end
			FreezeEntityPosition(currentDoor.object, current.locked)

			if current.locked and currentDoor.objYaw and GetEntityRotation(currentDoor.object).z ~= currentDoor.objYaw then
				SetEntityRotation(currentDoor.object, 0.0, 0.0, currentDoor.objYaw, 2, true)
			end
		end
	else
		if not current.object or not DoesEntityExist(current.object) then
			current.object = GetClosestObjectOfType(current.objCoords, 1.0, GetHashKey(current.objName), false, false, false)
		end
		FreezeEntityPosition(current.object, current.locked)

		if current.locked and current.objYaw and GetEntityRotation(current.object).z ~= current.objYaw then
			SetEntityRotation(current.object, 0.0, 0.0, current.objYaw, 2, true)
		end
	end
end)

RegisterNetEvent('qb-doorlock:client:setDoors')
AddEventHandler('qb-doorlock:client:setDoors', function(doorList)
	QB.Doors = doorList
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(jobInfo)
	PlayerJob = jobInfo
end)

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function()
	local pos = GetEntityCoords(PlayerPedId())
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
		for k, v in pairs(QB.Doors) do
			local dist = #(pos - vector3(QB.Doors[k].textCoords.x, QB.Doors[k].textCoords.y, QB.Doors[k].textCoords.z))
			if dist < 1.5 then
				if QB.Doors[k].pickable then
					if QB.Doors[k].locked then
						if hasItem then
							closestDoorKey, closestDoorValue = k, v
							TriggerEvent('qb-lockpick:client:openLockpick', lockpickFinish)
						else
							QBCore.Functions.Notify("You Dont Have A Screwdriver Set", "error")
						end
					else
						QBCore.Functions.Notify('The Door Is Not Locked', 'error', 2500)
					end
				else
					QBCore.Functions.Notify('This Door Can Not Be Lockpicked', 'error', 2500)
				end
			end
		end
    end, "screwdriverset")
end)

-- Functions

function DrawText3Ds(x, y, z, text)
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

function lockpickFinish(success)
    if success then
		QBCore.Functions.Notify('Success!', 'success', 2500)
		setDoorLocking(closestDoorValue, closestDoorKey)
    else
        QBCore.Functions.Notify('Failed', 'error', 2500)
    end
end

function setDoorLocking(doorId, key)
	doorId.locking = true
	openDoorAnim()
    SetTimeout(400, function()
		doorId.locking = false
		doorId.locked = not doorId.locked
		TriggerServerEvent('qb-doorlock:server:updateState', key, doorId.locked)
	end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function IsAuthorized(doorID)
    for _, job in pairs(doorID.authorizedJobs.jobs) do
        if PlayerJob.name == job.name and PlayerJob.grade.level >= job.grade then
            return true
        elseif PlayerGang.name == job.name and Playergang.grade.level >= job.grade then
            return true
        end
    end

    return false
end

function openDoorAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
	SetTimeout(400, function()
		ClearPedTasks(PlayerPedId())
	end)
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

-- Threads

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
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
						if not currentDoor.object or not DoesEntityExist(currentDoor.object) then
							currentDoor.object = GetClosestObjectOfType(currentDoor.objCoords, 1.0, GetHashKey(currentDoor.objName), false, false, false)
						end
						FreezeEntityPosition(currentDoor.object, current.locked)

						if current.locked and currentDoor.objYaw and GetEntityRotation(currentDoor.object).z ~= currentDoor.objYaw then
							SetEntityRotation(currentDoor.object, 0.0, 0.0, currentDoor.objYaw, 2, true)
						end
					end
				else
					if not current.object or not DoesEntityExist(current.object) then
						current.object = GetClosestObjectOfType(current.objCoords, 1.0, GetHashKey(current.objName), false, false, false)
					end
					FreezeEntityPosition(current.object, current.locked)

					if current.locked and current.objYaw and GetEntityRotation(current.object).z ~= current.objYaw then
						SetEntityRotation(current.object, 0.0, 0.0, current.objYaw, 2, true)
					end
				end
			end

			if distance < maxDistance then
				awayFromDoors = false
				doorFound = true
				if current.size then
					size = current.size
				end

				local isAuthorized = IsAuthorized(current)

				if isAuthorized then
					if current.locked then
						displayText = "[~g~E~w~] - Locked"
					elseif not current.locked then
						displayText = "[~g~E~w~] - Unlocked"

					end
				elseif not isAuthorized then
					if current.locked then
						displayText = "~r~Locked"
					elseif not current.locked then
						displayText = "~g~Unlocked"
					end
				end

				if current.locking then
					if current.locked then
						displayText = "~g~Unlocking.."
					else
						displayText = "~r~Locking.."
					end
				end

				if current.objCoords == nil then
					current.objCoords = current.textCoords
				end

				DrawText3Ds(current.objCoords.x, current.objCoords.y, current.objCoords.z, displayText)

				if IsControlJustReleased(0, 38) then
					if isAuthorized then
						setDoorLocking(current, i)
					else
						QBCore.Functions.Notify('Not Authorized', 'error')
					end
				end
			end
		end

		if awayFromDoors then
			doorFound = false
			Citizen.Wait(1000)
		end
	end
end)
