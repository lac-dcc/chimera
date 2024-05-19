// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful;
    but WITHOUT ANY WARRANTY, without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.1
    Date: 15- 4-2016
    */

/*

parameter stg is the stage of the pipelined signal
for instance if signal is xx_VIII, then set stg to 8

*/

module sep32 #(parameter width=10, parameter stg=5'd0)
(
    input   clk,
    input   cen,
    input [width-1:0] mixed,
    input [4:0] cnt,

    output reg [width-1:0]  slot_00,
    output reg [width-1:0]  slot_01,
    output reg [width-1:0]  slot_02,
    output reg [width-1:0]  slot_03,
    output reg [width-1:0]  slot_04,
    output reg [width-1:0]  slot_05,
    output reg [width-1:0]  slot_06,
    output reg [width-1:0]  slot_07,
    output reg [width-1:0]  slot_10,
    output reg [width-1:0]  slot_11,
    output reg [width-1:0]  slot_12,
    output reg [width-1:0]  slot_13,
    output reg [width-1:0]  slot_14,
    output reg [width-1:0]  slot_15,
    output reg [width-1:0]  slot_16,
    output reg [width-1:0]  slot_17,
    output reg [width-1:0]  slot_20,
    output reg [width-1:0]  slot_21,
    output reg [width-1:0]  slot_22,
    output reg [width-1:0]  slot_23,
    output reg [width-1:0]  slot_24,
    output reg [width-1:0]  slot_25,
    output reg [width-1:0]  slot_26,
    output reg [width-1:0]  slot_27,
    output reg [width-1:0]  slot_30,
    output reg [width-1:0]  slot_31,
    output reg [width-1:0]  slot_32,
    output reg [width-1:0]  slot_33,
    output reg [width-1:0]  slot_34,
    output reg [width-1:0]  slot_35,
    output reg [width-1:0]  slot_36,
    output reg [width-1:0]  slot_37
);

/*verilator coverage_off*/

reg [4:0] cntadj;

reg [width-1:0] slots[0:31] /*verilator public*/;

localparam pos0 = 33-stg;

/* verilator lint_off WIDTH */
always @(*)
    cntadj = (cnt+pos0)%32;
/* verilator lint_on WIDTH */

always @(posedge clk) if(cen) begin
    slots[cntadj] <= mixed;
    case( cntadj ) // octal numbers!
        5'o00:  slot_00 <= mixed;
        5'o01:  slot_01 <= mixed;
        5'o02:  slot_02 <= mixed;
        5'o03:  slot_03 <= mixed;
        5'o04:  slot_04 <= mixed;
        5'o05:  slot_05 <= mixed;
        5'o06:  slot_06 <= mixed;
        5'o07:  slot_07 <= mixed;
        5'o10:  slot_10 <= mixed;
        5'o11:  slot_11 <= mixed;
        5'o12:  slot_12 <= mixed;
        5'o13:  slot_13 <= mixed;
        5'o14:  slot_14 <= mixed;
        5'o15:  slot_15 <= mixed;
        5'o16:  slot_16 <= mixed;
        5'o17:  slot_17 <= mixed;
        5'o20:  slot_20 <= mixed;
        5'o21:  slot_21 <= mixed;
        5'o22:  slot_22 <= mixed;
        5'o23:  slot_23 <= mixed;
        5'o24:  slot_24 <= mixed;
        5'o25:  slot_25 <= mixed;
        5'o26:  slot_26 <= mixed;
        5'o27:  slot_27 <= mixed;
        5'o30:  slot_30 <= mixed;
        5'o31:  slot_31 <= mixed;
        5'o32:  slot_32 <= mixed;
        5'o33:  slot_33 <= mixed;
        5'o34:  slot_34 <= mixed;
        5'o35:  slot_35 <= mixed;
        5'o36:  slot_36 <= mixed;
        5'o37:  slot_37 <= mixed;
    endcase
end

/*verilator coverage_on*/

endmodule

