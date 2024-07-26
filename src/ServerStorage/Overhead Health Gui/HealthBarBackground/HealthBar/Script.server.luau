local Character = script.Parent.Parent.Parent.Parent.Parent
if not Character then repeat wait() until Character end

while wait() do
	script.Parent.Size = UDim2.new(Character.Humanoid.Health / Character.Humanoid.MaxHealth, 0, 1, 0)
end