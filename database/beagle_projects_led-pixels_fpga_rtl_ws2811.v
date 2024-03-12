//=============================================================================================
// WS2811 Pixel Driver
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

module ws2811
(
	input	wire			rst_n,				// asynchronous active-low reset
	input	wire			clk,				// 20MHz clock
	
	input	wire			wr_clk,				// write data clock
	input	wire			wr,					// write enable
	input	wire	[8:0]	wr_addr,			// two banks of up to 256 LEDS
	input	wire	[23:0]	wr_data,			// { R[7:0],G[7:0],B[7:0] }

	input	wire			start,				// begin transmission
	input	wire			bank,				// bank to transmit
	input	wire	[8:0]	leds,				// number of LEDs to transmit, 1 to 256

	output	reg				tx_out				// transmit data out
);

localparam IDLE = 0, TX_HIGH = 1, TX_LOW = 2, TX_RESET = 3;

reg		[8:0]	rd_addr;
wire	[23:0]	rd_data;
reg		[3:0]	state;
reg		[8:0]	tx_leds;
reg		[7:0]	tx_clock;
reg		[4:0]	tx_bit;
reg		[23:0]	tx_shift;

dpram512x24 dpram512x24
(
    .clka   (wr_clk),
    .wea    (wr),
    .addra  (wr_addr),
    .dina   ({wr_data[23:16],wr_data[15:8],wr_data[7:0]}),
    .clkb   (clk),
    .addrb  (rd_addr),
    .doutb  (rd_data)
);

wire [4:0] next_tx_bit = tx_bit + 1;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		tx_out <= 0;
		rd_addr <= 0;
		state <= IDLE;
		tx_leds <= 0;
		tx_bit <= 0;
		tx_clock <= 0;
		tx_shift <= 0;
	end
	else
	begin

		case (state)

			IDLE: begin
				tx_out <= 1'b0;
				if (start)
				begin
					rd_addr <= { bank, 8'h00 };
					tx_leds <= leds;
					tx_bit <= 0;
					tx_clock <= 0;
					state <= TX_HIGH;
				end
			end

			TX_HIGH: begin
				tx_out <= 1;

				// load tx shift register with word read from memory or shift it
				if (tx_clock == 1) 
				begin
					if (tx_bit == 0) 
						tx_shift <= rd_data;
					else
						tx_shift <= { tx_shift[22:0], 1'b0 };
				end

				// check for end of the high portion of this bit
				if ((tx_clock == 4) && (tx_shift[23] == 0))
				begin
					state <= TX_LOW;
				end
				else if (tx_clock == 19)
				begin
					state <= TX_LOW;
				end

				// move to next clock in this bit
				tx_clock <= tx_clock + 1;
			end

			TX_LOW: begin
				tx_out <= 0;

				if (tx_clock == 24)
				begin
					// last clock in this bit
					if (next_tx_bit < 24) 
					begin
						// send next bit in this word
						tx_bit <= next_tx_bit;
						tx_clock <= 0;
						state <= TX_HIGH;
					end
					else
					begin
						// send next word or go to idle
						rd_addr <= rd_addr + 1;
						tx_bit <= 0;
						tx_clock <= 0;
						state <= 9;
						if ((rd_addr[7:0] + 1) == tx_leds)
						begin
							// send reset by waiting 50us 
							state <= TX_RESET;
						end
						else
						begin
							// send next word
							state <= TX_HIGH;
						end
					end
				end
				else
				begin
					// next clock in this bit
					tx_clock <= tx_clock + 1;
				end

			end

			TX_RESET: begin
				state <= IDLE;
			end

		endcase
	end
end


endmodule
