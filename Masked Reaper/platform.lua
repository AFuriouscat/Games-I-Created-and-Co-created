
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight

local mapRef = centerX+450
local line5 = screenTop+50
local line4 = screenTop+75
local line3 = screenTop+100
local line2 = screenTop+125
local line1 = screenTop+150
local line0 = screenTop+175

local widget = require("widget")

local tiled = require "com.ponywolf.ponytiled"
local json = require "json"

display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

function addMap()

	local function resetAlpha()

		local c =.7
		local c2 =.5
		local cc=.4
		local ccc =0
		local cccc =0
		if gameStatus.coleBoss1 == 1 then
			 ccc =.8
			 cccc=.5
		end

		mapBlock.alpha = c
		mapBlock2.alpha = c
		mapBlock3.alpha = c
		mapBlock4.alpha = c
		mapBlock5.alpha = c
		mapBlock6.alpha = c
		mapBlock7.alpha = c
		mapBlock8.alpha = c
		mapBlock9.alpha = c
		mapBlock10.alpha = c
		mapBlock11.alpha = c
		mapBlock12.alpha = c
		mapBlock13.alpha = c
		mapBlock14.alpha = c
		mapBlock15.alpha = c
		mapBlock16.alpha = c
		mapBlock17.alpha = c
		mapBlock18.alpha = c
		mapBlock19.alpha = c
		mapBlock20.alpha = c
		mapBlock21.alpha = c
		mapBlock22.alpha = c
		mapBlock23.alpha = c
		mapBlock24.alpha = c

		mapBlock25.alpha = ccc
		mapBlock26.alpha = ccc
		mapBlock27.alpha = ccc
		mapBlock28.alpha = ccc
		mapBlock29.alpha = ccc
		mapBlock30.alpha = ccc

		mapBlock41.alpha = c
		mapBlock42.alpha = c

		mapBlock0030.alpha = cccc
		mapBlock030.alpha = c2
		mapBlock130.alpha = c2
		mapBlock230.alpha = c2
		mapBlock330.alpha = c2

		mapBlock00p2.alpha = cccc
		mapBlock0p1.alpha = cc
		mapBlock2p2.alpha = cc
		mapBlock0p3.alpha = cc
		mapBlock3p4.alpha = cc
		mapBlock1p5.alpha = cc

	end

	local options4 = {
		width = 26,
		height = 26,
		numFrames = 20,
		sheetContentWidth = 104,
		sheetContentHeight = 130
	}
	 buttonSheet4 = graphics.newImageSheet( "images/maps2.png", options4 )

	local b = 21
	local bb =12

	mapBlock = display.newImageRect( uiGroup2, buttonSheet4,1, b,b )
	mapBlock2 = display.newImageRect( uiGroup2, buttonSheet4,5, b,b )
	mapBlock3 = display.newImageRect( uiGroup2, buttonSheet4,3, b,b )
	mapBlock4 = display.newImageRect( uiGroup2, buttonSheet4,7, b,b )
	mapBlock5 = display.newImageRect( uiGroup2, buttonSheet4,4, b,b )
	mapBlock6 = display.newImageRect( uiGroup2, buttonSheet4,6, b,b )

	mapBlock7 = display.newImageRect( uiGroup2, buttonSheet4,12, b,b )
	mapBlock8 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock9 = display.newImageRect( uiGroup2, buttonSheet4,11, b,b )
	mapBlock10 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock11 = display.newImageRect( uiGroup2, buttonSheet4,17, b,b )
	mapBlock12 = display.newImageRect( uiGroup2, buttonSheet4,19, b,b )

	mapBlock13 = display.newImageRect( uiGroup2, buttonSheet4,10, b,b )
	mapBlock14 = display.newImageRect( uiGroup2, buttonSheet4,8, b,b )
	mapBlock15 = display.newImageRect( uiGroup2, buttonSheet4,5, b,b )
	mapBlock16 = display.newImageRect( uiGroup2, buttonSheet4,3, b,b )
	mapBlock17 = display.newImageRect( uiGroup2, buttonSheet4,14, b,b )
	mapBlock18 = display.newImageRect( uiGroup2, buttonSheet4,10, b,b )

	mapBlock19 = display.newImageRect( uiGroup2, buttonSheet4,8, b,b )
	mapBlock20 = display.newImageRect( uiGroup2, buttonSheet4,5, b,b )
	mapBlock21 = display.newImageRect( uiGroup2, buttonSheet4,3, b,b )
	mapBlock22 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock23 = display.newImageRect( uiGroup2, buttonSheet4,5, b,b )
	mapBlock24 = display.newImageRect( uiGroup2, buttonSheet4,18, b,b )

	mapBlock25 = display.newImageRect( uiGroup2, buttonSheet4,10, b,b )
	mapBlock26 = display.newImageRect( uiGroup2, buttonSheet4,20, b,b )
	mapBlock27 = display.newImageRect( uiGroup2, buttonSheet4,5, b,b )
	mapBlock28 = display.newImageRect( uiGroup2, buttonSheet4,15, b,b )
	mapBlock29 = display.newImageRect( uiGroup2, buttonSheet4,16, b,b )
	mapBlock30 = display.newImageRect( uiGroup2, buttonSheet4,13, b,b )

	mapBlock41 = display.newImageRect( uiGroup2, buttonSheet4,9, b,b )
	mapBlock42 = display.newImageRect( uiGroup2, buttonSheet4,9, b,b )

	mapBlock0030 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock030 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock130 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock230 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )
	mapBlock330 = display.newImageRect( uiGroup2, buttonSheet4,2, b,b )

	mapBlock00p2 = display.newImageRect( uiGroup2, buttonSheet4,6, bb,bb )
	mapBlock0p1 = display.newImageRect( uiGroup2, buttonSheet4,6, bb,bb )
	mapBlock2p2 = display.newImageRect( uiGroup2, buttonSheet4,6, bb,bb )
	mapBlock0p3 = display.newImageRect( uiGroup2, buttonSheet4,6, bb,bb )
	mapBlock3p4 = display.newImageRect( uiGroup2, buttonSheet4,6, bb,bb )
	mapBlock1p5 = display.newImageRect( uiGroup2, buttonSheet4,6, bb,bb )

	mapBlock.x = mapRef
	mapBlock.y = line2

	mapBlock2.x = mapRef+25
	mapBlock2.y = line2

	mapBlock3.x = mapRef+50
	mapBlock3.y = line2

	mapBlock4.x = mapRef+100
	mapBlock4.y = line2

	mapBlock5.x = mapRef+125
	mapBlock5.y = line2

	mapBlock6.x = mapRef+150
	mapBlock6.y = line2


	mapBlock7.x = mapRef
	mapBlock7.y = line1

	mapBlock8.x = mapRef+25
	mapBlock8.y = line1

	mapBlock9.x = mapRef+50
	mapBlock9.y = line1

	mapBlock10.x = mapRef+100
	mapBlock10.y = line1

	mapBlock11.x = mapRef+125
	mapBlock11.y = line1

	mapBlock12.x = mapRef+150
	mapBlock12.y = line1


	mapBlock13.x = mapRef
	mapBlock13.y = line3

	mapBlock14.x = mapRef+25
	mapBlock14.y = line3

	mapBlock15.x = mapRef+50
	mapBlock15.y = line3

	mapBlock16.x = mapRef+100
	mapBlock16.y = line3

	mapBlock17.x = mapRef+125
	mapBlock17.y = line3

	mapBlock18.x = mapRef+150
	mapBlock18.y = line3


	mapBlock19.x = mapRef
	mapBlock19.y = line4

	mapBlock20.x = mapRef+25
	mapBlock20.y = line4

	mapBlock21.x = mapRef+50
	mapBlock21.y = line4

	mapBlock22.x = mapRef+100
	mapBlock22.y = line4

	mapBlock23.x = mapRef+125
	mapBlock23.y = line4

	mapBlock24.x = mapRef+150
	mapBlock24.y = line4


	mapBlock25.x = mapRef
	mapBlock25.y = line0

	mapBlock26.x = mapRef+25
	mapBlock26.y = line0

	mapBlock27.x = mapRef+50
	mapBlock27.y = line0

	mapBlock28.x = mapRef+100
	mapBlock28.y = line0

	mapBlock29.x = mapRef+125
	mapBlock29.y = line0

	mapBlock30.x = mapRef+150
	mapBlock30.y = line0


	mapBlock41.x = mapRef+25
	mapBlock41.y = line5

	mapBlock42.x = mapRef+125
	mapBlock42.y = line5

	mapBlock0030.x = mapRef+75
	mapBlock0030.y = line0

	mapBlock030.x = mapRef+75
	mapBlock030.y = line1

	mapBlock130.x = mapRef+75
	mapBlock130.y = line2

	mapBlock230.x = mapRef+75
	mapBlock230.y = line3

	mapBlock330.x = mapRef+75
	mapBlock330.y = line4

	mapBlock00p2.x = mapRef+38
	mapBlock00p2.y = line0

	mapBlock0p1.x = mapRef+13
	mapBlock0p1.y = line1

	mapBlock2p2.x = mapRef+113
	mapBlock2p2.y = line3

	mapBlock0p3.x = mapRef+113
	mapBlock0p3.y = line1

	mapBlock3p4.x = mapRef+138
	mapBlock3p4.y = line4

	mapBlock1p5.x = mapRef+150
	mapBlock1p5.y = line2+13



