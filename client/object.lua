if Config.Objects.active then
CreateThread( function()
		while true do
			local handle, object = FindFirstObject()
			local finished = false
			repeat
				Wait(1)
				if Config.Objects[GetEntityModel(object)] then
					DeleteObjects(object)
				end
				finished, object = FindNextObject(handle)
			until not finished
			EndFindObject(handle)
			Wait(1)
		end
	end
)

function DeleteObjects(object)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Wait(1)
		end
		DetachEntity(object, 0, false)
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end
end