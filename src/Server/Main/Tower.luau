local PhysicsService = game:GetService("PhysicsService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local events = ReplicatedStorage:WaitForChild("Events")
local spawnTowerEvent = events:WaitForChild("SpawnTower")
local tower = {}

function FindNearestTarget(newTower)
	local maxDistance = 25
	local range = 25
	local nearestTarget = nil

	for index, target in ipairs(workspace.Mobs:GetChildren()) do
		local distance = (target.HumanoidRootPart.Position - newTower.HumanoidRootPart.Position).Magnitude
		if distance < maxDistance then
			nearestTarget = target
			maxDistance = distance
		end
	end

	return nearestTarget
end

function tower.Attack(newTower)
	local target = FindNearestTarget(newTower)
	if target then
		target.Humanoid:TakeDamage(0.1)
	end

	task.wait(0.05)
	
	tower.Attack(newTower)
end

function tower.Spawn(player, name, cframe)
	-- check name and cframe class
	if typeof(name) ~= "string" or typeof(cframe) ~= "CFrame" then
		warn("Invalid arguments")
		return
	end
	
	local towerExists = ReplicatedStorage.Towers:FindFirstChild(name)
	
	if towerExists then
		local newTower = towerExists:Clone()
		newTower.Warrior.HumanoidRootPart.CFrame = cframe
		newTower.Parent = workspace.Towers
		--newTower.Warrior.HumanoidRootPart:SetNetworkOwner(nil)

		-- Set Collision Group for New Mob, see more in MODEL -> Colision Groups feature
		--for i, object in ipairs(newTower :GetDescendants()) do
		--	if object:IsA("BasePart") then
		--		PhysicsService.CollisionGroups = "Tower"
		--	end
		--end
	else
		warn("Requested tower does not exist")
	end
end

spawnTowerEvent.OnServerEvent:Connect(tower.Spawn)

return tower