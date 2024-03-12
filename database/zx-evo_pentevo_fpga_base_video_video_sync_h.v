// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// generates horizontal sync, blank and video start strobe, horizontal window

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

//
// =\                  /=========||...
// ==\                /==========||...
// ====---     -------===========||...
//    |  \   / |      |
//    |   ---  |      |
//    |  |   | |      |
//    0  t1  | t3     t4
//           t2
// at 0, video ends and blank begins
//    t1 = 10 clocks (@7MHz), sync begins
// t2-t1 = 33 clocks
// t3-t2 = 41 clocks, then video starts
//
// repetition period = 448 clocks

`include "tune.v"

module video_sync_h(

	input  wire        clk,

	input  wire        init, // one-pulse strobe read at cend==1, initializes phase
	                         // this is mainly for phasing with CPU clock 3.5/7 MHz
	                         // still not used, but this may change anytime

	input  wire        cend,     // working strobes from DRAM controller (7MHz)
	input  wire        pre_cend,


	// modes inputs
	input  wire        mode_atm_n_pent,
	input  wire        mode_a_text,

	input  wire [ 1:0] modes_raster,
	input  wire        mode_contend_type, 

	output reg         hblank,
	output reg         hsync,

	output reg         line_start,  // 1 video cycle prior to actual start of visible line
	output reg         hsync_start, // 1 cycle prior to beginning of hsync: used in frame sync/blank generation
	                                // these signals coincide with cend

	output reg         hint_start, // horizontal position of INT start, for fine tuning

	output reg         scanin_start,

	input  wire        vpix,
	output reg         hpix, // marks gate during which pixels are outting

	output reg         contend, // for 48k/128k CPU contention

	output reg         border_sync, // for 48k/128k 4t border emulation

	                                // these signals turn on and turn off 'go' signal
	output reg         fetch_start, // 18 cycles earlier than hpix, coincide with cend
	output reg         fetch_end    // --//--

);


	localparam HBLNK_BEG = 9'd00;
	localparam HSYNC_BEG = 9'd10;
	localparam HSYNC_END = 9'd43;
	localparam HBLNK_END = 9'd88;

	// pentagon (x256)
	localparam HPIX_BEG_PENT = 9'd140; // 52 cycles from line_start to pixels beginning
	localparam HPIX_END_PENT = 9'd396;

	// atm (x320)
	localparam HPIX_BEG_ATM = 9'd108; // 52 cycles from line_start to pixels beginning
	localparam HPIX_END_ATM = 9'd428;


	localparam FETCH_FOREGO = 9'd18; // consistent with older go_start in older fetch.v:
	                                 // actual data starts fetching 2 dram cycles after
					 // 'go' goes to 1, screen output starts another
					 // 16 cycles after 1st data bundle is fetched


	localparam SCANIN_BEG = 9'd88; // when scan-doubler starts pixel storing


	localparam HINT_BEG      = 9'd2;
	localparam HINT_BEG_48K  = 9'd126;
	localparam HINT_BEG_128K = 9'd130;


	localparam HPERIOD_224 = 9'd448;
	localparam HPERIOD_228 = 9'd456;


	localparam CONTEND_START = 9'd127; // fixed for correct contend phase: coincides with positive edge of z80 clock
	//localparam CONTEND_START_48K  = 9'd132;
	//localparam CONTEND_START_128K = 9'd132;


	localparam BORDER_PHASE = 3'd4;


	reg [8:0] hcount;

	reg [8:0] contend_ctr;

	// for simulation only
	//
	initial
	begin
		hcount = 9'd0;
		hblank = 1'b0;
		hsync = 1'b0;
		line_start = 1'b0;
		hsync_start = 1'b0;
		hpix = 1'b0;
	end




	always @(posedge clk) if( cend )
	begin
            if(  init || hcount==( (modes_raster==2'b11) ? (HPERIOD_228-9'd1) : (HPERIOD_224-9'd1) )  )
            	hcount <= 9'd0;
            else
            	hcount <= hcount + 9'd1;
	end



	always @(posedge clk) if( cend )
	begin
		if( hcount==HBLNK_BEG )
			hblank <= 1'b1;
		else if( hcount==HBLNK_END )
			hblank <= 1'b0;


		if( hcount==HSYNC_BEG )
			hsync <= 1'b1;
		else if( hcount==HSYNC_END )
			hsync <= 1'b0;
	end


	always @(posedge clk)
	begin
		if( pre_cend )
		begin
			if( hcount==HSYNC_BEG )
				hsync_start <= 1'b1;

			if( hcount==HBLNK_END )
				line_start <= 1'b1;

			if( hcount==SCANIN_BEG )
				scanin_start <= 1'b1;

		end
		else
		begin
			hsync_start  <= 1'b0;
			line_start   <= 1'b0;
			scanin_start <= 1'b0;
		end
	end



	wire fetch_start_time, fetch_start_condition;
	wire fetch_end_condition;

	reg [3:0] fetch_start_wait;


	assign fetch_start_time = (mode_atm_n_pent                  ?
	                          (HPIX_BEG_ATM -FETCH_FOREGO-9'd4) :
	                          (HPIX_BEG_PENT-FETCH_FOREGO-9'd4) ) == hcount;

	always @(posedge clk) if( cend )
		fetch_start_wait[3:0] <= { fetch_start_wait[2:0], fetch_start_time };

	assign fetch_start_condition = mode_a_text ? fetch_start_time  : fetch_start_wait[3];

	always @(posedge clk)
	if( pre_cend && fetch_start_condition )
		fetch_start <= 1'b1;
	else
		fetch_start <= 1'b0;




	assign fetch_end_time = (mode_atm_n_pent             ?
	                        (HPIX_END_ATM -FETCH_FOREGO) :
	                        (HPIX_END_PENT-FETCH_FOREGO) ) == hcount;

	always @(posedge clk)
	if( pre_cend && fetch_end_time )
		fetch_end <= 1'b1;
	else
		fetch_end <= 1'b0;





	always @(posedge clk)
	begin
		if( pre_cend && hcount==( modes_raster[1] ? (modes_raster[0] ? HINT_BEG_128K : HINT_BEG_48K) : HINT_BEG ) )
			hint_start <= 1'b1;
		else
			hint_start <= 1'b0;
	end


	always @(posedge clk) if( cend )
	begin
		if( hcount==(mode_atm_n_pent ? HPIX_BEG_ATM : HPIX_BEG_PENT) )
			hpix <= 1'b1;
		else if( hcount==(mode_atm_n_pent ? HPIX_END_ATM : HPIX_END_PENT) )
			hpix <= 1'b0;
	end



	// contention generator
	initial
		contend_ctr <=9'h100;
	//
	always @(posedge clk) if( cend )
	begin
		if( hcount == CONTEND_START )
			contend_ctr <= 9'd0;
		else if( !contend_ctr[8] )
			contend_ctr <= contend_ctr + 9'd1;
	end
	//
	//
	always @(posedge clk) if( cend )
	begin
		if( contend_ctr[8] || !vpix )
			contend <= 1'b0;
		else if( !mode_contend_type )
		// 48k type contention
		case( contend_ctr[3:1] )
			3'd6,
			3'd7:    contend <= 1'b0;
			default: contend <= 1'b1;
		endcase
		else
		// +2a/+3 type contention
		case( contend_ctr[3:1] )
			3'd1:    contend <= 1'b0;
			default: contend <= 1'b1;
		endcase
		//
		// warning! probably +2a/+3 contention pattern is incorrect, it begins with 1 cycle contention but probably should end
		//  with one extra contention cycle. Anyway this is left as TODO.
		//
	end



	// border sync signal gen
	always @(posedge clk)
	if( pre_cend && hcount[2:0]==BORDER_PHASE )
		border_sync <= 1'b1;
	else
		border_sync <= 1'b0;
		


endmodule

