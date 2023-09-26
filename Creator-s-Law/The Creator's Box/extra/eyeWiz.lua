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

--physics
local physics = require("physics")
--physics.pause( )
physics.start( )
physics.setDrawMode( "hybrid" )
physics.setGravity( 0,100)

--loading Sounds

--eyeLightSoung = audio.loadSound("Shing.wav")
--rocketExplode = audio.loadSound("Small Explosion.wav")
--discWhoosh = audio.loadSound("Whoosh.flac")
--rocketWhoosh = audio.loadSound("WhooshAgain.wav")



--Transitions
local function 	goBackToCampaignMenu()
--	composer.removeScene( "game" )
	composer.gotoScene( "campaignMenu", { time=100, effect="crossFade" } )
end



--Starting the game
--local function startGame()
	--[[

	audio.fadeOut( {channel = 4, time = 1000})

	local skater = audio.loadStream ("Skater.mp3")
	audio.play(skater, {channel = 2, loops = -1})

	--audio.setMaxVolume( 0.5, { channel=2 } )

	local metal = audio.loadStream ("MetalLoop.wav")
	audio.play(metal, {channel = 2, loops = -1})	
	
	]]--
--	physics.start()

	--------------------------------------------------------------------------------------------
	--Backgrounds
	--------------------------------------------------------------------------------------------
	
