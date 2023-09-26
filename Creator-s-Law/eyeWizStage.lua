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
boxX = display.contentCenterX/6
boxY = display.contentCenterY/4

--physics
local physics = require("physics")
--physics.pause( )
physics.start( )
physics.setDrawMode( "hybrid" )
physics.setGravity( 0,100)

--titos additional codes

local isMoving = false
local gameIsPaused = false
local isGameOver = false
local whosAttacking = 0

--Transitions
local function 	goBackToCampaignMenu()
--	composer.removeScene( "game" )
	composer.gotoScene( "campaignMenu", { time=100, effect="crossFade" } )
end


--Starting the game-----------------------------------------------------------------------------------

local function startGame()
	--[[

	audio.fadeOut( {channel = 4, time = 1000})

	local skater = audio.loadStream ("Skater.mp3")
	audio.play(skater, {channel = 2, loops = -1})

	--audio.setMaxVolume( 0.5, { channel=2 } )

	local metal = audio.loadStream ("MetalLoop.wav")
	audio.play(metal, {channel = 2, loops = -1})
	
	]]--
	
--tito comment out (not needed, you already start it at the top)
--	physics.start()
	--------------------------------------------------------------------------------------------
	--Transitions and Removers
	--------------------------------------------------------------------------------------------

	function removeMe(self)
		display.remove(self)
	end

	local function manualTransition()
		local manualTransitionBlack = display.newRect(uiGroup, 0, 0, display.actualContentWidth, display.actualContentHeight)
		manualTransitionBlack:setFillColor( 0, 0, 0 )
		manualTransitionBlack.anchorX, manualTransitionBlack.anchorY = 0.5, 0.5
		manualTransitionBlack.x = display.contentCenterX
		manualTransitionBlack.y = display.contentCenterY
		manualTransitionBlack.alpha = 1

		transition.to(manualTransitionBlack, {time=3000, alpha=0, onComplete = removeMe})
	end

	manualTransition()

	--------------------------------------------------------------------------------------------
	--Backgrounds
	--------------------------------------------------------------------------------------------
	
	function Backgroundss()

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

		isYesOptionClicked = false

		function bgMovements (self,event)
			if (isYesOptionClicked == true or gameIsPaused == true) then

			else

			if (isGameOver == false) then
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
		
		--------------------------------------------------------------------------------------------
		--The Ui
		--------------------------------------------------------------------------------------------

		local function UIs ()
			blueRect = display.newRect(uiGroup, 0, 0, display.actualContentWidth/16, display.actualContentHeight/10)
			blueRect.x = screenLeft + centerX/6.25
			blueRect.y = screenTop + centerY/8
			blueRect.anchorX, blueRect.anchorY = 0, 0
		

			local pandorasBoxFill = display.newImageRect (uiGroup, "images/Creator's Box.png", display.contentCenterX/1.1, display.contentCenterY/2.1)
			pandorasBoxFill.x = screenLeft
			pandorasBoxFill.y = screenTop
			pandorasBoxFill.anchorX, pandorasBoxFill.anchorY = 0, 0

			pause = display.newImageRect (uiGroup, "images/pause.png", boxX, boxY)
			pause.anchorX, pause.anchorY = 1, 0
			pause.x = screenRight + 50
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

			-- tito will make another version

			local function fillUpCreatorsBox()
				--transition.to(blueRect, {time=100, width = blueRect.width + 1.4166})
				--print (blueRect.width)
				--titos version
				if isMoving == true or gameIsPaused==true then

				else
					if (blueRect.width >= 175) then -- if the width is more than 175 then stop adding
						-- thats why this is empty (no code)
					else
						if isGameOver==false then

							blueRect.width= blueRect.width + 1.4166 --if the width is less than 175 then add 1.4166
						end
					end
				end
			end

			pandorasBoxFiller = timer.performWithDelay(100, fillUpCreatorsBox, 0) -- this must remove


			--[[local function adding()
				pandorasBoxFiller = timer.performWithDelay(100, fillUpCreatorsBox, 0)

				if (blueRect.width <= 170) then
					if (isMoving == false) then
						timer.resume(pandorasBoxFiller)
						print("hi")
					elseif (isMoving == true) then
						timer.pause(pandorasBoxFiller)
						print("asdjsldkfnlksdfjasdasdasdasdasdasdasd")
					end
				
				elseif (blueRect.width >= 170) then
					timer.cancel(pandorasBoxFiller)
					print("asdjsldkfnlksdfj")
				end
			end

			adding()--]]



		end
		
		timer.performWithDelay(3000, UIs, 1)
		
		function pauseMenu()

			gameIsPaused = true 

			timer.pause(attackLoops)
			timer.pause(eyesMovingLoop)
			transition.pause()

			if whosAttacking ==1 then
				timer.pause(rocketTimeTimer)
			elseif whosAttacking ==2 then
				timer.pause(horizontalWheelTimeTimer)
			elseif whosAttacking ==3 then
				timer.pause(verticalWheelTimeTimer)
			end


			local pauseMenu = display.newImageRect(mainGroup, "images/pauseMenu.png", display.contentWidth/1.5, display.contentHeight*0.65)
			pauseMenu.x = centerX 
			pauseMenu.y = centerY 
		
			local resumeGame = display.newImageRect(mainGroup, "images/chatBox.png", display.contentWidth/2.5, display.contentHeight*0.15)
			resumeGame.x = centerX
			resumeGame.y = centerY - centerY / 3	
		
			local resumeGametxt = display.newText(mainGroup, "Resume Game", 0, 0, native.systemFont, 16)
			resumeGametxt.x = centerX
			resumeGametxt.y = centerY - centerY / 3
		
			local pauseGame = display.newImageRect(mainGroup, "images/chatBox.png", display.contentWidth/2.5, display.contentHeight*0.15)
			pauseGame.x = centerX
			pauseGame.y = centerY 		
		
			local pauseGametxt = display.newText(mainGroup, "Settings", 0, 0, native.systemFont, 16)
			pauseGametxt.x = centerX
			pauseGametxt.y = centerY 

			local quitGame = display.newImageRect(mainGroup, "images/chatBox.png", display.contentWidth/2.5, display.contentHeight*0.15)
			quitGame.x = centerX
			quitGame.y = centerY + centerY /3		
		
			local quitGametxt = display.newText(mainGroup, "Quit Game", 0, 0, native.systemFont, 16)
			quitGametxt.x = centerX
			quitGametxt.y = centerY + centerY / 3

			local function resumeGamer()
				gameIsPaused = false

				transition.resume()

				display.remove(pauseMenu)
				display.remove(resumeGame)
				display.remove(resumeGametxt)
				display.remove(pauseGame)
				display.remove(pauseGametxt)
				display.remove(quitGame)
				display.remove(quitGametxt)

				if whosAttacking ==1 then
					timer.resume(rocketTimeTimer)
				elseif whosAttacking ==2 then
					timer.resume(horizontalWheelTimeTimer)
				elseif whosAttacking ==3 then
					timer.resume(verticalWheelTimeTimer)
				end
			end	

			local function quitGamer()
				--physics.pause()
				display.remove(pauseMenu)
				display.remove(resumeGame)
				display.remove(resumeGametxt)
				display.remove(pauseGame)
				display.remove(pauseGametxt)
				display.remove(quitGame)
				display.remove(quitGametxt)

				local noQuit = display.newImageRect(mainGroup, "images/chatBox.png", display.contentWidth/4.5, display.contentHeight*0.15)
				noQuit.x = centerX + centerX/3
				noQuit.y = centerY 
			
				local yesQuit = display.newImageRect(mainGroup, "images/chatBox.png", display.contentWidth/4.5, display.contentHeight*0.15)
				yesQuit.x = centerX - centerX/3
				yesQuit.y = centerY 		
		
				local yestxt = display.newText(mainGroup, "Yes", 0, 0, native.systemFont, 16)
				yestxt.x = centerX - centerX/3
				yestxt.y = centerY 
		
				local notxt = display.newText(mainGroup, "NO", 0, 0, native.systemFont, 16)
				notxt.x = centerX + centerX/3
				notxt.y = centerY 

				local function noOption()
					--to resume
					gameIsPaused = false

					display.remove(noQuit)
					display.remove(yesQuit)
					display.remove(yestxt)
					display.remove(notxt)


					timer.resume(attackLoops)
					timer.resume(eyesMovingLoop)

					transition.resume()
	
					if whosAttacking ==1 then
						timer.resume(rocketTimeTimer)
					elseif whosAttacking ==2 then
						timer.resume(horizontalWheelTimeTimer)
					elseif whosAttacking ==3 then
						timer.resume(verticalWheelTimeTimer)
					end
				end

				local function yesOption()
				--	display.remove(hero)
					display.remove(eyeWizard)
					display.remove(noQuit)
					display.remove(yesQuit)
					display.remove(yestxt)
					display.remove(notxt)

					hero:removeEventListener( "collision",collisionChecker )

					isYesOptionClicked = true
					isGameOver = true



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
		end
	end

	Backgroundss()

	--------------------------------------------------------------------------------------------
	--characters
	--------------------------------------------------------------------------------------------

	local function characters()
		--------------------------------------------------------------------------------------------
		--Chacters Enter Frame and Starts the fight
		--------------------------------------------------------------------------------------------

		local function createHero()

			 function collisionChecker(event)

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

			--hero.isFixedRotation = true

			hero:setSequence("flying")
			hero:play()

		hero:addEventListener( "collision",collisionChecker )  -- this must remove

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

		--------------------------------------------------------------------------------------------
		--Eyelights and Entering
		--------------------------------------------------------------------------------------------

		function Fight()
		
			eyeWithEyeLights = display.newGroup(mainGroup)
			gravity = display.newImageRect (uiGroup, "images/gravity.png", boxX, boxY)
			spikyDiscTime = display.newImageRect (uiGroup, "images/spikyDiscTime.png", boxX, boxY)
			rocketTime = display.newImageRect (uiGroup, "images/rocketTime.png", boxX, boxY)

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
			
			print("fight good")

		end

		local function preFight ()
			print("hi")


			transition.to(hero, {time = 2000, x = screenLeft +  hero.width/3})
			transition.to(eyeWizard, {time=2000, x = screenRight - eyeWizard.width/3})

			local function begin ()
				local begin = display.newText(uiGroup, "Begin!", display.contentCenterX, display.contentCenterY, native.systemFont, 50)
				begin:setFillColor(191, 75, 36 )
				transition.to(begin, {time = 500, xScale = 2, yScale = 2, onComplete = removeMe})
				
			end

			local function ready()
				local ready = display.newText(uiGroup, "Ready?", display.contentCenterX, display.contentCenterY, native.systemFont, 50)
				ready:setFillColor(191, 75, 36 )
				transition.to(ready, {time = 1000, xScale = 2, yScale = 2, onComplete = begin})
				transition.to(ready, {time = 1000, alpha=0, onComplete = removeMe})
			end
		
			timer.performWithDelay( 2000, ready, 1)
		end

		--------------------------------------------------------------------------------------------
		--The controls
		--------------------------------------------------------------------------------------------

		local function heroControl()
		
			isMoving = false

			local pentagonShape = { 15,-37, 37,-10, 33,34, -23,34 }
			physics.addBody ( hero, "dynamic", { density=25, friction=10, shape=pentagonShape})
			hero.gravityScale = 0

			local cage1 = display.newRect(mainGroup, 0, 0, display.actualContentWidth*1.5, display.contentHeight/2)
			cage1.anchorX, cage1.anchorY = 0.5, 1
			cage1.x = centerX
			cage1.y = screenTop 
			cage1.alpha=0

			isAttackOne = false

			cage2 = display.newRect(mainGroup, 0, 0, display.actualContentWidth*1.5, display.contentHeight/4)
			cage2.anchorX, cage2.anchorY = 0.5, 1
			cage2.x = centerX
			cage2.y = screenBottom + centerY/2.5
			cage2.alpha = 0
			cage2.name = "floor"

			--[[function beSureOnAttack1 ()
				if (isAttackOne == true) then
					transition.to (cage1, {time=100, y = cage1.y - 500})
				
				elseif(isAttackOne == false) then
					transition.to (cage1, {time = 100, y = screenTop - centerY/1})
				
				end
			end

			beSureOnAttack1Timer = timer.performWithDelay(1000, beSureOnAttack1, 1)--]] 

			local cage3 = display.newRect(mainGroup, 0, 0, display.actualContentWidth/4, display.contentHeight*2)
			cage3.anchorX, cage3.anchorY = 0, 0.5
			cage3.x = screenRight
			cage3.y = centerY

			local cage4 = display.newRect(mainGroup, 0, 0, display.actualContentWidth/4, display.contentHeight*2)
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

				-- tito comment  for more smooth touch control
			--[[	local function control(event)

					--tito comment, is this a mispelled (stoph)
					display.remove(stoph)

					if ( event.phase == "began" ) then	
						local function urFault()
							isStillMoving = false
						end
						isStillMoving = true
						transition.to(hero, {time = 250, x = event.x, y = event.y - centerY/4, onComplete = urFault})

						if(hero.y <= screenTop - 20)then
							isStillMoving = true
							transition.to (hero, {time = 500, y = display.contentCenterY, onComplete = urFault})
						end

					elseif ( event.phase == "moved" ) then
						if (isStillMoving == false) then
							transition.to(hero, {time = 50, x = event.x, y = event.y - centerY/4})
							hero.rotation = 0
							isMoving = true
						end

						if(hero.y <= screenTop - 20)then
							isStillMoving = true
							transition.to (hero, {time = 500, y = display.contentCenterY, onComplete = urFault})
						end


					elseif ( event.phase == "ended" ) then

						isMoving = false

					end

					


					return true  -- Prevents tap/touch propagation to underlying objects
				end--]]

					--titos version

				 function control(event)

					--to make him fixed rotation

					hero.rotation = 0

					if ( event.phase == "began" ) then	

						if event.x > screenRight-150 or gameIsPaused==true 
						or event.y < 110 then

						else

							hero.x = event.x
							hero.y = event.y -20

						end
					elseif ( event.phase == "moved" ) then

						if event.x > screenRight-150 or gameIsPaused==true 
						or event.y < 110 then


						else
							hero.x = event.x
							hero.y = event.y -30

							isMoving = true
						end

					elseif ( event.phase == "ended" ) then

						isMoving = false

					end


					return true  -- Prevents tap/touch propagation to underlying objects
				end



				controler:addEventListener("touch", control) -- this must remove
			end
			timer.performWithDelay(500, startingControl, 1)
		end

		createEnemy()
		createHero()
		timer.performWithDelay(2100, Fight, 1)
		preFight()
		timer.performWithDelay(2100, heroControl, 1)
	end

	characters()
