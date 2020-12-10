
// Project: Pong 
// Author: Haamid Mohammed
// Created: 2018-04-17

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Pong" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

// ------------------------ Creating Image Colors, Sprites and Configuring The Sprites ------------------------ //

CreateImageColor(3, 0, 0, 0, 255)
CreateImageColor(1, 0, 0, 0, 255)
createimagecolor(2, 0, 0, 0, 255)
CreateImageColor(99, 155, 155, 155, 255)
CreateImageColor(4, 217, 14, 14, 255)
CreateImageColor(5, 217, 14, 14, 255)
CreateSprite(99, 99)
for x = 1 to 5
	CreateSprite(x, x)
next x

for x = 1 to 2
SetSpriteSize(x, 20, 100)
next x
for x = 4 to 5
SetSpriteSize(x, 10, 10)
SetSpritePosition(x, -100, -100)
next x

SetSpriteSize(3, 30, 30)
SetSpriteSize(99, GetVirtualWidth(), GetVirtualHeight())
SetSpritePosition(1, 10, GetVirtualHeight()/2-GetSpriteHeight(1)/2)
SetSpritePosition(2, GetVirtualWidth()-GetSpriteWidth(2)-10, GetVirtualHeight()/2-GetSpriteHeight(2)/2)
SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)

// ------------------------ Variables ------------------------ //

// Player 1

bordery = GetVirtualHeight()-GetSpriteHeight(1)
player1y = GetVirtualHeight()/2-GetSpriteHeight(1)/2
speedp1 = 15
pua = 0 // Powerup Active

// AI

speed = 0

// Player 2

player2y = GetVirtualHeight()/2-GetSpriteHeight(2)/2
speedp2 = 15
pua2 = 0 // Powerup Active

// Ball

borderbally = GetVirtualHeight()-GetSpriteHeight(3)
dirx = 1
diry = 1
ballx = getspritex(3)
bally = getspritey(3)
ballspeed = 0

// Random

gameover = 0
win = 0
powerup = 0
side = 0
turn = 0
start = 1

// Variables used to count time

time = 0
pause = 0


// ------------------------ Text ------------------------ //

CreateText(4, "Pong")
SetTextSize(4, 150) 
SetTextPosition(4, GetVirtualWidth()/2-GetTextTotalWidth(4)/2, GetVirtualHeight()/2-GetTextTotalHeight(4)/2)
SetTextVisible(4, 0)
CreateText(5, "Player 1 uses W and S to move, Player 2 uses Up and Down arrows to move.")
SetTextSize(5, 30)
SetTextPosition(5, GetVirtualWidth()/2-GetTextTotalWidth(5)/2, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(5))
SetTextVisible(5, 0)
CreateText(6, "You are on the left side and use the W and S keys to move.")
SetTextSize(6, 30)
SetTextPosition(6, GetVirtualWidth()/2-GetTextTotalWidth(6)/2, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6))
SetTextVisible(6, 0)
createtext(7, "Press Enter to Start.")
SetTextSize(7, 30)
SetTextPosition(7, GetVirtualWidth()/2-GetTextTotalWidth(7)/2, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6)+GetTextTotalHeight(7))
SetTextVisible(7, 0)
createtext(8, "Collect the Red Dots for Powerups")
SetTextSize(8, 30)
SetTextPosition(8, GetVirtualWidth()/2-GetTextTotalWidth(8)/2, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(5)+GetTextTotalHeight(8)+GetTextTotalHeight(7))
SetTextVisible(8, 0)
CreateText(10, "Player 1 Wins")
CreateText(11, "Player 2 Wins")
CreateText(12, "You Win")
CreateText(13, "Computer Wins")
createtext(15, "Thank You for Playing")
SetTextSize(15, 100)
SetTextPosition(15, GetVirtualWidth()/2-GetTextTotalWidth(15)/2, GetVirtualHeight()/2-GetTextTotalHeight(15)/2)
SetTextVisible(15, 0)
for x = 10 to 13
	SetTextSize(x, 50)
	SetTextPosition(x, GetVirtualWidth()/2-GetTextTotalWidth(x)/2, 50)
	SetTextVisible(x, 0)
