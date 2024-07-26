local ServerStorage = game:GetService("ServerStorage")
local moveLib = require(script.Parent.MoveLib)

local mob = {}

local function andThen(reached)
	print((reached and "Destination reached!") or "Failed to reach destination!")
end

-- Use for all mobs, both Zombie and Dummy
function mob.Move(mob, map)
	-- Create a variable to hold the `Drooling zombie` instance
	local humanoid = mob:WaitForChild("Humanoid")

	local waypoints = map.Waypoints

	for waypoint = 1, #waypoints:GetChildren() do
		moveLib.moveTo(humanoid, waypoints[waypoint].Position, andThen)
	end
	
	-- mob:Destroy()
end

function mob.Spawn(name, quantity, map)
	local mobExists = ServerStorage.Mobs:FindFirstChild(name)
	
	if mobExists then
		print("Mob Exist")
		for i=1, quantity do
			task.wait(0.5)
			
			local newMob = mobExists:Clone()
			print("Name: " .. newMob.Name)
			newMob.HumanoidRootPart.CFrame = map.Start.CFrame
			newMob.Parent = workspace.Mobs
			--newMob.HumanoidRootPart:SetNetworkOwner(nil)
			
			print("Add CollisionGroup")
			-- Set Collision Group for New Mob, see more in MODEL -> Colision Groups feature
			-- for i, object in ipairs(newMob:GetDescendants()) do
			-- 	if object:IsA("BasePart") then
			-- 		object.CollisionGroup = "Mobs"
			-- 	end
			-- end
			
			-- Disabled by Keios for debug
			--newMob.Humanoid.Died:Connect(function()
			--	task.wait(0.5)
			--	newMob:Destroy()
			--end)

			mob.Move(newMob, map)
			-- coroutine.wrap(mob.Move)(newMob, map)
		end
	else
		warn("Requested mob does not exist")
	end
end

return mob
