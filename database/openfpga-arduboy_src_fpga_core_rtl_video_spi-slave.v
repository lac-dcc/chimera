/*
 * This IP is the SPI slave implementation.
 * 
 * Copyright (C) 2020  Iulian Gheorghiu (morgoth@devboard.tech)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
`timescale 1ns / 1ps


module spi_slave # (
	parameter MAX_BITS_PER_WORD = 8,
	parameter USE_TX = "TRUE",
	parameter USE_RX = "TRUE"
	)(
	input rst_i,
	input clk_i,
	input en_i,
	input [3:0]bit_per_word_i,
	input lsb_first_i,
	input ss_i,
	input scl_i,
	output miso_o,
	input mosi_i,
	input [MAX_BITS_PER_WORD - 1:0]bus_i,
	output reg rdy_o,
	input rdy_ack_i,
	output reg [MAX_BITS_PER_WORD - 1:0]bus_o,
	output first_byte_o,
	output last_byte_o,
	input last_byte_ack_i
	);

reg [MAX_BITS_PER_WORD - 1:0]rx_shift_reg;
reg [MAX_BITS_PER_WORD - 1:0]tx_shift_reg;
reg [3:0]bit_cnt;
reg first_byte_1;
reg first_byte_2;

reg rdy_p;
reg rdy_n;

reg last_byte_p;
reg last_byte_n;

reg cs_p;
reg cs_start_p;

reg [3:0]bit_per_word_int;

always @ (posedge rst_i or posedge clk_i or negedge en_i)
begin
	if(rst_i | ~en_i)
	begin
		rdy_n <= 'h0;
	end
	else
	if(rdy_ack_i)
	begin
		rdy_n <= rdy_p;
	end
end

always @ (posedge rst_i or posedge clk_i or negedge en_i)
begin
	if(rst_i | ~en_i)
	begin
		last_byte_n <= 1'b0;
	end
	else
	if(last_byte_ack_i)
	begin
		last_byte_n <= last_byte_p;
	end
end

always @ (posedge rst_i or posedge clk_i or negedge en_i)
begin
	if(rst_i | ~en_i)
	begin
		last_byte_p <= 1'b0;
		cs_p <= 1'b1;
	end
	else
	begin
		if(last_byte_p == last_byte_n && {cs_p, ss_i} == 2'b01)
		begin
			last_byte_p <= ~last_byte_p;
		end
		cs_p <= ss_i;
	end
end

//rx
always @ (posedge rst_i or posedge scl_i or posedge ss_i or negedge en_i)
begin
	if(rst_i | ~en_i)
	begin
		rx_shift_reg <= 'hFFF;
		bit_cnt <= 4'h0;
		first_byte_1 <= 1'b0;
		first_byte_2 <= 1'b0;
		rdy_p <= 1'b0;
		bit_per_word_int <= bit_per_word_i - 4'd1;
		bus_o <= 8'h00;
	end
	else
	begin
		if(ss_i)
		begin
			rx_shift_reg <= 'hFFF;
			bit_cnt <= 4'h0;
			first_byte_1 <= 1'b0;
			first_byte_2 <= 1'b0;
			bit_per_word_int <= bit_per_word_i - 4'd1;
		end
		else
		begin
			bit_cnt <= bit_cnt + 4'd1;
			if(bit_cnt == bit_per_word_int)
			begin
				first_byte_2 <= first_byte_1;
				first_byte_1 <= 1'b1;
				if(rdy_p == rdy_n)
				begin
					rdy_p <= ~rdy_p;
				end
				if(USE_RX == "TRUE")
				begin
					if(lsb_first_i == 1'b0)
					begin
						bus_o <= {rx_shift_reg[MAX_BITS_PER_WORD - 2:0], mosi_i};
					end
					else
					begin
						bus_o <= rx_shift_reg[MAX_BITS_PER_WORD - 1:0];
						bus_o[bit_cnt] <= mosi_i;
					end
				end
				bit_cnt <= 4'h0;
			end
			if(USE_RX == "TRUE")
			begin
				if(lsb_first_i == 1'b0)
				begin
					rx_shift_reg <= {rx_shift_reg[MAX_BITS_PER_WORD - 2:0], mosi_i};
				end
				else
				begin
					rx_shift_reg[bit_cnt] <= mosi_i;
				end
			end
		end
	end
end
//tx
always @ (posedge rst_i or negedge scl_i or posedge ss_i or negedge en_i)
begin
	if(USE_TX == "TRUE")
	begin
		if(rst_i | ~en_i)
		begin
			tx_shift_reg <= 'h0;
		end
		else
		begin
			if(bit_cnt == 4'h0 || ss_i)
			begin
				tx_shift_reg <= bus_i;
			end
			else
			begin
				if(lsb_first_i == 1'b0)
				begin
					tx_shift_reg <= {tx_shift_reg[MAX_BITS_PER_WORD - 2:0], 1'b0};
				end
				else
				begin
					tx_shift_reg <= {1'b0, tx_shift_reg[MAX_BITS_PER_WORD - 1:1]};
				end
			end
		end
	end
end

always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		rdy_o <= 1'b0;
	end
	else
	begin
		rdy_o <= rdy_p ^ rdy_n;
	end
end

assign miso_o = (ss_i | ~en_i) ? 1'bz : (lsb_first_i == 1'b0 ? tx_shift_reg[bit_per_word_int] : tx_shift_reg[0]);
assign first_byte_o = first_byte_1 & ~first_byte_2;
assign last_byte_o = last_byte_n ^ last_byte_p;

endmodule