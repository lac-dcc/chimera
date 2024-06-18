// This program was cloned from: https://github.com/va7deo/zerowing
// License: GNU General Public License v2.0

/* This file is part of JTOPL.

 
    JTOPL program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTOPL program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTOPL.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 20-6-2020 

*/

module jtopl_acc(
    input                rst,
    input                clk,
    input                cenop,
    input         [17:0] slot,
    input                rhy_en,
    input  signed [12:0] op_result,
    input                zero,
    input                op,  // 0 for modulator operators
    input                con, // 0 for modulated connection
    output signed [15:0] snd
);

wire               sum_en;
wire signed [12:0] op2x;
wire               rhy2x;

// all rhythm channels are amplified by two
// given the data path latency, slot 16(-1) data enters at slot 6(-1) and so on
// slots 13~18 (counting from 1 to 18) will enter when bits slot[7:2] are set
assign rhy2x  = rhy_en && |slot[7:2];
assign sum_en = op | con;
assign op2x   = rhy2x ? op_result<<1 : op_result;

// Continuous output
jtopl_single_acc  u_acc(
    .clk        ( clk       ),
    .cenop      ( cenop     ),
    .op_result  ( op2x      ),
    .sum_en     ( sum_en    ),
    .zero       ( zero      ),
    .snd        ( snd       )
);

endmodule
