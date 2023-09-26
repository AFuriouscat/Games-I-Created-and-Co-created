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

local function gotoTitle()

	composer.gotoScene( "title", { time=50, effect="crossFade" } )

end

local function gotoGame()


	composer.gotoScene( "battle", { time=50, effect="crossFade" } )

end

local function gotoCredits()


	composer.gotoScene( "story", { time=50, effect="crossFade" } )

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

		background = display.newImageRect( uiGroup, "images/loading.png", display.actualContentWidth,display.actualContentHeight/2 )
		background.x = display.contentCenterX
		background.anchorY=1
		background.y = centerY
	
		background2 = display.newImageRect( uiGroup, "images/loading.png", display.actualContentWidth,display.actualContentHeight/2 )
		background2.x = display.contentCenterX
		background2.anchorY =1
		background2.rotation=180
		background2.y = centerY 
	
		transition.to (background, {time = 350,y = screenTop,onComplete=removeMe})
		transition.to (background2, {time = 350,y = screenBottom,onComplete=removeMe})

			------------ load the music-----------------


		local function storyTime6()

			gameStatus.isitNewGame = 1
			saveScores()

			title6 =display.newText(sceneGroup,"I'm coming for you.   Cole. ", display.contentCenterX, screenTop+550, "Rooters.ttf", 40)
			timer.performWithDelay(3000,gotoGame,1)
		end

		local function storyTime5()
			title5 =display.newText(sceneGroup,"I will make him regret what he did! ", display.contentCenterX, screenTop+475, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyTime6,1)
		end

		local function storyTime4()
			title4 =display.newText(sceneGroup,"I will make him pay! ", display.contentCenterX, screenTop+400, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyTime5,1)
			audio.play( soundThunder)
		end

		local function storyTime3()
			title3 =display.newText(sceneGroup,"After all this years of searching.", display.contentCenterX, screenTop+300, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyTime4,1)
		end

		local function storyTime2()
			title2 =display.newText(sceneGroup,"Can I finally meet him? ", display.contentCenterX, screenTop+225, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyTime3,1)
		end


		local function storyTime()
			title =display.newText(sceneGroup,"Is this really the Place? ", display.contentCenterX, screenTop+150, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyTime2,1)
		end

		------------------------------story ends------------------------
		local function storyEnd6()
			gameStatus.finishedGame = 2
			saveScores()

			title6 =display.newText(sceneGroup,"my brother and my hero", display.contentCenterX, screenTop+550, "Rooters.ttf", 40)
			timer.performWithDelay(5000,gotoGame,1)
		end

		local function storyEnd5()
			title5 =display.newText(sceneGroup,"but now you finally return", display.contentCenterX, screenTop+475, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyEnd6,1)
		end

		local function storyEnd4()
			title4 =display.newText(sceneGroup,"i did'nt realize it is'nt you", display.contentCenterX, screenTop+400, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyEnd5,1)
		end

		local function storyEnd3()
			title3 =display.newText(sceneGroup,"but then you changed and it broke my heart", display.contentCenterX, screenTop+300, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyEnd4,1)
		end

		local function storyEnd2()
			title2 =display.newText(sceneGroup,"I dreamed of being like you", display.contentCenterX, screenTop+225, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyEnd3,1)
		end


		local function storyEnd()
			title =display.newText(sceneGroup,"I always look up to you ", display.contentCenterX, screenTop+150, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyEnd2,1)
		end
		------------------

				------------------------------story credits------------------------
		local function storyCredit8()
			gameStatus.finishedGame = 3
			saveScores()
			title6 =display.newText(sceneGroup," check our social media for the latest update", display.contentCenterX, screenTop+600, "Rooters.ttf", 30)
			timer.performWithDelay(10000,gotoTitle,1)
		end

		local function storyCredit7()
			title6 =display.newText(sceneGroup," and ronald atchico for Programming", display.contentCenterX, screenTop+530, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyCredit8,1)
		end

		local function storyCredit6()
			title5 =display.newText(sceneGroup,"isiah gabriel arcos for the Art", display.contentCenterX, screenTop+470, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyCredit7,1)
		end

		local function storyCredit5()
			title5 =display.newText(sceneGroup,"who loves gaming and creating", display.contentCenterX, screenTop+410, "Rooters.ttf", 30)
			timer.performWithDelay(3000,storyCredit6,1)
		end

		local function storyCredit4()
			title4 =display.newText(sceneGroup,"this game is brought to you by 2 simple individual", display.contentCenterX, screenTop+350, "Rooters.ttf", 30)
			timer.performWithDelay(3000,storyCredit5,1)
		end

		local function storyCredit3()
			title3 =display.newText(sceneGroup,"Thank you so much for playing", display.contentCenterX, screenTop+280, "Rooters.ttf", 35)
			timer.performWithDelay(3000,storyCredit4,1)
		end

		local function storyCredit2()
			title2 =display.newText(sceneGroup,"the story will continue", display.contentCenterX, screenTop+200, "Rooters.ttf", 40)
			timer.performWithDelay(3000,storyCredit3,1)
		end


		local function storyCredit()
			title =display.newText(sceneGroup,"masked Reaper", display.contentCenterX, screenTop+100, "Rooters.ttf", 80)
			timer.performWithDelay(3000,storyCredit2,1)
		end


	if gameStatus.finishedGame==1 then
		musicTrack3 = audio.loadStream( "sounds/dark-water.mp3" )
		timer.performWithDelay(400,storyEnd,1)
	elseif gameStatus.finishedGame==3 then
		musicTrack3 = audio.loadStream( "sounds/new-life.mp3" )
		timer.performWithDelay(400,storyCredit,1)
	else
	timer.performWithDelay(400,storyTime,1)
		musicTrack3 = audio.loadStream( "sounds/dark-water.mp3" )
	end

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
		audio.play( musicTrack3, { channel=1, loops=-1 } )
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
		audio.stop(  )
		playBackgroundMusic3 = nil
		composer.removeScene( "story" )

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	audio.dispose(  )
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