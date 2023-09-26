local composer = require( "composer" )
local scene = composer.newScene()

--local physics = require("physics")
--physics.pause( )
--physics.setDrawMode( "hybrid" )
--physics.setGravity( 0,0)

local widget = require("widget")

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight


--local workOut = audio.loadStream ("WorkOut.Wav")
--audio.play (workOut, {channel=1, loops = -1})


--nextPage = audio.loadSound("Chest.wav")


local function gotoGame()
	--audio.pause(workOut)
	--audio.play(nextPage)
	
--	composer.removeScene( "game" )
	composer.gotoScene( "Menu", { time=500, effect="crossFade" } )
end



function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
		-- Set up display groups
		backGroup = display.newGroup()  -- Display group for the background image
		sceneGroup:insert( backGroup )  -- Insert into the scene's view group
	
		mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
		sceneGroup:insert( mainGroup )
	
		uiGroup = display.newGroup()    -- Display group for UI objects like the score
		sceneGroup:insert( uiGroup )

	local function removeMe(self)
		display.remove(self)
	end

	local function manualTransition()
		local manualTransitionBlack = display.newRect(sceneGroup, 0, 0, display.actualContentWidth, display.actualContentHeight)
		manualTransitionBlack:setFillColor( 0, 0, 0 )
		manualTransitionBlack.anchorX, manualTransitionBlack.anchorY = 0.5, 0.5
		manualTransitionBlack.x = display.contentCenterX
		manualTransitionBlack.y = display.contentCenterY
		manualTransitionBlack.alpha = 1

		transition.to(manualTransitionBlack, {time=4000, alpha=0, onComplete = removeMe})
	end

	manualTransition()

	local playButton = display.newText( sceneGroup, "Touch the screen to continue.", display.contentCenterX, screenBottom - 30, native.systemFont, 20 )
	playButton:setFillColor( 1, 1, 1 )
	playButton = 1

	local background1 = display.newImageRect( backGroup, "images/titlescreen.jpg", display.actualContentWidth,display.actualContentHeight )
	background1.x = display.contentCenterX
	background1.y = display.contentCenterY

	local titlescreenCLFirstGame = display.newImageRect (backGroup, "images/titlescreenCLFirstGame.png", display.actualContentWidth, display.contentHeight)
	titlescreenCLFirstGame.x = display.contentCenterX
	titlescreenCLFirstGame.y = display.contentCenterY

	local title = display.newImageRect (backGroup, "images/titlescreentxt.png", display.actualContentWidth, display.contentHeight)
	title.x = display.contentCenterX
	title.y = display.contentCenterY

	local chestBottom = display.newImageRect (backGroup, "images/titlescreenchestbottom.png", display.actualContentWidth, display.contentHeight)
	chestBottom.x = display.contentCenterX
	chestBottom.y = display.contentCenterY

	local chestTop = display.newImageRect (backGroup, "images/titlescreenchesttop.png", display.actualContentWidth, display.contentHeight)
	chestTop.x = display.contentCenterX
	chestTop.y = display.contentCenterY*1.4
	
	local function movingThings2()
		transition.to(title , {time = 1000, y = title.y - centerY/6} )
		transition.to(chestTop , {time = 1000, y = chestTop.y + 25} )
		--transition.to(playButton , {time = 1000, alpha = 1 } )
	end


	local function  movingThings()
		--transition.to(titlescreenCLFirstGame, {time = 2000, rotation = titlescreenCLFirstGame.rotation + 50 } )
		transition.to(title, {time = 1000, y = title.y + centerY/6, onComplete = movingThings2} )
		transition.to(chestTop, {time = 1000, y = centerY+30, onComplete = movingThings2 } )
		--transition.to(playButton, {time = 1000, playButton.alpha=0, onComplete = movingThings2} )
    end

	local function continue()
		touchScreen = display.newImageRect( backGroup, "images/titlescreen.jpg", display.actualContentWidth,display.actualContentHeight )
		touchScreen.x = display.contentCenterX
		touchScreen.y = display.contentCenterY
		touchScreen.alpha = 0.01
		touchScreen:addEventListener( "tap", gotoGame )
	end

	transition.to(background1, {time = 2000, onComplete = continue, now})

	
	timer.performWithDelay(2000, movingThings, 0)

end

-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		-- Start the music!

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		-- Stop the music!
		composer.removeScene( "titleScreen" )

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene