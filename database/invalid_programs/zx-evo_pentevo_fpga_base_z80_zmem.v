// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// Z80 memory manager: routes ROM/RAM accesses, makes wait-states for 14MHz or stall condition, etc.

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
// fclk    _/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\
//          |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// zclk     /```\___/```\___/```\___/```````\_______/```````\_______/```````````````\_______________/```````````````\_______________/`
//          |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// zpos     `\___/```\___/```\___/```\___________/```\___________/```\___________________________/```\___________________________/```\
//          |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// zneg     _/```\___/```\___/```\_______/```\___________/```\___________________/```\___________________________/```\________________

`include "tune.v"

module zmem(

	input  wire fclk,
	input  wire rst_n,

	input  wire zpos, //
	input  wire zneg, // strobes which show positive and negative edges of zclk

	input  wire cbeg,      // DRAM synchronization
	input  wire post_cbeg, //
	input  wire pre_cend,  //
	input  wire cend,      //


	input  wire [15:0] za,

	input  wire [ 7:0] zd_in, // won't emit anything to Z80 bus, data bus mux is another module
	output wire [ 7:0] zd_out, // output to Z80 bus

	output wire zd_ena, // out bus to the Z80

	input  wire m1_n,
	input  wire rfsh_n,
	input  wire mreq_n,
	input  wire iorq_n,
	input  wire rd_n,
	input  wire wr_n,


	input  wire [ 1:0] int_turbo, // 2'b00 - 3.5,
	                              // 2'b01 - 7.0,
	                              // 2'b1x - 14.0



	input  wire        win0_romnram, // four windows, each 16k,
	input  wire        win1_romnram, // ==1 - there is rom,
	input  wire        win2_romnram, // ==0 - there is ram
	input  wire        win3_romnram, //

	input  wire [ 7:0] win0_page, // which 16k page is in given window
	input  wire [ 7:0] win1_page, //
	input  wire [ 7:0] win2_page, //
	input  wire [ 7:0] win3_page, //

	input  wire        win0_wrdisable, // ==1 - no write is possible to window
	input  wire        win1_wrdisable,
	input  wire        win2_wrdisable,
	input  wire        win3_wrdisable,


	input  wire        romrw_en,



	input  wire        nmi_buf_clr,



	output reg  [ 4:0] rompg, // output for ROM paging
	output wire        romoe_n,
	output wire        romwe_n,
	output wire        csrom,


	output wire        cpu_req,
	output wire        cpu_rnw,
	output wire [20:0] cpu_addr,
	output wire [ 7:0] cpu_wrdata,
	output wire        cpu_wrbsel,

	input  wire [15:0] cpu_rddata,

	input  wire        cpu_next,
	input  wire        cpu_strobe,


	output wire        cpu_stall // for zclock

);


	wire [1:0] win;
	reg [7:0] page;
	reg romnram;
	reg wrdisable;



	wire dram_beg;
	wire opfetch, memrd, memwr;
	wire stall14, stall7_35;

	wire stall14_ini;
	wire stall14_cyc;
	reg  stall14_cycrd;
	reg  stall14_fin;

	reg r_mreq_n;


	reg pending_cpu_req;

	reg cpu_rnw_r;



	// this is for 7/3.5mhz  
	wire ramreq;
	wire ramwr,ramrd;
	wire cpureq_357;
	reg ramrd_reg,ramwr_reg;






	// make paging
	assign win[1:0] = za[15:14];

	always @*
	case( win )
		2'b00: begin
			page      = win0_page;
			romnram   = win0_romnram;
			wrdisable = win0_wrdisable;
		end

		2'b01: begin
			page      = win1_page;
			romnram   = win1_romnram;
			wrdisable = win1_wrdisable;
		end

		2'b10: begin
			page      = win2_page;
			romnram   = win2_romnram;
			wrdisable = win2_wrdisable;
		end

		2'b11: begin
			page      = win3_page;
			romnram   = win3_romnram;
			wrdisable = win3_wrdisable;
		end
	endcase


	// rom paging - only half a megabyte addressing.
	always @*
	begin
		rompg[4:0] = page[4:0];
	end




	assign romwe_n = wr_n | mreq_n | (~romrw_en) | wrdisable;
	assign romoe_n = rd_n | mreq_n;

	assign csrom = romnram; // positive polarity!



	// 7/3.5mhz support

	assign ramreq = (~mreq_n) && (~romnram) && rfsh_n;
	assign ramrd = ramreq & (~rd_n);
	assign ramwr = (ramreq & (~wr_n)) & (~wrdisable);

	always @(posedge fclk)
	if( cend && (!cpu_stall) )
	begin
		ramrd_reg <= ramrd;
		ramwr_reg <= ramwr;
	end

	assign cpureq_357 = ( ramrd & (~ramrd_reg) ) | ( ramwr & (~ramwr_reg) );
	



	assign zd_ena = (~mreq_n) & (~rd_n) & (~romnram);


	wire 	   code_cache_select;
	reg [15:1] code_cached_addr;
	reg        code_cached_addr_valid;
	reg [15:0] code_cached_word;

	wire 	   data_cache_select;
	reg [15:1] data_cached_addr;
	reg        data_cached_addr_valid;
	reg [15:0] data_cached_word;

	wire cache_hit;
	wire [15:0] selected_cache;

	assign code_cache_select = (za[15:1] == code_cached_addr[15:1]);
	assign data_cache_select = (za[15:1] == data_cached_addr[15:1]);

	assign cache_hit = (code_cache_select && code_cached_addr_valid) || (data_cache_select && data_cached_addr_valid);
	assign selected_cache = (data_cache_select && data_cached_addr_valid) ? data_cached_word : code_cached_word; 

	// strobe the beginnings of DRAM cycles

	always @(posedge fclk)
	if( zneg )
		r_mreq_n <= mreq_n | (~rfsh_n);
	//
	assign dram_beg = ( !cache_hit || memwr ) && zneg && r_mreq_n && (!romnram) && (!mreq_n) && rfsh_n;

	// access type
	assign opfetch = (~mreq_n) && (~m1_n);
	assign memrd   = (~mreq_n) && (~rd_n);
	assign memwr   = (~mreq_n) &&   rd_n && rfsh_n && (!wrdisable);


	// wait tables: 
	//
	// M1 opcode fetch, dram_beg coincides with:
	// cend:      +3
	// pre_cend:  +4
	// post_cbeg: +5
	// cbeg:      +6
	//
	// memory read, dram_beg coincides with:
	// cend:      +2
	// pre_cend:  +3
	// post_cbeg: +4
	// cbeg:      +5
	//
	// memory write: no wait
	//
	// special case: if dram_beg pulses 1 when cpu_next is 0,
	// unconditional wait has to be performed until cpu_next is 1, and
	// then wait as if dram_beg would coincide with cbeg

	assign stall14_ini = dram_beg && ( (!cpu_next) || opfetch || memrd ); // no wait at all in write cycles, if next dram cycle is available


	// memrd, opfetch - wait till cend & cpu_next,
	// memwr - wait till cpu_next
	assign stall14_cyc = memwr ? (!cpu_next) : stall14_cycrd;
	//
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		stall14_cycrd <= 1'b0;
	else // posedge fclk
	begin
		if( cpu_next && cend )
			stall14_cycrd <= 1'b0;
		else if( dram_beg && ( (!cend) || (!cpu_next) ) && (opfetch || memrd) )
			stall14_cycrd <= 1'b1;
	end
	//
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		stall14_fin <= 1'b0;
	else // posedge fclk
	begin
		if( stall14_fin && ( (opfetch&pre_cend) || (memrd&post_cbeg) ) )
			stall14_fin <= 1'b0;
		else if( cpu_next && cend && cpu_req && (opfetch || memrd) )
			stall14_fin <= 1'b1;
	end


	//
	assign cpu_stall = int_turbo[1] ? (stall14_ini | stall14_cyc | stall14_fin) : (cpureq_357 && (!cpu_next));

	// cpu request
	assign cpu_req = int_turbo[1] ? (pending_cpu_req | dram_beg) : cpureq_357;
	//
	assign cpu_rnw = int_turbo[1] ? (dram_beg ? (!memwr) : cpu_rnw_r) : ramrd;
	//
	//
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		pending_cpu_req <= 1'b0;
	else if( cpu_next && cend )
		pending_cpu_req <= 1'b0;
	else if( dram_beg )
		pending_cpu_req <= 1'b1;
	//
	always @(posedge fclk)
	if( dram_beg )
		cpu_rnw_r <= !memwr;



	// address, data in and data out
	//
	assign cpu_wrbsel = za[0];
	assign cpu_addr[20:0] = { page[7:0], za[13:1] };
	assign cpu_wrdata = zd_in;
	//
	always @* if( cpu_strobe ) // WARNING! ACHTUNG! LATCH!!!
		if (m1_n)
			data_cached_word <= cpu_rddata;
		else
			code_cached_word <= cpu_rddata;
	
	//
	assign zd_out = cpu_wrbsel ? selected_cache[7:0] : selected_cache[15:8];





	wire io;
	reg  io_r;
	//
	assign io = (~iorq_n);
	//
	always @(posedge fclk)
	if( zpos )
		io_r <= io;
	//
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
	begin
		code_cached_addr_valid <= 1'b0;
		data_cached_addr_valid <= 1'b0;
	end
	else
	begin
		if( (zneg && r_mreq_n && (!mreq_n) && rfsh_n && romnram) ||
		    (zneg && r_mreq_n && memwr                         ) ||
		    (io && (!io_r) && zpos                             ) ||
		    (nmi_buf_clr                                       ) )
			begin
				if (memwr) 
				begin
					if (code_cache_select)
						code_cached_addr_valid <= 1'b0;
					if (data_cache_select)
						data_cached_addr_valid <= 1'b0;
				end
				else
				begin
					data_cached_addr_valid <= 1'b0;
					code_cached_addr_valid <= 1'b0;
				end
			end
		else if( cpu_strobe )
			begin
				if (m1_n)
					data_cached_addr_valid <= 1'b1;
				else
					code_cached_addr_valid <= 1'b1;
			end
	end
	//
	always @(posedge fclk)
	if( !rst_n )
	begin
		//code_cached_addr <= 15'd0;
		//data_cached_addr <= 15'd0;
	end
	else if( cpu_strobe )
	begin
		if (m1_n)
			data_cached_addr[15:1] <= za[15:1];
		else
			code_cached_addr[15:1] <= za[15:1];
	end




endmodule

