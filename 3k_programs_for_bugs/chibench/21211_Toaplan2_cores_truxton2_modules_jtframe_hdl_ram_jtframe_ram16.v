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

module jtframe_ram16 #(parameter aw=10,
    simfile_lo="", simhexfile_lo="",
    simfile_hi="", simhexfile_hi=""
)(
    input            clk ,
    input   [  15:0] data,
    input   [aw-1:0] addr,
    input   [   1:0] we,
    output  [  15:0] q
);

jtframe_ram #(
    .dw        ( 8             ),
    .aw        ( aw            ),
    .simfile   ( simfile_lo    ),
    .simhexfile( simhexfile_lo )  )
u_lo(
    .clk        ( clk               ),
    .cen        ( 1'b1              ),
    // Port 0
    .data       ( data [7:0]        ),
    .addr       ( addr              ),
    .we         ( we [0]            ),
    .q          ( q [7:0]           )
);

jtframe_ram #(
    .dw        ( 8             ),
    .aw        ( aw            ),
    .simfile   ( simfile_hi    ),
    .simhexfile( simhexfile_hi )  )
u_hi(
    .clk        ( clk               ),
    .cen        ( 1'b1              ),
    // Port 0
    .data       ( data [15:8]       ),
    .addr       ( addr              ),
    .we         ( we [1]            ),
    .q          ( q [15:8]          )
);

endmodule