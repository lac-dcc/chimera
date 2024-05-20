// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(s,adad);
	input[3:0] adad;
	output reg [6:0] s;
	always @ (*) begin 
		case (adad)
			0 : s = 7'b1111110;
			1 : s = 7'b1100000;
			2 : s = 7'b1011011;
			3 : s = 7'b1110011;
			4 : s = 7'b1100101;
			5 : s = 7'b0110111;
			6 : s = 7'b0111111;
			7 : s = 7'b1100010;
			8 : s = 7'b1111111;
			9 : s = 7'b1110111;
			default : s = 7'b0000000;
		endcase
	end
endmodule 