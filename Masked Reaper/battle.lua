local composer = require( "composer" )
local scene = composer.newScene()



local characters = require( "characters" )
local platform = require( "platform" )

local physics = require("physics")
physics.start( )
--physics.setDrawMode( "hybrid" )
physics.setGravity( 0,100)

local tiled = require "com.ponywolf.ponytiled"
local json = require "json"

system.activate( "multitouch" )






local widget = require("widget")


local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight

---settings



local cost=0
doubleJump = 1 
local attackAnim =false
local jumpAnim =false
local throwAnim =false
 attackAnim= false
local actingJump= false
local ableToPress = true
 readyToMove = false
 attackNo = 1
local weaponDistX = -10
local weaponDistY = 0
loading = false
 moveNow ="stop"
 moveNow2 ="stop"
local fireAbility =false
local fireAbilityCount = 0

local iceAbility =false
local iceAbilityCount = 0

local superfireAbility =false
local superfireAbilityCount = 0

local supericeAbility =false
local supericeAbilityCount = 0
local mpCount=0

local jumpIsPressed= false
local attackIsPressed= false
local justCastFire = false
local justCastIce = false
absorbAnim=false
 paused=false
 runningSound=false
 coinsRequire=0
 coleIsAlive=false
 musicPlaying=0

--gameStatus.stage =15

----------------------------------------this part is changable------------------
--settings ############################################################
--hero running speed higher = faster , lower = slower

heroStr =3


-------------------------------------------end of settings -----------------------
 function gotoGame()

	loading= true
	transition.cancel()
--	composer.removeScene( "game" )
	gameStatus.hp = gameStatus.maxHp
	gameStatus.mp = gameStatus.maxMp

	if  gameStatus.stage==7 or gameStatus.stage==11  or gameStatus.stage==17 or gameStatus.stage==24 or gameStatus.stage==26
	or gameStatus.stage==12 or gameStatus.stage==30  or gameStatus.stage==29 or gameStatus.stage==28 then
		if gameStatus.stage ==12 then
			if gameStatus.coleBoss1==1 then
				saveScores()
			end
		elseif gameStatus.stage ==30 then
			if gameStatus.coleBoss2==1 then
				saveScores()
			end
		elseif gameStatus.stage ==29 then
			if gameStatus.coleBoss3==1 then
				saveScores()
			end
		elseif gameStatus.stage ==28 then
			if gameStatus.coleBoss4==1 then
				saveScores()
			end
		end
	else
	saveScores()
	end

	composer.gotoScene( "title", { time=500 } )
end

function gotoNext()
	
	if hero.xScale == -1 then
		flip =true
	else
		flip=false
	end

	loading= true
	transition.cancel()
	
	if  gameStatus.stage==7 or gameStatus.stage==11  or gameStatus.stage==17 or gameStatus.stage==24 or gameStatus.stage==26
	or gameStatus.stage==12 or gameStatus.stage==30  or gameStatus.stage==29 or gameStatus.stage==28 then
		if gameStatus.stage ==12 then
			if gameStatus.coleBoss1==1 then
				saveScores()
			end
		elseif gameStatus.stage ==30 then
			if gameStatus.coleBoss2==1 then
				saveScores()
			end
		elseif gameStatus.stage ==29 then
			if gameStatus.coleBoss3==1 then
				saveScores()
			end
		elseif gameStatus.stage ==28 then
			if gameStatus.coleBoss4==1 then
				saveScores()
			end
		end
	else
	saveScores()
	end
	--	composer.removeScene( "game" )
	--audio.play( soundShutter)
		composer.gotoScene( "loading", { time=50 } )
end

function gotoStory()
	loading= true
	transition.cancel()
--	composer.removeScene( "game" )


	composer.gotoScene( "story", { time=500 } )
end


local options3 = {
	width = 48,
	height = 48,
	numFrames = 18,
	sheetContentWidth = 192,
	sheetContentHeight = 240
}
 buttonSheet3 = graphics.newImageSheet( "images/icons.png", options3 )

------------------buttons-------------------

---creating button------
function createButton()

	local options = {
		width = 200,
		height = 200,
		numFrames = 8,
		sheetContentWidth = 600,
		sheetContentHeight = 600
	}
	local buttonSheet = graphics.newImageSheet( "images/buttons2.png", options )

	local options2 = {
		width = 150,
		height = 150,
		numFrames = 2,
		sheetContentWidth = 150,
		sheetContentHeight = 300
	}
	local buttonSheet2 = graphics.newImageSheet( "images/heartButton2.png", options2 )



	--jump button---
	local function resetAnimJ()
	--	if doubleJump >=3 then
		--	doubleJump =1
		--	timer.performWithDelay(350,resetAnimJ,1)
		--else
			--hero.rotation=0
			actingJump =false
		--end
	end

	 function onKeyEvent( event )
 
    -- If the "back" key was pressed on Android, prevent it from backing out of the app
	if ( "down" == event.phase and event.keyName == "space" and loading == false and paused==false) then
		
		--if (  hero.sensorOverlaps >= 0 ) then
		if moveNow2=="down" then
			if actingJump == false then
			local vx, vy = hero:getLinearVelocity()
        	hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, -70, hero.x, hero.y )
			actingJump =true
			timer.performWithDelay(300,resetAnimJ,1)
			end
		else

		if doubleJump == 1 then
			if gameStatus.drakzDoubleJump>=1 then
			doubleJump = 2
			else
			doubleJump = 4
			end

			iceAbility =true
			iceAbilityCount = 0
			local vx, vy = hero:getLinearVelocity()
			hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, -200, hero.x, hero.y )
			print("jump 1")
			actingJump =true

			hero:setSequence("jump")
			hero:play()
			runningSound= true
			audio.play( soundJump)
			createSmoke()
			shake()
			timer.performWithDelay(400,resetAnimJ,1)

		elseif doubleJump == 2 then
			if gameStatus.drakzDashDown>=1 then
				doubleJump = 3
				else
			doubleJump = 4
				end
			iceAbility =true
			iceAbilityCount = 0
        	local vx, vy = hero:getLinearVelocity()
        	hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, -200, hero.x, hero.y )
			print("jump 1")
			actingJump =true

			hero:setSequence("jump2")
			hero:play()
			audio.play( soundJump2)
			createSmoke()
			shake()
			timer.performWithDelay(400,resetAnimJ,1)
		elseif doubleJump == 3 then
			if gameStatus.mp >=1 then
				gameStatus.mp = gameStatus.mp - 2
			doubleJump = 4
			iceAbility =true
			iceAbilityCount = 0
			local vx, vy = hero:getLinearVelocity()
			hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, 300, hero.x, hero.y )
			print("jump 1")
			audio.play( soundDashDown)
		--	slashDown()
			shake()
			castAttackDown(hero)
			end
		

		end
		end
		--hero:play()
	elseif ( "up" == event.phase and event.keyName == "space" and loading == false and paused==false) then

		if gameStatus.drakzHighJump >=1 then
			if iceAbilityCount >=80 then
				doubleJump = 2
				actingJump =true
	
				castAttackUp(hero)
				audio.play( soundDashDown)
				createSmoke()
				--hero.rotation=180
				local vx, vy = hero:getLinearVelocity()
				hero:setLinearVelocity( vx, 0 )
				hero:applyLinearImpulse( 0, -500, hero.x, hero.y )
				timer.performWithDelay(400,resetAnimJ,1)
				shake()
	
			else
				iceAbility =false
				iceAbilityCount =0
			end

		end
			
	end

	if ( "down" == event.phase and event.keyName == "s" and paused==false) then


			moveNow2="down"
	elseif ( "up" == event.phase and event.keyName == "s" and paused==false) then


			moveNow2="stop"

	end


	if ( "down" == event.phase and (event.keyName == "f" or event.keyName == "m" )and paused==false) then

		if (  ableToPress == true) then

			if attackNo == 1 then
				attackNo = 2
	
				--fire ability
			fireAbility =true
			fireAbilityCount = 0
			ableToPress = false
			attackAnim =true
			weaponRect.attacked = true
			--seq = "attack"
			hero:setSequence("attack")
			hero:play()
			audio.play( soundAttack)
	
			weapon:setSequence("attack1")
			weapon:play()
	
			weaponDistX = 17
	
			if hero.xScale==-1 then
				transition.to (weaponRect, {time = 150,rotation=-200,onComplete=resetAngle})
			else
				transition.to (weaponRect, {time = 150,rotation=200,onComplete=resetAngle})
			end
	
			print("attacking"..attackNo)
			timer.performWithDelay(150,resetAnim,1)
			transition.to (weaponRect, {time = 150,onComplete=attackFalse})
			resetAttackTimer=timer.performWithDelay(450,weaponReturn,1)
		elseif attackNo == 2 then
			attackNo = 3
			fireAbility =true
			fireAbilityCount = 0
			timer.cancel(resetAttackTimer)
	
			ableToPress = false
	
			attackAnim =true
			weaponRect.attacked = true
			--seq = "attack"
			hero:setSequence("attack2")
			hero:play()
			audio.play( soundAttack)
	
			weapon:setSequence("attack2")
			weapon:play()
	
			weaponDistX = 22
	
			if hero.xScale==-1 then
				transition.to (weaponRect, {time = 200,rotation=360,onComplete=resetAngle})
			else
				transition.to (weaponRect, {time = 200,rotation=-360,onComplete=resetAngle})
			end
	
	
			print("attacking2")
			timer.performWithDelay(200,resetAnim,1)
			transition.to (weaponRect, {time = 200,onComplete=attackFalse})
			resetAttackTimer2=timer.performWithDelay(450,weaponReturn,1)
		elseif attackNo == 3 then
				attackNo = 1
				fireAbility =true
				fireAbilityCount = 0
				timer.cancel(resetAttackTimer2)
	
			ableToPress = false
	
			attackAnim =true
			weaponRect.attacked = true
			--seq = "attack"
			hero:setSequence("attack3")
			hero:play()
			audio.play( soundAttack3)
	
			weapon:setSequence("throw")
			weapon:play()
	
			weaponDistX = 55
	
			if hero.xScale==-1 then
				transition.to (weaponRect, {time = 400,rotation=-720,onComplete=resetAngle})
			else
				transition.to (weaponRect, {time = 400,rotation=-720,onComplete=resetAngle})
			end
	
			print("attacking3")
			timer.performWithDelay(400,resetAnim,1)
			transition.to (weaponRect, {time = 250,onComplete=attackFalse})
			timer.performWithDelay(400,weaponReturn,1)
			
				end
			end
		elseif ( "up" == event.phase and (event.keyName == "f" or event.keyName == "m" )) then
			fireAbility =false
			if fireAbilityCount >=50 then
				castFire(hero)

			end

		end

	if ( "down" == event.phase and event.keyName == "a" ) then
		moveNow = "left"
	elseif ( "up" == event.phase and event.keyName == "a" ) then
		moveNow = "stop"


	elseif ( "down" == event.phase and event.keyName == "d" ) then
		moveNow = "right"
	elseif ( "up" == event.phase and event.keyName == "d" ) then
		moveNow = "stop"



    end
 
    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
    -- This lets the operating system execute its default handling of the key
    return false
end
 
-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )


	-- Function to handle button events
 function handleButtonEvent( event )
 
	if ( "began" == event.phase and hero.sensorOverlaps >= 0 and loading == false and paused==false) then
		if moveNow2=="down" then
			if actingJump == false then
			local vx, vy = hero:getLinearVelocity()
        	hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, -70, hero.x, hero.y )
			actingJump =true
			timer.performWithDelay(300,resetAnimJ,1)
			end
		else

	--elseif ( "ended" == event.phase and hero.sensorOverlaps >= 0 ) then
		jumpIsPressed=true

		if doubleJump == 1 then
			if gameStatus.drakzDoubleJump>=1 then
				doubleJump = 2
			else
				doubleJump = 4
			end
			iceAbility =true
			iceAbilityCount = 0
			local vx, vy = hero:getLinearVelocity()
			hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, -200, hero.x, hero.y )
			print("jump 1")
			actingJump =true

			hero:setSequence("jump")
			hero:play()
			audio.play( soundJump)
			createSmoke()
			--shake()
			timer.performWithDelay(400,resetAnimJ,1)

		elseif doubleJump == 2 then
			if gameStatus.drakzDashDown >=1 then
			doubleJump = 3
			else
			doubleJump = 4
			end
			iceAbility =true
			iceAbilityCount = 0
        	local vx, vy = hero:getLinearVelocity()
        	hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( nil, -200, hero.x, hero.y )
			print("jump 1")
			actingJump =true

			hero:setSequence("jump2")
			hero:play()
			audio.play( soundJump)
			createSmoke()
			--shake()
			timer.performWithDelay(400,resetAnimJ,1)
		elseif doubleJump == 3 then
			if gameStatus.mp >=1 then
				gameStatus.mp = gameStatus.mp - 2
			doubleJump = 4
			iceAbility =true
			iceAbilityCount = 0
			local vx, vy = hero:getLinearVelocity()
			hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( 0, 400, hero.x, hero.y )
			print("jump 1")
			audio.play( soundDashDown)
		--	slashDown()
			shake()
			castAttackDown(hero)
			end
		

		end



	end

	elseif ( "ended" == event.phase ) then
		if gameStatus.drakzHighJump >=1 then

		--if readyToMove==false or jumpIsPressed==true then
		--	jumpIsPressed= false
		--iceAbility =false
		--print("jump ended")
		if iceAbilityCount >=60 then
			doubleJump = 2
			actingJump =true

			castAttackUp(hero)
			audio.play( soundDashDown)
			createSmoke()
			--hero.rotation=180
			local vx, vy = hero:getLinearVelocity()
			hero:setLinearVelocity( vx, 0 )
			hero:applyLinearImpulse( 0, -500, hero.x, hero.y )
			timer.performWithDelay(400,resetAnimJ,1)
			shake()
		else
			iceAbility =false
			iceAbilityCount =0
		end

		end
	end
