//=============================================================================================
// Simple GPMC Asynchronous Host Behavioral Model
// Copyright 2014 by Glen Akins.
// All rights reserved.
// 
// Simple behavioral model of a TI ARM GPMC bus operating in asynchronous, 16-bit, 
// multiplexed address/data mode.
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

module gpmc_async_host_model
(
	output	reg				gpmc_clk,
	output	reg				gpmc_csn,
	output	reg				gpmc_advn,
	output	reg				gpmc_oen,
	output	reg				gpmc_wen,
	output	reg		[1:0]	gpmc_ben,
	inout	wire	[15:0]	gpmc_ad
);


//---------------------------------------------------------------------------------------------
// parameters
//

parameter  CS_ON_TIME           = 0,			// RW
           CS_RD_OFF_TIME       = 5,			// R-
           CS_WR_OFF_TIME       = 5,			// -W
		   ADV_ON_TIME          = 0,            // RW
		   ADV_RD_OFF_TIME      = 2,            // R-
		   ADV_WR_OFF_TIME      = 2,            // -W
           OE_ON_TIME           = 3,            // R-
           OE_OFF_TIME          = 6,            // R-
           WE_ON_TIME           = 3,            // -W
           WE_OFF_TIME          = 5,            // -W
           RD_CYCLE_TIME        = 6,            // R-
           RD_ACCESS_TIME       = 5,            // R-
		   WR_CYCLE_TIME        = 6,            // -W
           WR_ACCESS_TIME       = 0,			// --
           WR_DATA_ON_ADMUX_BUS = 3,			// -W
		   CYCLE_2_CYCLE_DELAY  = 1;            // RW


//---------------------------------------------------------------------------------------------
// local parameters
//

localparam GPMC_IDLE = 0, 
		   GPMC_WRITE = 1, 
		   GPMC_READ = 2, 
		   GPMC_DELAY = 3;

localparam GPMC_DIR_OUT = 0,
		   GPMC_DIR_IN = 1;

localparam GPMC_MUX_ADDRESS = 0,
		   GPMC_MUX_DATA = 1;


//---------------------------------------------------------------------------------------------
// clock generation
//

reg gpmc_fclk;
initial gpmc_fclk <= 0;
always # (5.0) gpmc_fclk <= ~gpmc_fclk;


//---------------------------------------------------------------------------------------------
// registers and wires
//

reg [1:0]  gpmc_state;
reg gpmc_dir;
reg gpmc_mux;
reg [15:0] gpmc_address;
reg [15:0] gpmc_wrdata;
wire [15:0] gpmc_rddata;


//---------------------------------------------------------------------------------------------
// multiplex address / data bus continuous assignments
//

