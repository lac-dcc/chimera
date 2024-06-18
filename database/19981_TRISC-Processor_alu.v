// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - 4-bit ALU with two's complement ADD/SUB w/ OVR detection and logical AND/XOR

module alu (
	input [3:0] A, B,
	input S0, S1,
	output [3:0] R, //Aout, Bout,
	output OVR, Cout/*, S0out, S1out, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2*/);
	wire [3:0] X, N, S, XN, out;
	ripplecarryadder r0 (A, B, S0, S, out[0], out[1]);
	assign N = A & B;
	assign X = A ^ B;
	assign XN = S0 == 0 ? N : X;
	assign R = S1 == 0 ? S : XN;
	//assign Aout = A, Bout = B, S0out = S0, S1out = S1;
	assign OVR = S1 == 1 ? 0 : out[0], Cout = S1 == 1 ? 0 : out[1];
	//sevensegdec r1 (R[3], R[2], R[1], R[0], a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2);
endmodule 
