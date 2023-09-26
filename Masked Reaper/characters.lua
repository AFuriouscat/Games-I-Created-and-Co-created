 doubleJump =1
 --loading = false

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


  function shake()

	local function f()
		transition.to (sceneGroup, {time = 10,y = 0})
	end
	local function e()
		transition.to (sceneGroup, {time = 10,y =  3,onComplete = f})
	end
	local function d()
		transition.to (sceneGroup, {time = 20,y =  -5,onComplete = e})
	end
	local function c()
		transition.to (sceneGroup, {time = 20,y =  5,onComplete = d})
	end

	local function b()
		transition.to (sceneGroup, {time = 30,y =  -20,onComplete = c})
	end

	local function a()
		transition.to (sceneGroup, {time = 30,y =  10,onComplete = d})
	end
	a()


end
function shake2()

	local function f()
		transition.to (sceneGroup, {time = 10,x = 0})
	end
	local function e()
		transition.to (sceneGroup, {time = 10,x =  8,onComplete = f})
	end
	local function d()
		transition.to (sceneGroup, {time = 20,x =  -15,onComplete = e})
	end
	local function c()
		transition.to (sceneGroup, {time = 20,x =  15,onComplete = d})
	end

	local function b()
		transition.to (sceneGroup, {time = 30,x =  -30,onComplete = c})
	end

	local function a()
		transition.to (sceneGroup, {time = 30,x =  20,onComplete = d})
	end
	a()


end

function createSlash(self)

    local spriteOptions = {
        height = 64,
        width = 64,
        numFrames = 11,
        sheetContentWidth = 192,
        sheetContentHeight = 256
      }
      local mySheet = graphics.newImageSheet("images/hitted.png", spriteOptions)
      local sequenceData = {
        {name = "slash1", start =5,count=7, time =300, loopCount =1},
        {name = "slash2", start =5,count=4, time =300, loopCount =1},
        {name = "slash3", start =5,count=7, time =300, loopCount =1},

      }
     
    
        -- Display the new sprite at the coordinates passed
     local slash = display.newSprite(uiGroup,mySheet, sequenceData)

     
     slash:setSequence("slash1")
     slash:play()

    if self.type=="vase" then
         audio.play( soundVase)
    elseif self.type=="crate" then
        audio.play( soundCrate)
    elseif self.type=="box" then
        audio.play( soundVase)
    elseif self.type=="treasure" then
        audio.play( soundCrate)
    else
        audio.play( soundSlashed)
    end

     slash.x =self.x
     slash.y =self.y

     if hero.x < self.x then
        slash.xScale=1
     else
        slash.xScale=-1
     end


    transition.to( slash,{time = 350 ,onComplete=
    function()display.remove( slash ) end })--end of hitting code


 end

 function createHealRing()

    local spriteOptions = {
        height = 120,
        width = 120,
        numFrames = 7,
        sheetContentWidth = 360,
        sheetContentHeight = 360
      }
      local mySheet = graphics.newImageSheet("images/healing.png", spriteOptions)
      local sequenceData = {
        {name = "smoke", start =1,count=7, time =600, loopCount =1}

      }
     
    
        -- Display the new sprite at the coordinates passed
    local smoke = display.newSprite(uiGroup,mySheet, sequenceData)
    smoke:setSequence("smoke")
    smoke:play()

    smoke.x = hero.x
    smoke.y = hero.y+10


    transition.to( smoke,{time = 550,onComplete=
    function()display.remove( smoke ) end })--end of hitting code


 end


 function createSmoke()

    local spriteOptions = {
        height = 32,
        width = 32,
        numFrames = 7,
        sheetContentWidth = 96,
        sheetContentHeight = 96
      }
      local mySheet = graphics.newImageSheet("images/smoke.png", spriteOptions)
      local sequenceData = {
        {name = "smoke", start =1,count=7, time =400, loopCount =1}

      }
     
    
        -- Display the new sprite at the coordinates passed
    local smoke = display.newSprite(uiGroup,mySheet, sequenceData)
    smoke.anchorY =1
    smoke.x = hero.x
    smoke.y = hero.y+40
    smoke:setSequence("smoke")
    smoke:play()

    transition.to( smoke,{time = 400 ,onComplete=
    function()display.remove( smoke ) end })--end of hitting code




 end

 function createDust()

    local spriteOptions = {
        height = 64,
        width = 64,
        numFrames = 6,
        sheetContentWidth = 128,
        sheetContentHeight = 192
      }
      local mySheet = graphics.newImageSheet("images/dust.png", spriteOptions)
      local sequenceData = {
        {name = "smoke", start =1,count=6, time =400, loopCount =1}

      }
     
    
        -- Display the new sprite at the coordinates passed
    local smoke = display.newSprite(uiGroup,mySheet, sequenceData)
    smoke.anchorY =1
    smoke.x = hero.x
    smoke.y = hero.y+40
    smoke:setSequence("smoke")
    smoke:play()

    if hero.xScale==1 then
        smoke.xScale=-1
    end

    transition.to( smoke,{time = 400 ,onComplete=
    function()display.remove( smoke ) end })--end of hitting code



 end

 function flash(self)   
    

        -- Display the new sprite at the coordinates passed
    local smoke = display.newImageRect( uiGroup2, "images/flash.png", display.actualContentWidth,display.actualContentHeight )
    smoke.x = centerX
    smoke.y = centerY
    smoke.alpha=.5

    if gameStatus.hp <= gameStatus.maxHp *.30 then
        smoke:setFillColor(.8,0,0)
    end

    local function removeMe()
        display.remove(smoke)
    end
  --  transition.to( smoke,{time = 40 ,onComplete=
  --  function()display.remove( smoke ) end })--end of hitting code
    timer.performWithDelay(30,removeMe,1)


 end

 function createBuble(self)

    local spriteOptions = {
        height = 64,
        width = 64,
        numFrames = 5,
        sheetContentWidth = 128,
        sheetContentHeight = 192
      }
      local mySheet = graphics.newImageSheet("images/buble.png", spriteOptions)
      local sequenceData = {
        {name = "smoke", start =1,count=5, time =400, loopCount =1}

      }
     
    
        -- Display the new sprite at the coordinates passed
    local smoke = display.newSprite(uiGroup,mySheet, sequenceData)
    smoke.x = self.x
    smoke.y = self.y
    smoke:setSequence("smoke")
    smoke:play()

    transition.to( smoke,{time = 400,xScale=1.5,yScale=1.5 ,onComplete=
    function()display.remove( smoke ) end })--end of hitting code



 end

 function createBubleBoss(self)

    local spriteOptions = {
        height = 128,
        width = 128,
        numFrames = 5,
        sheetContentWidth = 256,
        sheetContentHeight = 384
      }
      local mySheet = graphics.newImageSheet("images/buble.png", spriteOptions)
      local sequenceData = {
        {name = "smoke", start =1,count=5, time =400, loopCount =2}

      }
     
    
        -- Display the new sprite at the coordinates passed
    local smoke = display.newSprite(uiGroup,mySheet, sequenceData)
    smoke.x = self.x
    smoke.y = self.y
    smoke:setSequence("smoke")
    smoke:play()

    transition.to( smoke,{time = 800,xScale=1.5,yScale=1.5 ,onComplete=
    function()display.remove( smoke ) end })--end of hitting code



 end

 function enemyBoom(self)

 end

 function hitDmg(self)

    local title =display.newText(uiGroup," "..totalDmg, enemy.x,enemy.y , "Rooters.ttf", 20)
    title:setFillColor( 1, 0.2, 0.2 )
    transition.to( title,{time = 300,x=enemy.x+50,y=enemy.y-20,transition=easing.outCirc  ,onComplete=
    function()display.remove( title ) end })--end of hitting code

 end

 function createWeapon()

    local spriteOptions = {
        height = 128,
        width = 256,
        numFrames = 32,
        sheetContentWidth = 1024,
        sheetContentHeight = 1024
      }
      local mySheet = graphics.newImageSheet("images/scythe3.png", spriteOptions)
      local sequenceData = {
        {name = "idle", start =1,count=4, time =500, loopCount =0},
        {name = "attack1", start =5,count=8, time =300, loopCount =1},
        {name = "attack2", start =12,count=10, time =300, loopCount =1},
        {name = "throw", start =22,count=11, time = 400, loopCount = 1},

     
      }
     
    
        -- Display the new sprite at the coordinates passed
    weapon = display.newSprite(mainGroup,mySheet, sequenceData)
    weapon:setSequence("idle")
    weapon:play()

    weapon.x = hero.x
    weapon.y = hero.y
  
    weapon.myName="weapon"



     weaponRect = display.newRect(mainGroup, hero.x, hero.y, 20, 60 )
     weaponRect.myName="weapon"
     weaponRect.attacked = false
     weaponRect.str =gameStatus.str -- heroStr
     weaponRect.anchorY =.9
     weaponRect.alpha =0

        -----------sword ---------    
        physics.addBody( weaponRect, "dynamic",
        {density=10, bounce=0, friction = 100,box={ halfWidth=10, halfHeight=30, x=0, y=-25},isSensor=true })

        local function resumeEnemy(self)
            self.damaged=false
            transition.resume(self)
        end
        local function hittableAgain(self)
            if self.isDead == false then
             self.damaged=false
            end
        end

    function weaponCollide(self,event)

        local self = event.target


    if ( event.phase == "began" ) then
        
        if    ( self.myName == "weapon"  and (event.other.myName=="enemy"and event.otherElement==1 ))  then
            local you = event.other
            local dmg = self.str
                
               -- if weaponRect.attacked== true and self.attacked==true and you.damaged==false then
               if  self.attacked==true and you.damaged==false then
                   -- weaponRect.attacked=false
                   -- self.attacked=false
                   you.damaged=true


     
                            if gameStatus.strLv == 1 then
                            dmg= math.random(4,5)
                            elseif gameStatus.strLv == 2 then
                             dmg= math.random(5,6)
                            elseif gameStatus.strLv == 3 then
                             dmg= math.random(6,7)
                            elseif gameStatus.strLv == 4 then
                             dmg= math.random(7,8)
                            elseif gameStatus.strLv == 5 then
                             dmg= math.random(8,9)
                            elseif gameStatus.strLv == 6 then
                             dmg= math.random(9,10)
                            elseif gameStatus.strLv == 7 then
                             dmg= math.random(10,11)
                            elseif gameStatus.strLv == 8 then
                             dmg= math.random(11,12)
                            elseif gameStatus.strLv == 9 then
                             dmg= math.random(12,13)
                            elseif gameStatus.strLv == 10 then
                             dmg= math.random(13,14)
                            elseif gameStatus.strLv == 11 then
                             dmg= math.random(14,15)
                            end
                            
                            local critDmg =math.random(1,hero.crit)
                           
                            if weaponRect.attackDown==true then
                                dmg=dmg + gameStatus.magLv
                            end
                           -- fireBall.fireattacked = true
                            if self.fireattacked==true then
                                if gameStatus.magLv == 1 then
                                    dmg= math.random(5,6)
                                    elseif gameStatus.magLv == 2 then
                                     dmg= math.random(6,7)
                                    elseif gameStatus.magLv == 3 then
                                     dmg= math.random(8,9)
                                    elseif gameStatus.magLv == 4 then
                                     dmg= math.random(9,10)
                                    elseif gameStatus.magLv == 5 then
                                     dmg= math.random(10,11)
                                    elseif gameStatus.magLv == 6 then
                                     dmg= math.random(11,12)
                                    elseif gameStatus.magLv == 7 then
                                     dmg= math.random(12,13)
                                    elseif gameStatus.magLv == 8 then
                                     dmg= math.random(13,14)
                                    elseif gameStatus.magLv == 9 then
                                     dmg= math.random(14,15)
                                    elseif gameStatus.magLv == 10 then
                                     dmg= math.random(15,16)
                                    elseif gameStatus.magLv == 11 then
                                     dmg= math.random(16,17)
                                    end

                                   if self.superfireattacked==true then
                                     dmg=dmg + gameStatus.magLv
                                   end

                                   if you.element =="ice" then
                                    critDmg =1
                                     end
                            end


                            if self.iceAttacked ==true then
                                     if gameStatus.magLv == 1 then
                                    dmg= math.random(5,6)
                                    elseif gameStatus.magLv == 2 then
                                     dmg= math.random(6,7)
                                    elseif gameStatus.magLv == 3 then
                                     dmg= math.random(8,9)
                                    elseif gameStatus.magLv == 4 then
                                     dmg= math.random(9,10)
                                    elseif gameStatus.magLv == 5 then
                                     dmg= math.random(10,11)
                                    elseif gameStatus.magLv == 6 then
                                     dmg= math.random(11,12)
                                    elseif gameStatus.magLv == 7 then
                                     dmg= math.random(12,13)
                                    elseif gameStatus.magLv == 8 then
                                     dmg= math.random(13,14)
                                    elseif gameStatus.magLv == 9 then
                                     dmg= math.random(14,15)
                                    elseif gameStatus.magLv == 10 then
                                     dmg= math.random(15,16)
                                    elseif gameStatus.magLv == 11 then
                                     dmg= math.random(16,17)
                                    end

                                    if self.supericeAttacked==true then
                                        dmg=dmg + gameStatus.magLv
                                    end

                                    if you.element =="fire" then
                                        critDmg =1
                                    end
                            end

                           --crit

                            if critDmg == 1 then
                                dmg = dmg *2
                            end

                      you.hp = you.hp - dmg
                    

                    createSlash(you)

                   -- you.hitted=true
                  -- if you.boss == true then
                    --boss will not be affected by hit back, and some enemies
                  -- else
                    transition.pause(you)
                     --if self.x >= you.x then
                       -- transition.to(you,{time=150,onComplete= resumeEnemy})
                       -- transition.to(you,{time=150,alpha=0,onComplete= getHit})
                        --local vx, vy = you:getLinearVelocity()
                       -- you:setLinearVelocity( 0, vy )
                       -- you:applyLinearImpulse( -70, nil, you.x, you.y )
                     --else
                        transition.to(you,{time=160,onComplete= resumeEnemy})
                       -- transition.to(you,{time=1000,onComplete= hittableAgain})
                        --local vx, vy = you:getLinearVelocity()
                        --you:setLinearVelocity( 0, vy )
                        --you:applyLinearImpulse( 70, nil, you.x, you.y )
                     --end
                 -- end 



                  if you.type=="fairy" then
                    createCoin(you)
                  end

                  if critDmg == 1 then

                    local title =display.newText(uiGroup,"crit "..dmg, you.x,you.y-30 , "Rooters.ttf", 35)
                    title:setFillColor( 1,0.6,0.2 )
                    title.yScale=.1
                    transition.to( title,{time = 400,x=you.x,y=you.y-70,yScale =1,transition=easing.outCirc  ,onComplete=
                    function()display.remove( title ) end })--end of hitting code
                    shake2()
                  else
                    local title =display.newText(uiGroup," "..dmg, you.x,you.y-30 , "Rooters.ttf", 30)
                    title:setFillColor( 1, 0.2, 0.2 )
                    title.yScale=.1
                    transition.to( title,{time = 400,x=you.x,y=you.y-70,yScale =1,transition=easing.outCirc  ,onComplete=
                    function()display.remove( title ) end })--end of hitting code
                    shake()
                  end
                

                    if you.hp <=0 and you.isDead==false then
                        
                        --transition.cancel(you)
                       -- if you.isDead==false then
                    if you.type=="harpy"then
                       -- you.isDead=true
                       -- createBubleBoss(you)

                        --createDoubleJump(you)

                        createHeart(you)
                        createMagic(you)
                        createCoin(you)

                        if gameStatus.firstKillHarpy == 0 then
                            gameStatus.firstKillHarpy = 1
                        createCoin(you)
                         createCoin(you)
                         createCoin(you)
                         createCoin(you)
                        end
                       -- saveScores()

                       saveScores()
                       transition.cancel(you)
                       harpyTalk(you)



                     elseif you.type=="ice" then
                       -- you.isDead=true
                       -- createBubleBoss(you)

                       -- createIceBlast(you)
                        
                        createHeart(you)
                        createMagic(you)
                        createCoin(you)
                        if gameStatus.firstKillIce == 0 then
                            gameStatus.firstKillIce = 1
                        createCoin(you)
                         createCoin(you)
                         createCoin(you)
                         createCoin(you)
                        end
                       -- saveScores()

                       saveScores()
                       transition.cancel(you)
                       iceTalk(you)


                    
                       elseif you.type=="lava"  then
                           -- you.isDead=true
                           -- createBubleBoss(you)

                           -- createFireBall(you)
                            
                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            if gameStatus.firstKillFire == 0 then
                                gameStatus.firstKillFire = 1
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)
                             createCoin(you)
                            end
                           -- saveScores()
                           saveScores()
                           transition.cancel(you)
                           fireTalk(you)
                           transition.cancel(enemyl)
                           transition.cancel(enemyr)
                            createBuble(enemyr)
                            transition.to( enemyr,{time = 300,xScale=2  ,onComplete=
                            function()display.remove( enemyr ) end })
                            createBuble(enemyl)
                            transition.to( enemyl,{time = 300,xScale=2  ,onComplete=
                            function()display.remove( enemyl ) end })



                        elseif you.type=="shovel"  then
                            you.isDead=true
                            --createBubleBoss(you)

                           -- createDashDown(you)

                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            if gameStatus.firstKillGoblin == 0 then
                                gameStatus.firstKillGoblin = 1
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)
                             createCoin(you)
                            end
                           -- saveScores()

                           saveScores()
                           transition.cancel(you)
                           goblinTalk(you)
                        elseif you.type=="coleNormal"  then
                          --  you.isDead=true
                           -- createBubleBoss(you)

                            createBuble(stoneBarrier)
                            display.remove(stoneBarrier)
                            audio.play( soundStone)
                    
                            gameStatus.coleBoss1 = 1
                                                        
                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)

                            saveScores()
                            transition.cancel(you)
                            coleTalk(you)
                        elseif you.type=="coleHarpy"  then

                            createBuble(stoneBarrier)
                            display.remove(stoneBarrier)
                            audio.play( soundStone)
                    
                            gameStatus.coleBoss2 = 1
                                                        
                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)

                            saveScores()
                            transition.cancel(you)
                            coleTalk2(you)
                        elseif you.type=="coleIce"  then
                            you.isDead=true
                            createBuble(stoneBarrier)
                            display.remove(stoneBarrier)
                            audio.play( soundStone)
                    
                            gameStatus.coleBoss3 = 1
                                                        
                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)

                            saveScores()
                            transition.cancel(you)
                            coleTalk3(you)
                        elseif you.type=="coleFire"  then

                            createBuble(stoneBarrier)
                            display.remove(stoneBarrier)
                            audio.play( soundStone)
                    
                            gameStatus.coleBoss4 = 1
                                                        
                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)

                            saveScores()
                            transition.cancel(you)
                            coleTalk4(you)
                        elseif you.type=="coleAllForm"  then

                            you.rotation = 0
                            createBuble(stoneBarrier)
                            display.remove(stoneBarrier)
                            audio.play( soundStone)
                    
                            gameStatus.coleBoss5 = 1
                                                        
                            createHeart(you)
                            createMagic(you)
                            createCoin(you)
                            createCoin(you)
                             createCoin(you)
                             createCoin(you)

                            saveScores()
                            transition.cancel(you)
                            coleTalk5(you)


                        elseif you.type=="worm" then

                            createRedPoop(you)
                            enemy.x = you.x
                            enemy.y = you.y-50
                            waiting(enemy)

                            you.isDead=true
                            you:setSequence("boom")
                            you:play()
                            
                            transition.to( you,{time = 200 ,onComplete=
                            function()display.remove( you ) end })
                        elseif you.type=="box" then
                            you.isDead=true
                            you:setSequence("boom")
                            you:play()
                            createHeart(you)
                            
                            transition.to( you,{time = 10 ,onComplete=
                            function()physics.removeBody(you) end })
                            transition.to( you,{time = 600 ,onComplete=
                            function()display.remove( you ) end })


                        elseif you.type=="vase" then
                            you.isDead=true
                            you:setSequence("boom")
                            you:play()
                            createMagic(you)
                            transition.to( you,{time = 10 ,onComplete=
                            function()physics.removeBody(you) end })
                            transition.to( you,{time = 500 ,onComplete=
                            function()display.remove( you ) end })

                        elseif you.type=="crate" then
                            you.isDead=true
                            you:setSequence("boom")
                            you:play()

                            local r = math.random(1,7)
                            if gameStatus.hp < gameStatus.maxHp*.50 then
                                r=1
                            end
                            if r == 1 then
                              createHeart(you)
                            elseif r==2 then
                              createMagic(you)
                            elseif r==3 then
                              createCoin(you)
                              createCoin(you)
                            elseif r==4 then
                                createHeart(you)
                                createCoin(you)
                            elseif r==5 then
                                createMagic(you)
                                createCoin(you)
                            else
                               createCoin(you)
                            end

                            if gameStatus.extraCoins==1 then
                                createCoin(you)
                              end

                            transition.to( you,{time = 10 ,onComplete=
                            function()physics.removeBody(you) end })
                            transition.to( you,{time = 500 ,onComplete=
                            function()display.remove( you ) end })

                            --createAbsorb(you)

                       else--normal enemy
                        if you.isDead==false then
                            you.isDead=true
                          createBuble(you)
                          ----loot---- randomizer
                          local r = math.random(1,10)
                          if r == 1 then
                            createHeart(you)
                          elseif r==2 then
                            createMagic(you)
                          elseif r==3 then
                            createCoin(you)
                            createCoin(you)
                          else
                             createCoin(you)
                          end

                          if gameStatus.extraCoins==1 then

                            local j = math.random(1,2)
                            if j == 1 then
                                createCoin(you)
                            else
                            end

                          end

                          transition.to( you,{time = 100,yScale=.2  ,onComplete=
                         function()display.remove( you ) end })--end of hitting code
                        end
                        end
                    end
                end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="spell") then
            local you = event.other
            if weaponRect.attacked== true or self.attacked==true and you.damaged==false then
             local function removeMe(self)
                if self.kind=="iceBossCole" or self.kind=="iceBoss" or self.kind=="shovel" then
                    local r = math.random(1,5)
                    if r ==1 then
                     createMagic(self)
                    end
                end

                createBuble(self)
                display.remove(self)

              end
              you.isDead=true
              removeMe(you)
              shake()
              createSlash(you)
            end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="spell2") then
            local you = event.other
            if weaponRect.attacked== true or self.attacked==true and you.damaged==false then
             local function removeMe(self)
                if self.kind=="iceBoss" or self.kind=="shovel" then
                    local r = math.random(1,1)
                    if r ==1 then
                     createMagic(self)
                    end
                end

                createBuble(self)
               -- display.remove(self)

              end
              you.isDead=true
              removeMe(you)
              shake()
              createSlash(you)
            end
        end


        if    ( self.myName == "weapon"  and event.other.myName=="treasure") then
            local you = event.other
            if weaponRect.attacked== true and self.attacked==true and you.opened==false then
                you.opened=true
             local function removeMe(self)

               -- if ( appodeal.isLoaded( "interstitial" ) ) then
                --    appodeal.show( "interstitial" )
               -- end

                openChest(self)

                createMagic(self)
                createHeart(self)

                createCoin(self)
                createCoin(self)
                createCoin(self)
                createCoin(self)
                createCoin(self)
                display.remove(self)

              end
              if gameStatus.stage==1 then
              if gameStatus.chestStage1==1 then
                you.isDead=true
                 removeMe(you)
              end
              elseif gameStatus.stage==8 then
                if gameStatus.chestStage8==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==9 then
                if gameStatus.chestStage9==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==10 then
                if gameStatus.chestStage10==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==13 then
                if gameStatus.chestStage13==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==5 then
                if gameStatus.chestStage5==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==18 then
                if gameStatus.chestStage18==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==20 then
                if gameStatus.chestStage20==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==21 then
                if gameStatus.chestStage21==1 then
                you.isDead=true
                 removeMe(you)
                end
            elseif gameStatus.stage==14 then
                if gameStatus.chestStage14==1 then
                you.isDead=true
                 removeMe(you)
              end
            else
                if you.open == true then
                you.isDead=true
                removeMe(you)
                end
            end

              adsMessage(you)
              shake()
              createSlash(you)
            end
        end
-------------------------------npc----------------
        if    ( self.myName == "weapon"  and event.other.myName=="teacher") then
            local you = event.other
            if self.attacked==true and weaponRect.attacked==true and you.talked == false then
                you.talked = true
                if hero.x < you.x then
                    you.xScale=-1
                else
                    you.xScale=1
                end
                paused = true 

                readyToMove = false
                boomStick.x = screenLeft-100
                boomStick.y = centerY
                boomDot.x = screenLeft-100
                boomDot.y = centerY
                moveNow ="stop"
                moveNow2 ="stop"

              teacherMenu(you)
             -- shake()
            end
        end
