local move = {}

function move.moveTo(humanoid, targetPoint, andThen)
	local targetReached = false

	-- listen for the humanoid reaching its target
	local connection
	connection = humanoid.MoveToFinished:Connect(function(reached)
		targetReached = true
		connection:Disconnect()
		connection = nil
		if andThen then
			andThen(reached)
		end
	end)


	-- start walking
	humanoid:MoveTo(targetPoint)


	-- execute on a new thread so as to not yield function
	task.spawn(function()
		while not targetReached do
			-- does the humanoid still exist?
			if not (humanoid and humanoid.Parent) then
				break
			end
			-- has the target changed?
			if humanoid.WalkToPoint ~= targetPoint then
				break
			end
			-- refresh the timeout
			humanoid:MoveTo(targetPoint)
			task.wait(6)
		end

		-- disconnect the connection if it is still connected
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end)
end

return move
