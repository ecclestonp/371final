--[[
Paul Eccleston
--]]

local Parent = require("parent")
local Triangle = Parent:new({type = "triangle", color = {0,0,1}})
local math = require("math")

function Triangle:spawn(interactable)
  self.newobjSize = self.objSize / 2
  self.vertices = { -1*self.newobjSize, -1*self.newobjSize, self.newobjSize,-1*self.newobjSize, 0, self.newobjSize}
  object = display.newPolygon(math.random(10,(display.contentCenterX*2)-10), math.random(10,(display.contentCenterY*2)-10), self.vertices);
  object:setFillColor(Triangle.color[1], Triangle.color[2], Triangle.color[3])
  Triangle.shape = object
  self.shape = object
  self.shape.class = Triangle
  Triangle.shape.class = Triangle
  if interactable == 1 then
	  object:addEventListener( "touch", Triangle )
	  object:addEventListener( "tap", Triangle )
	end
  return object
end

return Triangle