// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

module HSV2RGB
(
	input wire					clk,
	input wire					rst,
	
	input wire	[ 8: 0]			H,
	input wire	[10: 0]			S,
	input wire	[ 7: 0]			V,
	
	output reg	[ 7: 0]			r,	
	output reg	[ 7: 0]			g,	
	output reg	[ 7: 0]			b		
);
localparam DIV_DELAY = 9;
//st1
reg			[18: 0]		C;
wire 		[22: 0]		div_H_60;
reg			[ 7: 0]		st1_V;
reg 		[ 5: 0]	 	chz;
wire		[ 5: 0]  	remain_H;
//st2
reg signed 	[15: 0]		sub_1;
reg			[ 7: 0]		m;
//st3
wire	 	[15: 0]		abs_sub_1;
//st4
reg	 		[15: 0]		sub_abs_sub_1;
//st5
reg			[23: 0]		X;

wire 		[ 5: 0]	 	chz_delay;
wire		[ 7: 0]		m_delay;
wire 		[ 7: 0] 	C_delay;
reg 		[ 7: 0] 	C_delay_1;
//st1
	always @( posedge clk )
		C = S * V;

rgb2hsv_divider_X_60 rgb2hsv_divider_X_60_inst
(
	.clock			( clk						),
	.denom          ( 60						),
	.numer          ( { H, 14'h0 }				),
	.quotient       ( div_H_60	 				),
	.remain		    ( remain_H					)
);	

	always @( posedge clk )
		st1_V <= V;

	
	always @( posedge clk )
		if ( ( H >= 0 ) && ( H < 60 ) )
			chz <= 6'b100000;
		else if ( ( H >= 60 ) && ( H < 120 ) )
			chz <= 6'b010000;
		else if ( ( H >= 120 ) && ( H < 180 ) )
			chz <= 6'b001000;	
		else if ( ( H >= 180 ) && ( H < 240 ) )
			chz <= 6'b000100;	
		else if ( ( H >= 240 ) && ( H < 300 ) )
			chz <= 6'b000010;	
		else if ( ( H >= 300 ) && ( H <= 360 ) )
			chz <= 6'b000001;	
//st2
	always @( posedge clk )
	//	sub_1 <= ( remain_H[5] == 1 ) ? ( div_H_60[15:0] - 16383 ) : ( div_H_60[15:0] - 16384 );
		sub_1 <= ( remain_H[5] == 1 ) ? ( div_H_60[14:0] - 16383 ) : ( div_H_60[14:0] - 16384 );
		
wire [7:0] div_C = ( C[7] == 1 ) ? C[18-:8] + 1 : C[18-:8];

	always @( posedge clk )
		m <= st1_V - div_C;/*C[18-:8];*/
		
//st3	
abs
#(
	.W	( 16 )
)
abs_inst
(
	.clk		( clk		),   
	.data_in    ( sub_1		),
	.data_out	( abs_sub_1	)
);	
//st4
	always @( posedge clk )
		sub_abs_sub_1 <= 16384 - abs_sub_1;
//st 5
	always @( posedge clk )
		X <= sub_abs_sub_1 * C_delay;
delay_rg
#(
	.W				( 6				),
	.D				( 4	+ DIV_DELAY	)
)
delay_rg_chz
(
	.clk			( clk			),
	.data_in		( chz			),
	.data_out       ( chz_delay		)
);		

delay_rg
#(
	.W				( 8				),
	.D				( 3	+ DIV_DELAY	)
)
delay_rg_m
(
	.clk			( clk			),
	.data_in		( m				),
	.data_out       ( m_delay		)
);	

delay_rg
#(
	.W				( 8				),
	.D				( 3	+ DIV_DELAY	)
)
delay_rg_C
(
	.clk			( clk			),
	.data_in		( div_C			),
	.data_out       ( C_delay		)
);	
	
	always @( posedge clk )
		C_delay_1 <= C_delay;

	wire [7:0] test = X[22:14];
	always @( posedge clk )
		case ( chz_delay )
			6'b100000:	begin
							r <= C_delay_1 + m_delay;
							g <= X[22:14] + m_delay;
							b <= m_delay;			
						end
			6'b010000:	begin
							r <= X[22:14] + m_delay;
							g <= C_delay_1 + m_delay;
							b <= m_delay;			
						end		
			6'b001000:	begin
							r <= m_delay;
							g <= C_delay_1 + m_delay;
							b <= X[22:14] + m_delay;			
						end		
			6'b000100:	begin
							r <= m_delay;
							g <= X[22:14] + m_delay;
							b <= C_delay_1 + m_delay;			
						end		
			6'b000010:	begin
							r <= X[22:14] + m_delay;
							g <= m_delay;
							b <= C_delay_1 + m_delay;			
						end	
			6'b000001:	begin
							r <= C_delay_1 + m_delay;
							g <= m_delay;
							b <= X[22:14] + m_delay;			
						end						
			default:	begin
							r <= 8'h0;
							g <= 8'h0;
							b <= 8'h0;
						end
		endcase
endmodule