end
 
 button1 = widget.newButton(
    {		
		sheet = buttonSheet,
        defaultFrame = 3,
        overFrame = 4,
        label = "",
        onEvent = handleButtonEvent
    }
)
 
-- Center the button
button1.x = screenRight-250
button1.y = screenBottom-80
button1.alpha =.4
uiGroup:insert( button1 )

----------resseter --------------

function resetAnim()
	attackAnim =false
	ableToPress = true
	weaponRect.attacked = false
end
function attackFalse()
	weaponRect.attacked = false
end
 function weaponReturn()
	if loading==false then
		weapon:setSequence("idle")
		weapon:play()
	end
	attackNo = 1
end
function resetAngle()
	weaponDistX=-10
	--weaponRect.rotation=0
	weaponRect.attacked = false
	hero.attacked = false
end

--------------attack down--------------------

function castAttackDown(self)

	if loading == false then
		seq ="dash"
        self:setSequence("dash")
        self:play()
	
	local function fin(self)
		self.attacked = false
		self.attackDown = false
		weaponRect.attackDown = false
		weaponRect.attacked =false
   end

		weaponRect.attacked =true
		self.attacked = true
		self.attackDown = true
		weaponRect.attackDown = true
		transition.to( self,  { time=500,onComplete = fin } )
 
    end
end
---------------dash up
function castAttackUp(self)
	if loading == false then
		seq ="dash"
        self:setSequence("dashUp")
        self:play()
	
	local function fin(self)
		self.attacked = false
		self.attackUp = false
		weaponRect.attackUp = false
		weaponRect.attacked =false
   end

		weaponRect.attacked =true
		self.attacked = true
		self.attackUp = true
		weaponRect.attackUp = true
		transition.to( self,  { time=500,onComplete = fin } )
 
    end
end

------------fire and ice ability--------------

 function castIce(self)
	iceAbilityCount = 0
	if loading == false then
        self:setSequence("attack")
        self:play()
    print("cast ice")
	local function removeBody(self)
		self.attacked = false
		self.iceAttacked=false
        display.remove( self )
	end
	
	local spriteOptions = {
		height = 256,
		width = 256,
		numFrames = 11,
		sheetContentWidth = 768,
		sheetContentHeight = 1024
	  }
	  local mySheet = graphics.newImageSheet("images/iceBlast.png", spriteOptions)
	  local sequenceData = {
		{name = "fire", start =1,count=11, time =600, loopCount =1}
	  }
	 
	
		-- Display the new sprite at the coordinates passed
	local fireBall = display.newSprite(backGroup,mySheet, sequenceData)
		fireBall:setSequence("fire")
		 fireBall:play()
		 audio.play( soundIceBlast)

   -- local fireBall = display.newImageRect( uiGroup, "images/joystickmain1b.png", 100,100 )

		fireBall.myName="weapon"
		fireBall.myName2="ice"
		
	
        fireBall.spd=2000
		fireBall.str=5
        fireBall.x = self.x
        fireBall.y = self.y+20
        
        physics.addBody( fireBall, "dynamic",
        {bounce= 0, radius=120, isSensor = true})
		fireBall.gravityScale =0
		fireBall.isBullet = true
		
		fireBall.collision = weaponCollide
		fireBall:addEventListener( "collision" )

		fireBall.attacked = true
		fireBall.iceAttacked=true

		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( vx, 0 )
		hero:applyLinearImpulse( nil, -30, hero.x, hero.y )

		--transition.to( fireBall,  { time=600,onComplete = removeBody } )
		transition.to( fireBall,  { time=600,onComplete = removeBody } )
 
    end
end

function castsuperIce(self)
	supericeAbilityCount = 0
	if loading == false then
        self:setSequence("attack")
        self:play()
    print("cast ice")
	local function removeBody(self)
		self.attacked = false
		self.iceAttacked=false
		self.supericeAttacked=true
        display.remove( self )
	end
	
	local spriteOptions = {
		height = 512,
		width = 512,
		numFrames = 11,
		sheetContentWidth = 1536,
		sheetContentHeight = 2048
	  }
	  local mySheet = graphics.newImageSheet("images/iceBlast.png", spriteOptions)
	  local sequenceData = {
		{name = "fire", start =1,count=11, time =600, loopCount =1}
	  }
	 
	
		-- Display the new sprite at the coordinates passed
	local fireBall = display.newSprite(backGroup,mySheet, sequenceData)
		fireBall:setSequence("fire")
		 fireBall:play()
		 audio.play( soundIceBlast)

   -- local fireBall = display.newImageRect( uiGroup, "images/joystickmain1b.png", 100,100 )

		fireBall.myName="weapon"
		fireBall.myName2="ice2"


	 	 fireBall.str =5
        fireBall.spd=2000

        fireBall.x = self.x
        fireBall.y = self.y+20
        
        physics.addBody( fireBall, "dynamic",
        {bounce= 0, radius=200, isSensor = true})
		fireBall.gravityScale =0
		fireBall.isBullet = true
		
		fireBall.collision = weaponCollide
		fireBall:addEventListener( "collision" )

		fireBall.attacked = true
		fireBall.iceAttacked=true
		fireBall.supericeAttacked=true

		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( vx, 0 )
		hero:applyLinearImpulse( nil, -30, hero.x, hero.y )

		--transition.to( fireBall,  { time=600,onComplete = removeBody } )
		transition.to( fireBall,  { time=600,onComplete = removeBody } )
 
    end
end

 function castFire(self)
	fireAbilityCount = 0
	if loading == false then
        self:setSequence("attack")
        self:play()
    print("cast fire")
	local function removeBody(self)
		self.attacked = false
		self.fireattacked = false
        display.remove( self )
    end

	local spriteOptions = {
		height = 64,
		width = 128,
		numFrames = 5,
		sheetContentWidth = 256,
		sheetContentHeight = 192
	  }
	  local mySheet = graphics.newImageSheet("images/fireBall.png", spriteOptions)
	  local sequenceData = {
		{name = "fire", start =1,count=5, time =math.random(300,500), loopCount =0}

	  }
	 
	
		-- Display the new sprite at the coordinates passed
	local fireBall = display.newSprite(backGroup,mySheet, sequenceData)
		fireBall:setSequence("fire")
		 fireBall:play()
		 audio.play( soundFireBall)

		fireBall.myName="weapon"
		fireBall.myName2="fire"

	  	fireBall.str=5
        fireBall.spd=2000

        fireBall.x = self.x
        fireBall.y = self.y+10
        
        physics.addBody( fireBall, "dynamic",
        {bounce= 0,box={ halfWidth=30, halfHeight=25, x=30, y=0 }, isSensor = true})
		fireBall.gravityScale =0
		fireBall.isBullet = true
		
		fireBall.collision = weaponCollide
		fireBall:addEventListener( "collision" )

		fireBall.attacked = true
		fireBall.fireattacked = true
 
		if hero.xScale==-1 then
			fireBall.xScale=-1
			if moveNow2=="up" then
				fireBall.rotation=90
				transition.to( fireBall,  { time=600,y = fireBall.y -600,onComplete = removeBody } )
			elseif moveNow2=="down" then
				fireBall.rotation=-90
				transition.to( fireBall,  { time=600,y = fireBall.y +600,onComplete = removeBody } )
			else
				transition.to( fireBall,  { time=1000,x = fireBall.x -1000,onComplete = removeBody } )
			end
		else
			if moveNow2=="up" then
				fireBall.rotation=-90
				transition.to( fireBall,  { time=600,y = fireBall.y -600,onComplete = removeBody } )
			elseif moveNow2=="down" then
				fireBall.rotation=90
				transition.to( fireBall,  { time=600,y = fireBall.y +600,onComplete = removeBody } )
			else
				transition.to( fireBall,  { time=1000,x = fireBall.x +1000,onComplete = removeBody } )
			end
		end
    end
end

function castsuperFire(self)
	superfireAbilityCount = 0
	if loading == false then
        self:setSequence("attack")
        self:play()
    print("cast fire")
	local function removeBody(self)
		self.attacked = false
		self.fireattacked = false
		self.superfireattacked = false
        display.remove( self )
    end

	local spriteOptions = {
		height = 128,
		width = 256,
		numFrames = 5,
		sheetContentWidth = 512,
		sheetContentHeight = 384
	  }
	  local mySheet = graphics.newImageSheet("images/fireBall.png", spriteOptions)
	  local sequenceData = {
		{name = "fire", start =1,count=5, time =math.random(300,500), loopCount =0}


	  }
	 
	
		-- Display the new sprite at the coordinates passed
	local fireBall = display.newSprite(backGroup,mySheet, sequenceData)
		fireBall:setSequence("fire")
		 fireBall:play()
		 audio.play( soundFireBall)

		fireBall.myName="weapon"
		fireBall.myName2="fire2"


        fireBall.spd=2000
	  	fireBall.str=5
        fireBall.x = self.x
        fireBall.y = self.y+10
        
        physics.addBody( fireBall, "dynamic",
        {bounce= 0,box={ halfWidth=30, halfHeight=50, x=60, y=0 }, isSensor = true})
		fireBall.gravityScale =0
		fireBall.isBullet = true
		
		fireBall.collision = weaponCollide
		fireBall:addEventListener( "collision" )

		fireBall.attacked = true
		fireBall.fireattacked = true
		fireBall.superfireattacked = true

		if hero.xScale==-1 then
			fireBall.xScale=-1
			if moveNow2=="up" then
				fireBall.rotation=90
				transition.to( fireBall,  { time=600,y = fireBall.y -600,onComplete = removeBody } )
			elseif moveNow2=="down" then
				fireBall.rotation=-90
				transition.to( fireBall,  { time=600,y = fireBall.y +600,onComplete = removeBody } )
			else
				transition.to( fireBall,  { time=1000,x = fireBall.x -1000,onComplete = removeBody } )
			end
		else
			if moveNow2=="up" then
				fireBall.rotation=-90
				transition.to( fireBall,  { time=600,y = fireBall.y -600,onComplete = removeBody } )
			elseif moveNow2=="down" then
				fireBall.rotation=90
				transition.to( fireBall,  { time=600,y = fireBall.y +600,onComplete = removeBody } )
			else
				transition.to( fireBall,  { time=1000,x = fireBall.x +1000,onComplete = removeBody } )
			end
		end
    end
end

function castWave(self)
	fireAbilityCount = 0
	if loading == false then
        self:setSequence("attack")
        self:play()
	local function removeBody(self)
		self.attacked = false
		self.waveAttacked=false
        display.remove( self )
    end

	local spriteOptions = {
		height = 64,
		width = 64,
		numFrames = 4,
		sheetContentWidth = 128,
		sheetContentHeight = 128
	  }
	  local mySheet = graphics.newImageSheet("images/wave.png", spriteOptions)
	  local sequenceData = {
		{name = "wave", start =1,count=4, time =math.random(300,500), loopCount =0}


	  }
	 
	
		-- Display the new sprite at the coordinates passed
	local fireBall = display.newSprite(backGroup,mySheet, sequenceData)
		fireBall:setSequence("wave")
		 fireBall:play()
		 audio.play( soundSonicWave)

		fireBall.myName="weapon"
		
		if gameStatus.drakzWave >= 1 then
			fireBall.str = math.random(1,2)
		end

        fireBall.spd=2000

        fireBall.x = self.x
        fireBall.y = self.y+10
        
        physics.addBody( fireBall, "dynamic",
        {bounce= 0,box={ halfWidth=16, halfHeight=32, x=0, y=0 }, isSensor = true})
		fireBall.gravityScale =0
		fireBall.isBullet = true
		
		fireBall.collision = weaponCollide
		fireBall:addEventListener( "collision" )

		fireBall.attacked = true
		fireBall.waveAttacked=true
		if hero.xScale==-1 then
			fireBall.xScale=-1
			if moveNow2=="up" then
				fireBall.rotation=90
				transition.to( fireBall,  { time=600,y = fireBall.y -600,onComplete = removeBody } )
			elseif moveNow2=="down" then
				fireBall.rotation=-90
				transition.to( fireBall,  { time=600,y = fireBall.y +600,onComplete = removeBody } )
			else
				transition.to( fireBall,  { time=1000,x = fireBall.x -1000,onComplete = removeBody } )
			end
		else
			if moveNow2=="up" then
				fireBall.rotation=-90
				transition.to( fireBall,  { time=600,y = fireBall.y -600,onComplete = removeBody } )
			elseif moveNow2=="down" then
				fireBall.rotation=90
				transition.to( fireBall,  { time=600,y = fireBall.y +600,onComplete = removeBody } )
			else
				transition.to( fireBall,  { time=1000,x = fireBall.x +1000,onComplete = removeBody } )
			end
		end
    end
