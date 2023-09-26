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

local musicTrack1 = audio.loadStream( "HappyPiano.mp3" )
--audio.play( musicTrack1, { channel=3, loops=-1 } )

local function goToMenu()
	audio.pause(musicTrack1)
--	composer.removeScene( "game" )
	composer.gotoScene( "Menu", { time=500, effect="crossFade" } )
end

local function executeStage1()
	audio.pause(musicTrack1)
--	composer.removeScene( "game" )
	composer.gotoScene( "eyeWizStage", { time=500, effect="crossFade" } )

end

--local function goToHowTo()
--	composer.removeScene( "game" )
--	composer.gotoScene( "campaignMenu", { time=100, effect="crossFade" } )
--end

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

	local darkener = display.newRect (backGroup, 0, 0, display.actualContentWidth, display.contentHeight)
	darkener.y = display.contentCenterY
	darkener.x = display.contentCenterX
	darkener.alpha = 0.7
	darkener:setFillColor( 0, 0, 0 )

	local mainMenuBox = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/2.1,display.actualContentHeight/5 )
	mainMenuBox.x = display.contentCenterX
	mainMenuBox.y = screenTop + 35

	local back = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/6,display.actualContentHeight/8 )
	back.x = screenLeft + 50
	back.y = screenTop + 25

	local StageOne = display.newImageRect (sceneGroup, "images/world1.png", display.actualContentWidth/3.5, display.actualContentHeight/1.5)
	StageOne.x = display.contentCenterX
	StageOne.y = display.contentCenterY + 15

	local stageOneText =display.newText(sceneGroup,"Eye Wizard", display.contentCenterX, screenTop + 50, native.systemFont, 30)
	stageOneText.y = screenBottom - 25
	stageOneText.x = display.contentCenterX	
	
	local arrowLeft =display.newImageRect(sceneGroup,"images/arrows.png", display.contentCenterX/4, display.contentCenterY/3)
	arrowLeft.y = display.contentCenterY + 15
	arrowLeft.x = display.contentCenterX - display.contentCenterX/2
	arrowLeft.xScale = -1
	--arrowLeft.yScale = -1


	local arrowRight = display.newImageRect(sceneGroup,"images/arrows.png", display.contentCenterX/4, display.contentCenterY/3)
	arrowRight.y = display.contentCenterY + 15
	arrowRight.x = display.contentCenterX + display.contentCenterX/2

--[[
	local endlessBox = display.newImageRect( sceneGroup, "chatBox.png", display.actualContentWidth/4,display.actualContentHeight/8 )
	endlessBox.x = display.contentCenterX
	endlessBox.y = display.contentCenterY + display.contentCenterY/2
]]--
	local abilities = display.newImageRect( sceneGroup, "images/chatBox.png", display.actualContentWidth/4,display.actualContentHeight/6 )
	abilities.x = screenRight - 75
	abilities.y = screenBottom - 30

	local backText = display.newText( sceneGroup, "back", screenLeft + 50, screenTop + 25, native.systemFont, 25) 

	local title =display.newText(sceneGroup,"Endless", display.contentCenterX, screenTop + 50, native.systemFont, 40)
	title.y = screenTop + 35
	
	local abilitiesText =display.newText(sceneGroup,"Abilities", screenRight - 75, screenBottom - 30, native.systemFont, 25)

--[[
	local campaignButton = display.newText( sceneGroup, "Campaign", display.contentCenterX, display.contentCenterY + 20, native.systemFont, 20 )
	campaignButton:setFillColor( 1, 1, 1 )

	local endlessButton = display.newText( sceneGroup, "Endless", display.contentCenterX, display.contentCenterY + display.contentCenterY/2, native.systemFont, 20 )
	endlessButton:setFillColor( 1, 1, 1 )

	local howToButton = display.newText( sceneGroup, "How To Play", display.contentCenterX, display.contentCenterY + display.contentCenterY / 1.2, native.systemFont, 20 )
	howToButton:setFillColor( 1, 1, 1 )
]]--


	StageOne:addEventListener("tap", executeStage1)
	back:addEventListener( "tap", goToMenu )
--[[
	endlessButton:addEventListener( "tap",  goToEndless)
	howToButton:addEventListener( "tap",  goToHowTo)
]]--

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
		composer.removeScene( "campaignMenu" )

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