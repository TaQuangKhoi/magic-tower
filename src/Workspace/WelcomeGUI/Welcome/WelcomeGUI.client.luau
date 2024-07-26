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

-------------
--Variables--
-------------

local Gui = script.Parent

---------
--Setup--
---------
while not Gui or not Gui:findFirstChild"Frame" do
	wait()
	Gui = script.Parent
end

--------
--Main--
--------

for i,v in next, Gui.Frame:GetChildren() do
	v.Visible = false
end

local OSize = Gui.Frame.Size
local OPos = Gui.Frame.Position
Gui.Frame.Position = Gui.Frame.Position + UDim2.new(0, Gui.Frame.AbsoluteSize.X/2, 0, Gui.Frame.AbsoluteSize.Y/2)
Gui.Frame.Size = UDim2.new(0,0,0,0)

Gui.Frame.Visible = true
Gui.Frame:TweenSizeAndPosition(OSize,OPos)
wait(1)

for i,v in next, Gui.Frame:GetChildren() do
	v.Visible = true
end

Gui.Frame.Close.MouseButton1Click:connect(function ()
	for i,v in next, Gui.Frame:GetChildren() do
		v.Visible = false
	end
	Gui.Frame:TweenSizeAndPosition(UDim2.new(0,0,0,0),Gui.Frame.Position + UDim2.new(0, Gui.Frame.AbsoluteSize.X/2, 0, Gui.Frame.AbsoluteSize.Y/2))
	wait(1)
	Gui:Destroy()
end)

-- reaperz928 --