end
function specialAbility(self)
	if fireAbility== true and gameStatus.drakzWave>=1 then
		fireAbilityCount= fireAbilityCount+1
	end

	if iceAbility== true then
		iceAbilityCount= iceAbilityCount+1
	end

	if superfireAbility== true and gameStatus.superFireBall>=1 then
		superfireAbilityCount= superfireAbilityCount+1
	end

	if supericeAbility== true and gameStatus.superIceBlast>=1 then
		supericeAbilityCount= supericeAbilityCount+1
	end

	--print("frie"..fireAbilityCount)
end
Runtime:addEventListener( "enterFrame", specialAbility )

-----------------------------------------

 function handleButtonEvent2( event )
 
	if ( "began" == event.phase) then 

		if (ableToPress == true and loading == false and paused==false) then
	--elseif ( "ended" == event.phase and ableToPress == true) then
	attackIsPressed= true
	if attackNo == 1 then
			attackNo = 2

			--fire ability
		fireAbility =true
		fireAbilityCount = 0
		ableToPress = false
		attackAnim =true
		weaponRect.attacked = true
		--seq = "attack"

		if (loading == false) then
		hero:setSequence("attack")
		hero:play()
		audio.play( soundAttack)

		weapon:setSequence("attack1")
		weapon:play()
		end

		weaponDistX = 17

		if doubleJump > 1 then
		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( vx, 0 )
		hero:applyLinearImpulse( nil, -70, hero.x, hero.y )
		end

		if hero.xScale==-1 then
			transition.to (weaponRect, {time = 150,rotation=-210,onComplete=resetAngle})
		else
			transition.to (weaponRect, {time = 150,rotation=210,onComplete=resetAngle})
		end
		--timer.performWithDelay(150,resetAnim,1)
		transition.to (weaponRect, {time = 150,onComplete=resetAnim})
		transition.to (weaponRect, {time = 150,onComplete=attackFalse})
		resetAttackTimer=timer.performWithDelay(450,weaponReturn,1)
	elseif attackNo == 2 then
		attackNo = 3
		fireAbility =true
		fireAbilityCount = 0
		timer.cancel(resetAttackTimer)

		ableToPress = false

		attackAnim =true
		weaponRect.attacked = true
		--seq = "attack"
		if (loading == false) then
		hero:setSequence("attack2")
		hero:play()
		audio.play( soundAttack)

		weapon:setSequence("attack2")
		weapon:play()
		end

		weaponDistX = 22

		if doubleJump > 1 then
		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( vx, 0 )
		hero:applyLinearImpulse( nil, -75, hero.x, hero.y )
		end

		if hero.xScale==-1 then
			transition.to (weaponRect, {time = 200,rotation=360,onComplete=resetAngle})
		else
			transition.to (weaponRect, {time = 200,rotation=-360,onComplete=resetAngle})
		end

		transition.to (weaponRect, {time = 200,onComplete=resetAnim})
		transition.to (weaponRect, {time = 200,onComplete=attackFalse})
		resetAttackTimer2=timer.performWithDelay(450,weaponReturn,1)
	elseif attackNo == 3 then
			attackNo = 1
			fireAbility =true
			fireAbilityCount = 0
			timer.cancel(resetAttackTimer2)

		ableToPress = false

		attackAnim =true
		weaponRect.attacked = true
		--seq = "attack"
		if (loading == false) then
		hero:setSequence("attack3")
		hero:play()
		audio.play( soundAttack3)

		weapon:setSequence("throw")
		weapon:play()
		end

		weaponDistX = 55

		if doubleJump > 1 then
		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( vx, 0 )
		hero:applyLinearImpulse( nil, -80, hero.x, hero.y )
		end

		if hero.xScale==-1 then
			transition.to (weaponRect, {time = 350,rotation=750,onComplete=resetAngle})
		else
			transition.to (weaponRect, {time = 350,rotation=-750,onComplete=resetAngle})
		end

		timer.performWithDelay(350,resetAnim,1)
		transition.to (weaponRect, {time = 250,onComplete=attackFalse})
		timer.performWithDelay(350,weaponReturn,1)
        
		end
	end

		elseif ( "ended" == event.phase) then
		--if readyToMove==false or attackIsPressed== true then
		--	attackIsPressed= false
		--	fireAbility =false

			if fireAbilityCount >=60 and paused == false then
				if (loading == false) then
					hero:setSequence("attack")
					hero:play()
			
					weapon:setSequence("attack1")
					weapon:play()
					castWave(hero)
					timer.performWithDelay(150,resetAnim,1)
					timer.performWithDelay(400,weaponReturn,1)
				end
			end

	--	else

		----	readyToMove = false
		--	boomStick.x = screenLeft-100
		--	boomStick.y = centerY
		--	boomDot.x = screenLeft-100
		--	boomDot.y = centerY
		--	moveNow ="stop"
		--	moveNow2 ="stop"
			
		--end
	end

end
 
 button2 = widget.newButton(
    {
      --  width = 150,
       -- height = 150,
        --defaultFile = "images/button1.png",
        --overFile = "images/button2.png",
        --label = "A",
		--onEvent = handleButtonEvent2
		
		sheet = buttonSheet,
        defaultFrame = 5,
        overFrame = 6,
        label = "",
        onEvent = handleButtonEvent2
    }
)
 
-- Center the button
button2.x = screenRight-250
button2.y = screenBottom-260
button2.alpha = 0.4
uiGroup:insert( button2 )

--[[local function dashFront()

	local function stop()
		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( 0, 0 )
		hero:applyLinearImpulse( 0, nil, hero.x, hero.y )
	end

	local vx, vy = hero:getLinearVelocity()
	hero:setLinearVelocity( vx, vy )
	hero:applyLinearImpulse( 200, 0, hero.x, hero.y )
	hero.alpha = 0
	transition.to (hero, {time = 100,alpha = 1,onComplete=stop})

end

local function dashBack()
	local function stop()
		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( 0, 0 )
		hero:applyLinearImpulse( 0, nil, hero.x, hero.y )
	end

	local vx, vy = hero:getLinearVelocity()
	hero:setLinearVelocity( vx, vy )
	hero:applyLinearImpulse( -200, 0, hero.x, hero.y )
	hero.alpha = 0
	transition.to (hero, {time = 100,alpha = 1,onComplete=stop})
end

local function dash()

	local function stop()
		local vx, vy = hero:getLinearVelocity()
		hero:setLinearVelocity( 0, 0 )
		hero:applyLinearImpulse( 0, nil, hero.x, hero.y )
	end

	local 	speedY = -100 * (math.sin(angle.rotation*(math.pi/180)))
	local	speedX = 100 * (math.cos(angle.rotation*(math.pi/180)))

	   hero:applyLinearImpulse( speedY, speedX, hero.x, hero.y )

	   transition.to( hero,{time=100,onComplete=stop})

end--]]
local function resetCast()
	justCastFire = false
	justCastIce = false
end

 function handleButtonEvent3( event )
	if paused==false then
 
	if ( "began" == event.phase ) then

		superfireAbility =true
		superfireAbilityCount = 0
	elseif ( "ended" == event.phase ) then
		if gameStatus.mp <=1 then
		else
			if superfireAbilityCount>=60 then
				superfireAbility=false
				gameStatus.mp = gameStatus.mp - 3
				castsuperFire(hero)
			else
				if justCastFire==false then
				gameStatus.mp = gameStatus.mp - 2
				castFire(hero)
				justCastFire = true
				timer.performWithDelay(300,resetCast,1)
				end
			end
		end
	end
end
end
 
 button3 = widget.newButton(
    {
		sheet = buttonSheet,
        defaultFrame = 1,
        overFrame = 2,
        label = "",
        onEvent = handleButtonEvent3
    }
)
 
if gameStatus.drakzFireBall>=1 then
button3.x = screenRight-20
button3.y = screenBottom-260
button3.alpha = 0.4
uiGroup:insert( button3 )
else
button3.x = screenRight+320
button3.y = screenBottom-260
button3.alpha = 0.4
uiGroup:insert( button3 )

end


function handleButtonEvent4( event )
	if paused==false then
 
	if ( "began" == event.phase ) then
		supericeAbility =true
		supericeAbilityCount = 0


	elseif ( "ended" == event.phase ) then
		if gameStatus.mp <=0 then
		else
			if supericeAbilityCount>=60 then
				supericeAbility=false
				gameStatus.mp = gameStatus.mp - 3
				castsuperIce(hero)
			else
				if justCastIce==false then
					gameStatus.mp = gameStatus.mp - 2
					castIce(hero)
					justCastIce=true
					timer.performWithDelay(300,resetCast,1)
				end
			end
		end


	end
end
end
 
 button4 = widget.newButton(
    {
		sheet = buttonSheet,
        defaultFrame = 7,
        overFrame = 8,
        label = "",
        onEvent = handleButtonEvent4
    }
)
 
if gameStatus.drakzIceBlast>=1 then
button4.x = screenRight-20
button4.y = screenBottom-80
button4.alpha = 0.4
uiGroup:insert( button4 )
else
	button4.x = screenRight+320
button4.y = screenBottom-80
button4.alpha = 0.4
uiGroup:insert( button4 )

end

function handleButtonEvent6( event )
	if paused==false and hero.isDead== false then
 
	if ( "began" == event.phase ) then
		createHealRing()
		gameStatus.hp = gameStatus.hp + 19 + gameStatus.magLv
		audio.play( soundHeal)
		button6.alpha = 0
		gameStatus.haveHeart=0
	end
end
end
 
 button6 = widget.newButton(
    {
		sheet = buttonSheet2,
        defaultFrame = 1,
        overFrame = 2,
        label = "",
        onEvent = handleButtonEvent6
    }
)
 
button6.x = centerX+525
button6.y = screenTop+250
uiGroup:insert( button6 )
if gameStatus.haveHeart == 1 then
	button6.alpha = .5
else
	button6.alpha = 0
end




function handleButtonEvent5( event )
 
	if ( "began" == event.phase ) then

		--hero.hp = hero.maxHp
		--animation.pause()
		if paused == false then
			paused = true

			readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"

		transition.pause()
		--timer.pause()
		physics.pause( )
		physics.setGravity( 0,0)

		---menu on pause
		transition.to( pausedMenu,{time=300,y=centerY})
		transition.to( quitButton,{time=300,y=centerY+260})
		--callMenu()

		--revealAbility()
		callAttribute()

		else
			paused = false
		transition.resume()
		--timer.resume()
		physics.start( )
		physics.setGravity( 0,100)
		
			hideMenu()
				---menu on unpause
		--hideMenu()
		transition.to( pausedMenu,{time=300,y=screenBottom+1000})
		transition.to( quitButton,{time=300,y=screenBottom+1000})
		transition.to( yesButton,{time=300,y=screenBottom+1000})
		transition.to( noButton,{time=300,y=screenBottom+1000})
		end
	--elseif ( "moved" == event.phase ) then

	--elseif ( "ended" == event.phase ) then
		--transition.resume()
		--timer.resume()
		--physics.start( )
		--physics.setGravity( 0,100)


    end
end
 
 button5 = widget.newButton(
    {
        width = 48,
        height = 48,
        defaultFile = "images/pause.png",
        overFile = "images/pause.png",
        label = "",
		onEvent = handleButtonEvent5
    }
)
 
-- Center the button
button5.x = centerX+525
button5.y = screenTop+20
button5.alpha = 0.6
uiGroup:insert( button5 )

end

function removeMe(self)
	display.remove(self)
end


------------------experimental only ------------

