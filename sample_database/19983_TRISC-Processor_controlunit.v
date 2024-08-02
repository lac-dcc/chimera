// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - TRISC Control Unit

module controlunit(
	input SysClock, StartStop,
	input [3:0] SW,
	output C0, C1, C2, C3, C4, C7, C8, C9, C5, C10, C11, C12, C13, C14/*,
	output [3:0] SWled,
	output [1:0] Bled*/);
	wire LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT;
	fourto11decoder p0 (SW, LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT);
	controller p1 (SysClock, StartStop, LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT, C0, C1, C2, C3, C4, C7, C8, C9, C5, C10, C11, C12, C13, C14);
	//assign SWled = SW;
	//assign Bled[0] = ~StartStop, Bled[1] = ~SysClock;
endmodule 