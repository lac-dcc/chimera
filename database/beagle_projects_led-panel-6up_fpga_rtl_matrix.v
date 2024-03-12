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

module matrix
(
	input	wire			rst_n,
	input	wire			clk,

	input	wire			wr_clk,
	input	wire			wr,
	input	wire	[13:0]	wr_addr,
	input	wire	[11:0]	wr_data,

	input	wire			buffer_select,
	output	wire			buffer_current,
	
	input	wire	[8:0]	level,

	output	reg				r0,
	output	reg				g0,
	output	reg				b0,
	output	reg				r1,
	output	reg				g1,
	output	reg				b1,
	output	reg		[3:0]	a,
	output	reg				blank,
	output	reg				sclk,
	output	reg				latch
);


//---------------------------------------------------------------------------------------------
// state machine states
//

localparam WAIT = 0,
		   BLANK = 1,
		   LATCH = 2,
		   UNBLANK = 3,
		   READ = 4,
		   SHIFT1 = 5,
		   SHIFT2 = 6;


//---------------------------------------------------------------------------------------------
// registers and wires
//

reg [2:0] state;

reg [12:0] timer;
reg [12:0] blanktimer;
reg [3:0] delay;
reg rd_buffer;
reg [3:0] rd_row;
reg [1:0] rd_bit;
reg [7:0] rd_col;
wire [12:0] rd_addr;
wire [23:0] rd_data;
wire [3:0] rd_r1, rd_g1, rd_b1, rd_r0, rd_g0, rd_b0;
wire rd_r1_bit, rd_g1_bit, rd_b1_bit, rd_r0_bit, rd_g0_bit, rd_b0_bit;


//---------------------------------------------------------------------------------------------
// memories
//
// rows  0 to 15 are in memory 0 at addresses    0-2047 (buffer 0) / 4096-6143
// rows 16 to 31 are in memory 1 at addresses    0-2047 (buffer 0) / 4096-6143
// rows 32 to 47 are in memory 0 at addresses 2048-4095 (buffer 0) / 6144-8191
// rows 48 to 63 are in memory 1 at addresses 2048-4095 (buffer 0) / 6144-8192

assign wr_hi = wr && wr_addr[11];
assign wr_lo = wr && !wr_addr[11];

dpram8192x12 dpram8192x12_hi
(
	.clka					(wr_clk),
	.wea					(wr_hi),
	.addra					({wr_addr[13:12], wr_addr[10:0]}),
	.dina					(wr_data),
	.clkb					(clk),
	.addrb					(rd_addr),
	.doutb					(rd_data[23:12])
);

dpram8192x12 dpram8192x12_lo
(
	.clka					(wr_clk),
	.wea					(wr_lo),
	.addra					({wr_addr[13:12], wr_addr[10:0]}),
	.dina					(wr_data),
	.clkb					(clk),
	.addrb					(rd_addr),
	.doutb					(rd_data[11:0])
);

// turn current buffer, row, column, and bit number into a memory address
assign buffer_current = rd_buffer;
assign rd_addr = { rd_buffer, rd_col[7], rd_row[3:0], rd_col[6:0] };

// turn read data into individual pixel bits
assign rd_r1 = rd_data[23:20];
assign rd_g1 = rd_data[19:16];
assign rd_b1 = rd_data[15:12];
assign rd_r0 = rd_data[11: 8];
assign rd_g0 = rd_data[ 7: 4];
assign rd_b0 = rd_data[ 3: 0];

assign rd_r1_bit = rd_r1[rd_bit];
assign rd_g1_bit = rd_g1[rd_bit];
assign rd_b1_bit = rd_b1[rd_bit];
assign rd_r0_bit = rd_r0[rd_bit];
assign rd_g0_bit = rd_g0[rd_bit];
assign rd_b0_bit = rd_b0[rd_bit];


