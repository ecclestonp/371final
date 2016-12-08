--[[
Paul Eccleston
--]]

local Parent = require("parent")
local Square = Parent:new({type = "square", color = {0,1,0}})
local math = require("math")

function Square:spawn(interactable)
  object = display.newRect(math.random(10,(display.contentCenterX*2)-10), math.random(10,(display.contentCenterY*2)-10), Square.objSize, Square.objSize);
  object:setFillColor(Square.color[1], Square.color[2], Square.color[3])
  Square.shape = object
  self.shape = object
  self.shape.class = Square
  Square.shape.class = Square
  if interactable == 1 then
  object:addEventListener( "touch", Square )
  object:addEventListener( "tap", Square )
end
  return object
end

return Square