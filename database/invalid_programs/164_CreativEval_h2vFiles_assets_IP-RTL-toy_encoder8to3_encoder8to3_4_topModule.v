// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top (input wire [2:0] in, output wire outid, output wire [2:0] out);
always@(*)
case (in)
	8'b0000_0001: out = 3'd0;
	8'b0000_0010: out = 3'd1;
	8'b0000_0100: out = 3'd2;
	8'b0000_1000: out = 3'd3;
	8'b0001_0000: out = 3'd4;
	8'b0010_0000: out = 3'd5;
	8'b0100_0000: out = 3'd6;
	8'b1000_0000: out = 3'd7;
endcase
assign valid = |out;
endmodule