//---------------------------------------------------------------------------------------------
// clocked logic
//

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		r0 <= 0;
		g0 <= 0;
		b0 <= 0;
		r1 <= 0;
		g1 <= 0;
		b1 <= 0;
		a <= 0;
		blank <= 1;
		sclk <= 0;
		latch <= 0;

		state <= READ;

		timer <= 0;
		blanktimer <= 0;
		delay <= 0;

		rd_buffer <= 0;
		rd_row <= 0;
		rd_bit <= 0;
		rd_col <= 0;
	end
	else
	begin
		// implemnt timer for binary coded modulation
		// bit plane 0 is displayed for ~192 clock cycles
		// each succesfive bit plane is displayed for 2x the clocks of the previous bit plane
		if (timer == 0)
		begin
			// for 10MHz clock, use 192-1,  384-1,  768-1, 1536-1 below
			// for 25MHz clock, use 480-1,  960-1, 1920-1, 3840-1 below
			// for 50MHz clock, use 960-1, 1920-1, 3840-1, 7680-1 below
			case (rd_bit)
				0: timer <= 479;
				1: timer <= 959;
				2: timer <= 1919;
				3: timer <= 3839;
			endcase
			case (rd_bit)
				0: blanktimer <= ( 479 * level) >> 8;
				1: blanktimer <= ( 959 * level) >> 8;
				2: blanktimer <= (1919 * level) >> 8;
				3: blanktimer <= (3839 * level) >> 8;
			endcase
		end
		else
		begin
			timer <= timer - 1;
			blanktimer <= blanktimer - 1;
		end

		// move blanking control outside state machine to implement global dimming
		if ((blanktimer == 0) || (timer == 0))
		begin
			blank <= 1;
		end
		else if ((state == LATCH) && (delay == 0))
		begin
			blank <= 0;
		end
		
		// state machine
		case (state)

			// wait for timer to expire then blank the display
			WAIT: begin
				sclk <= 0;
				if (timer == 0)
				begin
					// blank <= 1;
					delay <= 8;
					state <= BLANK;
				end
			end

			// wait a while then latch in data previosly shifted into display
			BLANK: begin
				if (delay == 0)
				begin
					latch <= 1;
					delay <= 8;
					state <= LATCH;
					a <= rd_row;
				end
				else
				begin
					delay <= delay - 1;
				end
			end

			// wait a while then unblank the display to display the latched data
			LATCH: begin
				if (delay == 0)
				begin
					// blank <= 0;
					latch <= 0;
					state <= UNBLANK;
				end
				else
				begin
					delay <= delay - 1;
				end
			end

			// find the next bit, row, column, and buffer to display
			// this is converted to a read address using combinatorial logic above
			UNBLANK: begin
				if (rd_bit == 3)
				begin
					rd_bit <= 0;
					if (rd_row == 15)
					begin
						rd_row <= 0;
						rd_buffer <= buffer_select;
					end
					else
					begin
						rd_row <= rd_row + 1;
					end
				end
				else
				begin
					rd_bit <= rd_bit + 1;
				end
				rd_col <= 0;
				state <= READ;
			end
			
			// the read, shift1, and shift2 states could be reduced to two states
			// if I knew which edge of sclk latched the data into the shift registers
			// this is good enough for one panel but for more than about four panels
			// it'd be worth reducing to two clocks instead of three clocks.

			// wait for read data to be output from RAM
			READ: begin
				state <= SHIFT1;
				sclk <= 0;
			end

			// drive the column data out the outputs
			SHIFT1: begin
				sclk <= 0;
				r0 <= rd_r0_bit;
				g0 <= rd_g0_bit;
				b0 <= rd_b0_bit;
				r1 <= rd_r1_bit;
				g1 <= rd_g1_bit;
				b1 <= rd_b1_bit;
				state <= SHIFT2;
				// count 0 to 95 then 128 to 223
				if (rd_col == 95) 
				begin
					rd_col <= 128;
				end
				else
				begin
					rd_col <= rd_col + 1;
				end
			end

			// clock the data into the RAM, move to next column, repeat 32x
			SHIFT2: begin
				sclk <= 1;
				if (rd_col == 224)
				begin
					state <= WAIT;
				end
				else
				begin
					state <= SHIFT1;
				end
			end

		endcase
	end
end

endmodule
