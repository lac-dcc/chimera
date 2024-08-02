// This program was cloned from: https://github.com/ejfogleman/tt07-ef-smsdac8
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: GPL-2.0-or-later
 *
 * Blocks for fully-segmented mismatch shaping encoder 
 * from SEGMENTED MISMATCH-SHAPING D/A CONVERSION, 
 * Fishov, Fogleman, Siragusa, Galton 
 * 2002 IEEE International Symposium on Circuits and Systems (ISCAS)
 */
 `timescale 1ns / 100ps

// retiming reg
module ef_smsdac_reg #(parameter BITS = 8) (
    input i_clk,
    input i_rst_b,
    input [BITS-1:0] i_d,
    output reg [BITS-1:0] o_q );

	always @( posedge i_clk, negedge i_rst_b ) 
		if ( i_rst_b == 1'b0 ) 
			o_q <= 0;
		else
			o_q <= i_d;

endmodule

// the segmenting switching block
module ef_smsdac_mse_seg_sb ( 
	input i_clk, 
	input i_rst_b, 
	input i_r, 
	input i_en, 
	input i_x, 
	input i_xc, 
	output wire [1:0] o_y, 
	output wire o_yc );

	wire odd = i_x ^ i_xc;	// input parity
	wire q;				// switching sequence

	// "carry" output (lsb weight); round up/down on odd input
	assign o_yc = odd ? q : i_x;

	// 3-level DAC outputs
	assign o_y[1] = odd & ~q;
	assign o_y[0] = ~odd | ~q;

	// switching sequence state machine
	ef_smsdac_mse_sb_sm sb_sm(
		.i_clk(i_clk),
		.i_rst_b(i_rst_b),
		.i_odd(odd),
		.i_r(i_r),
		.i_en(i_en),
		.o_q(q));
			 
endmodule

// the binary switching block
module ef_smsdac_mse_bin_sb ( 
	input i_clk,
	input i_rst_b,
	input i_r,
	input i_en,
	input i_x,
	input i_xc,
	output wire [1:0] o_y) ;

	wire q;				// switching sequence
	wire odd = i_x ^ i_xc;		// input parity

	// 3-level DAC output
	// if odd, split based on switching sequence
	assign o_y[1] = odd ? q : i_xc;
	assign o_y[0] = odd ? ~q : i_xc;

	// switching sequence state machine
	ef_smsdac_mse_sb_sm sb_sm(
		.i_clk(i_clk),
		.i_rst_b(i_rst_b),
		.i_odd(odd),
		.i_r(i_r),
		.i_en(i_en),
		.o_q(q));

endmodule

// the switching sequence state machine
// updates only when sb input is odd
// i_r is a random dither bit
// i_en == 1'b0 halts state machine and routes i_r to q
module ef_smsdac_mse_sb_sm( 
	input i_clk, 
	input i_rst_b, 
	input i_odd, 
	input i_r, 
	input i_en, 
	output wire o_q );

	// switching sequence; update only on odd inputs
	// en == 1'b0 stops mismatch shaping (static encoder)
	reg [1:0] q;
	wire [1:0] q_d;   // next state info
	assign q_d[1] = (i_en & i_odd) ? ~q[1]: q[1]; 
	assign q_d[0] = (i_en & i_odd) ? ( q[1] ? i_r : ~q[0] ) : q[0];

	// enabled:  highpass shaping
	// disabled:  random shaping (whitening)
	assign o_q = i_en ? q[0] : i_r;

	always @( posedge i_clk, negedge i_rst_b ) begin 
		if ( i_rst_b == 1'b0 ) 
			q <= 2'b00;
		else  
			q <= q_d;
	end

endmodule



