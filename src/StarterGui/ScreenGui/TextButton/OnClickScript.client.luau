local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage:WaitForChild("Events")

local serverScriptService = game.ServerScriptService
local button = script.Parent

local function firePlayerReady()
	button.Visible = false
	events.ReadyEvent:FireServer()
end

button.MouseButton1Click:Connect(firePlayerReady)
button.TouchTap:Connect(firePlayerReady)