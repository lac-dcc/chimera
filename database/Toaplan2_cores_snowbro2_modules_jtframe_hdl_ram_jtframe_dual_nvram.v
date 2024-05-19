// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 27-10-2017 */

// Dual RAM that can easily interface with
// the memory dump interface for NVRAM implementations

module jtframe_dual_nvram #(parameter dw=8, aw=10,
    simfile="", simhexfile="", synfile="", dumpfile="dump.hex"
)(
    // Port 0
    input   clk0,
    input   [dw-1:0] data0,
    input   [aw-1:0] addr0,
    input   we0,
    output  [dw-1:0] q0,
    // Port 1 
    input   clk1,
    input   [aw-1:0] addr1a, // A, read only
    input   [aw-1:0] addr1b, // B, RW
    input   sel_b,   // high to select b
    input   we_b,
    input   [dw-1:0] data1,
    output  [dw-1:0] q1
);

wire [aw-1:0] a_mux;
wire          w_mux;

assign a_mux = sel_b ? addr1b : addr1a;
assign w_mux = sel_b & we_b;

jtframe_dual_ram #(
    .dw        ( dw         ),
    .aw        ( aw         ),
    .simfile   ( simfile    ),
    .simhexfile( simhexfile ),
    .synfile   ( synfile    ),
    .dumpfile  ( dumpfile   )
) u_dual(
    // Port 0
    .clk0   ( clk0  ),
    .data0  ( data0 ),
    .addr0  ( addr0 ),
    .we0    ( we0   ),
    .q0     ( q0    ),
    // Port 1
    .clk1   ( clk1  ),
    .data1  ( data1 ),
    .addr1  ( a_mux ),
    .we1    ( w_mux ),
    .q1     ( q1    )
);

endmodule