end

--hero explode

local function heroKaboom()

	--physics.removeBody( hero )

	local function removeMe(self)
		display.remove(self)
	end

	transition.to(hero, {time = 500, xScale =2,yScale=2,onComplete =removeMe})

end

local function theAttacks()
	if (hero.y <= screenTop - 20) then
		hero.y = screenBottom - 50
	end

	score = 0
	scoreText = display.newText(uiGroup, "Score: "..score, display.contentCenterX, screenTop+20, native.systemFont,20)
	isGameOver = false
	local function transitioningEye()
		if (gameIsPaused == true) then
		else
			transition.to(eyeWithEyeLights, {time = 500, y = math.random(-75, 50)})
		end
	end

	eyesMovingLoop = timer.performWithDelay(1000, transitioningEye,0) -- this must remove
    ------------------------------------------------------------------------------------------------------
	local function attack1()
		
		--score
		isGameOver = false
		alivent = false

		--ball jumping
		local function removeRockets(self)
			display.remove(self)
			if (isGameOver == false) then
				score = score + 100
				
			end
			scoreText.text = ("Score: "..score)
			print(score)
		end

		function alivent(self)
			transition.to(self, {time = 10, x = self.x - 1000})
			isGameOver = true
		end


		local function gameOver(event)
			local me = event.target

			if   ( ( me.name == "explode" and event.other.name == "Protagonist"  ))  then
				print("explode")
				display.remove(me)
				--transition.to(hero,{time=300,xScale =4,yScale=4, onComplete = alivent})
			   
				local insult = display.newText(uiGroup, "Game Over", centerX,centerY, native.systemFont, 40 )
				isGameOver = true
				isYesOptionClicked = true

				timer.cancel(attackLoops)
				timer.cancel(rocketTimeTimer)
				timer.cancel(eyesMovingLoop)
				heroKaboom()

				--titos comment just remove this on the scene hide together with all the remove
			--	hero:removeEventListener( "collision",collisionChecker )
			--	controler:removeEventListener("touch", control)
				--display.remove(Controller)
			--	display.remove(originOfController)
				
				manualTransition2()

			end
		end
		
		--boom 

		local function boom(me)

			physics.addBody ( me, "dynamic", { bounce=0, radius=20,density=math.random(10,20),friction=10, isSensor = false  })

			transition.to(me,{time=500,x=me.x-display.contentWidth,xScale =2.5,yScale=2.5,onComplete = removeRockets})

			me:addEventListener( "collision",gameOver ) -- this must remove

		end

			--exploding missiles

		local function exploding(event)

			local me = event.target
			-- local bullet = event.other

			if   ( ( me.name == "bomb" and event.other.name == "floor"  ))  then

				
				audio.play(rocketExplode)

				local explode = display.newImageRect(mainGroup, "images/explode.png", 30,30 )

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

			Rocket = display.newImageRect(mainGroup, "images/Rocket.png", 30,50 )
			Rocket.x = centerX + math.random(50,screenRight - 100)
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

		--transition.to (hero, {time = 100, x = screenLeft + 100})
		--controler:addEventListener("touch", wheelJump)

		countExplode = 0	
		local rocketTime = display.newText (uiGroup, "Rocket Time!", centerX,centerY, native.systemFont, 40 )
		rocketTime:setFillColor( 0, 0, 255 )
		
		transition.to(rocketTime, {time = 1000, onComplete = removeMe})

		transition.to(gravity, {time = 500, xScale = 3, yScale = 3, rotation = 360, alpha = 0.8})

		--hero.gravityScale = 0.2
		--cage1
		isAttackOne = true

		rocketTimeTimer = timer.performWithDelay( 1000,shoot,18) -- this must remove
	end
	------------------------------------------------------------------------------------------------------
	local function attack2()

		--score
		
		--score = 0
		--scoreText = display.newText("Score: "..score, screenLeft+100, screenTop+50, native.systemFont,20)

		--ball jumping

		 function removeMe12(self)
			if isGameOver==false then
				  score = score + 50

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
		--	transition.to(ball,{time=300,xScale =4,yScale=4,onComplete = removeMe12})
    
			local insult = display.newText(uiGroup, "Game Over", centerX,centerY, native.systemFont, 40 )
			isGameOver = true
			isYesOptionClicked = true

			--controler:removeEventListener("touch", control)
			--display.remove(Controller)
			--display.remove(originOfController)

			--transition.to (hero, {time =20, x = hero.x - display.contentWidth})
			manualTransition2()

			timer.cancel(attackLoops)
			timer.cancel(horizontalWheelTimeTimer)
			timer.cancel(eyesMovingLoop)
			heroKaboom()

			--Runtime:removeEventListener( "touch", wheelJump )
		  end

		end

		 --boom 
		 
		local function wheelMove(self)

		  audio.play(discWhoosh)

		  transition.to(self ,{time=500, x = self.x - display.contentWidth, onComplete = removeMe12})
		  --me:applyLinearImpulse( -600, nil, me.x, me.y )

		  self:addEventListener( "collision",gameOver ) -- this must remove

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
    
			local mySheet = graphics.newImageSheet( "images/wheel2.png",sheetData )
    
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

			if (wheelCount >= 31) then
				wheelCount = 0 
				transition.to(spikyDiscTime, {time = 500, alpha=0})
			end

			-- wheel2:addEventListener( "collision",exploding )
		end
		
		--controler:addEventListener("touch", control)-- this must remove
		isAttackOne = false

		wheelCount = 0

		local horizontalWheelTime = display.newText(uiGroup, "Horizontal Wheel Time!", centerX,centerY, native.systemFont, 40 )
		horizontalWheelTime:setFillColor(248, 213, 104)

		transition.to (horizontalWheelTime, {time = 1000, alpha=0, onComplete = removeMe})
		transition.to (spikyDiscTime, {time = 100, xScale = 3, yScale = 3, rotation = 360, alpha=0.8})

		horizontalWheelTimeTimer = timer.performWithDelay( 500,shoot,32)	
	end
	------------------------------------------------------------------------------------------------------
	local function attack3()


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
			--transition.to(ball,{time=300,xScale =4,yScale=4,onComplete = removeMe11})
    
			local insult = display.newText(uiGroup, "Game Over", centerX,centerY, native.systemFont, 40 )
			isGameOver = true
			isYesOptionClicked = true

			-- canceling enemy attack

			timer.cancel(attackLoops)
			timer.cancel(verticalWheelTimeTimer)
			timer.cancel(eyesMovingLoop)
			heroKaboom()

		--	transition.to (hero, {time =20, x = hero.x - display.actualContentWidth})
			manualTransition2()

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
    
			local mySheet = graphics.newImageSheet( "images/wheel.png",sheetData )
    
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
			wheel1.gravityScale = 0
			wheel1.name = "Wheel1"			
			wheel1.xScale = -1
			
			transition.to ( wheel1, {time=500, onComplete = wheelMove})

			wheelCountV = wheelCountV + 1

			if (wheelCountV >= 15) then
				wheelCountV = 0 
				transition.to(spikyDiscTime, {time = 500, alpha=0})
			end

			-- wheel2:addEventListener( "collision",exploding )
		end
		--controler:addEventListener("touch", control) -- this must remove
		wheelCountV = 0

		isAttackOne = false

		local verticalWheelTime = display.newText(uiGroup, "Vertical Wheel Time!", centerX,centerY, native.systemFont, 40 )
		verticalWheelTime:setFillColor(248, 213, 104)

		transition.to (verticalWheelTime, {time = 1000, alpha=0, onComplete = removeMe})
		transition.to (spikyDiscTime, {time = 100, xScale = 3, yScale = 3, rotation = 360, alpha=0.8})

		verticalWheelTimeTimer = timer.performWithDelay( 1000,shoot,16)	-- this needs to cancel at the scene hide
	end
	------------------------------------------------------------------------------------------------------
	local function pickAttack ()
		whichAttack = math.random(1,3)
		if (whichAttack == 1) then
			attack1()
			whosAttacking = 1
			print("1")
		elseif (whichAttack == 2) then
			attack2()
			whosAttacking = 2
			print("2")
		elseif (whichAttack == 3) then
			attack3()
			whosAttacking = 3
			print("3")
		end
	end
	firstAttackLoops = timer.performWithDelay(2000, pickAttack,1)
	attackLoops = timer.performWithDelay(18000, pickAttack, 0) 
		--just delaying the appearance of pause, to work properly
		transition.to(pause, {time = 3000,x= screenRight-10})
