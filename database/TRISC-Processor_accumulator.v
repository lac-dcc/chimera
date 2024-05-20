// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - HW8 P4 4-bit accumulator

module accumulator (
	input [3:0] A, B,
	input INC, LDR, CLR, AB,
	output [3:0] Z);
	wire [3:0] W;
	twoto1mux s0 (A, B, AB, W);
	upcounter s1 (INC, CLR, LDR, W, Z);
endmodule 