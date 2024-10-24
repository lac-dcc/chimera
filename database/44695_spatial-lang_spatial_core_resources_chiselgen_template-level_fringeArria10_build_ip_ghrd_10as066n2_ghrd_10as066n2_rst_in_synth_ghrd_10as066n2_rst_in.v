// This program was cloned from: https://github.com/stanford-ppl/spatial-lang
// License: MIT License

// ghrd_10as066n2_rst_in.v

// Generated using ACDS version 17.1 240

`timescale 1 ps / 1 ps
module ghrd_10as066n2_rst_in (
		input  wire  clk,         //       clk.clk
		input  wire  in_reset_n,  //  in_reset.reset_n
		output wire  out_reset_n  // out_reset.reset_n
	);

	assign out_reset_n = in_reset_n;

endmodule
