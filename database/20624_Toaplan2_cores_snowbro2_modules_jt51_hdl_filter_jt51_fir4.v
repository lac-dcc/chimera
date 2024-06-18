// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of jt51.

    jt51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    jt51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with jt51.  If not, see <http://www.gnu.org/licenses/>.

	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: March, 7th 2017
	*/

`timescale 1ns / 1ps

module jt51_fir4
#(parameter data_width=9, output_width=12)
(
	input	clk,
	input	rst,
	input	sample,
	input	signed [data_width-1:0] left_in,
	input	signed [data_width-1:0] right_in,
	output	signed [output_width-1:0] left_out,
	output	signed [output_width-1:0] right_out,
	output	sample_out
);

parameter coeff_width=9;
parameter stages=21;
parameter addr_width=5;
parameter acc_extra=1;

reg signed [coeff_width-1:0] coeff;
wire     [addr_width-1:0] cnt;

jt51_fir #(
    .data_width  (data_width),
    .output_width(output_width),
    .coeff_width (coeff_width),
    .stages      (stages),
    .addr_width  (addr_width),
    .acc_extra   (acc_extra)
) i_jt51_fir (
    .clk       (clk       ),
    .rst       (rst       ),
    .sample    (sample    ),
    .left_in   (left_in   ),
    .right_in  (right_in  ),
    .left_out  (left_out  ),
    .right_out (right_out ),
    .sample_out(sample_out),
    .cnt       (cnt       ),
    .coeff     (coeff     )
);


always @(*) 
    case( cnt )
        5'd0: coeff = 9'd18;
        5'd1: coeff = 9'd24;
        5'd2: coeff = 9'd40;
        5'd3: coeff = 9'd66;
        5'd4: coeff = 9'd99;
        5'd5: coeff = 9'd134;
        5'd6: coeff = 9'd171;
        5'd7: coeff = 9'd205;
        5'd8: coeff = 9'd231;
        5'd9: coeff = 9'd249;
        5'd10: coeff = 9'd255;
        default: coeff = 9'd0;
    endcase



endmodule
