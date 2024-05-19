// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

`timescale			1ns / 1ps
`default_nettype	none



module serdes_output_to_fin1216
		#(
			parameter	N = 3
		)
		(
			input	wire				reset,
			input	wire				clk,
			input	wire				clk_x7,
			
			input	wire	[N*7-1:0]	in_data,
			
			output	wire				out_clk_p,
			output	wire				out_clk_n,
			output	wire	[N-1:0]		out_data_p,
			output	wire	[N-1:0]		out_data_n
		);
	
	assign out_clk_p = clk_x7;
	assign out_clk_n = ~clk_x7;
	assign out_data_p = {N{clk}};
	assign out_data_n = ~{N{clk}};
	
endmodule


`default_nettype	wire


// end of file
