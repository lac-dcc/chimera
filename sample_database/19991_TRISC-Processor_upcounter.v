// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - HW8 P3 parameterized 4-bit binary up counter

module upcounter #(parameter N = 4) (
	input INC, CLR, LDR,
	input [N-1:0] x,
	output reg [N-1:0] y);
	always @ (negedge INC, negedge CLR, negedge LDR)
		if (CLR == 1'b0) y <= 0;
			else if (LDR == 1'b0) y <= x;
			else if (INC == 1'b0) y <= y + 1'b1;
endmodule 