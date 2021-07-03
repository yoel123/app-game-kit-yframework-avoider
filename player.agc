
function newPlayer()
	
	p as yentity
	p = newyentity(0,0,3,playerImg)
	p.ytype = "player"
	
	
endfunction p



function updatePlayer(e as yentity)
	
	if game_over then exitfunction
	
	movePlayer(e)
	hitPlayer(e)
endfunction


function movePlayer(e as yentity)
	SetSpritePosition(e.id,GetPointerX(),GetPointerY()-50)
endfunction


function hitPlayer(e as yentity)
	//if player collides with baddy game over
	t as yentity
	t =  hit_test(e,"baddy")
	if ise(t) 
		game_over = 1
	endif
	
endfunction

