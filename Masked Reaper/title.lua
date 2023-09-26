local composer = require( "composer" )
local scene = composer.newScene()

local physics = require("physics")
physics.start( )
--physics.setDrawMode( "hybrid" )
physics.setGravity( 0,0)

local widget = require("widget")

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight


--[[local appodeal = require( "plugin.appodeal" )

local function adListener( event )

    if ( event.phase == "init" ) then
        -- Successful initialization

    elseif ( event.phase == "failed" ) then  -- The ad failed to load
        print( event.type )
        print( event.isError )
        print( event.response )
    end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="436fbea929e6d1125a102b88f665c113ce53ec78e2d07231" } )--]]


-- Initialize variables
local json = require( "json" )

 gameStatus = {

drakzLv =1
,exp =1
,maxHp =20
,hp=20
,maxMp =10
,mp=10
,str = 5
,mag =5
,coin=10
,drakzDoubleJump = 0
,drakzFireBall =0
,drakzIceBlast =0
,drakzDashDown =0
,drakzWave =0 --sonice wave
,drakzHighJump=0   --dash up


,hpLv =1
,mpLv =1
,strLv = 1
,magLv = 1
,superFireBall =0
,superIceBlast =0
,dashDownLv =0
,sonicWaveLv=0
,highJumpLv=0
,speedBoost =0
,extraCoins=0
,magnetic =0
,rechargeMp = 0

,fireBallLv =0
,iceBlastLv =0

,stage =1
,harpyBoss =0
,fireBoss= 0
,iceBoss =0
,shovelBoss =0
,coleBoss1=0
,coleBoss2=0
,coleBoss3=0
,coleBoss4=0
,coleBoss5=0

,iceBlock5 =0
,iceBlock8 =0
,iceBlock8b =0
--,iceBlock9 =0
,iceBlock10 =0
,iceBlock10b =0
,iceBlock15 =0

,stoneBlock6 =0
,stoneBlock7 =0
,stoneBlock9 =0
,stoneBlock14 =0
,stoneBlock17 =0
,stoneBlock19 =0
,stoneBlock24 =0
,stoneBlock12 =0

,stoneBlock20 =0
,stoneBlock23 =0
,stoneBlock27 =0

,burnBlock5 =0
,burnBlock5b =0
,burnBlock13 =0
,burnBlock13b =0
,burnBlock20 =0
,burnBlock22 =0
,burnBlock28 =0
,burnBlock28b =0

,firstKillHarpy=0
,firstKillFire=0
,firstKillIce=0
,firstKillGoblin =0
,firstKillGrim =0

,chestStage1 =0
,chestStage8 =0
,chestStage9 =0
,chestStage10 =0
,chestStage13 =0
,chestStage14 =0
,chestStage5 =0
,chestStage18 =0
,chestStage20 =0
,chestStage21 =0

,puzzle1 = 0
,puzzle2 = 0
,puzzle3 = 0
,puzzle4 = 0
,puzzle5 = 0
,puzzle6 = 0

,haveHeart = 0
,iceWallisOn =0
,lavaWallisOn =0
,iceWall2isOn =1
,lavaWall2isOn =1

,isitNewGame=0
,finishedGame=0

,kills = 0
,deaths = 0
,coinCollected =0
,heartCollected =0
,stoneCollected=0
,allAbilities= 0
,maxOut=0



,UpsideDown =0
,boss6=0
,boss7= 0
,boss8=0
,boss9 =0
,boss10 =0

,extra = 0
,extra2 = 0
,extra3 = 0
,extra4 = 0
,extra5 = 0

}



 filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )


 function loadScores()

	local file = io.open( filePath, "r" )

	if file then
		local contents = file:read( "*a" )
		io.close( file )
		gameStatus = json.decode( contents )
		--itemStatus = json.decode( contents )
	end

end


 function saveScores()

	local file = io.open( filePath, "w" )

	if file then
		file:write( json.encode( gameStatus ) )
		io.close( file )
	end
end

---settings-------
--stage = 1
--fromStage= "left"
local function gotoCredit()
	transition.cancel()
--	composer.removeScene( "game" )
	composer.gotoScene( "credits", { time=10 } )
end

local function gotoGame()
	transition.cancel()
--	composer.removeScene( "game" )
	composer.gotoScene( "loading", { time=10 } )
end

