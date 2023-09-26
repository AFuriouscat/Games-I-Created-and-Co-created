local composer = require( "composer" )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

native.setProperty("androidSystemUiVisibility", "immersiveSticky");

-- Seed the random number generator
math.randomseed( os.time() )

-- Reserve channel 1 for background music
audio.reserveChannels( 1 )
-- Reduce the overall volume of the channel
audio.setVolume( 0.5, { channel=1 } )

-- Go to the menu screen
--[[
whatStage = "stage1"
whosTheBoss=1
kinPosY =250
kinPosX =200
kinkinLevel =1
kinkinExp=1

ppp=1
ppk=1
pkp=1
kpp=1
pkk=1
kkk=1
kpk=1
kkp=1--]]

composer.gotoScene( "logo" )-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

