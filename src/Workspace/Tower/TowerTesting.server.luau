local tower = script.Parent
local mobs = workspace.Mobs

local function FindNearestTarget()
	local maxDistance = 50
	local nearestTarget = nil

	for i, target in ipairs(mobs:GetChildren()) do
		local distance = (target.HumanoidRootPart.Position - tower.Position).Magnitude
		print(target.Name, distance)
		if distance < maxDistance then
			print(target.Name, "yes sir")
			nearestTarget = target
			maxDistance = distance
		end
	end 
	
	return nearestTarget
end

while true do
	local target = FindNearestTarget()
	if target then
		target.Humanoid:TakeDamage(5)
	end
	
	task.wait(0.02)
end