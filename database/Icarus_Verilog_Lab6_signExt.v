`ifndef SIGN_EXT
`define SIGN_EXT
		
	module signExt(
		input [15:0] inp,
		output [31:0] seOutp);	
		
		assign seOutp = {16{inp[15]},inp[15:0]};
		
	endmodule
`endif