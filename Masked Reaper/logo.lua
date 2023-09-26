local composer = require( "composer" )
local scene = composer.newScene()

--local physics = require("physics")
--physics.pause( )
--physics.setDrawMode( "hybrid" )
--physics.setGravity( 0,0)

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight



local function gotoMenu()

	composer.gotoScene( "title", { time=100, effect="crossFade" } )
end







function scene:create( event )

	local sceneGroup = self.view




--	local title =display.newText(sceneGroup,"opening ", display.contentCenterX, centerY, native.systemFont, 20)

	local playButton = display.newText( sceneGroup, "Simple and Fun Games", centerX, centerY, "Rooters.ttf", 50 )
  playButton.alpha=0

  transition.to( playButton,{time=3000,alpha=1,xScale=1.1,yScale=1.5,onComplete=gotoMenu} )


	------------load all sound effect-----------------

--soundWalking = audio.loadSound( "sounds/walking.wav" )	
soundRunning = audio.loadSound( "sounds/running.wav" )
soundLanded = audio.loadSound( "sounds/landed.wav" )
soundHitted = audio.loadSound( "sounds/hitted.wav" )
soundDeath = audio.loadSound( "sounds/death.mp3" )

soundJump = audio.loadSound( "sounds/jump.wav" )
--soundJump2 = audio.loadSound( "sounds/jump2.wav" )
soundDashDown = audio.loadSound( "sounds/dashDown.mp3" )
soundAttack = audio.loadSound( "sounds/attack.wav" )
--soundAttack2 = audio.loadSound( "sounds/attack2.wav" )
soundAttack3 = audio.loadSound( "sounds/attack3.wav" )

soundIceBlast = audio.loadSound( "sounds/iceBlast.mp3" )
soundFireBall = audio.loadSound( "sounds/fireBall.mp3" )
soundSonicWave = audio.loadSound( "sounds/sonicWave.mp3" )

soundSlashed = audio.loadSound( "sounds/slashed.wav" )
soundVase = audio.loadSound( "sounds/vase.wav" )
soundCrate = audio.loadSound( "sounds/crate.wav" )
soundCoin = audio.loadSound( "sounds/coin.wav" )
soundGotCoin = audio.loadSound( "sounds/gotCoin.mp3" )
soundTreasure = audio.loadSound( "sounds/treasure.mp3" )

soundThrow = audio.loadSound( "sounds/throw.mp3" )
soundHood = audio.loadSound( "sounds/hood.mp3" )
soundBullet = audio.loadSound( "sounds/bullet.mp3" )
soundDash = audio.loadSound( "sounds/dash.mp3" )
soundBall = audio.loadSound( "sounds/ball.mp3" )

soundSelected = audio.loadSound( "sounds/selected.mp3" )
soundAbility = audio.loadSound( "sounds/ability.mp3" )
soundButton = audio.loadSound( "sounds/button.wav" )

soundAbsorb = audio.loadSound( "sounds/absorb.mp3" )

soundWings = audio.loadSound( "sounds/wings.mp3" )
--soundVomit = audio.loadSound( "sounds/vomit.wav" )
soundThunder = audio.loadSound( "sounds/thunder.mp3" )
soundMetal = audio.loadSound( "sounds/metal.mp3" )
soundMana = audio.loadSound( "sounds/mana.mp3" )
soundHeal = audio.loadSound( "sounds/heal.mp3" )
soundGhost = audio.loadSound( "sounds/ghost.mp3" )
soundFairy = audio.loadSound( "sounds/fairy.mp3" )
soundExplode = audio.loadSound( "sounds/explode.mp3" )
soundError = audio.loadSound( "sounds/error.mp3" )
soundBuzzing = audio.loadSound( "sounds/buzzing.mp3" )
soundBurning = audio.loadSound( "sounds/burning.mp3" )
soundBlizzard = audio.loadSound( "sounds/blizzard.mp3" )
soundFreeze = audio.loadSound( "sounds/freeze.mp3" )
soundHarpy = audio.loadSound( "sounds/harpy.mp3" )
soundCrawl = audio.loadSound( "sounds/crawl.mp3" )
soundStone = audio.loadSound( "sounds/stone.mp3" )
soundLava = audio.loadSound( "sounds/lava.mp3" )
soundDemon = audio.loadSound( "sounds/demon.mp3" )
soundEnergyBlast = audio.loadSound( "sounds/energyBlast.mp3" )
soundDrag = audio.loadSound( "sounds/drag.mp3" )
soundDying = audio.loadSound( "sounds/dying.mp3" )

soundShutter = audio.loadSound( "sounds/shutter.mp3" )



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
		--audio.stop( playMusicTrack )
		--playMusicTrack = nil
		composer.removeScene( "logo" )

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	--audio.dispose( playMusicTrack )
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