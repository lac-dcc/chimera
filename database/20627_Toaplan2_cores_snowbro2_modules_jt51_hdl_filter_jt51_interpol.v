// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: March, 7th 2017
	*/

`timescale 1ns / 1ps

module jt51_interpol(
	input	clk, // Use a clock at least 162*2 times faster than JT51 sampling rate
	input	rst,
	input	sample_in,
	input	signed [15:0] left_in,
	input	signed [15:0] right_in,
	// mix in other sound sources, like ADPCM sound of arcade boards
	// other sound sources should be at the same
	// sampling frequency than the FM sound
	// for best results
	input	signed [15:0] left_other,
	input	signed [15:0] right_other,		
	
	output  signed [15:0] out_l,
	output  signed [15:0] out_r,
	output	sample_out
);

/* max_clk_count is chosen so as to divide the input clock to
   obtain a 32xFs frequency.
   Fs = JT51 sampling frequency, normally ~55kHz
   32xFs = 1.78MHz
   If this module's clock is 50MHz then
   max_clk_count = 50/1.78=28

   The division must be exact, otherwise samples will get out of sync
   eventually and sound will get distorted. 
   max_clk_count*32 is the number of clock ticks that the FIR module
   has to process the two sound channels. Each channels needs at least
   162 clock ticks, so in total it needs just over 324 ticks.
   (162 is the number of stages of the filter)

   Using 50MHz and max_clk_count=28 gives 896 clock ticks, which is
   more than enough.

*/ 
parameter max_clk_count = 7'd111;

reg [15:0] fir_left_in, fir_right_in, left_mux, right_mux;
reg	fir_sample_in;
reg fir4_sample_in;


reg [2:0] state;
reg [6:0] cnt;

always @(*)
	case( state )
		3'd0: { left_mux, right_mux } <= { left_in, right_in};
		3'd3: { left_mux, right_mux } <= { left_other, right_other};
		default: { left_mux, right_mux } <= 32'd0;
	endcase

always @(posedge clk)
if( rst ) begin
	state <= 2'b0;
	fir_sample_in <= 1'b0;
	cnt	  <= 6'd0;
end else begin
	fir4_sample_in <= ( cnt==0 || cnt==28 || cnt==56 || cnt==84 );
	if( cnt==max_clk_count ) begin
		cnt	  <= 6'd0;
		state <= state+1'b1;
		fir_sample_in <= 1'b1;
		{fir_left_in,fir_right_in} <= { left_mux, right_mux };
	end
	else begin
		cnt <= cnt + 1'b1;	
		fir_sample_in <= 1'b0;
	end
end

localparam fir8_w=16; // at least 16
localparam fir4_w=16; // at least 16
wire [fir8_w-1:0] fir8_out_l, fir8_out_r;
wire [fir4_w-1:0] fir4_out_l, fir4_out_r;

assign out_l = fir4_out_l[15:0];
assign out_r = fir4_out_r[15:0];
//assign out_l = fir8_out_l[15:0];
//assign out_r = fir8_out_r[15:0];

//wire fir8_sample;

jt51_fir8 #(.data_width(16), .output_width(fir8_w)) u_fir8 (
	.clk		( clk 			),
	.rst		( rst  			),
	.sample		( fir_sample_in ),
	.left_in	( fir_left_in 	),
	.right_in	( fir_right_in 	),
	.left_out	( fir8_out_l	),
	.right_out	( fir8_out_r	)
	// .sample_out	( fir8_sample	)
);

jt51_fir4 #(.data_width(16), .output_width(fir4_w)) u_fir4 (
	.clk		( clk 			),
	.rst		( rst  			),
	.sample		( fir4_sample_in),
	.left_in	( fir8_out_l[fir8_w-1:fir8_w-16]	),
	.right_in	( fir8_out_r[fir8_w-1:fir8_w-16]	),
	.left_out	( fir4_out_l	),
	.right_out	( fir4_out_r	),
	.sample_out	( sample_out	)
);


endmodule
