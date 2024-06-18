// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(BCD, seg);
	
input wire [3:0] BCD;
output reg [6:0]seg;

always@(BCD)
	case(BCD)
		4'b0000: seg = 7'b0000001;
		4'b0001: seg = 7'b1001111;
		4'b0010: seg = 7'b0010010;
		4'b0011: seg = 7'b0000110;
		4'b0100: seg = 7'b1001100;
		4'b0101: seg = 7'b0100100;
		4'b0110: seg = 7'b0100000;
		4'b0111: seg = 7'b0001111;
		4'b1000: seg = 7'b0000000;
		4'b1001: seg = 7'b0000100;
	endcase
endmodule