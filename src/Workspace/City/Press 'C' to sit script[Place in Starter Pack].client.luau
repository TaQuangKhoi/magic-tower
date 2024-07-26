repeat wait() until game.Players.LocalPlayer
local player = script.Parent.Parent
local mouse = player:GetMouse()

mouse.KeyDown:connect(function(key)
	if key == "c" then
    player.Character.Humanoid.Sit=true
	end
end)

