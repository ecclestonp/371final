--[[
Paul Eccleston
Final Exam


I ran into some inheritance problems so I decided to only spawn 3 objects instead of the 5 you wanted.
There is also a bug where sometimes not all of the objects within Scene1's box are replicated into Scene2's box. This only occurs after the user navigates back and forth
between the scenes a few times.
--]]

local composer = require("composer")
display.setStatusBar( display.HiddenStatusBar )
composer.gotoScene("scene1")