// This program was cloned from: https://github.com/jotego/jt12
// License: GNU General Public License v3.0

/* This file is part of JT12.


    JT12 program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT12 program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT12.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 21-03-2019
*/

// calculates d=a/b
// a = b*d + r

module jt10_adpcm_div #(parameter DW=16)(
    input               rst_n,
    input               clk,    // CPU clock
    input               cen,
    input               start,  // strobe
    input      [DW-1:0] a,
    input      [DW-1:0] b,
    output reg [DW-1:0] d,
    output reg [DW-1:0] r,
    output              working
);

reg  [DW-1:0] cycle;
assign working = cycle[0];

wire [DW:0] sub = { r[DW-2:0], d[DW-1] } - b;  

always @(posedge clk or negedge rst_n)
    if( !rst_n ) begin
        cycle <= 'd0;
    end else if(cen) begin
        if( start ) begin
            cycle <= {DW{1'b1}};
            r     <= 0;
            d     <= a;
        end else if(cycle[0]) begin
            cycle <= { 1'b0, cycle[DW-1:1] };
            if( sub[DW] == 0 ) begin
                r <= sub[DW-1:0];
                d <= { d[DW-2:0], 1'b1};
            end else begin
                r <= { r[DW-2:0], d[DW-1] };
                d <= { d[DW-2:0], 1'b0 };
            end
        end
    end

endmodule // jt10_adpcm_div