end

function literallyRemoveAll(self)
	--physics.pause()
	--[[Runtime:removeEventListener("enterFrame", farMountains)
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
	pause:removeEventListener ("tap", pauseMenu)
	hero:pause()
	eyeWizard:pause()--]]
	--timer.cancel(attackLoops)
	--timer.cancel(verticalWheelTime)
	--timer.cancel(horizontalWheelTime)
	--timer.cancel(rocketTime)
	display.remove(self)
	print("ASDAKJBSDIKUEFBKLAEWHFLADIFBERBLIIEFLBELAIHBRVLBAEIBLEIVBILAEBV")
	goBackToCampaignMenu()
	--hero:removeEventListener( "collision",collisionChecker )		
end
		
function manualTransition2()
	 manualTransitionBlack = display.newRect(uiGroup, 0, 0, display.actualContentWidth, display.actualContentHeight)
	manualTransitionBlack:setFillColor( 0, 0, 0 )
	manualTransitionBlack.anchorX, manualTransitionBlack.anchorY = 0.5, 0.5
	manualTransitionBlack.x = display.contentCenterX
	manualTransitionBlack.y = display.contentCenterY
	manualTransitionBlack.alpha = 0

	transition.to(manualTransitionBlack, {time=3000, alpha=0.25, onComplete = literallyRemoveAll})
end

local function startAttacks ()
	timer.performWithDelay(4000, theAttacks, 1)
end
--This is the introduction for Eye Wizard

local function introduction()

	--local smoothJazz = audio.loadStream ("JazzSmooth.mp3")
	--audio.play(smoothJazz, {channel = 4, loops = 10})

	print("this is intro")
	--physics.pause ()
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


    --[[
	local title =display.newText(sceneGroup,"battle ", display.contentCenterX- 50, 50, native.systemFont, 65)

	local playButton = display.newText( sceneGroup, "Play", display.contentCenterX + 100, 50, native.systemFont, 44 )
	playButton:setFillColor( 0.82, 0.86, 1 )
    ]]--


	--playButton:addEventListener( "tap", gotoGame )


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

		display.remove(eyeWithEyeLights)
		display.remove(gravity)
		display.remove(spikyDiscTime)
		display.remove(rocketTime)

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

		Runtime:removeEventListener( "enterFrame", bgMovements )
		

		timer.cancel(pandorasBoxFiller)
		timer.cancel (eyesMovingLoop)
		timer.cancel (attackLoops)

		controler:removeEventListener("touch", control)


		composer.removeScene( "eyeWizStage" )

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