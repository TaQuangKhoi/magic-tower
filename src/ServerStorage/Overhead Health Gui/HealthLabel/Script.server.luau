Character = script.Parent.Parent.Parent.Parent
if not Character then repeat wait() until Character end

while wait() do
	script.Parent.Text = math.floor(Character:WaitForChild("Humanoid").Health) .."/".. math.floor(Character:WaitForChild("Humanoid").MaxHealth) .." HP"
end