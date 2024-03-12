// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// DRAM arbiter. Shares DRAM between processor and video data fetcher

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


// 14.06.2011:
// removed cpu_stall and cpu_waitcyc.
// changed cpu_strobe behavior (only strobes read data arrival now).
// added cpu_next signal (shows whether next DRAM cycle CAN be grabbed by CPU)
//
// Now it is a REQUIREMENT for 'go' signal only starting and ending on
// beginning of DRAM cycle (i.e. right after 'cend' strobe).


// 13.06.2011:
// Придётся потребовать, чтоб go устанавливался сразу после cend (у меня [lvd] это так).
// это для того, чтобы процессор на 14мгц мог заранее и в любой момент знать, на
// сколько завейтиться. Вместо cpu_ack введем другой сигнал, который в течение всего
// драм-цикла будет показывать, чей может быть следующий цикл - процессора или только
// видео. По сути это и будет также cpu_ack, но валидный в момент cpu_req (т.е.
// в момент cend) и ранее.

// 12.06.2011:
// проблема: если цпу просит цикл чтения, а его дать не могут,
// то он должен держать cpu_req. однако, снять он его может
// только по cpu_strobe, при этом также отправится еще один
// запрос чтения!!!
// решение: добавить сигнал cpu_ack, по которому узнаётся, что
// арбитр зохавал запрос (записи или чтения), который будет
// совпадать с нынешним cpu_strobe на записи (cbeg), а будущий
// cpu_strobe сделать только как строб данных на зохаванном
// запросе чтеня.
// это, возможно, позволит удалить всякие cpu_waitcyc...


// Arbitration is made on full 8-cycle access blocks. Each cycle is defined by dram.v and consists of 4 fpga clocks.
// During each access block, there can be either no videodata access, 1 videodata access, 2, 4 or full 8 accesses.
// All spare cycles can be used by processor. If nobody uses memory in the given cycle, refresh cycle is performed
//
// In each access block, videodata accesses are spreaded all over the block so that processor receives cycle
// as fast as possible, until there is absolute need to fetch remaining video data
//
// Examples:
//
// |                 access block                  | 4 video accesses during block, no processor accesses. video accesses are done
// | vid | vid | vid | vid | ref | ref | ref | ref | as soon as possible, spare cycles are refresh ones
//
// |                 access block                  | 4 video accesses during block, processor requests access every other cycle
// | vid | prc | vid | prc | vid | prc | vid | prc |
//
// |                 access block                  | 4 video accesses, processor begins requesting cycles continously from second one
// | vid | prc | prc | prc | prc | vid | vid | vid | so it is given cycles while there is such possibility. after that processor
//                                                   can't access mem until the end of access block and stalls
//
// |                 access block                  | 8 video accesses, processor stalls, if it is requesting cycles
// | vid | vid | vid | vid | vid | vid | vid | vid |
//
// |                 access block                  | 2 video accesses, single processor request, other cycles are refresh ones
// | vid | vid | ref | ref | cpu | ref | ref | ref |
//
// |                 access block                  | 4 video accesses, single processor request, other cycles are refresh ones
// | vid | vid | cpu | vid | vid | ref | ref | ref |
//
// access block begins at any dram cycle, then blocks go back-to-back
//
// key signals are go and cpu_req, sampled at the end of each dram cycle. Must be set to the module
// one clock cycle earlier the clock of the beginning current dram cycle