next x
CreateText(14, "Press ESC to go to the start screen or press Enter to play again.") 
SetTextSize(14, 30)
SetTextPosition(14, GetVirtualWidth()/2-GetTextTotalWidth(14)/2, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(14))
SetTextVisible(14, 0)

// Powerups

for x = 16 to 17
CreateText(x, "Larger paddle")
SetTextSize(x, 50)
SetTextVisible(x, 0)
next x
SetTextPosition(16, GetVirtualWidth()/4 - GetTextTotalWidth(16)/2, 15)
SetTextPosition(17, GetVirtualWidth()/4 * 3 - GetTextTotalWidth(17)/2, 15)
for x = 18 to 19
CreateText(x, "Speed Up")
SetTextSize(x, 50)
SetTextVisible(x, 0)
next x
SetTextPosition(18, GetVirtualWidth()/4 - GetTextTotalWidth(18)/2, 15)
SetTextPosition(19, GetVirtualWidth()/4 * 3 - GetTextTotalWidth(19)/2, 15)
for x = 20 to 21
CreateText(x, "Power Up")
SetTextSize(x, 50)
SetTextVisible(x, 0)
next x
SetTextPosition(20, GetVirtualWidth()/4 - GetTextTotalWidth(20)/2, 15)
SetTextPosition(21, GetVirtualWidth()/4 * 3 - GetTextTotalWidth(21)/2, 15)
for x = 22 to 23
CreateText(x, "Smaller Paddle")
SetTextSize(x, 50)
SetTextVisible(x, 0)
next x
SetTextPosition(22, GetVirtualWidth()/4 - GetTextTotalWidth(22)/2, 15)
SetTextPosition(23, GetVirtualWidth()/4 * 3 - GetTextTotalWidth(23)/2, 15)
for x = 24 to 25
CreateText(x, "Slow Down")
SetTextSize(x, 50)
SetTextVisible(x, 0)
next x
SetTextPosition(24, GetVirtualWidth()/4 - GetTextTotalWidth(24)/2, 15)
SetTextPosition(25, GetVirtualWidth()/4 * 3 - GetTextTotalWidth(25)/2, 15)

// ------------------------ Buttons ------------------------ //

for x = 8 to 12
AddVirtualButton(x, 100, 100, 100)
SetVirtualButtonColor(x, 30, 144, 255)
next x

AddVirtualButton(1, 100, 100, 50)
SetVirtualButtonColor(1, 255, 0, 0)
SetVirtualButtonText(1, "Quit")
SetVirtualButtonPosition(1, GetVirtualWidth()-50, 50)
SetVirtualButtonText(10, "Easy")
SetVirtualButtonText(11, "Normal")
SetVirtualButtonText(12, "Hard")
SetVirtualButtonText(8, "1 Player")
SetVirtualButtonText(9, "2 Player")
SetVirtualButtonPosition(8,  GetVirtualWidth()/4, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6)+GetTextTotalHeight(7)+25)
SetVirtualButtonPosition(9,  GetVirtualWidth()/4 * 3, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6)+GetTextTotalHeight(7)+25)
SetVirtualButtonPosition(10, GetVirtualWidth()/6, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6)+GetTextTotalHeight(7)+25)
SetVirtualButtonPosition(11, GetVirtualWidth()/2, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6)+GetTextTotalHeight(7)+25)
SetVirtualButtonPosition(12, GetVirtualWidth()/6 * 5, GetVirtualHeight()/2+GetTextTotalHeight(4)/2+GetTextTotalHeight(6)+GetTextTotalHeight(7)+25)
SetVirtualButtonActive(1, 0)
SetVirtualButtonVisible(1, 0)

