
// Project: yframework avoider 
// Created: 2021-07-02

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "yframework avoider" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

#insert "yengine2d.agc"
#insert "player.agc"
#insert "baddy.agc"
#insert "game_world.agc"
#insert "menu_world.agc"


//init vars
gamew as yworld
menuw as yworld

//worlds
gamew = newyworld("game")
menuw = newyworld("menu")

menu_init()
game_init()


//db
global ydata as integer[]

changeworld("menu")

do
    

    yengineupdate()
    Sync()
loop


function myupdate()
	
	if worlds[current_worldi].name="game"
		game_update()	
	endif
	
	if worlds[current_worldi].name="menu"
		menu_update()
	endif
	
endfunction	//end myupdate


function update_yentity_custom(e as yentity)
	
	if e.ytype = "player" and e.yactive then updatePlayer(e)
	if e.ytype = "baddy" and e.yactive then updateBaddy(e)
	

endfunction //endd update_yentity_custom
