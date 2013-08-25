-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar(display.HiddenStatusBar) 

local background = display.newImage("background.png") 

local octohedron = display.newImage("octohedron.png", 110, 186)  
octohedron.isVisible = false

local textfield = display.newText("", 0, 0, native.systemFontBold, 14) -- Create the TextField  
textfield:setReferencePoint(display.CenterReferencePoint) -- Change reference point to center for easy positioning  
textfield.x = display.contentWidth * 0.5 -- Center TextField  
textfield.y = display.contentHeight * 0.5  
textfield:setTextColor(255, 255, 255) -- Set text color to white 

local shake = {}
local options = {"Salpica Carota", "No Estudies Tu.", "¿En Serio?", "El Puto Amo", "Eso es crema"}

function shake:accelerometer(e)
	if(e.isShake == true) then
		octohedron.isVisible = true
		--transition.from(octohedron, {alpha = 0}) -- Show octohedron, animates alpha from 0 to 1
		textfield.text = options[math.random(1, 5)] -- Selects a random sentence from the options variable
		--transition.from(textfield, {alpha = 0}) -- fades in the text
	end
end  

Runtime:addEventListener("accelerometer", shake)