for x = 8 to 12
SetVirtualButtonActive(x, 0)
SetVirtualButtonVisible(x, 0)
next x





do
	
    gosub startscreen
    gosub _2player
    gosub singleplayer
    gosub Difficulty
    gosub AI
	gosub player1_movement
	gosub player2_movement
    gosub ballmovement
    gosub gameover
	gosub powerups
	print(speed)
    Sync()
loop

// ------------------------ Subroutines ------------------------ //

startscreen:
while start = 1
	SetVirtualButtonActive(1, 1)
	SetVirtualButtonVisible(1, 1)
	SetTextVisible(4, 1)
	SetSpriteVisible(3, 0)
	for x = 8 to 9
	SetVirtualButtonActive(x, 1)
	SetVirtualButtonVisible(x, 1)
	next x
	if GetVirtualButtonState(8) = 1
		start = 3
		for x = 8 to 9
		SetVirtualButtonActive(x, 0)
		SetVirtualButtonVisible(x, 0)
		next x
		while pause < 15
			pause = pause + 1
			sync()
		endwhile
		pause = 0

	endif
	if GetVirtualButtonState(9) = 1
		start = 2
		for x = 8 to 9
		SetVirtualButtonActive(x, 0)
		SetVirtualButtonVisible(x, 0)
		next x
		

	endif
	if GetVirtualButtonState(1) = 1
		
		while not pause = 60
			SetTextVisible(15, 1)
			settextvisible(5, 0)
			SetTextVisible(4, 0)
			SetTextVisible(7, 0)
			settextvisible(8, 0)
			for x = 8 to 12
				SetVirtualButtonActive(x, 0)
				SetVirtualButtonVisible(x, 0)
			next x
			pause = pause + 1
			if pause = 60
				end
			endif
			sync()
		endwhile
		
	endif
	game = 0
	sync()
endwhile
return
_2player:
while start = 2
	SetTextVisible(5, 1)
	SetTextVisible(7, 1)
	SetTextVisible(8, 1)
	if GetRawKeyPressed(13)
		start = 0
		settextvisible(5, 0)
		SetTextVisible(4, 0)
		SetTextVisible(7, 0)
		SetTextVisible(8, 0)
		SetSpriteVisible(3, 1)
		rnddirx = Random(1, 2)
		if rnddirx = 1
			dirx = 1
		endif
		if rnddirx = 2
			dirx = -1
		endif
		rnddiry = Random(1, 2)
		if rnddiry = 1
			diry = 1
		endif
		if rnddirx = 2
			diry = -1
		endif
		SetVirtualButtonActive(1, 0)
		SetVirtualButtonVisible(1, 0)
	endif
		if GetVirtualButtonState(1) = 1
		
		while not pause = 60
			SetTextVisible(15, 1)
			settextvisible(5, 0)
			SetTextVisible(4, 0)
			SetTextVisible(7, 0)
			SetTextVisible(8, 0)
			for x = 8 to 12
				SetVirtualButtonActive(x, 0)
				SetVirtualButtonVisible(x, 0)
			next x
			pause = pause + 1
			if pause = 60
				end
			endif
			sync()
		endwhile
		
	endif
	game = 1
	sync()
	
endwhile
return

