local char = script.Parent
local oncooldown = false
local hum = script.Parent.Humanoid
local attackanim = hum:LoadAnimation(script.Parent.Animation.Attack)
function Findnearestmobs()
	local maxDistance = 7
	local nearestTarget = nil
	
	for i,target in ipairs(workspace.Mobs:GetChildren()) do
		local distance = (target.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
		if distance <= maxDistance then
			nearestTarget = target
			maxDistance = distance
			if nearestTarget.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
				maxDistance = 7
				nearestTarget = nil
			elseif nearestTarget.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and oncooldown == false then
				if oncooldown == true then return end
				if not attackanim.IsPlaying then
					attackanim:Play()
				else
					return
				end
				wait(0.35)
				oncooldown = true
				nearestTarget.Humanoid:TakeDamage(math.random(5,10))
				wait(1)
				oncooldown = false
			end
		end
	end
end
game:GetService("RunService").Heartbeat:Connect(Findnearestmobs)