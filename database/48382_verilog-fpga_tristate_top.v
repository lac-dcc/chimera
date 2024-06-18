// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240414

`default_nettype none

module top (
	input wire TopIn,
	input wire TopEnable,
	output wire TopOut
);
	
	TriState TriState_inst(
		.DataIn(TopIn),
		.OutputEnable(TopEnable),
		.DataOut(TopOut)
	);

endmodule

`default_nettype wire