--local function showAd()
--	if ( appodeal.isLoaded( "interstitial" ) ) then
--		appodeal.show( "interstitial" )
--	end
--end

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

	local background = display.newImageRect( mainGroup, "images/titlebg.jpg", display.actualContentWidth,display.actualContentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.xScale=1.2
	background.yScale=1.2

--	local background2 = display.newImageRect( sceneGroup, "images/titledrakz.png", display.actualContentWidth,display.actualContentHeight )
--	background2.x = display.contentCenterX-150
--	background2.y = display.contentCenterY+100

	local spriteOptions = {
		height = display.actualContentHeight,
		width = display.actualContentWidth,
		numFrames = 3,
		sheetContentWidth = display.actualContentWidth,
		sheetContentHeight = display.actualContentHeight*3
	  }
	  local mySheet = graphics.newImageSheet("images/titledrakz2.png", spriteOptions)
	  local sequenceData = {
		{name = "idle", start =1,count=3, time =500, loopCount =0}


	  }
	 
	
		-- Display the new sprite at the coordinates passed
		local background2 = display.newSprite(mainGroup,mySheet, sequenceData)
		background2:setSequence("idle")
		background2:play()

	background2.x = display.contentCenterX-150
	background2.y = display.contentCenterY+100


	local background3 = display.newImageRect( mainGroup, "images/titlescythe.png", display.actualContentWidth,display.actualContentHeight )
	background3.x = display.contentCenterX-200
	background3.y = display.contentCenterY+100
	background3.xScale=1.1
	background3.yScale=1.1

loadScores()
saveScores()
fairyCount = 0
treasureCount = 0
local hero


local function play()
	local playButton
	local pump
	local swing


	credit = display.newText( sceneGroup, "Credits", display.contentCenterX+210, screenBottom+100, "Rooters.ttf", 60 )
	--credit:setFillColor( 0, 0, .7 )
	credit:addEventListener( "tap", gotoCredit)

	transition.to (credit, {time = 1500,y=screenBottom-100,transition=easing.inOutElastic})


	 playButton = display.newText( sceneGroup, "Play", display.contentCenterX, screenBottom+100, "Rooters.ttf", 100 )
	playButton:setFillColor( 1, 0, 0 )
	playButton.xScale=0.1
	playButton.yScale=0.1
	playButton.alpha = 0
	playButton.x = centerX+210
	playButton.y = centerY+30
	--transition.to (playButton, {time = 500,y= centerY+200,x= centerX+250,transition=easing.inOutElastic})

	playButton:addEventListener( "tap", gotoGame )

	local function pump3()
		transition.to (playButton, {time = 500,xScale=0.95,yScale=0.95,onComplete=pump})
	end

	local function pump2()
		transition.to (playButton, {time = 200,xScale=1,yScale=1,onComplete=pump3})
	end

	 function pump()
		playButton.alpha=1
		transition.to (playButton, {time = 200,xScale=1.4,yScale=1.4,transition=easing.inOutElastic,onComplete=pump2})
	end

	pump()


end

local function titleLogo()
	local title =display.newText(sceneGroup,"Masked Reaper",screenLeft+120, screenTop-100, "Rooters.ttf", 150)
	title.anchorX =0
	title.rotation=-90
	title:setFillColor( 0,0, 0 )
	transition.to (title, {time = 750,rotation=0,y=centerY-230,transition=easing.inOutElastic,onComplete=play})
end

local function drakz()
	transition.to (background, {time = 2500,x=centerX,y=centerY,xScale = 1, yScale = 1})
	transition.to (background2, {time = 2400,x=centerX,y=centerY})
	transition.to (background3, {time = 1500,x=centerX,y=centerY,onComplete=titleLogo})
	--transition.to (background3, {time = 1000,onComplete=showAd})
end
drakz()

local function swing2()
	transition.to (background3, {time = 600,rotation =-5,onComplete=swing})
end

 function swing()
	transition.to (background3, {time = 600,rotation=5,onComplete=swing2})
end

swing()




------------ load the music-----------------
musicTrack2 = audio.loadStream( "sounds/downer-than.mp3" )




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

		--playMusicTrack2 =
		audio.play( musicTrack2, { channel=1, loops=-1 } )

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
		audio.stop()
		--playMusicTrack2 = nil
		composer.removeScene( "title" )

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	audio.dispose()
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