Difficulty:
while start = 3
	for x = 10 to 12
		SetVirtualButtonActive(x, 1)
		SetVirtualButtonVisible(x, 1)
	next x
	if GetVirtualButtonState(10) = 1
		
		for x = 10 to 12
		SetVirtualButtonActive(x, 0)
		SetVirtualButtonVisible(x, 0)
		next x
		maxspeed = 20
		speed = 5
		start = 4
		
	endif
	if GetVirtualButtonState(11) = 1
		start = 4
		for x = 10 to 12
		SetVirtualButtonActive(x, 0)
		SetVirtualButtonVisible(x, 0)
		
		next x
		speed = 5
		maxspeed = 30
	endif
	if GetVirtualButtonState(12) = 1
		start = 4
		for x = 10 to 12
		SetVirtualButtonActive(x, 0)
		SetVirtualButtonVisible(x, 0)
		
		next x
		speed = 5
		maxspeed = 50
	endif
		if GetVirtualButtonState(1) = 1
		
		while not pause = 60
			SetTextVisible(15, 1)
			settextvisible(5, 0)
			SetTextVisible(4, 0)
			SetTextVisible(7, 0)
			for x = 8 to 12
				SetVirtualButtonActive(x, 0)
				SetVirtualButtonVisible(x, 0)
			next x
			pause = pause + 1
			if pause = 60
				end
			endif
			sync()
		endwhile
		
	endif
	game = 2
	sync()
endwhile
return

AI:
if game = 2
	if speed < maxspeed
		if speed < ballspeed+12
			speed = speed + 1
		endif
	endif
	if getspritey(2)+GetSpriteHeight(2)/2 > getspritey(3)-GetSpriteHeight(3)/2
		if getspritey(2) <= 0
			player2y = 0
		else
			player2y = player2y - speed
		endif
	endif
	if getspritey(2)-GetSpriteHeight(2)/2 < getspritey(3)-GetSpriteHeight(3)/2
		if getspritey(2) >= GetVirtualHeight()-GetSpriteHeight(2) 
			player2y = GetVirtualHeight()-GetSpriteHeight(2)
		else
			player2y = player2y + speed
		endif
	endif
	SetSpritePosition(2, GetVirtualWidth()-GetSpriteWidth(2)-10 , player2y)
endif
return


singleplayer:
while start = 4
	SetTextVisible(6, 1)
	SetTextVisible(7, 1)
	
	if GetRawKeyPressed(13)
		start = 0
		settextvisible(6, 0)
		SetTextVisible(7, 0)
		SetTextVisible(4, 0)
		SetSpriteVisible(3, 1)
		rnddirx = Random(1, 2)
		if rnddirx = 1
			dirx = 1
		endif
		if rnddirx = 2
			dirx = -1
		endif
		rnddiry = Random(1, 2)
		if rnddiry = 1
			diry = 1
		endif
		if rnddirx = 2
			diry = -1
		endif
		SetVirtualButtonActive(1, 0)
		SetVirtualButtonVisible(1, 0)
	endif
		if GetVirtualButtonState(1) = 1
		
		while not pause = 60
			SetTextVisible(15, 1)
			settextvisible(5, 0)
			SetTextVisible(4, 0)
			SetTextVisible(7, 0)
			for x = 8 to 12
				SetVirtualButtonActive(x, 0)
				SetVirtualButtonVisible(x, 0)
			next x
			pause = pause + 1
			if pause = 60
				end
			endif
			sync()
		endwhile
		
	endif
	game = 2
	sync()
endwhile
return

player1_movement:
if game = 1
	if GetRawKeystate(87) = 1
		if getspritey(1) <= 0
			player1y = 0
		else
			player1y = player1y - speedp1
		endif
	endif
	if GetRawKeystate(83) = 1
		if getspritey(1) >= bordery
			player1y = bordery
		else
			player1y = player1y + speedp1
		endif
	endif
	SetSpritePosition(1, 10, player1y)
endif
if game = 2
	if GetRawKeystate(87) = 1
		if getspritey(1) <= 0
			player1y = 0
		else
			player1y = player1y - 15
		endif
	endif
	if GetRawKeystate(83) = 1
		if getspritey(1) >= bordery
			player1y = bordery
		else
			player1y = player1y + 15
		endif
	endif
	SetSpritePosition(1, 10, player1y)
endif
return

