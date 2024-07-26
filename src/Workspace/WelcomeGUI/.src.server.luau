--[[
	Welcome GUI
	version: 2

	By: reaperz928

	The GUI is given to a player once when they join the game.

	Note: I had noticed people had used this. I first created this when GUIs had
		just been released. As such, it was really old, but due to how popular 
		the model is, I decided to update it.

	Usage: Modify the GUI's text as you please and keep the entire model in workspace.
]]

-----------------
--Configuration--
-----------------

local GUI = script.Welcome


---------------------
--General Functions--
---------------------

Join = (function (Plyr)
	local GuiClone = GUI:Clone()
	if not Plyr.Character then 
		Plyr.CharacterAdded:wait()
	end
	GuiClone.Frame.Visible = false --Set visible to false to be handled by local script
	GuiClone.Parent = Plyr:findFirstChild"PlayerGui"
end)


--------
--Main--
--------
wait(1)

game.Players.PlayerAdded:connect(Join)
for _,v in next, game.Players:GetPlayers() do
	Join(v)
end

-- reaperz928 --