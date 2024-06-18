// This program was cloned from: https://github.com/dh219/DSTB
// License: GNU General Public License v2.0

/* DAVID'S ST BOOSTER v 1 (DSTB1) 				*/
/* Copyright 2022 D Henderson 						*/
/* Released under the terms of the GPLv2 	*/
/* based on https://www.eetimes.com/techniques-to-make-clock-switching-glitch-free/# */

module clockmux( 
	input clk0,
	input clk1,
	input select, // low = clk0
	output active0, output active1,
	output out_clock);
	
	/* this is the two stage non-related clock version -- changes too slowly
	
	wire A, B;
	wire I1, I2, I3, I4;
	wire E1, E2;
	
	assign E1 = ~select & ~I2;
	assign E2 = select & ~I1;
	dff ff1( .d(E1), .clk(clk1), .clrn(1'b1), .prn(1'b1), .q(I3) );
	dff ff2( .d(I3), .clk(clk1), .clrn(1'b1), .prn(1'b1), .q(I1) );
	dff ff3( .d(E2), .clk(clk0), .clrn(1'b1), .prn(1'b1), .q(I4) );
	dff ff4( .d(I4), .clk(clk0), .clrn(1'b1), .prn(1'b1), .q(I2) );
	assign A = I1 & clk1;
	assign B = I2 & clk0;

	*/
	
	wire A, B;
	wire I1, I2;
	wire E1, E2;
	
	assign E1 = ~select & ~I2;
	assign E2 = select & ~I1;
	FDCP ff1( .D( E1), 	.C( ~clk1 ), .PRE( 1'b0 ), .CLR( 1'b0 ), .Q( I1 ) );
	FDCP ff2( .D( E2 ), 	.C( ~clk0 ), .PRE( 1'b0 ), .CLR( 1'b0 ), .Q( I2 ) );

//	dff ff1( .d(E1), .clk(~clk1), .clrn(1'b0), .prn(1'b0), .q(I1) );
//	dff ff2( .d(E2), .clk(~clk0), .clrn(1'b0), .prn(1'b0), .q(I2) );
	assign A = I1 & clk1;
	assign B = I2 & clk0;
	
	assign out_clock = A | B;
	assign active0 = ~I2;
	assign active1 = ~I1;
	
endmodule