--[[	mapBlock = display.newRect(uiGroup2, mapRef, line2, b, b )
	mapBlock2 = display.newRect(uiGroup2, mapRef+25, line2, b, b )
	mapBlock3 = display.newRect(uiGroup2, mapRef+50, line2, b, b )
	mapBlock4 = display.newRect(uiGroup2, mapRef+100, line2, b, b )
	mapBlock5 = display.newRect(uiGroup2, mapRef+125, line2, b, b )
	mapBlock6 = display.newRect(uiGroup2, mapRef+150, line2, b, b )

	mapBlock7 = display.newRect(uiGroup2, mapRef, line1, b, b )
	mapBlock8 = display.newRect(uiGroup2, mapRef+25, line1, b, b )
	mapBlock9 = display.newRect(uiGroup2, mapRef+50, line1, b, b )
	mapBlock10 = display.newRect(uiGroup2, mapRef+100, line1, b, b )
	mapBlock11 = display.newRect(uiGroup2, mapRef+125, line1, b, b )
	mapBlock12 = display.newRect(uiGroup2, mapRef+150, line1, b, b )

	mapBlock13 = display.newRect(uiGroup2, mapRef, line3, b, b )
	mapBlock14 = display.newRect(uiGroup2, mapRef+25, line3, b, b )
	mapBlock15 = display.newRect(uiGroup2, mapRef+50, line3, b, b )
	mapBlock16 = display.newRect(uiGroup2, mapRef+100, line3, b, b )
	mapBlock17 = display.newRect(uiGroup2, mapRef+125, line3, b, b )
	mapBlock18 = display.newRect(uiGroup2, mapRef+150, line3, b, b )

	mapBlock19 = display.newRect(uiGroup2, mapRef, line4, b, b )
	mapBlock20 = display.newRect(uiGroup2, mapRef+25, line4, b, b )
	mapBlock21 = display.newRect(uiGroup2, mapRef+50, line4, b, b )
	mapBlock22 = display.newRect(uiGroup2, mapRef+100, line4, b, b )
	mapBlock23 = display.newRect(uiGroup2, mapRef+125, line4, b, b )
	mapBlock24 = display.newRect(uiGroup2, mapRef+150, line4, b, b )

	mapBlock25 = display.newRect(uiGroup2, mapRef, line0, b, b )
	mapBlock26 = display.newRect(uiGroup2, mapRef+25, line0, b, b )
	mapBlock27 = display.newRect(uiGroup2, mapRef+50, line0, b, b )
	mapBlock28 = display.newRect(uiGroup2, mapRef+100, line0, b, b )
	mapBlock29 = display.newRect(uiGroup2, mapRef+125, line0, b, b )
	mapBlock30 = display.newRect(uiGroup2, mapRef+150, line0, b, b )

	mapBlock41 = display.newRect(uiGroup2, mapRef+25, line5, b, b )
	mapBlock42 = display.newRect(uiGroup2, mapRef+125, line5, b, b )

	mapBlock0030 = display.newRect(uiGroup2, mapRef+75, line0, b, b )
	mapBlock030 = display.newRect(uiGroup2, mapRef+75, line1, b, b )
	mapBlock130 = display.newRect(uiGroup2, mapRef+75, line2, b, b )
	mapBlock230 = display.newRect(uiGroup2, mapRef+75, line3, b, b )
	mapBlock330 = display.newRect(uiGroup2, mapRef+75, line4, b, b )


	mapBlock00p2 = display.newRect(uiGroup2, mapRef+38, line0, 10, 10 )
	mapBlock0p1 = display.newRect(uiGroup2, mapRef+13, line1, 10, 10 )
	mapBlock2p2 = display.newRect(uiGroup2, mapRef+113, line3, 10, 10 )
	mapBlock0p3 = display.newRect(uiGroup2, mapRef+113, line1, 10, 10 )
	mapBlock3p4 = display.newRect(uiGroup2, mapRef+138, line4, 10, 10 )
	mapBlock1p5 = display.newRect(uiGroup2, mapRef+150, line2+13, 10, 10 )--]]

	resetAlpha()

	local e = stage
	--mapBlock..stage.alpha = 1
	--string.format(mapBlock"%2d".alpha = 1,"stage")


end

local function blink(self)
	local a1

	function a2()
		transition.to (self, {time = 300,alpha =1,onComplete=a1})
	end

	function a1()
		transition.to (self, {time = 300,alpha =0,onComplete=a2})
	end

	a1(self)
end


