// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - HW8 P2 parameterized 4-bit PI/PO reg

module piporeg #(parameter N = 4)(
	input [N-1:0] x,
	input CLK, CLR,
	output reg [N-1:0] y);
		always @ (negedge CLK, negedge CLR)
			begin 
				if (CLR == 1'b0) y <= 0;
					else if (CLK == 1'b0) y <= x;
			end
endmodule 