--	local function Backgroundss()

		function removeMe(self)
			display.remove(self)
		end

		function manualTransition()
			local manualTransitionBlack = display.newRect(uiGroup, 0, 0, display.actualContentWidth, display.actualContentHeight)
			manualTransitionBlack:setFillColor( 0, 0, 0 )
			manualTransitionBlack.anchorX, manualTransitionBlack.anchorY = 0.5, 0.5
			manualTransitionBlack.x = display.contentCenterX
			manualTransitionBlack.y = display.contentCenterY
			manualTransitionBlack.alpha = 1

			transition.to(manualTransitionBlack, {time=4000, alpha=0, onComplete = removeMe})
		end
		
		manualTransition()

		local sunBackground = display.newImageRect(backGroup, "images/sunBackground.png", display.actualContentWidth, display.contentHeight)
		sunBackground.x = display.contentCenterX
		sunBackground.y = display.contentCenterY
	
		local farMountains = display.newImageRect(backGroup, "images/mountainsFarBackground.png", display.contentWidth + display.contentWidth/2, display.contentHeight)
		farMountains.anchorX, farMountains.anchorY = 0, 1
		farMountains.x = screenLeft 
		farMountains.y = screenBottom
		farMountains.speed = 0.5
		
		local farMountains1 = display.newImageRect(backGroup, "images/mountainsFarBackground.png", display.contentWidth + display.contentWidth/2, display.contentHeight)
		farMountains1.anchorX, farMountains1.anchorY = 0, 1
		farMountains1.x = screenLeft + farMountains.width 
		farMountains1.y = screenBottom
		farMountains1.speed = 0.5
	
		local cloudsBackground = display.newImageRect(backGroup, "images/clouds.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)	
		cloudsBackground.x = screenLeft
		cloudsBackground.y = screenBottom
		cloudsBackground.anchorX = 0
		cloudsBackground.anchorY = 1
		cloudsBackground.speed = 0.75
	
		local cloudsBackground1 = display.newImageRect(backGroup, "images/clouds.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)	
		cloudsBackground1.x = screenLeft + cloudsBackground.width
		cloudsBackground1.y = screenBottom
		cloudsBackground1.anchorX = 0
		cloudsBackground1.anchorY = 1
		cloudsBackground1.speed = 0.75
	
		local mountains = display.newImageRect(backGroup, "images/mountainsBackground.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		mountains.x = screenLeft
		mountains.y = screenBottom
		mountains.anchorX = 0
		mountains.anchorY = 1
		mountains.speed = 1
	
		local mountains1 = display.newImageRect(backGroup, "images/mountainsBackground.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		mountains1.x = screenLeft + mountains.width
		mountains1.y = screenBottom
		mountains1.anchorX = 0
		mountains1.anchorY = 1
		mountains1.speed = 1
	
		local cloudsNear = display.newImageRect(backGroup, "images/clouds.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		cloudsNear.x = screenLeft
		cloudsNear.y = screenBottom/1.5
		cloudsNear.anchorX = 0
		cloudsNear.anchorY = 1
		cloudsNear.speed = 1.5
		cloudsNear.alpha = 0.7
	
		local cloudsNear1 = display.newImageRect(backGroup, "images/clouds.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		cloudsNear1.x = screenLeft + cloudsNear.width
		cloudsNear1.y = screenBottom
		cloudsNear1.anchorX = 0
		cloudsNear1.anchorY = 1
		cloudsNear1.speed = 1.5
		cloudsNear1.alpha = 0.75
	
		local ranges = display.newImageRect(backGroup, "images/rockyRanges.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		ranges.x = screenLeft
		ranges.y = screenBottom
		ranges.anchorX = 0
		ranges.anchorY = 1
		ranges.speed = 2
	
		local ranges1 = display.newImageRect(backGroup, "images/rockyRanges.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		ranges1.x = screenLeft + ranges.width
		ranges1.y = screenBottom
		ranges1.anchorX = 0
		ranges1.anchorY = 1
		ranges1.speed = 2
	
		local hills = display.newImageRect(backGroup, "images/hills.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		hills.x = screenLeft
		hills.y = screenBottom
		hills.anchorX = 0
		hills.anchorY = 1
		hills.speed = 4
	
		local hills1 = display.newImageRect(backGroup, "images/hills.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		hills1.x = screenLeft + hills.width
		hills1.y = screenBottom
		hills1.anchorX = 0
		hills1.anchorY = 1
		hills1.speed = 4
	
		local rockyHills = display.newImageRect(backGroup, "images/rockyHills.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		rockyHills.x = screenLeft
		rockyHills.y = screenBottom
		rockyHills.anchorX = 0
		rockyHills.anchorY = 1
		rockyHills.speed = 7
	
		local rockyHills1 = display.newImageRect(backGroup, "images/rockyHills.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		rockyHills1.x = screenLeft + rockyHills.width 
		rockyHills1.y = screenBottom
		rockyHills1.anchorX = 0
		rockyHills1.anchorY = 1
		rockyHills1.speed = 7
	
		local grassyPlane = display.newImageRect(backGroup, "images/plane.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		grassyPlane.x = screenLeft
		grassyPlane.y = screenBottom
		grassyPlane.anchorX = 0
		grassyPlane.anchorY = 1	
		grassyPlane.speed = 8
	
		local grassyPlane1 = display.newImageRect(backGroup, "images/plane.png", display.actualContentWidth + display.contentWidth/2, display.actualContentHeight)
		grassyPlane1.x = screenLeft + grassyPlane.width
		grassyPlane1.y = screenBottom
		grassyPlane1.anchorX = 0
		grassyPlane1.anchorY = 1
		grassyPlane1.speed = 8
	
		--------------------------------------------------------------------------------------------
		--Things That Make The Background Move
		--------------------------------------------------------------------------------------------
											   --[[
		

												local function bgMovements (self,event)
													if (isYesOptionClicked == true) then

													else

													if (isYesOptionClicked == false) then
														if(self.x < -self.width-70)then
															self.x = self.width-85
														else
															self.x = self.x - self.speed
														end
													end
													end
												end
	
												farMountains.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", farMountains)
	
												farMountains1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", farMountains1)
	
												cloudsBackground.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", cloudsBackground)
	
												cloudsBackground1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", cloudsBackground1)
	
												mountains.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", mountains)
		
												mountains1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", mountains1)
		
												cloudsNear1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", cloudsNear1)
			
												cloudsNear.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", cloudsNear)
		
												ranges.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", ranges)
		
												ranges1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", ranges1)
		
												hills.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", hills)
		
												hills1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", hills1)
		
												rockyHills.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", rockyHills)
		
												rockyHills1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", rockyHills1)
		
												grassyPlane.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", grassyPlane)
	
												grassyPlane1.enterFrame = bgMovements
												Runtime:addEventListener("enterFrame", grassyPlane1)
											   ]]--Extra Stuffs

		isYesOptionClicked = false

		function bgMovements (self,event)
			if (isYesOptionClicked == true) then

			else

			if (isYesOptionClicked == false) then
				if(self.x < -self.width-70)then
					self.x = self.width-85
				else
					self.x = self.x - self.speed
				end
			end
			end
		end
		
		farMountains.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", farMountains)
	
		farMountains1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", farMountains1)
		
		cloudsBackground.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", cloudsBackground)

		cloudsBackground1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", cloudsBackground1)

		mountains.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", mountains)
	
		mountains1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", mountains1)
	
		cloudsNear1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", cloudsNear1)
		
		cloudsNear.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", cloudsNear)

		ranges.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", ranges)
	
		ranges1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", ranges1)
	
		hills.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", hills)
		
		hills1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", hills1)
	
		rockyHills.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", rockyHills)
	
		rockyHills1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", rockyHills1)
	
		grassyPlane.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", grassyPlane)
	
		grassyPlane1.enterFrame = bgMovements
		Runtime:addEventListener("enterFrame", grassyPlane1)

		local function UIs ()
				blueRect = display.newRect(uiGroup, 0, 0, display.actualContentWidth/16, display.actualContentHeight/10)
				blueRect.x = screenLeft + centerX/6.25
				blueRect.y = screenTop + centerY/8
				blueRect.anchorX, blueRect.anchorY = 0, 0

				local pandorasBoxFill = display.newImageRect (uiGroup, "images/Creator's Box.png", display.contentCenterX/1.1, display.contentCenterY/2.1)
				pandorasBoxFill.x = screenLeft
				pandorasBoxFill.y = screenTop
				pandorasBoxFill.anchorX, pandorasBoxFill.anchorY = 0, 0

				boxX = display.contentCenterX/6
				boxY = display.contentCenterY/4

				pause = display.newImageRect (uiGroup, "images/pause.png", boxX, boxY)
				pause.anchorX, pause.anchorY = 1, 0
				pause.x = screenRight - 10
				pause.y = screenTop + 10
				pause.xScale = 0.75
				pause.yScale = 0.75
		
				local abilityHolder = display.newImageRect(uiGroup, "images/abilityHolder.png", boxX , boxY)
				abilityHolder.anchorX, abilityHolder.anchorY = 1 , 1
				abilityHolder.x = screenRight
				abilityHolder.y = screenBottom
				abilityHolder.xScale = 1.5
				abilityHolder.yScale = 1.5
			
				local abilityHolder1 = display.newImageRect(uiGroup, "images/abilityHolder.png", boxX , boxY)
				abilityHolder1.anchorX, abilityHolder1.anchorY = 1 , 1
				abilityHolder1.x = screenRight - abilityHolder.width - abilityHolder.width/2
				abilityHolder1.y = screenBottom
				abilityHolder1.xScale = 1.5
				abilityHolder1.yScale = 1.5
		
				pause:addEventListener ("tap", pauseMenu)
		end
				timer.performWithDelay(3000, UIs, 1)
--	end
	--timer.performWithDelay(1000, makeBGMove, 1)
--	Backgroundss()
	
	--------------------------------------------------------------------------------------------
	--characters and what will they do
	--------------------------------------------------------------------------------------------

	--[[

	local function characters ()

		local function createHero()

			local sheetData = {
			 width = 210,
			 height = 175,
			 numFrames = 6,
			 sheetContentWidth=630,
			 sheetContentHeight=350
    
			}
    
			local heroSheet = graphics.newImageSheet( "images/heroSprite.png",sheetData )
    
			local sequenceData = {
			 {name = "flying", frames = {1, 2, 3, 2} , time =400, loopCount =0},
				{name = "capture", start =4, count=3, time =400, loopCount =1},
			}
    
			 hero = display.newSprite(mainGroup, heroSheet,sequenceData )


			hero.spd = 30
			hero.name = "Protagonist"

			hero.x = screenLeft - hero.width
			hero.y = centerY
		
			hero.xScale = 0.5
			hero.yScale = 0.5

			hero:setSequence("flying")
			hero:play()
		end	
	
		local function createEnemy()

			local sheetData = {
			width = 294,
			height = 263,
			numFrames = 24,
			sheetContentWidth=1764,
			sheetContentHeight=1052
    
			}
    
			local enemySheet = graphics.newImageSheet( "images/Eyeboss1.png",sheetData )
    
			local sequenceData = {
			 {name = "flying", start = 1 , count = 24, time =1000, loopCount =0},
			}
    
			 eyeWizard = display.newSprite(mainGroup, enemySheet,sequenceData )


			eyeWizard.spd = 30

			eyeWizard.x = screenRight + eyeWizard.width
			eyeWizard.y = centerY
		
			eyeWizard.xScale = 0.5
			eyeWizard.yScale = 0.5

			eyeWizard:setSequence("flying")
			eyeWizard:play()
		end

		createEnemy()
		createHero()

		--------------------------------------------------------------------------------------------
		--Chacters Enter Frame and Starts the fight
		--------------------------------------------------------------------------------------------
	
		local function preFight ()
			transition.to(hero, {time = 2000, x = screenLeft +  hero.width/3})
			transition.to(eyeWizard, {time=2000, x = screenRight - eyeWizard.width/3})

			local function begin ()
				local begin = display.newText(uiGroup, "Begin!", display.contentCenterX, display.contentCenterY, native.systemFont, 50)
				transition.to(begin, {time = 500, xScale = 2, yScale = 2, onComplete = removeMe})
			end

			local function ready()
				local ready = display.newText(uiGroup, "Ready?", display.contentCenterX, display.contentCenterY, native.systemFont, 50)
				transition.to(ready, {time = 1000, xScale = 2, yScale = 2, onComplete = begin})
				transition.to(ready, {time = 1000, alpha=0, onComplete = removeMe})
			end
		
			timer.performWithDelay( 2000, ready, 1)

			--------------------------------------------------------------------------------------------
			--eyeWiz's Eyelights
			--------------------------------------------------------------------------------------------	

			eyeWithEyeLights = display.newGroup(mainGroup)
			gravity = display.newImageRect (mainGroup, "images/gravity.png", boxX, boxY)
			spikyDiscTime = display.newImageRect (mainGroup, "images/spikyDiscTime.png", boxX, boxY)
			rocketTime = display.newImageRect (mainGroup, "images/rocketTime.png", boxX, boxY)

			gravity.y = eyeWizard.y
			gravity.x = eyeWizard.x

			spikyDiscTime.y = eyeWizard.y
			spikyDiscTime.x = eyeWizard.x

			rocketTime.y = eyeWizard.y
			rocketTime.x = eyeWizard.x
		
			eyeWithEyeLights:insert(eyeWizard)
			eyeWithEyeLights:insert(gravity)
			eyeWithEyeLights:insert(spikyDiscTime)
			eyeWithEyeLights:insert(rocketTime)

			gravity.alpha = 0
			spikyDiscTime.alpha = 0
			rocketTime.alpha = 0
			
			--------------------------------------------------------------------------------------------
			--The controls
			--------------------------------------------------------------------------------------------
			
			local function heroControl()
		
				isMoving = false

				local pentagonShape = { 15,-37, 37,-10, 33,34, -23,34 }
				physics.addBody ( hero, "dynamic", { density=25, friction=10, shape=pentagonShape})
				hero.gravityScale = 0

				local cage1 = display.newRect(mainGroup, 0, 0, display.actualContentWidth*1.5, display.contentHeight/4)
				cage1.anchorX, cage1.anchorY = 0.5, 0
				cage1.x = centerX
				cage1.y = screenTop - centerY/2

				isAttackOne = false

				cage2 = display.newRect(mainGroup, 0, 0, display.actualContentWidth*1.5, display.contentHeight/4)
				cage2.anchorX, cage2.anchorY = 0.5, 1
				cage2.x = centerX
				cage2.y = screenBottom + centerY/2.5
				cage2.alpha = 0
				cage2.name = "floor"

				function beSureOnAttack1 ()
					if (isAttackOne == true) then
						transition.to (cage1, {time=100, y = cage1.y - 500})
					end
				end

				timer.performWithDelay(1000, beSureOnAttack1, 0)

				local cage3 = display.newRect(mainGroup, 0, 0, display.actualContentWidth/4, display.contentHeight*1.5)
				cage3.anchorX, cage3.anchorY = 0, 0.5
				cage3.x = screenRight
				cage3.y = centerY

				local cage4 = display.newRect(mainGroup, 0, 0, display.actualContentWidth/4, display.contentHeight*1.5)
				cage4.anchorX, cage4.anchorY = 1, 0.5
				cage4.x = screenLeft
				cage4.y = centerY 

				physics.addBody ( cage1, "static", {density=100})
				physics.addBody ( cage2, "static", {density=100})
				physics.addBody ( cage3, "static", {density=100})
				physics.addBody ( cage4, "static", {density=100})

				controler = display.newRect(uiGroup, 0, 0, display.actualContentWidth, display.actualContentHeight)
				--controler:setFillColor( 0, 0, 0 )
				controler.anchorX, controler.anchorY = 0.5, 0.5
				controler.x = display.contentCenterX
				controler.y = display.contentCenterY
				controler.alpha = 0.01
		
				local function startingControl()

					function control(event)
						display.remove(stoph)

						if ( event.phase == "began" ) then	
							
							transition.to(hero, {time = 500, x = event.x, y = event.y})

							isMoving = false

						elseif ( event.phase == "moved" ) then
							
							transition.to(hero, {time = 10, x = event.x, y = event.y + centerY/5})
							hero.rotation = 0
							isMoving = true
				
						elseif ( event.phase == "ended" ) then

							--print( "touch ended on object " .. tostring(event.target) )
							isMoving = false
						end
						--return true 
					end
					controler:addEventListener("touch", control)
				end
				timer.performWithDelay(500, startingControl, 1)
			end
			heroControl()
		end
		preFight()
	end

	characters()

	]]--

	--------------------------------------------------------------------------------------------
	--The Pause Menu
	--------------------------------------------------------------------------------------------

	--function pauseMenu()
		local pauseMenu = display.newImageRect(mainGroup, "images/controllerpauseMenu.png", display.contentWidth/1.5, display.contentHeight*0.65)
		pauseMenu.x = centerX 
		pauseMenu.y = centerY 
		
		local resumeGame = display.newImageRect(mainGroup, "images/controllerchatBox.png", display.contentWidth/2.5, display.contentHeight*0.15)
		resumeGame.x = centerX
		resumeGame.y = centerY - centerY / 3	
		
		local resumeGametxt = display.newText(mainGroup, "Resume Game", 0, 0, native.systemFont, 16)
		resumeGametxt.x = centerX
		resumeGametxt.y = centerY - centerY / 3
		
		local pauseGame = display.newImageRect(mainGroup, "images/controllerchatBox.png", display.contentWidth/2.5, display.contentHeight*0.15)
		pauseGame.x = centerX
		pauseGame.y = centerY 		
		
		local pauseGametxt = display.newText(mainGroup, "Settings", 0, 0, native.systemFont, 16)
		pauseGametxt.x = centerX
		pauseGametxt.y = centerY 

		local quitGame = display.newImageRect(mainGroup, "images/controllerchatBox.png", display.contentWidth/2.5, display.contentHeight*0.15)
		quitGame.x = centerX
		quitGame.y = centerY + centerY /3		
		
		local quitGametxt = display.newText(mainGroup, "Quit Game", 0, 0, native.systemFont, 16)
		quitGametxt.x = centerX
		quitGametxt.y = centerY + centerY / 3

		--[[
		local resumeGame = display.newImageRect(uiGroup, "chatBox.png", display.contentWidth/2.5, display.contentHeight*0.25)
		.x = centerX
		.y = centerY		
		]]--

		local function resumeGamer()
			display.remove(pauseMenu)
			display.remove(resumeGame)
			display.remove(resumeGametxt)
			display.remove(pauseGame)
			display.remove(pauseGametxt)
			display.remove(quitGame)
			display.remove(quitGametxt)
		end	

		local function quitGamer()
			physics.pause()
			display.remove(pauseMenu)
			display.remove(resumeGame)
			display.remove(resumeGametxt)
			display.remove(pauseGame)
			display.remove(pauseGametxt)
			display.remove(quitGame)
			display.remove(quitGametxt)

			local noQuit = display.newImageRect(mainGroup, "images/controllerchatBox.png", display.contentWidth/4.5, display.contentHeight*0.15)
			noQuit.x = centerX + centerX/3
			noQuit.y = centerY 
			
			local yesQuit = display.newImageRect(mainGroup, "images/controllerchatBox.png", display.contentWidth/4.5, display.contentHeight*0.15)
			yesQuit.x = centerX - centerX/3
			yesQuit.y = centerY 		
		
			local yestxt = display.newText(mainGroup, "Yes", 0, 0, native.systemFont, 16)
			yestxt.x = centerX - centerX/3
			yestxt.y = centerY 
		
			local notxt = display.newText(mainGroup, "NO", 0, 0, native.systemFont, 16)
			notxt.x = centerX + centerX/3
			notxt.y = centerY 

			local function noOption()
				display.remove(noQuit)
				display.remove(yesQuit)
				display.remove(yestxt)
				display.remove(notxt)
			end

			local function yesOption()
				display.remove(hero)
				display.remove(eyeWizard)
				display.remove(noQuit)
				display.remove(yesQuit)
				display.remove(yestxt)
				display.remove(notxt)

				isYesOptionClicked = true

				Runtime:removeEventListener("enterFrame", farMountains)
				Runtime:removeEventListener("enterFrame", farMountains1)
				Runtime:removeEventListener("enterFrame", cloudsBackground)
				Runtime:removeEventListener("enterFrame", cloudsBackground1)
				Runtime:removeEventListener("enterFrame", mountains)
				Runtime:removeEventListener("enterFrame", mountains1)
				Runtime:removeEventListener("enterFrame", cloudsNear1)
				Runtime:removeEventListener("enterFrame", cloudsNear)
				Runtime:removeEventListener("enterFrame", ranges)
				Runtime:removeEventListener("enterFrame", ranges1)
				Runtime:removeEventListener("enterFrame", hills)
				Runtime:removeEventListener("enterFrame", hills1)
				Runtime:removeEventListener("enterFrame", rockyHills)
				Runtime:removeEventListener("enterFrame", rockyHills1)
				Runtime:removeEventListener("enterFrame", grassyPlane)
				Runtime:removeEventListener("enterFrame", grassyPlane1)
				hero:removeEventListener( "collision",collisionChecker )

				--display.remove(cage1)
				--display.remove(cage2)
				--display.remove(cage3)
				--display.remove(cage4)
				--display.remove(Backgroundss)
				goBackToCampaignMenu()
			end

			notxt:addEventListener("tap", noOption)
			yestxt:addEventListener("tap", yesOption)
			noQuit:addEventListener("tap", noOption)
			yesQuit:addEventListener("tap", yesOption)
	
		end

		resumeGametxt:addEventListener("tap", resumeGamer)
		quitGametxt:addEventListener("tap", quitGamer)
	--end
--end

--local function theAttacks()
	if (hero.y <= screenTop - 20) then
		hero.y = screenBottom - 50
	end

	score = 0
	scoreText = display.newText(uiGroup, "Score: "..score, display.contentCenterX, screenTop+20, native.systemFont,20)
	isGameOver = false
	local function transitioningEye()
		transition.to(eyeWithEyeLights, {time = 500, y = math.random(-75, 50)})
	end

	timer.performWithDelay(1000, transitioningEye,0)
------------------------------------------------------------------------------------------------------
	local function attack1()
		
		--score
		isGameOver = false
		alivent = false

		--ball jumping


		local function collisionChecker(event)

			local me = event.target
			-- local bullet = event.other
			if ( event.phase == "began" ) then

			elseif ( event.phase == "ended" ) then

				if   ( ( me.name == "Protagonist" and event.other.name == "floor"  ))  then
				-- if wheel.touchFloor == false then
  
				hero.touchFloor =true
				
				--- end
  
				end
    
			end
		end

		hero:addEventListener( "collision",collisionChecker )

		local function removeRockets(self)
			display.remove(self)
			if (alivent == false) then
				score = score + 100
				scoreText.text = ("Score: "..score)
			end

			print(score)
		end

		function alivent(self)
			transition.to(self, {time = 10, x = self.x - 1000})
			alivent = true
		end


		local function gameOver(event)
			local me = event.target

			if   ( ( me.name == "explode" and event.other.name == "Protagonist"  ))  then
				print("explode")
				display.remove(me)
				transition.to(hero,{time=300,xScale =4,yScale=4, onComplete = alivent})
			   
				local insult = display.newText(uiGroup, "Game Over", centerX,centerY, native.systemFont, 40 )
				isGameOver = true


				hero:removeEventListener( "collision",collisionChecker )
				controler:removeEventListener("touch", control)
				display.remove(Controller)
				display.remove(originOfController)
			end
		end
		
		--boom 

		local function boom(me)

			physics.addBody ( me, "dynamic", { bounce=0, radius=20,density=math.random(10,20),friction=10, isSensor = false  })

			transition.to(me,{time=500,x=me.x-display.contentWidth,xScale =2.5,yScale=2.5,onComplete = removeRockets})

			me:addEventListener( "collision",gameOver )

		end

			--exploding missiles

		local function exploding(event)

			local me = event.target
			-- local bullet = event.other

			if   ( ( me.name == "bomb" and event.other.name == "floor"  ))  then
				-- if wheel.touchFloor == false then

				--[[local sheetData1 = {
				width = 250,
				height = 250,
				numFrames = 4,
				sheetContentWidth=500,
				sheetContentHeight=500
    
				}
    
				local fireSprite = graphics.newImageSheet( "fireSprite.png",sheetData1 )
    
				local sequenceData1 = {
				 {name = "fire", frames = {1, 2, 3, 4} , time 300, loopCount =0},
				}}
    
				 explode = display.newSprite(mainGroup, fireSprite,sequenceData1 )

				explode.xScale = 0.5
				explode.yScale = 0.5

				explode:setSequence("fire")
				explode:play()]]--
				
				audio.play(rocketExplode)

				local explode = display.newImageRect(mainGroup, "explode.png", 30,30 )

				explode.x = me.x-10
				explode.y = me.y+10
				explode.anchorY = .8
				explode.name="explode"

				display.remove (me)

				countExplode = countExplode + 1

				transition.to(explode,{time=20,onComplete = boom})
			end
		end
		

		--missiles
		local function shoot()

			Rocket = display.newImageRect(mainGroup, "Rocket.png", 30,50 )
			Rocket.x = centerX + math.random(50,screenRight - 10)
			Rocket.y = centerY 
			Rocket.name="bomb"
			transition.to(Rocket,{time=600,rotation = 180})
 
			physics.addBody ( Rocket, "dynamic", { bounce=0, radius=10,density=math.random(9,25),friction=10, isSensor = false  })
  
			audio.play(rocketWhoosh)

			local vx = math.random(-100,100)
			local vy = Rocket:getLinearVelocity()
			Rocket:setLinearVelocity( vx, 0 )
			Rocket:applyLinearImpulse( nil, -200, Rocket.x, Rocket.y )
			Rocket:addEventListener( "collision",exploding )
				

			print (countExplode)
			if (countExplode >=17) then
				transition.to (gravity, {time = 500, alpha=0})
				countExplode = 0 
			end
		end

		countExplode = 0	
		local rocketTime = display.newText (uiGroup, "Rocket Time!", centerX,centerY, native.systemFont, 40 )
		
		transition.to(rocketTime, {time = 1000, onComplete = removeMe})

		transition.to(gravity, {time = 500, xScale = 5, yScale = 5, alpha = 0.75})

		hero.gravityScale = 0.1
		--cage1
		isAttackOne = true

		timer.performWithDelay( 1000,shoot,18)
	end
------------------------------------------------------------------------------------------------------
	local function attack2()

		--score
		
		--score = 0
		--scoreText = display.newText("Score: "..score, screenLeft+100, screenTop+50, native.systemFont,20)

		--ball jumping

		 function removeMe12(self)
			if isGameOver==false then
				  score = score + 100

				  --scoreText.text = ("Score: "..score)
				  --print("addscore")
			  end
			display.remove(self)
			print(score)
			scoreText.text = ("Score: "..score)
		 end

		local function gameOver(event)
		  local me = event.target

		  if   ( ( me.name == "Wheel2" and event.other.name == "Protagonist"  ))  then
			print("sliced")
			display.remove(me)
			transition.to(ball,{time=300,xScale =4,yScale=4,onComplete = removeMe12})
    
			local insult = display.newText(uiGroup, "Game Over", centerX,centerY, native.systemFont, 40 )
			isGameOver = true

			controler:removeEventListener("touch", control)
			display.remove(Controller)
			display.remove(originOfController)

			transition.to (hero, {time =20, x = hero.x - display.contentWidth})

			--Runtime:removeEventListener( "touch", wheelJump )
		  end

		end

		 --boom 
		 
		local function wheelMove(self)

		  audio.play(discWhoosh)

		  transition.to(self ,{time=500, x = self.x - display.contentWidth, onComplete = removeMe12})
		  --me:applyLinearImpulse( -600, nil, me.x, me.y )

		  self:addEventListener( "collision",gameOver )

		end

		--missiles
		local function shoot()

			local sheetData = {
			 width = 134.5,
			 height = 38,
			 numFrames = 24,
			 sheetContentWidth=809,
			 sheetContentHeight=154
    
			}
    
			local mySheet = graphics.newImageSheet( "wheel2.png",sheetData )
    
			local sequenceData = {
			 {name = "spinner", start =1,count=24, time =1200, loopCount =0},
			}
    
			 wheel2 = display.newSprite(mainGroup, mySheet,sequenceData )

			wheel2:setSequence("spinner")
			wheel2:play()

			 wheel2.x = centerX + centerX/1.2
			 wheel2.y = math.random(50,400)
			 --wheel2.name="bomb"


			 physics.addBody ( wheel2, "dynamic", { bounce=0 ,density=math.random(9,25), friction=10, isSensor = false  })
			wheel2.gravityScale = 0
			wheel2.name = "Wheel2"			
			transition.to ( wheel2, {time=500, onComplete = wheelMove})

			wheelCount = wheelCount + 1

			if (wheelCount >= 35) then
				wheelCount = 0 
				transition.to(spikyDiscTime, {time = 500, alpha=0})
			end

			-- wheel2:addEventListener( "collision",exploding )
		end



		wheelCount = 0

		local horizontalWheelTime = display.newText(uiGroup, "Horizontal Wheel Time!", centerX,centerY, native.systemFont, 40 )
		
		transition.to (horizontalWheelTime, {time = 1000, alpha=0, onComplete = removeMe})
		transition.to (spikyDiscTime, {time = 100, alpha=0.75})

		timer.performWithDelay( 500,shoot,36)	
	end
------------------------------------------------------------------------------------------------------
	local function attack3()
	
		--score
		--score = 0
	
		--ball jumping

		 function removeMe11(self)
		  if isGameOver==false then
			  score = score + 100

			  --scoreText.text = ("Score: "..score)
			  --print("addscore")
		  end
			  display.remove(self)
			  print(score)
			  scoreText.text = ("Score: "..score)
		 end

		local function gameOver(event)
		  local me = event.target

		  if   ( ( me.name == "Wheel1" and event.other.name == "Protagonist"  ))  then
			print("sliced")
			display.remove(me)
			transition.to(ball,{time=300,xScale =4,yScale=4,onComplete = removeMe11})
    
			local insult = display.newText(uiGroup, "Game Over", centerX,centerY, native.systemFont, 40 )
			isGameOver = true

			controler:removeEventListener("touch", control)
			display.remove(Controller)
			display.remove(originOfController)

			transition.to (hero, {time =20, x = hero.x - display.actualContentWidth})

			--Runtime:removeEventListener( "touch", wheelJump )
		  end

		end

		 --boom 
		 
		local function wheelMove(self)

		  audio.play(discWhoosh)

		  transition.to(self ,{time=750, x = self.x - display.contentWidth, y = wheel1.y + math.random (-100, 100), onComplete = removeMe11})
		  --me:applyLinearImpulse( -600, nil, me.x, me.y )

		  self:addEventListener( "collision",gameOver )

		end
		
		
		--missiles
		local function shoot()

			local sheetData = {
			 width = 105,
			 height = 105,
			 numFrames = 24,
			 sheetContentWidth=633,
			 sheetContentHeight=422
    
			}
    
			local mySheet = graphics.newImageSheet( "wheel.png",sheetData )
    
			local sequenceData = {
			 {name = "spinner", start =1,count=24, time =1200, loopCount =0},
			}
    
			 wheel1 = display.newSprite(mainGroup, mySheet,sequenceData )

			wheel1:setSequence("spinner")
			wheel1:play()

			 wheel1.x = centerX + centerX
			 wheel1.y = math.random(50,400)
			 --wheel2.name="bomb"


			 physics.addBody ( wheel1, "dynamic", { bounce=1 ,radius = 52.5, density=math.random(9,25), friction=10, isSensor = false  })
			wheel1.gravityScale = 1
			wheel1.name = "Wheel1"			
			wheel1.xScale = -1
			
			transition.to ( wheel1, {time=500, onComplete = wheelMove})

			wheelCountV = wheelCountV + 1

			if (wheelCountV >= 17) then
				wheelCountV = 0 
				transition.to(spikyDiscTime, {time = 500, alpha=0})
			end

			-- wheel2:addEventListener( "collision",exploding )
		end
		wheelCountV = 0

		local verticalWheelTime = display.newText(uiGroup, "Vertical Wheel Time!", centerX,centerY, native.systemFont, 40 )
		
		transition.to (verticalWheelTime, {time = 1000, alpha=0, onComplete = removeMe})
		transition.to (spikyDiscTime, {time = 100, alpha=0.75})

		timer.performWithDelay( 1000,shoot,18)	
	end
------------------------------------------------------------------------------------------------------
--[[
	local function pickAttack ()
		whichAttack = math.random(1,3)
		if (whichAttack == 1) then
			attack1()
			print("1")
		elseif (whichAttack == 2) then
			attack2()
			print("2")
		elseif (whichAttack == 3) then
			attack3()
			print("3")
		end
	end
	timer.performWithDelay(2000, pickAttack,1)
	timer.performWithDelay(18000, pickAttack, 0)
end

local function startAttacks ()
	timer.performWithDelay(3000, theAttacks, 1)
end

]]--




--timer.performWithDelay(4000, heroControl, 1)


--This is the introduction for Eye Wizard
local function introduction()

	--local smoothJazz = audio.loadStream ("JazzSmooth.mp3")
	--audio.play(smoothJazz, {channel = 4, loops = -1})

	physics.pause ()
	local introEyeWizardBox = display.newImageRect ( mainGroup, "images/pauseMenu.png", display.contentWidth/1.5, display.contentHeight/1.4)
	introEyeWizardBox.x = display.contentCenterX/1.75
	introEyeWizardBox.y = display.contentCenterY
	introEyeWizardBox.alpha = 0.75

	closeEyeWizard = display.newImageRect (mainGroup, "images/close.png", display.contentWidth/11, display.contentHeight/7)
	closeEyeWizard.x = display.actualContentWidth/2
	closeEyeWizard.y = screenTop +60

	local function eyeBossSprite()

        local sheetData = {
         width = 294,
         height = 263,
         numFrames = 24,
         sheetContentWidth=1764,
         sheetContentHeight=1052
    
        }
    
        local mySheet = graphics.newImageSheet( "images/Eyeboss1.png",sheetData )
    
        local sequenceData = {
         {name = "moving", start =1,count=24, time =1500, loopCount =0},
        }
    
         eye = display.newSprite(mainGroup, mySheet,sequenceData )


         eye.spd = 30

        eye.x = display.contentCenterX + display.contentCenterX/3
        eye.y = centerY
 

        eye:setSequence("moving")
        eye:play()
	end
	eyeBossSprite()
	
	local eyeWizDesc = display.newText(mainGroup, "The Eye Wiz", display.contentCenterX/3, display.contentCenterY/1.7, native.systemFont, 20)
	eyeWizDesc:setFillColor(1, 1, 1 )
	local eyeWizDesc1 = display.newText(mainGroup, "A very smart and deadly creature. \nA wizard that summons explosives \nand deadly spinning discs. \nAdventurers says that it is the \nCreator's own eye. \nA Creator's Item can only kill it.  ", display.contentCenterX/1.8, display.contentCenterY + 10, native.systemFont, 15)
	eyeWizDesc1:setFillColor(1, 1, 1 )

	local function removeIntro()
		display.remove(introEyeWizardBox)
		--display.remove(eyeBossSprite)
		display.remove(eyeWizDesc)
		display.remove(eyeWizDesc1)
		eye:pause()
		display.remove(eye)
		display.remove(closeEyeWizard)
		transition.to(closeEyeWizard, {time = 20, onComplete = startGame})
	end

	closeEyeWizard:addEventListener("tap", removeIntro)
	closeEyeWizard:addEventListener("tap", startAttacks)

end

--create
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

	local background = display.newImageRect( backGroup, "images/stage1whole.png", display.actualContentWidth,display.actualContentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	introduction()
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
		composer.removeScene( "eyeWiz" )

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

