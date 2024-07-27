local PhysicsService = game:GetService("PhysicsService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local spawnTowerEvent = ReplicatedStorage:WaitForChild("Events")
local events = ReplicatedStorage:WaitForChild("Events")
local tower = {}

function tower.Spawn(player, name, cframe)
	local towerExists = ReplicatedStorage.Towers:FindFirstChild(name)
	
	if towerExists then
		local newTower = towerExists:Clone()
		newTower.HumanoidRootPart.CFrame = cframe
		newTower.Parent = workspace.Towers
		newTower.HumanoidRootPart:SetNetworkOwner(nil)

		-- Set Collision Group for New Mob, see more in MODEL -> Colision Groups feature
		for i, object in ipairs(newTower :GetDescendants()) do
			if object:IsA("BasePart") then
				PhysicsService.CollisionGroups = "Tower"
			end
		end
	else
		warn("Requested tower does not exist")
	end
end

spawnTowerEvent.OnServerEvent:Connect(tower.Spawn)

return tower