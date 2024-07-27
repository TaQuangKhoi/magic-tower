script.Parent.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if humanoid then
		task.wait(1)
		hit.Parent:MoveTo(game.Workspace.TeleportTo.Position)
	end
end)