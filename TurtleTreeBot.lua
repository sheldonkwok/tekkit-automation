function setRed(direction)
	rs.setOutput(direction, true)
	sleep(1)
	rs.setOutput(direction,false)
end

breaker = 'left'
deployer = 'right'
wood = 1
sand = 2
sappling = 3

function scheduler()
	turtle.select(sappling)
	if turtle.compare() then
		return
	end

	turtle.select(wood)
	if turtle.compare() then
		setRed(breaker)
		return
	end

	turtle.select(sand)
	if turtle.compare() then
		setRed(breaker)
		return
	end

	if ~turtle.detect() then
		turtle.select(sappling)
		setRed(deployer)
		return
	end
end

while true do
	scheduler()
end