local function experimentalControl()


	boomStick.alpha =.3
	boomDot.alpha=.3
	local stickRange =50
	local stickRangeY =70


	 function control(event)


		if loading == false and paused==false then

		if ( event.phase == "began" ) then

			if event.x < centerX then

			boomStick.x = event.x
			boomStick.y = event.y
			boomDot.x = event.x
			boomDot.y = event.y
			readyToMove = true
			createDust()
			end

			--uiGroup:insert( js )

		elseif ( event.phase == "moved" ) then
			if readyToMove==true and loading == false and paused==false then
				boomStick.x =event.x
				boomStick.y =event.y

				if boomStick.x > boomDot.x +stickRange then
					boomStick.x = boomDot.x +stickRange
				elseif boomStick.x < boomDot.x -stickRange then
					boomStick.x = boomDot.x -stickRange
				end

				if boomStick.y < boomDot.y -stickRangeY then
					boomStick.y = boomDot.y -stickRangeY
				elseif boomStick.y > boomDot.y +stickRangeY then
					boomStick.y = boomDot.y +stickRangeY
				end

				if boomStick.x > boomDot.x then
				--move right
					moveNow = "right"
				elseif boomStick.x < boomDot.x then
					moveNow ="left"
				else
					moveNow ="stop"
				end

				if boomStick.y+(stickRangeY-1) < boomDot.y then
					moveNow2 ="up"
				elseif boomStick.y-(stickRangeY-1) > boomDot.y then
					moveNow2 ="down"
				else
					moveNow2 ="stop"
				end

				print(""..moveNow)
				print(""..moveNow2)

			end

		elseif ( event.phase == "ended" ) then
			--removeMe(boomStick)
			--removeMe(boomDot)
			if event.x < centerX then
			if readyToMove==true then
			readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
			end
			end
		end
	end
		return true

	end

	 function control2()
		if loading ==false and paused==false then

		if hero.xScale == -1 then
			weapon.xScale=-1

			weapon.x = hero.x


			weaponRect.x = hero.x-weaponDistX
			if moveNow2=="up"then
				weaponRect.y = hero.y-weaponDistY
				weapon.y = hero.y-weaponDistY
			elseif moveNow2=="down"then
				weaponRect.y = hero.y+weaponDistY
				weapon.y = hero.y+weaponDistY
			else
			weaponRect.y = hero.y-weaponDistY
			weapon.y = hero.y-weaponDistY
			end
		else
			weapon.xScale=1
			weapon.x = hero.x


			weaponRect.x = hero.x+weaponDistX
			if moveNow2=="up"then
				weaponRect.y = hero.y-weaponDistY
				weapon.y = hero.y-weaponDistY
			elseif moveNow2=="down"then
				weaponRect.y = hero.y+weaponDistY
				weapon.y = hero.y+weaponDistY
			else
			weaponRect.y = hero.y-weaponDistY
			weapon.y = hero.y-weaponDistY
			end
		end


		if moveNow=="right" and hero.attackDown == false then
			if moveNow2=="down"then
				if doubleJump ==1 then
				weapon.rotation =45
				weaponRect.rotation =45
				weaponDistY =0
				hero.x =hero.x +0
				hero.xScale=1
				seq = "down"
				hero:play()
				else
					weapon.rotation =45
					weaponRect.rotation =45
					weaponDistY =0
					hero.x =hero.x +(heroSpeed-1)
					hero.xScale=1
					seq = "down"
					hero:play()
				end
			elseif moveNow2=="up"then
				if doubleJump ==1 then
					weapon.rotation =-70
					weaponRect.rotation =-70
					weaponDistY =5
					hero.x =hero.x +0
					hero.xScale=1
					seq = "up"
					hero:play()
					else
				weapon.rotation =-70
				weaponRect.rotation =-70
				weaponDistY =5
				hero.x =hero.x + (heroSpeed-1)
				hero.xScale=1
				seq = "up"
				hero:play()
					end

			else
			weapon.rotation =0
			if hero.xScale==-1 then
				weaponRect.rotation =30
			else
			weaponRect.rotation =-30
			end
			hero.x =hero.x + heroSpeed
			hero.xScale=1
			seq = "run"
			hero:play()
			walkSound()
			end
		elseif  moveNow=="left" and hero.attackDown == false then

			if moveNow2=="down"then
				if doubleJump ==1 then
				weapon.rotation =-45
				weaponRect.rotation =-45
				weaponDistY =0
				hero.x =hero.x +0
				hero.xScale=-1
				seq = "down"
				hero:play()
				else
					weapon.rotation =-45
					weaponRect.rotation =-45
					weaponDistY =0
					hero.x =hero.x -(heroSpeed-1)
					hero.xScale=-1
					seq = "down"
					hero:play()
				end
			elseif moveNow2=="up"then
				if doubleJump ==1 then
					weapon.rotation =70
					weaponRect.rotation =70
					weaponDistY =5
					hero.x =hero.x +0
					hero.xScale=-1
					seq = "up"
					hero:play()
					else
				weapon.rotation =70
				weaponRect.rotation =70
				weaponDistY =5
				hero.x =hero.x -(heroSpeed-1)
				hero.xScale=-1
				seq = "up"
				hero:play()
					end

			else
			weapon.rotation =0
			if hero.xScale==-1 then
				weaponRect.rotation =30
			else
			weaponRect.rotation =-30
			end
			weaponDistY =-10
			hero.x =hero.x - heroSpeed
			hero.xScale=-1
			seq = "run"
			hero:play()
			walkSound()
			end

			
		else
			hero.x =hero.x +0
			weapon.rotation =0
			if hero.xScale==-1 then
				weaponRect.rotation =30
			else
			weaponRect.rotation =-30
			end
			weaponDistY =-10
			--local vx, vy = hero:getLinearVelocity()
			--hero:setLinearVelocity( 0, vy )
			--hero:applyLinearImpulse( 0, nil, hero.x, hero.y )
			if hero.attackDown == true then
				weaponRect.rotation =90
				weaponRect.y = hero.y+40
				weaponRect.x = hero.x-25
			else
			seq = "idle"
			hero:play()
			end
		end



		if(not (seq == hero.sequence)  ) then -- and not attacking
			if attackAnim==true or actingJump == true or absorbAnim == true then
			else
			hero:setSequence(seq)
			end
		end
			if gameStatus.rechargeMp==1 then
				mpCount = mpCount + 1
				if mpCount >= 180 then
					mpCount=0
					gameStatus.mp = gameStatus.mp +1
				end
			end

			if gameStatus.hp > gameStatus.maxHp then
				gameStatus.hp = gameStatus.maxHp
			end
			if gameStatus.mp > gameStatus.maxMp then
				gameStatus.mp = gameStatus.maxMp
			end
			if gameStatus.mp <=0 then
				magicLine.yScale=.01
			else
				magicLine.yScale = gameStatus.mp/gameStatus.maxMp
			end

			if gameStatus.hp <=0 then
				heartLine.yScale=.01
			else
			heartLine.yScale = gameStatus.hp/gameStatus.maxHp
			end



		end
		coinText.text = ""..gameStatus.coin

		if blackRoom == true and loading == false then

			black.x = hero.x
			black.y = hero.y

		end

		if caveRoom == true and loading == false then

			--cave.x = centerX -(hero.x *.05)
			--cave.y = centerY -(hero.y *.05)
			--cave2.x = centerX -(hero.x *.2)

		end

		if coleIsAlive==true  then
			if coleHasWeapon == true then
				if cole.xScale == -1 then
				gunSword.x = cole.x+10
				else
				gunSword.x = cole.x-10
				end
				gunSword.y = cole.y+20


			end

		end
	end

	Runtime:addEventListener( "touch", control )
	Runtime:addEventListener( "enterFrame", control2 )
end

 function walkSound()
	if soundOn == true then
	else
		if runningSound==false then
			audio.play( soundRunning)

		end
		soundOn = true 
	  local function soundOff()
	   soundOn=false
	   end
	timer.performWithDelay(400,soundOff,1)
	end
  end

local function allBarFalse()
	hpSelected = false
	mpSelected = false
	strSelected = false
	mgcSelected = false
	fireBallSelected = false
	iceBlastSelected = false
	dashDownSelected = false
	sonicWaveSelected = false
	highJumpSelected = false

end

function callAttribute()

	if gameStatus.drakzFireBall>=1 then
		transition.to( FBSquare,{time=250,y=centerY-200,x = centerX-50})
	end
	if gameStatus.drakzIceBlast>=1 then
		transition.to( IBSquare,{time=260,y=centerY-200,x = centerX+50})
	end
	if gameStatus.drakzDashDown>=1 then
		transition.to( DDSquare,{time=270,y=centerY-200,x = centerX+150})
	end
	if gameStatus.drakzDoubleJump>=1 then
		transition.to( DJSquare,{time=280,y=centerY-200,x = centerX-150})
	end
	
	--	transition.to( HJSquare,{time=290,y=centerY+120})
	
	if gameStatus.drakzHighJump>=1 then
		transition.to( DUSquare,{time=250,y=centerY-100,x = centerX-150})
	end
	if gameStatus.superFireBall>=1 then
		transition.to( SFSquare,{time=260,y=centerY-100,x = centerX-50})
	end
	if gameStatus.superIceBlast>=1 then
		transition.to( SISquare,{time=270,y=centerY-100,x = centerX+50})
	end
	if gameStatus.drakzWave>=1 then
		transition.to( SWSquare,{time=280,y=centerY-100,x = centerX+150})
	end
	
	if gameStatus.magnetic>=1 then
		transition.to( MAGSquare,{time=250,y=centerY,x = centerX-150})
	end
	if gameStatus.extraCoins>=1 then
		transition.to( ECSquare,{time=260,y=centerY,x = centerX-50})
	end
	if gameStatus.speedBoost>=1 then
		transition.to( SBSquare,{time=270,y=centerY,x = centerX+50})
	end
	if gameStatus.rechargeMp>=1 then
		transition.to( RMSquare,{time=280,y=centerY,x = centerX+150})
	end

	transition.to( hpButton,{time=270,y=centerY+90,x = centerX-160})
	transition.to( mpButton,{time=280,y=centerY+130,x = centerX-160})
	transition.to( strButton,{time=290,y=centerY+170,x = centerX-160})
	transition.to( magButton,{time=300,y=centerY+210,x = centerX-160})


	transition.to( skillTitle,{time=300,y=centerY+90,x = centerX+160})
	transition.to( SkillDescription,{time=300,y=centerY+140,x = centerX+160})
	transition.to( SkillInstruction,{time=300,y=centerY+180,x = centerX+160})

end

function revealAbility()
	if gameStatus.drakzFireBall>=1 then
		transition.to( FBSquare,{time=250,y=centerY-200,x = centerX+50})
	end
	if gameStatus.drakzIceBlast>=1 then
		transition.to( IBSquare,{time=260,y=centerY-200,x = centerX+150})
	end
	if gameStatus.drakzDashDown>=1 then
		transition.to( DDSquare,{time=270,y=centerY-200,x = centerX+250})
	end
	if gameStatus.drakzDoubleJump>=1 then
		transition.to( DJSquare,{time=280,y=centerY-200,x = centerX+350})
	end
	
	--	transition.to( HJSquare,{time=290,y=centerY+120})
	
	if gameStatus.drakzHighJump>=1 then
		transition.to( DUSquare,{time=250,y=centerY-100,x = centerX+50}) 
	end
	if gameStatus.superFireBall>=1 then
		transition.to( SFSquare,{time=260,y=centerY-100,x = centerX+150}) 
	end
	if gameStatus.superIceBlast>=1 then
		transition.to( SISquare,{time=270,y=centerY-100,x = centerX+250})
	end
	if gameStatus.drakzWave>=1 then
		transition.to( SWSquare,{time=280,y=centerY-100,x = centerX+350})
	end
	
	if gameStatus.magnetic>=1 then
		transition.to( MAGSquare,{time=250,y=centerY,x = centerX+50})
	end
	if gameStatus.extraCoins>=1 then
		transition.to( ECSquare,{time=260,y=centerY,x = centerX+150})
	end
	if gameStatus.speedBoost>=1 then
		transition.to( SBSquare,{time=270,y=centerY,x = centerX+250})
	end
	if gameStatus.rechargeMp>=1 then
		transition.to( RMSquare,{time=280,y=centerY,x = centerX+350})
	end

	transition.to( HPSquare,{time=300,y=centerY-75,x = centerX-380})
	transition.to( MPSquare,{time=300,y=centerY,x = centerX-380})
	transition.to( STRSquare,{time=300,y=centerY+75,x = centerX-380})
	transition.to( MGCSquare,{time=300,y=centerY+150,x = centerX-380})

	transition.to( hpButton,{time=270,y=centerY-75,x = centerX-250})
	transition.to( mpButton,{time=280,y=centerY,x = centerX-250})
	transition.to( strButton,{time=290,y=centerY+75,x = centerX-250})
	transition.to( magButton,{time=300,y=centerY+150,x = centerX-250})

end


function callMenu()

	transition.to( bgMenu,{time=240,y=centerY})
	transition.to( bgMenu2,{time=240,y=centerY})

	transition.to( drakzPhoto,{time=260,y=centerY-250})

	transition.to( upgradeButtonHp,{time=300,y=centerY-75})
	transition.to( upgradeButtonMp,{time=300,y=centerY})
	transition.to( upgradeButtonStr,{time=300,y=centerY+75})
	transition.to( upgradeButtonMgc,{time=300,y=centerY+150})




revealAbility()


--if gameStatus.drakzDoubleJump>=1 then
	transition.to( skillTitle,{time=300,y=centerY+80,x = centerX+200})
	transition.to( SkillDescription,{time=300,y=centerY+130,x = centerX+200})
	transition.to( SkillInstruction,{time=300,y=centerY+170,x = centerX+200})
--end


	--transition.to( upgradeButton,{time=300,y=centerY+230})
	transition.to( exitButton,{time=300,y=centerY+250})

	transition.to( button5,{time=10,y=screenTop-100})

end

function hideMenu()

	transition.to( bgMenu,{time=300,y=screenBottom+1000})
	transition.to( bgMenu2,{time=300,y=screenBottom+1000})

	transition.to( drakzPhoto,{time=300,y=screenBottom+1000})
	transition.to( hpButton,{time=300,y=screenBottom+1000})
	transition.to( mpButton,{time=300,y=screenBottom+1000})
	transition.to( strButton,{time=300,y=screenBottom+1000})
	transition.to( magButton,{time=300,y=screenBottom+1000})

	transition.to( HPSquare,{time=300,y=screenBottom+1000})
	transition.to( MPSquare,{time=300,y=screenBottom+1000})
	transition.to( STRSquare,{time=300,y=screenBottom+1000})
	transition.to( MGCSquare,{time=300,y=screenBottom+1000})

	transition.to( upgradeButtonHp,{time=300,y=screenBottom+1000})
	transition.to( upgradeButtonMp,{time=300,y=screenBottom+1000})
	transition.to( upgradeButtonStr,{time=300,y=screenBottom+1000})
	transition.to( upgradeButtonMgc,{time=300,y=screenBottom+1000})

	transition.to( FBSquare,{time=250,y=screenBottom+1000})
	transition.to( IBSquare,{time=260,y=screenBottom+1000})
	transition.to( DDSquare,{time=270,y=screenBottom+1000})
	transition.to( DJSquare,{time=280,y=screenBottom+1000})