player2_movement:
if game = 1
	if GetRawKeystate(38) = 1
		if getspritey(2) <= 0
			player2y = 0
		else
			player2y = player2y - speedp2
		endif
	endif
	if GetRawKeystate(40) = 1
		if getspritey(2) >= bordery
			player2y = bordery
		else
			player2y = player2y + speedp2
		endif
	endif
	SetSpritePosition(2, GetVirtualWidth()-GetSpriteWidth(2)-10 , player2y)
endif
return

ballmovement:
if game = 1 or 2
	
	if getspritey(3) <= 0
		diry = -1
	endif
	if getspritey(3) >= borderbally
		diry = 1
	endif
	if GetSpriteCollision(1, 3)
		dirx = 1
		ballspeed = ballspeed + 1
		turn = turn + 1
	endif
	if GetSpriteCollision(2, 3)
		dirx = -1
		ballspeed = ballspeed + 1
		turn = turn + 1
	endif

	
	
	bally = bally - (10+ballspeed)*diry
	ballx = ballx + (10+ballspeed)*dirx
	SetSpritePosition(3, ballx, bally)
endif
return
	
gameover:
if game = 1
	if ballx >= GetVirtualWidth()
		gameover = 1
		win = 1
	endif
	if ballx < 0-GetSpriteWidth(3)
		gameover = 1
		win = 2
	endif
	while gameover = 1
		SetSpriteSize(1, 20, 100)
		SetSpriteSize(2, 20, 100)
		SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)
		SetSpritePosition(1, 10, GetVirtualHeight()/2-GetSpriteHeight(1)/2)
		SetSpritePosition(2, GetVirtualWidth()-GetSpriteWidth(2)-10, GetVirtualHeight()/2-GetSpriteHeight(2)/2)
		ballx = getspritex(3)
		bally = getspritey(3)
		player1y = getspritey(1)
		player2y = getspritey(2)
		SetVirtualButtonVisible(1, 1)
		SetVirtualButtonActive(1, 1)
		ballspeed = 0
		speed = 0
		for x = 16 to 25
			SetTextVisible(x, 0)
		next x
		for x = 4 to 5
			SetSpritePosition(x, -100, 100)
		next x
		turn = 0
		powerup = 0
		side = 0
		time = 0
		pua = 0
		pua2 = 0
		speedp1 = 15
		speedp2 = 15
		
		if win = 2
			SetTextVisible(11, 1)
			settextvisible(14, 1)
			SetTextVisible(4, 1)
			SetSpriteVisible(3, 0)
			SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)
		endif
		if win = 1
			SetTextVisible(10, 1)
			settextvisible(14, 1)
			SetTextVisible(4, 1)
			SetSpriteVisible(3, 0)
			SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)
		endif
		if GetRawKeyPressed(13) = 1
			
			SetTextVisible(10, 0)
			settextvisible(14, 0)
			SetTextVisible(4, 0)
			SetSpriteVisible(3, 1)
			SetTextVisible(11, 0)
			SetVirtualButtonVisible(1, 0)
			SetVirtualButtonActive(1, 0)
			gameover = 0
			win = 0
			ballspeed = 0
			rnddirx = Random(1, 2)
			if rnddirx = 1
				dirx = 1
			endif
			if rnddirx = 2
				dirx = -1
			endif
			rnddiry = Random(1, 2)
			if rnddiry = 1
				diry = 1
			endif
			if rnddirx = 2
				diry = -1
			endif
			sync()
		endif
		if GetRawKeyPressed(27)
			SetTextVisible(10, 0)
			settextvisible(14, 0)
			SetTextVisible(4, 1)
			SetSpriteVisible(3, 0)
			SetTextVisible(11, 0)
			gameover = 0
			win = 0
			start = 1
			SetVirtualButtonVisible(1, 0)
			SetVirtualButtonActive(1, 0)
			sync()
		endif
			if GetVirtualButtonState(1) = 1
		
		while not pause = 60
			SetTextVisible(15, 1)
			settextvisible(5, 0)
			SetTextVisible(4, 0)
			SetTextVisible(7, 0)
			SetTextVisible(10, 0)
			settextvisible(14, 0)
			SetSpriteVisible(3, 0)
			SetTextVisible(11, 0)
			for x = 8 to 12
				SetVirtualButtonActive(x, 0)
				SetVirtualButtonVisible(x, 0)
			next x
			pause = pause + 1
			if pause = 60
				end
			endif
			sync()
		endwhile
		
	endif
		sync()
	endwhile
