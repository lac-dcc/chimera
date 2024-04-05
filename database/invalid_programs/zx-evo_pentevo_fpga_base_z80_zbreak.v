// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// break function: when CPU M1 address equals to predefined, NMI is generated

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/

`include "tune.v"

module zbreak
(
	input  wire        fclk,  // global FPGA clock
	input  wire        rst_n, // system reset

	input  wire        zpos,
	input  wire        zneg,


	input  wire [15:0] a,

	input  wire        mreq_n,
	input  wire        m1_n,


	input  wire        brk_ena,
	input  wire [15:0] brk_addr,


	output reg         imm_nmi
);



	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		imm_nmi <= 1'b0;
	else if( zneg && !mreq_n && !m1_n && a==brk_addr && brk_ena && !imm_nmi )
		imm_nmi <= 1'b1;
	else
		imm_nmi <= 1'b0;


endmodule

