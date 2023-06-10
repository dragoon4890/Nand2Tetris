// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(READ_INPUT)
	@KBD
	D=M                                             // keyboard input , if pressed its not 0

	@color
	M=0                                              // default white

	@FILL_SCREEN
	D;JEQ // if keyboard = 0, goto FILL_SCREEN            

	@MAKE_COLOR_BLACK
	0;JMP // else, goto MAKE_COLOR_BLACK and then fill screen


(MAKE_COLOR_BLACK)
@color
M=-1                                        // colour when key pressed

(FILL_SCREEN)
	// if @color = -1 then screen becomes black,
	// else if @color = 0, screen becomes white

	@SCREEN
	D=A                                             
	@screen
	M=D // screen = SCREEN             // SCREEN points to the first word , whereas we need to go through every word , so using a pointer variable screen

	(FILL_LOOP)
		@color
		D=M
		@screen
		A=M                                   // location of screen changed to SCREEN
		M=D // MEM[SCREEN location] = color               // storing color in SCREEN

		@screen
		M=M+1 // MEM[screen] += 1     // Increasing word or pixels

		@24576 // Starting screen pixel + 16k or end screen pixel  for terminating point
		D=A
		@screen
		D=D-M // D = 24576 - screen           
	@FILL_LOOP
	D;JGT // if D > 0 goto FILL_LOOP  for covering each word

@READ_INPUT  // refreshing 
0;JMP