script.Parent.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if humanoid then
		hit.Parent:MoveTo(game.Workspace.TeleportTo.Position)
	end
end)