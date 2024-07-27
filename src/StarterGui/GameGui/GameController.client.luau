local PhysicsService = game:GetService("PhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local events = ReplicatedStorage:WaitForChild("Events")
local towers = ReplicatedStorage:WaitForChild("Towers")
local spawnTowerEvent = events:WaitForChild("SpawnTower")
local camera = workspace.CurrentCamera
local gui = script.Parent

local towerToSpawn = nil

local function MouseRayCast(blacklist)
	local mousePosition = UserInputService:GetMouseLocation()
	local mouseRay = camera:ViewportPointToRay(mousePosition.X, mousePosition.Y)
	local raycastParams = RaycastParams.new()

	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = blacklist

	local raycastResult = workspace:Raycast(mouseRay.Origin, mouseRay.Direction * 1000, raycastParams)

	return raycastResult
end

local function RemovePlaceHolderTower()
	if towerToSpawn then
		towerToSpawn:Destroy()
		towerToSpawn = nil
	end
end
	

local function AddPlaceHolderTower(name)
	local towerExists = towers:FindFirstChild(name)
	if towerExists then
		RemovePlaceHolderTower()
		towerToSpawn = towerExists:Clone()
		towerToSpawn.Parent = workspace.Towers

		for i, object in ipairs(towerToSpawn:GetDescendants()) do
			if object:IsA("BasePart") then
				PhysicsService:SetPartCollisionGroup(object, "Tower")
				object.Material = Enum.Material.ForceField
			end
		end
	end
end

gui.Spawn.Activated:Connect(function()
	AddPlaceHolderTower("Warrior")
end)

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then
		return
	end
	
	if towerToSpawn then
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			spawnTowerEvent:FireServer(towerToSpawn.Name, towerToSpawn.PrimaryPart.CFrame)
			RemovePlaceHolderTower()
		end
	end
	
end)

RunService.RenderStepped:Connect(function()
	if towerToSpawn then
		local result = MouseRayCast({towerToSpawn})
		if result and result.Instance then
			local x = result.Position.X
			local y = result.Position.Y + 3
			local z = result.Position.Z

			local cframe = CFrame.new(x,y,z)
			towerToSpawn:SetPrimaryPartCFrame(cframe)
		end
	end
end)


