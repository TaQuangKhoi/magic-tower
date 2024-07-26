--disable
local function animateMob(object)
	local humanoid = object:WaitForChild("Humanoid")
	local AnimationsFolder = object:WaitForChild("Animations")
	
	if humanoid and AnimationsFolder then
		local walkAnimation = AnimationsFolder:WaitForChild("Walk")
		if walkAnimation then
			local animator = humanoid:FindFirstChild("Animator") 
				or Instance.new("Animator", humanoid) 
			local walkTrack = animator:LoadAnimation(walkAnimation)
			walkTrack:Play()
		end
	else
		warn("No humanoid/animation folder for", object.Name)
	end
end

workspace.Mobs.ChildAdded:Connect(animateMob)
