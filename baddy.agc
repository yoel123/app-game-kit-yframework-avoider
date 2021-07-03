
function newBaddy(x as float ,y as float)
	
	b as yentity
	speed = Random(1,4)
	b = newyentity(x,y,speed,badyImg)
	b.ytype = "baddy"
	
	//atts
	b.yints.insert(random(0,1)) // 0 dirx
	b.yints.insert(random(0,1)) // 1 diry
	if random(1,10) >5 then b.yints[0] = -1
	if random(1,10) >5 then b.yints[1] = -1
	
	yrec("game",b)
	
endfunction b


function updateBaddy(e as yentity)
	
	if game_over then exitfunction
	
	moveBaddy(e)
	BaddyBounds(e)
endfunction

function moveBaddy(e as yentity)
	
	dx = e.yints[0]
	dy = e.yints[1]
	
	mx = e.speed*dx
	my = e.speed*dy
	
	move_by(e,mx,my)
	
	
	//change dir
	if mod(points,changeDirMod) = 0
		ei_set(e,0,random(0,1))
		ei_set(e,1,random(0,1))
		if random(1,10) >5 then ei_set(e,0,-1)
		if random(1,10) >5 then ei_set(e,1,-1)
	endif
endfunction


function BaddyBounds(e as yentity)
	
		x = e.pos.x
		y = e.pos.y
		
		if x > GetScreenBoundsRight() then sx( e,0 )
		if x < GetScreenBoundsLeft() then sx( e, GetScreenBoundsRight() )
		if y > GetScreenBoundsBottom() then sy( e,0 )
		if y < GetScreenBoundsTop() then sy( e, GetScreenBoundsBottom() )
		
	
endfunction
