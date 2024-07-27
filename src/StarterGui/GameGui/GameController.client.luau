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
local canPlace = false
local rotation = 0

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
		rotation = 0
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

local function ColorPlaceHolderTower(color)

	for i, object in ipairs(towerToSpawn:GetDescendants()) do
		if object:IsA("BasePart") then
			object.Color = color
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
			if canPlace then
				spawnTowerEvent:FireServer(towerToSpawn.Name, towerToSpawn.PrimaryPart.CFrame)
				RemovePlaceHolderTower()
			end
		elseif input.KeyCode == Enum.KeyCode.R then
			rotation += 90
		end	
	end
	
end)

RunService.RenderStepped:Connect(function()
	if towerToSpawn then
		local result = MouseRayCast({towerToSpawn})
		if result and result.Instance then
			if result.Instance.Parent.Name == "TowerArea" then
				canPlace = true
				ColorPlaceHolderTower(Color3.new(0,1,0))
			else
				canPlace = false
				ColorPlaceHolderTower(Color3.new(1,0,0))
			end
			local x = result.Position.X
			local y = result.Position.Y + 3
			local z = result.Position.Z

			local cframe = CFrame.new(x,y,z) * CFrame.Angles(0, math.rad(rotation), 0)
			towerToSpawn:SetPrimaryPartCFrame(cframe)
		end
	end
end)


