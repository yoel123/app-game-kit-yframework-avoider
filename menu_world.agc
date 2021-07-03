

global start_btn as ybtn
global credits_btn as ybtn

global best_score = 0

function menu_init()
	
	//x as float,y as float,s as string,size,w as string,t as string
	
	start_btn = recYbtn(450,300,"start game",100,"menu","start_btn")
	credits_btn = recYbtn(450,450,"credits",100,"menu","credits_btn")
	SetVirtualButtonColor(start_btn.id,100,50,40)
	SetVirtualButtonSize( start_btn.id, 200, 150 )
	
	//load score
	if GetFileExists ( "ydata.json" )
		ydata.load( "ydata.json" )
		best_score = ydata[0]
	endif
endfunction

function menu_update()
	
	print("best score: "+str(best_score))
	
	//btn click events
	if ybtnReleased(start_btn) 
		 //reset game
		 new_game = 1
		 //chamge to game world
		 changeworld("game")
	endif
	
endfunction
