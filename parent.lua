--[[
Paul Eccleston
--]]

local composer = require("composer")

local type
local color
local inside = 0
local Parent = {}

function Parent:new (o)    --constructor
  o = o or {}; 
  setmetatable(o, self);
  self.__index = self;
  self.objSize = 80
  return o;
end

function Parent:spawn()
  print ("This function is not implemented in parent.lua")
end

function Parent:printMe()
    print (self.type)
end

function Parent:touch(event)
  if event.phase == "began" then
    self.shape.markX = self.shape.x;
    self.shape.markY = self.shape.y;
  elseif event.phase == "moved" then
    local x = (event.x - event.xStart) + self.shape.markX
    local y = (event.y - event.yStart) + self.shape.markY
    self.shape.x = x
    self.shape.y = y
  end
  self.shape.class = self
end


function Parent:tap(event)
  --rotate the color
  temp = self.color[1]
  self.color[1] = self.color[2]
  self.color[2] = self.color[3]
  self.color[3] = temp
  self.shape:setFillColor(self.color[1], self.color[2], self.color[3])
    self.shape.class = self
end

return Parent