--	transition.to( HJSquare,{time=290,y=centerY+120})

	transition.to( DUSquare,{time=250,y=screenBottom+1000})
	transition.to( SFSquare,{time=260,y=screenBottom+1000})
	transition.to( SISquare,{time=270,y=screenBottom+1000})
	transition.to( SBSquare,{time=280,y=screenBottom+1000})

	transition.to( MAGSquare,{time=250,y=screenBottom+1000})
	transition.to( ECSquare,{time=260,y=screenBottom+1000})
	transition.to( SWSquare,{time=270,y=screenBottom+1000})
	transition.to( RMSquare,{time=280,y=screenBottom+1000})

	transition.to( SWSquare,{time=270,y=screenBottom+1000})
	transition.to( RMSquare,{time=280,y=screenBottom+1000})	
	transition.to( RMSquare,{time=280,y=screenBottom+1000})


	transition.to( skillTitle,{time=300,y=screenBottom+1000})
	transition.to( SkillDescription,{time=300,y=screenBottom+1000})
	transition.to( SkillInstruction,{time=300,y=screenBottom+1000})


	--transition.to( upgradeButton,{time=300,y=screenBottom+1000})
	transition.to( exitButton,{time=300,y=screenBottom+1000})
	transition.to( button5,{time=100,y=screenTop+20})

	--transition.to( selector,{time=300,y=screenBottom+1000})
	transition.to( selector2,{time=300,y=screenBottom+1000})

end

