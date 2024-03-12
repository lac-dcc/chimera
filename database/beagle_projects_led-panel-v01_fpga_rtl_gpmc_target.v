//=============================================================================================
// SparkFun / Adafruit 32x32 LED Panel Driver
// Copyright 2014 by Glen Akins.
// All rights reserved.
// 
// Set editor width to 96 and tab stop to 4.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//=============================================================================================

module gpmc_target
(
	input	wire			rst_n,				// system reset
	input	wire			clk,				// system clock

	input	wire			gpmc_clk,			// gpmc clock
	input	wire			gpmc_csn,			// gpmc chip select
	input	wire			gpmc_advn,			// gpmc address valid enable
	input	wire			gpmc_oen,			// gpmc output enable
	input	wire			gpmc_wen,			// gpmc write enable
	input	wire	[1:0]	gpmc_ben,			// gpmc byte enables
	inout	wire	[15:0]	gpmc_ad,			// gpmc multiplexed address / data

	output	reg		[16:1]	sb_addr,			// slow bus address
	output	reg				sb_wr,				// slow bus write
	output	reg		[15:0]	sb_wr_data,			// slow bus write data
	output	reg				sb_rd,				// slow bus read
	input	wire	[15:0]	sb_rd_data			// slow bus read data
);

reg [16:1] dmux_addr;
reg [15:0] dmux_wr_data;
reg [15:0] dmux_rd_data;

//
// latch address on rising edge of gpmc_advn
// this is gross. it's actually so gross the Xilinx tools will 
// error out unless you set the following in the .ucf file:
//
// NET "gpmc_advn" CLOCK_DEDICATED_ROUTE = FALSE;
//
always @ (posedge gpmc_advn or negedge rst_n)
begin
	if (!rst_n)
	begin
		dmux_addr <= 0;
	end
	else
	begin
		dmux_addr <= gpmc_ad;
	end
end

//
// latch write data on falling edge of gpmc_wen
// this is gross. it's actually so gross the Xilinx tools will 
// error out unless you set the following in the .ucf file:
//
// NET "gpmc_wen" CLOCK_DEDICATED_ROUTE = FALSE;
//
assign gpmc_wen_n = !gpmc_wen;
always @ (posedge gpmc_wen_n or negedge rst_n)
begin
	if (!rst_n)
	begin
		dmux_wr_data <= 0;
	end
	else
	begin
		dmux_wr_data <= gpmc_ad;
	end
end

// output read data when both csn and gpmc_oen are low
assign gpmc_ad = (!gpmc_csn && !gpmc_oen) ? dmux_rd_data : 16'bz;

reg gpmc_csn_z, gpmc_csn_zz;
reg gpmc_wen_z, gpmc_wen_zz, gpmc_wen_zzz, wen_falling;
reg gpmc_oen_z, gpmc_oen_zz, gpmc_oen_zzz, oen_falling;
reg sb_rd_z;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		sb_addr <= 0;
		sb_wr <= 0;
		sb_wr_data <= 0;
		sb_rd <= 0;

		gpmc_csn_z <= 0;
		gpmc_csn_zz <= 0;
		gpmc_wen_z <= 0;
		gpmc_wen_zz <= 0;
		gpmc_wen_zzz <= 0;
		gpmc_oen_z <= 0;
		gpmc_oen_zz <= 0;
		gpmc_oen_zzz <= 0;
		wen_falling <= 0;
		oen_falling <= 0;

		sb_rd_z <= 0;
		dmux_rd_data <= 0;
	end
	else
	begin
		// fix metastability issues between clock domains
		gpmc_csn_z <= gpmc_csn;
		gpmc_csn_zz <= gpmc_csn_z;

		// fix metastability issues between clock domains
		gpmc_wen_z <= gpmc_wen;			// metastable
		gpmc_wen_zz <= gpmc_wen_z;		// stable
		gpmc_wen_zzz <= gpmc_wen_zz;	// use for edge detect

		// fix metastability issues between clock domains
		gpmc_oen_z <= gpmc_oen;			// metastable
		gpmc_oen_zz <= gpmc_oen_z;		// stable
		gpmc_oen_zzz <= gpmc_oen_zz;	// use for edge detect

		// detect falling edges on wen and oen while csn is low
		wen_falling <= !gpmc_csn_zz && gpmc_wen_zzz && !gpmc_wen_zz;
		oen_falling <= !gpmc_csn_zz && gpmc_oen_zzz && !gpmc_oen_zz;

		// latch demuxed address into clk domain on falling edge of wen or falling edge of oen
		if (wen_falling || oen_falling)
		begin
			sb_addr <= dmux_addr;
		end

		// latch demuxed data into clk domain on falling edge of wen
		if (wen_falling)
		begin
			sb_wr_data <= dmux_wr_data;
		end

		// start write on falling edge of wen
		sb_wr <= wen_falling;

		// start read on falling edge of oen
		sb_rd <= oen_falling;

		// latch read data one clock after read started
		sb_rd_z <= sb_rd;
		dmux_rd_data <= sb_rd_data;
	end
end

endmodule