endif
if game = 2
	if ballx >= GetVirtualWidth()
		gameover = 1
		win = 1
	endif
	if ballx <= 0 -GetSpriteWidth(3)
		gameover = 1
		win = 2
	endif
	while gameover = 1
		SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)
		SetSpritePosition(1, 10, GetVirtualHeight()/2-GetSpriteHeight(1)/2)
		SetSpritePosition(2, GetVirtualWidth()-GetSpriteWidth(2)-10, GetVirtualHeight()/2-GetSpriteHeight(2)/2)
		ballx = getspritex(3)
		bally = getspritey(3)
		player1y = getspritey(1)
		player2y = getspritey(2)
		SetVirtualButtonVisible(1, 1)
		SetVirtualButtonActive(1, 1)
		ballspeed = 0
		speed = 10
		for x = 4 to 5
			SetSpritePosition(x, -100, 100)
		next x
		if win = 2
			SetTextVisible(13, 1)
			settextvisible(14, 1)
			SetTextVisible(4, 1)
			SetSpriteVisible(3, 0)
			SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)
		endif
		if win = 1
			SetTextVisible(12, 1)
			settextvisible(14, 1)
			SetTextVisible(4, 1)
			SetSpriteVisible(3, 0)
			SetSpritePosition(3, GetVirtualWidth()/2-GetSpriteWidth(3)/2, GetVirtualHeight()/2-GetSpriteHeight(3)/2)
		endif
		if GetRawKeyPressed(13) = 1
			
			SetTextVisible(12, 0)
			settextvisible(14, 0)
			SetTextVisible(4, 0)
			SetSpriteVisible(3, 1)
			SetTextVisible(13, 0)
			gameover = 0
			win = 0
			ballspeed = 0
			rnddirx = Random(1, 2)
			if rnddirx = 1
				dirx = 1
			endif
			if rnddirx = 2
				dirx = -1
			endif
			rnddiry = Random(1, 2)
			if rnddiry = 1
				diry = 1
			endif
			if rnddirx = 2
				diry = -1
			endif
			SetVirtualButtonVisible(1, 0)
			SetVirtualButtonActive(1, 0)
		endif
		if GetRawKeyPressed(27)
			SetTextVisible(12, 0)
			settextvisible(14, 0)
			SetTextVisible(4, 1)
			SetSpriteVisible(3, 0)
			SetTextVisible(13, 0)
			gameover = 0
			win = 0
			start = 1
		endif
		if GetVirtualButtonState(1) = 1
		
			while not pause = 60
				SetTextVisible(15, 1)
				settextvisible(5, 0)
				SetTextVisible(4, 0)
				SetTextVisible(7, 0)
				SetTextVisible(10, 0)
				settextvisible(14, 0)
				SetSpriteVisible(3, 0)
				SetTextVisible(11, 0)
				SetTextVisible(12, 0)
				SetTextVisible(13, 0)
				for x = 8 to 12
					SetVirtualButtonActive(x, 0)
					SetVirtualButtonVisible(x, 0)
				next x
				pause = pause + 1
				if pause = 60
					end
				endif
				sync()
			endwhile
			
		endif
		sync()
	endwhile
endif
return

/*
1 make paddle larger
2 make paddle faster
3 make ball faster when you hit it but slow when they hit it
4 make enemy slow
5 make enemy paddle smaller

*/