function createGround()

	addMap()


	if gameStatus.stage==1 then
		mapBlock.alpha = 1
		blink(mapBlock)
		
		----------------------if u save the tiled as lua, use this------
			--local mapData = require "maps.bg.bg9"
			local mapData = json.decodeFile(system.pathForFile("maps/bg/firstFloorFirstRoom.json", system.ResourceDirectory))  -- load from json export
			 map = tiled.new(mapData, "maps/bg")
			-- map.objectgroup.x=centerX
			--map.xScale = 2
			--map:translate(-b,b)
			backGroup:insert( map )

			musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )

				startPos = map:findObject("startPos")

			spawnPoint = map:findObject("spawn")
			spawnPoint2 = map:findObject("spawn2")
			spawnPoint3 = map:findObject("spawn3")
			spawnPoint4 = map:findObject("spawn4")
			spawnPoint5 = map:findObject("spawn5")
			spawnPoint6 = map:findObject("spawn6")

			if gameStatus.coleBoss5==1 and gameStatus.finishedGame==2 then

					createControlBoss()

			else

			if gameStatus.rechargeMp==0 then
				spawnPoint7 = map:findObject("spawn7")
				createRechargeMp()
				ability.x = spawnPoint7.x
				ability.y = spawnPoint7.y
			end

			createBase()
			enemy.x = spawnPoint.x
			enemy.y = spawnPoint.y

			createCrate()
			enemy.x = spawnPoint2.x
			enemy.y = spawnPoint2.y

			createCrate()
			enemy.x = spawnPoint3.x
			enemy.y = spawnPoint3.y

			createRedBase()
			enemy.x = spawnPoint5.x
			enemy.y = spawnPoint5.y

			createCrate()
			enemy.x = spawnPoint6.x
			enemy.y = spawnPoint6.y

			if gameStatus.chestStage1 ==0 then

			createTreasure()
			enemy.x = spawnPoint4.x
			enemy.y = spawnPoint4.y
			end

			fairyCount = fairyCount + math.random(0,2)
			if fairyCount >= 7 then
				fairyCount=0
			createFairy()
			enemy.x = screenRight+50
			enemy.y = centerY + math.random(-50,50)
			passing(enemy)
			end
			treasureCount = treasureCount + 1
			end
		elseif gameStatus.stage==2 then
			mapBlock2.alpha = 1
			blink(mapBlock2)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/firstFloorSecondRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				--musicTrack = audio.loadStream( "sounds/dark-water.mp3" )
				musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )
				if gameStatus.iceWall2isOn == 1 then
					iceWall = map:findObject("iceWall")
					createWall()
				end

					startPos = map:findObject("startPos")

				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				if gameStatus.stoneBlock14 == 0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				end
		   
				createSkeleton()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   enemy.type="walker"
			   walk(enemy)
   
		   
			   createSkeleton()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   enemy.type="walker"
			   walk(enemy)
		   
			   createSkeleton()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   enemy.type="walker"
			   walk(enemy)

			   if gameStatus.shovelBoss==1 then

				createHood()
				enemy.x = spawnPoint4.x
				enemy.y = spawnPoint4.y
				shooter(enemy)

				createWormy()
				enemy.x = spawnPoint6.x
				enemy.y = spawnPoint6.y
				walk(enemy)
			   else
   
			   createCrate()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   end
			  -- longWalk(enemy)

			  fairyCount =   fairyCount + math.random(0,2)
			if fairyCount >= 7 then
				fairyCount=0
			createFairy()
			enemy.x = screenRight+50
			enemy.y = centerY + math.random(-50,50)
			passing(enemy)
			end
			treasureCount = treasureCount + 1
		elseif gameStatus.stage==3 then
			mapBlock3.alpha = 1
			blink(mapBlock3)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/firstFloorThirdRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )
				musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )
				--musicTrack = audio.loadStream( "sounds/dark-water.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")
		   
				createSkeleton()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   enemy.type="walker"
			   walk(enemy)
   
		   
			   createSkeleton()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   enemy.type="thrower"
			   thrower(enemy)
		   
			   createSkeleton()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   enemy.type="attacker"
			   attackPatrol(enemy)
   
			   createCrate()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   
			   createHood()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y
			   shooter(enemy)

			   if gameStatus.harpyBoss==1 then
			   createHood()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y
			   shooter(enemy)
			   end

			   fairyCount =  fairyCount + math.random(0,2)
			   if fairyCount >= 7 then
				   fairyCount=0
			   createFairy()
			   enemy.x = screenRight+50
			   enemy.y = centerY + math.random(-50,50)
			   passing(enemy)
			   end
			   treasureCount = treasureCount + 1
			elseif gameStatus.stage==4 then
				mapBlock4.alpha = 1
				blink(mapBlock4)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/firstFloorFourthRoom.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )
					musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )
					--musicTrack = audio.loadStream( "sounds/dark-water.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
					spawnPoint4 = map:findObject("spawn4")
					spawnPoint5 = map:findObject("spawn5")
					spawnPoint6 = map:findObject("spawn6")

					if gameStatus.lavaWall2isOn == 1 then
						lavaWall = map:findObject("lavaWall")
						createLavaWall()
					end

					if gameStatus.magnetic==0 then
						loot = map:findObject("loot")
						createMagnetic()
						ability.x = loot.x
						ability.y = loot.y
						 end

					if gameStatus.harpyBoss ==0 then
		
						barrier = map:findObject("barrier")
		
						createBarrier()
						stoneBarrier.x = barrier.x
						stoneBarrier.y = barrier.y
					end
			   
					createSkeleton()
				   enemy.x = spawnPoint.x
				   enemy.y = spawnPoint.y
				   enemy.type="attacker"
				   attackPatrol(enemy)
	   
			   
				   createSkeleton()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   enemy.type="thrower"
				  -- enemy.xScale=-1
				   thrower(enemy)
			   
				   createSkeleton()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   enemy.type="attacker"
				   attackPatrol(enemy)
	   
				   createRed()
				   enemy.x = spawnPoint4.x
				   enemy.y = spawnPoint4.y
				   patrol(enemy)
				   
				   
				   createCrate()
				   enemy.x = spawnPoint5.x
				   enemy.y = spawnPoint5.y

				   createRed()
				   enemy.x = spawnPoint6.x+150
				   enemy.y = spawnPoint6.y+180
				   patrol(enemy)
				   --createOcto()
				   --enemy.x = spawnPoint6.x-50
				  -- enemy.y = spawnPoint6.y
				  -- enemy.type="thrower"
				  -- throwPatrol(enemy)

				   fairyCount = fairyCount + math.random(0,2)
				   if fairyCount >= 7 then
					   fairyCount=0
				   createFairy()
				   enemy.x = screenRight+50
				   enemy.y = centerY + math.random(-50,50)
				   passing(enemy)
				   end
				   treasureCount = treasureCount + 1
		elseif gameStatus.stage==5 then
			mapBlock5.alpha = 1
			blink(mapBlock5)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/firstFloorFifthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )
				musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )
				--musicTrack = audio.loadStream( "sounds/dark-water.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				burning = map:findObject("burning")
				burning2 = map:findObject("burning2")

				if gameStatus.stoneBlock17 ==0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				end

				if gameStatus.burnBlock5 ==0 then

				createBurning()
				fire.x =burning.x
				fire.y =burning.y
				else
					createBurningIcea()
					fire.x =burning.x
					fire.y =burning.y
				
				end
				if gameStatus.burnBlock5b ==0 then

				createBurningb()
				fire2.x =burning2.x
				fire2.y =burning2.y
				else
					createBurningIceb()
					fire2.x =burning2.x
					fire2.y =burning2.y

				end

				if gameStatus.iceBlock5 == 0 then

				iceBlock = map:findObject("iceBlock")

				createIceBlock()
				ice.x =iceBlock.x
				ice.y =iceBlock.y
				end
				
				
			   if gameStatus.chestStage5 ==0 then

				createTreasure()
				enemy.x = spawnPoint6.x
				enemy.y = spawnPoint6.y
				end
				
				--]]
		   
			   createArmored()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   attacking(enemy)
   
		   
			   createRed()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   patrol(enemy)
		   
			   createBlue()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   attackPatrol(enemy)
   
			   createVomit()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   longWalk(enemy)

			   createRed()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y
			   patrol(enemy)


				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end
				treasureCount = treasureCount + 1
		elseif gameStatus.stage==6 then
			mapBlock6.alpha = 1
			blink(mapBlock6)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/firstFloorSixthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")

				if gameStatus.stoneBlock6==0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				stone.no =6
				end

		   
			   createBall()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   jumpPatrol(enemy)
   
		   
			   createRed()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   patrol(enemy)
		   
			   createBlue()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   attackPatrol(enemy)
   
			   createJelly()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   casting(enemy)

			   fairyCount =  fairyCount + math.random(0,2)
			   if fairyCount >= 7 then
				   fairyCount=0
			   createFairy()
			   enemy.x = screenRight+50
			   enemy.y = centerY + math.random(-50,50)
			   passing(enemy)
			   end
			   treasureCount = treasureCount + 1
		elseif gameStatus.stage==7 then
			mapBlock7.alpha = 1
			blink(mapBlock7)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/undergroundFirstRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )
				
				if gameStatus.harpyBoss==0 then
					musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
				else
					musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
				end

				startPos = map:findObject("startPos")

				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")

				if gameStatus.stoneBlock7==0 then
			
					stoneBlock = map:findObject("stoneBlock")
	
					createStoneBlock()
					stone.x =stoneBlock.x
					stone.y =stoneBlock.y
					stone.no=7
					end

				if gameStatus.harpyBoss ==0 then
				
		
				createHarpy()
				enemy.x = centerX
				enemy.y = centerY

				bossHarpy(enemy)

				barrier = map:findObject("barrier")

				createBarrier()
				stoneBarrier.x = barrier.x
				stoneBarrier.y = barrier.y-barrier.height
				locking(stoneBarrier)

				else

	   
			   
				   createOgre()
				   enemy.x = spawnPoint4.x-60
				   enemy.y = spawnPoint4.y
				   attackThrow(enemy)
			   
				   createFrog()
				   enemy.x = spawnPoint3.x-200
				   enemy.y = spawnPoint3.y
				   attackPatrol(enemy)

				   createFrog()
				   enemy.x = spawnPoint3.x+150
				   enemy.y = screenBottom-150
				   attackPatrol(enemy)
	   
				   createCrate()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   	
				   createJelly()
				   enemy.x = spawnPoint.x+30
				   enemy.y = spawnPoint.y
				   casting(enemy)

				end
			

				treasureCount = treasureCount + 1
		elseif gameStatus.stage==8 then
			mapBlock8.alpha = 1
			blink(mapBlock8)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/undergroundSecondRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )


				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )

					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")
				spawnPoint7 = map:findObject("spawn7")
				spawnPoint8 = map:findObject("spawn8")

				if gameStatus.iceBlock8 == 0 then

				iceBlock = map:findObject("iceBlock")

				createIceBlock()
				ice.x =iceBlock.x
				ice.y =iceBlock.y
				end
				if gameStatus.iceBlock8b == 0 then
				iceBlock2 = map:findObject("iceBlock2")

				createIceBlockb()
				ice2.x =iceBlock2.x
				ice2.y =iceBlock2.y
				end
		   
				createSpiky()
				enemy.x = spawnPoint6.x
				enemy.y = spawnPoint6.y
				walk(enemy)
   
		   
			   createSpiky()
			   enemy.x = spawnPoint5.x+80
			   enemy.y = spawnPoint5.y
			   waiting(enemy)
		   
			   createFrog()
			   enemy.x = spawnPoint3.x-80
			   enemy.y = spawnPoint3.y
			   attackPatrol(enemy)
   
			   createSpiky()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   walk(enemy)
			   
			   createBase()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y


			   createJelly()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   casting(enemy)

			   if gameStatus.chestStage8 ==0 then

				createTreasure()
				enemy.x = spawnPoint7.x
				enemy.y = spawnPoint7.y
				end

				--if gameStatus.chestStage8b ==0 then

					createRedBase()
					enemy.x = spawnPoint8.x
					enemy.y = spawnPoint8.y
				--end

				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end

				treasureCount = treasureCount + 1
		elseif gameStatus.stage==9 then
			mapBlock9.alpha = 1
			blink(mapBlock9)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/undergroundThirdRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")
				spawnPoint7 = map:findObject("spawn7")

				if gameStatus.stoneBlock9==0 then
			
					stoneBlock = map:findObject("stoneBlock")
	
					createStoneBlock()
					stone.x =stoneBlock.x
					stone.y =stoneBlock.y
					stone.no=9
					end

					if gameStatus.stoneBlock27==0 then
	
						stoneBlock2 = map:findObject("stoneBlock2")
		
						createStoneBlock2()
						stone2.x =stoneBlock2.x
						stone2.y =stoneBlock2.y
						stone2.no=27
						end
		   
				createSpiky()
				enemy.x = spawnPoint6.x
				enemy.y = spawnPoint6.y
				walk(enemy)
   
		   
			   createSkeleton()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   enemy.type="thrower"
			   enemy.xScale=-1
			   thrower(enemy)
		   
			   createSpiky()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   walk(enemy)
   
			   createHood()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   shooter(enemy)
			   
			   createSpiky()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y
			   waiting(enemy)

			   createCrate()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y

			   if gameStatus.chestStage9 ==0 then

				createTreasure()
				enemy.x = spawnPoint7.x
				enemy.y = spawnPoint7.y
				end


				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end
				treasureCount = treasureCount + 1	
		elseif gameStatus.stage==10 then
			mapBlock10.alpha = 1
			blink(mapBlock10)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/undergroundFourthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
				
					startPos = map:findObject("startPos")

				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")
				loot = map:findObject("loot")

				if gameStatus.iceBlock10 == 0 then

				iceBlock = map:findObject("iceBlock")

				createIceBlock()
				ice.x =iceBlock.x
				ice.y =iceBlock.y
				end

				if gameStatus.iceBlock10b == 0 then
				iceBlock2 = map:findObject("iceBlock2")

				createIceBlockb()
				ice2.x =iceBlock2.x
				ice2.y =iceBlock2.y+2
				end
		
				createSkeleton()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y
			   enemy.type="thrower"
			   thrower(enemy)
   
		   
			   createFloatingIce()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y+10
			   --enemy.type="attacker"
			   patrol(enemy)

			   createFloatingIce()
			   enemy.x = spawnPoint5.x+100
			   enemy.y = spawnPoint5.y
			   --enemy.type="attacker"
			   patrol(enemy)
		   
			   createJelly()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			  -- enemy.type="attacker"
			   casting(enemy)
   
			   createHood()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   shooter(enemy)
			   


			   createCrate()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y

			   if gameStatus.chestStage10 ==0 then

				createTreasure()
				enemy.x = loot.x
				enemy.y = loot.y
				end


				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end
				treasureCount = treasureCount + 1	
		elseif gameStatus.stage==11 then
			mapBlock11.alpha = 1
			blink(mapBlock11)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/undergroundFifthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				--musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
				if gameStatus.iceBoss==0 then
					musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
				else
					musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
				end
				
				startPos = map:findObject("startPos")

				if gameStatus.iceBoss ==0 then
		
				createIceBoss()
				enemy.x = centerX+300
				enemy.y = centerY-100
				--enemy.casterLv=2
				iceBoss(enemy)

				barrier = map:findObject("barrier")

				createBarrier()
				stoneBarrier.x = barrier.x
				stoneBarrier.y = barrier.y-barrier.height
				locking(stoneBarrier)
				else

				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
   
		   
			   createSkeleton()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   enemy.type="attacker"
			   attackPatrol(enemy)
		   
			   createJelly()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			  -- enemy.type="attacker"
			   casting(enemy)
   
			   createHood()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   shooter(enemy)
			   

			   createCrate()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y

				end

				snowing()

				treasureCount = treasureCount + 1
		elseif gameStatus.stage==12 then
			mapBlock12.alpha = 1
			blink(mapBlock12)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/boss1.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				if gameStatus.coleBoss1==0 then
					musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
				else
					musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
				end
				
				startPos = map:findObject("startPos")

				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")


				if gameStatus.stoneBlock6 >=1 then

				end

				if gameStatus.coleBoss1 ==0 then
		
				createCole()
				cole.x = centerX+350
				cole.y = centerY-60
				--enemy.casterLv=2
				coleNormal(cole)

				barrier = map:findObject("barrier")
					
				createBarrier()
				stoneBarrier.x = barrier.x
				stoneBarrier.y = barrier.y-barrier.height
				locking(stoneBarrier)

				barrier2 = map:findObject("barrier2")

				createBarrier2()
				stoneBarrier2.x = barrier2.x
				stoneBarrier2.y = barrier2.y

				else



			   
			   createEye()
			   enemy.x = spawnPoint.x-450
			   enemy.y = spawnPoint.y
			   pooper(enemy)
		   
			   createWormy()
			   enemy.x = spawnPoint3.x-300
			   enemy.y = spawnPoint3.y
			  -- enemy.type="attacker"
			   walk(enemy)
   
			   createOgre()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   attackThrow(enemy)
			   


			   createCrate()
			   enemy.x = spawnPoint.x-600
			   enemy.y = spawnPoint.y

				end			
				treasureCount = treasureCount + 1

		elseif gameStatus.stage==13 then
			mapBlock13.alpha = 1
			blink(mapBlock13)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/secondFloorFirstRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				if gameStatus.stoneBlock19 ==0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				end

				burning = map:findObject("burning")
				burning2 = map:findObject("burning2")

				if gameStatus.burnBlock13 ==0 then

				createBurning()
				fire.x =burning.x
				fire.y =burning.y
				else
					createBurningIcea()
					fire.x =burning.x
					fire.y =burning.y
				
				end
				if gameStatus.burnBlock13b ==0 then

				createBurningb()
				fire2.x =burning2.x
				fire2.y =burning2.y
				else
					createBurningIceb()
					fire2.x =burning2.x
					fire2.y =burning2.y

				end

		   
			   createArmored()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   attacking(enemy)
   
		   
			   createRed()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   patrol(enemy)
		   
			   createRed()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   patrol(enemy)
   
			   createGhost()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y
			   --enemy.casterLv=3
			   flyPatrol(enemy)

			   if gameStatus.chestStage13 ==0 then

				createTreasure()
				enemy.x = spawnPoint5.x+40
				enemy.y = spawnPoint5.y
				end

				if gameStatus.drakzWave==0 then

					createSonicWave()
					ability.x = spawnPoint5.x-40
					ability.y = spawnPoint5.y
				end

					
				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end
				treasureCount = treasureCount + 1
		elseif gameStatus.stage==14 then
			mapBlock14.alpha = 1
			blink(mapBlock14)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/secondFloorSecondRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				musicTrack = audio.loadStream( "sounds/homeland.mp3" )

					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				if gameStatus.stoneBlock14==0 then


				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				stone.no=14
				end

				if gameStatus.speedBoost==0 then
					createSpeedBoost()
					ability.x = spawnPoint2.x
					ability.y = spawnPoint2.y
				end
		   
			   createArmored()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   attacking(enemy)
		   
   
			   createJelly()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y
			   --enemy.casterLv=3
			   casting(enemy)

			   createOgre()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y
			   attackThrow(enemy)

			   createVomit()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   longWalk(enemy)

			   if gameStatus.chestStage14 ==0 then

				createTreasure()
				enemy.x = spawnPoint3.x
				enemy.y = spawnPoint3.y
				end


				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end
				treasureCount = treasureCount + 1
		elseif gameStatus.stage==15 then
			mapBlock15.alpha = 1
			blink(mapBlock15)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/secondFloorThirdRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				musicTrack = audio.loadStream( "sounds/homeland.mp3" )

					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				if gameStatus.iceBlock15 == 0 then
				iceBlock = map:findObject("iceBlock")

				createIceBlock()
				ice.x =iceBlock.x
				ice.y =iceBlock.y
				end
		
				createBlue()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y+90
			   enemy.type="attacker"
			   attackPatrol(enemy)
   
		   
			   createArmored()
			   enemy.x = spawnPoint4.x-300
			   enemy.y = spawnPoint4.y
			  -- enemy.type="attacker"
			   attacking(enemy)
		   
			   createDr()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			  -- enemy.type="attacker"
			   casting(enemy)
   
			   createRedPoop()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y-120
			   waiting(enemy)
			   
			   createHood()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y
			   shooter(enemy)

			   createCrate()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y

					
			   fairyCount = fairyCount + math.random(0,2)
			   if fairyCount >= 7 then
				   fairyCount=0
			   createFairy()
			   enemy.x = screenRight+50
			   enemy.y = centerY + math.random(-50,50)
			   passing(enemy)
			   end
			   treasureCount = treasureCount + 1
		elseif gameStatus.stage==16 then
			mapBlock16.alpha = 1
			blink(mapBlock16)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/secondFloorFourthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				musicTrack = audio.loadStream( "sounds/homeland.mp3" )

					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")
		
				createDr()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y
			   casting(enemy)
   
		   
			   createRed()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			  -- enemy.type="attacker"
			   flyPatrol(enemy)
		   
			   createRed()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			  -- enemy.type="attacker"
			   flyPatrol(enemy)

			   
			   createSkeleton()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   enemy.type="attacker"
			   attackPatrol(enemy)

			   createCrate()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y

			   fairyCount = fairyCount + math.random(0,2)
			   if fairyCount >= 7 then
				   fairyCount=0
			   createFairy()
			   enemy.x = screenRight+50
			   enemy.y = centerY + math.random(-50,50)
			   passing(enemy)
			   end
			   treasureCount = treasureCount + 1
	
		elseif gameStatus.stage==17 then
			mapBlock17.alpha = 1
			blink(mapBlock17)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/secondFloorFifthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				if gameStatus.fireBoss==0 then
					musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
				else
					musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				end
				--musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )

				local dark = display.newImageRect( backGroup, "images/dark2.png", display.actualContentWidth,display.actualContentHeight )
				dark.x = display.contentCenterX
				dark.y = centerY
				dark.alpha =0.4

				local function shine(self)
					local a
					local function b()
						if loading==false then
						transition.to (self, {time = 900,alpha=.4,onComplete=a})
						end
					end
					 function a()
						if loading==false then
						transition.to (self, {time = 900,alpha=.0,onComplete=b})
						end
					end
					a()
				end

				shine(dark)
				
				startPos = map:findObject("startPos")

				if gameStatus.stoneBlock17==0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				stone.no=17

				end

				if gameStatus.fireBoss ==0 then
		
				createLava()
				enemy.x = centerX+100
				enemy.y = centerY+50

				enemyl.x = centerX
				enemyl.y = centerY+50

				enemyr.x = centerX+200
				enemyr.y = centerY+50

				barrier = map:findObject("barrier")

				createBarrier()
				stoneBarrier.x = barrier.x
				stoneBarrier.y = barrier.y-barrier.height
				locking(stoneBarrier)

				else

					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
					spawnPoint4 = map:findObject("spawn4")

			   
				   createSpiky()
				   enemy.x = spawnPoint.x-50
				   enemy.y = spawnPoint.y
				   patrol(enemy)
	   
			   
				   createRed()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y-100
				   flyPatrol(enemy)
			   
				   createRed()
				   enemy.x = spawnPoint3.x-150
				   enemy.y = spawnPoint3.y+150
				   flyPatrol(enemy)
	   
				   createDr()
				   enemy.x = spawnPoint4.x
				   enemy.y = spawnPoint4.y
				   --enemy.casterLv=3
				   casting(enemy)
	

				end


				treasureCount = treasureCount + 1
					
	
		elseif gameStatus.stage==18 then
			mapBlock18.alpha = 1
			blink(mapBlock18)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/secondFloorSixthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				if gameStatus.stoneBlock24 ==0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				end
		   
			   createBall()
			   enemy.x = spawnPoint.x-100
			   enemy.y = spawnPoint.y
			   jumpPatrol(enemy)
   
		   
			   createFloatingIce()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   flyPatrol(enemy)
		   
			   createArmored()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y
			   attacking(enemy)
   
			   createJelly()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   casting(enemy)

			   if gameStatus.extraCoins==0 then
			   createExtraCoins()
			   ability.x = spawnPoint5.x
			   ability.y = spawnPoint5.y
			   end

			   if gameStatus.chestStage18 ==0 then

				createTreasure()
				enemy.x = spawnPoint3.x
				enemy.y = spawnPoint3.y
				end
					
			
				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end

				treasureCount = treasureCount + 1
	
		elseif gameStatus.stage==19 then
			mapBlock19.alpha = 1
			blink(mapBlock19)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/thirdFloorFirstRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				if gameStatus.stoneBlock19==0 then
					stoneBlock = map:findObject("stoneBlock")

					createStoneBlock()
					stone.x =stoneBlock.x
					stone.y =stoneBlock.y
					stone.no=19

				end
		   
			   createBall()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   jumpPatrol(enemy)
   
		   
			   createOcto()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   throwPatrol(enemy)
		   
			   createBlue()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   attackPatrol(enemy)
   
			   createVomit()
			   enemy.x = spawnPoint4.x-40
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   longWalk(enemy)

			   createCrate()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y

			   fairyCount = fairyCount + math.random(0,2)
			   if fairyCount >= 7 then
				   fairyCount=0
			   createFairy()
			   enemy.x = screenRight+50
			   enemy.y = centerY + math.random(-50,50)
			   passing(enemy)
			   end	

			   treasureCount = treasureCount + 1
	
		elseif gameStatus.stage==20 then
			mapBlock20.alpha = 1
			blink(mapBlock20)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/thirdFloorSecondRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				burning = map:findObject("burning")

				if gameStatus.stoneBlock20==0 then

					stoneBlock = map:findObject("stoneBlock")
	
					createStoneBlock()
					stone.x =stoneBlock.x
					stone.y =stoneBlock.y
					stone.no=20
					stone.myName="stoneBlock2"
				end


				if gameStatus.burnBlock20 ==0 then

					createBurning()
					fire.x =burning.x
					fire.y =burning.y
				else
						createBurningIcea()
						fire.x =burning.x
						fire.y =burning.y
					
				end

				if gameStatus.iceBoss==0 then

					barrier = map:findObject("barrier")

					createBarrier()
					stoneBarrier.x = barrier.x
					stoneBarrier.y = barrier.y-barrier.height
					locking(stoneBarrier)

				end
		   
				createGhost()
				enemy.x = spawnPoint.x
				enemy.y = spawnPoint.y
				flyPatrol(enemy)
	
			
				createGhost()
				enemy.x = spawnPoint2.x
				enemy.y = spawnPoint2.y
				flyPatrol(enemy)
			
				createGhost()
				enemy.x = spawnPoint3.x
				enemy.y = spawnPoint3.y
				patrol(enemy)
   
			   createWormy()
			   enemy.x = spawnPoint4.x-150
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   longWalk(enemy)

			   createOcto()
			   enemy.x = spawnPoint5.x-170
			   enemy.y = spawnPoint5.y-60
			   throwPatrol(enemy)

			   if gameStatus.chestStage20 ==0 then

				createTreasure()
				enemy.x = spawnPoint6.x
				enemy.y = spawnPoint6.y
				end

				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end	

				treasureCount = treasureCount + 1
	
		elseif gameStatus.stage==21 then
			mapBlock21.alpha = 1
			blink(mapBlock21)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/thirdFloorThirdRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				--spawnPoint6 = map:findObject("spawn6")
   
		   
			   createWormy()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   walk(enemy)
		   
			   createBlue()
			   enemy.x = spawnPoint3.x-50
			   enemy.y = spawnPoint3.y
			   creator(enemy)
   
			   createRedPoop()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y-150
			   --enemy.casterLv=3
			   waiting(enemy)

			   createCrate()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y

			  -- createHood()
			  -- enemy.x = spawnPoint6.x
			 --  enemy.y = spawnPoint6.y
			   --enemy.casterLv=3
			  -- waiting(enemy)

			   if gameStatus.chestStage21 ==0 then

				createTreasure()
				enemy.x = spawnPoint5.x
				enemy.y = spawnPoint5.y
			   else
				createArmored()
				enemy.x = spawnPoint5.x
				enemy.y = spawnPoint5.y
				attacking(enemy)
				end
					
	
				fairyCount = fairyCount + math.random(0,2)
				if fairyCount >= 7 then
					fairyCount=0
				createFairy()
				enemy.x = screenRight+50
				enemy.y = centerY + math.random(-50,50)
				passing(enemy)
				end

				treasureCount = treasureCount + 1

		elseif gameStatus.stage==22 then
			mapBlock22.alpha = 1
			blink(mapBlock22)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/thirdFloorFourthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")
				spawnPoint6 = map:findObject("spawn6")

				burning = map:findObject("burning")

				if gameStatus.burnBlock22 ==0 then

					createBurning()
					fire.x =burning.x
					fire.y =burning.y
				else
						createBurningIcea()
						fire.x =burning.x
						fire.y =burning.y
					
				end

				if gameStatus.iceBoss==0 then

					barrier = map:findObject("barrier")

					createBarrier()
					stoneBarrier.x = barrier.x
					stoneBarrier.y = barrier.y-barrier.height
					locking(stoneBarrier)

				end
		   
			   createGhost()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   flyPatrol(enemy)
   
		   
			   createBlue()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   attackPatrol(enemy)
		   
			   createGhost()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   flyPatrol(enemy)

			   createGhost()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   flyPatrol(enemy)

			   createGhost()
			   enemy.x = spawnPoint6.x
			   enemy.y = spawnPoint6.y
			   flyPatrol(enemy)
   
			   createOcto()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y-60
			   throwPatrol(enemy)

			   fairyCount = fairyCount + math.random(0,2)
			if fairyCount >= 7 then
				fairyCount=0
			createFairy()
			enemy.x = screenRight+50
			enemy.y = centerY + math.random(-50,50)
			passing(enemy)
			end

			treasureCount = treasureCount + 1
			
		elseif gameStatus.stage==23 then
			mapBlock23.alpha = 1
			blink(mapBlock23)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/thirdFloorFifthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				
				musicTrack = audio.loadStream( "sounds/homeland.mp3" )

					startPos = map:findObject("startPos")
		
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")

				if gameStatus.stoneBlock23==0 then

					stoneBlock = map:findObject("stoneBlock")
	
					createStoneBlock()
					stone.x =stoneBlock.x
					stone.y =stoneBlock.y
					stone.no=23
					stone.myName="stoneBlock2"
				end
		   
			   createBall()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   jumpPatrol(enemy)
   
		   
			   createBoy()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y
			   shooter(enemy)
		   
			   createBlue()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y
			   creator(enemy)
   
			   createBoy()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   shooter(enemy)

			   createBase()
			   enemy.x = spawnPoint5.x
			   enemy.y = spawnPoint5.y

				
			   fairyCount = fairyCount + math.random(0,2)
			   if fairyCount >= 7 then
				   fairyCount=0
			   createFairy()
			   enemy.x = screenRight+50
			   enemy.y = centerY + math.random(-50,50)
			   passing(enemy)
			   end

			   treasureCount = treasureCount + 1
	
		elseif gameStatus.stage==24 then
			mapBlock24.alpha = 1
			blink(mapBlock24)
			----------------------if u save the tiled as lua, use this------
				--local mapData = require "maps.bg.bg9"
				local mapData = json.decodeFile(system.pathForFile("maps/bg/thirdFloorSixthRoom.json", system.ResourceDirectory))  -- load from json export
				 map = tiled.new(mapData, "maps/bg")
		
				backGroup:insert( map )

				if gameStatus.shovelBoss==0 then
					musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
				else
					musicTrack = audio.loadStream( "sounds/homeland.mp3" )
				end

				startPos = map:findObject("startPos")

				
				spawnPoint = map:findObject("spawn")
				spawnPoint2 = map:findObject("spawn2")
				spawnPoint3 = map:findObject("spawn3")
				spawnPoint4 = map:findObject("spawn4")
				spawnPoint5 = map:findObject("spawn5")


				if gameStatus.stoneBlock24==0 then

				stoneBlock = map:findObject("stoneBlock")

				createStoneBlock()
				stone.x =stoneBlock.x
				stone.y =stoneBlock.y
				stone.no=24
				end

				if gameStatus.shovelBoss ==0 then
			
				createShovel()
				enemy.x = centerX+100
				enemy.y = screenTop+100
				shovel(enemy)

				barrier = map:findObject("barrier")

				createBarrier()
				stoneBarrier.x = barrier.x
				stoneBarrier.y = barrier.y-barrier.height
				locking(stoneBarrier)

				else

		   
			   createBoy()
			   enemy.x = spawnPoint.x
			   enemy.y = spawnPoint.y
			   shooter(enemy)
   
		   
			   createOcto()
			   enemy.x = spawnPoint2.x
			   enemy.y = spawnPoint2.y+50
			   throwPatrol(enemy)
		   
			   createGhost()
			   enemy.x = spawnPoint3.x
			   enemy.y = spawnPoint3.y+150
			   patrol(enemy)
   
			   createJelly()
			   enemy.x = spawnPoint4.x
			   enemy.y = spawnPoint4.y
			   --enemy.casterLv=3
			   casting(enemy)

			   

				end

				
				raining()

				treasureCount = treasureCount + 1

			elseif gameStatus.stage==25 then
				mapBlock25.alpha = 1
				blink(mapBlock25)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/caveFirstRoom.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
					--musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		--------------boss attack down ------ shovel knight
	
					startPos = map:findObject("startPos")
	
					
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
					spawnPoint4 = map:findObject("spawn4")
					spawnPoint5 = map:findObject("spawn5")

					instaKill = map:findObject("instaKill")

					createInstaKill()
					kill.x = instaKill.x
					kill.y = instaKill.y

					instaKill = map:findObject("instaKill2")

					createInstaKill()
					kill.x = instaKill.x
					kill.y = instaKill.y
	
			   
					if gameStatus.drakzHighJump==0 then
				   createDashUp()
				   ability.x = spawnPoint.x+100
				   ability.y = spawnPoint.y
					end
	   
			   
				   createRed()
				   enemy.x = spawnPoint3.x-100
				   enemy.y = spawnPoint3.y
				   flyPatrol(enemy)

				   createRed()
				   enemy.x = spawnPoint4.x+50
				   enemy.y = spawnPoint4.y
				   flyPatrol(enemy)
			   
				   createBoy()
				   enemy.x = spawnPoint.x-100
				   enemy.y = spawnPoint.y
				   shooter(enemy)
	   
				   createJelly()
				   enemy.x = spawnPoint2.x+50
				   enemy.y = spawnPoint2.y
				   --enemy.casterLv=3
				   casting(enemy)
	
					caving()
	
					treasureCount = treasureCount + 1

				elseif gameStatus.stage==26 then
					mapBlock26.alpha = 1
					blink(mapBlock26)
					----------------------if u save the tiled as lua, use this------
						--local mapData = require "maps.bg.bg9"
						local mapData = json.decodeFile(system.pathForFile("maps/bg/boss2.json", system.ResourceDirectory))  -- load from json export
						 map = tiled.new(mapData, "maps/bg")
				
						backGroup:insert( map )

						if gameStatus.coleBoss5==0 then
							musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
						else
							musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
						end
		
						startPos = map:findObject("startPos")
		
						
						spawnPoint = map:findObject("spawn")
						spawnPoint2 = map:findObject("spawn2")
						spawnPoint3 = map:findObject("spawn3")
						spawnPoint4 = map:findObject("spawn4")
						spawnPoint5 = map:findObject("spawn5")
						spawnPoint6 = map:findObject("spawn6")
						spawnPoint7 = map:findObject("spawn7")
						spawnPoint8 = map:findObject("spawn8")
		
		

		
						if gameStatus.coleBoss5 ==0 then
		
							createCole()
							--cole.x = spawnPoint
							--cole.y = spawnPoint
							--enemy.casterLv=2
							coleAllForm(cole)

							
			
							barrier = map:findObject("barrier")
					
							createBarrier()
							stoneBarrier.x = barrier.x
							stoneBarrier.y = barrier.y-barrier.height
							locking(stoneBarrier)
			
							else
			
					   
						   createCrate()
						   enemy.x = spawnPoint.x
						   enemy.y = spawnPoint.y

						   createCrate()
						   enemy.x = spawnPoint5.x
						   enemy.y = spawnPoint5.y

			   
		
									
							end
			
							
							caving()
			
							treasureCount = treasureCount + 1

					elseif gameStatus.stage==27 then
						mapBlock27.alpha = 1
						blink(mapBlock27)
						----------------------if u save the tiled as lua, use this------
							--local mapData = require "maps.bg.bg9"
							local mapData = json.decodeFile(system.pathForFile("maps/bg/caveThirdRoom.json", system.ResourceDirectory))  -- load from json export
							 map = tiled.new(mapData, "maps/bg")
					
							backGroup:insert( map )

							musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
							--musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
				--------------boss attack down ------ shovel knight
			
							startPos = map:findObject("startPos")
			
							
							spawnPoint = map:findObject("spawn")
							spawnPoint2 = map:findObject("spawn2")
							spawnPoint3 = map:findObject("spawn3")
							spawnPoint4 = map:findObject("spawn4")
							spawnPoint5 = map:findObject("spawn5")
			
			
							if gameStatus.stoneBlock9==0 then
			
							stoneBlock = map:findObject("stoneBlock")
			
							createStoneBlock()
							stone.x =stoneBlock.x
							stone.y =stoneBlock.y
							stone.no=9
							end

							if gameStatus.stoneBlock27==0 then
			
								stoneBlock2 = map:findObject("stoneBlock2")
				
								createStoneBlock2()
								stone2.x =stoneBlock2.x
								stone2.y =stoneBlock2.y
								stone2.no=27
								end
					
			
							treasureCount = treasureCount + 1

						elseif gameStatus.stage==28 then
							mapBlock28.alpha = 1
							blink(mapBlock28)
							----------------------if u save the tiled as lua, use this------
								--local mapData = require "maps.bg.bg9"
								local mapData = json.decodeFile(system.pathForFile("maps/bg/caveFourthRoom.json", system.ResourceDirectory))  -- load from json export
								 map = tiled.new(mapData, "maps/bg")
						
								backGroup:insert( map )

								if gameStatus.coleBoss4==0 then
									musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
								else
										musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
								end
				
								startPos = map:findObject("startPos")				
								
								spawnPoint = map:findObject("spawn")
								spawnPoint2 = map:findObject("spawn2")
								spawnPoint3 = map:findObject("spawn3")
								spawnPoint4 = map:findObject("spawn4")
								spawnPoint5 = map:findObject("spawn5")

								instaKill = map:findObject("instaKill")

								createKill()
								kill.x = instaKill.x
								kill.y = instaKill.y

								burning = map:findObject("burning")
								burning2 = map:findObject("burning2")


								if gameStatus.lavaWallisOn == 1 then
									lavaWall = map:findObject("lavaWall")
									createLavaWall()
								end

				
								if gameStatus.burnBlock28 ==0 then
				
								createBurning()
								fire.x =burning.x
								fire.y =burning.y
								else
									createBurningIcea()
								--	fire.x =burning.x
								--	fire.y =burning.y
								
								end

								if gameStatus.burnBlock28b ==0 then
				
								createBurningb()
								fire2.x =burning2.x
								fire2.y =burning2.y
								else
									createBurningIceb()
								--	fire2.x =burning2.x
								--	fire2.y =burning2.y
				
								end
								---------------------------------
				

				
								if gameStatus.coleBoss4 ==0 then
		
									createCole()
									cole.x = centerX-300
									cole.y = centerY-100
									--enemy.casterLv=2
									coleFire(cole)
									
					
									barrier = map:findObject("barrier")
					
									createBarrier()
									stoneBarrier.x = barrier.x
									stoneBarrier.y = barrier.y-barrier.height
									locking(stoneBarrier)

									barrier2 = map:findObject("barrier2")

									createBarrier2()
									stoneBarrier2.x = barrier2.x
									stoneBarrier2.y = barrier2.y
									--locking(stoneBarrier2)
					
									else
					
							   
								   createRed()
								   enemy.x = spawnPoint5.x+100
								   enemy.y = spawnPoint5.y+100
								   flyPatrol(enemy)
					   
							   
								   createRed()
								   enemy.x = spawnPoint2.x
								   enemy.y = spawnPoint2.y
								   patrol(enemy)

								   createRed()
								   enemy.x = spawnPoint3.x
								   enemy.y = spawnPoint3.y
								   flyPatrol(enemy)
					   
							   
								   createDr()
								   enemy.x = spawnPoint4.x
								   enemy.y = spawnPoint4.y
								   casting(enemy)

				
											
									end
					
									
									caving()
					
									treasureCount = treasureCount + 1

							elseif gameStatus.stage==29 then
								mapBlock29.alpha = 1
								blink(mapBlock29)
								----------------------if u save the tiled as lua, use this------
									--local mapData = require "maps.bg.bg9"
									local mapData = json.decodeFile(system.pathForFile("maps/bg/caveFifthRoom.json", system.ResourceDirectory))  -- load from json export
									 map = tiled.new(mapData, "maps/bg")
							
									backGroup:insert( map )

									if gameStatus.coleBoss3==0 then
										musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
									else
											musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
									end
					
									startPos = map:findObject("startPos")
									iceWall = map:findObject("iceWall")
									
									spawnPoint = map:findObject("spawn")
									spawnPoint2 = map:findObject("spawn2")
									spawnPoint3 = map:findObject("spawn3")
									spawnPoint4 = map:findObject("spawn4")
									spawnPoint5 = map:findObject("spawn5")

									if gameStatus.iceWallisOn == 1 then
										createWall()
									end

								-------------instant kill ground -----------

								instaKill = map:findObject("instaKill")

								createInstaKill()
								kill.x = instaKill.x
								kill.y = instaKill.y
								---------------------------------
					
					
					
								if gameStatus.coleBoss3 ==0 then
		
									createCole()
									cole.x = centerX-300
									cole.y = centerY-100
									--enemy.casterLv=2
									coleIce(cole)
									
					
									barrier = map:findObject("barrier")
					
									createBarrier()
									stoneBarrier.x = barrier.x
									stoneBarrier.y = barrier.y-barrier.height
									locking(stoneBarrier)

									barrier2 = map:findObject("barrier2")

									createBarrier2()
									stoneBarrier2.x = barrier2.x
									stoneBarrier2.y = barrier2.y
									--locking(stoneBarrier2)
					
									snowing()
									else
					
							   
								   createFloatingIce()
								   enemy.x = spawnPoint.x
								   enemy.y = spawnPoint.y
								   flyPatrol(enemy)

								   createCrate()
								   enemy.x = spawnPoint2.x-250
								   enemy.y = spawnPoint2.y

								   createFloatingIce()
								   enemy.x = spawnPoint3.x
								   enemy.y = spawnPoint3.y
								   flyPatrol(enemy)

								   createFloatingIce()
								   enemy.x = spawnPoint4.x
								   enemy.y = spawnPoint4.y
								   flyPatrol(enemy)

								   createFloatingIce()
								   enemy.x = spawnPoint4.x-100
								   enemy.y = spawnPoint4.y-100
								   flyPatrol(enemy)
					   
								   createFloatingIce()
								   enemy.x = spawnPoint5.x
								   enemy.y = spawnPoint5.y
								   flyPatrol(enemy)

				
											
									end
					
									
									caving()
					
									treasureCount = treasureCount + 1

								elseif gameStatus.stage==30 then
									mapBlock30.alpha = 1
									blink(mapBlock30)
									----------------------if u save the tiled as lua, use this------
										--local mapData = require "maps.bg.bg9"
										local mapData = json.decodeFile(system.pathForFile("maps/bg/caveSixthRoom.json", system.ResourceDirectory))  -- load from json export
										 map = tiled.new(mapData, "maps/bg")
								
										backGroup:insert( map )

										if gameStatus.coleBoss2==0 then
											musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
										else
												musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
										end
						
										startPos = map:findObject("startPos")
						
										
										spawnPoint = map:findObject("spawn")
										spawnPoint2 = map:findObject("spawn2")
										spawnPoint3 = map:findObject("spawn3")	
										spawnPoint4 = map:findObject("spawn4")
										spawnPoint5 = map:findObject("spawn5")
										spawnPoint6 = map:findObject("spawn6")
										spawnPoint7 = map:findObject("spawn7")		
										spawnPoint8 = map:findObject("spawn8")			
						
								-------------instant kill ground -----------
								instaKill = map:findObject("instaKill")

								createInstaKill()
								kill.x = instaKill.x
								kill.y = instaKill.y
								---------------------------------
						
								   
								if gameStatus.coleBoss2 ==0 then
		
										createCole()
										cole.x = centerX-300
										cole.y = centerY-100
										--enemy.casterLv=2
										coleHarpy(cole)
										
						
										barrier = map:findObject("barrier")
						
										createBarrier()
										stoneBarrier.x = barrier.x
										stoneBarrier.y = barrier.y-barrier.height
										locking(stoneBarrier)

										
									barrier2 = map:findObject("barrier2")

									createBarrier2()
									stoneBarrier2.x = barrier2.x
									stoneBarrier2.y = barrier2.y
						
								else
						
								   
									   createDr()
									   enemy.x = spawnPoint2.x+60
									   enemy.y = spawnPoint2.y
									   casting(enemy)
						   
									   createFly()
									   enemy.x = spawnPoint5.x
									   enemy.y = spawnPoint5.y
									   patrol(enemy)
								   
									   createHood()
									   enemy.x = spawnPoint8.x-50
									   enemy.y = spawnPoint8.y
									   shooter(enemy)

									   createWormy()
									   enemy.x = spawnPoint3.x-150
									   enemy.y = spawnPoint3.y
									   longWalk(enemy)

					
												
								end
						
										
									caving()
						
									treasureCount = treasureCount + 1

					elseif gameStatus.stage==41 then
						mapBlock41.alpha = 1
						blink(mapBlock41)
						----------------------if u save the tiled as lua, use this------
							--local mapData = require "maps.bg.bg9"
							local mapData = json.decodeFile(system.pathForFile("maps/bg/tower1.json", system.ResourceDirectory))  -- load from json export
							 map = tiled.new(mapData, "maps/bg")
					
							backGroup:insert( map )
							--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				--------------boss attack down ------ shovel knight
			
						musicTrack = audio.loadStream( "sounds/homeland.mp3" )

							startPos = map:findObject("startPos")
			
							
							spawnPoint = map:findObject("spawn")
							spawnPoint2 = map:findObject("spawn2")
							spawnPoint3 = map:findObject("spawn3")
							spawnPoint4 = map:findObject("spawn4")

							if gameStatus.superFireBall==0 then
								createSuperFire()
								ability.x = spawnPoint.x
								ability.y = spawnPoint.y
							end

							createOgre()
							enemy.x = spawnPoint3.x
							enemy.y = spawnPoint3.y
							attackThrow(enemy)
				
						
							createDr()
							enemy.x = spawnPoint4.x
							enemy.y = spawnPoint4.y
							casting(enemy)

							createTreasure()
							enemy.x = spawnPoint2.x
							enemy.y = spawnPoint2.y
					
			
							treasureCount = treasureCount + 1
					elseif gameStatus.stage==42 then
						mapBlock42.alpha = 1
						blink(mapBlock42)
						----------------------if u save the tiled as lua, use this------
							--local mapData = require "maps.bg.bg9"
							local mapData = json.decodeFile(system.pathForFile("maps/bg/tower2.json", system.ResourceDirectory))  -- load from json export
							 map = tiled.new(mapData, "maps/bg")
					
							backGroup:insert( map )
							--musicTrack = audio.loadStream( "sounds/melodyloops-the-quiet-solitude.mp3" )
				--------------boss attack down ------ shovel knight
						musicTrack = audio.loadStream( "sounds/homeland.mp3" )
						
							startPos = map:findObject("startPos")
			
							
							spawnPoint = map:findObject("spawn")
							spawnPoint2 = map:findObject("spawn2")
							spawnPoint3 = map:findObject("spawn3")
							spawnPoint4 = map:findObject("spawn4")

							if gameStatus.superIceBlast==0 then
								createSuperIce()
								ability.x = spawnPoint.x
								ability.y = spawnPoint.y
							end

							createBlue()
							enemy.x = spawnPoint3.x
							enemy.y = spawnPoint3.y
							creator(enemy)
				
						
							createEye()
							enemy.x = spawnPoint4.x-100
							enemy.y = spawnPoint4.y-100
							pooper(enemy)

							createTreasure()
							enemy.x = spawnPoint2.x
							enemy.y = spawnPoint2.y
					
			
							treasureCount = treasureCount + 1


			elseif gameStatus.stage==00301 then
				mapBlock0030.alpha = 1
				blink(mapBlock0030)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/caveHallway.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y

					treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()


			elseif gameStatus.stage==130 then
				mapBlock130.alpha = 1
				blink(mapBlock130)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/hallWay.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y

					treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				  -- enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y
				   --waiting(enemy)
			elseif gameStatus.stage==0300 then
				mapBlock030.alpha = 1
				blink(mapBlock030)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/hallWayUnderground.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x-20
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				   --enemy.x = spawnPoint.x+50
				   --enemy.y = spawnPoint.y
				   --waiting(enemy)

			elseif gameStatus.stage==230 then
				mapBlock230.alpha = 1
				blink(mapBlock230)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/hallWaySecondFloor.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x-10
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				   --enemy.x = spawnPoint.x
				   --enemy.y = spawnPoint.y
				   --waiting(enemy)	
			elseif gameStatus.stage==330 then
				mapBlock330.alpha = 1
				blink(mapBlock330)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/hallwayThirdRoom.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createTreasure()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				  -- enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y
				   --waiting(enemy)	
			elseif gameStatus.stage==0027226 then
				mapBlock00p2.alpha = 1
				blink(mapBlock00p2)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/puzzle6.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				   --enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y
				   --waiting(enemy)

				   if gameStatus.puzzle6==0 then
				   blackOut()
				   end

			elseif gameStatus.stage==0827 then
				mapBlock0p1.alpha = 1
				blink(mapBlock0p1)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/puzzle1.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				  -- enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y
				   --waiting(enemy)

				   if gameStatus.puzzle1==0 then
				   blackOut()
				   end

			elseif gameStatus.stage==010211 then
				mapBlock0p3.alpha = 1
				blink(mapBlock0p3)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/puzzle3.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				  -- enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y

				   if gameStatus.puzzle3==0 then
					blackOut()
					end
			elseif gameStatus.stage==216217 then
				mapBlock2p2.alpha = 1
				blink(mapBlock2p2)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/puzzle2.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				  -- enemy.x = spawnPoint.x-50
				  -- enemy.y = spawnPoint.y

				   if gameStatus.puzzle2==0 then
					blackOut()
					end

			elseif gameStatus.stage==323224 then
				mapBlock3p4.alpha = 1
				blink(mapBlock3p4)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/puzzle4.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				  -- enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y
				   --waiting(enemy)

				   if gameStatus.puzzle4==0 then
					blackOut()
					end
			elseif gameStatus.stage==16212 then
				mapBlock1p5.alpha = 1
				blink(mapBlock1p5)
				----------------------if u save the tiled as lua, use this------
					--local mapData = require "maps.bg.bg9"
					local mapData = json.decodeFile(system.pathForFile("maps/bg/puzzle5.json", system.ResourceDirectory))  -- load from json export
					 map = tiled.new(mapData, "maps/bg")
			
					backGroup:insert( map )

					musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
					
						startPos = map:findObject("startPos")
			
					spawnPoint = map:findObject("spawn")
					spawnPoint2 = map:findObject("spawn2")
					spawnPoint3 = map:findObject("spawn3")
	   
				   createCrate()
				   enemy.x = spawnPoint3.x
				   enemy.y = spawnPoint3.y
				   
				   treasureCount = treasureCount + 1
				   if treasureCount>=5 then
				   createTreasure()
				   enemy.x = spawnPoint2.x
				   enemy.y = spawnPoint2.y
				   end
	
				   createTeacher()
				   --enemy.x = spawnPoint.x
				  -- enemy.y = spawnPoint.y
				   --waiting(enemy)

				   if gameStatus.puzzle5==0 then
					blackOut()
					end
		end
    
