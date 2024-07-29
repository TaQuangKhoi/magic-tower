local hum = script.Parent.Humanoid
local Idle = hum:LoadAnimation(script.Parent.Animation.Idle)
local Attack = hum:LoadAnimation(script.Parent.Animation.Attack)
game:GetService("RunService").Heartbeat:Connect(function()
	if not Idle.IsPlaying then
		Idle:Play()
	end
end)
