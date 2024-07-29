local map = workspace.City
local base require(script.Base)
local mob = require(script.Mob)
local tower = require(script.Tower)

base.Setup(map, 50)

task.wait(2)
base.updateHealth(25)

local map = workspace.City
local starterGui = game.StarterGui
local waveNumber = starterGui.ScreenGui.txtlbl_WaveNumber
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage:WaitForChild("Events")

events.ReadyEvent.OnServerEvent:Connect(function()
	print("Player is ready")
	
	for wave = 1, 10 do
		print("WAVE STARTING", wave)
		waveNumber.Text = "Wave " .. tostring(wave)
		if wave < 3 then
			print("Less than 3")
			mob.Spawn("Dummy", 2 * wave, map)
			
			-- Disalbed by Keios for testing Spawn Move Position
			mob.Spawn("Zombie", 5 * wave, map)
			mob.Spawn("FastDummy", math.random(4,8) * wave, map)
			mob.Spawn("TankyDummy", 2 * wave, map)
			task.wait(2)
			mob.Spawn("Dummy", 10 * wave, map)

		elseif wave > 3 then
			mob.Spawn("FastDummy", math.random(4,8) * wave, map)
			mob.Spawn("Zombie", 100, map)
			mob.Spawn("Dummy", 25 * wave, map)
		end

		repeat
			task.wait(1)
		until #workspace.Mobs:GetChildren() == 0

		print("WAVE END", wave)
		task.wait(1)
	end
end)

