// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module raizing_pal (
    input CLK,
    input CLK96,
    input PIXEL_CEN,
    input RESET,
    input RESET96,

    input LVBL,
    input LHBL,
    output LVBL_DLY,
    output LHBL_DLY,

    input [10:0] PIXEL,
    output [10:0] PAL_ADDR,
    input [15:0] PAL_DATA,
    input ACTIVE,

    output [ 7:0] RED,
    output [ 7:0] GREEN,
    output [ 7:0] BLUE
);

parameter BLNK_DLY=4;

integer r,g,b;
function [23:0] calc_col;
    input [15:0] c;
    begin
        calc_col = 24'h000000;
        r = ((c & 16'h001F) << 3) | (((c & 16'h001F) << 3) >> 5);
        g = ((c & 16'h03E0) >> 2) | (((c & 16'h03E0) >> 2) >> 5);
        b = ((c & 16'h7C00) >> 7) | (((c & 16'h7C00) >> 7) >> 5);
        calc_col = ((r << 16) & 24'hFF0000 | (g << 8) & 24'h00FF00 | b & 24'h0000FF);
        // if(calc_col > 0) $display("%h", calc_col);
    end
endfunction

assign PAL_ADDR = PIXEL;

reg[23:0] color = 0;
reg [2:0] st = 0;

//calculate color
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        color<=0;
        st<=0;
    end else begin
        // if(PIXEL_CEN) st<=0;
        // case(st)
        //     0: st<=1;
        //     1: color <= calc_col(PAL_DATA);
        // endcase
        if(PIXEL_CEN) color <= calc_col(PAL_DATA);
    end
end

//output color
// always @(posedge CLK, posedge RESET) begin
//     if(RESET) begin
//         RED<=8'd0;
//         GREEN<=8'd0;
//         BLUE<=8'd0;
//     end else if(PIXEL_CEN && ACTIVE) begin
//         if(VB || (HB && !LHBL_DLY)) begin
//             RED<=8'd0;
//             GREEN<=8'd0;
//             BLUE<=8'd0;
//         end else begin
//             // $display("%h", color);
//             RED<=red;
//             GREEN<=green;
//             BLUE<=blue;
//         end
//     end
// end

// jtframe_sh #(.width(2),.stages(BLNK_DLY)) u_sh(
//     .clk    ( CLK                  ),
//     .clk_en ( PIXEL_CEN              ),
//     .din    ( {~VB, ~HB}           ),
//     .drop   ( {LVBL_DLY, LHBL_DLY} )
// );

jtframe_blank #(.DLY(BLNK_DLY), .DW(24)) u_blank (
    .clk(CLK96),
    .pxl_cen(PIXEL_CEN),
    .preLHBL(LHBL),
    .preLVBL(LVBL),
    .LHBL(LHBL_DLY),
    .LVBL(LVBL_DLY),
    .rgb_in(color),
    .rgb_out({RED, GREEN, BLUE})
);
endmodule