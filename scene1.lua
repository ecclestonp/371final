--[[
Paul Eccleston
--]]

local composer = require("composer")
local scene = composer.newScene()
local circle = require("circle")
local square = require("square")
local triangle = require("triangle")
local physics = require("physics")

local myCircle
local mySquare
local myTriangle
local zone
local box

-- Switch to level 1
function gotoScene2()
	local opt = {
		effect = "zoomInOutRotate",
		time = 500
	}
	composer.setVariable("myCircle", myCircle)
	composer.setVariable("mySquare", mySquare)
	composer.setVariable("myTriangle", myTriangle)
	composer.gotoScene("scene2", opt)
end

local function zoneHandler(event)
	if(event.other.class ~= nil) then
   if (event.phase == "began") then
      print (event.other.class.type .. " has entered the box.");
      shapes = event.other
      event.other.inside = 1
   elseif (event.phase == "ended") then
   		print ("Where did you go?");
   		event.other.inside = 0
	end
else
	composer:removeScene("scene1")
end
end

function scene:create(event)
	local sceneGroup = self.view

	--Build menu items
	local widget = require("widget")
	local nextScene = widget.newButton({shape="roundedRect",width=display.contentCenterX/2, height=display.contentCenterY/8, cornerRadius=3, fillColor={default={1,1,1},over={.7,.7,.7}}, label="Scene 2", onRelease=gotoScene2})
	
	myCircle = circle:spawn(1)
	mySquare = square:spawn(1)
	myTriangle = triangle:spawn(1)


	physics.start()
	physics.setGravity(0,0)

	zone = display.newRect (display.contentCenterX, display.contentCenterY, display.contentWidth*0.7, display.contentHeight*0.4);
	zone.isVisible = false;
	physics.addBody ( zone, "dynamic");
	zone.isSensor = true;

	box = display.newRect (display.contentCenterX, display.contentCenterY, display.contentWidth*0.7, display.contentHeight*0.4);
	box:toBack();
	box:setFillColor(1,1,0,0.1);
	box.strokeWidth = 5;

	zone:addEventListener("collision", zoneHandler);

	physics.addBody(myCircle, "dynamic")
	physics.addBody(mySquare, "dynamic")
	physics.addBody(myTriangle, "dynamic")

	shapes = {myCircle, mySquare, myTriangle}

	--Put items in the scene group
	sceneGroup:insert(myCircle)
	sceneGroup:insert(mySquare)
	sceneGroup:insert(myTriangle)
	sceneGroup:insert(nextScene)
	sceneGroup:insert(zone)
	sceneGroup:insert(box)
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- spawn the objects
	end
end

function scene:hide(event)
	local sceneGroup = self.view
    local phase = event.phase
    if (phase == "will") then

    elseif (phase == "did") then
		zone:removeEventListener("collision", zoneHandler);
        composer.removeScene("scene1")
    end
end

function scene:destroy(event)
	local sceneGroup = self.view
end

-- Set the event listeners
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene