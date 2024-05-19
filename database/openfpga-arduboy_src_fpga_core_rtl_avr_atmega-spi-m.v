// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the ATMEGA SPI implementation.
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

`define ATMEGA_SPI_SPCR_INT_EN_bp		7
`define ATMEGA_SPI_SPCR_EN_bp			6
`define ATMEGA_SPI_SPCR_DORD_bp			5
`define ATMEGA_SPI_SPCR_MSTR_bp			4
`define ATMEGA_SPI_SPCR_CPOL_bp			3
`define ATMEGA_SPI_SPCR_CPHA_bp			2 // Not implemented because are very rare the devices that implement this mode.
`define ATMEGA_SPI_SPCR_SPR1_bp			1
`define ATMEGA_SPI_SPCR_SPR0_bp			0

`define ATMEGA_SPI_SPSR_SPIF_bp			7
`define ATMEGA_SPI_SPSR_WCOL_bp			6
`define ATMEGA_SPI_SPSR_SPI2X_bp		0


module atmega_spi_m # (
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter SPCR_ADDR = 'h20,
	parameter SPSR_ADDR = 'h21,
	parameter SPDR_ADDR = 'h22,
	parameter DINAMIC_BAUDRATE = "TRUE",
	parameter BAUDRATE_CNT_LEN = 8,
	parameter BAUDRATE_DIVIDER = 1,
	parameter USE_TX = "TRUE",
	parameter USE_RX = "TRUE"
)(
	input rst_i,
	input clk_i,

	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [7:0]bus_i,
	output reg [7:0]bus_o,

	output int_o,
	input int_ack_i,
	output io_connect_o,
	output io_conn_slave_o,

	output scl_o,
	input miso_i,
	output mosi_o
	);


reg [7:0]SPCR;
reg [7:0]SPSR;
reg [7:0]SPDR;

reg spi_active;
reg sck_active;
	
localparam WORD_LEN = 4'h8;
localparam PRESCALLER_SIZE = 8;

reg stc_p;
reg stc_n;

reg [7:0]rx_shift_reg;
reg [7:0]tx_shift_reg;

reg [3:0]bit_cnt;

reg [(BAUDRATE_CNT_LEN ? BAUDRATE_CNT_LEN - 1 : 0) : 0]prescaller_cnt;
reg sckint;
reg [(BAUDRATE_CNT_LEN ? BAUDRATE_CNT_LEN - 1 : 0) : 0]prescdemux;
reg [(BAUDRATE_CNT_LEN ? BAUDRATE_CNT_LEN - 1 : 0) : 0]prescdemux_reg;

always @ (*)
begin
	bus_o = 8'b00;
	if(rd_i)
	begin
		case(addr_i)
		SPCR_ADDR: bus_o = SPCR;
		SPSR_ADDR: bus_o = SPSR;
		SPDR_ADDR: bus_o = SPDR;
		endcase
	end
end

always @ (posedge clk_i)
begin
	if(DINAMIC_BAUDRATE == "TRUE")
	begin
		case({SPSR[`ATMEGA_SPI_SPSR_SPI2X_bp], SPCR[`ATMEGA_SPI_SPCR_SPR1_bp], SPCR[`ATMEGA_SPI_SPCR_SPR0_bp]})
			3'b000: prescdemux = 1;
			3'b001: prescdemux = 8;
			3'b010: prescdemux = 32;
			3'b011: prescdemux = 64;
			3'b100: prescdemux = 0;
			3'b101: prescdemux = 4;
			3'b110: prescdemux = 16;
			3'b111: prescdemux = 32;
		endcase
	end
	else
	begin
		prescdemux = BAUDRATE_DIVIDER;
	end
end

