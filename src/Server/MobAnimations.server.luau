--[[
	This script is responsible for animating mobs.
	When a mob is added to the workspace, it will animate the mob based on its state.
]]

-- Depreciated
local function setAnimation(object, animName)

end

-- @author Tyranno
local function animateMob(object)
	local humanoid = object:WaitForChild("Humanoid")
	local AnimationsFolder = object:WaitForChild("Animations")

	if humanoid and AnimationsFolder then
		if humanoid:GetState() == Enum.HumanoidStateType.Running then
			if object.Name == "FastDummy" then
				local track = humanoid:LoadAnimation(AnimationsFolder.Walk)
				track:Play()
				track:AdjustSpeed(0.75)
			elseif object.Name == "Zombie" then
				local track = humanoid:LoadAnimation(AnimationsFolder.Walk)
				track:Play()
				track:AdjustSpeed(0.5)
			end
		end
	else
		warn("No humanoid/animation folder for", object.Name)
	end
end

workspace.Mobs.ChildAdded:Connect(animateMob)