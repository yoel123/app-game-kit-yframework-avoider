

global game_over = 0
global new_game = 1


global playerImg = 1
global badyImg = 2

global points = 0
global changeDirMod = 500



add_ytimer("baddy_spawn_timer",3)


function game_init()
	
	LoadImage(playerImg,"player.png")
	LoadImage(badyImg,"bady.png")
	
	player as yentity
	player = newPlayer()
	yaddw("game",player)
	
	//test baddys
	newBaddy(100,100)
	newBaddy(200,100)
	newBaddy(200,200)
	
endfunction

function game_update()
	
	
	 if new_game
		 new_game()
	 endif
	
	 print("points: "+str(points))
	 
	 
	 /////////if game over////////
	 if game_over = 1
		 print("game over")
		 //if current score is better then best score
		 if best_score < points 
			  best_score = points
			 //save best score to file
			  if ydata.length = -1
				  ydata.insert(best_score)
			  else
				  ydata[0] = best_score
			  endif
			  ydata.save( "ydata.json" )
		 endif
		 //if screen touched go to menu
		 if ( GetPointerPressed ( ) = 1 ) then changeworld("menu")
	 endif
	 
	 ///////if not game over///////
	 if game_over = 0
		 inc points
		spawn_baddy()
	 endif
endfunction


function spawn_baddy()
	//timer done
	if is_done_ytimer("baddy_spawn_timer",1)
		
		//spawn top or left side
		if random(1,10) >5
			newBaddy(random(0,50),random(0,500))
		else
			newBaddy(random(0,500),random(0,50))
		endif
		
	endif
endfunction

function new_game()
	//reset everything
	 game_over = 0
	 points = 0
	 remove_by_type("baddy","game")
	 new_game = 0
endfunction


