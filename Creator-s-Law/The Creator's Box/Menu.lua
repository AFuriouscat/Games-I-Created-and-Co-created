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

--pageFlip = audio.loadSound("PageFlipping.wav")


local function gotoCampaign()
	--audio.play (pageFlip)
--	composer.removeScene( "game" )
	composer.gotoScene( "campaignMenu", { time=500, effect="crossFade" } )
end

local function goToEndless()
--	composer.removeScene( "game" )
--	composer.gotoScene( "campaignMenu", { time=100, effect="crossFade" } )
end

local function goToHowTo()
--	composer.removeScene( "game" )
--	composer.gotoScene( "campaignMenu", { time=100, effect="crossFade" } )
end

------------------------------------------------------------



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

	local background = display.newImageRect( backGroup, "images/titlescreen1.png", display.actualContentWidth,display.actualContentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	local campaignBox = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/4,display.actualContentHeight/8 )
	campaignBox.x = display.contentCenterX
	campaignBox.y = display.contentCenterY + 20
	
	local mainMenuBox = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/1.3,display.actualContentHeight/4 )
	mainMenuBox.x = display.contentCenterX
	mainMenuBox.y = screenTop + 75

	local endlessBox = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/4,display.actualContentHeight/8 )
	endlessBox.x = display.contentCenterX
	endlessBox.y = display.contentCenterY + display.contentCenterY/2

	local howToBox = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/4,display.actualContentHeight/8 )
	howToBox.x = display.contentCenterX
	howToBox.y = display.contentCenterY + display.contentCenterY / 1.2


	local title =display.newText(sceneGroup,"Main menu", display.contentCenterX, screenTop + 75, native.systemFont, 65)

	local campaignButton = display.newText( sceneGroup, "Campaign", display.contentCenterX, display.contentCenterY + 20, native.systemFont, 20 )
	campaignButton:setFillColor( 1, 1, 1 )

	local Black = display.newRect(sceneGroup, 0, 0, display.actualContentWidth/4,display.actualContentHeight/8)
	Black:setFillColor( 0, 0, 0 )
	Black.anchorX, Black.anchorY = 0.5, 0.5
	Black.x = display.contentCenterX
	Black.y = display.contentCenterY + 20
	Black.alpha = 0.5

	local endlessButton = display.newText( sceneGroup, "Endless", display.contentCenterX, display.contentCenterY + display.contentCenterY/2, native.systemFont, 20 )
	endlessButton:setFillColor( 1, 1, 1 )

	local howToButton = display.newText( sceneGroup, "How To Play", display.contentCenterX, display.contentCenterY + display.contentCenterY / 1.2, native.systemFont, 20 )
	howToButton:setFillColor( 1, 1, 1 )

	local Black1 = display.newRect(sceneGroup, 0, 0, display.actualContentWidth/4,display.actualContentHeight/8)
	Black1:setFillColor( 0, 0, 0 )
	Black1.anchorX, Black1.anchorY = 0.5, 0.5
	Black1.x = display.contentCenterX
	Black1.y = display.contentCenterY + display.contentCenterY / 1.2
	Black1.alpha = 0.5

	local comingSoon = display.newText( sceneGroup, "Coming Soon", display.contentCenterX, display.contentCenterY + display.contentCenterY / 1.2, native.systemFont, 20 )
	comingSoon:setFillColor( 1, 1, 1 )
	
	local comingSoon1 = display.newText( sceneGroup, "Coming Soon", display.contentCenterX, display.contentCenterY + 20, native.systemFont, 20 )
	comingSoon1:setFillColor( 1, 1, 1 )

	comingSoon.alpha = 0.75
	comingSoon1.alpha = 0.75

	campaignButton:addEventListener( "tap", goToEndless )
	endlessButton:addEventListener( "tap",  gotoCampaign)
	howToButton:addEventListener( "tap",  goToHowTo)

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
		composer.removeScene( "Menu" )

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