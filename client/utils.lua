function Draw3DText(coords, str)
    local onScreen, worldX, worldY = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords = GetGameplayCamCoord()
	local scale = 200 / (GetGameplayCamFov() * #(camCoords - coords))
    if onScreen then
        SetTextScale(1.0, 0.5 * scale)
        SetTextFont(4)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(2, 0, 0, 0, 150)
		SetTextProportional(1)
		SetTextOutline()
		SetTextCentre(1)
        SetTextEntry("STRING")
        AddTextComponentString(str)
        DrawText(worldX, worldY)
    end
end

function raycastWeapon()
    local offset = GetOffsetFromEntityInWorldCoords(GetCurrentPedWeaponEntityIndex(playerPed), 0, 0, -0.01)
    local direction = GetGameplayCamRot()
    direction = vec2(direction.x * math.pi / 180.0, direction.z * math.pi / 180.0)
    local num = math.abs(math.cos(direction.x))
    direction = vec3((-math.sin(direction.y) * num), (math.cos(direction.y) * num), math.sin(direction.x))
    local destination = vec3(offset.x + direction.x * 30, offset.y + direction.y * 30, offset.z + direction.z * 30)
    local rayHandle, result, hit, _, _, entityHit = StartShapeTestLosProbe(offset, destination, -1, playerPed, 0)
    repeat
        result, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
        Wait(0)
    until result ~= 1
    if GetEntityType(entityHit) == 3 then return hit, entityHit else return false end
end

function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local _, hit, endCoords, _, _ = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return hit == 1, endCoords
end


function setTextCoords(data)
    local minDimension, maxDimension = GetModelDimensions(data.objName or data.objHash)
    local dimensions = maxDimension - minDimension
    local dx, dy = tonumber(dimensions.x), tonumber(dimensions.y)
    if dy <= -1 or dy >= 1 then dx = dy end
    if data.fixText then
        return GetOffsetFromEntityInWorldCoords(data.object, dx / 2, 0, 0)
    else
        return GetOffsetFromEntityInWorldCoords(data.object, -dx / 2, 0, 0)
    end
end

function getTextCoords(door)
	if door.setText then return door.textCoords end
	return setTextCoords(door)
end

function round(value, numDecimalPlaces)
	if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end