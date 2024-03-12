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

module dmx
(
	input	wire			rst_n,
	input	wire			clk,

	output	wire			dmx_txd,

	input	wire			dmx_tx_fifo_clk,
	output	wire			dmx_tx_fifo_full,
	input	wire			dmx_tx_fifo_wr,
	input	wire	[8:0]	dmx_tx_fifo_wr_data
);

parameter DIVISOR = 4;


//
// dmx baud rate generator
//

wire baudEn;

dmx_brg #(DIVISOR) dmx_brg
(
    .rst_n              (rst_n),
    .clk                (clk),
    .baudEn             (baudEn)
);


// 
// dmx transmit fifo
//

wire dmx_tx_fifo_empty;
wire dmx_tx_fifo_rd;
wire [8:0] dmx_tx_fifo_rd_data;
wire dmx_tx_fifo_avail;

afifo512x9 dmx_tx_fifo
(
    .rst                (!rst_n),
    .wr_clk             (dmx_tx_fifo_clk),
    .rd_clk             (clk),
    .din                (dmx_tx_fifo_wr_data),
    .wr_en              (dmx_tx_fifo_wr),
    .rd_en              (dmx_tx_fifo_rd),
    .dout               (dmx_tx_fifo_rd_data),
    .full               (dmx_tx_fifo_full),
    .empty              (dmx_tx_fifo_empty)
);


//
// dmx transmitter
//

reg dmx_tx_fifo_rd_z;

assign dmx_tx_fifo_avail = !dmx_tx_fifo_empty && !dmx_tx_fifo_rd && !dmx_tx_fifo_rd_z;

dmx_tx dmx_tx
(
    .rst_n              (rst_n),
    .clk                (clk),
    .baudEn             (baudEn),
    .avail              (dmx_tx_fifo_avail),
    .data               (dmx_tx_fifo_rd_data),
    .ack                (dmx_tx_fifo_rd),
    .txd                (dmx_txd)
);

always @ (posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        dmx_tx_fifo_rd_z <= 0;
    end
    else
    begin
        dmx_tx_fifo_rd_z <= dmx_tx_fifo_rd;
    end
end

endmodule
