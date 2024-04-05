// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// vg93 interface

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

// #1F - vg93 command/state reg {0,0} - not here!
// #3F - vg93 track register    {0,1} - not here!
// #5F - vg93 sector register   {1,0} - not here!
// #7F - vg93 data register     {1,1} - not here!
// #FF - output "system" reg/input (DRQ+IRQ) reg
//   output: d6 - FM/MFM               - NOT USED ANYWHERE! -> skipped
//           d4 - disk side            - inverted out
//           d3 - head load            - for HRDY pin of vg93
//           d2 - /RESET for vg93      - must be zero at system reset
//           d1:d0 - disk drive select - to the 74138
//    input: d7 - /INTRQ - resynced at CPU clock
//           d6 - /DRQ   - .....................
//
// current limitations:
//  1. read clock regenerator is made of simple counter, as in pentagon128
//  1. write precompensation is based only on SL/SR/TR43 signals

`include "tune.v"

module vg93(

	input zclk, // Z80 cpu clock
	input rst_n,
	input fclk, // fpga 28 MHz clock

	output vg_clk,
	output reg vg_res_n,

	input [7:0] din,  // data input from CPU
	output intrq,drq, // output signals for the read #FF (not here)
	input vg_wrFF_fclk, // when TRDOS port #FF written - positive strobe


	output reg  vg_hrdy,
	output wire vg_rclk,
	output wire vg_rawr,
	output reg  [1:0] vg_a, // disk drive selection
	output reg  vg_wrd,
	output reg  vg_side,

	input step, // step signal from VG93
	input vg_sl,vg_sr,vg_tr43,
	input rdat_n,
	input vg_wf_de,
	input vg_drq,
	input vg_irq,
	input vg_wd
);


	localparam WRDELAY_OUTER_LEFT  = 4'd4;
	localparam WRDELAY_OUTER_RIGHT = 4'd11;
	localparam WRDELAY_INNER_LEFT  = 4'd0;  // minimal delay is for maximum shift left
	localparam WRDELAY_INNER_RIGHT = 4'd14; // maximal delay is for maximum shift right
	localparam WRDELAY_STANDARD    = 4'd7;  // no-shift




	reg [2:0] vgclk_div7;
	wire vgclk_strobe7;
	reg [1:0] vgclk_div4;

	reg [2:0] step_pulse;
	reg [2:0] drq_pulse;
	wire step_pospulse;
	wire  drq_pospulse;
	reg turbo_state;

	reg [1:0] intrq_sync;
	reg [1:0] drq_sync;

	reg [1:0] sl_sync,sr_sync,tr43_sync;
	reg [2:0] wd_sync;
	wire sl,sr,tr43,wd;

	reg [3:0] wrdelay_cnt;
	wire delay_end;

	reg [3:0] wrwidth_cnt;
	wire wrwidth_ena;


//	reg [4:0] rdat_sync;
//	reg rdat_edge1, rdat_edge2;
//	wire rdat;

//	reg [3:0] rwidth_cnt;
//	wire rwidth_ena;
//	reg [5:0] rclk_cnt;
//	wire rclk_strobe;



	// VG93 clocking and turbo-mode

	always @(posedge fclk)
	begin
		step_pulse[2:0] <= { step_pulse[1:0], step};
		 drq_pulse[2:0] <= {  drq_pulse[1:0], vg_drq};
	end

	assign step_pospulse = ( step_pulse[1] & (~step_pulse[2]) );
	assign  drq_pospulse = (  drq_pulse[1] & ( ~drq_pulse[2]) );

	always @(posedge fclk, negedge rst_n)
	begin
		if( !rst_n )
			turbo_state <= 1'b0;
		else
		begin
			if( drq_pospulse )
				turbo_state <= 1'b0;
			else if( step_pospulse )
				turbo_state <= 1'b1;
		end
	end



	assign vgclk_strobe7 = (vgclk_div7[2:1] == 2'b11); // 28/7=4MHz freq strobe

	always @(posedge fclk)
	begin
		if( vgclk_strobe7 )
			vgclk_div7 <= 3'd0;
		else
			vgclk_div7 <= vgclk_div7 + 3'd1;
	end

	always @(posedge fclk)
	begin
		if( vgclk_strobe7 )
		begin
			vgclk_div4[0] <= ~vgclk_div4[1];

			if( turbo_state )
				vgclk_div4[1] <= ~vgclk_div4[1];
			else
				vgclk_div4[1] <= vgclk_div4[0];
		end
	end

	assign vg_clk = vgclk_div4[1];


	// input/output for TR-DOS port #FF

	always @(posedge fclk, negedge rst_n) // CHANGE IF GO TO THE positive/negative strobes instead of zclk!
	begin
		if( !rst_n )
			vg_res_n <= 1'b0;
		else if( vg_wrFF_fclk )
			{ vg_side, vg_hrdy, vg_res_n, vg_a } <= { (~din[4]),din[3],din[2],din[1:0] };
	end

	always @(posedge zclk)
	begin
		intrq_sync[1:0] <= {intrq_sync[0],vg_irq};
		drq_sync[1:0] <= {drq_sync[0],vg_drq};
	end

	assign intrq = intrq_sync[1];
	assign drq   =   drq_sync[1];




	// write precompensation
	// delay times are as in WRDELAY_* parameters, vg_wrd width is always 7 clocks

	always @(posedge fclk)
	begin
		  sl_sync[1:0] <= {   sl_sync[0],   vg_sl   };
		  sr_sync[1:0] <= {   sr_sync[0],   vg_sr   };
		tr43_sync[1:0] <= { tr43_sync[0],   vg_tr43 };
		  wd_sync[2:0] <= {   wd_sync[1:0], vg_wd   };
	end

	assign   sl =   sl_sync[1]; // just state signals
	assign   sr =   sr_sync[1]; //
	assign tr43 = tr43_sync[1]; //

	assign   wd =   wd_sync[1] & (~wd_sync[2]); // strobe: beginning of vg_wd


	// make delay
	always @(posedge fclk)
	begin
		if( wd )
			case( {sl, tr43, sr} )
			3'b100:  // shift left, outer tracks
				wrdelay_cnt <= WRDELAY_OUTER_LEFT;
			3'b001:  // shift right, outer tracks
				wrdelay_cnt <= WRDELAY_OUTER_RIGHT;
			3'b110:  // shift left, inner tracks
				wrdelay_cnt <= WRDELAY_INNER_LEFT;
			3'b011:  // shift right, inner tracks
				wrdelay_cnt <= WRDELAY_INNER_RIGHT;
			default: // no shift
				wrdelay_cnt <= WRDELAY_STANDARD;
			endcase
		else if( !delay_end )
			wrdelay_cnt <= wrdelay_cnt - 4'd1;
	end

	assign delay_end = (wrdelay_cnt==4'd0);


	// make vg_wdr impulse after a delay

	always @(posedge fclk)
		if( wrwidth_ena )
		begin
			if( wd )
				wrwidth_cnt <= 4'd0;
			else
				wrwidth_cnt <= wrwidth_cnt + 4'd1;
		end

	assign wrwidth_ena = wd | ( delay_end & (~wrwidth_cnt[3]) );

	always @(posedge fclk)
		vg_wrd <= | wrwidth_cnt[2:0]; // only 7 clocks is the lendth of vg_wrd




/*	fapch_counter dpll
	(
		.fclk   (fclk   ),

		.rdat_n (rdat_n ),

		.vg_rclk(vg_rclk),
		.vg_rawr(vg_rawr)
	);
*/

	fapch_zek     dpll
	(
		.fclk   (fclk   ),

		.rdat_n (rdat_n ),

		.vg_rclk(vg_rclk),
		.vg_rawr(vg_rawr)
	);




endmodule

