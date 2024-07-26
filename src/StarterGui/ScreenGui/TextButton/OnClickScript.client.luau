local storage = game:GetService("ReplicatedStorage")
local serverScriptService = game.ServerScriptService
local button = script.Parent

button.MouseButton1Click:Connect(function()
	button.Visible = false
	storage.ReadyEvent:FireServer()
end)