------------------------------npc end------------------------
        if    ( self.myName == "weapon"  and event.other.myName=="destructable") then
            local you = event.other
            if self.attacked==true and self.attackDown==true then
             local function removeMe(self)

                createBuble(self)
                display.remove(self)

              end
              you.isDead=true
              removeMe(self)
              removeMe(you)
              shake()
              createSlash(you)
              print("destructable")
              self.attacked = false
              self.attackDown = false
            end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="fireFloor") then
            local you = event.other
            if self.attacked==true and self.attackDown==true then
             local function removeMe(self)

                createBuble(self)

               -- display.remove(self)

              end
              you.isDead=true
              removeMe(self)
              you.alpha = 1
              you:setFillColor(0,0,1)
              shake()
              --createSlash(you)

              self.attacked = false
              self.attackDown = false
            end
        end


       --[[ if   (self.myName == "weapon"  and event.other.myName=="heart")  then
            local you = event.other
            display.remove(you)
            gameStatus.hp = gameStatus.hp + you.hp
        end

        if   ( self.myName == "weapon"  and event.other.myName=="magic")  then
            local you = event.other
            display.remove(you)
            gameStatus.mp = gameStatus.mp + you.mp
        end

        if   (self.myName == "weapon"  and event.other.myName=="coin")  then
            local you = event.other
            display.remove(you)
            gameStatus.coin = gameStatus.coin + you.coin
        end--]]

        if    ( self.myName2 == "fire2"  and event.other.myName=="iceWall") then
            local you = event.other
            if self.fireattacked==true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)
                if gameStatus.stage ==29 then
                if gameStatus.iceWallisOn==1 then
                    gameStatus.iceWallisOn =0
                end
                end

                if gameStatus.stage ==2 then
                if gameStatus.iceWall2isOn==1 then
                    gameStatus.iceWall2isOn =0
                end
                 end

                saveScores()
              end

              you.isDead=true
              removeMe(you)
              removeMe(self)
              shake()
              --createSlash(you)
              self.attacked = false
              self.fireattacked = false
            end
        end

        if    ( self.myName2 == "fire"  and event.other.myName=="iceWall") then
            local you = event.other
            if self.fireattacked==true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)
              end
             -- removeMe(you)
              removeMe(self)
              shake()
              --createSlash(you)
              self.attacked = false
              self.fireattacked = false
            end
        end


        if    ( self.myName2 == "fire"  and event.other.myName=="iceBlock") then
            local you = event.other
            if self.fireattacked==true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)

                if gameStatus.stage==5 then
                    gameStatus.iceBlock5 =1 
                elseif gameStatus.stage==8 then
                    gameStatus.iceBlock8 =1 
                elseif gameStatus.stage==9 then
                    gameStatus.iceBlock9 =1 
                elseif gameStatus.stage==10 then
                    gameStatus.iceBlock10 =1 
                elseif gameStatus.stage==15 then
                    gameStatus.iceBlock15 =1 
                end
                saveScores()
              end
              you.isDead=true
              removeMe(you)
              removeMe(self)
              shake()
              --createSlash(you)
              self.attacked = false
              self.fireattacked = false
            end
        end

        if    ( self.myName2 == "fire"  and event.other.myName=="iceBlock2") then
            local you = event.other
            if self.fireattacked==true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)

                if gameStatus.stage==8 then
                    gameStatus.iceBlock8b =1 
                elseif gameStatus.stage==10 then
                    gameStatus.iceBlock10b =1 
                end
                saveScores()
              end
              you.isDead=true
              removeMe(you)
              removeMe(self)
              shake()
              --createSlash(you)
              self.attacked = false
              self.fireattacked = false
            end
        end

        if    ( self.myName == "weapon"  and event.other.objType=="loot") then
            local you = event.other
            if self.iceAttacked== true then
              you.isDead=true
             -- removeMe(you)
             -- shake()
              --createSlash(you)
              self.attacked = false
              self.iceAttacked = false
              transition.to (you, {time = 600,x=hero.x,y=hero.y,transition=easing.inQuint})
            end
        end

        if    ( self.myName2 == "ice2"  and event.other.myName=="lava") then
            local you = event.other
            if self.iceAttacked== true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)
                if gameStatus.stage==28 then
                if gameStatus.lavaWallisOn==1 then
                gameStatus.lavaWallisOn = 0
                saveScores()
                end
                 end

                if gameStatus.stage==4 then
                if gameStatus.lavaWall2isOn==1 then
                    gameStatus.lavaWall2isOn = 0
                    saveScores()
                end
                 end

              end
              you.isDead=true
              removeMe(you)
              shake()
              --createSlash(you)
              self.attacked = false
              self.iceAttacked = false
            end
        end


        if    ( self.myName == "weapon"  and event.other.myName=="burning") then
            local you = event.other
            if self.iceAttacked== true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)
                createBurningIce(you)

                if gameStatus.stage==5 then
                    gameStatus.burnBlock5=1
                    saveScores()
                elseif gameStatus.stage==13 then
                    gameStatus.burnBlock13=1
                    saveScores()
                elseif gameStatus.stage==20 then
                    gameStatus.burnBlock20=1
                    saveScores()
                elseif gameStatus.stage==22 then
                    gameStatus.burnBlock22=1
                    saveScores()
                elseif gameStatus.stage==28 then
                    gameStatus.burnBlock28=1
                    if gameStatus.coleBoss4 ==0 then
                    else
                    saveScores()
                    end
                end

              end
              you.isDead=true
              removeMe(you)
              shake()
              --createSlash(you)
              self.attacked = false
              self.iceAttacked = false
            end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="burning2") then
            local you = event.other
            if self.iceAttacked== true then
             local function removeMe(self)
                createBuble(self)
                display.remove(self)
                createBurningIce(you)

                if gameStatus.stage==5 then
                    gameStatus.burnBlock5b=1
                    saveScores()
                elseif gameStatus.stage==13 then
                    gameStatus.burnBlock13b=1
                    saveScores()
                elseif gameStatus.stage==28 then
                    gameStatus.burnBlock28b=1
                    if gameStatus.coleBoss4 ==0 then
                    else
                    saveScores()
                    end
                end

              end
              you.isDead=true
              removeMe(you)
              shake()
              --createSlash(you)
              self.attacked = false
              self.iceAttacked = false
            end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="stoneBlock") then
            local you = event.other
            if  self.attacked==true and self.attackDown==true then
             local function removeMe(self)



                createBuble(self)
                display.remove(self)
              end
              you.isDead=true
              removeMe(you)
              shake()
              --createSlash(you)
              self.attacked = false

              if you.no==6 then
                gameStatus.stoneBlock6 = 1
            elseif you.no==7 then
                gameStatus.stoneBlock7 = 1
            elseif you.no==14 then
                gameStatus.stoneBlock14 = 1
            elseif you.no==17 then
                gameStatus.stoneBlock17 = 1
            elseif you.no==19 then
                gameStatus.stoneBlock19 = 1
            elseif you.no==20 then
                gameStatus.stoneBlock20 = 1
            elseif you.no==23 then
                gameStatus.stoneBlock23 = 1
            elseif you.no==24 then
                gameStatus.stoneBlock24 = 1
            elseif you.no==9 then
                gameStatus.stoneBlock9 = 1
            elseif you.no==12 then
                gameStatus.stoneBlock12 = 1
            end
            saveScores()
            end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="stoneBlock2") then
            local you = event.other
            if  self.attacked==true and self.attackUp==true then
             local function removeMe(self)


                createBuble(self)
                display.remove(self)
              end
              you.isDead=true
              removeMe(you)
              shake()
              --createSlash(you)
              self.attacked = false

              if you.no==27 then
                gameStatus.stoneBlock27 = 1
            elseif you.no==20 then
                gameStatus.stoneBlock20 = 1
            elseif you.no==23 then
                gameStatus.stoneBlock23 = 1
            end
            saveScores()
            end
        end

        if    ( self.myName == "weapon"  and event.other.myName=="bossControl") then
            local you = event.other
            if  self.attacked==true then
                self.attacked=false
                pause=true
                loading = true
                transition.cancel()
                hero.isDead = true

                gameStatus.finishedGame=3
                 saveScores()

                 transition.to( self,{time = 200,onComplete = gotoStory})
            end
        end



    end
    end

    weaponRect.collision = weaponCollide
    weaponRect:addEventListener( "collision" )

 end



 function createHero()


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
        {name = "hit", start =17,count=2, time =200, loopCount =1},
        {name = "jump", start =1,count=11, time =450, loopCount =1},
        {name = "jump2", start =11,count=8, time =450, loopCount =1},
        {name = "walk", frames={14,15,16}, time = 600, loopCount = 1},
        {name = "run", frames={32,33,34,35,36,37}, time = 500, loopCount = 0},
        {name = "attack", start =53,count=7, time =300, loopCount =1},
        {name = "attack2", start =60,count=10, time =300, loopCount =1},
        {name = "attack3", start =70,count=12, time =500, loopCount =1},
        {name = "dash", start =19,count=13, time =500, loopCount =1},
        {name = "dashUp", start =83,count=10, time =400, loopCount =1},
        {name = "up", start =35,count=2, time =500, loopCount =0},
        {name = "down", start =35,count=2, time =500, loopCount =0},
        {name = "absorb", start =95,count=10, time =1100, loopCount =1},


     
      }
     
    
        -- Display the new sprite at the coordinates passed
    hero = display.newSprite(mainGroup,mySheet, sequenceData)
    hero:setSequence("idle")
    hero:play()

     -- hero.x = 300
     -- hero.y = 150
    
    hero.myName="hero"
    hero.hittable = true
    hero.attackDown=false
    hero.isDead = false
    hero.crit =13
   -- hero.maxHp = gameStatus.maxHp
    --hero.hp=gameStatus.hp

   -- hero.maxMp = gameStatus.maxMp
   -- hero.mp=gameStatus.mp

   -- hero.coin = gameStatus.coins

    flip =flip or false
    posX =posX --or 300
    posY =posY --or 500
    
    --heroMap.isFixedRotation = true
    --bossmode
    --heroMap.x = 1900
    --heroMap.y = gameStatus.posY
   -- local penta = { -9,-13, -9,10, 0,20, 9,10, 9,-13, 0,-21 }

    --local penta = { -9,0, -9,20, 0,30, 9,20, 9,0, 0,-7 }
    local penta = { -9,10, -9,30, 0,40, 9,30, 9,10, 0,3 }
      
    physics.addBody( hero, "dynamic",
        { density=10, bounce=0, friction = 1,shape=penta },  -- Main body element
        {bounce= 0, box={ halfWidth=2, halfHeight=12, x=0, y=38 }, isSensor=true } , -- Foot sensor element
        { radius=120, isSensor=true }
    )
    
    hero.sensorOverlaps = 0
    hero.isFixedRotation = true


     heartLine = display.newImageRect( uiGroup, "images/hphp.png", 40,220 )
    heartLine.anchorY = 1
    heartLine.x = screenLeft+100
    heartLine.y = centerY+5
   -- heartLine.strokeWidth = 3
   -- heartLine:setFillColor( 0,.8,0 )
   -- heartLine:setStrokeColor( 1, 0, 0 )
   heartLineBg = display.newImageRect( uiGroup, "images/hpbar.png", 50,300 )
   heartLineBg.anchorY = 1
   heartLineBg.x = screenLeft+100
   heartLineBg.y = centerY+30


  -- heartLine.strokeWidth = 3
  -- magicLineBg:setFillColor( 0.7,0,0 )

    magicLine = display.newImageRect( uiGroup, "images/mpmp.png", 25,130 )
   magicLine.anchorY = 1
   magicLine.x = screenLeft+150
   magicLine.y = centerY-10
  -- heartLine.strokeWidth = 3
   --magicLine:setFillColor( .4,.4,1 )
   magicLineBg = display.newImageRect( uiGroup, "images/mpbar.png", 30,200 )
   magicLineBg.anchorY = 1
   magicLineBg.x = screenLeft+150
   magicLineBg.y = centerY+30




    --------------------weapon--------------

    createWeapon()
    
     function getHit(self)
        if loading ==false then
        
        local function hittable4()
            self.hittable = true
            self.alpha = 1
        end 
        local function hittable3()
            self.alpha = 0.1
            transition.to( self, { time=150,onComplete = hittable4 } )
        end   
        local function hittable2()
            self.alpha = 1
            transition.to( self, { time=150,onComplete = hittable3 } )
        end   
        local function hittable()
            self.alpha = 0.1
            transition.to( self, { time=150,onComplete = hittable2 } )
        end

        local vx, vy = self:getLinearVelocity()
        self:setLinearVelocity( 0, 0 )
        self:applyLinearImpulse( 0, nil, self.x, self.y )
        self.alpha = 1
        transition.to( self, { time=150,onComplete = hittable } )
    end
    end

    function getHitE(self)
    
        self.alpha = 1

        local vx, vy = self:getLinearVelocity()
        self:setLinearVelocity( 0, 0 )
        self:applyLinearImpulse( 0, nil, self.x, self.y )
    
    end
    
     function sensorCollide( self, event )
     
        -- Confirm that the colliding elements are the foot sensor and a ground object

        if ( event.selfElement == 3 and ( event.other.myName=="coin"or event.other.myName=="magic"or event.other.myName=="heart"))  then
            local you = event.other
            local self = event.target
            -- Foot sensor has entered (overlapped) a ground object
            if ( event.phase == "began" ) then
                if gameStatus.magnetic==1 then
                transition.to( you,{time = 400,x=self.x,y=self.y,transition=easing.inCirc})
              --  audio.play( soundLanded)
                end
            end

        end

        if ( event.selfElement == 2 and event.other.objType == "ground" ) then
     
            -- Foot sensor has entered (overlapped) a ground object
            if ( event.phase == "began" ) then
                self.sensorOverlaps = self.sensorOverlaps + 1
                doubleJump =1
                runningSound=false
                audio.play( soundLanded)
                createDust()
            -- Foot sensor has exited a ground object
            elseif ( event.phase == "ended" ) then
                self.sensorOverlaps = self.sensorOverlaps - 1
            end

        end

        if ( event.selfElement == 2 and event.other.type == "wood" ) then
            if ( event.phase == "began" ) then
                if moveNow2=="down"  then
                    event.other.isSensor = true 
                    moveNow2="stop"
                    print("downJump")
                else
                    event.other.isSensor = false
                    print("downJumpwood")
                end
            elseif ( event.phase == "ended" ) then
                event.other.isSensor = true
            end
        end

        
        -- this is when colliding with enemy
        local self = event.target
        local you = event.other
    
        if ( event.phase == "began" ) then
            
            --if   ( ( self.myName == "hero" and (event.other.myName=="enemy" and event.otherElement==2 )))  then
            if   ( ( self.myName == "hero"and event.selfElement==1 ) and (you.myName=="enemy"and event.otherElement==1 ) )  then
              
                if self.hittable ==false or you.type=="box" or you.type=="vase" or you.type=="treasure" or you.type=="crate" or you.isDead==true then

                else
                    if self.x < you.x then
                 -- if self.xScale==1 then
                        self.hittable = false
                        transition.to(self,{time=150,alpha=0,onComplete= getHit})
                        local vx, vy = self:getLinearVelocity()
                        self:setLinearVelocity( 0, vy )
                        self:applyLinearImpulse( -70, -40, self.x, self.y )
                        flash(self)
                        --transition.to(you,{time=150,alpha=0,onComplete= getHitE})
                        --local vx, vy = you:getLinearVelocity()
                        --you:setLinearVelocity( 0, vy )
                        --you:applyLinearImpulse( 70, nil, you.x, you.y )

                       -- print("did hit")
                    else
                        self.hittable = false
                        transition.to(self,{time=150,alpha=0,onComplete= getHit})
                        local vx, vy = self:getLinearVelocity()
                        self:setLinearVelocity( 0, vy )
                        self:applyLinearImpulse( 70, -40, self.x, self.y )
                        flash(self)
                       -- transition.to(you,{time=150,alpha=0,onComplete= getHitE})
                       -- local vx, vy = you:getLinearVelocity()
                       -- you:setLinearVelocity( 0, vy )
                        --you:applyLinearImpulse( -70, nil, you.x, you.y )
                       -- print("did hit")
                    end
                
                    if 	self.attackDown == true then

                    else


                            if you.type=="harpy"then
                                you.str= math.random(3,5)
                             elseif you.type=="ice" then
                                you.str= math.random(5,6)
                             elseif you.type=="lava"  then   
                                you.str= math.random(4,5)
                             elseif you.type=="shovel"  then
                                you.str= math.random(5,6)
                             elseif you.type=="coleNormal"  then
                                you.str= math.random(5,7)
                             elseif you.type=="coleHarpy"  then
                                you.str= math.random(6,7)
                             elseif you.type=="coleIce"  then
                                you.str= math.random(6,7)
                             elseif you.type=="coleFire"  then
                                you.str= math.random(6,7)
                             elseif you.type=="coleAllForm"  then
                                you.str= math.random(5,8)
                             end

                    gameStatus.hp = gameStatus.hp - you.str
                    audio.play( soundHitted)

                    local title =display.newText(uiGroup," "..you.str, self.x,self.y , "Rooters.ttf", 30)
                    --title:setFillColor( , 0.2, 0.2 )
                    title.yScale=.2
                    transition.to( title,{time = 300,x=self.x+10,y=self.y-60,yScale =1,transition=easing.outCirc  ,onComplete=
                    function()display.remove( title ) end })--end of hitting code

                    end



                    if gameStatus.hp <=0 then
                        transition.cancel()
                        audio.play( soundDeath)
                       -- timer.cancel()
                        loading =true
                        createBubleBoss(self)
                        hero.isDead=true
                        weapon.alpha = 0
                        hero.alpha = 0
                        heartLine.yScale = .01
                        transition.to (gameOverText, {time = 500,y = centerY-80})
                        transition.to (playButton, {time = 1200,y = centerY+80})
                        button5.y = screenTop-100

                    end
                    

                end

            end

            

            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="rightExit")  then
                print("exit time")
                loading = true
                posX = 250
                posY = self.y
                stageCheckr()
                gotoNext()
            elseif   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="leftExit")  then
                print("exit time")
                loading = true
                posX = 980
                posY = self.y
                stageCheckl()
                gotoNext()
            elseif   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="upExit")  then
                print("exit time")
                loading = true
                posX = self.x-50
                posY = 520
                stageChecku()
                gotoNext()
            elseif   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="downExit")  then
                print("exit time")
                loading = true
                posX = self.x
                posY = 50
                stageCheckd()
                gotoNext()
            end
            --------ability gain------------
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="doubleJump")  then
                display.remove(you)


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
                abilityGainDJ(self)
                audio.play( soundAbility)
                audio.play( soundStone)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="fireBall")  then
                display.remove(you)


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
                abilityGainFB(self)
                audio.play( soundAbility)
                audio.play( soundStone)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="iceBlast")  then
                display.remove(you)

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
                abilityGainIB(self)
                audio.play( soundAbility)
                audio.play( soundStone)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="dashDown")  then
                display.remove(you)

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
                abilityGainDD(self)
                audio.play( soundAbility)
                audio.play( soundStone)
            end

            --------- minor ability ----------
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="dashUp")  then
                display.remove(you)

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
                abilityGainDU(self)
                audio.play( soundAbility)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="superFire")  then
                display.remove(you)

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
                abilityGainSF(self)
                audio.play( soundAbility)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="superIce")  then
                display.remove(you)

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
                abilityGainSI(self)
                audio.play( soundAbility)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="speedBoost")  then
                display.remove(you)

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
                abilityGainSB(self)
                audio.play( soundAbility)
            end
            ------bonus ability
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="magnetic")  then
                display.remove(you)

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
                abilityGainMAG(self)
                audio.play( soundAbility)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="sonicWave")  then
                display.remove(you)

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
                abilityGainSW(self)
                audio.play( soundAbility)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="rechargeMp")  then
                display.remove(you)

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
                abilityGainRM(self)
                audio.play( soundAbility)
            end
            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="extraCoins")  then
                display.remove(you)

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
                abilityGainEC(self)
                audio.play( soundAbility)
            end
            -------------------end of abilities ---------------

            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="heart")  then
                display.remove(you)
                if gameStatus.haveHeart==1 then
                    gameStatus.hp = gameStatus.hp + 20
                    audio.play( soundHeal)
                    createHealRing()
                else
                button6.alpha = 1
                gameStatus.haveHeart=1
                audio.play( soundMana)
                end
            end

            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="magic")  then
                display.remove(you)
                gameStatus.mp = gameStatus.mp + you.mp
                audio.play( soundMana)
            end

            if   (( self.myName == "hero" and event.selfElement==1 ) and event.other.myName=="coin")  then
                display.remove(you)
                gameStatus.coin = gameStatus.coin + you.coin
                audio.play( soundGotCoin)
            end

            if   ( ( self.myName == "hero"and event.selfElement==1 ) and event.other.myName=="bullet" )  then
                print("bullet")

                if self.hittable ==true then
                    if self.x < you.x then
                   -- if you.xScale==-1 then
                          self.hittable = false
                          transition.to(self,{time=150,alpha=0,onComplete= getHit})
                          local vx, vy = self:getLinearVelocity()
                          self:setLinearVelocity( 0, vy )
                          self:applyLinearImpulse( -70, -30, self.x, self.y )
                          flash(self)
                      else
                          self.hittable = false
                          transition.to(self,{time=150,alpha=0,onComplete= getHit})
                          local vx, vy = self:getLinearVelocity()
                          self:setLinearVelocity( 0, vy )
                          self:applyLinearImpulse( 70, -30, self.x, self.y )
                          flash(self)
                      end

                      local function removeMe(self)
                        createBuble(self)
                        display.remove(self)

                      end
                  
                      you.isDead=true
                      removeMe(you)
  
                      gameStatus.hp = gameStatus.hp - you.str
                      audio.play( soundHitted)
  
                      local title =display.newText(uiGroup," "..you.str, self.x,self.y , "Rooters.ttf", 30)
                      --title:setFillColor( , 0.2, 0.2 )
                      title.yScale=.2
                      transition.to( title,{time = 300,x=self.x+10,y=self.y-60,yScale =1,transition=easing.outCirc  ,onComplete=
                      function()display.remove( title ) end })--end of hitting coded   
                      
                      if gameStatus.hp <=0 then
                        transition.cancel()
                        audio.play( soundDeath)
                       -- timer.cancel()
                        loading =true
                        createBubleBoss(self)
                        hero.isDead=true
                        weapon.alpha = 0
                        hero.alpha = 0
                        heartLine.yScale = .01
                        transition.to (gameOverText, {time = 500,y = centerY-80})
                        transition.to (playButton, {time = 1200,y = centerY+80})
                        button5.y = screenTop-100

                    end
  
                  end
            end

            if   ( ( self.myName == "hero"and event.selfElement==1 ) and event.other.myName=="spell" )  then
                print("bullet")

                if self.hittable ==true then
                      if self.x < you.x then
                   -- if self.xScale==-1 then
                          self.hittable = false
                          transition.to(self,{time=150,alpha=0,onComplete= getHit})
                          local vx, vy = self:getLinearVelocity()
                          self:setLinearVelocity( 0, vy )
                          self:applyLinearImpulse( -70, -30, self.x, self.y )
                          flash(self)
                      else
                          self.hittable = false
                          transition.to(self,{time=150,alpha=0,onComplete= getHit})
                          local vx, vy = self:getLinearVelocity()
                          self:setLinearVelocity( 0, vy )
                          self:applyLinearImpulse( 70, -30, self.x, self.y )
                          flash(self)

  
                      end
                  
  
                      gameStatus.hp = gameStatus.hp - you.str
                      audio.play( soundHitted)

                      local function removeMe(self)
                        createBuble(self)
                        if you.kind == "explo" then
                        else
                        display.remove(self)
                        end

                      end
                      you.isDead=true
                      removeMe(you)
  
                      local title =display.newText(uiGroup," "..you.str, self.x,self.y , "Rooters.ttf", 30)
                      --title:setFillColor( , 0.2, 0.2 )
                      title.yScale=.2
                      transition.to( title,{time = 300,x=self.x+10,y=self.y-60,yScale =1,transition=easing.outCirc  ,onComplete=
                      function()display.remove( title ) end })--end of hitting coded 
                      
                      if gameStatus.hp <=0 then
                        transition.cancel()
                        audio.play( soundDeath)
                       -- timer.cancel()
                        loading =true
                        createBubleBoss(self)
                        hero.isDead=true
                        weapon.alpha = 0
                        hero.alpha = 0
                        heartLine.yScale = .01
                        transition.to (gameOverText, {time = 500,y = centerY-80})
                        transition.to (playButton, {time = 1200,y = centerY+80})
                        button5.y = screenTop-100

                    end
  
                  end
            end

            if   ( ( self.myName == "hero"and event.selfElement==1 ) and event.other.myName=="burning" )  then

  
                      gameStatus.hp = 0
                      transition.cancel()
                     -- local vx, vy = self:getLinearVelocity()
                     -- self:setLinearVelocity( 0, vy )
                     -- self:applyLinearImpulse( 0, -200, self.x, self.y )
  
                      local title =display.newText(uiGroup,"Burned ", self.x,self.y , "Rooters.ttf", 30)
                      title:setFillColor( 1, 0.2, 0.2 )
                      title.yScale=.2
                      transition.to( title,{time = 300,x=self.x+10,y=self.y-60,yScale =1,transition=easing.outCirc  ,onComplete=
                      function()display.remove( title ) end })--end of hitting coded 
                      
                      if gameStatus.hp <=0 then
                        audio.play( soundDeath)
                       -- timer.cancel()
                        loading =true
                        createBubleBoss(self)
                        hero.isDead=true
                        weapon.alpha = 0
                        hero.alpha = 0
                        heartLine.yScale = .01
                        transition.to (gameOverText, {time = 500,y = centerY-80})
                        transition.to (playButton, {time = 1200,y = centerY+80})
                        button5.y = screenTop-100
                        flash(self)
                    end
  
            end

            if   ( ( self.myName == "hero"and event.selfElement==1 ) and event.other.myName=="instaKill" )  then

  
                gameStatus.hp = 0
                transition.cancel()
               -- local vx, vy = self:getLinearVelocity()
               -- self:setLinearVelocity( 0, vy )
               -- self:applyLinearImpulse( 0, -200, self.x, self.y )
                
                if gameStatus.hp <=0 then
                  audio.play( soundDeath)
                 -- timer.cancel()
                  loading =true
                  createBubleBoss(self)
                  hero.isDead=true
                  weapon.alpha = 0
                  hero.alpha = 0
                  heartLine.yScale = .01
                  transition.to (gameOverText, {time = 500,y = centerY-80})
                  transition.to (playButton, {time = 1200,y = centerY+80})
                  button5.y = screenTop-100
                  flash(self)
              end

      end

        if   ( ( self.myName == "hero"and event.selfElement==1 ) and (you.myName=="enemy"and event.otherElement==2 ) ) then
            if you.isDead == false and loading ==false then

            if you.type =="flyer" then
                if you.x < self.x then
                    you.xScale=-1
                else
                    you.xScale=1
                end
                you.isAttacking = true
                transition.cancel(you)
                you:setSequence("attack")
                you:play()

               flyerSeek(you)
            elseif you.type =="bomb" then
                transition.to( you, { time=600,onComplete=bombExplode } )
            end

            end
        end
    
    
        elseif ( event.phase == "ended" ) then
    
        end
    
    end
    -- Associate collision handler function with character
    hero.collision = sensorCollide
    hero:addEventListener( "collision" )


    
    end

    ------------------enemy collision detections ----------------
 --[[function enemyCollide(self,event)

    local self = event.target
    local you = event.other

    if ( event.phase == "began" ) then

        if   ( ( self.myName == "enemy"and event.selfElement==2 ) and (you.myName=="hero"and event.otherElement==1 ) )  then
            if self.isDead == false and loading ==false then

            if self.type =="flyer" then
                if self.x < you.x then
                    self.xScale=-1
                else
                    self.xScale=1
                end
                self.isAttacking = true
                transition.cancel(self)
                self:setSequence("attack")
                self:play()

               flyerSeek(self)
            elseif self.type =="bomb" then
                transition.to( self, { time=600,onComplete=bombExplode } )
            end

            end
        end
    end
end--]]


--------------enemy ai---------------attacking mode

--distance checker

function distanceCheck(self)
if self.isDead == false and loading == false then
    local mSqrt = math.sqrt
    local function distanceBetween( pos1, pos2 )
            local factor = { x = pos2.x - pos1.x, y = pos2.y - pos1.y }
            return mSqrt( ( factor.x * factor.x ) + ( factor.y * factor.y ) )
    end
    local totDist = distanceBetween(self,hero)
     travTime = totDist / (self.spd*.00015)--.05
end
end


function attackPatrol(self)
    self.startingPointX = self.x

    function goAgainEnemy(self)
        local move1
        local d = math.random(40,80)

        local function dash2()
            if self.isDead==false and loading == false then
            self.isAttacking = true
            self:setSequence("attack")
            self:play()
            audio.play( soundDash)
            transition.to( self, { time=500,x=self.startingPointX ,onComplete=move1 } )
            end
        end

    local function move2()
        if self.isDead == false and loading == false then
            self:setSequence("walk")
            self:play()
        self.xScale=1
        if self.kind=="skeleton" then
            audio.play( soundDrag)
         elseif self.kind=="blue" then
            audio.play( soundDrag)
         elseif self.kind=="fly" then
            audio.play( soundBuzzing)
         elseif self.kind=="ghost" then
            audio.play( soundGhost)
         elseif self.kind=="red" then
            audio.play( soundLava)
         else
         end
             transition.to( self, { time=self.spd,x=self.startingPointX+d,onComplete = dash2 } )
        end         
    end

    local function dash()
        if self.isDead==false and loading == false then
        self.isAttacking = true
        self:setSequence("attack")
        self:play()
        audio.play( soundDash)
        transition.to( self, { time=500,x=self.startingPointX +d+d,onComplete=move2 } )
        end
    end

     function move1(self)
       -- print("startingpoint"..startingPointX)
        if self.isDead==false and loading == false then
        self.xScale=-1
        self:setSequence("walk")
        self:play()
        if self.kind=="skeleton" then
            audio.play( soundDrag)
         elseif self.kind=="blue" then
            audio.play( soundDrag)
         elseif self.kind=="fly" then
            audio.play( soundBuzzing)
         elseif self.kind=="ghost" then
            audio.play( soundGhost)
         elseif self.kind=="red" then
            audio.play( soundLava)
         else
         end
             transition.to( self, { time=self.spd,x=self.startingPointX +d,onComplete = dash } )
        end
    end
    
    move1(self)
    end
    goAgainEnemy(self)
end



function shooter(self)
    if self.isDead == false and loading == false then
    self.isAttacking = true
    self:setSequence("attack")
    self:play()
    transition.to( self, { time=500,onComplete=shootNow } )
    end
end

function shootNow(self)
    if self.isDead == false and loading == false then
    
    local function removeBody(self)

       -- transition.to( self,{time = 500,onComplete=putBody})
       if self.isDead == false and loading == false then
        physics.removeBody( self )
       -- putBody(self)

       local triangle = { 0,-22, -15,22, 15,22}
                  
       physics.addBody( self, "dynamic",
           { density=10, bounce=0, friction = 1,shape=triangle } ,
       { density=10, bounce=0, friction = 100,box={ halfWidth=300, halfHeight=20, x=0, y=0 },isSensor=true } )
       self.isFixedRotation = true
       end
        
    end
    local shoot

    if self.kind=="hood" then
        local spriteOptions = {
            height = 32,
            width = 32,
            numFrames = 4,
            sheetContentWidth = 64,
            sheetContentHeight = 64
          }
          local mySheet = graphics.newImageSheet("images/black.png", spriteOptions)
          local sequenceData = {
            {name = "vomit", start =1,count=4, time =400, loopCount =0}
    
          }        
            -- Display the new sprite at the coordinates passed
         shoot = display.newSprite(uiGroup,mySheet, sequenceData)
        shoot:setSequence("vomit")
        shoot:play()
        audio.play( soundHood)
        

        shoot.myName="bullet"
        shoot.str =2
        shoot.damaged=false
        
        physics.addBody( shoot, "dynamic",
        {bounce= 0, radius=10, isSensor = true})
        
        shoot.isBullet = true
        shoot.gravityScale =0

    else
         shoot = display.newImageRect( uiGroup, "images/bullet.png", 16,16 )

        shoot.myName="bullet"
        shoot.str =2
        audio.play( soundBullet)
        
        physics.addBody( shoot, "dynamic",
        {bounce= 0, radius=10, isSensor = true})
        
        shoot.isBullet = true
        shoot.gravityScale =0
    end

        local function a4()
          transition.to( self, { time=500,onComplete=shooter } )
        end
        local function a3()
            transition.to( self, { time=500,onComplete=a4 } )
          end
          local function a2()
            transition.to( self, { time=500,onComplete=a3 } )
          end
          local function a1()
            if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()
            transition.to( self, { time=500,onComplete=a2 } )
            end
          end
          a1()

        if self.x < hero.x then
            self.xScale=-1
            shoot.x = self.x+25
            shoot.y = self.y
            transition.to( shoot,{time = 1000,x=shoot.x +1000,onComplete=
            function()display.remove( shoot ) end })--end of hitting code
        else
            self.xScale=1
            shoot.x = self.x-25
            shoot.y = self.y
            transition.to( shoot,{time = 1000,x=shoot.x -1000,onComplete=
            function()display.remove( shoot ) end })--end of hitting code
        end

    end
end
--------------------------------------cast now----------------------
function castNow(self)
    if self.isDead == false and loading == false then

        local shoot
    
    local function removeBody(self)
       if self.isDead == false and loading == false then
        physics.removeBody( self )
       end      
    end

    if self.kind=="jelly" then
        self:setSequence("attack")
        self:play()

        local spriteOptions = {
            height = 32,
            width = 32,
            numFrames = 3,
            sheetContentWidth = 64,
            sheetContentHeight = 64
          }
          local mySheet = graphics.newImageSheet("images/jellBomb.png", spriteOptions)
          local sequenceData = {
            {name = "vomit", start =1,count=3, time =300, loopCount =0}
    
          }        
            -- Display the new sprite at the coordinates passed
         shoot = display.newSprite(uiGroup,mySheet, sequenceData)
        shoot:setSequence("vomit")
        shoot:play()

        shoot.str =2
        shoot.spd=1300

        shoot.x = self.x
        shoot.y = self.y-10
     elseif self.kind=="dr" then
            self:setSequence("attack")
            self:play()
    
            local spriteOptions = {
                height = 30,
                width = 30,
                numFrames = 3,
                sheetContentWidth = 60,
                sheetContentHeight = 60
              }
              local mySheet = graphics.newImageSheet("images/hotFire.png", spriteOptions)
              local sequenceData = {
                {name = "vomit", start =1,count=3, time =300, loopCount =0}
        
              }        
                -- Display the new sprite at the coordinates passed
             shoot = display.newSprite(uiGroup,mySheet, sequenceData)
            shoot:setSequence("vomit")
            shoot:play()
    
            shoot.str =2
            shoot.spd=1500
    
            shoot.x = self.x
            shoot.y = self.y-10

    elseif self.kind=="shovel" then

           local spriteOptions = {
            height = 32,
            width = 32,
            numFrames = 3,
            sheetContentWidth = 64,
            sheetContentHeight = 64
          }
          local mySheet = graphics.newImageSheet("images/demon.png", spriteOptions)
          local sequenceData = {
            {name = "vomit", start =2,count=2, time =300, loopCount =0}
    
          }        
            -- Display the new sprite at the coordinates passed
         shoot = display.newSprite(uiGroup,mySheet, sequenceData)
        shoot:setSequence("vomit")
        shoot:play()
        audio.play( soundDemon)

        shoot.str =3
        shoot.spd=1100
        shoot.kind=("shovel")

        shoot.x = self.x
        shoot.y = self.y
    elseif self.kind=="blue" then

        local spriteOptions = {
         height = 32,
         width = 32,
         numFrames = 3,
         sheetContentWidth = 64,
         sheetContentHeight = 64
       }
       local mySheet = graphics.newImageSheet("images/iceCold.png", spriteOptions)
       local sequenceData = {
         {name = "vomit", start =1,count=3, time =300, loopCount =0}
 
       }        
         -- Display the new sprite at the coordinates passed
      shoot = display.newSprite(uiGroup,mySheet, sequenceData)
     shoot:setSequence("vomit")
     shoot:play()
     audio.play( soundFreeze)

     shoot.str =3
     shoot.spd=1200
     shoot.kind=("ice")

     shoot.x = self.x
     shoot.y = self.y
   
    elseif self.kind=="iceBoss" then
        self:setSequence("attack")
        self:play()

        local spriteOptions = {
            height = 33,
            width = 33,
            numFrames = 5,
            sheetContentWidth = 66,
            sheetContentHeight = 99
          }
          local mySheet = graphics.newImageSheet("images/snowFlakes.png", spriteOptions)
          local sequenceData = {
            {name = "vomit", start =1,count=5, time =500, loopCount =0}
    
          }        
            -- Display the new sprite at the coordinates passed
         shoot = display.newSprite(uiGroup,mySheet, sequenceData)
        shoot:setSequence("vomit")
        shoot:play()
        audio.play( soundFreeze)

           shoot.str =2
           shoot.spd=2000
           shoot.kind=("iceBoss")
   
           shoot.x = self.x-20
           shoot.y = self.y+20

           shoot.xScale=.01
           shoot.yScale=.01
     elseif self.kind=="iceBossCole" then
        self:setSequence("iceAttack")
        self:play()

        local spriteOptions = {
            height = 33,
            width = 33,
            numFrames = 5,
            sheetContentWidth = 66,
            sheetContentHeight = 99
          }
          local mySheet = graphics.newImageSheet("images/snowFlakes.png", spriteOptions)
          local sequenceData = {
            {name = "vomit", start =1,count=5, time =500, loopCount =0}
    
          }        
            -- Display the new sprite at the coordinates passed
         shoot = display.newSprite(uiGroup,mySheet, sequenceData)
        shoot:setSequence("vomit")
        shoot:play()
        audio.play( soundFreeze)

           shoot.str =5
           shoot.spd=1000
           shoot.kind=("iceBossCole")
   
           shoot.x = self.x-20
           shoot.y = self.y+20

           shoot.xScale=.01
           shoot.yScale=.01
   
       else
        self:setSequence("attack")
        self:play()

        shoot = display.newImageRect( uiGroup, "images/jell.png", 32,32 )
        shoot.str =2
        shoot.spd=1500

        shoot.x = self.x
        shoot.y = self.y-10

    end

    shoot.myName="spell"
    shoot.isDead=false
    shoot.castSpd =self.castSpd
    shoot.damaged=false

    physics.addBody( shoot, "dynamic",
    {bounce= 0, radius=16, isSensor = true})

    shoot.gravityScale =0


        local move1
        local function move2(self2)
            if self.isDead == true then
                createBuble(self2)
                display.remove(self2)
           else
            if self2.isDead == false and loading == false then
                transition.cancel(self2)
                if self2.x < hero.x then
                    self2.xScale=-1
                else
                    self2.xScale=1
                end

                local mSqrt = math.sqrt
                local function distanceBetween( pos1, pos2 )
                        local factor = { x = pos2.x - pos1.x, y = pos2.y - pos1.y }
                        return mSqrt( ( factor.x * factor.x ) + ( factor.y * factor.y ) )
                end
                local totDist = distanceBetween(self2,hero)
                local travTime = totDist / self2.castSpd--(shoot.spd*.00007)--.05

               -- distanceCheck(shoot)
                 transition.to( self2,  { time=travTime,x=hero.x+10,y=hero.y+90,onComplete = move1 } )
                 transition.to( self2, { time=travTime/2,onComplete = move1 } )
                 if self.kind=="iceBoss" or self.kind=="iceBossCole" then
                    transition.to( self2,  { time=travTime,rotation=2000 } )
                 end

                 if self.kind=="iceBossCole" then
                    if self.talking ==true then
                        display.remove(self2)
                    end
                 end
            end    
        end     
        end
    
         function move1(self2)
           -- print("startingpoint"..startingPointX)
           if self.isDead == true then
                 createBuble(self2)
                display.remove(self2)
           else
            if self2.isDead == false and loading == false then
                transition.cancel(self2)
                if self2.x < hero.x then
                    self2.xScale=-1
                else
                    self2.xScale=1
                end

                local mSqrt = math.sqrt
                local function distanceBetween( pos1, pos2 )
                        local factor = { x = pos2.x - pos1.x, y = pos2.y - pos1.y }
                        return mSqrt( ( factor.x * factor.x ) + ( factor.y * factor.y ) )
                end
                local totDist = distanceBetween(self2,hero)
                local travTime = totDist / self2.castSpd--(shoot.spd*.00007)--.05

                 transition.to( self2, { time=travTime,x=hero.x-10,y=hero.y,onComplete = move2 } )
                 transition.to( self2, { time=travTime/2,onComplete = move2 } )
                 if self.kind=="iceBoss" or self.kind=="iceBossCole" then
                    transition.to( self2,  { time=travTime,rotation=2000 } )
                 end

                 if self.kind=="iceBossCole" then
                    if self.talking ==true then
                        display.remove(self2)
                    end
                 end
            end
        end
        end      

       if self.kind=="dr" then
        if self.xScale==-1 then
            transition.to( shoot,  { time=500,x=self.x+80,transition=easing.inQuad  ,onComplete = move1 } )
        else
            transition.to( shoot,  { time=500,x=self.x-80,transition=easing.inQuad  ,onComplete = move1 } )
        end

       elseif self.kind=="shovel" then
            transition.to( shoot,  { time=400,y=self.y+150,transition=easing.inQuad  ,onComplete = move1 } )
        elseif self.kind=="iceBoss" then
            transition.to( shoot,  { time=600,y=self.y-40,xScale=1,yScale=1,transition=easing.inQuad  ,onComplete = move1 } )
            transition.to( shoot,  { time=600,rotation=3000 } )
        elseif self.kind=="iceBossCole" then
            transition.to( shoot,  { time=700,y=self.y-40,xScale=1.1,yScale=1.1,transition=easing.inQuad  ,onComplete = move1 } )
            transition.to( shoot,  { time=700,rotation=3000 } )
       else
            transition.to( shoot,  { time=800,y=self.y-200,transition=easing.outCirc,onComplete = move1 } )
       end

    end
end

function flyerSeek(self)
    local move1
    local d = math.random(100,120)

    local function move3()
        if self.isDead == false and loading == false then
            transition.cancel(self)
            self:setSequence("walk")
            self:play()
            if self.x < hero.x then
                self.xScale=-1
                transition.to( self,  { time=self.spd/4,x=self.x-50,y=self.y-10,onComplete = move1 } )
            else
                self.xScale=1
                transition.to( self,  { time=self.spd/4,x=self.x+50,y=self.y-10,onComplete = move1 } )
            end
            
        end         
    end

    

    local function move2()
        if self.isDead == false and loading == false then
            if self.x < hero.x then
                self.xScale=-1
            else
                self.xScale=1
            end
            transition.cancel(self)
            self:setSequence("walk")
            self:play()
            if self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
            distanceCheck(self)
             transition.to( self,  { time=travTime,x=hero.x,y=hero.y,onComplete = move3 } )
             transition.to( self, { time=self.spd/2,onComplete = move1 } )
        end         
    end

     function move1(self)
       -- print("startingpoint"..startingPointX)
        if self.isDead==false and loading == false then
            if self.x < hero.x then
                self.xScale=-1
            else
                self.xScale=1
            end
            transition.cancel(self)
            self:setSequence("walk")
            self:play()
            if self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
            distanceCheck(self)
             transition.to( self, { time=travTime,x=hero.x,y=hero.y,onComplete = move3 } )
             transition.to( self, { time=self.spd/2,onComplete = move2 } )
        end
    end
    
    move1(self)

end

function enemyCheckFlip(self)


    if self.isDead == false and loading == false then
        if self.x < self.startingPointX then
            self.xScale=-1
        else
            self.xScale=1
        end

        self:setSequence("walk")
        self:play()

        transition.to( self, { time=600,x=self.startingPointX,onComplete=goAgainEnemy } )
    end