local function createMenu()
	local fSize =24


	bgMenu = display.newImageRect( uiGroup2, "images/menubg.png", 400,display.actualContentHeight/1.2 )
	bgMenu.anchorX =1
	bgMenu.x = display.contentCenterX-50
	bgMenu.y = screenBottom+1000
	bgMenu.alpha =.8

	bgMenu2 = display.newImageRect( uiGroup2, "images/menubg.png",500,display.actualContentHeight/1.2 )
	bgMenu2.anchorX =0
	bgMenu2.x = display.contentCenterX-50
	bgMenu2.y = screenBottom+1000
	bgMenu2.alpha =.8

	skillTitle =display.newText(uiGroup2,"Skill", centerX+200,screenBottom+1000,  "Rooters.ttf", 30)
	SkillDescription =display.newText(uiGroup2,"Description", centerX+200,screenBottom+1000,  "Rooters.ttf", 21)
	SkillInstruction =display.newText(uiGroup2,"Instruction", centerX+200,screenBottom+1000,  "Rooters.ttf", 20)




	local function SkillText()
					allBarFalse()
		selector2.x = DJSquare.x
		selector2.y = DJSquare.y

		skillTitle.text = "Double Jump"
		SkillDescription.text = "Able to Jump again in mid - air"
		SkillInstruction.text = "Press Jump Twice"
	end
	local function SkillText2()
					allBarFalse()
		selector2.x = FBSquare.x
		selector2.y = FBSquare.y

		skillTitle.text = "Fire Ball"
		SkillDescription.text = "Cast a Fire Ball"
		SkillInstruction.text = "Press Red Fire Ball Button"
	end
	local function SkillText3()
					allBarFalse()
		selector2.x = IBSquare.x
		selector2.y = IBSquare.y

		skillTitle.text = "Ice Blast"
		SkillDescription.text = "Cast an Ice Blast Around You"
		SkillInstruction.text = "Press Blue Ice Blast Button"
	end
	local function SkillText4()
					allBarFalse()
		selector2.x = DDSquare.x
		selector2.y = DDSquare.y

		skillTitle.text = "Dash Down"
		SkillDescription.text = "Dash Down with a Power Slam"
		SkillInstruction.text = "Press Jump Three Times"
	end

	local function SkillText5()
					allBarFalse()
		selector2.x = DUSquare.x
		selector2.y = DUSquare.y

		skillTitle.text = "Dash Up"
		SkillDescription.text = "Power Slam Toward Up"
		SkillInstruction.text = "Press and Hold Jump Button"
	end

	local function SkillText6()
					allBarFalse()
		selector2.x = SFSquare.x
		selector2.y = SFSquare.y

		skillTitle.text = "Super Fire Ball"
		SkillDescription.text = "A Large Fire Ball"
		SkillInstruction.text = "Press and Hold Fire Ball Button"
	end

	local function SkillText7()
					allBarFalse()
		selector2.x = SISquare.x
		selector2.y = SISquare.y

		skillTitle.text = "Super Ice Blast"
		SkillDescription.text = "A Large Ice Blast"
		SkillInstruction.text = "Press and Hold Ice Blast Button"
	end

	local function SkillText8()
					allBarFalse()
		selector2.x = SBSquare.x
		selector2.y = SBSquare.y

		skillTitle.text = "Speed Boost"
		SkillDescription.text = "Running makes it Faster"
		SkillInstruction.text = "Passive - Run Faster"
	end


	local function SkillText9()
					allBarFalse()
		selector2.x = MAGSquare.x
		selector2.y = MAGSquare.y

		skillTitle.text = "Magnetic"
		SkillDescription.text = "Auto Attract Coins, Heart and Stone"
		SkillInstruction.text = "Passive - Magnet Coin, heart, Stone"
	end

	local function SkillText10()
					allBarFalse()
		selector2.x = ECSquare.x
		selector2.y = ECSquare.y

		skillTitle.text = "Extra Coins"
		SkillDescription.text = "Enemy Coins Drop Doubled"
		SkillInstruction.text = "Passive - Coin Drop Doubled"
	end

	local function SkillText11()
					allBarFalse()
		selector2.x = SWSquare.x
		selector2.y = SWSquare.y

		skillTitle.text = "Sonic Wave"
		SkillDescription.text = "Attack Makes A Sonic Boom Wave"
		SkillInstruction.text = "Press and Hold Attack Button"
	end

	local function SkillText12()
					allBarFalse()
		selector2.x = RMSquare.x
		selector2.y = RMSquare.y

		skillTitle.text = "Recharge MP"
		SkillDescription.text = "Recharge any lost MP every Second"
		SkillInstruction.text = "Passive - Regain Mp"
	end


	local spriteOptions = {
        height = 80,
        width = 60,
        numFrames = 105,
        sheetContentWidth = 720,
        sheetContentHeight = 720
      }
      local mySheet = graphics.newImageSheet("images/draxDD.png", spriteOptions)
      local sequenceData = {
        {name = "idle", start =38,count=13, time =900, loopCount =0},
        {name = "absorb", start =95,count=10, time =1100, loopCount =1},
   
      }
     
    
        -- Display the new sprite at the coordinates passed
		drakzPhoto = display.newSprite(uiGroup2,mySheet, sequenceData)
		drakzPhoto:setSequence("idle")
		drakzPhoto:play()
		drakzPhoto.x = centerX-220
		drakzPhoto.y = screenBottom+1000
		drakzPhoto.xScale=3
		drakzPhoto.yScale=3
	

	-------------major Ability
	DJSquare = display.newImageRect( uiGroup2, buttonSheet3,1, 64,64 )
	DJSquare.x = centerX+50
	DJSquare.y = screenBottom+1000

	FBSquare = display.newImageRect( uiGroup2, buttonSheet3,3, 64,64 )
	FBSquare.x = centerX+150
	FBSquare.y = screenBottom+1000

	IBSquare = display.newImageRect( uiGroup2, buttonSheet3,2, 64,64 )
	IBSquare.x = centerX+250
	IBSquare.y = screenBottom+1000

	DDSquare = display.newImageRect( uiGroup2, buttonSheet3,4, 64,64 )
	DDSquare.x = centerX+350
	DDSquare.y = screenBottom+1000

	-------------minor Ability
	DUSquare = display.newImageRect( uiGroup2, buttonSheet3,5, 64,64 )
	DUSquare.x = centerX+50
	DUSquare.y = screenBottom+1000

	SFSquare = display.newImageRect( uiGroup2, buttonSheet3,6, 64,64 )
	SFSquare.x = centerX+150
	SFSquare.y = screenBottom+1000
	
	SISquare = display.newImageRect( uiGroup2, buttonSheet3,7, 64,64 )
	SISquare.x = centerX+250
	SISquare.y = screenBottom+1000

	SWSquare = display.newImageRect( uiGroup2, buttonSheet3,11, 64,64 )
	SWSquare.x = centerX+350
	SWSquare.y = screenBottom+1000


	-------------bonus Ability
	MAGSquare = display.newImageRect( uiGroup2, buttonSheet3,9, 64,64 )
	MAGSquare.x = centerX+50
	MAGSquare.y = screenBottom+1000

	ECSquare = display.newImageRect( uiGroup2, buttonSheet3,10, 64,64 )
	ECSquare.x = centerX+150
	ECSquare.y = screenBottom+1000


	SBSquare = display.newImageRect( uiGroup2, buttonSheet3,8, 64,64 )
	SBSquare.x = centerX+250
	SBSquare.y = screenBottom+1000

	RMSquare = display.newImageRect( uiGroup2, buttonSheet3,12, 64,64 )
	RMSquare.x = centerX+350
	RMSquare.y = screenBottom+1000


	DJSquare:addEventListener( "tap", SkillText )
	FBSquare:addEventListener( "tap", SkillText2 )
	IBSquare:addEventListener( "tap", SkillText3 )
	DDSquare:addEventListener( "tap", SkillText4 )

	DUSquare:addEventListener( "tap", SkillText5 )
	SFSquare:addEventListener( "tap", SkillText6 )
	SISquare:addEventListener( "tap", SkillText7 )
	SBSquare:addEventListener( "tap", SkillText8 )

	MAGSquare:addEventListener( "tap", SkillText9 )
	ECSquare:addEventListener( "tap", SkillText10 )
	SWSquare:addEventListener( "tap", SkillText11 )
	RMSquare:addEventListener( "tap", SkillText12 )


	--HJSquare = display.newImageRect( uiGroup2, "images/redSquare.png", 64,64 )
	--HJSquare.x = centerX
	--HJSquare.y = screenBottom+1000

	--selector = display.newImageRect( uiGroup2, "images/yellowSelector.png", 64,64 )
	--selector.x = centerX
	--selector.y = screenBottom+1000


	local function hpShow()
		if gameStatus.hpLv == 1 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 2 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 3 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 4 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 5 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 6 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 7 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 8 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 9 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 10 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		elseif gameStatus.hpLv == 11 then
			hpButton:setLabel( "Hp "..gameStatus.maxHp)
		end
	end

	local function mpShow()
		if gameStatus.mpLv == 1 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 2 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 3 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 4 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 5 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 6 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 7 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 8 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 9 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 10 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		elseif gameStatus.mpLv == 11 then
			mpButton:setLabel( "Mp "..gameStatus.maxMp)
		end
	end

	local function strShow()
		if gameStatus.strLv == 1 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 2 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 3 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 4 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 5 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 6 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 7 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 8 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 9 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 10 then
			strButton:setLabel( "Str "..gameStatus.str)
		elseif gameStatus.strLv == 11 then
			strButton:setLabel( "Str "..gameStatus.str)
		end
	end

	local function magShow()
		if gameStatus.magLv == 1 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 2 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 3 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 4 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 5 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 6 then
			magButton:setLabel( "Mag "..gameStatus.mag)
		elseif gameStatus.magLv == 7 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 8 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 9 then
			magButton:setLabel( "Mag "..gameStatus.mag)
		elseif gameStatus.magLv == 10 then
			magButton:setLabel( "Mag "..gameStatus.mag )
		elseif gameStatus.magLv == 11 then
			magButton:setLabel( "Mag "..gameStatus.mag)
		end
	end


	function hpButtonF( event )
 
		if ( "began" == event.phase ) then
			if gameStatus.hpLv == 1 then
				coinsRequire = 400
			elseif gameStatus.hpLv == 2 then
				coinsRequire = 800
			elseif gameStatus.hpLv == 3 then
				coinsRequire = 1200
			elseif gameStatus.hpLv == 4 then
				coinsRequire = 1600
			elseif gameStatus.hpLv == 5 then
				coinsRequire = 2000
			elseif gameStatus.hpLv == 6 then
				coinsRequire = 2400
			elseif gameStatus.hpLv == 7 then
				coinsRequire = 2800
			elseif gameStatus.hpLv == 8 then
				coinsRequire = 3200
			elseif gameStatus.hpLv == 9 then
				coinsRequire = 3600
			elseif gameStatus.hpLv == 10 then
				coinsRequire = 4000
			elseif gameStatus.hpLv == 11 then
				coinsRequire = 0000

			end

		skillTitle.text = "Lv "..gameStatus.hpLv
		SkillDescription.text = "HP "..gameStatus.maxHp.." +3"
		SkillInstruction.text = "Coins Required "..coinsRequire
		end
	end
	 
	 hpButton = widget.newButton(
		{
			width = 200,
			height = 30,
			defaultFile = "images/hpRed.png",
			overFile = "images/hpRed.png",
			label = "Hp "..gameStatus.maxHp,
			fontSize =fSize,
			font="Rooters.ttf",
			onEvent = hpButtonF
		}
	)
	-- Center the button
	hpButton.x = centerX-250
	hpButton.y = screenBottom+1000
	uiGroup2:insert( hpButton )


	function mpButtonF( event )
 
		if ( "began" == event.phase ) then
			if gameStatus.mpLv == 1 then
				coinsRequire = 300
			elseif gameStatus.mpLv == 2 then
				coinsRequire = 600
			elseif gameStatus.mpLv == 3 then
				coinsRequire = 900
			elseif gameStatus.mpLv == 4 then
				coinsRequire = 1200
			elseif gameStatus.mpLv == 5 then
				coinsRequire = 1500
			elseif gameStatus.mpLv == 6 then
				coinsRequire = 1800
			elseif gameStatus.mpLv == 7 then
				coinsRequire = 2100
			elseif gameStatus.mpLv == 8 then
				coinsRequire = 2400
			elseif gameStatus.mpLv == 9 then
				coinsRequire = 2700
			elseif gameStatus.mpLv == 10 then
				coinsRequire = 3000
			elseif gameStatus.mpLv == 11 then
				coinsRequire = 0000

			end

			skillTitle.text = "Lv "..gameStatus.mpLv
			SkillDescription.text = "MP "..gameStatus.maxMp.." +2"
			SkillInstruction.text = "Coins Required "..coinsRequire
		end
	end
	 
	 mpButton = widget.newButton(
		{
			width = 200,
			height = 30,
			defaultFile = "images/mpBlue.png",
			overFile = "images/mpBlue.png",
			label = "Mp "..gameStatus.maxMp,
			fontSize =fSize,
			font="Rooters.ttf",
			onEvent = mpButtonF
		}
	)
	-- Center the button
	mpButton.x = centerX-250
	mpButton.y = screenBottom+1000
	uiGroup2:insert( mpButton )

	function strButtonF( event )
 
		if ( "began" == event.phase ) then
			if gameStatus.strLv == 1 then
				coinsRequire = 400
			elseif gameStatus.strLv == 2 then
				coinsRequire = 800
			elseif gameStatus.strLv == 3 then
				coinsRequire = 1200
			elseif gameStatus.strLv == 4 then
				coinsRequire = 1600
			elseif gameStatus.strLv == 5 then
				coinsRequire = 2000
			elseif gameStatus.strLv == 6 then
				coinsRequire = 2400
			elseif gameStatus.strLv == 7 then
				coinsRequire = 2800
			elseif gameStatus.strLv == 8 then
				coinsRequire = 3200
			elseif gameStatus.strLv == 9 then
				coinsRequire = 3600
			elseif gameStatus.strLv == 10 then
				coinsRequire = 4000
			elseif gameStatus.strLv == 11 then
				coinsRequire = 0000

			end

			skillTitle.text = "Lv "..gameStatus.strLv
			SkillDescription.text = "STR "..gameStatus.str.." +1"
			SkillInstruction.text = "Coins Required "..coinsRequire
		end
	end
	 
	 strButton = widget.newButton(
		{
			width = 200,
			height = 30,
			defaultFile = "images/strOrange.png",
			overFile = "images/strOrange.png",
			label = "Str "..gameStatus.str,
			fontSize =fSize,
			font="Rooters.ttf",
			onEvent = strButtonF
		}
	)
	-- Center the button
	strButton.x = centerX-250
	strButton.y = screenBottom+1000
	uiGroup2:insert( strButton )

	function magButtonF( event )
 
		if ( "began" == event.phase ) then
			if gameStatus.magLv == 1 then
				coinsRequire = 300
			elseif gameStatus.magLv == 2 then
				coinsRequire = 600
			elseif gameStatus.magLv == 3 then
				coinsRequire = 900
			elseif gameStatus.magLv == 4 then
				coinsRequire = 1200
			elseif gameStatus.magLv == 5 then
				coinsRequire = 1500
			elseif gameStatus.magLv == 6 then
				coinsRequire = 1800
			elseif gameStatus.magLv == 7 then
				coinsRequire = 2100
			elseif gameStatus.magLv == 8 then
				coinsRequire = 2400
			elseif gameStatus.magLv == 9 then
				coinsRequire = 2700
			elseif gameStatus.magLv == 10 then
				coinsRequire = 3000
			elseif gameStatus.magLv == 11 then
				coinsRequire = 0000

			end


			skillTitle.text = "Lv "..gameStatus.magLv
			SkillDescription.text = "MAG "..gameStatus.mag.." +1"
			SkillInstruction.text = "Coins Required "..coinsRequire
		end
	end
	 
	 magButton = widget.newButton(
		{
			width = 200,
			height = 30,
			defaultFile = "images/mgcGreen.png",
			overFile = "images/mgcGreen.png",
			label = "Mag "..gameStatus.mag,
			fontSize =fSize,
			font="Rooters.ttf",
			onEvent = magButtonF
		}
	)
	-- Center the button
	magButton.x = centerX-250
	magButton.y = screenBottom+1000
	uiGroup2:insert( magButton )


	HPSquare = display.newImageRect( uiGroup2, buttonSheet3,13, 64,64 )
	HPSquare.x = centerX-380
	HPSquare.y = screenBottom+1000

	MPSquare = display.newImageRect( uiGroup2, buttonSheet3,14, 64,64 )
	MPSquare.x = centerX-380
	MPSquare.y = screenBottom+1000

	STRSquare = display.newImageRect( uiGroup2, buttonSheet3,15, 64,64 )
	STRSquare.x = centerX-380
	STRSquare.y = screenBottom+1000

	MGCSquare = display.newImageRect( uiGroup2, buttonSheet3,16, 64,64 )
	MGCSquare.x = centerX-380
	MGCSquare.y = screenBottom+1000



	--------------------upgrade button----------------

	function upgradeButtonHpF( event )
 
		if ( "began" == event.phase ) then

			if hpSelected == true then
				if gameStatus.hpLv == 1 then
					if gameStatus.coin >= 400 then
						coinsRequire =800
						gameStatus.coin = gameStatus.coin -400
						gameStatus.maxHp = 23
						gameStatus.hpLv =2
						audio.play( soundSelected)
					else
						coinsRequire =400
						audio.play( soundError)
					end
				elseif gameStatus.hpLv == 2 then
					if gameStatus.coin >= 800 then
						coinsRequire =1200
						gameStatus.coin = gameStatus.coin -800
						gameStatus.maxHp = 26
						gameStatus.hpLv =3
						audio.play( soundSelected)
					else
						coinsRequire =800
						audio.play( soundError)
					end
				elseif gameStatus.hpLv == 3 then
					if gameStatus.coin >= 1200 then
						coinsRequire =1600
						gameStatus.coin = gameStatus.coin -1200
						gameStatus.maxHp = 29
						gameStatus.hpLv =4
						audio.play( soundSelected)
					else
						coinsRequire =1200
						audio.play( soundError)
					end
				elseif gameStatus.hpLv == 4 then
					if gameStatus.coin >= 1600 then
						coinsRequire =2000
						gameStatus.coin = gameStatus.coin -1600
						gameStatus.maxHp = 32
						gameStatus.hpLv =5
						audio.play( soundSelected)
					else
						coinsRequire =1600
						audio.play( soundError)
					end
				elseif gameStatus.hpLv == 5 then
					if gameStatus.coin >= 2000 then
						coinsRequire =2400
						gameStatus.coin = gameStatus.coin -2000
						gameStatus.maxHp = 35
						gameStatus.hpLv =6
						audio.play( soundSelected)
					else
						coinsRequire =2000
						audio.play( soundError)
					end
				elseif gameStatus.hpLv == 6 then
						if gameStatus.coin >= 2400 then
							coinsRequire =2800
							gameStatus.coin = gameStatus.coin -2400
							gameStatus.maxHp = 38
							gameStatus.hpLv =7
							audio.play( soundSelected)
						else
							coinsRequire =2400
							audio.play( soundError)
						end
					elseif gameStatus.hpLv ==7 then
						if gameStatus.coin >= 2800 then
							coinsRequire =3200
							gameStatus.coin = gameStatus.coin -2800
							gameStatus.maxHp = 41
							gameStatus.hpLv =8
							audio.play( soundSelected)
						else
							coinsRequire =2800
							audio.play( soundError)
						end
					elseif gameStatus.hpLv == 8 then
						if gameStatus.coin >= 3200 then
							coinsRequire =3600
							gameStatus.coin = gameStatus.coin -3200
							gameStatus.maxHp = 44
							gameStatus.hpLv =9
							audio.play( soundSelected)
						else
							coinsRequire =3200
							audio.play( soundError)
						end
					elseif gameStatus.hpLv == 9 then
						if gameStatus.coin >= 3600 then
							coinsRequire =4000
							gameStatus.coin = gameStatus.coin -3600
							gameStatus.maxHp = 47
							gameStatus.hpLv =10
							audio.play( soundSelected)
						else
							coinsRequire =3600
							audio.play( soundError)
						end
					elseif gameStatus.hpLv == 10 then
						if gameStatus.coin >= 4000 then
							coinsRequire =Max
							gameStatus.coin = gameStatus.coin -4000
							gameStatus.maxHp = 50
							gameStatus.hpLv =11
							audio.play( soundSelected)
						else
							coinsRequire =4000
							audio.play( soundError)
						end
					elseif gameStatus.hpLv == 11 then
						skillTitle.text = ""..gameStatus.hpLv
						SkillDescription.text = "HP "..gameStatus.maxHp.." Max"
						SkillInstruction.text = "Max"
	
					end
					saveScores()
				else
					if gameStatus.hpLv == 1 then
						coinsRequire = 400
					elseif gameStatus.hpLv == 2 then
						coinsRequire = 800
					elseif gameStatus.hpLv == 3 then
						coinsRequire = 1200
					elseif gameStatus.hpLv == 4 then
						coinsRequire = 1600
					elseif gameStatus.hpLv == 5 then
						coinsRequire = 2000
					elseif gameStatus.hpLv == 6 then
						coinsRequire = 2400
					elseif gameStatus.hpLv == 7 then
						coinsRequire = 2800
					elseif gameStatus.hpLv == 8 then
						coinsRequire = 3200
					elseif gameStatus.hpLv == 9 then
						coinsRequire = 3600
					elseif gameStatus.hpLv == 10 then
						coinsRequire = 4000
					elseif gameStatus.hpLv == 11 then
						coinsRequire = 0000
	
					end



				--	hpShow()
				--	mpShow()
				--	strShow()
				--	magShow()
					allBarFalse()
					hpSelected = true

				end
				hpShow()
				selector2.x = upgradeButtonHp.x
				selector2.y = upgradeButtonHp.y
	
				skillTitle.text = "Lv "..gameStatus.hpLv
				SkillDescription.text = "HP "..gameStatus.maxHp.." +3"
				SkillInstruction.text = "Coins Required "..coinsRequire
				--saveScores()
				end
			end

		function upgradeButtonMpF( event )
 
			if ( "began" == event.phase ) then
				
				if mpSelected == true then
				if gameStatus.mpLv == 1 then
					if gameStatus.coin >= 300 then
						coinsRequire =600
						gameStatus.coin = gameStatus.coin -300
						gameStatus.maxMp = 12
							gameStatus.mpLv =2
						audio.play( soundSelected)
					else
						coinsRequire =300
						audio.play( soundError)
					end
				elseif gameStatus.mpLv == 2 then
					if gameStatus.coin >= 600 then
						coinsRequire =900
						gameStatus.coin = gameStatus.coin -600
						gameStatus.maxMp = 14
						gameStatus.mpLv =3
						audio.play( soundSelected)
					else
						coinsRequire =600
						audio.play( soundError)
					end
				elseif gameStatus.mpLv == 3 then
					if gameStatus.coin >= 900 then
						coinsRequire =1200
						gameStatus.coin = gameStatus.coin -900
						gameStatus.maxMp = 16
							gameStatus.mpLv =4
						audio.play( soundSelected)
					else
						coinsRequire =900
						audio.play( soundError)
					end
				elseif gameStatus.mpLv == 4 then
					if gameStatus.coin >= 1200 then
						coinsRequire =1500
						gameStatus.coin = gameStatus.coin -1200
						gameStatus.maxMp = 18
							gameStatus.mpLv =5
						audio.play( soundSelected)
					else
						coinsRequire =1200
						audio.play( soundError)
					end
				elseif gameStatus.mpLv == 5 then
					if gameStatus.coin >= 1500 then
						coinsRequire =1800
						gameStatus.coin = gameStatus.coin -1500
						gameStatus.maxMp = 20
							gameStatus.mpLv =6
						audio.play( soundSelected)
					else
						coinsRequire =1500
						audio.play( soundError)
					end
				elseif gameStatus.mpLv == 6 then
						if gameStatus.coin >= 1800 then
							coinsRequire =2100
							gameStatus.coin = gameStatus.coin -1800
							gameStatus.maxMp = 22
								gameStatus.mpLv =7
							audio.play( soundSelected)
					else
						coinsRequire =1800
						audio.play( soundError)
						end
					elseif gameStatus.mpLv ==7 then
						if gameStatus.coin >= 2100 then
							coinsRequire =2400
							gameStatus.coin = gameStatus.coin -2100
							gameStatus.maxMp = 24
								gameStatus.mpLv =8
						else
							coinsRequire =2100
							audio.play( soundError)
						end
					elseif gameStatus.mpLv == 8 then
						if gameStatus.coin >= 2400 then
							coinsRequire =2700
							gameStatus.coin = gameStatus.coin -2400
							gameStatus.maxMp = 26
								gameStatus.mpLv =9
							audio.play( soundSelected)
					else
						coinsRequire =2400
						audio.play( soundError)
						end
					elseif gameStatus.mpLv == 9 then
						if gameStatus.coin >= 2700 then
							coinsRequire =3000
							gameStatus.coin = gameStatus.coin -2700
							gameStatus.maxMp = 28
							gameStatus.mpLv =10
							audio.play( soundSelected)
					else
						coinsRequire =2700
						audio.play( soundError)
						end
					elseif gameStatus.mpLv == 10 then
						if gameStatus.coin >= 3000 then
							coinsRequire =0
							gameStatus.coin = gameStatus.coin -3000
							gameStatus.maxMp = 30
							gameStatus.mpLv =11
							audio.play( soundSelected)
					else
						coinsRequire =3000
						audio.play( soundError)
						end
					elseif gameStatus.mpLv == 11 then
	
					end
					saveScores()
				else

					if gameStatus.mpLv == 1 then
						coinsRequire = 300
					elseif gameStatus.mpLv == 2 then
						coinsRequire = 600
					elseif gameStatus.mpLv == 3 then
						coinsRequire = 900
					elseif gameStatus.mpLv == 4 then
						coinsRequire = 1200
					elseif gameStatus.mpLv == 5 then
						coinsRequire = 1500
					elseif gameStatus.mpLv == 6 then
						coinsRequire = 1800
					elseif gameStatus.mpLv == 7 then
						coinsRequire = 2100
					elseif gameStatus.mpLv == 8 then
						coinsRequire = 2400
					elseif gameStatus.mpLv == 9 then
						coinsRequire = 2700
					elseif gameStatus.mpLv == 10 then
						coinsRequire = 3000
					elseif gameStatus.mpLv == 11 then
						coinsRequire = 0000
	
					end

					--	hpShow()
					--	mpShow()
					--	strShow()
					--	magShow()
						allBarFalse()
						mpSelected = true
						--saveScores()
					end
					mpShow()
					selector2.x = upgradeButtonMp.x
					selector2.y = upgradeButtonMp.y
		
					skillTitle.text = "Lv "..gameStatus.mpLv
					SkillDescription.text = "MP "..gameStatus.maxMp.." +2"
					SkillInstruction.text = "Coins Required "..coinsRequire
					--saveScores()
				end
			end

		function upgradeButtonStrF( event )
 
			if ( "began" == event.phase ) then
				
			if strSelected == true then
				if gameStatus.strLv == 1 then
					if gameStatus.coin >= 400 then
						coinsRequire = 800
						gameStatus.coin = gameStatus.coin -400
						gameStatus.str = 6
						gameStatus.strLv =2
						audio.play( soundSelected)
					else
						coinsRequire = 400
						audio.play( soundError)
					end
				elseif gameStatus.strLv == 2 then
					if gameStatus.coin >= 800 then
						coinsRequire = 1200
						gameStatus.coin = gameStatus.coin -800
						gameStatus.str = 7
						gameStatus.strLv =3
						audio.play( soundSelected)
					else
						coinsRequire = 800
						audio.play( soundError)
					end
				elseif gameStatus.strLv == 3 then
					if gameStatus.coin >= 1200 then
						coinsRequire = 1600
						gameStatus.coin = gameStatus.coin -1200
						gameStatus.str = 8
						gameStatus.strLv =4
						audio.play( soundSelected)
					else
						coinsRequire = 1200
						audio.play( soundError)
					end
				elseif gameStatus.strLv == 4 then
					if gameStatus.coin >= 1600 then
						coinsRequire = 2000
						gameStatus.coin = gameStatus.coin -1600
						gameStatus.str = 9
						gameStatus.strLv =5
						audio.play( soundSelected)
					else
						coinsRequire = 1600
						audio.play( soundError)
					end
				elseif gameStatus.strLv == 5 then
					if gameStatus.coin >= 2000 then
						coinsRequire = 2400
						gameStatus.coin = gameStatus.coin -2000
						gameStatus.str = 10
						gameStatus.strLv =6
						audio.play( soundSelected)
					else
						coinsRequire = 2000
						audio.play( soundError)
					end
				elseif gameStatus.strLv == 6 then
						if gameStatus.coin >= 2400 then
							coinsRequire = 2800
							gameStatus.coin = gameStatus.coin -2400
							gameStatus.str = 11
							gameStatus.strLv =7
							audio.play( soundSelected)
					else
						coinsRequire = 2400
						audio.play( soundError)
						end
					elseif gameStatus.strLv ==7 then
						if gameStatus.coin >= 2800 then
							coinsRequire = 3200
							gameStatus.coin = gameStatus.coin -2800
							gameStatus.str = 12
							gameStatus.strLv =8
							audio.play( soundSelected)
					else
						coinsRequire = 2800
						audio.play( soundError)
						end
					elseif gameStatus.strLv == 8 then
						if gameStatus.coin >= 3200 then
							coinsRequire = 3600
							gameStatus.coin = gameStatus.coin -3200
							gameStatus.str = 13
							gameStatus.strLv =9
							audio.play( soundSelected)
					else
						coinsRequire = 3200
						audio.play( soundError)
						end
					elseif gameStatus.strLv == 9 then
						if gameStatus.coin >= 3600 then
							coinsRequire = 4000
							gameStatus.coin = gameStatus.coin -3600
							gameStatus.str = 14
							gameStatus.strLv =10
							audio.play( soundSelected)
					else
						coinsRequire = 3600
						audio.play( soundError)
						end
					elseif gameStatus.strLv == 10 then
						if gameStatus.coin >= 4000 then
							coinsRequire = 00000
							gameStatus.coin = gameStatus.coin -4000
							gameStatus.str = 15
							gameStatus.strLv =11
							audio.play( soundSelected)
					else
						coinsRequire = 4000
						audio.play( soundError)
						end
					elseif gameStatus.strLv == 11 then
	
				end
				saveScores()
			else
					if gameStatus.strLv == 1 then
						coinsRequire = 400
					elseif gameStatus.strLv == 2 then
						coinsRequire = 800
					elseif gameStatus.strLv == 3 then
						coinsRequire = 1200
					elseif gameStatus.strLv == 4 then
						coinsRequire = 1600
					elseif gameStatus.strLv == 5 then
						coinsRequire = 2000
					elseif gameStatus.strLv == 6 then
						coinsRequire = 2400
					elseif gameStatus.strLv == 7 then
						coinsRequire = 2800
					elseif gameStatus.strLv == 8 then
						coinsRequire = 3200
					elseif gameStatus.strLv == 9 then
						coinsRequire = 3600
					elseif gameStatus.strLv == 10 then
						coinsRequire = 4000
					elseif gameStatus.strLv == 11 then
						coinsRequire = 0000
	
					end

					--	hpShow()
					--	mpShow()
					--	strShow()
					--	magShow()
						allBarFalse()
						strSelected = true
						--saveScores()
					end
					strShow()
					selector2.x = upgradeButtonStr.x
					selector2.y = upgradeButtonStr.y
		
					skillTitle.text = "Lv "..gameStatus.strLv
					SkillDescription.text = "STR "..gameStatus.str.." +1"
					SkillInstruction.text = "Coins Required "..coinsRequire
					--saveScores()
				end
			end

		function upgradeButtonMgcF( event )
 
			if ( "began" == event.phase ) then
					
				if mgcSelected == true then
					if gameStatus.magLv == 1 then
						if gameStatus.coin >= 300 then
							coinsRequire = 600
							gameStatus.coin = gameStatus.coin -300
							gameStatus.mag = 6
							gameStatus.magLv =2
							audio.play( soundSelected)
						else
							coinsRequire = 300
							audio.play( soundError)
						end
					elseif gameStatus.magLv == 2 then
						if gameStatus.coin >= 600 then
							coinsRequire = 900
							gameStatus.coin = gameStatus.coin -600
							gameStatus.mag = 7
							gameStatus.magLv =3
							audio.play( soundSelected)
						else
							coinsRequire = 600
							audio.play( soundError)
						end
					elseif gameStatus.magLv == 3 then
						if gameStatus.coin >= 900 then
							coinsRequire = 1200
							gameStatus.coin = gameStatus.coin -900
							gameStatus.mag = 8
							gameStatus.magLv =4
							audio.play( soundSelected)
						else
							coinsRequire = 900
							audio.play( soundError)
						end
					elseif gameStatus.magLv == 4 then
						if gameStatus.coin >= 1200 then
							coinsRequire = 1500
							gameStatus.coin = gameStatus.coin -1200
							gameStatus.mag = 9
							gameStatus.magLv =5
							audio.play( soundSelected)
						else
							coinsRequire = 1200
							audio.play( soundError)
						end
					elseif gameStatus.magLv == 5 then
						if gameStatus.coin >= 1500 then
							coinsRequire = 1800
							gameStatus.coin = gameStatus.coin -1500
							gameStatus.mag = 10
							gameStatus.magLv =6
							audio.play( soundSelected)
						else
							coinsRequire = 1500
							audio.play( soundError)
						end
					elseif gameStatus.magLv == 6 then
							if gameStatus.coin >= 1800 then
								coinsRequire = 2100
								gameStatus.coin = gameStatus.coin -1800
								gameStatus.mag = 11
								gameStatus.magLv =7
								audio.play( soundSelected)
						else
							coinsRequire = 1800
							audio.play( soundError)
							end
						elseif gameStatus.magLv ==7 then
							if gameStatus.coin >= 2100 then
								coinsRequire = 2400
								gameStatus.coin = gameStatus.coin -2100
								gameStatus.mag = 12
								gameStatus.magLv =8
								audio.play( soundSelected)
						else
							coinsRequire = 2100
							audio.play( soundError)
							end
						elseif gameStatus.magLv == 8 then
							if gameStatus.coin >= 2400 then
								coinsRequire = 2700
								gameStatus.coin = gameStatus.coin -2400
								gameStatus.mag = 13
								gameStatus.magLv =9
								audio.play( soundSelected)
						else
							coinsRequire = 2400
							audio.play( soundError)
							end
						elseif gameStatus.magLv == 9 then
							if gameStatus.coin >= 2700 then
								coinsRequire = 3000
								gameStatus.coin = gameStatus.coin -2700
								gameStatus.mag = 14
								gameStatus.magLv =10
								audio.play( soundSelected)
						else
							coinsRequire = 2700
							audio.play( soundError)
							end
						elseif gameStatus.magLv == 10 then
							if gameStatus.coin >= 3000 then
								coinsRequire = 0000
								gameStatus.coin = gameStatus.coin -3000
								gameStatus.mag = 15
								gameStatus.magLv =11
								audio.play( soundSelected)
						else
							coinsRequire = 3000
							audio.play( soundError)
							end
						elseif gameStatus.magLv == 11 then
								coinsRequire = 300
		
						end
						saveScores()
					else
						if gameStatus.magLv == 1 then
							coinsRequire = 300
						elseif gameStatus.magLv == 2 then
							coinsRequire = 600
						elseif gameStatus.magLv == 3 then
							coinsRequire = 900
						elseif gameStatus.magLv == 4 then
							coinsRequire = 1200
						elseif gameStatus.magLv == 5 then
							coinsRequire = 1500
						elseif gameStatus.magLv == 6 then
							coinsRequire = 1800
						elseif gameStatus.magLv == 7 then
							coinsRequire = 2100
						elseif gameStatus.magLv == 8 then
							coinsRequire = 2400
						elseif gameStatus.magLv == 9 then
							coinsRequire = 2700
						elseif gameStatus.magLv == 10 then
							coinsRequire = 3000
						elseif gameStatus.magLv == 11 then
							coinsRequire = 0000
		
						end
	
						--	hpShow()
						--	mpShow()
						--	strShow()
						--	magShow()
							allBarFalse()
							mgcSelected = true
							--saveScores()
						end
						magShow()
						selector2.x = upgradeButtonMgc.x
						selector2.y = upgradeButtonMgc.y
			
						skillTitle.text = "Lv "..gameStatus.magLv
						SkillDescription.text = "MGC "..gameStatus.mag.." +1"
						SkillInstruction.text = "Coins Require "..coinsRequire
					end
				end
	 
	 upgradeButtonHp = widget.newButton(
		{
			sheet = buttonSheet3,
			defaultFrame = 17,
			overFrame = 18,
			label = "",
			onEvent = upgradeButtonHpF
		}
	)
	-- Center the button
	upgradeButtonHp.x = centerX-100
	upgradeButtonHp.y = screenBottom+1000
	upgradeButtonHp.width=64
	upgradeButtonHp.height=64
	uiGroup2:insert( upgradeButtonHp )

	upgradeButtonMp = widget.newButton(
		{
			width = 64,
			height = 64,
			sheet = buttonSheet3,
			defaultFrame = 17,
			overFrame = 18,
			label = "",
			onEvent = upgradeButtonMpF
		}
	)
	-- Center the button
	upgradeButtonMp.x = centerX-100
	upgradeButtonMp.y = screenBottom+1000
	upgradeButtonMp.width=64
	upgradeButtonMp.height=64
	uiGroup2:insert( upgradeButtonMp )

	upgradeButtonStr = widget.newButton(
		{
			width = 64,
			height = 64,
			sheet = buttonSheet3,
			defaultFrame = 17,
			overFrame = 18,
			label = "",
			onEvent = upgradeButtonStrF
		}
	)
	-- Center the button
	upgradeButtonStr.x = centerX-100
	upgradeButtonStr.y = screenBottom+1000
	upgradeButtonStr.width=64
	upgradeButtonStr.height=64
	uiGroup2:insert( upgradeButtonStr )

	upgradeButtonMgc = widget.newButton(
		{
			width = 64,
			height = 64,
			sheet = buttonSheet3,
			defaultFrame = 17,
			overFrame = 18,
			label = "",
			onEvent = upgradeButtonMgcF
		}
	)
	-- Center the button
	upgradeButtonMgc.x = centerX-100
	upgradeButtonMgc.y = screenBottom+1000
	upgradeButtonMgc.width=64
	upgradeButtonMgc.height=64
	uiGroup2:insert( upgradeButtonMgc )



	selector2 = display.newImageRect( uiGroup2, "images/selector2.png", 65,65 )
	selector2.x = centerX
	selector2.y = screenBottom+1000


		--------------------exit button----------------

		function exitButtonF( event )
 
			if ( "began" == event.phase ) then

				paused = false

				hideMenu()
				audio.play( soundButton)
		
			end
			return true
		end
		 
		 exitButton = widget.newButton(
			{
				width = 120,
				height = 50,
				defaultFile = "images/exit.png",
				overFile = "images/exit.png",
				label = "Exit",
				fontSize ="25",
				font="Rooters.ttf",
				onEvent = exitButtonF
			}
		)
		-- Center the button
		exitButton.x = centerX+200
		exitButton.y = screenBottom+1000
		uiGroup2:insert( exitButton )


