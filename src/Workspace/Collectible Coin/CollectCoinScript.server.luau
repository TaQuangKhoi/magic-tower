local db = true
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") ~= nil then
		if db == true then
			db = false
			script.Parent.Transparency = 1
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 1
			script.Sound:Play()
			wait(1)
			script.Parent:Remove()
		end
	end
end)