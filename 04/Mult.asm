// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Adds 1+...+100.






@sum
M=0    //sum=0
@R1
D=M
@n
M=D    //n=R1


(LOOP)

@BREAK
D;JEQ

@R0
D=M
@sum
M=M+D
@n
M=M-1
D=M
@LOOP
0;JMP




(BREAK)
@sum
D=M
@R2
M=D

(END)
@END
0;JMP