powerups:
if game = 1
	if turn >= 5
		powerup = 1
		turn = 0
	endif
	
	if powerup = 1 
		side = random(1, 2)
		if side = 1
			gosub sprite4pos 
			powerup = 0
		endif
		if side = 2
			gosub sprite5pos
			powerup = 0
		endif
	endif
	
	// Player 1
	
	if GetSpriteCollision(1, 4)
		SetSpritePosition(4, -100, -100)
		pua = random(1, 5)
		
	endif
	if pua = 1
		SetSpriteSize(1, 20, 200)
		if time < 150
			time = time + 1
			SetTextVisible(16, 1)
		else
			SetSpriteSize(1, 20, 100)
			SetTextVisible(16, 0)
			time = 0
			pua = 0
		endif
	endif
	if pua = 2
		speedp1 = 30
		if time < 150
			time = time + 1
			SetTextVisible(18, 1)
		else
			speedp1 = 15
			SetTextVisible(18, 0)
			time = 0
			pua = 0
		endif
	endif
	if pua = 3
		if GetSpriteCollision(1, 3)
			ballspeed = ballspeed + 5
		endif
		if GetSpriteCollision(2, 3)
			ballspeed = ballspeed - 5
		endif
		if time < 150
			time = time + 1
			SetTextVisible(20, 1)
		else
			ballspeed = ballspeed - 5
			SetTextVisible(20, 0)
			time = 0
			pua = 0
		endif
	endif
	if pua = 4
		speedp2 = 10
		if time < 150
			time = time + 1
			SetTextVisible(25, 1)
		else
			SetTextVisible(25, 0)
			speedp2 = 15
			time = 0
			pua = 0
		endif
	endif
	if pua = 5
		SetSpriteSize(2, 20, 75)
		speedp2 = 20
		if time < 150
			time = time + 1
			SetTextVisible(23, 1)
		else
			SetSpriteSize(2, 20, 100)
			SetTextVisible(23, 0)
			time = 0
			pua = 0
		endif
	endif
	
	// Player 2
	
	if GetSpriteCollision(2, 5)
		SetSpritePosition(5, -100, -100)
		pua2 = random(1, 5)
	endif
	if pua2 = 1
		SetSpriteSize(2, 20, 200)
		if time < 150
			time = time + 1
			SetTextVisible(17, 1)
		else
			SetSpriteSize(2, 20, 100)
			SetTextVisible(17, 0)
			time = 0
			pua2 = 0
		endif
	endif
	if pua2 = 2
		speedp2 = 30
		if time < 150
			time = time + 1
			SetTextVisible(19, 1)
		else
			speedp2 = 15
			time = 0
			SetTextVisible(19, 0)
			pua2 = 0
		endif
	endif
	if pua2 = 3
		if GetSpriteCollision(2, 3)
			ballspeed = ballspeed + 5
		endif
		if GetSpriteCollision(1, 3)
			ballspeed = ballspeed - 5
		endif
		if time < 150
			time = time + 1
			SetTextVisible(21, 1)
		else
			ballspeed = ballspeed - 5
			SetTextVisible(21, 0)
			time = 0
			pua2 = 0
		endif
	endif
	if pua2 = 4
		speedp1 = 10
		if time < 150
			time = time + 1
			SetTextVisible(24, 1)
		else
			speedp1 = 15
			SetTextVisible(24, 0)
			time = 0
			pua2 = 0
		endif
	endif
	if pua2 = 5
		SetSpriteSize(1, 20, 75)
		if time < 150
			time = time + 1
			SetTextVisible(22, 1)
		else
			SetSpriteSize(1, 20, 100)
			SetTextVisible(22, 0)
			time = 0
			pua2 = 0
		endif
	endif
endif		
return

sprite4pos:
SetSpritePosition(4, 15, random(10, GetVirtualHeight()-10))
return


sprite5pos:
SetSpritePosition(5, GetVirtualWidth()-15, random(10, GetVirtualHeight()-10))
return
		