end



function musicChecked()
	if gameStatus.stage==(1 or 2 or 3 or 4 or 5 or 6) then
		-- first floor
			musicTrack = audio.loadStream( "sounds/chasing-ghosts.mp3" )
	elseif gameStatus.stage==( 8 or 9 or 10) then
		--underGround
			musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
	elseif gameStatus.stage==(25 or 27 ) then
		--caves
			musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
	elseif gameStatus.stage==(13 or 14 or 15 or 16  or 18 or 41) then
		--second 
			musicTrack = audio.loadStream( "sounds/homeland.mp3" )
	elseif gameStatus.stage==(19 or 20 or 21 or 22 or 23  or 42) then
		-- third
			musicTrack = audio.loadStream( "sounds/homeland.mp3" )
	elseif gameStatus.stage==(16212 or 323224 or 216217 or 010211 or 0827 or 0027226) then
		--puzzle
			musicTrack = audio.loadStream( "sounds/disappointed.mp3" )
	elseif gameStatus.stage==(330 or 230 or 130 or 0300 or 00301) then
		--hallway
	elseif gameStatus.stage==12 then
		if gameStatus.coleBoss1==0 then
			musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
		else
			musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==30 then
		if gameStatus.coleBoss2==0 then
			musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==29 then
		if gameStatus.coleBoss3==0 then
			musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==28 then
		if gameStatus.coleBoss4==0 then
			musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==26 then
		if gameStatus.coleBoss5==0 then
			musicTrack = audio.loadStream( "sounds/breaking-the-enemy-lines.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==7 then
		if gameStatus.harpyBoss==0 then
			musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==11 then
		if gameStatus.iceBoss==0 then
			musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==17 then
		if gameStatus.fireBoss==0 then
			musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	elseif gameStatus.stage==24 then
		if gameStatus.shovelBoss==0 then
			musicTrack = audio.loadStream( "sounds/save-yourself.mp3" )
		else
				musicTrack = audio.loadStream( "sounds/voices-from-darkness.mp3" )
		end
	end
end





