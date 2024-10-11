// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

module HSV_changing_math
(
	input wire					clk,
	
	input wire	[ 8: 0]			H_before,
	input wire	[10: 0]			S_before,
	input wire	[ 7: 0]			V_before,	
	
	output wire	[ 8: 0]			H_after,
	output wire	[10: 0]			S_after,
	output wire	[ 7: 0]			V_after,	

	input wire	[ 8: 0]			control_S,
	input wire	[ 8: 0]			control_V	
);
localparam DIV_DELAY = 9;
wire [ 8: 0] sh_H;
wire [10: 0] sh_S;
wire [ 7: 0] sh_V;

wire [17: 0] S_div_100;
wire [14: 0] V_div_100;

reg [18: 0] S_mult_contr_div_100;
reg [14: 0] V_mult_contr_div_100;

reg [11: 0] S_summ;
reg [ 9: 0] V_summ;

delay_rg
#(
	.W				( 9				),
	.D				( 3 + DIV_DELAY	)
)
delay_rg_H
(
	.clk			( clk			),
	.data_in		( H_before		),
	.data_out       ( H_after		)
);	

delay_rg
#(
	.W				( 11			),
	.D				( 2 + DIV_DELAY	)
)
delay_rg_S
(
	.clk			( clk			),
	.data_in		( S_before		),
	.data_out       ( sh_S			)
);	

delay_rg
#(
	.W				( 8				),
	.D				( 2 + DIV_DELAY	)
)
delay_rg_V
(
	.clk			( clk			),
	.data_in		( V_before		),
	.data_out       ( sh_V			)
);	


//assign S_div_100 = { S_before, 7'h0 } / 100;
HSV_changing_math_divider_S HSV_changing_math_divider_S_inst
(
	.clock			( clk				),
	.denom          ( 7'd100			),
	.numer          ( { S_before, 7'h0 }),
	.quotient       ( S_div_100			),
	.remain         ()
);
//assign V_div_100 = { V_before, 7'h0 } / 100;
HSV_changing_math_divider_V HSV_changing_math_divider_V_inst
(
	.clock			( clk				),
	.denom          ( 7'd100			),
	.numer          ( { V_before, 7'h0 }),
	.quotient       ( V_div_100			),
	.remain         ()
);

always @( posedge clk )
	begin
		S_mult_contr_div_100 <= S_div_100 * control_S[6:0];
		V_mult_contr_div_100 <= V_div_100 * control_V[6:0];
	end
	
always @( posedge clk )	
	if ( control_S[7] )
		S_summ <= sh_S - S_mult_contr_div_100[18:7];
	else
		S_summ <= sh_S + S_mult_contr_div_100[18:7];
		
always @( posedge clk )		
	if ( control_V[7] )
		V_summ <= sh_V - V_mult_contr_div_100[14:7];
	else
		V_summ <= sh_V + V_mult_contr_div_100[14:7];
			
	
	
assign S_after =  S_summ[11]  ? 11'h7ff : S_summ[10:0];  
assign V_after =  V_summ[9]   ? 8'hff 	: V_summ[7:0];  
	
	
endmodule