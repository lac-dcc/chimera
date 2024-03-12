//=============================================================================================
// DMX-512 Transmitter
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

module dmx_tx
(
	input	wire			rst_n,				// async, active-low system reset
	input	wire			clk,				// system clock
	input	wire			baudEn,				// enable at 16x baud rate
	input	wire			avail,				// new data byte to transmit available
	input	wire	[8:0]	data,				// dmx start code / data byte to transmit
	output	reg				ack,				// data byte moved to transmit hold register
	output	reg				txd					// transmit data out
);

localparam TXIDLE = 0, TXBRK = 1, TXMAB = 2, TXDAT = 3;

reg [1:0] txbusy;								// transmitting
reg [4:0] bitnum;								// current tx bit number
reg [3:0] ph;									// bit phase
reg	[9:0] txdata;								// tranmsit hold register

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		ack <= 0;
		txd <= 1;
		txbusy <= 0;
		bitnum <= 0;
		ph <= 0;
		txdata <= 0;
	end
	else
	begin
		ack <= 0;

		if (baudEn)
		begin
			case (txbusy)

				TXIDLE: begin
					if (avail)
					begin
						ack <= 1;
						txd <= 0;
						bitnum <= 0;
						ph <= 0;
						txdata <= { 2'b11, data[7:0] };
						if (data[8])
						begin
							txbusy <= TXBRK;
						end
						else
						begin
							txbusy <= TXDAT;
						end
					end
				end

				TXBRK: begin
					ph <= ph + 1;
					if (ph == 15) 
					begin
						bitnum <= bitnum + 1;
						if (bitnum == 22)
						begin
							txd <= 1;
							bitnum <= 0;
							txbusy <= TXMAB;
						end
					end
				end
	
				TXMAB: begin
					ph <= ph + 1;
					if (ph == 15) 
					begin
						bitnum <= bitnum + 1;
					end
					if ((bitnum == 2) && (ph == 14))
					begin
						txbusy <= TXIDLE;
					end
				end

				TXDAT: begin
					ph <= ph + 1;
					if (ph == 15) 
					begin
						if (bitnum >= 10)
						begin
							if (avail)
							begin
								ack <= 1;
								txd <= 0;
								bitnum <= 0;
								ph <= 0;
								txdata <= { 2'b11, data[7:0] };
								if (data[8])
								begin
									txbusy <= TXBRK;
								end
								else
								begin
									txbusy <= TXDAT;
								end
							end
							else
							begin
								txd <= 1;
								bitnum <= 0;
								ph <= 0;
								txbusy <= TXIDLE;
							end
						end
						else
						begin
							txd <= txdata[0];
							txdata <= { 1'b1, txdata[9:1] };
							bitnum <= bitnum + 1;
							ph <= 0;
						end
					end
				end
		
			endcase
		end
	end
end

endmodule