`include "tune.v"

module arbiter(

	input clk,
	input rst_n,

	// dram.v interface
	output     [20:0] dram_addr,   // address for dram access
	output reg        dram_req,    // dram request
	output reg        dram_rnw,    // Read-NotWrite
	input             dram_cbeg,   // cycle begin
	input             dram_rrdy,   // read data ready (coincides with cend)
	output      [1:0] dram_bsel,   // positive bytes select: bsel[1] for wrdata[15:8], bsel[0] for wrdata[7:0]
	input      [15:0] dram_rddata, // data just read
	output     [15:0] dram_wrdata, // data to be written


	output reg cend,      // regenerates this signal: end of DRAM cycle. cend is one-cycle positive pulse just before cbeg pulse
	output reg pre_cend,  // one clock earlier cend
	output reg post_cbeg, // one more earlier


	input go, // start video access blocks

	input [1:0] bw, // required bandwidth: 3'b00 - 1 video cycle per block
	                //                     3'b01 - 2 video accesses
	                //                     3'b10 - 4 video accesses
	                //                     3'b11 - 8 video accesses (stall of CPU)

	input  [20:0] video_addr,   // during access block, only when video_strobe==1
	output [15:0] video_data,   // read video data which is valid only during video_strobe==1 because video_data
	                            // is just wires to the dram.v's rddata signals
	output reg    video_strobe, // positive one-cycle strobe as soon as there is next video_data available.
	                            // if there is video_strobe, it coincides with cend signal
	output reg    video_next,   // on this signal you can change video_addr; it is one clock leading the video_strobe



	input  wire        cpu_req,
	input  wire        cpu_rnw,
	input  wire [20:0] cpu_addr,
	input  wire [ 7:0] cpu_wrdata,
	input  wire        cpu_wrbsel,

	output wire [15:0] cpu_rddata,
	output reg         cpu_next,
        output reg         cpu_strobe
);

	wire cbeg;

	reg [1:0] cctr; // DRAM cycle counter: 0 when cbeg is 1, then 1,2,3,0, etc...


	reg stall;
	reg cpu_rnw_r;

	reg [2:0] blk_rem;  // remaining accesses in a block (7..0)
	reg [2:0] blk_nrem; // remaining for the next dram cycle

	reg [2:0] vid_rem;  // remaining video accesses in block (4..0)
	reg [2:0] vid_nrem; // for rhe next cycle


	wire [2:0] vidmax; // max number of video cycles in a block, depends on bw input



	localparam CYC_VIDEO = 2'b00; // do             there
	localparam CYC_CPU   = 2'b01; //   not     since     are   dependencies
	localparam CYC_FREE  = 2'b10; //      alter             bit

	reg [1:0] curr_cycle; // type of the cycle in progress
	reg [1:0] next_cycle; // type of the next cycle





	initial // simulation only!
	begin
		curr_cycle = CYC_FREE;
		blk_rem = 0;
		vid_rem = 0;
	end




	assign cbeg = dram_cbeg; // just alias

	// make cycle strobe signals
	always @(posedge clk)
	begin
		post_cbeg <= cbeg;
		pre_cend  <= post_cbeg;
		cend      <= pre_cend;
	end


	// track blk_rem counter: how many cycles left to the end of block (7..0)
	always @(posedge clk) if( cend )
	begin
		blk_rem <= blk_nrem;

		if( (blk_rem==3'd0) )
			stall <= (bw==2'd3) & go;
	end

	always @*
	begin
		if( (blk_rem==3'd0) && go )
			blk_nrem = 7;
		else
			blk_nrem = (blk_rem==0) ? 3'd0 : (blk_rem-3'd1);
	end



	// track vid_rem counter
	assign vidmax = (3'b001) << bw; // 1,2,4 or 8 - just to know how many cycles to perform

	always @(posedge clk) if( cend )
	begin
		vid_rem <= vid_nrem;
	end

	always @*
	begin
		if( go && (blk_rem==3'd0) )
			vid_nrem = cpu_req ? vidmax : (vidmax-3'd1);
		else
			if( next_cycle==CYC_VIDEO )
				vid_nrem = (vid_rem==3'd0) ? 3'd0 : (vid_rem-3'd1);
			else
				vid_nrem = vid_rem;
	end




	// next cycle decision
	always @*
	begin
		if( blk_rem==3'd0 )
		begin
			if( go )
			begin
				if( bw==2'b11 )
				begin
					cpu_next = 1'b0;

					next_cycle = CYC_VIDEO;
				end
				else
				begin
					cpu_next = 1'b1;

					if( cpu_req )
						next_cycle = CYC_CPU;
					else
						next_cycle = CYC_VIDEO;
				end
			end
			else // !go
			begin
				cpu_next = 1'b1;

				if( cpu_req )
					next_cycle = CYC_CPU;
				else
					next_cycle = CYC_FREE;
			end
		end
		else // blk_rem!=3'd0
		begin
			if( stall )
			begin
				cpu_next = 1'b0;

				next_cycle = CYC_VIDEO;
			end
			else
			begin
				if( vid_rem==blk_rem )
				begin
					cpu_next = 1'b0;
	
					next_cycle = CYC_VIDEO;
				end
				else
				begin
					cpu_next = 1'b1;
	
					if( cpu_req )
						next_cycle = CYC_CPU;
					else
						if( vid_rem==3'd0 )
							next_cycle = CYC_FREE;
						else
							next_cycle = CYC_VIDEO;
				end
			end
		end
	end




	// just current cycle register
	always @(posedge clk) if( cend )
	begin
		curr_cycle <= next_cycle;
	end




	// route required data/etc. to and from the dram.v

	assign dram_wrdata[15:0] = { cpu_wrdata[7:0], cpu_wrdata[7:0] };
	assign dram_bsel[1:0] = { ~cpu_wrbsel, cpu_wrbsel };

	assign dram_addr = next_cycle[0] ? cpu_addr : video_addr;

	assign cpu_rddata = dram_rddata;
	assign video_data = dram_rddata;

	always @*
	begin
		if( next_cycle[1] ) // CYC_FREE
		begin
			dram_req = 1'b0;
			dram_rnw = 1'b1;
		end
		else // CYC_CPU or CYC_VIDEO
		begin
			dram_req = 1'b1;
			if( next_cycle[0] ) // CYC_CPU
				dram_rnw = cpu_rnw;
			else // CYC_VIDEO
				dram_rnw = 1'b1;
		end
	end



	// generation of read strobes: for video and cpu


	always @(posedge clk)
	if( cend )
		cpu_rnw_r <= cpu_rnw;


	always @(posedge clk)
	begin
		if( (curr_cycle==CYC_CPU) && cpu_rnw_r && pre_cend )
			cpu_strobe <= 1'b1;
		else
			cpu_strobe <= 1'b0;
	end


	always @(posedge clk)
	begin
		if( (curr_cycle==CYC_VIDEO) && pre_cend )
			video_strobe <= 1'b1;
		else
			video_strobe <= 1'b0;

		if( (curr_cycle==CYC_VIDEO) && post_cbeg )
			video_next <= 1'b1;
		else
			video_next <= 1'b0;
	end



endmodule