end


    -----------------enemies  ai---------------------

    ------------walking --------------
    function walk(self)
        self.startingPointX = self.x
            local move1
            local d = math.random(60,90)

        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
            if self.kind=="spiky" then
                audio.play( soundCrawl)
             elseif self.kind=="skeleton" then
                audio.play( soundWalking)
             else
             end
                 transition.to( self, { time=self.spd+d,x=self.startingPointX,onComplete = move1 } )
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
            if self.kind=="spiky" then
                audio.play( soundCrawl)
             elseif self.kind=="skeleton" then
                audio.play( soundWalking)
             else
             end
                 transition.to( self, { time=self.spd+d,x=self.startingPointX +d,onComplete = move2 } )
            end
        end
        
        move1(self)
    end

    function longWalk(self)
        self.startingPointX = self.x
            local move1
            local d = math.random(150,200)

        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
                 transition.to( self, { time=self.spd+d,x=self.startingPointX,onComplete = move1 } )
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
                 transition.to( self, { time=self.spd+d,x=self.startingPointX +d,onComplete = move2 } )
            end
        end
        
        move1(self)
    end

    function pooper(self)
        self.startingPointX = self.x
            local move1
            local d = math.random(300,400)

        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
                 transition.to( self, { time=2000,x=self.startingPointX,onComplete = move1 } )
                 poop(self)
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
                 transition.to( self, { time=2000,x=self.startingPointX +d,onComplete = move2 } )
            end
        end
        
        move1(self)
    end

    function poop(self)
        if self.isDead == false and loading == false then

            function createRedPoop2()
            if self.isDead == false and loading == false then
                local spriteOptions = {
                    height = 120,
                    width = 120,
                    numFrames = 7,
                    sheetContentWidth = 360,
                    sheetContentHeight = 360
                  }
                  local mySheet = graphics.newImageSheet("images/redPoop.png", spriteOptions)
                  local sequenceData = {
                    {name = "idle", start =1,count=3, time =300, loopCount =0},
                    {name = "walk", start =1,count=3, time =300, loopCount =0},
                    {name = "attack", start =3,count=4, time =400, loopCount =1},            
                  }
                          
                    -- Display the new sprite at the coordinates passed
                enemy = display.newSprite(mainGroup,mySheet, sequenceData)
                enemy:setSequence("walk")
                enemy:play()               
               
                enemy.myName="enemy"
                enemy.hittable = true
                enemy.maxHp = 10
                enemy.hp = enemy.maxHp
                enemy.str =3
                enemy.spd= math.random(700,1000)
                enemy.hitted = false
                enemy.isDead=false
                enemy.isAttacking=false
                enemy.damaged =false
                enemy.startingPointX=100
                enemy.type="bomb"
                enemy.coin =enemy.maxHp

                local triangle = { 0,40, -12,60, 15,60}
                          
                physics.addBody( enemy, "dynamic",
                    { density=2, bounce=0, friction = 1,shape=triangle },
                    { density=0, bounce=0, friction = 100,box={ halfWidth=75, halfHeight=50, x=0, y=20 },isSensor=true }  -- Main body element
              
                ) 

                enemy.x =self.x
                enemy.y =self.y-5

                if self.xScale == 1 then
                    enemy:applyLinearImpulse( - math.random(7,11), -math.random(7,11), enemy.x, enemy.y )
                else
                    enemy:applyLinearImpulse( math.random(7,11), -math.random(7,11), enemy.x, enemy.y )
                end
        
                               
                enemy.isFixedRotation = true
        
               -- enemyCollision=true
               -- enemy.collision = enemyCollide
               -- enemy:addEventListener( "collision" )
            end
             end

            self:setSequence("attack")
            self:play()
            transition.to( self, { time=200,onComplete = createRedPoop2 } )

            local function reidle(self)
                if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
                end
            end
            transition.to( self, { time=700,onComplete = reidle } )

        end
    end

    -------basic patrolling---------

     function patrol(self)
        self.startingPointX = self.x
        print("one time call")

        function goAgainEnemy(self)
            local move1
            local r = math.random(1500,2000)
            local d = math.random(60,110)


        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
            if self.kind=="skeleton" then
                audio.play( soundWalking)
             elseif self.kind=="blue" then
                audio.play( soundDrag)
             elseif self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
                 transition.to( self, { time=self.spd,x=self.startingPointX,onComplete = move1 } )
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
            if self.kind=="skeleton" then
                audio.play( soundWalking)
             elseif self.kind=="blue" then
                audio.play( soundDrag)
             elseif self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
                 transition.to( self, { time=self.spd,x=self.startingPointX +d,onComplete = move2 } )
            end
        end
        
        move1(self)
        end
        goAgainEnemy(self)
    end

    --[[function creator(self)
        self.startingPointX = self.x
        print("one time call")

        function goAgainEnemy(self)
            local move1
            local d = math.random(60,110)

            local function dash2()
                if self.isDead==false and loading == false then
                self.isAttacking = true
                self:setSequence("attack")
                self:play()
                audio.play( soundDash)
                transition.to( self, { time=500,x=self.startingPointX ,onComplete=move1 } )
                end
            end


        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
            if self.kind=="skeleton" then
                audio.play( soundWalking)
             elseif self.kind=="blue" then
                audio.play( soundDrag)
             end
                 transition.to( self, { time=self.spd*1.3,x=self.startingPointX,onComplete = dash2 } )
                 castNow(self)
            end         
        end

        local function dash()
            if self.isDead==false and loading == false then
            self.isAttacking = true
            self:setSequence("attack")
            self:play()
            audio.play( soundDash)
            transition.to( self, { time=500,x=self.startingPointX +d+d,onComplete=move2 } )
            end
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
            if self.kind=="skeleton" then
                audio.play( soundWalking)
             elseif self.kind=="blue" then
                audio.play( soundDrag)
             end
                 transition.to( self, { time=self.spd*1.3,x=self.startingPointX +d,onComplete = dash } )
                 castNow(self)
            end
        end
        
        move1(self)
        end
        goAgainEnemy(self)
    end--]]

    function creator(self)
        self.startingPointX = self.x
    
        function goAgainEnemy(self)
            local move1
            local d = math.random(40,80)
    
            local function dash2()
                if self.isDead==false and loading == false then
                self.isAttacking = true
                self:setSequence("attack")
                self:play()
                audio.play( soundDash)
                transition.to( self, { time=500,x=self.startingPointX ,onComplete=move1 } )
                end
            end
    
        local function move2()
            if self.isDead == false and loading == false then
                self:setSequence("walk")
                self:play()
            self.xScale=1
            if self.kind=="skeleton" then
                audio.play( soundWalking)
             elseif self.kind=="blue" then
                audio.play( soundDrag)
             elseif self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
                 transition.to( self, { time=self.spd,x=self.startingPointX+d,onComplete = dash2 } )
                 castNow(self)
            end         
        end
    
        local function dash()
            if self.isDead==false and loading == false then
            self.isAttacking = true
            self:setSequence("attack")
            self:play()
            audio.play( soundDash)
            transition.to( self, { time=500,x=self.startingPointX +d+d,onComplete=move2 } )
            end
        end
    
         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
            self:setSequence("walk")
            self:play()
            if self.kind=="skeleton" then
                audio.play( soundWalking)
             elseif self.kind=="blue" then
                audio.play( soundDrag)
             elseif self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
                 transition.to( self, { time=self.spd,x=self.startingPointX +d,onComplete = dash } )
                 castNow(self)
            end
        end
        
        move1(self)
        end
        goAgainEnemy(self)
    end

    function throwPatrol(self)
        self.startingPointX = self.x

        function goAgainEnemy(self)
            local move1
            local r = math.random(1500,2000)
            local d = math.random(250,300)


        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
            if self.kind=="octo" then
                audio.play( soundWalking)
             elseif self.kind=="iceBomb" then
                audio.play( soundFreeze)
             end
                 transition.to( self, { time=self.spd*3,x=self.startingPointX,onComplete = move1 } )
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
            if self.kind=="octo" then
                audio.play( soundWalking)
             elseif self.kind=="iceBomb" then
                audio.play( soundFreeze)
             end
                 transition.to( self, { time=self.spd*3,x=self.startingPointX +d,onComplete = move2 } )

            end
        end
        
        move1(self)
        end
        goAgainEnemy(self)
        transition.to( self, { time=self.spd,onComplete = thrower } )
    end


    function enemyCheckFlipJumper(self)
        if self.isDead == false and loading == false then
            transition.cancel(self)
            if self.x < self.startingPointX then
                self.xScale=-1
            else
                self.xScale=1
            end    
            transition.to( self, { time=1000,x=self.startingPointX,onComplete=goAgainEnemyJumper } )
        end
    end

    ------------------------jumper ----------------------
    function jumpPatrol(self)
        self.startingPointX = self.x

        function goAgainEnemyJumper(self)
            local move1
            local d = math.random(75,85)


        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
                 transition.to( self, { time=self.spd,x=self.startingPointX,onComplete = move1 } )
                 transition.to( self, { time=self.spd/5,y=self.y-50})
                 audio.play( soundBall)
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
                 transition.to( self, { time=self.spd,x=self.startingPointX +d,onComplete = move2 } )
                 transition.to( self, { time=self.spd/5,y=self.y-50})
                 audio.play( soundBall)
            end
        end
        
        move1(self)
        end
        goAgainEnemyJumper(self)
    end

    function attackThrow(self)
        if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()

            local cast1

            local function reIdle2()
                if self.isDead == false and loading == false then
                    local function removeBody(self)
                        if loading == false then
                        -- physics.removeBody( self )
                         display.remove(self)
                        end      
                     end

                        local shoot = display.newImageRect( uiGroup, "images/bone.png", 40,40 )
                 
                        shoot.myName="spell"
                        shoot.str =4
                        shoot.x = self.x
                        shoot.y = self.y-20
                        audio.play( soundThrow)
                        
                        physics.addBody( shoot, "dynamic",
                        {bounce= 0, radius=20,isSensor=true })

                       -- local vx, vy = shoot:getLinearVelocity()
                       -- shoot:setLinearVelocity( 0, 0 )
                       if self.xScale == 1 then
                        shoot:applyLinearImpulse( -.3, -.2, shoot.x, shoot.y )
                       else
                       shoot:applyLinearImpulse( .3, -.2, shoot.x, shoot.y )
                       end

                        transition.to( shoot, { time=2000,rotation=2000,onComplete = removeBody } )                        
                end
            end

            local function throw()
                if self.isDead == false and loading == false then
                    if hero.x < self.x then
                        self.xScale=1
                    else
                        self.xScale=-1
                    end
                    self:setSequence("throw")
                    self:play()
               -- castNow(self)
                --transition.to( self, { time=300,onComplete = castNow } )
                transition.to( self, { time=350,onComplete = reIdle2 } )
                end
            end

            local function reIdle()
                if self.isDead == false and loading == false then
                    local function removeBody(self)
                        if loading == false then
                        -- physics.removeBody( self )
                         display.remove(self)
                        end      
                     end               
                     local shoot = display.newRect( uiGroup,self.x,self.y, 50,40 )               
                         shoot.myName="spell"
                         shoot.str =8
                         shoot.alpha=0
                         audio.play( soundMetal)               
                         shoot.y = self.y  +10                    
                         physics.addBody( shoot, "dynamic",
                         {bounce= 0, box={ halfWidth=33, halfHeight=20, x=0, y=10 },isSensor=true })
                         shoot.gravityScale=0

                         transition.to( shoot, { time=200,onComplete = removeBody } )
                         
                    if self.x < hero.x then
                        self.xScale=-1
                        shoot.x = self.x+20
                    else
                        self.xScale=1
                        shoot.x = self.x-20
                    end
                    transition.to( self, { time=400,onComplete = cast1 } )
                end
            end
            local function aboutToCast()
                if self.isDead == false and loading == false then
                    self:setSequence("attack")
                    self:play()

               -- castNow(self)
                --transition.to( self, { time=300,onComplete = castNow } )
                transition.to( self, { time=300,onComplete = reIdle } )
                end
            end
            local function cast2()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    transition.to( self, { time=500,onComplete = aboutToCast } )
                end
            end
             function cast1()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    transition.to( self, { time=600,onComplete = cast2 } )
                    throw(self)
                end
            end
           -- castTime = timer.performWithDelay(500,cast1,self.casterLv)
            transition.to( self, { time=500,onComplete = cast1 } )

        end
    end

    -------------attacking--------------

    function attacking(self)
        if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()

            local cast1
            local function reIdle()
                if self.isDead == false and loading == false then
                    local function removeBody(self)
                        if loading == false then
                        -- physics.removeBody( self )
                         display.remove(self)
                        end      
                     end
                 
                     local shoot = display.newRect( uiGroup,self.x,self.y, 50,40 )
                 
                         shoot.myName="spell"
                         shoot.str =7
                         shoot.alpha=0

                 
                         shoot.y = self.y
                         
                         physics.addBody( shoot, "dynamic",
                         {bounce= 0, box={ halfWidth=33, halfHeight=20, x=0, y=10 },isSensor=true })
                         shoot.gravityScale=0

                         transition.to( shoot, { time=200,onComplete = removeBody } )
                         

                    if self.x < hero.x then
                        self.xScale=-1
                        shoot.x = self.x+40
                    else
                        self.xScale=1
                        shoot.x = self.x-40
                    end

                    transition.to( self, { time=500,onComplete = cast1 } )
                end
            end

            local function aboutToCast()
                if self.isDead == false and loading == false then
                    self:setSequence("attack")
                    self:play()
                    audio.play( soundMetal)

               -- castNow(self)
                --transition.to( self, { time=300,onComplete = castNow } )
                transition.to( self, { time=300,onComplete = reIdle } )
                end
            end
            local function cast2()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = aboutToCast } )
                end
            end
             function cast1()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    transition.to( self, { time=500,onComplete = cast2 } )
                end
            end
           -- castTime = timer.performWithDelay(500,cast1,self.casterLv)
            transition.to( self, { time=500,onComplete = cast1 } )
        end
    end

    ----------thrower-----------
    function thrower(self)
        if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()

            local cast1
            local function reIdle()
                if self.isDead == false and loading == false then
                    local function removeBody(self)
                        if loading == false then
                        -- physics.removeBody( self )
                         display.remove(self)
                        end      
                     end

                     if self.kind=="octo" then

                        local spriteOptions = {
                            height = 32,
                            width = 32,
                            numFrames = 3,
                            sheetContentWidth = 64,
                            sheetContentHeight = 64
                          }
                          local mySheet = graphics.newImageSheet("images/octoBomb.png", spriteOptions)
                          local sequenceData = {
                            {name = "vomit", start =1,count=3, time =400, loopCount =0}
                    
                          }        
                            -- Display the new sprite at the coordinates passed
                        local shoot = display.newSprite(uiGroup,mySheet, sequenceData)
                        shoot:setSequence("vomit")
                        shoot:play()
                 
                        shoot.myName="spell"
                        shoot.str =4
                        shoot.x = self.x
                        shoot.y = self.y
                        audio.play( soundThrow)
                        
                        physics.addBody( shoot, "dynamic",
                        {bounce= 0, radius=20,isSensor=true })

                       -- local vx, vy = shoot:getLinearVelocity()
                       -- shoot:setLinearVelocity( 0, 0 )
                       if self.xScale == 1 then
                        shoot:applyLinearImpulse( -.3, -.1, shoot.x, shoot.y )
                       else
                       shoot:applyLinearImpulse( .3, -.1, shoot.x, shoot.y )
                       end

                        transition.to( shoot, { time=2000,rotation=2000,onComplete = removeBody } )
                 
                    else
                        local shoot = display.newImageRect( uiGroup, "images/bone.png", 40,40 )
                 
                        shoot.myName="spell"
                        shoot.str =4
                        shoot.x = self.x
                        shoot.y = self.y
                        audio.play( soundThrow)
                        
                        physics.addBody( shoot, "dynamic",
                        {bounce= 0, radius=20,isSensor=true })

                       -- local vx, vy = shoot:getLinearVelocity()
                       -- shoot:setLinearVelocity( 0, 0 )
                       if self.xScale == 1 then
                        shoot:applyLinearImpulse( -.3, -.2, shoot.x, shoot.y )
                       else
                       shoot:applyLinearImpulse( .3, -.2, shoot.x, shoot.y )
                       end

                        transition.to( shoot, { time=2000,rotation=2000,onComplete = removeBody } )

                    end
                        

                    transition.to( self, { time=500,onComplete = cast1 } )
                end
            end

            local function aboutToCast()
                if self.isDead == false and loading == false then
                    if hero.x < self.x then
                        self.xScale=1
                    else
                        self.xScale=-1
                    end
                    self:setSequence("throw")
                    self:play()
               -- castNow(self)
                --transition.to( self, { time=300,onComplete = castNow } )
                transition.to( self, { time=350,onComplete = reIdle } )
                end
            end
            local function cast2()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = aboutToCast } )
                end
            end
             function cast1()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    transition.to( self, { time=500,onComplete = cast2 } )
                end
            end
           -- castTime = timer.performWithDelay(500,cast1,self.casterLv)
            transition.to( self, { time=500,onComplete = cast1 } )
        end

    end

    -------bomb--------

    function bombExplode(self)
        if self.isDead == false and loading == false then
            self:setSequence("attack")
            self:play()
            self.isDead=true

                    local function removeBody(self2)
                        if loading == false then
                        -- physics.removeBody( self )
                         display.remove(self)
                         display.remove(self2)
                        end      
                     end
                 
                     local shoot = display.newRect( uiGroup,self.x,self.y, 150,100 )
                 
                         shoot.myName="spell"
                         shoot.str =5
                         shoot.alpha=0
                         audio.play( soundExplode)
                 
                         shoot.y = self.y
                         
                         physics.addBody( shoot, "dynamic",
                         {bounce= 0, box={ halfWidth=75, halfHeight=50, x=0, y=0 },isSensor=true })
                         shoot.gravityScale=0

                         transition.to( shoot, { time=400,onComplete = removeBody } )

        end
    end

    ------------waiting----------

    function waiting(self)
        if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()
        end

    end

    function casting(self)
        if self.isDead == false and loading == false then
            local cast1
            local function reIdle()
                if self.isDead == false and loading == false then
                    if self.x < hero.x then
                        self.xScale=-1
                    else
                        self.xScale=1
                    end
                    self:setSequence("idle")
                    self:play()
                    audio.play( soundVomit)
                    transition.to( self, { time=500,onComplete = cast1 } )
                end
            end

            local function aboutToCast()
                if self.isDead == false and loading == false then
                    self:setSequence("attack")
                    self:play()
               -- castNow(self)
                transition.to( self, { time=300,onComplete = castNow } )
                transition.to( self, { time=500,onComplete = reIdle } )
                end
            end
            local function cast5()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = aboutToCast } )
                end
            end
            local function cast4()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = cast5 } )
                end
            end
            local function cast3()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = cast4 } )
                end
            end
            local function cast2()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = cast3 } )
                end
            end
             function cast1()
                if self.isDead == false and loading == false then
                    transition.to( self, { time=500,onComplete = cast2 } )
                end
            end
           -- castTime = timer.performWithDelay(500,cast1,self.casterLv)
            transition.to( self, { time=500,onComplete = cast1 } )
        end
    end

    

    -----------flyer--------------------
    function flyPatrol(self)
        self.startingPointX = self.x
        self.startingPointY = self.y
        print("one time call")

        function goAgainEnemy(self)
            local move1
            local move2
            local r = math.random(1500,2000)
            local d = math.random(90,130)
            


        local function move3()
            if self.isDead == false and loading == false then
            self.xScale=-1
                 transition.to( self, { time=self.spd*.6,x=self.startingPointX +math.random(30,80),y=self.y-math.random(30,80),onComplete = move1 } )
            end         
        end

         function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
            if self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end
                 transition.to( self, { time=self.spd,x=self.startingPointX,onComplete = move3 } )
            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
            self.xScale=-1
            if self.kind=="fly" then
                audio.play( soundBuzzing)
             elseif self.kind=="ghost" then
                audio.play( soundGhost)
             elseif self.kind=="red" then
                audio.play( soundLava)
             else
             end

                 transition.to( self, { time=self.spd*.6,x=self.startingPointX +d,y=self.startingPointY,onComplete = move2 } )
            end
        end
        
        local r = math.random(1,2)
        if r == 1 then
         move1(self)
        else
            move2(self)
        end

        end
        goAgainEnemy(self)
    end

    function patrolAttack(self)
        local move1
        local r = math.random(1000,1200)
        local d = math.random(60,80)

        local function move2()
            if self.isDead == false and loading == false then
            self.xScale=1
            if self.isAttacking==true then
                self.isAttacking =false
                self:setSequence("attack")
                self:play()
                transition.to( self, { time=self.spd,x=hero.x,onComplete = move1 } )
            else
            transition.to( self, { time=self.spd,x=self.x -d,onComplete = move1 } ) 
           -- self:setSequence("walk")
           -- self:play() 
            end   
            end     
        end

         function move1(self)
            if self.isDead == false and loading == false then
            self.xScale=-1
            if self.isAttacking==true then
                self.isAttacking =false
                self:setSequence("attack")
                self:play()
                transition.to( self, { time=self.spd,x=hero.x,onComplete = move2 } )
            else
            transition.to( self, { time=self.spd,x=self.x +d,onComplete = move2 } )
           -- self:setSequence("walk")
           -- self:play()
            end
        end
        end
        
        move1(self)
    end

    ------------ability game message------------
    local function unPaused(self)
        paused = false
        absorbAnim = false
		transition.resume()
		--timer.resume()
		physics.start( )
        physics.setGravity( 0,100)
        --display.remove(self)

    end

    local function resetAnim()
        paused = false
        absorbAnim = false
    end

    function abilityGainDJ(self)

        absorbAnim = true
        --transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        createBuble(stoneBarrier)
        display.remove(stoneBarrier)

        gameStatus.drakzDoubleJump = 1
        gameStatus.harpyBoss = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Double Jump", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })


        local function ready(self )    
           -- paused = false
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
            transition.to( self,{time=400,onComplete=unPaused})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="With this double jump ability"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="i can reach higher Places"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainFB(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        createBuble(stoneBarrier)
        display.remove(stoneBarrier)

        gameStatus.drakzFireBall = 1
        gameStatus.fireBoss = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Fire Ball", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        transition.to( button3, { time=1000,x=screenRight-20 } )


        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="WOw! this is amazing ability"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="with this i can break ice Barrier"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------
    end

    function abilityGainIB(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        createBuble(stoneBarrier)
        display.remove(stoneBarrier)

        gameStatus.drakzIceBlast = 1
        gameStatus.iceBoss = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Ice Blast", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        transition.to( button4, { time=1000,x=screenRight-20 } )

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="Ice blast. yes i need this"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="now! i can freeze the magma on the ground"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainDD(self)
        absorbAnim = true
        --transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        createBuble(stoneBarrier)
        display.remove(stoneBarrier)

        gameStatus.drakzDashDown = 1
        gameStatus.shovelBoss = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Dash Down", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="with this power i can destroy"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="those stone barrier on the ground"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    ----------------------------------minor abilities---------------
    function abilityGainDU(self)
        absorbAnim = true
        --transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.drakzHighJump = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Dash Up", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="the stone barrier up above the ceiling"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="I can destroy them now"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainSF(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.superFireBall = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Super Fire Ball", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="i can melt those giant ice wall"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="with this super fireball"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainSI(self)
        absorbAnim = true
        --transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.superIceBlast = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Super Ice Blast", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="cool! i saw some lava fall before"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX+20})
                transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX+20})
                bossTalkText.text="i guess i can freeze them now"
                transition.to( self, { time=3000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainSB(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.speedBoost = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 2000,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Speed Boost", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 2500,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="more faster the better"
                transition.to( self, { time=2000,onComplete = ready } )

         end
        end
        transition.to( self, { time=3000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    -----------------------------bonus ability ----------------------
    function abilityGainMAG(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.magnetic = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 1200,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Magnetic", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 3000,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="Magnetic turned on"
                transition.to( self, { time=2000,onComplete = ready } )

         end
        end
        transition.to( self, { time=4000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainSW(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.drakzWave = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 1200,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Sonic Wave", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 3000,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=centerY,x=centerX})
            transition.to( bossTalkText,{time=300,y=centerY,x=centerX})
            bossTalkText.text="sonic wave Nice!"
                transition.to( self, { time=2000,onComplete = ready } )

         end
        end
        transition.to( self, { time=4000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainRM(self)
        absorbAnim = true
        --transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.rechargeMp = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 1200,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Regain Mp", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 3000,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="auto refilling mp, i love it"
                transition.to( self, { time=2000,onComplete = ready } )

         end
        end
        transition.to( self, { time=4000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

    function abilityGainEC(self)
        absorbAnim = true
       -- transition.to(hero,{time=1200,onComplete=resetAnim})
        createAbsorb(self)
        hero:setSequence("absorb")
        hero:play()

        gameStatus.extraCoins = 1
        saveScores()

        local title =display.newText(uiGroup,"Ability Gain", self.x,self.y-30 , "Rooters.ttf", 30)
        title:setFillColor( 1,1,1 )
        title.yScale=.2
        transition.to( title,{time = 1200,y=self.y-130,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title ) end })

        local title2 =display.newText(uiGroup,"Extra Coin", self.x,self.y , "Rooters.ttf", 30)
        title2:setFillColor( 1,1,1 )
        title2.yScale=.2
        transition.to( title2,{time = 3000,y=self.y-100,yScale =1,transition=easing.outCirc  ,onComplete=
        function()display.remove( title2 ) end })

        local function ready(self )    
            transition.to( self,{time=400,onComplete=unPaused})
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=hero.y-50,x=centerX})
            transition.to( bossTalkText,{time=300,y=hero.y-50,x=centerX})
            bossTalkText.text="the more coins the merrier"
                transition.to( self, { time=2000,onComplete = ready } )

         end
        end
        transition.to( self, { time=4000,onComplete = openingTalk } )
        ---------------------ability hint to player-----------

    end

local function exitGround()
    local self=event.target
    if ( event.objType == "loot" and event.other.objType == "ground" ) then
     
        -- Foot sensor has entered (overlapped) a ground object
        if ( event.phase == "began" ) then
            self:applyLinearImpulse( .1,-.12, self.x, self.y )
        end

    end
end

    ---------------heart and magic----------
    local function createBody(self)
        self.objType="loot"
        physics.addBody( self, "dynamic",
        {bounce= .1, radius=12,friction=1, isSensor = false})
        self.isFixedRotation = true
        local r = math.random(-3,3)*.01
       -- transition.to( self, { time=100,x=self.x+r,y = self.y-20} )
        self:applyLinearImpulse( r,-.12, self.x, self.y )
       -- self.gravityScale=.02
      -- self.collision = exitGround
      -- self:addEventListener( "collision" )

      --self.collision = enemyCollide
      --self:addEventListener( "collision" )
    end

    local function createBody2(self)
        physics.addBody( self, "dynamic",
        {bounce= 0, radius=12,friction=1, isSensor = false})
        self.isFixedRotation = true
        self:applyLinearImpulse( 0, -.3, self.x, self.y )
        self.gravityScale=.02
    end
    --- ability drops---------------
    function createDoubleJump(self)
        local shoot = display.newImageRect( uiGroup,  buttonSheet3,1, 32,32 )

        shoot.myName="doubleJump"
        --shoot.mp =10
        shoot.isDead=false

        shoot.x = self.x
        shoot.y = self.y
        
        transition.to( shoot, { time=10,onComplete = createBody2 } )
    end

    function createFireBall(self)
        local shoot = display.newImageRect( uiGroup, buttonSheet3,3, 32,32 )

        shoot.myName="fireBall"
        --shoot.mp =10
        shoot.isDead=false

        shoot.x = self.x
        shoot.y = self.y
        
        transition.to( shoot, { time=10,onComplete = createBody2 } )
    end

    function createIceBlast(self)
        local shoot = display.newImageRect( uiGroup, buttonSheet3,2, 32,32 )

        shoot.myName="iceBlast"
        --shoot.mp =10
        shoot.isDead=false

        shoot.x = self.x
        shoot.y = self.y
        
        transition.to( shoot, { time=10,onComplete = createBody2 } )
    end

    function createDashDown(self)
        local shoot = display.newImageRect( uiGroup,  buttonSheet3,4, 32,32 )

        shoot.myName="dashDown"
        --shoot.mp =10
        shoot.isDead=false

        shoot.x = self.x
        shoot.y = self.y
        
        transition.to( shoot, { time=10,onComplete = createBody2 } )
    end

    --------------------------------------minor abilities------------------
    function createDashUp()
        ability = display.newImageRect( uiGroup,  buttonSheet3,5, 32,32 )

        ability.myName="dashUp"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createSuperFire()
        ability = display.newImageRect( uiGroup,  buttonSheet3,6, 32,32 )

        ability.myName="superFire"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createSuperIce()
        ability = display.newImageRect( uiGroup,  buttonSheet3,7, 32,32 )

        ability.myName="superIce"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createSonicWave()
        ability = display.newImageRect( uiGroup,  buttonSheet3,11, 32,32 )

        ability.myName="sonicWave"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createSpeedBoost()
        ability = display.newImageRect( uiGroup, buttonSheet3,8, 32,32 )

        ability.myName="speedBoost"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createExtraCoins()
        ability = display.newImageRect( uiGroup,  buttonSheet3,10, 32,32 )

        ability.myName="extraCoins"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createMagnetic()
        ability = display.newImageRect( uiGroup,  buttonSheet3,9, 32,32 )

        ability.myName="magnetic"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end

    function createRechargeMp()
        ability = display.newImageRect( uiGroup,  buttonSheet3,12, 32,32 )

        ability.myName="rechargeMp"
        ability.isDead=false

        physics.addBody( ability, "dynamic",
        {bounce= 0, radius=15,friction=1, isSensor = false})
        ability.isFixedRotation = true
    end


    


    function createHeart(self)
        local spriteOptions = {
            height = 30,
            width = 30,
            numFrames = 6,
            sheetContentWidth = 60,
            sheetContentHeight = 90
          }
          local mySheet = graphics.newImageSheet("images/heartSheet.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=6, time =math.random(600,800), loopCount =0},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        local heart = display.newSprite(uiGroup,mySheet, sequenceData) 
        heart:setSequence("boom")
        heart:play()

        heart.myName="heart"
        heart.hp =20
        heart.isDead=false
        heart.damaged =false

        heart.x = self.x
        heart.y = self.y

        transition.to( heart, { time=10,onComplete = createBody } )

    end

    function createMagic(self)
        local spriteOptions = {
            height = 30,
            width = 30,
            numFrames = 7,
            sheetContentWidth = 90,
            sheetContentHeight = 90
          }
          local mySheet = graphics.newImageSheet("images/crystal.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=7, time =math.random(600,800), loopCount =0},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        local shoot = display.newSprite(uiGroup,mySheet, sequenceData) 
        shoot:setSequence("boom")
        shoot:play()

        shoot.myName="magic"
        shoot.mp =10
        shoot.isDead=false
        shoot.damaged =false

        shoot.x = self.x
        shoot.y = self.y
        
        transition.to( shoot, { time=10,onComplete = createBody } )
    end

    function createCoin(self)
        local spriteOptions = {
            height = 24,
            width = 24,
            numFrames = 6,
            sheetContentWidth = 48,
            sheetContentHeight = 72
          }
          local mySheet = graphics.newImageSheet("images/coin.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=6, time =math.random(400,700), loopCount =0},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        local shoot = display.newSprite(uiGroup,mySheet, sequenceData) 
        shoot:setSequence("boom")
        shoot:play()
        audio.play( soundCoin)


        shoot.myName="coin"
        shoot.coin =self.coin
        shoot.isDead=false
        shoot.damaged =false

        shoot.x = self.x
        shoot.y = self.y


        
        transition.to( shoot, { time=10,onComplete = createBody } )
    end


    ----------box------------ destructable

    function createCrate()


        --Declare and set up Sprite Image Sheet and sequence data
        --Declare and set up Sprite Image Sheet and sequence data
        local spriteOptions = {
            height = 96,
            width = 96,
            numFrames = 6,
            sheetContentWidth = 192,
            sheetContentHeight = 288
          }
          local mySheet = graphics.newImageSheet("images/crate.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=5, time =500, loopCount =1},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)      
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 1
        enemy.hp = enemy.maxHp
        enemy.str =0
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="crate"
        enemy.objType="ground"
        enemy.coin =20
              
        physics.addBody( enemy, "dynamic",
            { density=1000, bounce=0, friction = 100,box={ halfWidth=24, halfHeight=24,x=0,y=24} } ) 

        enemy.isFixedRotation = true

        if coleIsAlive==true then
            enemy.x = centerX +math.random(1,300)
            enemy.y = centerY +100
        end

 end

    function createRedBase()


        --Declare and set up Sprite Image Sheet and sequence data
        --Declare and set up Sprite Image Sheet and sequence data
        local spriteOptions = {
            height = 96,
            width = 96,
            numFrames = 5,
            sheetContentWidth = 192,
            sheetContentHeight = 288
          }
          local mySheet = graphics.newImageSheet("images/redBase.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=5, time =500, loopCount =1},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)      
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 1
        enemy.hp = enemy.maxHp
        enemy.str =0
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="box"
        enemy.objType="ground"
        enemy.coin =20
              
        physics.addBody( enemy, "dynamic",
            { density=1000, bounce=0, friction = 100,box={ halfWidth=16, halfHeight=24,x=0,y=24} } ) 

        enemy.isFixedRotation = true

 end

 function createBase()


    --Declare and set up Sprite Image Sheet and sequence data
    --Declare and set up Sprite Image Sheet and sequence data
    local spriteOptions = {
        height = 96,
        width = 96,
        numFrames = 5,
        sheetContentWidth = 192,
        sheetContentHeight = 288
      }
      local mySheet = graphics.newImageSheet("images/blueBase.png", spriteOptions)
      local sequenceData = {
        {name = "boom", start =1,count=5, time =500, loopCount =1},

      }
     
    
        -- Display the new sprite at the coordinates passed
    enemy = display.newSprite(mainGroup,mySheet, sequenceData)      
    
    enemy.myName="enemy"
    enemy.hittable = true
    enemy.maxHp = 1
    enemy.hp = enemy.maxHp
    enemy.str =0
    enemy.hitted = false
    enemy.isDead=false
    enemy.isAttacking=false
    enemy.damaged =false
    enemy.startingPointX=100
    enemy.type="vase"
    enemy.objType="ground"
    enemy.coin =20
          
    physics.addBody( enemy, "dynamic",
        { density=1000, bounce=0, friction = 100,box={ halfWidth=16, halfHeight=24,x=0,y=24} } ) 

    enemy.isFixedRotation = true

end

function createTreasure()

     enemy = display.newImageRect( mainGroup, "images/treasureBox.png", 42,36 )     
    
    enemy.myName="treasure"
    enemy.hittable = true
    enemy.maxHp = 1
    enemy.hp = enemy.maxHp
    enemy.str =0
    enemy.hitted = false
    enemy.isDead=false
    enemy.isAttacking=false
    enemy.damaged =false
    enemy.startingPointX=100
    enemy.type="treasure"
    enemy.objType="ground"
    enemy.coin =30
    enemy.opened =false
    enemy.open = false
          
    physics.addBody( enemy, "dynamic",
        { density=1000, bounce=0, friction = 100,box={ halfWidth=21, halfHeight=16,x=0,y=0} } ) 

    enemy.isFixedRotation = true

end

function openChest(self)

    local enemy = display.newImageRect( mainGroup, "images/treasureBox2.png", 42,40 )  
    enemy.x = self.x
    enemy.y = self.y

    transition.to( enemy,{time = 1500,onComplete=
    function()display.remove( enemy ) end })--end of hitting code

end

function adsMessage(self)
    local function ad(self)
        self.opened = false
        self.open =true



        if gameStatus.stage ==1 then
            gameStatus.chestStage1 =1
        elseif gameStatus.stage ==5 then
            gameStatus.chestStage5 =1
        elseif gameStatus.stage ==8 then
            gameStatus.chestStage8 =1
        elseif gameStatus.stage ==9 then
            gameStatus.chestStage9 =1
        elseif gameStatus.stage ==10 then
            gameStatus.chestStage10 =1
        elseif gameStatus.stage ==13 then
            gameStatus.chestStage13 =1
        elseif gameStatus.stage ==14 then
            gameStatus.chestStage14 =1
        elseif gameStatus.stage ==18 then
            gameStatus.chestStage18 =1
        elseif gameStatus.stage ==20 then
            gameStatus.chestStage20 =1
        elseif gameStatus.stage ==21 then
            gameStatus.chestStage21 =1
        end
    end

    if gameStatus.stage==1 then
      if gameStatus.chestStage1 == 0 then
	    local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)

         transition.to( enemy,{time = 1400,onComplete=
        function()display.remove( enemy ) end })--end of hitting code

         transition.to( self,{time = 1400,onComplete=ad})
      end
    elseif gameStatus.stage==5 then
        if gameStatus.chestStage5 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==8 then
        if gameStatus.chestStage8 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==9 then
        if gameStatus.chestStage9 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==10 then
        if gameStatus.chestStage10 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==13 then
        if gameStatus.chestStage13 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==14 then
        if gameStatus.chestStage14 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==18 then
        if gameStatus.chestStage18 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==20 then
        if gameStatus.chestStage20 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end
      elseif gameStatus.stage==21 then
        if gameStatus.chestStage21 == 0 then
          local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
           transition.to( enemy,{time = 1400,onComplete=
          function()display.remove( enemy ) end })--end of hitting code
  
           transition.to( self,{time = 1400,onComplete=ad})
        end

     else
        if self.open==false then
        local enemy =display.newText(uiGroup,"Watch ad to open Chest", self.x,self.y-70, "Rooters.ttf", 25)
  
        transition.to( enemy,{time = 1400,onComplete=
       function()display.remove( enemy ) end })--end of hitting code

           transition.to( self,{time = 1400,onComplete=ad})
        end
    end




end


function teacherMenu(self)

    local function pausedMe(obj)
        self.talked = false  
     callMenu()
     display.remove( obj )
     bossTalk.y = screenBottom+1000

     if blackRoom==true then
        display.remove(black)
     end
     saveScores()
    end
    -- testing black out
    local function pausedMe2()
     if blackRoom==true then
        display.remove(black)

     end
    end

    local function talkNow()
        local talk

        local function talk1()
            local r = math.random(1,5)
            transition.to( bossTalk,{time = 10,y=self.y-60,x=centerX})
            if r ==1 then
               talk =display.newText(uiGroup2,"Time to increase you're power", centerX,self.y-60, "Rooters.ttf", 25)
            elseif r ==2 then
               talk =display.newText(uiGroup2,"tap the icon to learn how to use", centerX,self.y-60, "Rooters.ttf", 25)
            elseif r ==3 then
                talk =display.newText(uiGroup2,"tap the green cross to upgrade", centerX,self.y-60, "Rooters.ttf", 25)
            elseif r ==4 then
                talk =display.newText(uiGroup2,"Use your coins to purchase upgrade", centerX,self.y-60, "Rooters.ttf", 25)
           else
               talk =display.newText(uiGroup2,"upgrade your Hp, Mp, Str and Mag", centerX,self.y-60, "Rooters.ttf", 25)
           end
        end

        local function talk2()
            local r = math.random(1,3)
            transition.to( bossTalk,{time = 10,y=self.y-60,x=centerX})
            if r ==1 then
                talk =display.newText(uiGroup2,"I forgot to turn on the light", centerX,self.y-60, "Rooters.ttf", 25)
            elseif r ==2 then
                talk =display.newText(uiGroup2,"Let there be light", centerX,self.y-60, "Rooters.ttf", 25)
            elseif r ==3 then
                talk =display.newText(uiGroup2,"Hazzza!! the magic light", centerX,self.y-60, "Rooters.ttf", 25)
            end
        end


        if gameStatus.stage == 0827 then
            if gameStatus.puzzle1==0 then
                talk2()
             gameStatus.puzzle1 = 1
            else
                talk1()
            end
        elseif gameStatus.stage == 216217 then
            if gameStatus.puzzle2==0 then
                talk2()
             gameStatus.puzzle2 = 1
            else
                talk1()
            end
        elseif gameStatus.stage == 010211 then
            if gameStatus.puzzle3==0 then
                talk2()
             gameStatus.puzzle3 = 1
            else
                talk1()
            end
        elseif gameStatus.stage == 323224 then
            if gameStatus.puzzle4==0 then
                talk2()
             gameStatus.puzzle4 = 1
            else
                talk1()
            end
        elseif gameStatus.stage == 16212 then
            if gameStatus.puzzle5==0 then
                talk2()
             gameStatus.puzzle5 = 1
            else
                talk1()
            end
        elseif gameStatus.stage == 0027226 then
            if gameStatus.puzzle6==0 then
                talk2()
             gameStatus.puzzle6 = 1
            else
                talk1()
            end
        else
            talk1()

        end
        transition.to( talk,{time = 2000,onComplete=pausedMe})

     end
    -------------------
    talkNow()
    ---testing black out
    transition.to( black,{time = 600,xScale=10,yScale=10, onComplete=pausedMe2})


end

 function createFairy()

    local spriteOptions = {
        height = 48,
        width = 48,
        numFrames = 3,
        sheetContentWidth = 96,
        sheetContentHeight = 96
      }
      local mySheet = graphics.newImageSheet("images/fairy.png", spriteOptions)
      local sequenceData = {
        {name = "idle", start =1,count=3, time =math.random(300,500), loopCount =0},
        {name = "walk", start =1,count=3, time =300, loopCount =0},
        {name = "attack", start =1,count=3, time =300, loopCount =1},


      }
     
    
        -- Display the new sprite at the coordinates passed
    enemy = display.newSprite(mainGroup,mySheet, sequenceData)
    enemy:setSequence("walk")
    enemy:play()
    
    
    enemy.myName="enemy"
    enemy.hittable = true
    enemy.maxHp = 75
    enemy.hp = enemy.maxHp
    enemy.str =3
    enemy.spd =1000
    enemy.hitted = false
    enemy.isDead=false
    enemy.isAttacking=false
    enemy.damaged =false
    enemy.startingPointX=100
    enemy.type="fairy"
    enemy.coin =20


    
    local triangle = { 0,-20, -13,10, 13,10}
              
    physics.addBody( enemy, "dynamic",
        { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } 
       -- { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
  
    )
    
   -- enemy.sensorOverlaps = 0
    enemy.isFixedRotation = true
    enemy.gravityScale =0

 end

 function passing(self)

    local mSqrt = math.sqrt
    local function distanceBetween( pos1, pos2 )
            local factor = { x = pos2.x - pos1.x, y = pos2.y - pos1.y }
            return mSqrt( ( factor.x * factor.x ) + ( factor.y * factor.y ) )
    end
    local totDist = distanceBetween(spawnPoint,self)
    local travTime = totDist / 1.5

    local a1
    local function a2(self)
        if self.isDead == false and loading == false then
        transition.to( self,{time = travTime,x=self.x- math.random(30,50),y=self.y+ math.random(30,50),onComplete=a1})
        end
    end

     function a1(self)
        if self.isDead == false and loading == false then
            audio.play( soundFairy)
        transition.to( self,{time = travTime,x=self.x- math.random(30,50),y=self.y- math.random(30,50),onComplete=a2})
        end
    end
    a1(self)

 end



 ------------------------------npc----------------------

 function createTeacher()

    local spriteOptions = {
        height = 48,
        width = 48,
        numFrames = 7,
        sheetContentWidth = 144,
        sheetContentHeight = 144
      }
      local mySheet = graphics.newImageSheet("images/hermit2.png", spriteOptions)
      local sequenceData = {
        {name = "walk", start =1,count=7, time =700, loopCount =0}

      }
     
    
        -- Display the new sprite at the coordinates passed
    local enemy = display.newSprite(mainGroup,mySheet, sequenceData)
    enemy:setSequence("walk")
    enemy:play()
    
    
    enemy.myName="teacher"
    enemy.hittable = true
    enemy.maxHp = 1000
    enemy.hp = enemy.maxHp
    enemy.str =3
    enemy.spd= 1500
    enemy.castSpd =.3
    enemy.hitted = false
    enemy.isDead=false
    enemy.isAttacking=false
    enemy.startingPointX=100
    enemy.type="teacher"
    enemy.kind ="teacher"
    enemy.damaged =false
    enemy.coin =enemy.maxHp
    enemy.talked = false

    enemy.x = spawnPoint.x
    enemy.y = spawnPoint.y

    local triangle = { 0,20, -15,25, 15,25}
              
    physics.addBody( enemy, "dynamic",
        { density=1000, bounce=0, friction = 100,shape=triangle } 
    )
    
   -- enemy.sensorOverlaps = 0
    enemy.isFixedRotation = true

    local merchant = display.newImageRect( uiGroup, "images/exit3.png", 100,30 )
    merchant.x = enemy.x
    merchant.y = enemy.y-50

    local merchantText =display.newText(uiGroup,"Merchant",merchant.x, merchant.y, "Rooters.ttf", 18)


 end

------------enemy----------------------
-----------------------normal enemy -------------------------
 function createBall()


            --Declare and set up Sprite Image Sheet and sequence data
            --Declare and set up Sprite Image Sheet and sequence data
            local spriteOptions = {
                height = 64,
                width = 64,
                numFrames = 11,
                sheetContentWidth = 192,
                sheetContentHeight = 256
              }
              local mySheet = graphics.newImageSheet("images/ball.png", spriteOptions)
              local sequenceData = {
                {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
                {name = "walk", start =1,count=4, time =500, loopCount =1},
                {name = "attack", start =1,count=10, time =500, loopCount =1},
    
        
              }
             
            
                -- Display the new sprite at the coordinates passed
            enemy = display.newSprite(mainGroup,mySheet, sequenceData)
            enemy:setSequence("idle")
            enemy:play()
            
            
            enemy.myName="enemy"
            enemy.hittable = true
            enemy.maxHp = 25
            enemy.hp = enemy.maxHp
            enemy.str =3
            enemy.spd= 1000
            enemy.hitted = false
            enemy.isDead=false
            enemy.isAttacking=false
            enemy.startingPointX=100
            enemy.type="jumper"
            enemy.damaged =false
            enemy.coin =enemy.maxHp
    
            
            local triangle = { 0,0, -16,30, 16,30}
                  
            physics.addBody( enemy, "dynamic",
                { density=10, bounce=0, friction = 1,shape=triangle } 
               -- { density=2, bounce=0, friction = 1  ,box={ halfWidth=70, halfHeight=4, x=0, y=10 },isSensor=true }  -- Main body element
          
            )
            
           -- enemy.sensorOverlaps = 0
            enemy.isFixedRotation = true
    
    
     end

     function createArmored()


        --Declare and set up Sprite Image Sheet and sequence data
        --Declare and set up Sprite Image Sheet and sequence data
        local spriteOptions = {
            height = 100,
            width = 200,
            numFrames = 16,
            sheetContentWidth = 600,
            sheetContentHeight = 600
          }
          local mySheet = graphics.newImageSheet("images/armored.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =13,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =7,count=6, time =500, loopCount =1},
            {name = "attack", start =1,count=7, time =600, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("idle")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 40
        enemy.hp = enemy.maxHp
        enemy.str =8
        enemy.spd= 1000
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="knight"
        enemy.coin =enemy.maxHp

        
        local triangle = { 0,-22, -15,50, 15,50}
              
        physics.addBody( enemy, "dynamic",
            { density=20, bounce=0, friction = 1,shape=triangle } 
            --{ density=2, bounce=0, friction = 1  ,box={ halfWidth=70, halfHeight=4, x=0, y=10 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true


 end

 function createOgre()


    --Declare and set up Sprite Image Sheet and sequence data
    --Declare and set up Sprite Image Sheet and sequence data
    local spriteOptions = {
        height = 80,
        width = 90,
        numFrames = 14,
        sheetContentWidth = 360,
        sheetContentHeight = 320
      }
      local mySheet = graphics.newImageSheet("images/ogre.png", spriteOptions)
      local sequenceData = {
        {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
        {name = "walk", start =1,count=4, time =500, loopCount =1},
        {name = "throw", start =5,count=5, time =400, loopCount =1},
        {name = "attack", start =11,count=4, time =400, loopCount =1},


      }
     
    
        -- Display the new sprite at the coordinates passed
    enemy = display.newSprite(mainGroup,mySheet, sequenceData)
    enemy:setSequence("idle")
    enemy:play()
    
    
    enemy.myName="enemy"
    enemy.hittable = true
    enemy.maxHp = 45
    enemy.hp = enemy.maxHp
    enemy.str =8
    enemy.spd= 1000
    enemy.hitted = false
    enemy.isDead=false
    enemy.isAttacking=false
    enemy.damaged =false
    enemy.startingPointX=100
    enemy.type="ogre"
    enemy.coin =enemy.maxHp

    
    local triangle = { 10,-24, -15,38, 20,38}
          
    physics.addBody( enemy, "dynamic",
        { density=20, bounce=0, friction = 1,shape=triangle } 
       -- { density=2, bounce=0, friction = 1  ,box={ halfWidth=70, halfHeight=4, x=0, y=10 },isSensor=true }  -- Main body element
  
    )
    
   -- enemy.sensorOverlaps = 0
    enemy.isFixedRotation = true


end


     function createBlue()

        local spriteOptions = {
            height = 64,
            width = 96,
            numFrames = 21,
            sheetContentWidth = 384,
            sheetContentHeight = 384
          }
          local mySheet = graphics.newImageSheet("images/blue.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =13,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =14,count=8, time =500, loopCount =0},
            {name = "attack", start =1,count=12, time =800, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 38
        enemy.hp = enemy.maxHp
        enemy.str =7
        enemy.castSpd =.4
        enemy.spd= math.random(1800,2100)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="attacker"
        enemy.kind="blue"
        enemy.coin =enemy.maxHp
        enemy.element="ice"

        
        local triangle = { 0,-25, -20,32, 20,32}
                  
        physics.addBody( enemy, "dynamic",
            { density=50, bounce=0, friction = 1,shape=triangle } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=90, halfHeight=20, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true


     end

    

     function createFrog()

        local spriteOptions = {
            height = 48,
            width = 60,
            numFrames = 9,
            sheetContentWidth = 180,
            sheetContentHeight = 144
          }
          local mySheet = graphics.newImageSheet("images/frog.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =6,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =6,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=5, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 18
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= math.random(1200,1600)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="slower"
        enemy.coin =enemy.maxHp

        
        local triangle = { 10,-18, -15,22, 20,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=40, bounce=0, friction = 1,shape=triangle } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=100, halfHeight=16, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true


     end

     function createWormy()

        local spriteOptions = {
            height = 48,
            width = 64,
            numFrames = 4,
            sheetContentWidth = 128,
            sheetContentHeight = 96
          }
          local mySheet = graphics.newImageSheet("images/wormy.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=4, time =300, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 33
        enemy.hp = enemy.maxHp
        enemy.str =5
        enemy.spd= math.random(2000,2400)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="worm"
        enemy.coin =enemy.maxHp

        
        local triangle = { 10,-18, -15,22, 20,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=20, bounce=0, friction = 1,shape=triangle } ,
            { density=10, bounce=0, friction = 100,box={ halfWidth=100, halfHeight=16, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true



     end

     function createSkeleton()

        local spriteOptions = {
            height = 64,
            width = 64,
            numFrames = 28,
            sheetContentWidth = 320,
            sheetContentHeight = 384
          }
          local mySheet = graphics.newImageSheet("images/skeleton.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =25,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =19,count=6, time =math.random(300,500), loopCount =0},
            {name = "attack", start =8,count=11, time =500, loopCount =1},
            {name = "throw", start =1,count=7, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 18
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= math.random(1400,1700)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="attacker"
        enemy.kind ="skeleton"
        enemy.coin =enemy.maxHp

        
       -- local triangle = { 0,-20, 20,20, -20,20}
        local triangle = { 0,-23, -18,30, 20,30}
                  
        physics.addBody( enemy, "dynamic",
            { density=30, bounce=0, friction = 1,shape=triangle } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=100, halfHeight=16, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true


     end


     function createDr()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 15,
            sheetContentWidth = 192,
            sheetContentHeight = 192
          }
          local mySheet = graphics.newImageSheet("images/dr2.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =12,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=5, time =500, loopCount =0},
            {name = "attack", start =7,count=5, time =500, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 26
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= 1500
        enemy.castSpd =.3
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="caster"
        enemy.casterLv =1
        enemy.kind ="dr"
        enemy.coin =enemy.maxHp
        enemy.element="fire"

        
                 
        local triangle = { 0,-22, -18,22, 18,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=40, bounce=0, friction = 1,shape=triangle } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=16, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true


     end

     ------------------shooter---------------------
 
     function createHood()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 10,
            sheetContentWidth = 144,
            sheetContentHeight = 192
          }
          local mySheet = graphics.newImageSheet("images/hood.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =6,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =6,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=5, time =500, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 23
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= 1500
        enemy.castSpd =.3
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="shooter"
        enemy.kind ="hood"
        enemy.coin =enemy.maxHp

                 
        local triangle = { 0,-22, -20,24, 20,24}
                  
        physics.addBody( enemy, "dynamic",
            { density=40, bounce=0, friction = 1,shape=triangle } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=300, halfHeight=15, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true

     end

    

     function createBoy()

        local spriteOptions = {
            height = 48,
            width = 64,
            numFrames = 8,
            sheetContentWidth = 128,
            sheetContentHeight = 192
          }
          local mySheet = graphics.newImageSheet("images/boy2.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =5,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =5,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=5, time =800, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 36
        enemy.hp = enemy.maxHp
        enemy.str =5
        enemy.spd= 1500
        enemy.castSpd =.3
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="waiter"
        enemy.kind ="boy"
        enemy.coin =enemy.maxHp

        local triangle = { 0,-22, -15,22, 15,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=40, bounce=0, friction = 1,shape=triangle } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=300, halfHeight=15, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true

     end

     function createJelly()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 14,
            sheetContentWidth = 192,
            sheetContentHeight = 192
          }
          local mySheet = graphics.newImageSheet("images/jelly.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =11,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=5, time =500, loopCount =0},
            {name = "attack", start =6,count=5, time =500, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 23
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= 1500
        enemy.castSpd =.3
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="caster"
        enemy.casterLv =1
        enemy.kind ="jelly"
        enemy.coin =enemy.maxHp

        
                  
        local triangle = { 0,-20, -20,22, 20,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=40, bounce=0, friction = 1,shape=triangle } 
            --{ density=10, bounce=0, friction = 100,box={ halfWidth=300, halfHeight=15, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true


     end

     function createSpiky()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 8,
            sheetContentWidth = 144,
            sheetContentHeight = 144
          }
          local mySheet = graphics.newImageSheet("images/spike.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =5,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=4, time =500, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 23
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= math.random(700,1000)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="waiter"
        enemy.kind="spiky"
        enemy.coin =enemy.maxHp

        
                  
        local triangle = { 0,-20, -20,22, 20,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=40, bounce=0, friction = 1,shape=triangle }
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=300, halfHeight=15, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true

     end

     function createVomit()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 4,
            sheetContentWidth = 96,
            sheetContentHeight = 96
          }
          local mySheet = graphics.newImageSheet("images/vomit.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=4, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 37
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd= math.random(700,1000)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="walker"
        enemy.coin =enemy.maxHp

        
                  
        local triangle = { 0,-20, -20,22, 20,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=30, bounce=0, friction = 1,shape=triangle }
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=300, halfHeight=15, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true

     end

     function createRedPoop()

        local function addPoopBody(enemy)
                              
            local triangle = { 0,40, -12,60, 15,60}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle },
            { density=10, bounce=0, friction = 100,box={ halfWidth=75, halfHeight=50, x=0, y=10 },isSensor=true }  -- Main body element
      
        )
        enemy.isFixedRotation = true

        end

        local spriteOptions = {
            height = 120,
            width = 120,
            numFrames = 7,
            sheetContentWidth = 360,
            sheetContentHeight = 360
          }
          local mySheet = graphics.newImageSheet("images/redPoop.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=3, time =300, loopCount =0},
            {name = "walk", start =1,count=3, time =300, loopCount =0},
            {name = "attack", start =3,count=4, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 15
        enemy.hp = enemy.maxHp
        enemy.str =5
        enemy.anchorY=.8
        enemy.spd= math.random(700,1000)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.type="bomb"
        enemy.coin =enemy.maxHp

        

        transition.to (enemy, {time = 10,onComplete=addPoopBody})
       -- enemy.sensorOverlaps = 0

     end


     -------------------enemy flying ------------------

     function createFloatingFire()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 4,
            sheetContentWidth = 96,
            sheetContentHeight = 96
          }
          local mySheet = graphics.newImageSheet("images/hotFire.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =math.random(400,500), loopCount =0},
            {name = "walk", start =1,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=4, time =200, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 28
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd= 1200
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind ="red"
        enemy.coin =enemy.maxHp
        enemy.element="fire"
        
        local triangle = { 0,-22, -18,22, 18,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,radius=160,isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale=0

     end

     function createFloatingIce()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 3,
            sheetContentWidth = 96,
            sheetContentHeight = 96
          }
          local mySheet = graphics.newImageSheet("images/iceCold.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=3, time =math.random(400,500), loopCount =0},
            {name = "walk", start =1,count=3, time =math.random(300,500), loopCount =0},
            {name = "attack", start =1,count=3, time =200, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 26
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd= 1200
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind ="ice"
        enemy.coin =enemy.maxHp
        enemy.element="ice"
        
        local triangle = { 0,-22, -18,22, 18,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,radius=160,isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale=0


     end

     function createRed()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 9,
            sheetContentWidth = 144,
            sheetContentHeight = 144
          }
          local mySheet = graphics.newImageSheet("images/red.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =6,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =6,count=4, time =500, loopCount =0},
            {name = "attack", start =1,count=5, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 26
        enemy.hp = enemy.maxHp
        enemy.str =3
        enemy.spd= 1200
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind ="red"
        enemy.coin =enemy.maxHp
        enemy.element="fire"
        
        local triangle = { 0,-22, -18,22, 18,22}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,radius=160,isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale=0


     end


     function createOcto()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 6,
            sheetContentWidth = 96,
            sheetContentHeight = 144
          }
          local mySheet = graphics.newImageSheet("images/octo.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=4, time =300, loopCount =0},
            {name = "attack", start =1,count=6, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 32
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd= 1000
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind ="octo"
        enemy.coin =enemy.maxHp

        
        local triangle = { 0,-25, -20,28, 20,28}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,radius=120,isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale=0


     end

     function createGhost()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 4,
            sheetContentWidth = 96,
            sheetContentHeight = 96
          }
          local mySheet = graphics.newImageSheet("images/ghost.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=4, time =400, loopCount =0},
            {name = "attack", start =1,count=4, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 33
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd= math.random(1000,1600)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind="ghost"
        enemy.coin =enemy.maxHp

        
        local triangle = { 0,-25, -20,28, 20,28}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,radius =150,isSensor = true } -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale=0


     end

     function createEye()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 9,
            sheetContentWidth = 144,
            sheetContentHeight = 144
          }
          local mySheet = graphics.newImageSheet("images/eye.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =math.random(300,500), loopCount =0},
            {name = "walk", start =1,count=4, time =400, loopCount =0},
            {name = "attack", start =5,count=5, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 31
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd= math.random(1000,1600)
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind="eye"
        enemy.coin =enemy.maxHp
        enemy.element="fire"

        
        local triangle = { 0,-25, -20,28, 20,28}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,radius =150,isSensor = true } -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale=0


     end

     function createFly()

        local spriteOptions = {
            height = 48,
            width = 48,
            numFrames = 6,
            sheetContentWidth = 96,
            sheetContentHeight = 144
          }
          local mySheet = graphics.newImageSheet("images/fly.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=6, time =math.random(500,700), loopCount =0},
            {name = "walk", start =1,count=6, time =600, loopCount =0},
            {name = "attack", start =1,count=3, time =400, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 36
        enemy.hp = enemy.maxHp
        enemy.str =5
        enemy.spd =1000
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="flyer"
        enemy.kind="fly"
        enemy.coin =enemy.maxHp


        
        local triangle = { 0,-25, -20,28, 20,28}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } ,
            { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
      
        )
        
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale =0


     end

     ---------------------------boss enemies---------------
     function createHarpy()

        local spriteOptions = {
            height = 128,
            width = 128,
            numFrames = 35,
            sheetContentWidth = 768,
            sheetContentHeight = 768
          }
          local mySheet = graphics.newImageSheet("images/harpy.png", spriteOptions)
          local sequenceData = {
            {name = "fly", start =18,count=12, time =700, loopCount =0},
            {name = "walk", start =18,count=12, time =700, loopCount =0},
            {name = "attack", start =1,count=17, time =700, loopCount =1},
            {name = "slide", start =32,count=3, time =600, loopCount =2},
            {name = "lost", start =35,count=1, time =600, loopCount =0},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 110
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd =1000
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="harpy"
        enemy.boss=true
        enemy.coin =enemy.maxHp


        
        local triangle = { 0,-50, -30,40, 30,40}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
      
        )       
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale =0


     end

     function createIceBoss()

        local spriteOptions = {
            height = 150,
            width = 150,
            numFrames = 23,
            sheetContentWidth = 750,
            sheetContentHeight = 750
          }
          local mySheet = graphics.newImageSheet("images/iceBoss.png", spriteOptions)
          local sequenceData = {
            {name = "fly", start =15,count=8, time =600, loopCount =0},
            {name = "idle", start =15,count=8, time =600, loopCount =0},
            {name = "attack", start =1,count=14, time =600, loopCount =1},
            {name = "attack2", start =1,count=11, time =600, loopCount =1},
            {name = "lost", start =23,count=1, time =600, loopCount =0},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 150
        enemy.hp = enemy.maxHp
        enemy.str =4
        enemy.spd =1000
        enemy.castSpd =.45
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="ice"
        enemy.kind="iceBoss"
        enemy.boss=true
        enemy.coin =enemy.maxHp
        enemy.element="ice"


        
        local triangle = { 0,-50, -30,40, 30,40}
                  
        physics.addBody( enemy, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
      
        )       
       -- enemy.sensorOverlaps = 0
        enemy.isFixedRotation = true
        enemy.gravityScale =0


     end

     function createShovel()

        local spriteOptions = {
            height = 150,
            width = 100,
            numFrames = 39,
            sheetContentWidth = 700,
            sheetContentHeight = 900
          }
          local mySheet = graphics.newImageSheet("images/goblin.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =32,count=8, time =600, loopCount =0},
            {name = "walk", start =16,count=8, time =600, loopCount =0},
           -- {name = "attack", start =24,count=8, time =500, loopCount =1},
            {name = "jump", start =1,count=15, time =600, loopCount =1},
            {name = "attack", frames={24,25,26,27,28,29,30,31,26,24}, time =550, loopCount =1},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        enemy = display.newSprite(mainGroup,mySheet, sequenceData)
        enemy:setSequence("walk")
        enemy:play()
        
        
        enemy.myName="enemy"
        enemy.hittable = true
        enemy.maxHp = 170
        enemy.hp = enemy.maxHp
        enemy.str =5
        enemy.spd =1000
        enemy.castSpd =.3
        enemy.hitted = false
        enemy.isDead=false
        enemy.isAttacking=false
        enemy.damaged =false
        enemy.startingPointX=100
        enemy.startingPointY=100
        enemy.type="shovel"
        enemy.kind="shovel"
        enemy.boss=true
        enemy.coin =enemy.maxHp


        
        local triangle = { 0,-50, -20,70, 20,70}
                  
        physics.addBody( enemy, "dynamic",
            { density=100, bounce=0, friction = 1,shape=triangle,isSensor=false } 
           -- { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
      
        )       
        enemy.gravityScale = 0
        enemy.isFixedRotation = true



     end

     function createLava()

        local function leftHand()
            local spriteOptions = {
                height = 96,
                width = 96,
                numFrames = 16,
                sheetContentWidth = 384,
                sheetContentHeight =384
              }
              local mySheet = graphics.newImageSheet("images/lavaHand.png", spriteOptions)
              local sequenceData = {
                {name = "idle", start =9,count=8, time =math.random(300,500), loopCount =0},
                {name = "walk", start =9,count=8, time =500, loopCount =0},
                {name = "attack", start =1,count=8, time =500, loopCount =2},
        
              }
                   
                -- Display the new sprite at the coordinates passed
            enemyl = display.newSprite(mainGroup,mySheet, sequenceData)
            enemyl:setSequence("walk")
            enemyl:play()
            
        
            enemyl.hittable = true
            enemyl.maxHp = 100
            enemyl.hp = enemyl.maxHp
            enemyl.str =3
            enemyl.spd =1000
            enemyl.y = screenBottom+100
            enemyl.hitted = false
            enemyl.isDead=false
            enemyl.isAttacking=false
            enemyl.startingPointX=100
            enemyl.startingPointY=100

            end

        local function rightHand()
            local spriteOptions = {
                height = 96,
                width = 96,
                numFrames = 16,
                sheetContentWidth = 384,
                sheetContentHeight = 384
              }
              local mySheet = graphics.newImageSheet("images/lavaHand.png", spriteOptions)
              local sequenceData = {
                {name = "idle", start =9,count=8, time =math.random(300,500), loopCount =0},
                {name = "walk", start =9,count=8, time =500, loopCount =0},
                {name = "attack", start =1,count=8, time =500, loopCount =2},
        
              }
                   
                -- Display the new sprite at the coordinates passed
            enemyr = display.newSprite(mainGroup,mySheet, sequenceData)
            enemyr:setSequence("walk")
            enemyr:play()
            
            

            enemyr.hittable = true
            enemyr.maxHp = 30
            enemyr.hp = enemyr.maxHp
            enemyr.str =3
            enemyr.spd =1000
            enemyr.y = screenBottom+100
            enemyr.hitted = false
            enemyr.isDead=false
            enemyr.isAttacking=false
            enemyr.xScale=-1

            end

            local function head()
                local spriteOptions = {
                    height = 150,
                    width = 150,
                    numFrames = 17,
                    sheetContentWidth = 600,
                    sheetContentHeight = 750
                  }
                  local mySheet = graphics.newImageSheet("images/lava.png", spriteOptions)
                  local sequenceData = {
                    {name = "idle", start =1,count=8, time =500, loopCount =0},
                    {name = "walk", start =1,count=8, time =500, loopCount =0},
                    {name = "attack", start =9,count=8, time =500, loopCount =2},
                    {name = "lost", start =17,count=1, time =600, loopCount =0},
            
                  }
                       
                    -- Display the new sprite at the coordinates passed
                enemy = display.newSprite(mainGroup,mySheet, sequenceData)
                enemy:setSequence("walk")
                enemy:play()
                
                
                enemy.myName="enemy"
                enemy.hittable = true
                enemy.maxHp = 130
                enemy.hp = enemy.maxHp
                enemy.str =4
                enemy.spd =1000
                enemy.y = screenBottom+100
                enemy.hitted = false
                enemy.isDead=false
                enemy.isAttacking=false
                enemy.damaged =false
                enemy.startingPointX=100
                enemy.startingPointY=100
                enemy.type="lava"
                enemy.boss=true
                enemy.coin =enemy.maxHp
                enemy.element="fire"
                
                local triangle = { -10,-55, -40,35, 40,35}
                          
                physics.addBody( enemy, "dynamic",
                    { density=10, bounce=0, friction = 1,shape=triangle,isSensor=true } 
                   -- { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
                )
               -- enemy.sensorOverlaps = 0
                enemy.isFixedRotation = true
                enemy.gravityScale =0
        
                
                end

        head()
        leftHand()
        rightHand()

        local function removeMe(self)
            display.remove( self )
        end

        local function boom(self)
            enemy:setSequence("attack")
            enemy:play()
            enemyr:setSequence("attack")
            enemyr:play()
            enemyl:setSequence("attack")
            enemyl:play()
            shake(self)
            local i =0
            while i <8 do
                i = i +1
                local shoot
           --[[ local shoot = display.newImageRect( uiGroup, "images/joystickmain1b.png", 100,100 )

            shoot.myName="spell"
            shoot.str =2
            shoot.spd=2000
            shoot.isDead=false
    
            shoot.x = self.x
            shoot.y = self.y
            
            physics.addBody( shoot, "dynamic",
            {bounce= 0, radius=20, isSensor = true})
            
            shoot.gravityScale =0--]]

            local function castFeather(self)
                if self.isDead == false and loading == false then

            
                    shoot = display.newImageRect( uiGroup2, "images/fireBall1.png", 128,64 )

            
                    shoot.myName="spell"
                    shoot.str =3
                    shoot.spd=2000
            
                    shoot.x = self.x
                    shoot.y = self.y-10
                    
                    physics.addBody( shoot, "dynamic",
                    {bounce= 0,box={ halfWidth=32, halfHeight=32, x=32, y=0 }, isSensor = true})
                    shoot.gravityScale =0                
             
                    end
                end
                castFeather(self)

            if i == 1 then
                transition.to (shoot, {time = 1000,x = shoot.x+1000,onComplete=removeMe})
            elseif i == 2 then
                shoot.xScale=-1
                transition.to (shoot, {time = 1000,x = shoot.x-1000,onComplete=removeMe})
            elseif i == 3 then
                shoot.rotation=90
                transition.to (shoot, {time = 1000,y = shoot.y+1000,onComplete=removeMe})
            elseif i == 4 then
                shoot.rotation=-90
                transition.to (shoot, {time = 1000,y = shoot.y-1000,onComplete=removeMe})
            elseif i == 5 then
                shoot.rotation=45
                transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y+1000,onComplete=removeMe})
            elseif i == 6 then
                shoot.rotation=135
                transition.to (shoot, {time = 1000,x = shoot.x-1000,y = shoot.y+1000,onComplete=removeMe})
            elseif i == 7 then
                shoot.rotation=-45
                transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y-1000,onComplete=removeMe})
            elseif i == 8 then
                shoot.rotation=-135
                transition.to (shoot, {time = 1000,x = shoot.x-1000,y = shoot.y-1000,onComplete=removeMe})
            --else
               -- transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y+1000,onComplete=removeMe})
            end
        end

        end
        local moveLeft
        local moveUp
        local didBossTalk=false

        local function unTalk( )
            paused = false
            --transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
        
                    ---menu on unpause
            --hideMenu()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( enemy, { time=400,onComplete = moveUp } )
            print("lava talk finished")
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
                enemy:setSequence("walk")
                enemy:play()
                shake(self)
    
            if didBossTalk==false then
                didBossTalk = true
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
            moveNow2 ="stop"
            
           -- transition.pause()
            --timer.pause()
            physics.pause( )
            physics.setGravity( 0,0)
    
            ---menu on pause
            transition.to( bossTalk,{time=300,y=self.y-10})
            transition.to( bossTalkText,{time=300,y=self.y-10})
            bossTalkText.text="By the power of my creator"

            local function talk2()
                transition.to( bossTalk,{time=300,y=self.y})
                transition.to( bossTalkText,{time=300,y=self.y})
                bossTalkText.text="I will burn you"
                transition.to( self, { time=2000,onComplete = unTalk } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
    
            enemy.hp =enemy.maxHp

            transition.to (enemyr, {time = 300,y =centerY-50,x=centerX + 200,})
            transition.to (enemyl, {time = 300,y =centerY-50,x=centerX + 100,})
            transition.to (enemy, {time = 250,y =centerY-60,x=centerX+140})

           -- transition.to( enemy, { time=1500,onComplete = unTalk } )
            else
             transition.to( enemy, { time=800,onComplete = moveUp } )
            end
    
         end
        end


        local function flashDown()
            if enemy.isDead == false and loading == false then
            local r =math.random(20,250)
            transition.to (enemy, {time = 200,y =centerY+100,x=enemy.x})
            transition.to (enemyr, {time = 200,y =centerY+230,x=enemy.x + r,onComplete=boom})
            transition.to (enemyl, {time = 200,y =centerY+230,x=enemy.x -r,onComplete=boom})
            transition.to (enemy, {time = 700,onComplete=moveLeft})
            audio.play( soundExplode)
           end
        end

        
         function moveUp()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("walk")
                enemy:play()
                enemyr:setSequence("walk")
                enemyr:play()
                enemyl:setSequence("walk")
                enemyl:play()
            transition.to (enemy, {time = 600,y =centerY-200,x=centerX,onComplete=flashDown})
            transition.to (enemyr, {time = 600,y =centerY-260,x=centerX + 50})
            transition.to (enemyl, {time = 600,y =centerY-260,x=centerX - 50})
           end
        end

        local function bam()
            if enemy.isDead == false and loading == false then
                audio.play( soundExplode)
            transition.to (enemyr, {time = 200,y =centerY,x=centerX + 200,onComplete=boom})
            transition.to (enemyl, {time = 200,y =centerY,x=centerX - 200,onComplete=boom})
            transition.to (enemy, {time = 150,y =centerY-60,x=centerX+140})
            if enemy.hp< enemy.maxHp *.4 then
                transition.to (enemy, {time = 800,onComplete=bossTalkF})
            else
            transition.to (enemy, {time = 800,onComplete=moveLeft})
            end
           end
        end

        local function upDown2()
            if enemy.isDead == false and loading == false then
            transition.to (enemyr, {time = 500,y =centerY-300,x=centerX + 220})
            transition.to (enemyl, {time = 500,y =centerY-300,x=centerX + 120})
            transition.to (enemy, {time = 500,y =centerY-160,x=centerX+160,onComplete=bam})
           end
        end

        local function upDown()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("walk")
                enemy:play()
                enemyr:setSequence("walk")
                enemyr:play()
                enemyl:setSequence("walk")
                enemyl:play()
                enemy.xScale=1
            transition.to (enemyr, {time = 400,y =centerY-190,x=centerX + 200})
            transition.to (enemyl, {time = 400,y =centerY-190,x=centerX + 100})
            transition.to (enemy, {time = 300,y =centerY-150,x=centerX+150,onComplete=upDown2})
           end
        end

        local function rightExplode()
            if enemy.isDead == false and loading == false then
            transition.to (enemy, {time = 200,y =centerY})
            transition.to (enemyl, {time = 200,y =centerY})
            transition.to (enemyr, {time = 150,y =centerY,onComplete=boom})
            audio.play( soundExplode)
            if enemy.hp< enemy.maxHp *.7 then
                transition.to (enemy, {time = 800,onComplete=upDown})
            else
             transition.to (enemy, {time = 800,onComplete=moveLeft})
            end
        end
    end

        local function rightBomb()
            if enemy.isDead == false and loading == false then
            transition.to (enemy, {time = 500,y =centerY-30})
            transition.to (enemyr, {time = 500,y =centerY-100})
            transition.to (enemyl, {time = 500,y =centerY+00,onComplete=rightExplode})
        end
    end

        local function moveRight()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("walk")
                enemy:play()
                enemyr:setSequence("walk")
                enemyr:play()
                enemyl:setSequence("walk")
                enemyl:play()
                enemy.xScale=-1
            transition.to (enemy, {time = 700,y =centerY-50,x=centerX + 40,onComplete=rightBomb})
            transition.to (enemyr, {time = 600,y =centerY-20,x=centerX + 280})
            transition.to (enemyl, {time = 800,y =centerY-20,x=centerX })
           end
        end

        local function leftExplode()
            if enemy.isDead == false and loading == false then
            transition.to (enemy, {time = 200,y =centerY})

            transition.to (enemyl, {time = 150,y =centerY,onComplete=boom})
            transition.to (enemy, {time = 800,onComplete=moveRight})
            audio.play( soundExplode)

            if didBossTalk==true then
                transition.to (enemyr, {time = 200,y =centerY+230,onComplete=boom})
             else
                transition.to (enemyr, {time = 200,y =centerY})
             end
        end
    end

        local function leftBomb()
            if enemy.isDead == false and loading == false then
        transition.to (enemy, {time = 500,y =centerY-30})

        transition.to (enemyl, {time = 500,y =centerY-100,onComplete=leftExplode})

             if didBossTalk==true then
                transition.to (enemyr, {time = 500,y =centerY-50})
             else
                transition.to (enemyr, {time = 500,y =centerY+10})
             end
         end
        end

         function moveLeft()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("walk")
                enemy:play()
                enemyr:setSequence("walk")
                enemyr:play()
                enemyl:setSequence("walk")
                enemyl:play()
                enemy.xScale=1
          transition.to (enemy, {time = 700,y =centerY-50,x=centerX - 40,onComplete=leftBomb})
          transition.to (enemyr, {time = 800,y =centerY-20,x=centerX})
          transition.to (enemyl, {time = 600,y =centerY-20,x=centerX - 280})
            end
         end


        function bossLava()
            transition.to (enemy, {time = 2000,y =centerY,onComplete=moveLeft})
            transition.to (enemyl, {time = 2000,y =centerY})
            transition.to (enemyr, {time = 2000,y =centerY})
         end


         local function ready(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=500,onComplete = moveLeft } )
        end
    
        function openingTalk(enemy)
            if enemy.isDead == false and loading == false then
                enemy:setSequence("walk")
                enemy:play()
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"

            transition.to( bossTalk,{time=300,y=centerY-10,x = centerX})
            transition.to( bossTalkText,{time=300,y=centerY-10,x=centerX})
            bossTalkText.text="How dare you Copy my creator"

            local function talk2()
                transition.to( bossTalk,{time=300,y=enemy.y})
                transition.to( bossTalkText,{time=300,y=enemy.y})
                bossTalkText.text="now! burn and die!"
                transition.to( enemy, { time=2000,onComplete = ready } )
            end
            transition.to( enemy, { time=2000,onComplete = talk2 } )

         end
        end
        
        openingTalk(enemy)

     end


     -------------end of enemy flying ----------------

     --------------------boss ai---------------

     function iceBoss(self)
        local bossCenter
        local cast1
        local didBossTalk=false

        local function blast()
            if self.isDead == false and loading == false then
                self:setSequence("attack2")
                self:play()
 
                local function scale(self2)
                   -- self.anchorX =0
                   if self.isDead == false and loading == false then
                   self:setSequence("idle")
                   self:play()
                   display.remove(self2)
                   transition.to (self, {time = 200,x=centerX+300,onComplete=bossCenter})
                    --transition.to (self2, {time = 100,yScale=.01,onComplete=removeMe})
                   end
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
                    {name = "blast", start =1,count=11, time =600, loopCount =1}
            
                  }        
                    -- Display the new sprite at the coordinates passed
                shoot = display.newSprite(backGroup,mySheet, sequenceData)
                shoot:setSequence("blast")
                shoot:play()
                audio.play( soundIceBlast)
               -- shoot.anchorX =1
                shoot.xScale=2
                shoot.yScale=2
               -- shoot.rotation=-10

                shoot.x = self.x
                shoot.y = self.y
        
                shoot.myName="spell2"
                shoot.str =4
                
                physics.addBody( shoot, "dynamic",
                {bounce= 0,radius=200, isSensor = true})
                shoot.gravityScale=0

            transition.to (shoot, {time = 600 ,onComplete=scale})
           -- transition.to (shoot, {time = 200,xScale=1})
           -- transition.to (self, {time = 1500,rotation=-45})


            end
        end

        local function unTalk(self )
            paused = false
            --transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
        
                    ---menu on unpause
            --hideMenu()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to (self, {time = 700,x=centerX,y=hero.y,transition = easing.inBack ,onComplete=blast})
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
                shake(self)
    
            if didBossTalk==false then
                didBossTalk = true
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
            moveNow2 ="stop"
            
           -- transition.pause()
            --timer.pause()
            physics.pause( )
            physics.setGravity( 0,0)
    
            transition.to( bossTalk,{time=300,y=self.y-10})
            transition.to( bossTalkText,{time=300,y=self.y-10})
            bossTalkText.text="I'm losing control"

            local function talk2()
                transition.to( bossTalk,{time=300,y=self.y})
                transition.to( bossTalkText,{time=300,y=self.y})
                bossTalkText.text="Defeat me before things get worse"
                transition.to( self, { time=2000,onComplete = unTalk } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
    
            self.hp =self.maxHp
            else
                transition.to (self, {time = 700,x=centerX,y=hero.y,transition = easing.inBack ,onComplete=blast})
            end
    
         end
        end



        local function square(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()

            local function toRight()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    self.xScale=1
                    self.rotation = 0
                    if self.hp <=self.maxHp*.5 then
                       -- transition.to (self, {time = 700,x=centerX,y=hero.y,transition = easing.inBack ,onComplete=blast})
                        transition.to (self, {time = 500,x=centerX+300,onComplete=bossTalkF})
                    else
                      transition.to (self, {time = 500,x=centerX+300,onComplete=bossCenter})
                    end
                end
            end

            local function toUp()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    self.xScale=-1
                    self.rotation = 30
                    if didBossTalk==true then
                        castNow(self)
                    end
                transition.to (self, {time = 400,y=centerY-200,transition = easing.inBack,onComplete=toRight})
                end
            end

            local function toLeft()
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    self.rotation=-30

                    if didBossTalk==true then
                    castNow(self)
                    end
                transition.to (self, {time = 500,x=centerX-300,transition = easing.inBack,onComplete=toUp})
                end
            end

            transition.to (self, {time = 500,y=centerY+200,onComplete=toLeft})
        end
        end


        local function moveDown()
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()

            if self.hp <=self.maxHp*.75 then
                transition.to (self, {time = 600,y =centerY+200,onComplete=square})
            else
              transition.to (self, {time = 600,y =centerY,onComplete=castNow})
              transition.to (self, {time = 1200,onComplete=cast1})
            end
        end

        end
        local function cast3()
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()

           -- castNow(self)
            transition.to (self, {time = 600,y =centerY-200,x=centerX+360,onComplete=castNow})
            transition.to (self, {time = 1200,onComplete=moveDown})
           -- transition.to (self, {time = 2000,onComplete=moveDown})
            end
        end
        local function cast2()
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
            --castNow(self)
            transition.to (self, {time = 600,y =centerY,x=centerX, onComplete=castNow})
            transition.to (self, {time = 1200,onComplete=cast3})
            end
        end
         function cast1()
            if self.isDead == false and loading == false then
            castNow(self)
            --transition.to (self, {time = 600,y =centerY-100,onComplete=castNow})
            transition.to (self, {time = 600,y =centerY+200,onComplete=cast2})
            end
        end

        function bossCenter()
            self.rotation=0
            transition.to (self, {time = 1000,y =centerY,onComplete=cast1})

        end

        local function ready(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=500,onComplete = cast1 } )
        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"

            transition.to( bossTalk,{time=300,y=self.y-10})
            transition.to( bossTalkText,{time=300,y=self.y-10})
            bossTalkText.text="You! you are the other one"

            local function talk2()
                transition.to( bossTalk,{time=300,y=self.y})
                transition.to( bossTalkText,{time=300,y=self.y})
                bossTalkText.text="free me from this prison. PLEASE!!!"
                transition.to( self, { time=2000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end
       
        openingTalk(self)
     end


 function bossHarpy(self)
        self.startingPointX = self.x
        self.startingPointY = self.y
        print("one time call")
        didBossTalk = false




        function goAgainEnemy(self)
            local move1
            local move2
            local r = math.random(1500,2000)
            local d = math.random(180,230)




local function castFeather(self)
	if self.isDead == false and loading == false then
        self:setSequence("fly")
        self:play()
        shake(self)
        

	local spriteOptions = {
		height = 64,
		width = 128,
		numFrames = 5,
		sheetContentWidth = 256,
		sheetContentHeight = 192
	  }
	  local mySheet = graphics.newImageSheet("images/harpyBall.png", spriteOptions)
	  local sequenceData = {
		{name = "fire", start =1,count=5, time =math.random(300,500), loopCount =0}

	  }
	 	
		-- Display the new sprite at the coordinates passed
	 fireBall = display.newSprite(backGroup,mySheet, sequenceData)
		fireBall:setSequence("fire")
         fireBall:play()
         audio.play( soundFireBall)

        fireBall.myName="spell"
        fireBall.str =3
        fireBall.spd=2000

        fireBall.x = self.x
        fireBall.y = self.y-10
        
        physics.addBody( fireBall, "dynamic",
        {bounce= 0,box={ halfWidth=30, halfHeight=25, x=30, y=0 }, isSensor = true})
		fireBall.gravityScale =0
		fireBall.isBullet = true
	
 
        end
    end

    local function removeBody(self)
		self.attacked = false
        display.remove( self )
    end

    local function unTalk(self )
        paused = false
        --transition.resume()
        --timer.resume()
        physics.start( )
        physics.setGravity( 0,100)
    
                ---menu on unpause
        --hideMenu()
        transition.to( bossTalkText,{time=300,y=screenTop-500})
        transition.to( bossTalk,{time=300,y=screenTop-500})
        transition.to( self, { time=self.spd,onComplete = move2 } )
    end

    function bossTalkF(self)
        if self.isDead == false and loading == false then
            self:setSequence("fly")
            self:play()
            shake(self)

        if didBossTalk==false then
            didBossTalk = true
        paused = true

        readyToMove = false
        boomStick.x = screenLeft-100
        boomStick.y = centerY
        boomDot.x = screenLeft-100
        boomDot.y = centerY
        moveNow ="stop"
        moveNow2 ="stop"
       -- transition.pause()
        --timer.pause()
        physics.pause( )
        physics.setGravity( 0,0)
        self.hp =self.maxHp
        ---menu on pause
        local function talk2()
        transition.to( bossTalk,{time=300,y=self.y})
        transition.to( bossTalkText,{time=300,y=self.y})
        bossTalkText.text="then! Have a real fight!"
        transition.to( self, { time=2000,onComplete = unTalk } )
        end
        transition.to( bossTalk,{time=300,y=self.y-10})
        transition.to( bossTalkText,{time=300,y=self.y-10})
        bossTalkText.text="so. you here to finish me."

        transition.to( self, { time=2000,onComplete = talk2 } )

        else
         transition.to( self, { time=self.spd*.5,onComplete = slide2 } )
        end

     end
    end


     function castFeather3x(self)
        if self.isDead == false and loading == false then
            self:setSequence("attack")
            self:play()
            audio.play( soundHarpy)
            self.xScale=1

            local function boom()
                if self.isDead == false and loading == false then
        castFeather(self)
         transition.to( fireBall,  { time=1000,x = fireBall.x+ 1000,onComplete = removeBody } )
        castFeather(self)
        fireBall.rotation =45
        transition.to( fireBall,  { time=1000,x = fireBall.x +1000,y=fireBall.y +1000,onComplete = removeBody } )
        castFeather(self)
        fireBall.rotation =90
        transition.to( fireBall,  { time=1000,y=fireBall.y +1000,onComplete = removeBody } )
                    end
                end
            transition.to( self,  { time=700,onComplete = boom } )
        end

    end
    function castFeather3xb(self)
        if self.isDead == false and loading == false then
            self:setSequence("attack")
            self:play()
            audio.play( soundHarpy)
            self.xScale=-1

            local function boom()
                if self.isDead == false and loading == false then
        castFeather(self)
        fireBall.rotation =-180
         transition.to( fireBall,  { time=1000,x = fireBall.x- 1000,onComplete = removeBody } )
        castFeather(self)
        fireBall.xScale=-1
        fireBall.rotation =-45
        transition.to( fireBall,  { time=1000,x = fireBall.x -1000,y=fireBall.y +1000,onComplete = removeBody } )
        castFeather(self)
        fireBall.rotation =90
        transition.to( fireBall,  { time=1000,y=fireBall.y +1000,onComplete = removeBody } )
            end
        end
            transition.to( self,  { time=700,onComplete = boom } )
        end
    end
   -- castFeather3x(fireBall)
          function slide2()
            if self.isDead == false and loading == false then
                self:setSequence("slide")
                self:play()
                audio.play( soundDash)
                self.rotation =45
            --self.xScale=1
            local function slideRight()
                if self.isDead == false and loading == false then
                    self:setSequence("slide")
                    self:play()
                    audio.play( soundDash)
                self.rotation =-45
                self.xScale=-1
                transition.to( self, { time=self.spd*.5,x=self.startingPointX-350,transition=easing.inQuint,onComplete = castFeather3x } )
                    --phase 3
               -- if self.hp< (self.maxHp *.5) then
                  --  transition.to( self, { time=self.spd*.6,onComplete = slide } )
               --  else
                    transition.to( self, { time=self.spd*.8,onComplete = move1 } )
              --  end
              end
             end
                transition.to( self, { time=self.spd,x=self.startingPointX+350,y=self.startingPointY+d,onComplete = slideRight } )

            end         
        end

            function slide()
            if self.isDead == false and loading == false then
                self:setSequence("slide")
                self:play()
                audio.play( soundDash)
                self.rotation =-75
            --self.xScale=1
            local function slideRight()
                if self.isDead == false and loading == false then
                    self:setSequence("slide")
                    self:play()
                    audio.play( soundDash)
                self.rotation =45
                self.xScale=1
                    --phase 3
                if self.hp< (self.maxHp *.5) then
                    transition.to( self, { time=self.spd*.8,y=self.startingPointY -220,onComplete = bossTalkF } )
                 else
                    transition.to( self, { time=self.spd*.5,x=self.startingPointX+350,transition=easing.inQuint } )
                    transition.to( self, { time=self.spd*.8,onComplete = move1 } )
                end
              end
             end
                transition.to( self, { time=self.spd,x=self.startingPointX-350,y=self.startingPointY+d,onComplete = slideRight } )

            end         
        end

         function move3()
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
                audio.play( soundWings)
                 self.xScale=1
                 self.rotation =0
                 transition.to( self, { time=self.spd*1.2,x=self.startingPointX,y=self.startingPointY,onComplete = castFeather3x } )
                 transition.to( self, { time=self.spd*2,onComplete = castFeather3xb } )
                 transition.to( self, { time=self.spd*2.8,onComplete = move1 } )
            end         
        end



         function move2()
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
                audio.play( soundWings)
                 self.xScale=-1
                 self.rotation =0
                 transition.to( self, { time=self.spd*1.8,x=self.startingPointX +300,onComplete = castFeather3xb } )
                 --phase 2
                 if self.hp< (self.maxHp *.75) then
                  transition.to( self, { time=self.spd*2.8,onComplete = slide } )
                 else
                 transition.to( self, { time=self.spd*3,onComplete = move3 } )
                 end

            end         
        end

         function move1(self)
           -- print("startingpoint"..startingPointX)
            if self.isDead==false and loading == false then
                self:setSequence("fly")
                self:play()
                audio.play( soundWings)
                 self.xScale=1
                 self.rotation =0
                 transition.to( self, { time=self.spd*1.5,x=self.startingPointX -300,y=self.startingPointY -220,onComplete = castFeather3x } )
                 transition.to( self, { time=self.spd*2.5,onComplete = move2 } )
            end
        end


        local function ready(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=self.spd,onComplete = move1 } )
        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"


            transition.to( bossTalk,{time=300,y=self.y-10})
            transition.to( bossTalkText,{time=300,y=self.y-10})
            bossTalkText.text="You!!! Why are you hiding in a mask?"

            local function talk2()
                transition.to( bossTalk,{time=300,y=self.y})
                transition.to( bossTalkText,{time=300,y=self.y})
                bossTalkText.text="are you here to harness my power again?"
                transition.to( self, { time=2000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end

        
        openingTalk(self)
        end
        goAgainEnemy(self)
    end

    --------------shovel knight boss ---------------- ai

    function shovel(shovel)
        local didBossTalk=false

        local function unTalk(self )
            paused = false
            transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
        
                    ---menu on unpause
            --hideMenu()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
          --  transition.to (self, {time = 700,onComplete=randomizer})
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
                shake(self)
    
            if didBossTalk==false then
                didBossTalk = true
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
            transition.to( bossTalk,{time=300,y=self.y-10})
            transition.to( bossTalkText,{time=300,y=self.y-10})
            bossTalkText.text="Oh ho ho! this is the fight"

            local function talk2()
                transition.to( bossTalk,{time=300,y=self.y})
                transition.to( bossTalkText,{time=300,y=self.y})
                bossTalkText.text="i've been waiting for all my life"
                transition.to( self, { time=2000,onComplete = unTalk } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
    
            self.hp =self.maxHp

            else
                transition.to (self, {time = 700,onComplete=randomizer})
            end
    
         end
        end


                local function castExplo(self)

                    local function removeBody(self)
                        self.attacked = false
                        display.remove( self )
                    end

                if self.isDead == false and loading == false then
                    self:setSequence("fly")
                    self:play()
            
                local spriteOptions = {
                    height = 200,
                    width = 200,
                    numFrames = 13,
                    sheetContentWidth = 800,
                    sheetContentHeight = 1000
                  }
                  local mySheet = graphics.newImageSheet("images/explotion.png", spriteOptions)
                  local sequenceData = {
                    {name = "fire", start =1,count=13, time =1000, loopCount =1}
            
                  }                   
                    -- Display the new sprite at the coordinates passed
                 fireBall = display.newSprite(uiGroup,mySheet, sequenceData)
                    fireBall:setSequence("fire")
                     fireBall:play()
                     audio.play( soundExplode)
            
                    fireBall.myName="spell2"
                    fireBall.kind = "explo"
                    fireBall.str =5
                    fireBall.spd=2000
                    fireBall.castSpd=.5
            
                    fireBall.x = self.x
                    fireBall.y = centerY+200
                    
                    physics.addBody( fireBall, "dynamic",
                    {bounce= 0,box={ halfWidth=100, halfHeight=100, x=0, y=0 }, isSensor = true})
                    fireBall.gravityScale =0
                    fireBall.isBullet = true

                    if self.hp<= self.maxHp*.45 then
                        if didBossTalk==false then
                        transition.to( shovel,  { time=1000,onComplete = bossTalkF } )
                        end
                    end

                    transition.to( shovel,  { time=200,onComplete = castFeather2x } )

                    transition.to( fireBall,  { time=1000,onComplete = removeBody } )
                            
                end
            end

            local function castFeather(self)
                if self.isDead == false and loading == false then
                    self:setSequence("fly")
                    self:play()
            
                local spriteOptions = {
                    height = 64,
                    width = 64,
                    numFrames = 6,
                    sheetContentWidth = 128,
                    sheetContentHeight = 192
                  }
                  local mySheet = graphics.newImageSheet("images/splash.png", spriteOptions)
                  local sequenceData = {
                    {name = "fire", start =1,count=6, time =500, loopCount =0}
            
                  }                   
                    -- Display the new sprite at the coordinates passed
                 fireBall = display.newSprite(backGroup,mySheet, sequenceData)
                    fireBall:setSequence("fire")
                     fireBall:play()
                     audio.play( soundEnergyBlast)
            
                    fireBall.myName="spell"
                    fireBall.str =4
                    fireBall.spd=2000
                    fireBall.castSpd=.5
            
                    fireBall.x = self.x
                    fireBall.y = centerY+255
                    
                    physics.addBody( fireBall, "dynamic",
                    {bounce= 0,box={ halfWidth=32, halfHeight=32, x=0, y=0 }, isSensor = true})
                    fireBall.gravityScale =0
                    fireBall.isBullet = true
                            
                end
            end
            
                local function removeBody(self)
                    self.attacked = false
                    display.remove( self )
                end
                       
             function castFeather2x(self)
                    if self.isDead == false and loading == false then
                        self:setSequence("attack")
                        self:play()
                        self.xScale=1
            
                        local function boom()
                    castFeather(self)
                    fireBall.xScale=-1
                     transition.to( fireBall,  { time=1000,x = fireBall.x- 1000,onComplete = removeBody } )
                    castFeather(self)
                    fireBall.xScale=1
                    transition.to( fireBall,  { time=1000,x=fireBall.x +1000,onComplete = removeBody } )
                            end
                        if didBossTalk==true then
                        transition.to( self,  { time=400,onComplete = boom } )
                        end
                    end
                end






       local function goBack(self)
        if shovel.isDead == false and loading == false then
            shovel:setSequence("jump")
            shovel:play()
           -- shake()
           -- local function delay()
            transition.to( shovel, { time=550,x=self.x,y=self.y,transition=easing.inQuint    ,onComplete = randomizer } )
            --phase 3 dificulty
            local i = math.random(1,3)
            if i ==1 then
             transition.to( shovel,  { time=400,onComplete = castNow } )
            end

            if didBossTalk==true then
                transition.to( shovel,  { time=600,onComplete = castNow } )
            end
        end
       -- transition.to( shovel, { time=200,onComplete = delay } )
       -- end
    end

        local function attackDown(shovel)
            if shovel.isDead == false and loading == false then
            shovel:setSequence("idle")
            shovel:play()
            local function delay(shovel)
            if shovel.isDead == false and loading == false then
                shovel:setSequence("attack")
                shovel:play()
                audio.play( soundDash)
            shovel:applyLinearImpulse( nil, 10000, shovel.x, shovel.y )
           -- transition.to( shovel, { time=500,onComplete = goBack } )
           --phase 2 dificulty
              end
          end
         -- shovel.gravityScale = 0
         local function sss()
            shake()
            if shovel.hp < shovel.maxHp*.7 then
                castExplo(shovel)
              end
         end
         transition.to( shovel, { time=200,onComplete = delay } )
         transition.to( shovel, { time=600,onComplete = sss } )
        end
    end

        local function getReady(self)
            if shovel.isDead == false and loading == false then
                shovel:setSequence("walk")
                shovel:play()
                audio.play( soundWalking)

                if shovel.x < self.x then
                    shovel.xScale=-1
                else
                    shovel.xScale=1
                end

            local mSqrt = math.sqrt
            local function distanceBetween( pos1, pos2 )
                    local factor = { x = pos2.x - pos1.x, y = pos2.y - pos1.y }
                    return mSqrt( ( factor.x * factor.x ) + ( factor.y * factor.y ) )
            end
            local totDist = distanceBetween(shovel,self)
            local travTime = totDist / .3

            transition.to( shovel, { time=travTime,x=self.x,y=self.y,onComplete = attackDown } )
            transition.to( self, { time=travTime+800,onComplete = goBack } )
        end
        end

        function randomizer()
            shake()
        local r = math.random(1,5)
        if r ==1 then
            getReady(spawnPoint)
        elseif r ==2 then
            getReady(spawnPoint2)
        elseif r ==3 then
            getReady(spawnPoint3)
        elseif r ==4 then
            getReady(spawnPoint4)
        elseif r ==5 then
            getReady(spawnPoint5)
        end
        end

        local function ready(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=500,onComplete = randomizer } )
        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                self:setSequence("idle")
                self:play()
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
            transition.to( bossTalk,{time=300,y=self.y-10})
            transition.to( bossTalkText,{time=300,y=self.y-10})
            bossTalkText.text="Hmmm!? A strong mask man"

            local function talk2()
                transition.to( bossTalk,{time=300,y=self.y})
                transition.to( bossTalkText,{time=300,y=self.y})
                bossTalkText.text="But not strong enough to beat me"
                transition.to( self, { time=2000,onComplete = ready } )
            end
            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end
        
        openingTalk(shovel)

    end

    function createControlBoss()

        local spriteOptions = {
            height = 200,
            width = 80,
            numFrames = 4,
            sheetContentWidth = 240,
            sheetContentHeight = 400
          }
          local mySheet = graphics.newImageSheet("images/bossControl.png", spriteOptions)
          local sequenceData = {
            {name = "idle", start =1,count=4, time =200, loopCount =0}

          }
         
        
            -- Display the new sprite at the coordinates passed
        bossControl = display.newSprite(mainGroup,mySheet, sequenceData)
   
          bossControl.x = centerX
          bossControl.y = centerY 
          bossControl.myName= "bossControl"
          bossControl.hittable = true
          bossControl.maxHp = 250
          bossControl.hp = bossControl.maxHp
          bossControl.str =6

          bossControl.alpha=.9

          physics.addBody( bossControl, "dynamic",
          { density=10, bounce=0, friction = 10,box={ halfWidth=30, halfHeight=70, x=0, y=0 },isSensor=true }  -- Main body element
    
         )   
         bossControl.gravityScale = 0


          local float

          local function float3(self)
            transition.to( self, { time=1000,x = self.x -20,y = self.y +70,alpha = .7, onComplete = float } )
          end

          local function float2(self)
            transition.to( self, { time=1000,x = self.x -50,y = self.y -20,alpha = .9, onComplete = float3 } )
          end

          function float(self)
            transition.to( self, { time=1000,x = self.x +70,y = self.y -50,alpha = .5, onComplete = float2 } )
          end
          float(bossControl)

     end

    -----------cole boss---------

    function createCole()

        local spriteOptions = {
            height = 100,
            width = 100,
            numFrames = 91,
            sheetContentWidth = 1000,
            sheetContentHeight = 1000
          }
          local mySheet = graphics.newImageSheet("images/cole.png", spriteOptions)
          local sequenceData = {
            {name = "harpyAttack", start =1,count=16, time =600, loopCount =1},
            {name = "harpy", start =17,count=14, time =600, loopCount =0},
           -- {name = "attack", start =24,count=8, time =500, loopCount =1},
            {name = "ice", start =31,count=8, time =600, loopCount =0},
            {name = "idle", start =47,count=6, time =600, loopCount =0},
            {name = "run", start =53,count=6, time =600, loopCount =0},
            {name = "attack", start =69,count=6, time =600, loopCount =1},
            {name = "jump", start =63,count=6, time =600, loopCount =1},
            {name = "iceAttack", start =75,count=8, time =600, loopCount =1},
            {name = "fire", start =39,count=8, time =600, loopCount =0},
            {name = "fireAttack", start =83,count=8, time =600, loopCount =1},
            {name = "lost", start =91,count=1, time =500, loopCount =0},

    
          }
         
        
            -- Display the new sprite at the coordinates passed
        cole = display.newSprite(mainGroup,mySheet, sequenceData)
   
        
        cole.myName="enemy"
        cole.hittable = true
        cole.maxHp = 250
        cole.hp = cole.maxHp
        cole.str =6
        cole.spd =1000
        cole.castSpd =.3
        cole.hitted = false
        cole.isDead=false
        cole.isAttacking=false
        cole.damaged =false
        cole.startingPointX=100
        cole.startingPointY=100
        cole.type="cole"
        cole.kind="cole"
        cole.boss=true
        cole.coin =cole.maxHp
        cole.talking = false
        coleIsAlive =true


        
        local triangle = { -0,-10, -20,50, 20,50}
                  
        physics.addBody( cole, "dynamic",
            { density=10, bounce=0, friction = 1,shape=triangle,isSensor=false } ,
            { density=10, bounce=0, friction = 100,box={ halfWidth=200, halfHeight=200, x=0, y=0 },isSensor=true }  -- Main body element
      
        )       
        cole.gravityScale = 0
        cole.isFixedRotation = true

     end

     function createWeaponGun()

        local spriteOptions = {
            height = 128,
            width = 256,
            numFrames = 35,
            sheetContentWidth = 1024,
            sheetContentHeight = 1152
          }
          local mySheet = graphics.newImageSheet("images/coleWeaponGun.png", spriteOptions)
          local sequenceData = {
            {name = "attack", start =5,count=5, time =500, loopCount =1},
            {name = "attack2", start =10,count=8, time =600, loopCount =1},
            {name = "idle", start =1,count=4, time =500, loopCount =0},
            {name = "shoot", start =21,count=14, time =1500, loopCount =1},
    
          }
                 
            -- Display the new sprite at the coordinates passed
        gunSword = display.newSprite(mainGroup,mySheet, sequenceData)
        gunSword:setSequence("idle")
        gunSword:play()
        
        gunSword.myName="enemy"
        gunSword.str =6
        gunSword.hitted = false
        gunSword.isDead=false
        gunSword.xScale=-1
        coleHasWeapon=true

     end

     function createWeaponFire()

        local spriteOptions = {
            height = 96,
            width = 96,
            numFrames = 16,
            sheetContentWidth = 384,
            sheetContentHeight = 384
          }
          local mySheet = graphics.newImageSheet("images/coleFire.png", spriteOptions)
          local sequenceData = {
            {name = "attack", start =9,count=8, time =600, loopCount =1},
            {name = "idle", start =1,count=8, time =500, loopCount =0},
    
          }
                 
            -- Display the new sprite at the coordinates passed
        fireSword = display.newSprite(mainGroup,mySheet, sequenceData)
        fireSword:setSequence("idle")
        fireSword:play()
        
        fireSword.myName="enemy"
        fireSword.str =5
        fireSword.hitted = false
        fireSword.isDead=false

        fireSword.x = cole.x -50
        fireSword.y = cole.y

        local spriteOptions2 = {
            height = 96,
            width = 96,
            numFrames = 16,
            sheetContentWidth = 384,
            sheetContentHeight = 384
          }
          local mySheet2 = graphics.newImageSheet("images/coleFire.png", spriteOptions2)
          local sequenceData2 = {
            {name = "attack", start =9,count=8, time =600, loopCount =1},
            {name = "idle", start =1,count=8, time =500, loopCount =0},
    
          }
                 
            -- Display the new sprite at the coordinates passed
        fireSwordr = display.newSprite(mainGroup,mySheet2, sequenceData2)
        fireSwordr:setSequence("idle")
        fireSwordr:play()
        
        fireSwordr.myName="enemy"
        fireSwordr.str =5
        fireSwordr.hitted = false
        fireSwordr.isDead=false
        fireSwordr.xScale=-1

        fireSwordr.x = cole.x +50
        fireSwordr.y = cole.y

        coleHasFire = true

     end

    function coleNormal(enemy)
        if enemy.isDead == false and loading == false then
        enemy.type="coleNormal"
        enemy:setSequence("idle")
        enemy:play()
        createWeaponGun()

        local ai
        local didBossTalk = false
        local shooting

     local function unTalk( )
        paused = false
        --transition.resume()
        --timer.resume()
        physics.start( )
        physics.setGravity( 0,100)

        transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
        transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
    
        transition.to( enemy, { time=300,onComplete = drop } )
    end

    function bossTalkF(self)
        if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()
            shake(self)

        if didBossTalk==false then
            didBossTalk = true
        paused = true
        readyToMove = false
        boomStick.x = screenLeft-100
        boomStick.y = centerY
        boomDot.x = screenLeft-100
        boomDot.y = centerY
        moveNow ="stop"
        moveNow2 ="stop"

       -- transition.pause()
        --timer.pause()
        physics.pause( )
        physics.setGravity( 0,0)

        ---menu on pause
        transition.to( bossTalk,{time=300,y=centerY,x=centerX})
        transition.to( bossTalkText,{time=300,y=centerY,x=centerX})
        bossTalkText.text="You are an Embarrassment Boy!!!"

        self.hp =self.maxHp

        transition.to( self, { time=2000,onComplete = unTalk } )
        else
         transition.to( self, { time=1800,onComplete = drop } )
        end

     end
    end

         function shooting()

                local shoot = display.newImageRect( uiGroup, "images/joystickmain1b.png", 30,30 )

                shoot.myName="bullet"
                shoot.str =5
                audio.play( soundBullet)
                
                physics.addBody( shoot, "dynamic",
                {bounce= 0, radius=10, isSensor = true})
                
                shoot.isBullet = true
                shoot.gravityScale =0
        
        

                    shoot.x = enemy.x-25
                    shoot.y = enemy.y+20
                    transition.to( shoot,{time = 900,x=shoot.x -1000,onComplete=
                    function()display.remove( shoot ) end })--end of hitting code

        end

        local function attacking2()
        if enemy.isDead == false and loading == false then

            enemy:setSequence("attack")
            enemy:play()
            cole.xScale=1

            gunSword:setSequence("attack2")
            gunSword:play()

            local shoot = display.newCircle(mainGroup, cole.x-60, cole.y, 60 )

            shoot.myName="bullet"
            shoot.str =8
            shoot.alpha = 0
            audio.play( soundAttack3)
            
            physics.addBody( shoot, "dynamic",
            {bounce= 0, radius=60, isSensor = true})
            
            shoot.gravityScale =0
    
                transition.to( shoot,{time = 700,onComplete=
                function()display.remove( shoot ) end })--end of hitting code

                local function goBack()
                    if enemy.isDead == false and loading == false then
                    enemy:setSequence("idle")
                    enemy:play()
        
                    gunSword:setSequence("idle")
                    gunSword:play()
                    transition.to( enemy,{time = 500,x= spawnPoint2.x, y = spawnPoint2.y,onComplete=ai})
                    end
                end

            transition.to( enemy,{time = 700,onComplete=goBack})
       end
    end

        local function attacking()
            if enemy.isDead == false and loading == false then

            enemy:setSequence("attack")
            enemy:play()
            cole.xScale=1

            gunSword:setSequence("attack")
            gunSword:play()

            local shoot = display.newCircle(mainGroup, cole.x-60, cole.y, 60 )

            shoot.myName="bullet"
            shoot.str =5
            shoot.alpha=0
            audio.play( soundAttack)
            
            physics.addBody( shoot, "dynamic",
            {bounce= 0, radius=60, isSensor = true})
            
            shoot.gravityScale =0
    

                transition.to( shoot,{time = 500,onComplete=
                function()display.remove( shoot ) end })--end of hitting code
       end
    end

            function run2()
                if enemy.isDead == false and loading == false then
                    enemy:setSequence("run")
                    enemy:play()
                    cole.xScale=-1
                    cole.gravityScale =0

                    transition.to( enemy,{time = 800,x=cole.x + 700,onComplete=attacking})
                    transition.to( enemy,{time = 1500,onComplete=ai3})
                end
            end

            function run()
                if enemy.isDead == false and loading == false then
                    enemy:setSequence("run")
                    enemy:play()

                transition.to( enemy,{time = 800,x=cole.x - 700,onComplete=attacking})
                transition.to( enemy,{time = 1500,onComplete=run2})
                end
            end

            function drop()
                cole.gravityScale =1
                transition.to( enemy,{time = 300,onComplete=run})
            end

            function jump3()
                if enemy.isDead == false and loading == false then
                    if cole.hp < cole.maxHp*.4 then
                        enemy:setSequence("jump")
                        enemy:play()
                        transition.to( enemy,{time = 600,x= hero.x+50, y = hero.y,onComplete=attacking2})
                    else
                    enemy:setSequence("jump")
                    enemy:play()

                  transition.to( enemy,{time = 500,x= spawnPoint2.x, y = spawnPoint2.y,onComplete=ai})
                    end
                end
            end

            function jump2()
                if enemy.isDead == false and loading == false then
                    enemy:setSequence("jump")
                    enemy:play()

                transition.to( enemy,{time = 500,x= spawnPoint3.x, y = spawnPoint3.y,onComplete=ai3})
                end
            end

            function jump()
                if enemy.isDead == false and loading == false then
                    enemy:setSequence("jump")
                    enemy:play()

                transition.to( enemy,{time = 500,x= spawnPoint.x, y = spawnPoint.y,onComplete=ai2})
                end
            end

            function ai3()
                if enemy.isDead == false and loading == false then
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
                gunSword:setSequence("shoot")
                gunSword:play()
                enemy:setSequence("idle")
                enemy:play()
               -- shooting()
               transition.to( enemy,{time = 700,onComplete = shooting})
               transition.to( enemy,{time = 850,onComplete = shooting})
               transition.to( enemy,{time = 1100,onComplete = shooting})
               if didBossTalk==true then
               transition.to( enemy,{time = 1400,onComplete = attacking})
               end
               transition.to( enemy,{time = 1800,onComplete=jump3})

                end
            end
            end

            function ai2()
                if enemy.isDead == false and loading == false then
                gunSword:setSequence("shoot")
                gunSword:play()
                enemy:setSequence("idle")
                enemy:play()
               -- shooting()
               transition.to( enemy,{time = 700,onComplete = shooting})
               transition.to( enemy,{time = 850,onComplete = shooting})
               transition.to( enemy,{time = 1100,onComplete = shooting})
               if didBossTalk==true then
                transition.to( enemy,{time = 1400,onComplete = attacking})
                end
                if cole.hp < cole.maxHp*.7 and didBossTalk ==true then
                    transition.to( enemy,{time = 1800,onComplete=drop})
                     else
                   transition.to( enemy,{time = 1800,onComplete=jump2})
                    end
                end
            end


        
            function ai()
                if enemy.isDead == false and loading == false then
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
                gunSword:setSequence("shoot")
                gunSword:play()
                enemy:setSequence("idle")
                enemy:play()
               -- shooting()
                transition.to( enemy,{time = 700,onComplete = shooting})
                transition.to( enemy,{time = 850,onComplete = shooting})
                transition.to( enemy,{time = 1100,onComplete = shooting})
                if didBossTalk==true then
                    transition.to( enemy,{time = 1400,onComplete = attacking})
                end

                 transition.to( enemy,{time = 1800,onComplete=jump})
                end
                end
            end


            local function ready( )
                paused = false
        
                transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
                transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
            
                transition.to( enemy, { time=300,onComplete = ai } )

            end
        
            function openingTalk(self)
                if self.isDead == false and loading == false then
                    self:setSequence("idle")
                    self:play()
                    shake(self)
        
                paused = true
                readyToMove = false
                boomStick.x = screenLeft-100
                boomStick.y = centerY
                boomDot.x = screenLeft-100
                boomDot.y = centerY
                moveNow ="stop"
                moveNow2 ="stop"
      
                ---menu on pause
                transition.to( heroTalk,{time=300,y=centerY-200,x=centerX-75})
                transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-75})
                bossTalkText.text="I finally found you Cole"

                local function talk2()
                    transition.to( heroTalk,{time=10,y=screenTop-300,x=centerX-75})
                    transition.to( bossTalk,{time=300,y=cole.y+100,x=centerX+50})
                    transition.to( bossTalkText,{time=300,y=cole.y+100,x=centerX+50})
                    bossTalkText.text="i've been waiting for you"
                    transition.to( self, { time=2000,onComplete = ready } )
                end
    
                transition.to( self, { time=2500,onComplete = talk2 } )
        
             end
            end

            openingTalk(enemy)
        end
    end

   

    function coleHarpy(enemy)
        if enemy.isDead == false and loading == false then
        enemy.type="coleHarpy"
        enemy:setSequence("harpy")
        enemy:play()
        enemy.xScale=-1
        local didBossTalk=false



        local function castFeather(self)
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
                shake(self)
                
        
            local spriteOptions = {
                height = 64,
                width = 128,
                numFrames = 5,
                sheetContentWidth = 256,
                sheetContentHeight = 192
              }
              local mySheet = graphics.newImageSheet("images/harpyBall.png", spriteOptions)
              local sequenceData = {
                {name = "fire", start =1,count=5, time =math.random(300,500), loopCount =0}
        
              }
                 
                -- Display the new sprite at the coordinates passed
             fireBall = display.newSprite(backGroup,mySheet, sequenceData)
                fireBall:setSequence("fire")
                 fireBall:play()
                 audio.play( soundFireBall)
        
                fireBall.myName="spell"
                fireBall.str =5
                fireBall.spd=2000
        
                fireBall.x = self.x
                fireBall.y = self.y-10
                
                physics.addBody( fireBall, "dynamic",
                {bounce= 0,box={ halfWidth=30, halfHeight=25, x=30, y=0 }, isSensor = true})
                fireBall.gravityScale =0
                fireBall.isBullet = true
            
         
                end
            end
        
            local function removeBody(self)
                self.attacked = false
                display.remove( self )
            end
        
            local function unTalk(self )
                paused = false
                --transition.resume()
                --timer.resume()
                physics.start( )
                physics.setGravity( 0,100)
            
                        ---menu on unpause
                --hideMenu()
                transition.to( bossTalkText,{time=300,y=screenTop-500})
                transition.to( bossTalk,{time=300,y=screenTop-500})
                transition.to( self, { time=self.spd,onComplete = move4 } )
            end
        
            function bossTalkF(self)
                if self.isDead == false and loading == false then
                    self:setSequence("fly")
                    self:play()
                    shake(self)
        
                if didBossTalk==false then
                    didBossTalk = true
                paused = true
                readyToMove = false
                boomStick.x = screenLeft-100
                boomStick.y = centerY
                boomDot.x = screenLeft-100
                boomDot.y = centerY
                moveNow ="stop"
                moveNow2 ="stop"
               -- transition.pause()
                --timer.pause()
                physics.pause( )
                physics.setGravity( 0,0)
        
                ---menu on pause
                transition.to( bossTalk,{time=300,y=centerY-200})
                transition.to( bossTalkText,{time=300,y=centerY-200})
                bossTalkText.text="Harpy!!! Full Power!!!"
        
                self.hp =self.maxHp
        
                transition.to( self, { time=2000,onComplete = unTalk } )
                else
                 transition.to( self, { time=400,onComplete = move4 } )
                end
        
             end
            end
        
        
             function castFeather3x(self)
                if self.isDead == false and loading == false then
                    self:setSequence("harpyAttack")
                    self:play()
                    audio.play( soundHarpy)
        
                    local function boom()
                        if self.isDead == false and loading == false then
                castFeather(self)
                 transition.to( fireBall,  { time=1000,x = fireBall.x+ 1000,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =15
                transition.to( fireBall,  { time=1000,x = fireBall.x +1000,y=fireBall.y +300,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =-15
                transition.to( fireBall,  { time=1000,x = fireBall.x +1000,y=fireBall.y -300,onComplete = removeBody } )
                            end
                        end
                    transition.to( self,  { time=700,onComplete = boom } )
                end
        
            end
            function castFeather3xb(self)
                if self.isDead == false and loading == false then
                    self:setSequence("harpyAttack")
                    self:play()
                    audio.play( soundHarpy)
                    self.xScale=-1
        
                    local function boom()
                        if self.isDead == false and loading == false then
                castFeather(self)
                fireBall.rotation =-180
                 transition.to( fireBall,  { time=1000,x = fireBall.x- 1000,onComplete = removeBody } )
                castFeather(self)
                fireBall.xScale=-1
                fireBall.rotation =-30
                transition.to( fireBall,  { time=1000,x = fireBall.x -1000,y=fireBall.y +300,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =30
                fireBall.xScale=-1
                transition.to( fireBall,  { time=1000,x = fireBall.x -1000,y=fireBall.y -300,onComplete = removeBody } )
                    end
                end
                    transition.to( self,  { time=700,onComplete = boom } )
                end
            end

        function ai4()
            if enemy.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 100,onComplete = castFeather3x})
            if didBossTalk==true then
                transition.to( enemy,{time = 500,x=enemy.x +100,onComplete = castFeather3x})
            end

             transition.to( enemy,{time = 1500,onComplete=move4})
            end
            end
        end

        function ai3()
            if enemy.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 100,onComplete = castFeather3x})
            if didBossTalk==true then
                transition.to( enemy,{time = 500,x=enemy.x +100,onComplete = castFeather3x})
            end

             transition.to( enemy,{time = 1000,onComplete=move3})
            end
            end
        end

        function ai2()
            if enemy.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 100,onComplete = castFeather3x})
            if didBossTalk==true then
                transition.to( enemy,{time = 500,x=enemy.x +300,onComplete = castFeather3xb})
            end

             transition.to( enemy,{time = 1000,onComplete=move2})
            end
            end
        end

        function move6()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("harpy")
                enemy:play()
                enemy.rotation=30
                enemy.xScale=1
                local function delay()
             transition.to( enemy,{time = 400,x=centerX+320,y=centerY-50,onComplete=ai})
                end
                transition.to( enemy,{time = 300,onComplete=delay})
            end
        end

        function move5()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("harpy")
                enemy:play()
                enemy.rotation=-30
                enemy.xScale=-1
                local function delay()
             transition.to( enemy,{time = 400,x=centerX-300,y=centerY-50,onComplete=move6})
                end
                transition.to( enemy,{time = 300,onComplete=delay})
            end
        end

        function move4()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("harpy")
                enemy:play()
                enemy.rotation=30
                if didBossTalk==true then
                    transition.to( enemy,{time = 400,x=centerX+320,y=hero.y,onComplete=move5})
                else
                 transition.to( enemy,{time = 400,x=centerX+320,y=hero.y,onComplete=ai})
                end
            end
        end

        function move3()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("harpy")
                enemy:play()

             transition.to( enemy,{time = 500,x=centerX-300,y=centerY-100,onComplete=ai4})
            end
        end

        function move2()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("harpy")
                enemy:play()

             transition.to( enemy,{time = 500,x=spawnPoint7.x,y=spawnPoint7.y,onComplete=ai3})
            end
        end

        function move()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("harpy")
                enemy:play()

             transition.to( enemy,{time = 500,x=spawnPoint5.x,y=spawnPoint5.y,onComplete=ai2})
            end
        end


        function ai()
            if enemy.isDead == false and loading == false then
                enemy.rotation=0
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 100,onComplete = castFeather3x})
            if didBossTalk==true then
                transition.to( enemy,{time = 300,onComplete = castFeather3xb})
            end

             transition.to( enemy,{time = 1500,onComplete=move})
            end
            end
        end


        local function ready( )
            paused = false
    
            transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
            transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
        
            transition.to( enemy, { time=300,onComplete = ai } )

        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                shake(self)
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
  
            ---menu on pause
            transition.to( bossTalk,{time=300,y=centerY-20,x=centerX+75})
            transition.to( bossTalkText,{time=300,y=centerY-20,x=centerX+75})
            bossTalkText.text="have you seen my new form. Brother!"
            local function talk2()
                transition.to( bossTalk,{time=300,y=centerY-30,x=centerX+80})
                transition.to( bossTalkText,{time=300,y=centerY-30,x=centerX+80})
                bossTalkText.text="i will let you taste it "
                transition.to( self, { time=2000,onComplete = ready } )
            end

            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end

        openingTalk(enemy)
                 
        end
    end
    function coleIce(enemy)

        if enemy.isDead == false and loading == false then
        local didBossTalk=false
        enemy.type="coleIce"
        enemy:setSequence("ice")
        enemy:play()
        enemy.xScale=-1
        enemy.kind ="iceBossCole"


        local function unTalk(self )
            paused = false
            transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
        
                    ---menu on unpause
            --hideMenu()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=self.spd,onComplete = boost } )
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
                self:setSequence("ice")
                self:play()
                shake(self)
    
            if didBossTalk==false then
                didBossTalk = true
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
            self.hp =self.maxHp

            transition.to( bossTalk,{time=300,y=centerY-40,x=centerX+75})
            transition.to( bossTalkText,{time=300,y=centerY-40,x=centerX+75})
            bossTalkText.text="Freezing already?"
            local function talk2()
                transition.to( bossTalk,{time=300,y=centerY-50,x=centerX+80})
                transition.to( bossTalkText,{time=300,y=centerY-50,x=centerX+80})
                bossTalkText.text="I am just warming up!"
                transition.to( self, { time=2000,onComplete = unTalk } )
            end

            transition.to( self, { time=2000,onComplete = talk2 } )

            else
             transition.to( self, { time=400,onComplete = boost } )
            end
    
         end
        end

        function IceBlast()
            if enemy.isDead == false and loading == false then
         
                        local function scale(self2)
                           -- self.anchorX =0
                           if enemy.isDead == false and loading == false then
                           display.remove(self2)
                           transition.to (enemy, {time = 400,x=centerX-300,onComplete=ai})
                            --transition.to (self2, {time = 100,yScale=.01,onComplete=removeMe})
                           end
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
                            {name = "blast", start =1,count=11, time =600, loopCount =1}
                    
                          }        
                            -- Display the new sprite at the coordinates passed
                        shoot = display.newSprite(backGroup,mySheet, sequenceData)
                        shoot:setSequence("blast")
                        shoot:play()
                        audio.play( soundIceBlast)
                       -- shoot.anchorX =1
                        shoot.xScale=2
                        shoot.yScale=2
                       -- shoot.rotation=-10
        
                        shoot.x = enemy.x
                        shoot.y = enemy.y
                
                        shoot.myName="spell2"
                        shoot.str =5
                        
                        physics.addBody( shoot, "dynamic",
                        {bounce= 0,radius=200, isSensor = true})
                        shoot.gravityScale=0
        
                    transition.to (shoot, {time = 600 ,onComplete=scale})
                    end
                end

        function boost2()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("iceAttack")
                enemy:play()

            local r = math.random(1,3)
            if r==1 then
                transition.to( enemy,{time = 500,x=hero.x,y=hero.y,onComplete=IceBlast})
            elseif r==2 then
                transition.to( enemy,{time = 500,x=spawnPoint5.x,y=spawnPoint5.y,onComplete=boost})
            else
                transition.to( enemy,{time = 500,x=spawnPoint.x,y=spawnPoint.y,onComplete=boost})
            end
        end
    end

        function boost()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("iceAttack")
                enemy:play()

            local r = math.random(1,3)
            if r==1 then
                transition.to( enemy,{time = 500,x=spawnPoint3.x,y=spawnPoint3.y,onComplete=IceBlast})
            elseif r==2 then
                transition.to( enemy,{time = 500,x=spawnPoint4.x,y=spawnPoint.y,onComplete=boost2})
            else
                transition.to( enemy,{time = 500,x=spawnPoint2.x,y=spawnPoint2.y,onComplete=boost2})
            end
        end
    end


        function move4()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("ice")
                enemy:play()

                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 300,onComplete = castNow})
           -- if didBossTalk==true then
             --   transition.to( enemy,{time = 700,onComplete = castNow})
           -- end

            local r = math.random(1,3)
            if r==1 then
                transition.to( enemy,{time = 1200,x=spawnPoint.x,y=spawnPoint.y,onComplete=move2})
            elseif r==2 then
                transition.to( enemy,{time = 1200,x=spawnPoint3.x,y=spawnPoint3.y,onComplete=move})
            else
                transition.to( enemy,{time = 1200,x=spawnPoint4.x,y=spawnPoint4.y,onComplete=ai})
            end
        end
    end
end

        function move3()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("ice")
                enemy:play()

                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 300,onComplete = castNow})
            if didBossTalk==true then
                transition.to( enemy,{time = 700,onComplete = castNow})
            end

             transition.to( enemy,{time = 1200,x=spawnPoint4.x,y=spawnPoint4.y,onComplete=move4})
            end
        end
    end

        function move2()
            if enemy.isDead == false and loading == false then
                enemy:setSequence("ice")
                enemy:play()

                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 300,onComplete = castNow})
           -- if didBossTalk==true then
            --    transition.to( enemy,{time = 700,onComplete = castNow})
           -- end

             transition.to( enemy,{time = 1200,x=spawnPoint3.x,y=spawnPoint3.y,onComplete=move3})
            end
        end
    end

    function move()
        if enemy.isDead == false and loading == false then
            enemy:setSequence("ice")
            enemy:play()

            if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                bossTalkF(cole)
            else
        transition.to( enemy,{time = 500,onComplete = castNow})

         transition.to( enemy,{time = 1200,x=spawnPoint.x,y=spawnPoint.y,onComplete=move2})
        end
    end
end


        function ai()
            if enemy.isDead == false and loading == false then
                enemy.rotation=0
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else
            transition.to( enemy,{time = 300,onComplete = castNow})
            if didBossTalk==true then
                transition.to( enemy,{time = 700,onComplete = castNow})
            end

             transition.to( enemy,{time = 1500,x=spawnPoint5.x,y=spawnPoint5.y,onComplete=move})
            end
            end
        end

        local function ready( )
            paused = false
    
            transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
            transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
        
            transition.to( enemy, { time=300,onComplete = ai } )

        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                shake(self)
    
            paused = true
  
            ---menu on pause
            transition.to( bossTalk,{time=300,y=centerY-40,x=centerX+75})
            transition.to( bossTalkText,{time=300,y=centerY-40,x=centerX+75})
            bossTalkText.text="Latin de evenyn!!!"
            local function talk2()
                transition.to( bossTalk,{time=300,y=centerY-50,x=centerX+80})
                transition.to( bossTalkText,{time=300,y=centerY-50,x=centerX+80})
                bossTalkText.text="taste the power of the Ice guardian"
                transition.to( self, { time=2000,onComplete = ready } )
            end

            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end

        openingTalk(enemy)

         
        end
    end

    ---------------------------------------------------cole fire------------------------------
    function coleFire(enemy)
        if enemy.isDead == false and loading == false then
            local didBossTalk=false
            enemy.type="coleFire"
            enemy:setSequence("fire")
            enemy:play()
            enemy.xScale=-1
            createWeaponFire()
            
    
    
            local function unTalk(self )
                paused = false
                transition.resume()
                --timer.resume()
                physics.start( )
                physics.setGravity( 0,100)
            
                        ---menu on unpause
                --hideMenu()
                transition.to( bossTalkText,{time=300,y=screenTop-500})
                transition.to( bossTalk,{time=300,y=screenTop-500})
                transition.to( self, { time=300,onComplete = stab } )
            end
        
            function bossTalkF(self)
                if self.isDead == false and loading == false then
                    self:setSequence("fire")
                    self:play()
                    shake(self)
        
                if didBossTalk==false then
                    didBossTalk = true
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
                self.hp =self.maxHp
    
                transition.to( bossTalk,{time=300,y=centerY-40,x=centerX+75})
                transition.to( bossTalkText,{time=300,y=centerY-40,x=centerX+75})
                bossTalkText.text="You are starting to irritate me"
                local function talk2()
                    transition.to( bossTalk,{time=300,y=centerY-50,x=centerX+80})
                    transition.to( bossTalkText,{time=300,y=centerY-50,x=centerX+80})
                    bossTalkText.text="you little insect!!!"
                    transition.to( self, { time=2000,onComplete = unTalk } )
                end
    
                transition.to( self, { time=2000,onComplete = talk2 } )
    
                else
                 transition.to( self, { time=400,onComplete = stab } )
                end
        
             end
            end

            local function removeMe(self)
                display.remove( self )
            end
    
            local function boom(self)
                shake(self)
                local i =0
                while i <8 do
                    i = i +1
                    local shoot

    
                local function castFeather(self)
                    if self.isDead == false and loading == false then
    
                
                        shoot = display.newImageRect( uiGroup2, "images/fireBall1.png", 128,64 )

                        shoot.myName="spell"
                        shoot.str =5
                        shoot.spd=2000
                
                        shoot.x = self.x
                        shoot.y = self.y-10
                        
                        physics.addBody( shoot, "dynamic",
                        {bounce= 0,box={ halfWidth=30, halfHeight=25, x=30, y=0 }, isSensor = true})
                        shoot.gravityScale =0                
                 
                        end
                    end
                    castFeather(self)
    
                if i == 1 then
                    transition.to (shoot, {time = 1000,x = shoot.x+1000,onComplete=removeMe})
                elseif i == 2 then
                    shoot.xScale=-1
                    transition.to (shoot, {time = 1000,x = shoot.x-1000,onComplete=removeMe})
                elseif i == 3 then
                    shoot.rotation=90
                    transition.to (shoot, {time = 1000,y = shoot.y+1000,onComplete=removeMe})
                elseif i == 4 then
                    shoot.rotation=-90
                    transition.to (shoot, {time = 1000,y = shoot.y-1000,onComplete=removeMe})
                elseif i == 5 then
                    shoot.rotation=45
                    transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y+1000,onComplete=removeMe})
                elseif i == 6 then
                    shoot.rotation=135
                    transition.to (shoot, {time = 1000,x = shoot.x-1000,y = shoot.y+1000,onComplete=removeMe})
                elseif i == 7 then
                    shoot.rotation=-45
                    transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y-1000,onComplete=removeMe})
                elseif i == 8 then
                    shoot.rotation=-135
                    transition.to (shoot, {time = 1000,x = shoot.x-1000,y = shoot.y-1000,onComplete=removeMe})
                end
            end
        end

        function slam3()
            if enemy.isDead == false and loading == false then
            audio.play( soundExplode)
             transition.to( enemy,{time = 400,x=spawnPoint2.x,y=spawnPoint2.y+50,transition=easing.inQuint,onComplete=boom})
             transition.to( fireSword,{time = 300,x=spawnPoint4.x,y=spawnPoint4.y+150,transition=easing.inQuint,onComplete=boom})
             transition.to( fireSwordr,{time = 300,x=spawnPoint.x-20,y=spawnPoint.y+150,transition=easing.inQuint,onComplete=boom})

             transition.to( enemy,{time = 1000,onComplete=ai})
            end
        end

        function b4slam3()
            if enemy.isDead == false and loading == false then

             transition.to( enemy,{time = 350,x=spawnPoint2.x,y=spawnPoint2.y-120,onComplete=slam3})
             transition.to( fireSword,{time = 250,x=spawnPoint4.x,y=spawnPoint4.y-100})
             transition.to( fireSwordr,{time = 250,x=spawnPoint.x-20,y=spawnPoint.y-100})
            end
        end

        function back2()
            if enemy.isDead == false and loading == false then
             transition.to( enemy,{time = 700,x=spawnPoint2.x,y=spawnPoint2.y-100,onComplete=b4slam3})
             transition.to( fireSword,{time = 600,x=spawnPoint4.x,y=spawnPoint4.y-60})
             transition.to( fireSwordr,{time = 600,x=spawnPoint.x-20,y=spawnPoint.y-60})

            end
        end

        function back()
            if enemy.isDead == false and loading == false then

             transition.to( enemy,{time = 1500,x=spawnPoint5.x,y=spawnPoint5.y-20,onComplete=back2})
             transition.to( fireSword,{time = 1200,x=spawnPoint5.x-40,y=spawnPoint5.y-20})
             transition.to( fireSwordr,{time = 1200,x=spawnPoint5.x+40,y=spawnPoint5.y-20})
 
            end
        end

        function slash()

            if enemy.isDead == false and loading == false then
                audio.play( soundExplode)
                transition.to( enemy,{time = 400,x=spawnPoint5.x,onComplete=back})
                transition.to( fireSword,{time = 300,x=centerX+350,transition=easing.inQuint,onComplete=boom})
             transition.to( fireSwordr,{time = 300,x=centerX+400,transition=easing.inQuint,onComplete=boom})
            end
        end

        function b4stab()
            if enemy.isDead == false and loading == false then
                enemy.rotation=0
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else


             transition.to( enemy,{time = 300,x=spawnPoint5.x-20,y=spawnPoint5.y-20,onComplete=slash})
             transition.to( fireSword,{time = 200,x=spawnPoint5.x-100,y=spawnPoint5.y-20})
             transition.to( fireSwordr,{time = 200,x=spawnPoint5.x-40,y=spawnPoint5.y-20})
                 end
            end
        end

        function stab()
            if enemy.isDead == false and loading == false then
                enemy.rotation=0
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else


             transition.to( enemy,{time = 700,x=spawnPoint5.x,y=spawnPoint5.y-20,onComplete=b4stab})
             transition.to( fireSword,{time = 600,x=spawnPoint5.x-40,y=spawnPoint5.y-20})
             transition.to( fireSwordr,{time = 600,x=spawnPoint5.x+40,y=spawnPoint5.y-20})
                 end
            end
        end

            function slam2()

                if enemy.isDead == false and loading == false then
                    enemy.rotation=0
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
                        audio.play( soundExplode)
    
 
                 if didBossTalk==true then
                    transition.to( enemy,{time = 400,x=spawnPoint3.x-100,y=spawnPoint3.y-40,onComplete=stab})
                    transition.to( fireSword,{time = 300,x=spawnPoint3.x,y=spawnPoint3.y+20,transition=easing.inQuint,onComplete=boom})
                 else
                    transition.to( enemy,{time = 400,x=spawnPoint3.x-100,y=spawnPoint3.y-40,onComplete=ai})
                    transition.to( fireSword,{time = 300,x=spawnPoint3.x,y=spawnPoint3.y+20,transition=easing.inQuint})
                 end
                 transition.to( fireSwordr,{time = 300,x=spawnPoint3.x+30,y=spawnPoint3.y+20,transition=easing.inQuint,onComplete=boom})
                     end
                end
            end

            function b4slam2()

                if enemy.isDead == false and loading == false then
                    enemy.rotation=0
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
    
    
                 transition.to( enemy,{time = 400,x=spawnPoint3.x-100,y=spawnPoint3.y-10,onComplete=slam2})
                 if didBossTalk==true then
                    transition.to( fireSword,{time = 300,x=spawnPoint3.x-130,y=spawnPoint3.y-100,transition=easing.inQuint})
                 else
                    transition.to( fireSword,{time = 300,x=spawnPoint3.x-130,y=spawnPoint3.y-100,transition=easing.inQuint})
                 end
                 transition.to( fireSwordr,{time = 300,x=spawnPoint3.x-30,y=spawnPoint3.y-100,transition=easing.inQuint})
                     end
                end
            end

            function ai2()
                if enemy.isDead == false and loading == false then
                    enemy.rotation=0
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
    
    
                 transition.to( enemy,{time = 700,x=spawnPoint3.x-100,y=spawnPoint3.y-20,onComplete=b4slam2})
                 transition.to( fireSword,{time = 600,x=spawnPoint3.x-120,y=spawnPoint3.y-60})
                 transition.to( fireSwordr,{time = 600,x=spawnPoint3.x-20,y=spawnPoint3.y-60})
                     end
                end
            end


        
            function slam()

                if enemy.isDead == false and loading == false then
                    enemy.rotation=0
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
    
                        audio.play( soundExplode)
                 transition.to( enemy,{time = 400,x=spawnPoint2.x-100,y=spawnPoint2.y-40,onComplete=ai2})
                 if didBossTalk==true then
                    transition.to( fireSword,{time = 300,x=spawnPoint2.x,y=spawnPoint2.y+20,transition=easing.inQuint,onComplete=boom})
                 else
                    transition.to( fireSword,{time = 300,x=spawnPoint2.x,y=spawnPoint2.y+20,transition=easing.inQuint})
                 end
                 transition.to( fireSwordr,{time = 300,x=spawnPoint2.x+30,y=spawnPoint2.y+20,transition=easing.inQuint,onComplete=boom})
                    end
                end
            end

            function b4slam()

                if enemy.isDead == false and loading == false then
                    enemy.rotation=0
                    if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                        bossTalkF(cole)
                    else
    
    
                 transition.to( enemy,{time = 400,x=spawnPoint2.x-100,y=spawnPoint2.y-10,onComplete=slam})
                 if didBossTalk==true then
                    transition.to( fireSword,{time = 300,x=spawnPoint2.x-130,y=spawnPoint2.y-100,transition=easing.inQuint})
                 else
                    transition.to( fireSword,{time = 300,x=spawnPoint2.x-130,y=spawnPoint2.y-100,transition=easing.inQuint})
                 end
                 transition.to( fireSwordr,{time = 300,x=spawnPoint2.x-30,y=spawnPoint2.y-100,transition=easing.inQuint})
                    end
                end
            end
         

        function ai()
            if enemy.isDead == false and loading == false then
                enemy.rotation=0
                if cole.hp < cole.maxHp*.5 and didBossTalk ==false then
                    bossTalkF(cole)
                else


                 transition.to( enemy,{time = 600,x=spawnPoint2.x-100,y=spawnPoint2.y-20,onComplete=b4slam})
                 transition.to( fireSword,{time = 500,x=spawnPoint2.x-120,y=spawnPoint2.y-10})
                 transition.to( fireSwordr,{time = 500,x=spawnPoint2.x-20,y=spawnPoint2.y-10})
                 end
            end
        end

        local function ready( )
            paused = false
    
            transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
            transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
        
            transition.to( enemy, { time=300,onComplete = ai } )

        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                shake(self)   
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
  
            ---menu on pause
            transition.to( bossTalk,{time=300,y=centerY-40,x=centerX+75})
            transition.to( bossTalkText,{time=300,y=centerY-40,x=centerX+75})
            bossTalkText.text="How about some heat Drakz?"
            local function talk2()
                transition.to( bossTalk,{time=300,y=centerY-50,x=centerX+80})
                transition.to( bossTalkText,{time=300,y=centerY-50,x=centerX+80})
                bossTalkText.text="remember our barbeque's"
                transition.to( self, { time=2000,onComplete = ready } )
            end

            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end

        openingTalk(enemy)
         
        end
    end

    ---------------------------------------allform cole-----------------------------
    function coleAllForm(enemy)
        if enemy.isDead == false and loading == false then

        enemy.type="coleAllForm"
        enemy:setSequence("idle")
        enemy:play()
        enemy.xScale=-1
        enemy.x = spawnPoint.x
        enemy.y = spawnPoint.y


        createWeaponGun()
        gunSword.xScale =1

        local ai
        local didBossTalk = false
        local shooting
        local iceForm
        local toCast
        local fire1
        local harpy1

        local function castFeather(self)
            if self.isDead == false and loading == false then
                self:setSequence("fly")
                self:play()
                shake(self)
                
        
            local spriteOptions = {
                height = 64,
                width = 128,
                numFrames = 5,
                sheetContentWidth = 256,
                sheetContentHeight = 192
              }
              local mySheet = graphics.newImageSheet("images/harpyBall.png", spriteOptions)
              local sequenceData = {
                {name = "fire", start =1,count=5, time =math.random(300,500), loopCount =0}
        
              }
                 
                -- Display the new sprite at the coordinates passed
             fireBall = display.newSprite(backGroup,mySheet, sequenceData)
                fireBall:setSequence("fire")
                 fireBall:play()
                 audio.play( soundFireBall)
        
                fireBall.myName="spell"
                fireBall.str =5
                fireBall.spd=2000
        
                fireBall.x = self.x
                fireBall.y = self.y-10
                
                physics.addBody( fireBall, "dynamic",
                {bounce= 0,box={ halfWidth=30, halfHeight=25, x=30, y=0 }, isSensor = true})
                fireBall.gravityScale =0
                fireBall.isBullet = true
            
         
                end
            end
        
            local function removeBody(self)
                self.attacked = false
                display.remove( self )
            end
               
             function castFeather3x(self)
                if self.isDead == false and loading == false then
                    self:setSequence("harpyAttack")
                    self:play()
                    audio.play( soundHarpy)
        
                    local function boom()
                        if self.isDead == false and loading == false then
                castFeather(self)
                 transition.to( fireBall,  { time=1000,x = fireBall.x+ 1000,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =15
                transition.to( fireBall,  { time=1000,x = fireBall.x +1000,y=fireBall.y +300,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =-15
                transition.to( fireBall,  { time=1000,x = fireBall.x +1000,y=fireBall.y -300,onComplete = removeBody } )
                            end
                        end
                    transition.to( self,  { time=400,onComplete = boom } )
                end
        
            end
            function castFeather3xb(self)
                if self.isDead == false and loading == false then
                    self:setSequence("harpyAttack")
                    self:play()
                    audio.play( soundHarpy)
        
                    local function boom()
                        if self.isDead == false and loading == false then
                castFeather(self)
                fireBall.rotation =90
                 transition.to( fireBall,  { time=1000,y = fireBall.y+ 1000,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =-70
                fireBall.xScale=-1
                transition.to( fireBall,  { time=1000,x = fireBall.x -300,y=fireBall.y +1000,onComplete = removeBody } )
                castFeather(self)
                fireBall.rotation =70
                transition.to( fireBall,  { time=1000,x = fireBall.x +300,y=fireBall.y +1000,onComplete = removeBody } )
                    end
                end
                    transition.to( self,  { time=400,onComplete = boom } )
                end
            end

            function del(self)
                if self.isDead == false and loading == false then
                    self.rotation=-30
                    self.xScale=1

                    transition.to( self,{time = 700,x=spawnPoint.x,y=spawnPoint.y,onComplete=harpy1})
    
                end
            end

            function harpy4(self)
                if self.isDead == false and loading == false then
                    self.rotation=30
                    self.xScale=-1

                    transition.to( self,{time = 700,y=hero.y,x=spawnPoint6.x+100,onComplete=del})
    
                end
            end

            function harpy3(self)
                if self.isDead == false and loading == false then
                    self.rotation=0
                    self.xScale=-1
                    transition.to( self,{time = 500,onComplete=castFeather3x})
                    transition.to( self,{time = 1200,y=spawnPoint.y+100,x=spawnPoint7.x-170,onComplete=harpy4})
    
                end
            end

            function harpy2(self)
                if self.isDead == false and loading == false then
                    self.rotation=-25
                    self.xScale=1
                    transition.to( self,{time = 300,onComplete=castFeather3xb})
                    transition.to( self,{time = 800,onComplete=castFeather3xb})
                    transition.to( self,{time = 1500,x=spawnPoint7.x-150,y=spawnPoint7.y,onComplete=harpy3})
    
                end
            end

        function harpy1(self)
            if self.isDead == false and loading == false then
                self.rotation=25
                self.xScale=-1
                transition.to( self,{time = 300,onComplete=castFeather3xb})
                transition.to( self,{time = 800,onComplete=castFeather3xb})
                transition.to( self,{time = 1500,x=spawnPoint8.x+100,y=spawnPoint8.y,onComplete=harpy2})

            end
        end

        function harpyForm(self)
            if self.isDead == false and loading == false then
                self:setSequence("harpy")
                self:play()
                self.xScale=-1
                self.kind="harpyBossCole"
                createBuble(self)
                display.remove(fireSword)
                display.remove(fireSwordr)
    
             transition.to( self, { time=500,x=spawnPoint7.x-100,y=spawnPoint7.y,onComplete = harpy1 } )
            end
        end


        local function unTalk3( )
            paused = false

            createCrate()
            enemy.x = spawnPoint6.x+math.random(50,100)
            enemy.y = spawnPoint6.y
    
            transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
            transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
        
            transition.to( enemy, { time=300,onComplete = harpyForm } )
        end
    
        function bossTalkF3(self)
            if self.isDead == false and loading == false then
                self:setSequence("fire")
                self:play()
                shake(self)
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
    
            transition.to( bossTalk,{time=300,y=centerY,x=centerX})
            transition.to( bossTalkText,{time=300,y=centerY,x=centerX})
            bossTalkText.text="Die! you insignificant reaper"
    
            self.hp =self.maxHp
    
            transition.to( self, { time=2000,onComplete = unTalk3 } )
    
         end
        end

        local function removeMe(self)
            display.remove( self )
        end

        local function boom(self)
            shake(self)
            local i =0
            while i <8 do
                i = i +1
                local shoot


            local function castFeather(self)
                if self.isDead == false and loading == false then

            
                    shoot = display.newImageRect( uiGroup2, "images/fireBall1.png", 128,64 )
            
                    shoot.myName="spell"
                    shoot.str =4
                    shoot.spd=2000
            
                    shoot.x = self.x
                    shoot.y = self.y-10
                    
                    physics.addBody( shoot, "dynamic",
                    {bounce= 0,box={ halfWidth=32, halfHeight=32, x=30, y=0 }, isSensor = true})
                    shoot.gravityScale =0                
             
                    end
                end
                castFeather(self)

            if i == 1 then
                transition.to (shoot, {time = 1000,x = shoot.x+1000,onComplete=removeMe})
            elseif i == 2 then
                shoot.xScale=-1
                transition.to (shoot, {time = 1000,x = shoot.x-1000,onComplete=removeMe})
            elseif i == 3 then
                shoot.rotation=90
                transition.to (shoot, {time = 1000,y = shoot.y+1000,onComplete=removeMe})
            elseif i == 4 then
                shoot.rotation=-90
                transition.to (shoot, {time = 1000,y = shoot.y-1000,onComplete=removeMe})
            elseif i == 5 then
                shoot.rotation=45
                transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y+1000,onComplete=removeMe})
            elseif i == 6 then
                shoot.rotation=135
                transition.to (shoot, {time = 1000,x = shoot.x-1000,y = shoot.y+1000,onComplete=removeMe})
            elseif i == 7 then
                shoot.rotation=-45
                transition.to (shoot, {time = 1000,x = shoot.x+1000,y = shoot.y-1000,onComplete=removeMe})
            elseif i == 8 then
                shoot.rotation=-135
                transition.to (shoot, {time = 1000,x = shoot.x-1000,y = shoot.y-1000,onComplete=removeMe})
            end
        end
    end

    function golrb(self)

        if self.isDead == false and loading == false then
            self.rotation=0
            if cole.hp < cole.maxHp*.5 then
                bossTalkF3(cole)
            else
                self:setSequence("fireAttack")
                self:play()

        transition.to( self,{time = 600,onComplete=fire1})

        transition.to( fireSword,{time = 500,x=spawnPoint7.x-140,y=spawnPoint7.y-10})
            end
        end
    end

    function golr(self)

        if self.isDead == false and loading == false then
            self.rotation=0
            if cole.hp < cole.maxHp*.5 then
                bossTalkF3(cole)
            else
                self:setSequence("fireAttack")
                self:play()
                audio.play( soundExplode)
        transition.to( self,{time = 550,onComplete=golrb})

        transition.to( fireSwordr,{time = 500,x=spawnPoint6.x,y=spawnPoint6.y,transition=easing.inQuint,onComplete=boom})
            end
        end
    end

    function golb(self)

        if self.isDead == false and loading == false then
            self.rotation=0
            if cole.hp < cole.maxHp*.5 then
                bossTalkF3(cole)
            else
                self:setSequence("fireAttack")
                self:play()

        transition.to( self,{time = 600,onComplete=golr})

        transition.to( fireSword,{time = 500,x=spawnPoint7.x-140,y=spawnPoint7.y-10})
            end
        end
    end

    function gol(self)

        if self.isDead == false and loading == false then
            self.rotation=0
            if cole.hp < cole.maxHp*.5 then
                bossTalkF3(cole)
            else
                self:setSequence("fireAttack")
                self:play()
                audio.play( soundExplode)
        transition.to( self,{time = 550,onComplete=golb})

        transition.to( fireSword,{time = 500,x=spawnPoint3.x,y=spawnPoint3.y,transition=easing.inQuint,onComplete=boom})
            end
        end
    end

    function fire3(self)
        if self.isDead == false and loading == false then
            if cole.hp < cole.maxHp*.5  then
                bossTalkF3(cole)
            else
            self:setSequence("fire")
            self:play()

            transition.to( self,{time = 600,x=spawnPoint7.x-100,y=spawnPoint7.y-20,onComplete=gol})
            transition.to( fireSword,{time = 500,x=spawnPoint7.x-140,y=spawnPoint7.y-10})
            transition.to( fireSwordr,{time = 500,x=spawnPoint7.x-60,y=spawnPoint7.y-10})
            end
        end
    end

        function slam2(self)

            if self.isDead == false and loading == false then
                self.rotation=0
                if cole.hp < cole.maxHp*.5 then
                    bossTalkF3(cole)
                else
                    self:setSequence("fireAttack")
                    self:play()
                    audio.play( soundExplode)

            transition.to( self,{time = 400,x=spawnPoint5.x+100,y=spawnPoint5.y-10,onComplete=fire3})

            transition.to( fireSword,{time = 300,x=spawnPoint5.x - math.random(0,100),y=spawnPoint5.y+20,transition=easing.inQuint,onComplete=boom})
            transition.to( fireSwordr,{time = 300,x=spawnPoint6.x + math.random(0,100),y=spawnPoint6.y+20,transition=easing.inQuint,onComplete=boom})
                end
            end
        end

        function b4slam2(self)

            if self.isDead == false and loading == false then
                self.rotation=0
                if cole.hp < cole.maxHp*.5 then
                    bossTalkF3(cole)
                else
                    self:setSequence("fire")
                    self:play()


            transition.to( self,{time = 500,x=spawnPoint5.x+100,y=spawnPoint5.y-70,onComplete=slam2})

            transition.to( fireSword,{time = 400,x=spawnPoint5.x-50,y=spawnPoint5.y-150,transition=easing.inQuint})
            transition.to( fireSwordr,{time = 400,x=spawnPoint6.x+20,y=spawnPoint6.y-150,transition=easing.inQuint})
                end
            end
        end

        function fire2(self)
            if self.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5  then
                    bossTalkF3(cole)
                else
                self:setSequence("fire")
                self:play()

                transition.to( self,{time = 700,x=spawnPoint5.x+100,y=spawnPoint5.y-20,onComplete=b4slam2})
                transition.to( fireSword,{time = 600,x=spawnPoint5.x-50,y=spawnPoint5.y-10})
                transition.to( fireSwordr,{time = 600,x=spawnPoint6.x+20,y=spawnPoint6.y-10})
                end
            end
        end

        function slam(self)

            if self.isDead == false and loading == false then
                self.rotation=0
                if cole.hp < cole.maxHp*.5  then
                    bossTalkF3(cole)
                else
                    self:setSequence("fireAttack")
                    self:play()
                    audio.play( soundExplode)

            transition.to( self,{time = 400,x=spawnPoint3.x+100,y=spawnPoint3.y-10,onComplete=fire2})

            transition.to( fireSword,{time = 300,x=spawnPoint3.x-50,y=spawnPoint3.y+20,transition=easing.inQuint,onComplete=boom})
            transition.to( fireSwordr,{time = 300,x=spawnPoint4.x+20,y=spawnPoint4.y+20,transition=easing.inQuint,onComplete=boom})
                end
            end
        end

        function b4slam(self)

            if self.isDead == false and loading == false then
                self.rotation=0
                if cole.hp < cole.maxHp*.5 then
                    bossTalkF3(cole)
                else
                    self:setSequence("fire")
                    self:play()

            transition.to( self,{time = 500,x=spawnPoint3.x+100,y=spawnPoint3.y-40,onComplete=slam})

            transition.to( fireSword,{time = 400,x=spawnPoint3.x-50,y=spawnPoint3.y-100,transition=easing.inQuint})
            transition.to( fireSwordr,{time = 400,x=spawnPoint4.x+20,y=spawnPoint4.y-100,transition=easing.inQuint})
                end
            end
        end

        function fire1(self)
            if self.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5  then
                    bossTalkF3(cole)
                else
                self:setSequence("fire")
                self:play()

                transition.to( enemy,{time = 700,x=spawnPoint3.x+100,y=spawnPoint3.y-20,onComplete=b4slam})
                transition.to( fireSword,{time = 600,x=spawnPoint3.x-50,y=spawnPoint3.y-10})
                transition.to( fireSwordr,{time = 600,x=spawnPoint4.x+20,y=spawnPoint4.y-10})
                end
            end
        end

        function fireForm(self)
            if self.isDead == false and loading == false then
                self:setSequence("fire")
                self:play()
                self.xScale=-1
                self.kind="fireBossCole"
                createBuble(self)
                createWeaponFire()
    
             transition.to( self, { time=500,onComplete = fire1 } )
            end
        end

        local function unTalk2( )
            paused = false

            createCrate()
            enemy.x = spawnPoint5.x+math.random(0,50)
            enemy.y = spawnPoint5.y
    
            transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
            transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
        
            transition.to( enemy, { time=300,onComplete = fireForm } )
        end
    
        function bossTalkF2(self)
            if self.isDead == false and loading == false then
                self:setSequence("ice")
                self:play()
                shake(self)
                self.talking =true
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
    
            transition.to( bossTalk,{time=300,y=centerY,x=centerX})
            transition.to( bossTalkText,{time=300,y=centerY,x=centerX})
            bossTalkText.text="HAHAHAHa feel my power Drakz!"
    
            self.hp =self.maxHp
    
            transition.to( self, { time=2000,onComplete = unTalk2 } )
    
         end
        end

        function IceBlast(enemy)
            if enemy.isDead == false and loading == false then
         
                        local function scale(self2)
                           -- self.anchorX =0
                           if enemy.isDead == false and loading == false then
                           display.remove(self2)
                           transition.to (enemy, {time = 800,x=centerX-300,onComplete=toCast})
                            --transition.to (self2, {time = 100,yScale=.01,onComplete=removeMe})
                           end
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
                            {name = "blast", start =1,count=11, time =600, loopCount =1}
                    
                          }        
                            -- Display the new sprite at the coordinates passed
                       local shoot = display.newSprite(backGroup,mySheet, sequenceData)
                        shoot:setSequence("blast")
                        shoot:play()
                        audio.play( soundIceBlast)
                       -- shoot.anchorX =1
                        shoot.xScale=2
                        shoot.yScale=2
                       -- shoot.rotation=-10
        
                        shoot.x = enemy.x
                        shoot.y = enemy.y
                
                        shoot.myName="spell2"
                        shoot.str =5
                        
                        physics.addBody( shoot, "dynamic",
                        {bounce= 0,radius=200, isSensor = true})
                        shoot.gravityScale=0
        
                    transition.to (shoot, {time = 600 ,onComplete=scale})
                    end
                end

        local function toCast3(self)
            if self.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5  then
                    bossTalkF2(cole)
                else
                self:setSequence("iceAttack")
                self:play()
                transition.to( enemy, { time=500,x=hero.x-30,y=hero.y, onComplete = IceBlast } )
                end
            end
        end

        local function toCast2(self)
            if self.isDead == false and loading == false then
                self:setSequence("iceAttack")
                self:play()
               -- castNow(self)
                transition.to( enemy, { time=300,x=spawnPoint5.x,y=spawnPoint5.y, onComplete = castNow } )
                transition.to( enemy, { time=1000, onComplete = toCast3 } )
            end
        end


        function toCast(self)
            if self.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5  then
                    bossTalkF2(cole)
                else
                self:setSequence("iceAttack")
                self:play()
                castNow(self)
                transition.to( enemy, { time=300,x=spawnPoint7.x,y=spawnPoint7.y, onComplete = castNow } )
                transition.to( enemy, { time=1000,onComplete = toCast2 } )
                end
            end
        end


        function iceForm(self)
            if self.isDead == false and loading == false then
                self:setSequence("ice")
                self:play()
                self.xScale=-1
                self.kind="iceBossCole"
                createBuble(self)
                coleHasWeapon = false
                gunSword.y=screenTop-100
    
             transition.to( self, { time=500,onComplete = toCast } )
            end
        end


     local function unTalk( )
        paused = false

        createCrate()
        enemy.x = hero.x+math.random(0,50)
        enemy.y = spawnPoint6.y


        transition.to( bossTalk,{time=300,y=screenTop - 200,x=centerX-100})
        transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
    
        transition.to( enemy, { time=300,onComplete = iceForm } )
    end

    function bossTalkF(self)
        if self.isDead == false and loading == false then
            self:setSequence("idle")
            self:play()
            shake(self)
        paused = true

        readyToMove = false
        boomStick.x = screenLeft-100
        boomStick.y = centerY
        boomDot.x = screenLeft-100
        boomDot.y = centerY
        moveNow ="stop"
        moveNow2 ="stop"

        transition.to( bossTalk,{time=300,y=centerY,x=centerX})
        transition.to( bossTalkText,{time=300,y=centerY,x=centerX})
        bossTalkText.text="you are always scared of cold"

        self.hp =self.maxHp

        transition.to( self, { time=2000,onComplete = unTalk } )

     end
    end

         function shooting()

                local shoot = display.newImageRect( uiGroup, "images/bullet.png", 16,16 )

                shoot.myName="bullet"
                shoot.str =5
                audio.play( soundBullet)
                
                physics.addBody( shoot, "dynamic",
                {bounce= 0, radius=10, isSensor = true})
                
                shoot.isBullet = true
                shoot.gravityScale =0
        
        

                    shoot.x = enemy.x-25
                    shoot.y = enemy.y+30
                    transition.to( shoot,{time = 900,x=shoot.x +1000,onComplete=
                    function()display.remove( shoot ) end })--end of hitting code

        end

        local function attacking()
            if enemy.isDead == false and loading == false then

            enemy:setSequence("attack")
            enemy:play()
            cole.xScale=1

            gunSword:setSequence("attack")
            gunSword:play()

            local shoot = display.newCircle(mainGroup, cole.x+60, cole.y, 60 )

            shoot.myName="bullet"
            shoot.str =5
            shoot.alpha=0
            audio.play( soundAttack)
            
            physics.addBody( shoot, "dynamic",
            {bounce= 0, radius=60, isSensor = true})
            
            shoot.gravityScale =0
    

                transition.to( shoot,{time = 500,onComplete=
                function()display.remove( shoot ) end })--end of hitting code
       end
    end

    local jump


   local function run3()
        if enemy.isDead == false and loading == false then
            gunSword:setSequence("idle")
            gunSword:play()
            enemy:setSequence("run")
            enemy:play()
            cole.xScale=-1
            cole.gravityScale =0

            transition.to( enemy,{time = 600,x=hero.x-30,y=hero.y,onComplete=attacking})
            transition.to( enemy,{time = 1200,onComplete=jump})
        end
    end

      local  function a2()
            if enemy.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5 then
                    bossTalkF(cole)
                else
            gunSword:setSequence("shoot")
            gunSword:play()
            enemy:setSequence("idle")
            enemy:play()
            cole.xScale=-1
           -- shooting()
            transition.to( enemy,{time = 700,onComplete = shooting})
            transition.to( enemy,{time = 850,onComplete = shooting})
            transition.to( enemy,{time = 1100,onComplete = shooting})

             transition.to( enemy,{time = 1800,onComplete=run3})
            end
            end
        end

         local   function run2()
                if enemy.isDead == false and loading == false then
                    enemy:setSequence("run")
                    enemy:play()
                    cole.xScale=1
                    cole.gravityScale =0

                    transition.to( enemy, { time=800,x=spawnPoint.x,y=spawnPoint.y, onComplete = a2 } )
                    --transition.to( enemy,{time = 1500,onComplete=ai3})
                end
            end

         local   function run()
                if enemy.isDead == false and loading == false then
                    gunSword:setSequence("idle")
                    gunSword:play()
                    enemy:setSequence("run")
                    enemy:play()
                    cole.xScale=-1
                    cole.gravityScale =0

                    transition.to( enemy,{time = 600,x=hero.x-30,y=hero.y,onComplete=attacking})
                    transition.to( enemy,{time = 1200,onComplete=run2})
                end
            end


      local  function ai()
            if enemy.isDead == false and loading == false then
                if cole.hp < cole.maxHp*.5 then
                    bossTalkF(cole)
                else
            gunSword:setSequence("shoot")
            gunSword:play()
            enemy:setSequence("idle")
            enemy:play()
            cole.xScale=-1
           -- shooting()
            transition.to( enemy,{time = 700,onComplete = shooting})
            transition.to( enemy,{time = 850,onComplete = shooting})
            transition.to( enemy,{time = 1100,onComplete = shooting})

             transition.to( enemy,{time = 1800,onComplete=run})
            end
            end
        end

         function jump()
            if cole.isDead == false and loading == false then
                enemy:setSequence("jump")
                enemy:play()
            transition.to( enemy, { time=500,x=spawnPoint2.x,y=spawnPoint2.y, onComplete = ai } )
            end
        end

        local function ready( )
            paused = false
    
            transition.to( heroTalk,{time=300,y=screenTop - 200,x=centerX-100})
            transition.to( bossTalkText,{time=300,y=screenTop-200,x=centerX-100})
        
            transition.to( enemy, { time=300,onComplete = jump } )

        end
    
        function openingTalk(self)
            if self.isDead == false and loading == false then
                shake(self)   
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
  
            ---menu on pause
            transition.to( bossTalk,{time=300,y=centerY+220,x=centerX+10})
            transition.to( bossTalkText,{time=300,y=centerY+220,x=centerX+10})
            bossTalkText.text="Drakz! drakz! drakz!"

            local function talk3()
                transition.to( bossTalk,{time=100,y=screenTop-500,x=centerX})
                transition.to(heroTalk,{time=100,y=centerY,x=centerX+10})
                transition.to( bossTalkText,{time=100,y=centerY,x=centerX+10})
                bossTalkText.text="I'm here to stop your Madness cole."
                transition.to( self, { time=3000,onComplete = ready } )
            end

            local function talk2()
                transition.to( bossTalk,{time=300,y=centerY+220,x=centerX})
                transition.to( bossTalkText,{time=300,y=centerY+220,x=centerX})
                bossTalkText.text="you really want to die"
                transition.to( self, { time=2000,onComplete = talk3 } )
            end

            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end

        openingTalk(enemy)
        cole.maxHp = 320
        cole.hp = 320
         
        end
    end

    ---------------------cole end talk-----------------

    function coleTalk(self)

        local function removeMe(self)
            coleIsAlive = false

            display.remove(self)
        end

        local function boom(self)

            createBuble(stoneBarrier2)
            display.remove(stoneBarrier2)
            audio.play( soundStone)

            transition.to( self, { time=600,x=barrier2.x,y= barrier2.y+500,onComplete=removeMe } )

        end


        local function unTalk(self )
            paused = false
            --transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
        
                    ---menu on unpause
            --hideMenu()
            self.isDead = true
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=600,x=barrier2.x,y= barrier2.y,onComplete=boom } )
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
           -- transition.pause()
            --timer.pause()
            physics.pause( )
            physics.setGravity( 0,0)
    
            ---menu on pause
            transition.to( self, { time=500,y=centerY-200,x=centerX+380})
            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="You're weak Drakz, you are nothing!"

            local function talk2(self)
                transition.to( self, { time=300,y=centerY-150,x=centerX+400})
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="You're strength means nothing!"
                transition.to( self, { time=2000,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("idle")
        self:play()

    end

    function coleTalk2(self)

        local function removeMe(self)
            coleIsAlive = false
           -- self.isDead = true
            display.remove(self)
        end

        local function boom(self)

            createBuble(stoneBarrier2)
            display.remove(stoneBarrier2)
            audio.play( soundStone)

            transition.to( self, { time=600,x=barrier2.x-500,y= barrier2.y,onComplete=removeMe } )

        end


        local function unTalk(self )
            paused = false
            --transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
        
                    ---menu on unpause
            --hideMenu()
            self.isDead = true
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=600,x=barrier2.x,y= barrier2.y,onComplete=boom } )
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
           -- transition.pause()
            --timer.pause()
            physics.pause( )
            physics.setGravity( 0,0)
    
            ---menu on pause
            transition.to( self, { time=500,y=centerY-140,x=centerX-260})
            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="you have'nt seen the best of me yet"

            local function talk2(self)
                transition.to( self, { time=300,y=centerY-150,x=centerX-250})
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="catch me if you can"
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("harpy")
        self:play()

    end

    function coleTalk3(self)

        local function unTalk2()
            paused = false
            --transition.resume()
            --timer.resume()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end

        local function removeMe(self)
            coleIsAlive = false
           -- self.isDead = true
            display.remove(self)


            transition.to( heroTalk,{time=300,y=centerY+150,x=centerX+80})
            transition.to( bossTalkText,{time=300,y=centerY+150,x=centerX+80})
            bossTalkText.text="AN ice Wall. it'll take a larger fireball"

            local function talk3()
                transition.to( heroTalk,{time=300,y=centerY+150,x=centerX+90})
                transition.to( bossTalkText,{time=300,y=centerY+150,x=centerX+90})
                bossTalkText.text="to bring this down"
                transition.to( self, { time=3000,onComplete = unTalk2 } )
            end

            local function talk2()
                transition.to( heroTalk,{time=300,y=centerY+150,x=centerX+100})
                transition.to( bossTalkText,{time=300,y=centerY+150,x=centerX+100})
                bossTalkText.text="i need to have the Super Fireball Ability"
                transition.to( self, { time=2000,onComplete = talk3 } )
            end
            
            transition.to( hero, { time=2000,onComplete = talk2 } )

            
        end

        local function boom(self)
            paused = true

            createBuble(stoneBarrier2)
            display.remove(stoneBarrier2)
            audio.play( soundStone)

            transition.to( self, { time=1000,x=barrier2.x-500,y= barrier2.y,onComplete=removeMe } )

        end

        local function iceWall2(self)
            createWall()

            gameStatus.iceWallisOn = 1
            saveScores()
            transition.to( self, { time=1000,onComplete=boom } )

        end


        local function iceWall(self)
            self:setSequence("iceAttack")
            self:play()

            createBlow()
            transition.to( hero,{time=1000,y=centerY,x= centerX+350})
            hero:setSequence("jump2")
            hero:play()

            transition.to( self, { time=600,x=barrier2.x+50,y= barrier2.y-100,onComplete=iceWall2 } )

        end


        local function unTalk(self )
            paused = false
            physics.start( )
            physics.setGravity( 0,100)
                    ---menu on unpause
            --hideMenu()
            self.isDead = true
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=600,x=barrier2.x+50,y= barrier2.y,onComplete=iceWall } )
        end
    
        function bossTalkF(self)
            if loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
            moveNow2 ="stop"
            
           -- transition.pause()
            --timer.pause()
            physics.pause( )
            physics.setGravity( 0,0)
    
            ---menu on pause
            transition.to( self, { time=500,y=centerY-140,x=centerX-290})
            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="hahaha! how about a little ice wall"

            local function talk2(self)
                transition.to( self, { time=300,y=centerY-150,x=centerX-300})
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="let's see if you can break this"
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("ice")
        self:play()

    end

    function coleTalk4(self)

        local function unTalk2()
            paused = false
            --transition.resume()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end

        local function talk(self)

            transition.to( heroTalk,{time=300,y=centerY,x=centerX+80})
            transition.to( bossTalkText,{time=300,y=centerY,x=centerX+80})
            bossTalkText.text="same as before, i need to have"

            local function talk2()
                transition.to( heroTalk,{time=300,y=centerY,x=centerX+90})
                transition.to( bossTalkText,{time=300,y=centerY,x=centerX+a90})
                bossTalkText.text="the super ice blast to freeze this"
                transition.to( self, { time=2000,onComplete = unTalk2 } )
            end
            
            transition.to( hero, { time=2000,onComplete = talk2 } )
        end

        local function removeMe(self)
            coleIsAlive = false
           -- self.isDead = true
            display.remove(self)

        end

        local function boom(self)
            paused = true
            createBuble(stoneBarrier2)
            display.remove(stoneBarrier2)
            audio.play( soundStone)

            transition.to( self, { time=600,x=barrier2.x-500,y= barrier2.y,onComplete=removeMe } )
            transition.to( fireSwordr, { time=600,x=barrier2.x-500,y= barrier2.y,onComplete=removeMe } )
            transition.to( fireSword, { time=600,x=barrier2.x-500,y= barrier2.y,onComplete=removeMe } )

            transition.to( self, { time=1500,onComplete=talk} )
        end

        local function iceWall2(self)
            createLavaWall()

            gameStatus.lavaWallisOn = 1
            saveScores()
            transition.to( self, { time=1000,onComplete=boom } )

        end


        local function iceWall(self)
            self:setSequence("fireAttack")
            self:play()

            createBlow()
            transition.to( hero,{time=1000,y=centerY-100,x= centerX+350})
            hero:setSequence("jump2")
            hero:play()

            transition.to( self, { time=600,x=barrier2.x+50,y= barrier2.y-50,onComplete=iceWall2 } )
            transition.to( fireSwordr, { time=600,x=barrier2.x+80,y= barrier2.y } )
            transition.to( fireSword, { time=600,x=barrier2.x,y= barrier2.y } )

        end


        local function unTalk(self )
            paused = false
            --transition.resume()
            --timer.resume()
            physics.start( )
            physics.setGravity( 0,100)
            --hideMenu()
            self.isDead = true
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=600,x=barrier2.x+50,y= barrier2.y,onComplete=iceWall } )
        end
    
        function bossTalkF(self)
            if loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
            moveNow2 ="stop"
            
           -- transition.pause()
            --timer.pause()
            physics.pause( )
            physics.setGravity( 0,0)
    
            ---menu on pause
            transition.to( self, { time=500,y=centerY-200,x=centerX+380})
            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="how about a lava flow"

            local function talk2(self)
                transition.to( self, { time=300,y=centerY-150,x=centerX+400})
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="can you handle the heat?"
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("fire")
        self:play()

    end

    function coleTalk5(self)

        local function boom2()
            gotoStory()
        end


        local function boom(self)
            gameStatus.isitNewGame =3
            saveScores()
            transition.to( self, { time=300,onComplete=boom2 } )
           -- coleIsAlive = false
           -- self.isDead = true
           -- createBubleBoss(self)
           -- display.remove(self)
            display.remove(gunSword)
           -- paused = false

  
        end


        local function unTalk(self )

            --transition.resume()
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            transition.to( self, { time=600,onComplete=boom } )
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
            moveNow2 ="stop"

            cole.isDead = true

            local function talk25(self)
                transition.to( heroTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( bossTalk,{time=300,y=centerY+180,x=centerX})
                transition.to( bossTalkText,{time=300,y=centerY+180,x=centerX})
                bossTalkText.text="alright drakz! alright!"
                transition.to( self, { time=3000,onComplete = unTalk } )
            end

            local function talk24(self)

                transition.to( heroTalk,{time=100,y=centerY+100,x=centerX})
                transition.to( bossTalkText,{time=100,y=centerY+100,x=centerX})
                bossTalkText.text="I will finish these"
                transition.to( self, { time=3000,onComplete = talk25 } )
            end

            local function talk23(self)

                transition.to( heroTalk,{time=300,y=centerY+100,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY+100,x=centerX-30})
                bossTalkText.text="gather your stregth bother! stay here and rest"
                transition.to( self, { time=3000,onComplete = talk24 } )
            end

            local function talk22(self)
                transition.to( bossTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-20})
                transition.to( bossTalkText,{time=100,y=centerY+100,x=centerX-20})
                bossTalkText.text="yeah! that's why i'm here for"
                transition.to( self, { time=3000,onComplete = talk23 } )
            end

            local function talk21(self)

                transition.to( bossTalk,{time=300,y=centerY+180,x=centerX})
                transition.to( bossTalkText,{time=300,y=centerY+180,x=centerX})
                bossTalkText.text="and bring him to justice"
                transition.to( self, { time=3000,onComplete = talk22 } )
            end

            local function talk20(self)
                transition.to( heroTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( bossTalk,{time=10,y=centerY+180,x=centerX+30})
                transition.to( bossTalkText,{time=10,y=centerY+180,x=centerX+30})
                bossTalkText.text="Let's find him Brother"
                transition.to( self, { time=3000,onComplete = talk21 } )
            end

            local function talk19(self)

                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-30})
                transition.to( bossTalkText,{time=10,y=centerY+100,x=centerX-30})
                bossTalkText.text="he's behind to all of these destructions"
                transition.to( self, { time=3000,onComplete = talk20 } )
            end

            local function talk18(self)
                transition.to( bossTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-20})
                transition.to( bossTalkText,{time=10,y=centerY+100,x=centerX-20})
                bossTalkText.text="SO after all these years"
                transition.to( self, { time=3000,onComplete = talk19 } )
            end

            local function talk17(self)
                transition.to( heroTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( bossTalk,{time=10,y=centerY+180,x=centerX+30})
                transition.to( bossTalkText,{time=10,y=centerY+180,x=centerX+30})
                bossTalkText.text="I am beatin up but i'm fine"
                transition.to( self, { time=3000,onComplete = talk18 } )
            end

            local function talk16(self)

                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-50})
                transition.to( bossTalkText,{time=10,y=centerY+100,x=centerX-50})
                bossTalkText.text="Cole! brother! are you okay?"
                transition.to( self, { time=3000,onComplete = talk17 } )
            end

            local function talk15(self)

                transition.cancel(bossControl)
                display.remove(bossControl)

                transition.to( bossTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-20})
                transition.to( bossTalkText,{time=100,y=centerY+100,x=centerX-20})
                bossTalkText.text="Damn you! fool!"
                transition.to( self, { time=3000,onComplete = talk16 } )
            end

            local function talk14(self)
                transition.to( heroTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( bossTalk,{time=10,y=centerY-200,x=centerX+40})
                transition.to( bossTalkText,{time=100,y=centerY-200,x=centerX+40})
                bossTalkText.text="hahahaha! come ! follow! find me!"
                transition.to( self, { time=4000,onComplete = talk15 } )
            end

            local function talk13(self)
                transition.to( bossTalk,{time=300,y=centerY-200,x=centerX+40})
                transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX+40})
                bossTalkText.text="Yes! be angry Drakz! feed your hatred"
                transition.to( self, { time=4000,onComplete = talk14 } )
            end

            local function talk12(self)
                transition.to( bossTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-20})
                transition.to( bossTalkText,{time=100,y=centerY+100,x=centerX-20})
                bossTalkText.text="What? you fool, you made him do this"
                transition.to( self, { time=3000,onComplete = talk13 } )
            end

            local function talk11(self)
                transition.to( heroTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( bossTalk,{time=10,y=centerY-200,x=centerX+40})
                transition.to( bossTalkText,{time=100,y=centerY-200,x=centerX+40})
                bossTalkText.text="I am the one controlling your brother"
                transition.to( self, { time=4000,onComplete = talk12 } )
            end

            local function talk10(self)
                transition.to( bossTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-20})
                transition.to( bossTalkText,{time=100,y=centerY+100,x=centerX-20})
                bossTalkText.text="Who are you? speak!"
                transition.to( self, { time=3000,onComplete = talk11 } )
            end

            local function talk9(self)
                transition.to( bossTalk,{time=300,y=centerY-200,x=centerX+60})
                transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX+60})
                bossTalkText.text="i've been watching you this whole time"
                transition.to( self, { time=4000,onComplete = talk10 } )
            end

            local function talk8(self)
                transition.to( heroTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( bossTalk,{time=10,y=centerY-200,x=centerX+50})
                transition.to( bossTalkText,{time=100,y=centerY-200,x=centerX+50})
                bossTalkText.text="oh me, you know me, and i know you"
                transition.to( self, { time=4000,onComplete = talk9 } )
            end

            local function talk7(self)
                transition.to( bossTalk,{time=10,y=screenTop-500,x=centerX+60})
                transition.to( heroTalk,{time=10,y=centerY+100,x=centerX-20})
                transition.to( bossTalkText,{time=100,y=centerY+100,x=centerX-20})
                bossTalkText.text="Who are you? and what have you done"
                transition.to( self, { time=3000,onComplete = talk8 } )
            end

            local function talk6(self)

                transition.to( bossTalk,{time=300,y=centerY-200,x=centerX+60})
                transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX+60})
                bossTalkText.text="i did'nt expect you to be these strong drakz"
                transition.to( self, { time=4000,onComplete = talk7 } )
            end
            
            local function talk5(self)

                createControlBoss()

                transition.to( bossTalk,{time=100,y=centerY-200,x=centerX+50})
                transition.to( bossTalkText,{time=100,y=centerY-200,x=centerX+50})
                bossTalkText.text="HA ha ha ha! ha ha ha! "
                transition.to( self, { time=4000,onComplete = talk6 } )
            end

            local function talk4(self)

                transition.to( bossTalk,{time=300,y=centerY,x=centerX-20})
                transition.to( bossTalkText,{time=300,y=centerY,x=centerX-20})
                bossTalkText.text="I'm confuse! what is happening"
                transition.to( self, { time=3000,onComplete = talk5 } )
            end

            local function talk3(self)

                transition.to( bossTalk,{time=300,y=centerY,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY,x=centerX-30})
                bossTalkText.text="is this a dream? or this is reality?"
                transition.to( self, { time=3000,onComplete = talk4 } )
            end

            local function talk2(self)
               -- transition.to( self, { time=1000,y=spawnPoint6.y,x=spawnPoint6.x})
                transition.to( bossTalk,{time=300,y=centerY,x=centerX-40})
                transition.to( bossTalkText,{time=300,y=centerY,x=centerX-40})
                bossTalkText.text="Drakz!? what are you doing here?"
                transition.to( self, { time=3000,onComplete = talk3 } )
            end

                       -- transition.pause()
            transition.to( bossTalk,{time=300,y=centerY,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY,x=centerX-50})
            bossTalkText.text="AHHHRG!what happend? why am i here? "
            
            transition.to( self, { time=3000,rotation=0,x=spawnPoint.x,y=spawnPoint.y, onComplete = talk2 } )
    
         end
        end

        self:setSequence("lost")
        self:play()
        bossTalkF(self)
        audio.play( soundDying)
        gameStatus.finishedGame=1
        saveScores()
       -- transition.to( self, { time=200,onComplete = bossTalkF } )

    end


    function harpyTalk(self)

        local function unTalk(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
           -- transition.to( self, { time=600,onComplete=removeMe } )
            self.isDead = true
            createDoubleJump(self)
            createBubleBoss(self)
           -- createAbsorb(self)
            display.remove(self)
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"

            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="you captured me and harnessed all my power"

            local function talk2(self)
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="now i have nothing left."
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("lost")
        self:play()

    end

    function fireTalk(self)

        local function unTalk(self )
            paused = false
 
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
           -- transition.to( self, { time=600,onComplete=removeMe } )
            self.isDead = true
            createFireBall(self)
            createBubleBoss(self)
           -- createAbsorb(self)
            display.remove(self)
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"

            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="Creator. forgive me"

            local function talk2(self)
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="I cannot protect you anymore"
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("lost")
        self:play()

    end

    function iceTalk(self)


        local function unTalk(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            self.isDead = true
            createBubleBoss(self)
            createIceBlast(self)
            --createAbsorb(self)
            display.remove(self)
        end
    
        function bossTalkF(self)
            if self.isDead == false and loading == false then
    
            paused = true
            
            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"

            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="thank you for freeing me"

            local function talk2(self)
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="now. take all my power. it is yours"
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("lost")
        self:play()

    end

    function goblinTalk(self)


        local function unTalk(self )
            paused = false

            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( bossTalk,{time=300,y=screenTop-500})
            --self.isDead = true
            createBubleBoss(self)
            createDashDown(self)
            --createAbsorb(self)
            display.remove(self)
        end
    
        function bossTalkF(self)
            if loading == false then
    
            paused = true

            readyToMove = false
			boomStick.x = screenLeft-100
			boomStick.y = centerY
			boomDot.x = screenLeft-100
			boomDot.y = centerY
			moveNow ="stop"
			moveNow2 ="stop"
   
            transition.to( bossTalk,{time=300,y=centerY-200,x=centerX-50})
            transition.to( bossTalkText,{time=300,y=centerY-200,x=centerX-50})
            bossTalkText.text="how!? how!?"

            local function talk2(self)
                transition.to( bossTalk,{time=300,y=centerY-150,x=centerX-30})
                transition.to( bossTalkText,{time=300,y=centerY-150,x=centerX-30})
                bossTalkText.text="how did you defeat me!"
                transition.to( self, { time=1500,onComplete = unTalk } )
            end
            
            transition.to( self, { time=1500,onComplete = talk2 } )
    
         end
        end
        bossTalkF(self)
        self:setSequence("lost")
        self:play()

    end

    ------------------------hero talk--------------

    function heroTalkf(self)
        local function ready(self )
            paused = false
    
            transition.to( bossTalkText,{time=300,y=screenTop-500})
            transition.to( heroTalk,{time=300,y=screenTop-500})
        end
    
        local function openingTalk(self)
            if self.isDead == false and loading == false then
    
            paused = true
    
            transition.to( heroTalk,{time=300,y=centerY+250,x=centerX})
            transition.to( bossTalkText,{time=300,y=centerY+250,x=centerX})
            bossTalkText.text="Why it's so dark in here?"
    
            local function talk2(self)
                transition.to( heroTalk,{time=300,y=centerY+230,x=centerX+10})
                transition.to( bossTalkText,{time=300,y=centerY+230,x=centerX+10})
                bossTalkText.text="I need to find the Light"
                transition.to( self, { time=2000,onComplete = ready } )
            end
            
            transition.to( self, { time=2000,onComplete = talk2 } )
    
         end
        end
            openingTalk(self)

    end

    function createAbsorb(self)
        audio.play( soundAbsorb)
        --paused=true
        local function removeMe(self)
            display.remove( self )
        end

        local function boom(self)
            shake(self)
            local i =0
            while i <10 do
                i = i +1
                local soul

            local function castSoul(self)
                if loading == false then

                     soul = display.newImageRect( uiGroup, "images/soul.png", 13,13 )
     
            
                     soul.x = self.x + math.random(-100,100)
                     soul.y = self.y + math.random(-150,50)
                                          
                    end
                end
            castSoul(self)
            print("absorb")

            if i == 1 then
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 2 then
                 transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 3 then
                 transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 4 then
                 transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 5 then
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 6 then
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 7 then
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 8 then
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            elseif i == 9 then
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            else
                transition.to (soul, {time = math.random(750,1250),x = hero.x,y= hero.y,transition=easing.inQuint,onComplete=removeMe})
            end
        end
    end
    boom(self)
end


    ------------------------------------wallsss and effects -------------------

    function createWall()
        local ice = display.newImageRect( uiGroup, "images/iceBlock2.png", iceWall.width,iceWall.height )
    
        ice.myName="iceWall"
        ice.isDead=false
        ice.xScale=.1

        ice.x = iceWall.x
        ice.y = iceWall.y

        physics.addBody( ice, "static",
        {bounce= 0,friction=0,box={ halfWidth=iceWall.width/2, halfHeight=iceWall.height/2, x=0, y=0},isSensor=false })
        ice.isFixedRotation = true

        transition.to( ice, { time=600,xScale=1 } )
    end

    function createLavaWall()
       -- local ice = display.newImageRect( uiGroup, "images/iceBlock2.png", lavaWall.width,lavaWall.height )

        local spriteOptions = {
            height = lavaWall.height,
            width = lavaWall.width,
            numFrames = 4,
            sheetContentWidth = lavaWall.width*2,
            sheetContentHeight = lavaWall.height*2
          }
          local mySheet = graphics.newImageSheet("images/lavaFlow.png", spriteOptions)
          local sequenceData = {
            {name = "fire", start =1,count=4, time =400, loopCount =0}
    
          }
                 
            -- Display the new sprite at the coordinates passed
        local ice = display.newSprite(backGroup,mySheet, sequenceData)
        ice:setSequence("fire")
        ice:play()

    
        ice.myName="lava"
        ice.isDead=false

        ice.x = lavaWall.x
        ice.y = lavaWall.y

        physics.addBody( ice, "static",
        {bounce= 0,friction=0,box={ halfWidth=lavaWall.width/2, halfHeight=lavaWall.height/2, x=0, y=0},isSensor=false })
        ice.isFixedRotation = true
    end

    function createIceBlock()

             ice = display.newImageRect( uiGroup, "images/iceBlock2.png", iceBlock.width,iceBlock.height )
    
            ice.myName="iceBlock"
            ice.isDead=false
    
    
            physics.addBody( ice, "static",
            {bounce= 0,friction=0,box={ halfWidth=iceBlock.width/2, halfHeight=iceBlock.height/2, x=0, y=0},isSensor=false })
            ice.isFixedRotation = true

    end

    function createIceBlockb()

        ice2 = display.newImageRect( uiGroup, "images/iceBlock2.png", iceBlock2.width,iceBlock2.height )

       ice2.myName="iceBlock2"
       ice2.isDead=false


       physics.addBody( ice2, "static",
       {bounce= 0,friction=0,box={ halfWidth=iceBlock2.width/2, halfHeight=iceBlock2.height/2, x=0, y=0},isSensor=false })
       ice2.isFixedRotation = true

end

    function createStoneBlock()

        stone = display.newImageRect( uiGroup, "images/stoneBlock.png", stoneBlock.width,stoneBlock.height )

        stone.myName="stoneBlock"
        stone.isDead=false
        stone.objType="ground"


       physics.addBody( stone, "static",
       {bounce= 0, friction=10,box={ halfWidth=stoneBlock.width/2, halfHeight=stoneBlock.height/2, x=0, y=0},isSensor=false })
       stone.isFixedRotation = true

    end

    function createStoneBlock2()

        stone2 = display.newImageRect( uiGroup, "images/stoneBlock.png", stoneBlock2.width,stoneBlock2.height )

        stone2.myName="stoneBlock2"
        stone2.isDead=false
        stone2.objType="ground"


       physics.addBody( stone2, "static",
       {bounce= 0, friction=10,box={ halfWidth=stoneBlock2.width/2, halfHeight=stoneBlock2.height/2, x=0, y=0},isSensor=false })
       stone2.isFixedRotation = true

    end

    function createInstaKill()

        local spriteOptions = {
            height = instaKill.height,
            width = instaKill.width,
            numFrames = 5,
            sheetContentWidth = instaKill.width*2,
            sheetContentHeight = instaKill.height*3
          }
          local mySheet = graphics.newImageSheet("images/spikes.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=5, time =500, loopCount =0},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        kill = display.newSprite(mainGroup,mySheet, sequenceData)  
        kill:setSequence("boom")
        kill:play()

        --kill = display.newImageRect( uiGroup, "images/burning.png", instaKill.width,instaKill.height )

        kill.myName="instaKill"
        kill.isDead=false


       physics.addBody( kill, "static",
       {bounce= 0, friction=10,box={ halfWidth=instaKill.width/2, halfHeight=instaKill.height/2, x=0, y=0},isSensor=true })
       kill.isFixedRotation = true

    end

    function createKill()

        kill = display.newImageRect( uiGroup, "images/spikes.png", instaKill.width,instaKill.height )

        kill.myName="instaKill"
        kill.isDead=false
        kill.alpha = .1


       physics.addBody( kill, "static",
       {bounce= 0, friction=10,box={ halfWidth=instaKill.width/2, halfHeight=instaKill.height/2, x=0, y=0},isSensor=true })
       kill.isFixedRotation = true

    end

    function createBurning()


        local spriteOptions = {
            height = burning.height,
            width = burning.width,
            numFrames = 4,
            sheetContentWidth = burning.width,
            sheetContentHeight = burning.height*4
          }
          local mySheet = graphics.newImageSheet("images/burning2.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=4, time =800, loopCount =0},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        fire = display.newSprite(uiGroup,mySheet, sequenceData)  
        fire:setSequence("boom")
        fire:play()

        fire.myName="burning"
        fire.isDead=false


       physics.addBody( fire, "static",
       {bounce= 0, friction=10,box={ halfWidth=burning.width/2, halfHeight=burning.height/2, x=0, y=0},isSensor=true })
       fire.isFixedRotation = true

    end
    function createBurningb()

        local spriteOptions = {
            height = burning2.height,
            width = burning2.width,
            numFrames = 4,
            sheetContentWidth = burning2.width,
            sheetContentHeight = burning2.height*4
          }
          local mySheet = graphics.newImageSheet("images/burning2.png", spriteOptions)
          local sequenceData = {
            {name = "boom", start =1,count=4, time =800, loopCount =0},
 
          }
         
        
            -- Display the new sprite at the coordinates passed
        fire2 = display.newSprite(uiGroup,mySheet, sequenceData)  
        fire2:setSequence("boom")
        fire2:play()

        fire2.myName="burning2"
        fire2.isDead=false


       physics.addBody( fire2, "static",
       {bounce= 0, friction=10,box={ halfWidth=burning2.width/2, halfHeight=burning2.height/2, x=0, y=0},isSensor=true })
       fire2.isFixedRotation = true

    end

    function createBurningIcea()

         fire = display.newImageRect( uiGroup, "images/iceBlock.png", burning.width,burning.height )
 
         local function add(self)
        physics.addBody( self, "static",
        {bounce= 0, friction=0,box={ halfWidth=burning.width/2, halfHeight=burning.height/2, x=0, y=0},isSensor=false })
        self.isFixedRotation = true
        self.objType="ground"
        self.x = burning.x
        self.y = burning.y
         end
 
         transition.to( fire, { time=10,onComplete = add } )
 
     end

     function createBurningIceb()

        fire2 = display.newImageRect( uiGroup, "images/iceBlock.png", burning2.width,burning2.height )

        local function add2(self)
       physics.addBody( self, "static",
       {bounce= 0, friction=0,box={ halfWidth=burning2.width/2, halfHeight=burning2.height/2, x=0, y=0},isSensor=false })
       self.isFixedRotation = true
       self.objType="ground"
       self.x = burning2.x
       self.y = burning2.y
        end

        transition.to( fire2, { time=10,onComplete = add2 } )

    end


    function createBurningIce(self)

       local fire = display.newImageRect( uiGroup, "images/iceBlock.png", burning.width,burning.height )

        --burning = map:findObject("burning")
        fire.x =self.x
        fire.y =self.y

        local function add()
       physics.addBody( fire, "static",
       {bounce= 0, friction=0,box={ halfWidth=burning.width/2, halfHeight=burning.height/2, x=0, y=0},isSensor=false })
       fire.isFixedRotation = true
       fire.objType="ground"
        end

        transition.to( fire, { time=10,onComplete = add } )

    end

    function createBarrier()

        stoneBarrier = display.newImageRect( uiGroup, "images/barrier.png",  barrier.width,barrier.height )

        stoneBarrier.myName="barrier"
        stoneBarrier.isDead=false
        stoneBarrier.objType="ground"


       physics.addBody( stoneBarrier, "static",
       {bounce= 0, friction=10,box={ halfWidth=barrier.width/2, halfHeight=barrier.height/2, x=0, y=0},isSensor=false })
       stoneBarrier.isFixedRotation = true

    end
    function locking(self)

        transition.to( self, { time=300, y = barrier.y } )
    end

    function createBarrier2()

        stoneBarrier2 = display.newImageRect( uiGroup, "images/barrier.png",  barrier2.width,barrier2.height )

        stoneBarrier2.myName="barrier"
        stoneBarrier2.isDead=false
        stoneBarrier2.objType="ground"


       physics.addBody( stoneBarrier2, "static",
       {bounce= 0, friction=10,box={ halfWidth=barrier2.width/2, halfHeight=barrier2.height/2, x=0, y=0},isSensor=false })
       stoneBarrier2.isFixedRotation = true

    end
    function locking2(self)

        transition.to( self, { time=300, y = barrier2.y } )
    end
    ----------------------------stages effects------------------
    function snowing()

        if loading == false then
    
        local spriteOptions = {
            height = 600,
            width = 850,
            numFrames = 5,
            sheetContentWidth = 1700,
            sheetContentHeight = 1800
          }
          local mySheet = graphics.newImageSheet("images/snow.png", spriteOptions)
          local sequenceData = {
            {name = "snow", start =1,count=5, time =800, loopCount =0}
    
          }                   
            -- Display the new sprite at the coordinates passed
         local snow = display.newSprite(backGroup,mySheet, sequenceData)
            snow:setSequence("snow")
             snow:play()

    
            snow.x = centerX
            snow.y = centerY
            snow.alpha=.5

            local function rain()
                if loading == false then

                        audio.play( soundBlizzard)
                        transition.to( snow, { time=1100,onComplete = rain } )
                end
               end
                rain()
            
                    
        end
    end

    function raining()

        if loading == false then
    
        local spriteOptions = {
            height = 600,
            width = 850,
            numFrames = 6,
            sheetContentWidth = 1700,
            sheetContentHeight = 1800
          }
          local mySheet = graphics.newImageSheet("images/rain.png", spriteOptions)
          local sequenceData = {
            {name = "snow", start =1,count=5, time =800, loopCount =0},
            {name = "snow2", start =1,count=6, time =800, loopCount =0}
    
          }                   
            -- Display the new sprite at the coordinates passed
         local snow = display.newSprite(backGroup,mySheet, sequenceData)
    
            snow.x = centerX
            snow.y = centerY
            snow.alpha=.6

            local function rain()
            if loading == false then
                local r = math.random(1,3)
                if r ==1 then
                    snow:setSequence("snow2")
                    snow:play()
                    audio.play( soundThunder)
                    transition.to( snow, { time=800,onComplete = rain } )
                else
                    snow:setSequence("snow")
                    snow:play()
                    transition.to( snow, { time=800,onComplete = rain } )
                end
            end
           end
            rain()
            
                    
        end
    end

    function createBlow()

        if loading == false then
    
        local spriteOptions = {
            height = 600,
            width = 850,
            numFrames = 5,
            sheetContentWidth = 1700,
            sheetContentHeight = 1800
          }
          local mySheet = graphics.newImageSheet("images/blow.png", spriteOptions)
          local sequenceData = {
            {name = "snow", start =1,count=5, time =500, loopCount =2}
    
          }                   
            -- Display the new sprite at the coordinates passed
         local snow = display.newSprite(mainGroup,mySheet, sequenceData)
            snow:setSequence("snow")
             snow:play()

    
            snow.x = centerX
            snow.y = centerY
            snow.alpha=.5

            local function rain(self)
                display.remove(self)
             end
             transition.to( snow, { time=1000,onComplete = rain } )
             audio.play( soundBlizzard)
                    
        end
    end

    function blackOut()

         black = display.newImageRect( uiGroup, "images/blackOut.png", display.actualContentWidth*2,display.actualContentHeight*2 )

        --burning = map:findObject("burning")
        black.x =centerX
        black.y =screenBottom
        blackRoom = true

    end

    function caving()

        cave = display.newImageRect( uiGroup, "images/vignet.png", 900,700 )

       --burning = map:findObject("burning")
       cave.x =centerX
       cave.y =centerY
       cave.alpha=.6
      -- cave:setFillColor(0,0,1)

      --cave2 = display.newImageRect( uiGroup, "images/stalagtite3.png", 1200,700 )

      --burning = map:findObject("burning")
      --cave2.x =centerX
     -- cave2.y =centerY
     -- cave:setFillColor(0,0,1)
       caveRoom = true

   end


    --stage checker

    function stageCheckr()
        
        if gameStatus.stage==1 then
            fromStage="right"
            gameStatus.stage=2
        elseif gameStatus.stage ==2 then
            fromStage="right"
            gameStatus.stage =3
        elseif gameStatus.stage ==3 then
            fromStage="right"
            gameStatus.stage =130
        elseif gameStatus.stage ==4 then
            fromStage="right"
            gameStatus.stage =5
        elseif gameStatus.stage ==5 then
            fromStage="right"
            gameStatus.stage =6
        elseif gameStatus.stage ==6 then
            fromStage="right"
            gameStatus.stage =7
        elseif gameStatus.stage ==7 then
            fromStage="right"
            gameStatus.stage =0827
        elseif gameStatus.stage ==8 then
            fromStage="right"
            gameStatus.stage =9
        elseif gameStatus.stage ==9 then
            fromStage="right"
            gameStatus.stage =0300
        elseif gameStatus.stage ==10 then
            fromStage="right"
            gameStatus.stage =010211
        elseif gameStatus.stage ==11 then
            fromStage="right"
            gameStatus.stage =12
        elseif gameStatus.stage ==12 then
            fromStage="right"
            gameStatus.stage =13
        elseif gameStatus.stage ==13 then
            fromStage="right"
            gameStatus.stage =14
        elseif gameStatus.stage ==14 then
            fromStage="right"
            gameStatus.stage =15
        elseif gameStatus.stage ==15 then
            fromStage="right"
            gameStatus.stage =230
        elseif gameStatus.stage ==16 then
            fromStage="right"
            gameStatus.stage =216217
        elseif gameStatus.stage ==17 then
            fromStage="right"
            gameStatus.stage =18
        elseif gameStatus.stage ==18 then
            fromStage="right"
            gameStatus.stage =19
        elseif gameStatus.stage ==19 then
            fromStage="right"
            gameStatus.stage =20
        elseif gameStatus.stage ==20 then
            fromStage="right"
            gameStatus.stage =21
        elseif gameStatus.stage ==21 then
            fromStage="right"
            gameStatus.stage =330
        elseif gameStatus.stage ==22 then
            fromStage="right"
            gameStatus.stage =23
        elseif gameStatus.stage ==23 then
            fromStage="right"
            gameStatus.stage =323224
        elseif gameStatus.stage ==24 then
            fromStage="right"
            gameStatus.stage =25
        elseif gameStatus.stage ==25 then
            fromStage="right"
            gameStatus.stage =26
        elseif gameStatus.stage ==26 then
            fromStage="right"
            gameStatus.stage =0027226
        elseif gameStatus.stage ==27 then
            fromStage="right"
            gameStatus.stage =00301
        elseif gameStatus.stage ==28 then
            fromStage="right"
            gameStatus.stage =29
        elseif gameStatus.stage ==29 then
            fromStage="right"
            gameStatus.stage =30
        elseif gameStatus.stage ==0300 then
            fromStage="right"
            gameStatus.stage =10
        elseif gameStatus.stage ==00301 then
            fromStage="right"
            gameStatus.stage =28
        elseif gameStatus.stage ==130 then
            fromStage="right"
            gameStatus.stage =4
        elseif gameStatus.stage ==230 then
            fromStage="right"
            gameStatus.stage =16
        elseif gameStatus.stage ==330 then
            fromStage="right"
            gameStatus.stage =22
        elseif gameStatus.stage ==0827 then
            fromStage="right"
            gameStatus.stage =8
        elseif gameStatus.stage ==0027226 then
            fromStage="right"
            gameStatus.stage =27
        elseif gameStatus.stage ==216217 then
            fromStage="right"
            gameStatus.stage =17
        elseif gameStatus.stage ==010211 then
            fromStage="right"
            gameStatus.stage =11
        elseif gameStatus.stage ==323224 then
            fromStage="right"
            gameStatus.stage =24

        end
    end
    
    function stageCheckl()
        if gameStatus.stage==1 then
            fromStage="left"
            gameStatus.stage=1
        elseif gameStatus.stage ==2 then
            fromStage="left"
            gameStatus.stage =1
        elseif gameStatus.stage ==3 then
            fromStage="left"
            gameStatus.stage =2
        elseif gameStatus.stage ==4 then
            fromStage="left"
            gameStatus.stage =130
        elseif gameStatus.stage ==5 then
            fromStage="left"
            gameStatus.stage =4
        elseif gameStatus.stage ==6 then
            fromStage="left"
            gameStatus.stage =5
        elseif gameStatus.stage ==7 then
            fromStage="left"
            gameStatus.stage =6
        elseif gameStatus.stage ==8 then
            fromStage="left"
            gameStatus.stage =0827
        elseif gameStatus.stage ==9 then
            fromStage="left"
            gameStatus.stage =8
        elseif gameStatus.stage ==10 then
            fromStage="left"
            gameStatus.stage =0300
        elseif gameStatus.stage ==11 then
            fromStage="left"
            gameStatus.stage =010211
        elseif gameStatus.stage ==12 then
            fromStage="left"
            gameStatus.stage =11
        elseif gameStatus.stage ==13 then
            fromStage="left"
            gameStatus.stage =12
        elseif gameStatus.stage ==14 then
            fromStage="left"
            gameStatus.stage =13
        elseif gameStatus.stage ==15 then
            fromStage="left"
            gameStatus.stage =14
        elseif gameStatus.stage ==16 then
            fromStage="left"
            gameStatus.stage =230
        elseif gameStatus.stage ==17 then
            fromStage="left"
            gameStatus.stage =216217
        elseif gameStatus.stage ==18 then
            fromStage="left"
            gameStatus.stage =17
        elseif gameStatus.stage ==19 then
            fromStage="left"
            gameStatus.stage =18
        elseif gameStatus.stage ==20 then
            fromStage="left"
            gameStatus.stage =19
        elseif gameStatus.stage ==21 then
            fromStage="left"
            gameStatus.stage =20
        elseif gameStatus.stage ==22 then
            fromStage="left"
            gameStatus.stage =330
        elseif gameStatus.stage ==23 then
            fromStage="left"
            gameStatus.stage =22
        elseif gameStatus.stage ==24 then
            fromStage="left"
            gameStatus.stage =323224
        elseif gameStatus.stage ==26 then
            fromStage="left"
            gameStatus.stage =25
        elseif gameStatus.stage ==27 then
            fromStage="left"
            gameStatus.stage =0027226
        elseif gameStatus.stage ==28 then
            fromStage="left"
            gameStatus.stage =00301
        elseif gameStatus.stage ==29 then
            fromStage="left"
            gameStatus.stage =28
        elseif gameStatus.stage ==30 then
            fromStage="left"
            gameStatus.stage =29
        elseif gameStatus.stage ==0300 then
            fromStage="left"
            gameStatus.stage =9
        elseif gameStatus.stage ==00301 then
            fromStage="left"
            gameStatus.stage =27
        elseif gameStatus.stage ==130 then
            fromStage="left"
            gameStatus.stage =3
        elseif gameStatus.stage ==230 then
            fromStage="left"
            gameStatus.stage =15
        elseif gameStatus.stage ==330 then
            fromStage="left"
            gameStatus.stage =21
        elseif gameStatus.stage ==0827 then
            fromStage="left"
            gameStatus.stage =7
        elseif gameStatus.stage ==0027226 then
            fromStage="left"
            gameStatus.stage =26
        elseif gameStatus.stage ==216217 then
            fromStage="left"
            gameStatus.stage =16
        elseif gameStatus.stage ==010211 then
            fromStage="left"
            gameStatus.stage =10
        elseif gameStatus.stage ==323224 then
            fromStage="left"
            gameStatus.stage =23
        end
    end
    
    function stageChecku()
        if gameStatus.stage==1 then
            fromStage="up"
            gameStatus.stage=13
        elseif gameStatus.stage ==2 then
            fromStage="up"
            gameStatus.stage =14
        elseif gameStatus.stage ==3 then
            fromStage="up"
            gameStatus.stage =15
        elseif gameStatus.stage ==4 then
            fromStage="up"
            gameStatus.stage =16
        elseif gameStatus.stage ==5 then
            fromStage="up"
            gameStatus.stage =17
        elseif gameStatus.stage ==6 then
            fromStage="up"
            gameStatus.stage =18
        elseif gameStatus.stage ==7 then
            fromStage="up"
            gameStatus.stage =1
        elseif gameStatus.stage ==8 then
            fromStage="up"
            gameStatus.stage =2
        elseif gameStatus.stage ==9 then
            fromStage="up"
            gameStatus.stage =3
        elseif gameStatus.stage ==10 then
            fromStage="up"
            gameStatus.stage =4
        elseif gameStatus.stage ==11 then
            fromStage="up"
            gameStatus.stage =5
        elseif gameStatus.stage ==12 then
            fromStage="up"
            gameStatus.stage =16212
        elseif gameStatus.stage ==13 then
            fromStage="up"
            gameStatus.stage =19
        elseif gameStatus.stage ==14 then
            fromStage="up"
            gameStatus.stage =20
        elseif gameStatus.stage ==15 then
            fromStage="up"
            gameStatus.stage =21
        elseif gameStatus.stage ==16 then
            fromStage="up"
            gameStatus.stage =22
        elseif gameStatus.stage ==17 then
            fromStage="up"
            gameStatus.stage =23
        elseif gameStatus.stage ==18 then
            fromStage="up"
            gameStatus.stage =24
        elseif gameStatus.stage ==30 then
            fromStage="up"
            gameStatus.stage =12
        elseif gameStatus.stage ==27 then
            fromStage="up"
            gameStatus.stage =9
        elseif gameStatus.stage ==25 then
            fromStage="up"
            gameStatus.stage =7
        elseif gameStatus.stage ==20 then
            fromStage="up"
            gameStatus.stage =41
        elseif gameStatus.stage ==23 then
            fromStage="up"
            gameStatus.stage =42
        elseif gameStatus.stage ==16212 then
            fromStage="up"
            gameStatus.stage =6
        end
    end
    
    function stageCheckd()
        if gameStatus.stage==1 then
            fromStage="down"
            gameStatus.stage=7
        elseif gameStatus.stage ==2 then
            fromStage="down"
            gameStatus.stage =8
        elseif gameStatus.stage ==3 then
            fromStage="down"
            gameStatus.stage =9
        elseif gameStatus.stage ==4 then
            fromStage="down"
            gameStatus.stage =10
        elseif gameStatus.stage ==5 then
            fromStage="down"
            gameStatus.stage =11
        elseif gameStatus.stage ==6 then
            fromStage="down"
            gameStatus.stage =16212
        elseif gameStatus.stage ==13 then
            fromStage="down"
            gameStatus.stage =1
        elseif gameStatus.stage ==14 then
            fromStage="down"
            gameStatus.stage =2
        elseif gameStatus.stage ==15 then
            fromStage="down"
            gameStatus.stage =3
        elseif gameStatus.stage ==16 then
            fromStage="down"
            gameStatus.stage =4
        elseif gameStatus.stage ==17 then
            fromStage="down"
            gameStatus.stage =5
        elseif gameStatus.stage ==18 then
            fromStage="down"
            gameStatus.stage =6
        elseif gameStatus.stage ==19 then
            fromStage="down"
            gameStatus.stage =13
        elseif gameStatus.stage ==20 then
            fromStage="down"
            gameStatus.stage =14
        elseif gameStatus.stage ==21 then
            fromStage="down"
            gameStatus.stage =15
        elseif gameStatus.stage ==22 then
            fromStage="down"
            gameStatus.stage =16
        elseif gameStatus.stage ==23 then
            fromStage="down"
            gameStatus.stage =17
        elseif gameStatus.stage ==24 then
            fromStage="down"
            gameStatus.stage =18
        elseif gameStatus.stage ==7 then
            fromStage="down"
            gameStatus.stage =25
        elseif gameStatus.stage ==9 then
            fromStage="down"
            gameStatus.stage =27
        elseif gameStatus.stage ==12 then
            fromStage="down"
            gameStatus.stage =30
        elseif gameStatus.stage ==41 then
            fromStage="down"
            gameStatus.stage =20
        elseif gameStatus.stage ==42 then
            fromStage="down"
            gameStatus.stage =23
        elseif gameStatus.stage ==16212 then
            fromStage="down"
            gameStatus.stage =12
        end
    end