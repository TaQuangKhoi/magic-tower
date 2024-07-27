local storage = game:GetService("ReplicatedStorage")
local serverScriptService = game.ServerScriptService
local button = script.Parent

local function firePlayerReady()
	button.Visible = false
	storage.ReadyEvent:FireServer()
end

button.MouseButton1Click:Connect(firePlayerReady)
button.TouchTap:Connect(firePlayerReady)