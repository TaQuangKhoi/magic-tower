local function setAnimation(object, animName)
	
end

local function play()

local function animateMob(object)
	local humanoid = object:WaitForChild("Humanoid")
	local AnimationsFolder = object:WaitForChild("Animations")
	
	if humanoid and AnimationsFolder then
	else
		warn("No humanoid/animation folder for", object.Name)
	end
end

workspace.Mobs.ChildAdded:Connect(animateMob)
end