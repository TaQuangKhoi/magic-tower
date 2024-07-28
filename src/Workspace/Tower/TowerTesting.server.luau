--disable
local tower = script.Parent
local mobs = workspace.Mobs
local damage = 5
local range = 50
local attackSpeed = 1 -- attacks per second

local function FindNearestTarget()
	local maxDistance = range
	local nearestTarget = nil

	for index, target in ipairs(mobs:GetChildren()) do
		local distance = (target.HumanoidRootPart.Position - tower.Position).Magnitude
		--print(target.Name, distance)
		if distance < maxDistance then
			--print(target.Name, "yes sir")
			nearestTarget = target
			maxDistance = distance
		end
	end
	
	return nearestTarget
end

while true do
	local target = FindNearestTarget()
	if target then
		target.Humanoid:TakeDamage(damage)
	end

	task.wait(1 / attackSpeed)
end