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



local function gotoTitle5()

	system.openURL( "https://www.instagram.com/a_furiouscat_does_art/" )

end

local function gotoTitle4()

	system.openURL( "https://twitter.com/FcdcIga" )

end

local function gotoTitle3()

	system.openURL( "https://twitter.com/SimpleandFunapp" )

end

local function gotoTitle2()

	system.openURL( "http://simpleandfungamesapp.blogspot.com/" )

end


local function gotoTitle()

	composer.gotoScene( "title", { time=300, effect="crossFade" } )

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

		local bg = display.newImageRect( backGroup, "images/titlebg.jpg", display.actualContentWidth,display.actualContentHeight )
		bg.x = display.contentCenterX
		bg.y = display.contentCenterY
		bg.alpha = .5



				------------------------------story credits------------------------
		local  title11 =display.newText(sceneGroup,"instagram a_furiouscat_does_art", display.contentCenterX-300, screenTop+605, "Rooters.ttf", 30)
		title11:setFillColor( .4, .4, 1 )
		title11:addEventListener( "tap", gotoTitle5)

		local title10 =display.newText(sceneGroup,"twitter @FcdcIga", display.contentCenterX-300, screenTop+565, "Rooters.ttf", 30)
		title10:setFillColor( .4, .4, 1 )
		title10:addEventListener( "tap", gotoTitle4)

		local title9 =display.newText(sceneGroup,"twitter @SimpleandFunapp", display.contentCenterX-300, screenTop+515, "Rooters.ttf", 30)
		title9:setFillColor( .4, .4, 1 )
		title9:addEventListener( "tap", gotoTitle3)

		local title8 =display.newText(sceneGroup,"simpleandfungamesapp.blogspot.com", display.contentCenterX-300, screenTop+465, "Rooters.ttf", 30)
		title8:setFillColor( .4, .4, 1)
		title8:addEventListener( "tap", gotoTitle2)

		local title7 =display.newText(sceneGroup,"Visit our social media", display.contentCenterX-300, screenTop+420, "Rooters.ttf", 35)
			
		local title6 =display.newText(sceneGroup,"simple and fun games", display.contentCenterX, screenTop+350, "Rooters.ttf", 50)
		title6:setFillColor( .8, .0, 0)

		local title6 =display.newText(sceneGroup,"publish by ", display.contentCenterX, screenTop+310, "Rooters.ttf", 35)

		local title5 =display.newText(sceneGroup,"ronald atchico", display.contentCenterX+200, screenTop+250, "Rooters.ttf", 30)
		title5:setFillColor( .8, 0, 0 )
		local title5 =display.newText(sceneGroup,"lead programmer", display.contentCenterX+200, screenTop+200, "Rooters.ttf", 35)

		local title4 =display.newText(sceneGroup,"isiah gabriel arcos", display.contentCenterX-200, screenTop+250, "Rooters.ttf", 30)
		title4:setFillColor( .8, 0, 0 )
		local title3 =display.newText(sceneGroup,"lead art director", display.contentCenterX-200, screenTop+200, "Rooters.ttf", 35)

		local title2 =display.newText(sceneGroup,"isiah gabriel arcos   &   ronald atchico", display.contentCenterX, screenTop+110, "Rooters.ttf", 45)
		title2:setFillColor( .8, 0, 0 )

		local title =display.newText(sceneGroup,"Written and directed by", display.contentCenterX, screenTop+50, "Rooters.ttf", 40)



		local titleScreen =display.newText(sceneGroup,"Back", display.contentCenterX+350, screenBottom-120, "Rooters.ttf", 80)

		titleScreen:setFillColor( 1, 0, 0 )
		titleScreen:addEventListener( "tap", gotoTitle)




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
		--playMusicTrack3 =
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

		composer.removeScene( "credits" )

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