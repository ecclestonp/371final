--[[
Paul Eccleston
--]]

local composer = require("composer")
local scene = composer.newScene()
local circle = require("circle")
local square = require("square")
local triangle = require("triangle")
local physics = require("physics")

local myCircle = composer.getVariable("myCircle")
local mySquare = composer.getVariable("mySquare")
local myTriangle = composer.getVariable("myTriangle")

function gotoScene1()
	local opt = {
		effect = "zoomInOutRotate",
		time = 500
	}
	composer.gotoScene("scene1", opt)
end

function drawBox(sceneGroup)
	rightWall = display.newRect(display.contentCenterX*(3/2),display.contentCenterY, 10, display.contentCenterY/2)
	physics.addBody (rightWall, "static", {bounce=1});

	leftWall = display.newRect(display.contentCenterX/2,display.contentCenterY, 10, display.contentCenterY/2)
	physics.addBody (leftWall, "static", {bounce=1});

	floor = display.newRect(display.contentCenterX,leftWall.y + (leftWall.height/2), display.contentCenterX, 10)
	physics.addBody (floor, "static", {bounce=1});

	ceiling = display.newRect(display.contentCenterX,leftWall.y - (leftWall.height/2), display.contentCenterX, 10)
	physics.addBody (ceiling, "static", {bounce=1});

	sceneGroup:insert(floor)
	sceneGroup:insert(ceiling)
	sceneGroup:insert(leftWall)
	sceneGroup:insert(rightWall)
end

function scene:create(event)
	local sceneGroup = self.view

	--Build menu items
	local widget = require("widget")
	local nextScene = widget.newButton({shape="roundedRect",width=display.contentCenterX/2, height=display.contentCenterY/8, cornerRadius=3, fillColor={default={1,1,1},over={.7,.7,.7}}, label="Scene 1", onRelease=gotoScene1})

	--Put items in the scene group
	sceneGroup:insert(nextScene)
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		local menuText = display.newText("Paul Eccleston Final Exam", display.contentCenterX, display.contentCenterY/7, "Bradley Hand ITC", 30)
		sceneGroup:insert(menuText)
		--menuText:setFillColor(0,0,0)
		physics.start()
		physics.setGravity(0,0)

		if myCircle.inside == 1 then
			newCircle = circle:spawn(0)
			circle.shape.x = display.contentCenterX
			circle.shape.y = display.contentCenterY
			circle.shape:setFillColor(myCircle.class.color[1], myCircle.class.color[2], myCircle.class.color[3])
			physics.addBody(circle.shape, "dynamic", {bounce=1})
			sceneGroup:insert(circle.shape)
			circle.shape:applyForce( 20, -10, circle.shape.x, circle.shape.y )
		end
		if mySquare.inside == 1 then
			newSquare = square:spawn(0)
			square.shape.x = display.contentCenterX
			square.shape.y = display.contentCenterY
			square.shape:setFillColor(mySquare.class.color[1], mySquare.class.color[2], mySquare.class.color[3])
			physics.addBody(square.shape, "dynamic", {bounce=1})
			sceneGroup:insert(square.shape)
			square.shape:applyForce( 10, 20, square.shape.x, square.shape.y )
		end
		if myTriangle.inside == 1 then
			newTriangle = triangle:spawn(0)
			triangle.shape.x = display.contentCenterX
			triangle.shape.y = display.contentCenterY
			triangle.shape:setFillColor(myTriangle.class.color[1], myTriangle.class.color[2], myTriangle.class.color[3])
			physics.addBody(triangle.shape, "dynamic", {bounce=1})
			sceneGroup:insert(triangle.shape)
			triangle.shape:applyForce( 0, -10, triangle.shape.x, triangle.shape.y )
		end
	

		drawBox(sceneGroup)

	elseif (phase == "did") then

	end
end

function scene:hide(event)
	local sceneGroup = self.view
    local phase = event.phase
    if (phase == "will") then

    elseif (phase == "did") then
    	physics.stop()
        composer.removeScene("scene2")
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