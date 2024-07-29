local base = {}

function base.Setup(map, health)
	base.Model = map:WaitForChild("Base")
	base.CurrentHealth = health
	base.MaxHealth = health
end

function base.updateHealth(damage)
	if damage then
		base.CurrentHealth -= damage
	end
	
	local gui = base.Model.HealthGui
	local percent = base.CurrentHealth / base.MaxHealth
	
	gui.CurrentHealth.Size = UDim2.new(percent, 250, 0, 50)
end

return base