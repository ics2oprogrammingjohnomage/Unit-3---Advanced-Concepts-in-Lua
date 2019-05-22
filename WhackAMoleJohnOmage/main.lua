-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: John Omage
-- Course: ICS2O/3C
-- This program makes makes an object appear on the screen for an amount of time and 
--then disappears, if the user clicks on the object, his or her score increases by 1
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load audio
local hahaSound = audio.loadSound("Sounds/haha.mp3")
local bensoundTheme = audio.loadSound("Sounds/bensound-littleidea.mp3")

-- play backround music
audio.play(bensoundTheme)

-- Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight)

	-- Setting Color
	bkg:setFillColor( 0/255, 0/255, 255/255 )

	-- Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

-- Creating Mole
local drake = display.newImage( "Images/drake.png" , 0, 0)

	-- Setting Position
	drake.x = display.contentCenterX
	drake.y = display.contentCenterY

	-- scale down the size of the drake
	drake:scale( 1, 1 )

	-- Setting visibility
	drake.isVisible = false
	
-- create a score
local score = 0
local scoreText = display.newText("Score = 0", display.contentWidth/3, 50, nil, 50)
scoreText:setTextColor(1, 1, 1)

----------------------------------------Functions------------------------------------

-- This function that makes the drake appear in a random (x,y) position on the screen
--  before calling the Hide function
function PopUp()

	audio.play(hahaSound)
	-- Choosing random position on the screen between 0 and the size of the screen
	drake.x = math.random( 0, display.contentWidth )
	drake.y = math.random( 0, display.contentHeight )

	-- Make the drake visible
	drake.isVisible = true

	timer.performWithDelay( 1000, Hide )

	
end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- This function makes the drake invisible and then calls the PopUpDelay function
function Hide( )

	-- Changing Visibility
	drake.isVisible = false

	--call the function
	PopUpDelay()
end

-- This function starts the game
function GameStart( )
	PopUpDelay()
end

-- This function increments the score only if the drake is clicked. It then displays the
-- new score
function Whacked( event )

	-- If touch phase just started
	if (event.phase == "began") then
		score = score + 1
		scoreText.text = "Score = " .. score
		drake.isVisible = false

	end

end

----------------------------------Event Listeners-------------------------------------
-- I add the event listener to the moles so that if the drake is touched, the Whacked function 
-- is called
drake:addEventListener( "touch", Whacked )

------------------------------------Start Game----------------------------------------

GameStart()
