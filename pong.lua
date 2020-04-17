padx = 53
pady = 122
padw = 24
padh = 4

ballx = 64
bally = 64
ballsize = 3
ballxdir = 3
ballydir = 2

lives = 3
lives2 = 3

pdx = 53
pdy = 1	
pdw = 28
pdh = 4

wd = 128

function movepaddle()
	if btn(0) then
		padx -= 3
	end
		
	elseif btn(1) then
		padx += 3
	end
	
	
	--if btn(4) then
	--	pdx -= 3
	--elseif btn(5) then
		--pdx += 3
--	end
	pdx = ballx 
end





function moveball()
	ballx += ballxdir
	bally += ballydir
end


function _update()
	loseball()
	bouncepaddle()
	bounceball()
	movepaddle()
	moveball()
end


function _draw()		
		
		rectfill(0,0,128,128,3)
		rectfill(padx,pady, padx+padw, pady+padh, 15)
		circfill(ballx,bally,ballsize,15)
		rectfill(pdx, pdy, pdx+pdw, pdy+pdh, 15)
		for i = 1, lives do
			spr(001, 100, 4)
		end
		print(lives, 110, 110, 15)
		print(lives2, 110, 6, 15)
		
		if lives == 0 then
			print("le joueur 1 a gagne",10,64,20)
		end 
	
		if lives2 == 0 then
			print("le joueur 2 a gagne",10,64,20)
		end 
end

function bounceball()
	if ballx < ballsize then
		ballxdir =- ballxdir
		sfx(0)
	end
	
	if ballx > 128 - ballsize then
		ballxdir =- ballxdir
		sfx(0)
	end

end

function bouncepaddle()

	if ballx >= padx and ballx <= padx + padw and bally > pady - padh then
 	sfx(0)
		ballydir =- ballydir
	end
	
	if ballx >= pdx and ballx <= pdx + pdw and bally < pdy + pdh then
 	sfx(0)
		ballydir =- ballydir
	end
end

function loseball()
	if bally > 128 then
		if lives > 0 then
			sfx(3)
			ballx = wd/2
			bally = wd/2
			lives -= 1
		end
		
		else if lives == 0 then
			ballydir = 0
			ballxdir = 0
			bally = 64
			sfx(5)
		end
	end	
	
	if bally < 0 then
		if lives2 > 0 then
			sfx(3)
			bally = wd/2
			ballx = wd/2
			lives2 -= 1
		end

		else if lives2 == 0 then
			ballydir = 0
			ballxdir = 0
			bally = 64
			sfx(5)
		end
	end	
end