end

function gameOverTextF( event )
 
	if ( "began" == event.phase ) then

	end
	return true
end

--gameOverText =display.newText(uiGroup2,"Game Over", centerX,screenBottom+1000, native.systemFont, 80)
 


function playButtonF( event )
 
	if ( "began" == event.phase ) then

		paused = false

		hideMenu()
		audio.play( soundButton)

	end
	return true
end
 


function coinLogo()
	local spriteOptions = {
		height = 25,
		width = 25,
		numFrames = 6,
		sheetContentWidth = 50,
		sheetContentHeight = 75
	  }
	  local mySheet = graphics.newImageSheet("images/coin.png", spriteOptions)
	  local sequenceData = {
		{name = "boom", start =1,count=6, time =math.random(400,700), loopCount =0},

	  }
		-- Display the new sprite at the coordinates passed
	local shoot = display.newSprite(uiGroup2,mySheet, sequenceData) 
	shoot:setSequence("boom")
	shoot:play()

	shoot.x = screenLeft+50
	shoot.y = screenTop+30

	coinText =display.newText(uiGroup2,""..gameStatus.coin, shoot.x + 60,shoot.y, "Rooters.ttf", 30)
end




function scene:create( event )

	 sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
		-- Set up display groups
		backGroup = display.newGroup()  -- Display group for the background image
		sceneGroup:insert( backGroup )  -- Insert into the scene's view group
	
		mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
		sceneGroup:insert( mainGroup )
	
	
		uiGroup = display.newGroup()    -- Display group for UI objects like the score
		sceneGroup:insert( uiGroup )

		uiGroup2 = display.newGroup()    -- Display group for UI objects like the score
		sceneGroup:insert( uiGroup2 )



		local background = display.newImageRect( uiGroup2, "images/loading.png", display.actualContentWidth,display.actualContentHeight/2 )
		background.x = display.contentCenterX
		background.anchorY=1
		background.y = centerY
	
		local background2 = display.newImageRect( uiGroup2, "images/loading.png", display.actualContentWidth,display.actualContentHeight/2 )
		background2.x = display.contentCenterX
		background2.anchorY =1
		background2.rotation=180
		background2.y = centerY 

		local function del()
			audio.play( soundShutter)
		transition.to (background, {time = 300,y = screenTop,onComplete=removeMe})
		transition.to (background2, {time = 300,y = screenBottom,onComplete=removeMe})
		end

		timer.performWithDelay(250,del,1)

		-----------------this is for the menu----------- upgrades-------------
		pausedMenu = display.newImageRect( uiGroup2, "images/menubg2.png", 700,600 )
		pausedMenu.x = display.contentCenterX
		pausedMenu.y = screenBottom+1000
		pausedMenu.alpha =.8

		bossTalk = display.newImageRect( uiGroup, "images/talking2.png", 600,60 )
		bossTalk.x = display.contentCenterX+100
		bossTalk.y = screenTop-500
		bossTalk.alpha =.8

		heroTalk = display.newImageRect( uiGroup, "images/talking.png", 600,60 )
		heroTalk.x = display.contentCenterX+100
		heroTalk.y = screenTop-500
		heroTalk.alpha =.8
	--	bossTalk:addEventListener( "tap", unTalk )

		bossTalkText =display.newText(uiGroup2,"Harpy", centerX+100,screenTop-200,  "Rooters.ttf", 25)

		--controller
		boomStick = display.newCircle( uiGroup2, screenLeft-100,centerY, 50 )
		boomDot = display.newCircle( uiGroup2, screenLeft-100,centerY, 80 )

		--boomStick = display.newImageRect( uiGroup, "images/joy.png", 100,100 )
		--boomStick.x = screenLeft-100
		--boomStick.y =centerY
		--boomStick.alpha =.9

		--boomDot = display.newImageRect( uiGroup, "images/joyBg.png", 200,200 )
		--boomDot.x = screenLeft-100
		--boomDot.y = centerY
		--boomDot.alpha =.9


		gameOverText = widget.newButton(
			{
				width = 350,
				height = 100,
				defaultFile = "images/exit3.png",
				overFile = "images/exit3.png",
				label = "Game Over",
				fontSize ="55",
				font="Rooters.ttf",
				onEvent = gameOverTextF
			}
		)
		-- Center the button
		gameOverText.x = centerX
		gameOverText.y = screenBottom+1000
		uiGroup2:insert( gameOverText )

		 playButton = widget.newButton(
			{
				width = 150,
				height = 80,
				defaultFile = "images/exit3.png",
				overFile = "images/exit3.png",
				label = "Retry",
				fontSize ="40",
				font="Rooters.ttf",
				onEvent = gotoGame
			}
		)
		-- Center the button
		playButton.x = centerX
		playButton.y = screenBottom+1000
		uiGroup2:insert( playButton )



	createMenu()
