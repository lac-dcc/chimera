// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

module HSV_changing
(
	input wire					clk,
	input wire					rst,
	
	input wire	[ 7: 0]			r_in,
	input wire	[ 7: 0]			g_in,
	input wire	[ 7: 0]			b_in,
	input wire					valid_in,
	input wire					sop_in,	
	input wire					eop_in,		
	
	output wire	[ 7: 0]			r_out,	
	output wire	[ 7: 0]			g_out,	
	output wire	[ 7: 0]			b_out,
	output wire					valid_out,
	output wire					sop_out,	
	output wire					eop_out,

	input wire	[ 8: 0]			control_S,
	input wire	[ 8: 0]			control_V	
);


wire	[ 8: 0]			H_before;
wire	[10: 0]			S_before;
wire	[ 7: 0]			V_before;	


wire	[ 8: 0]			H_after;
wire	[10: 0]			S_after;
wire	[ 7: 0]			V_after;	

RGB2HSV RGB2HSV_inst
(
	.clk		( clk			),
	.rst        ( rst			),
	.r          ( r_in			),
	.g          ( g_in			),
	.b	        ( b_in			),
	.H			( H_before		),
	.S          ( S_before		),
	.V          ( V_before		)	
);	


HSV_changing_math HSV_changing_math_inst
(
	.clk			( clk		),
	.H_before       ( H_before	),
	.S_before       ( S_before	),
	.V_before       ( V_before	),
	.H_after        ( H_after	),
	.S_after        ( S_after	),
	.V_after        ( V_after	),
	.control_S      ( control_S	),
	.control_V	    ( control_V	)
);	

HSV2RGB HSV2RGB_inst
(
	.clk		( clk			),
	.rst        ( rst			),	
	.H			( H_after		),
	.S          ( S_after		),
	.V          ( V_after		),	
	.r          ( r_out			),
	.g          ( g_out			),
	.b	        ( b_out			)
);	

delay_rg
#(
	.W				( 3				),
	.D				( 18+27			)
)
delay_rg_C
(
	.clk			( clk								),
	.data_in		( { valid_in, sop_in, eop_in }		),
	.data_out       ( { valid_out, sop_out, eop_out }	)
);	
	
 	

	
endmodule