--[[
	This script is responsible for animating mobs.
	When a mob is added to the workspace, it will animate the mob based on its state.
]]

-- Depreciated
local function setAnimation(object, animName)

end


local function animateMob(object)
		local humanoid = object:WaitForChild("Humanoid")
		local AnimationsFolder = object:WaitForChild("Animations")

		if humanoid and AnimationsFolder then
				if humanoid:GetState() == Enum.HumanoidStateType.Running then
					local track = humanoid:LoadAnimation(AnimationsFolder.Walk)
					track:Play()
					track:AdjustSpeed(0.5)
			end
		else
			warn("No humanoid/animation folder for", object.Name)
		end
	end

workspace.Mobs.ChildAdded:Connect(animateMob)