always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		stc_n <= 1'b0;
		SPCR <= 8'h00;
		SPSR <= 8'h00;
		SPDR <= 8'h00;
		tx_shift_reg <= 8'h00;
		rx_shift_reg <= 8'hFF;
		prescaller_cnt <= 'h00;
		prescdemux_reg <= 8'h0;
		bit_cnt <= WORD_LEN;
		sckint <= 1'b0;
		stc_p <= 1'b0;
		spi_active <= 1'b0;
		sck_active <= 1'b0;
	end
	else
	begin
		if(&{SPCR[`ATMEGA_SPI_SPCR_EN_bp], spi_active})
		begin
			if(prescaller_cnt/* & BAUDRATE_CNT_LEN != 0*/)
			begin
				prescaller_cnt <= prescaller_cnt - 8'h1;
			end
			else
			begin
				prescaller_cnt <= prescdemux_reg;
				sckint <= ~sckint;
//rx
				if(~sckint)
				begin
					bit_cnt <= bit_cnt + 4'd1;
					if(USE_RX == "TRUE")
					begin
						if(bit_cnt == WORD_LEN - 1)
						begin
							if(SPCR[`ATMEGA_SPI_SPCR_DORD_bp] == 1'b0)
							begin
								SPDR <= {rx_shift_reg[WORD_LEN - 2:0], miso_i};
							end
							else
							begin
								SPDR <= {miso_i, rx_shift_reg[WORD_LEN - 1:1]};
							end
						end
						if(SPCR[`ATMEGA_SPI_SPCR_DORD_bp] == 1'b0)
						begin
							rx_shift_reg <= {rx_shift_reg[WORD_LEN - 2:0], miso_i};
						end
						else
						begin
							rx_shift_reg <= {miso_i, rx_shift_reg[WORD_LEN - 1:1]};
						end
					end
				end
				else
				begin
//tx
					if(USE_TX == "TRUE")
					begin
						if(~SPCR[`ATMEGA_SPI_SPCR_DORD_bp])
						begin
							tx_shift_reg <= {tx_shift_reg[WORD_LEN - 2:0], 1'b0};
						end
						else
						begin
							tx_shift_reg <= {1'b0, tx_shift_reg[WORD_LEN - 1:1]};
						end
					end
				end
			end
		end
		if(rd_i)
		begin
			case(addr_i)
			SPSR_ADDR: 
			begin
				SPSR[`ATMEGA_SPI_SPSR_SPIF_bp] <= 1'b0;
				if(stc_p ^ stc_n)
				begin
					SPSR[`ATMEGA_SPI_SPSR_SPIF_bp] <= 1'b1;
					stc_n <= stc_p;
					sck_active <= 1'b0;
				end	
			end
			endcase
		end
		if(stc_p ^ stc_n)
		begin
			SPSR[`ATMEGA_SPI_SPSR_SPIF_bp] <= 1'b1;
			stc_n <= stc_p;
			sck_active <= 1'b0;
		end	
		if(int_ack_i)
		begin
			SPSR[`ATMEGA_SPI_SPSR_SPIF_bp] <= 1'b0;
		end
		if(bit_cnt == WORD_LEN)
		begin
			if(wr_i)
			begin
				case(addr_i)
				SPCR_ADDR: SPCR <= bus_i;
				SPSR_ADDR: SPSR[0] <= bus_i[0];
				SPDR_ADDR: 
				begin
					if(SPCR[`ATMEGA_SPI_SPCR_EN_bp])
					begin
						tx_shift_reg <= bus_i;
						bit_cnt <= 4'h0;
						prescaller_cnt <= prescdemux;
						prescdemux_reg <= prescdemux;
						sckint <= 1'b0;
						spi_active <= 1'b1;
						sck_active <= 1'b1;
					end
				end
				endcase
			end
			if(stc_p == stc_n && spi_active)
			begin
				stc_p <= ~stc_p;
				spi_active <= 1'b0;
			end
		end
	end
end

assign int_o = SPCR[`ATMEGA_SPI_SPCR_INT_EN_bp] ? SPSR[`ATMEGA_SPI_SPSR_SPIF_bp] : 1'b0;
assign scl_o = SPCR[`ATMEGA_SPI_SPCR_EN_bp] ? ((SPCR[`ATMEGA_SPI_SPCR_CPOL_bp]) ? (sck_active ? ~sckint : 1'b1) : (sck_active ? sckint : 1'b0)) : 1'b1;
assign mosi_o = (SPCR[`ATMEGA_SPI_SPCR_EN_bp] & sck_active) ? (SPCR[`ATMEGA_SPI_SPCR_DORD_bp] ? tx_shift_reg[0] : tx_shift_reg[WORD_LEN - 1]) : 1'b1;
assign io_connect_o = SPCR[`ATMEGA_SPI_SPCR_EN_bp];
assign io_conn_slave_o = ~SPCR[`ATMEGA_SPI_SPCR_MSTR_bp];

endmodule
