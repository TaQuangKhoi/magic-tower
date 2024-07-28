local function setAnimation(object, animName)
	
end

local function playAnimation(object, animName)
	
end

local function animateMob(object)
	local humanoid = object:WaitForChild("Humanoid")
	local animationsFolder = object:WaitForChild("Animations")
	
	if humanoid and animationsFolder then
		local walkAnimation = animationsFolder:WaitForChild("Walk")
		if walkAnimation then
			local animator = humanoid:FindFirstChild("Animator") or Instance
			local walkTrack = animator:LoadAnimation(walkAnimation)
			walkTrack:Play()
		end
	else
		warn("No humanoid/animation folder for", object.Name)
	end
end

workspace.Mobs.ChildAdded:Connect(function(object)
	playAnimation(object, "Walk")
end)

workspace.Towers.ChildAdded:Connect(function(object)
	playAnimation(object, "Idle")
end)