assign gpmc_ad = (gpmc_dir == GPMC_DIR_OUT) ? 
						((gpmc_mux == GPMC_MUX_DATA) ? gpmc_wrdata : gpmc_address) : (16'bz);
assign gpmc_rddata = (gpmc_dir == GPMC_DIR_OUT) ? 16'bx : gpmc_ad;


//---------------------------------------------------------------------------------------------
// task to initialize the model
//

task init;

begin
	gpmc_state <= GPMC_IDLE;
	gpmc_clk <= 0;
	gpmc_csn <= 1;
	gpmc_advn <= 0;
	gpmc_oen <= 1;
	gpmc_wen <= 1;
	gpmc_ben <= 2'b11;
	gpmc_dir <= GPMC_DIR_OUT;
	gpmc_mux <= GPMC_MUX_DATA;
	gpmc_address <= 0;
	gpmc_wrdata <= 0;
end

endtask


//---------------------------------------------------------------------------------------------
// task to idle the bus
//

task idle;

begin
	@ (posedge gpmc_fclk)
		gpmc_state <= GPMC_IDLE;
		gpmc_clk <= 0;
		gpmc_csn <= 1;
		gpmc_advn <= 0;
		gpmc_oen <= 1;
		gpmc_wen <= 1;
		gpmc_ben <= 2'b11;
		gpmc_dir <= GPMC_DIR_OUT;
		gpmc_mux <= GPMC_MUX_DATA;
end

endtask


//---------------------------------------------------------------------------------------------
// task to write 16 bits to the bus
//

task write16;

input [15:0] twraddr;
input [15:0] twrdata;
integer cycle;

begin
	for (cycle = 0; cycle < WR_CYCLE_TIME; cycle = cycle + 1)
	begin
		@ (posedge gpmc_fclk)

			// state
			gpmc_state <= GPMC_WRITE;

			// csn
			if (cycle < CS_ON_TIME) gpmc_csn <= 1;
			else if (cycle < CS_WR_OFF_TIME) gpmc_csn <= 0;
			else gpmc_csn <= 1;

			// advn
			if (cycle < ADV_ON_TIME) gpmc_advn <= 1;
			else if (cycle < ADV_WR_OFF_TIME) gpmc_advn <= 0;
			else gpmc_advn <= 1;

			// oen
			gpmc_oen <= 1;

			// wen
			if (cycle < WE_ON_TIME) gpmc_wen <= 1;
			else if (cycle < WE_OFF_TIME) gpmc_wen <= 0;
			else gpmc_wen <= 1;

			// ben
			gpmc_ben <= 2'b00;

			// dir
			gpmc_dir <= GPMC_DIR_OUT;

			// mux
			if (cycle < WR_DATA_ON_ADMUX_BUS) gpmc_mux <= GPMC_MUX_ADDRESS;
			else gpmc_mux <= GPMC_MUX_DATA;

			// multiplexed address and data bus
			gpmc_address <= twraddr;
			gpmc_wrdata <= twrdata;
	end

	for (cycle = 0; cycle < CYCLE_2_CYCLE_DELAY; cycle = cycle + 1)
	begin
		@ (posedge gpmc_fclk)
			gpmc_state <= GPMC_DELAY;
			gpmc_csn <= 1;
			gpmc_advn <= 0;
			gpmc_oen <= 1;
			gpmc_wen <= 1;
			gpmc_ben <= 2'b11;
			gpmc_dir <= GPMC_DIR_OUT;
			gpmc_mux <= GPMC_MUX_DATA;
	end
end

endtask


//---------------------------------------------------------------------------------------------
// task to read 16 bits from the bus
//

task read16;

input [15:0] trdaddr;
output [15:0] trddata;
integer cycle;

begin
	for (cycle = 0; cycle < RD_CYCLE_TIME; cycle = cycle + 1)
	begin
		@ (posedge gpmc_fclk)
			// state
			gpmc_state <= GPMC_READ;

			// csn
			if (cycle < CS_ON_TIME) gpmc_csn <= 1;
			else if (cycle < CS_RD_OFF_TIME) gpmc_csn <= 0;
			else gpmc_csn <= 1;

			// advn
			if (cycle < ADV_ON_TIME) gpmc_advn <= 1;
			else if (cycle < ADV_RD_OFF_TIME) gpmc_advn <= 0;
			else gpmc_advn <= 1;

			// oen
			if (cycle < OE_ON_TIME) gpmc_oen <= 1;
			else if (cycle < OE_OFF_TIME) gpmc_oen <= 0;
			else gpmc_oen <= 1;

			// wen
			gpmc_wen <= 1;

			// ben
			gpmc_ben <= 2'b00;

			// dir
			if (cycle < OE_ON_TIME) gpmc_dir <= GPMC_DIR_OUT;
			else gpmc_dir <= GPMC_DIR_IN;

			// mux
			gpmc_mux <= GPMC_MUX_ADDRESS;

			// multiplexed address and data bus
			gpmc_address <= trdaddr;

			// capture read data
			if (cycle == RD_ACCESS_TIME)
			begin
				gpmc_wrdata <= gpmc_rddata;
				trddata <= gpmc_rddata;
			end
	end

	for (cycle = 0; cycle < CYCLE_2_CYCLE_DELAY; cycle = cycle + 1)
	begin
		@ (posedge gpmc_fclk)
			gpmc_state <= GPMC_DELAY;
			gpmc_csn <= 1;
			gpmc_advn <= 0;
			gpmc_oen <= 1;
			gpmc_wen <= 1;
			gpmc_ben <= 2'b11;
			gpmc_dir <= GPMC_DIR_OUT;
			gpmc_mux <= GPMC_MUX_DATA;
	end
end

endtask

endmodule
