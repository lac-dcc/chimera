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
    Date: 25-1-2021 */

// Generic 16-bit dual port RAM with clock enable
// parameters:
//      aw      => Address bit width, 10 for 1kB
//      simfile => binary file to load during simulation
//      simhexfile => hexadecimal file to load during simulation

module jtframe_dual_ram16 #(parameter aw=10,
    simfile_lo="", simhexfile_lo="",
    simfile_hi="", simhexfile_hi=""
)(
    // Port 0
    input            clk0,
    input   [  15:0] data0,
    input   [aw-1:0] addr0,
    input   [   1:0] we0,
    output  [  15:0] q0,
    // Port 1
    input            clk1,
    input   [  15:0] data1,
    input   [aw-1:0] addr1,
    input   [   1:0] we1,
    output  [  15:0] q1
);

jtframe_dual_ram #(
    .dw        ( 8             ),
    .aw        ( aw            ),
    .simfile   ( simfile_lo    ),
    .simhexfile( simhexfile_lo )  )
u_lo(
    .clk0       ( clk0              ),
    .clk1       ( clk1              ),
    // Port 0
    .data0      ( data0[7:0]        ),
    .addr0      ( addr0             ),
    .we0        ( we0[0]            ),
    .q0         ( q0[7:0]           ),
    // Port 1
    .data1      ( data1[7:0]        ),
    .addr1      ( addr1             ),
    .we1        ( we1[0]            ),
    .q1         ( q1[7:0]           )
);

jtframe_dual_ram #(
    .dw        ( 8             ),
    .aw        ( aw            ),
    .simfile   ( simfile_hi    ),
    .simhexfile( simhexfile_hi )  )
u_hi(
    .clk0       ( clk0              ),
    .clk1       ( clk1              ),
    // Port 0
    .data0      ( data0[15:8]       ),
    .addr0      ( addr0             ),
    .we0        ( we0[1]            ),
    .q0         ( q0[15:8]          ),
    // Port 1
    .data1      ( data1[15:8]       ),
    .addr1      ( addr1             ),
    .we1        ( we1[1]            ),
    .q1         ( q1[15:8]          )
);

endmodule