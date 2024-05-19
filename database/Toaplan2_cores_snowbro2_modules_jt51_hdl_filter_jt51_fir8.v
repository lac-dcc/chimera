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

module jt51_fir8
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
parameter stages=81;
parameter addr_width=7;
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
        7'd0: coeff = -9'd1;
        7'd1: coeff = 9'd0;
        7'd2: coeff = 9'd1;
        7'd3: coeff = 9'd1;
        7'd4: coeff = 9'd2;
        7'd5: coeff = 9'd3;
        7'd6: coeff = 9'd4;
        7'd7: coeff = 9'd4;
        7'd8: coeff = 9'd5;
        7'd9: coeff = 9'd5;
        7'd10: coeff = 9'd5;
        7'd11: coeff = 9'd4;
        7'd12: coeff = 9'd3;
        7'd13: coeff = 9'd1;
        7'd14: coeff = -9'd2;
        7'd15: coeff = -9'd6;
        7'd16: coeff = -9'd11;
        7'd17: coeff = -9'd16;
        7'd18: coeff = -9'd21;
        7'd19: coeff = -9'd26;
        7'd20: coeff = -9'd30;
        7'd21: coeff = -9'd33;
        7'd22: coeff = -9'd34;
        7'd23: coeff = -9'd32;
        7'd24: coeff = -9'd28;
        7'd25: coeff = -9'd21;
        7'd26: coeff = -9'd10;
        7'd27: coeff = 9'd4;
        7'd28: coeff = 9'd22;
        7'd29: coeff = 9'd42;
        7'd30: coeff = 9'd65;
        7'd31: coeff = 9'd91;
        7'd32: coeff = 9'd117;
        7'd33: coeff = 9'd142;
        7'd34: coeff = 9'd168;
        7'd35: coeff = 9'd192;
        7'd36: coeff = 9'd213;
        7'd37: coeff = 9'd231;
        7'd38: coeff = 9'd244;
        7'd39: coeff = 9'd252;
        7'd40: coeff = 9'd255;
        default: coeff = 9'd0;
    endcase // cnt

endmodule
