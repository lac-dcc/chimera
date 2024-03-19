`ifndef SHIFTER
`define SHIFTER
	module shifter(
		input [31:0] inp,
		output [31:0] outp);
		
		assign outp = {inp[29:0],2'b00};
		
	endmodule
`endif