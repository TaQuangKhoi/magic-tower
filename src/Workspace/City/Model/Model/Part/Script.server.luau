if (2 == 1 + 1) then
wait(300)--Change the 60 to how many seconds you want 
	script.Parent.Parent.Door.Transparency=1
	script.Parent.Parent.Door.CanCollide=false
wait(500)
	script.Parent.Parent.Door.Transparency=0
	script.Parent.Parent.Door.CanCollide=true
end