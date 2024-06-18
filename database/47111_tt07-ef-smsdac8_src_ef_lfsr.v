// This program was cloned from: https://github.com/ejfogleman/tt07-ef-smsdac8
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
  *
 * LFSR w/ multiple tapped outputs
 * updates K states at a time to avoid correlation in tapped bits
 * From: A 3.3-V SINGLE-POLY CMOS AUDIO ADC DELTA–SIGMA MODULATOR WITH 98-DB 
 * PEAK SINAD AND 105-DB PEAK SFDR, Fogleman et al
 */
`timescale 1ns / 100ps

// n = 22, 1 + x + x^n, K = 11
module ef_lfsr22_11 ( 
	input i_clk, 
	input i_rst_b, 
	input i_en, 
	output wire [10:0] o_r );

	reg [21:0] q;
	assign o_r[10:0] = q[11:1];  

	always @( posedge i_clk, negedge i_rst_b ) begin
		if( ~i_rst_b ) begin
			q[21:1] <= 21'b0;
			q[0] <= 1'b1;
		end
		else begin
			if ( i_en ) begin
				// jumps 11 states per clock
				q[21:11] <= q[10:0] ^ q[11:1];
				q[10:0] <= q[21:11];
			end
		end
	end
	
endmodule
