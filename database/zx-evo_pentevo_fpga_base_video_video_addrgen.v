// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// address generation module for video data fetching

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

module video_addrgen(

	input  wire        clk, // 28 MHz clock


	output reg  [20:0] video_addr, // DRAM arbiter signals
	input  wire        video_next, //


	input  wire        line_start, // some video sync signals
	input  wire        int_start,  //
	input  wire        vpix,       //

	input  wire        scr_page, // which screen to use


	input  wire        mode_atm_n_pent, // decoded modes
	input  wire        mode_zx,         //
	input  wire        mode_p_16c,      //
	input  wire        mode_p_hmclr,    //
	                                    //
	input  wire        mode_a_hmclr,    //
	input  wire        mode_a_16c,      //
	input  wire        mode_a_text,     //
	input  wire        mode_a_txt_1page,//

	output wire [ 2:0] typos // Y position in text mode symbols
);

	wire mode_ag;

	assign mode_ag = mode_a_16c | mode_a_hmclr;



	wire line_init, frame_init;

	wire gnext,tnext,ldaddr;

	reg line_start_r;
	reg frame_init_r;
	reg line_init_r;

	always @(posedge clk)
		line_start_r <= line_start;

	assign line_init  = line_start_r & vpix;
	assign frame_init = int_start;

	reg [13:0] gctr;

	reg [7:0] tyctr; // text Y counter
	reg [6:0] txctr; // text X counter

	reg not_used;




	always @(posedge clk)
		frame_init_r <= frame_init;

	always @(posedge clk)
		line_init_r <= line_init;


	assign gnext = video_next | frame_init_r;
	assign tnext = video_next | line_init_r;
	assign ldaddr = mode_a_text ? tnext : gnext;

	// gfx counter
	//
	initial gctr <= 0;
	//
	always @(posedge clk)
	if( frame_init )
		gctr <= 0;
	else if( gnext )
		gctr <= gctr + 1;


	// text counters
	always @(posedge clk)
	if( frame_init )
		tyctr <= 8'b0011_0111;
	else if( line_init )
		tyctr <= tyctr + 1;

	always @(posedge clk)
	if( line_init )
		txctr <= 7'b000_0000;
	else if( tnext )
		txctr <= txctr + 1;


	assign typos = tyctr[2:0];


// zx mode:
// [0] - attr or pix
// [4:1] - horiz pos 0..15 (words)
// [12:5] - vert pos

	wire [20:0] addr_zx;   // standard zx mode
	wire [20:0] addr_phm;  // pentagon hardware multicolor
	wire [20:0] addr_p16c; // pentagon 16c

	wire [20:0] addr_ag; // atm gfx: 16c (x320) or hard multicolor (x640) - same sequence!

	wire [20:0] addr_at; // atm text

	wire [11:0] addr_zx_pix;
	wire [11:0] addr_zx_attr;
	wire [11:0] addr_zx_p16c;


	assign addr_zx_pix  = { gctr[12:11], gctr[7:5], gctr[10:8], gctr[4:1] };

	assign addr_zx_attr = { 3'b110, gctr[12:8], gctr[4:1] };

	assign addr_zx_p16c = { gctr[13:12], gctr[8:6], gctr[11:9], gctr[5:2] };


	assign addr_zx =   { 6'b000001, scr_page, 2'b10, ( gctr[0] ? addr_zx_attr : addr_zx_pix ) };

	assign addr_phm =  { 6'b000001, scr_page, 1'b1, gctr[0], addr_zx_pix };

	assign addr_p16c = { 6'b000001, scr_page, ~gctr[0], gctr[1], addr_zx_p16c };


	assign addr_ag = { 5'b00000, ~gctr[0], scr_page, 1'b1, gctr[1], gctr[13:2] };

	//                           5 or 1     +0 or +2  ~4,0  +0k or +2k
//	assign addr_at = { 5'b00000, ~txctr[0], scr_page, 1'b1, txctr[1], 2'b00, tyctr[7:3], txctr[6:2] };
//	assign addt_et = { 5'b00001,  1'b0    , scr_page, 1'b0, txctr[0], txctr[1], 0, --//00           };

	assign addr_at = { 4'b0000,
	                   mode_a_txt_1page, // if 1page, 8 and 10 pages instead of 5,1 and 7,3
	                   mode_a_txt_1page ? 1'b0 : ~txctr[0], // 5 or 1 pages for usual mode
	                   scr_page,         // actually not used
	                   ~mode_a_txt_1page, // 5,1 (not 4,0) pages for usual mode
	                   mode_a_txt_1page ? txctr[0] : txctr[1], // 0,+2 interleave for even-odd or 0,+1 for 1page
	                   mode_a_txt_1page ? txctr[1] : 1'b0, // sym/attr interleave 0,+1 for 1page
	                   1'b0,
	                   tyctr[7:3],
	                   txctr[6:2]
	                   };











	initial video_addr <= 0;
	//
	always @(posedge clk) if( ldaddr )
	begin
		{ video_addr[20:15], not_used, video_addr[13:0] } <=
			( {21{mode_zx     }} & addr_zx  )  |
			( {21{mode_p_16c  }} & addr_p16c)  |
			( {21{mode_p_hmclr}} & addr_phm )  |
			( {21{mode_ag     }} & addr_ag  )  |
			( {21{mode_a_text }} & addr_at  )  ;
	end

	always @(posedge clk)
		video_addr[14] <= scr_page;



endmodule

