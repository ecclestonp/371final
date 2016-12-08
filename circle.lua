--[[
Paul Eccleston
--]]

local Parent = require("parent")
local Circle = Parent:new({type = "circle", color = {1,0,0}})
local math = require("math")

function Circle:spawn(interactable)
  object = display.newCircle(math.random(10,(display.contentCenterX*2)-10), math.random(10,(display.contentCenterY*2)-10), Circle.objSize/2);
  object:setFillColor(Circle.color[1], Circle.color[2], Circle.color[3])
  Circle.shape = object
  self.shape = object
  self.shape.class = Circle
  Circle.shape.class = Circle
  if interactable == 1 then
	  object:addEventListener( "touch", Circle )
	  object:addEventListener( "tap", Circle )
	end
  return object
end

return Circle