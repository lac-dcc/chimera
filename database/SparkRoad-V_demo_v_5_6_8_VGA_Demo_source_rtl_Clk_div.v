`timescale 1ns/1ns
module Clk_div
( 
	input  wire		clk,
	input  wire		rst_n,

	output wire 	clk_div
);

wire	Clk_Lock;

PLL uut
(
	.refclk		(clk		),
	.reset		(!rst_n		),
	
	.clk0_out	(clk_div	),
	.extlock	(Clk_Lock	)
);

endmodule
