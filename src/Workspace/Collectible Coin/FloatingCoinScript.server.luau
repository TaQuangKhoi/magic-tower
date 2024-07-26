while true do
	wait(0.1)
	v = script.Parent.Position
	for i = 1,5 do
		wait(0.1)
		script.Parent.Position = script.Parent.Position + Vector3.new(0,i/40,0)
	end
	for i = 4,1,-1 do
		wait(0.1)
		script.Parent.Position = script.Parent.Position + Vector3.new(0,i/40,0)
	end
	for i = 1,5 do
		wait(0.1)
		script.Parent.Position = script.Parent.Position + Vector3.new(0,-i/40,0)
	end
	for i = 4,1,-1 do
		wait(0.1)
		script.Parent.Position = script.Parent.Position + Vector3.new(0,-i/40,0)
	end
	script.Parent.Position = v
end