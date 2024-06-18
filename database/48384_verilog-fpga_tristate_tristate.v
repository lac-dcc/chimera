// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240414

`default_nettype none

module TriState (
	input  wire DataIn,
	input  wire OutputEnable,
	output wire DataOut
);
	
	assign DataOut = OutputEnable ? DataIn : 1'bZ;

endmodule

`default_nettype wire