--	local function reCreate()
--from the platform.lua
--musicChecked()
	createGround()

	if  gameStatus.stage==7 or gameStatus.stage==11  or gameStatus.stage==17 or gameStatus.stage==24 or gameStatus.stage==26
	or gameStatus.stage==12 or gameStatus.stage==30  or gameStatus.stage==29 or gameStatus.stage==28 then

		if gameStatus.stage ==12 then
			if gameStatus.coleBoss1==1 then
				saveScores()
			end
		elseif gameStatus.stage ==30 then
			if gameStatus.coleBoss2==1 then
				saveScores()
			end
		elseif gameStatus.stage ==29 then
			if gameStatus.coleBoss3==1 then
				saveScores()
			end
		elseif gameStatus.stage ==28 then
			if gameStatus.coleBoss4==1 then
				saveScores()
			end
		end
		--dont save if this is the boss stage
	else
	saveScores()
	end


	function quitButtonF( event )
		if ( "began" == event.phase ) then
			transition.to (yesButton, {time = 100,y = centerY+260})
			transition.to (noButton, {time = 100,y = centerY+260})
			--transition.to( playButton,{time=300,y=screenBottom+1000})
	
		end
		return true
	end

	function noButtonF( event )
 
		if ( "began" == event.phase ) then
			paused = false
			transition.resume()
			--timer.resume()
			physics.start( )
			physics.setGravity( 0,100)
	
					---menu on unpause
			--hideMenu()
			transition.to( pausedMenu,{time=300,y=screenBottom+1000})
			transition.to( quitButton,{time=300,y=screenBottom+1000})
			transition.to( yesButton,{time=300,y=screenBottom+1000})
			transition.to( noButton,{time=300,y=screenBottom+1000})
			hideMenu()
			audio.play( soundButton)
	
		end
		return true
	end



	local function reCreate()

	quitButton = widget.newButton(
		{
			width = 120,
			height = 40,
			defaultFile = "images/exit.png",
			overFile = "images/exit.png",
			label = "Quit",
			fontSize ="25",
			font="Rooters.ttf",
			onEvent = quitButtonF
		}
	)
	-- Center the button
	quitButton.x = centerX-160
	quitButton.y = screenBottom+1000
	uiGroup2:insert( quitButton )
	 
	yesButton = widget.newButton(
		{
			width = 100,
			height = 40,
			defaultFile = "images/exit.png",
			overFile = "images/exit.png",
			label = "Yes",
			fontSize ="22",
			font="Rooters.ttf",
			onEvent = gotoGame
		}
	)
	-- Center the button
	yesButton.x = centerX+80
	yesButton.y = screenBottom+1000
	uiGroup2:insert( yesButton )

	 
	noButton = widget.newButton(
		{
			width = 100,
			height = 40,
			defaultFile = "images/exit.png",
			overFile = "images/exit.png",
			label = "No",
			fontSize ="22",
			font="Rooters.ttf",
			onEvent = noButtonF
		}
	)
	-- Center the button
	noButton.x = centerX+250
	noButton.y = screenBottom+1000
	uiGroup2:insert( noButton )


	createHero()
	coinLogo()

	if gameStatus.speedBoost ==1 then
		heroSpeed =5.2
	else
		heroSpeed =4.3
	end


	if gameStatus.hp > gameStatus.maxHp then
		gameStatus.hp = gameStatus.maxHp
	end
	if gameStatus.mp > gameStatus.maxMp then
		gameStatus.mp = gameStatus.maxMp
	end
	if gameStatus.mp <=0 then
		magicLine.yScale=.01
	else
		magicLine.yScale = gameStatus.mp/gameStatus.maxMp
	end

	if gameStatus.hp <=0 then
		heartLine.yScale=.01
	else
	heartLine.yScale = gameStatus.hp/gameStatus.maxHp
	end

	if flip == true then
		hero.xScale=-1
	end
	hero.x =posX or startPos.x
	hero.y =posY or startPos.y
	--createGround()
	createButton()
	experimentalControl()
	--createJoystick()

	local function ready(self )

		paused = false

		transition.to( bossTalkText,{time=300,y=screenTop-500})
		transition.to( heroTalk,{time=300,y=screenTop-500})
	end

	local function openingTalk(self)
		if self.isDead == false and loading == false then
			self:setSequence("idle")
			self:play()

		paused = true

		transition.to( heroTalk,{time=300,y=centerY+150,x=centerX})
		transition.to( bossTalkText,{time=300,y=centerY+150,x=centerX})
		bossTalkText.text="This Place feels familiar!?"

		local function talk2(self)
			transition.to( heroTalk,{time=300,y=centerY+160,x=centerX+20})
			transition.to( bossTalkText,{time=300,y=centerY+160,x=centerX+20})
			bossTalkText.text="and I sense somebody is watching me."
			transition.to( self, { time=2000,onComplete = ready } )
		end
		
		transition.to( self, { time=2000,onComplete = talk2 } )

	 end
	end

	local function openingTalk2(self)
		if self.isDead == false and loading == false then
			self:setSequence("idle")
			self:play()

		paused = true

		transition.to( heroTalk,{time=300,y=centerY+150,x=centerX})
		transition.to( bossTalkText,{time=300,y=centerY+150,x=centerX})
		bossTalkText.text="I need to find that demon"

		local function talk2(self)
			transition.to( heroTalk,{time=300,y=centerY+160,x=centerX+20})
			transition.to( bossTalkText,{time=300,y=centerY+160,x=centerX+20})
			bossTalkText.text="he is somwhere here in this castle"
			transition.to( self, { time=2000,onComplete = ready } )
		end
		
		transition.to( self, { time=2000,onComplete = talk2 } )

	 end
	end

	if gameStatus.isitNewGame ==1 then
		gameStatus.isitNewGame =2
		saveScores()
		openingTalk(hero)
	end

	if gameStatus.isitNewGame ==3 then
		gameStatus.isitNewGame =4
		saveScores()
		openingTalk2(hero)
	end

	if gameStatus.stage==0827 and gameStatus.puzzle1==0 then
		heroTalkf(hero)
	end


	----only on stage 1 instruction for the dumb ass
	if gameStatus.stage==1 and gameStatus.harpyBoss==0 then
		local touchHere =display.newText(uiGroup2,"touch here to move", screenLeft+220,centerY+200,  "Rooters.ttf", 40)
		touchHere.alpha=.5

		local touchHere2 =display.newText(uiGroup2,"jump", button1.x,button1.y,  "Rooters.ttf", 35)
		touchHere2.alpha=.4

		local touchHere3 =display.newText(uiGroup2,"attack", button2.x,button2.y, "Rooters.ttf", 35)
		touchHere3.alpha=.4

		local touchHere4 =display.newText(uiGroup2,"heal", button6.x,button6.y, "Rooters.ttf", 35)
		touchHere4.alpha=.4

	end


end
timer.performWithDelay(100,reCreate,1)

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
		--playMusicTrack= 
		audio.play( musicTrack, { channel=1, loops=-1 } )
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
		audio.stop( )
		--playMusicTrack = nil
		--loading =false
		--timer.cancel(castTimer)
		--transition.cancel()
		Runtime:removeEventListener( "enterFrame", specialAbility )
		weaponRect:removeEventListener( "collision" )
		hero:removeEventListener( "collision" )
		Runtime:removeEventListener( "key", onKeyEvent )
		--Runtime:removeEventListener( "enterFrame", catchTimer )
		--js:deactivate()
		moveNow ="stop"
		moveNow2="stop"

		Runtime:removeEventListener( "touch", control )
		Runtime:removeEventListener( "enterFrame", control2 )

		composer.removeScene( "battle" )

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