// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// just DOS signal control

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

module zdos(

	input  wire        fclk,
	input  wire        rst_n,


	input  wire        dos_turn_on,
	input  wire        dos_turn_off,

	input  wire        cpm_n,


	output reg         dos,


	// for clearing trdemu_wr_disable
	input  wire        zpos,
	input  wire        m1_n,


	// control of page #FE for emulation
	output reg         in_trdemu,

	input  wire        clr_nmi, // out (#BE),a
	input  wire        vg_rdwr_fclk,
	input  wire [ 3:0] fdd_mask,
	input  wire [ 1:0] vg_a,
	input  wire        romnram,

	output reg         trdemu_wr_disable
);

	wire trdemu_on = vg_rdwr_fclk && fdd_mask[vg_a] && dos && romnram;


	// control of 'DOS' signal
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
	begin
		dos = 1'b1;
	end
	else // posedge fclk
	begin
		if( !cpm_n )
			dos <= 1'b1;
		else if( dos_turn_off )
			dos <= 1'b0;
		else if( dos_turn_on )
			dos <= 1'b1;
	end


	// vg emulator RAM turn on/off
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		in_trdemu <= 1'b0;
	else if( clr_nmi )
		in_trdemu <= 1'b0;
	else if( trdemu_on )
		in_trdemu <= 1'b1;


	// wr disable for trdemu RAM page
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		trdemu_wr_disable <= 1'b0;
	else if( zpos && !m1_n )
		trdemu_wr_disable <= 1'b0;
	else if( trdemu_on )
		trdemu_wr_disable <= 1'b1;


endmodule


