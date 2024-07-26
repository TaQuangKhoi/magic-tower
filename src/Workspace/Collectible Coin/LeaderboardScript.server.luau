game.Players.PlayerAdded:Connect(function(plr)
	local f = Instance.new("Folder", plr)
	f.Name = "leaderstats"
	local coins = Instance.new("IntValue", f)
	coins.Name = "Coins"
	coins.Value = 0
end)