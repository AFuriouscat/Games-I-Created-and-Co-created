local composer = require( "composer" )
local scene = composer.newScene()


local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight


local background
local background2


local function removeMe(self)
	display.remove(self)
end

local function gotoGame()
--	composer.removeScene( "game" )

	transition.cancel()
	transition.to (background2, {time = 10,onComplete=removeMe})
	transition.to (background, {time = 10,onComplete=removeMe})
	if gameStatus.isitNewGame==0 then
		composer.gotoScene( "story", { time=10 } )
	else
	composer.gotoScene( "battle", { time=400 } )
	end
end



local function shake()

	local function f()
		transition.to (backGroup, {time = 30,x = 0,onComplete = gotoGame})
	end
	local function e()
		transition.to (backGroup, {time = 30,x =  -10,onComplete = f})
	end
	local function d()
		transition.to (backGroup, {time = 30,x =  10,onComplete = e})
	end
	local function c()
		transition.to (backGroup, {time = 30,x =  -20,onComplete = d})
	end

	local function b()
		transition.to (backGroup, {time = 60,x =  80,onComplete = c})
	end

	local function a()
		transition.to (backGroup, {time = 60,x =  -40,onComplete = b})
	end
	a()


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

	 background = display.newImageRect( backGroup, "images/loading.png", display.actualContentWidth,display.actualContentHeight/2 )
	background.x = display.contentCenterX
	background.anchorY=1
	background.y = screenTop

	 background2 = display.newImageRect( backGroup, "images/loading.png", display.actualContentWidth,display.actualContentHeight/2 )
	background2.x = display.contentCenterX
	background2.anchorY =1
	background2.rotation=180
	background2.y = screenBottom 



	transition.to (background, {time = 350,y = centerY})
	transition.to (background2, {time = 350,y = centerY,onComplete=shake})


	--local title =display.newText(sceneGroup,"Loading ", display.contentCenterX, 150, native.systemFont, 65)
	local function soundE()
		audio.play( soundShutter)
	end

	timer.performWithDelay(50,soundE,1)

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
		composer.removeScene( "loading" )

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