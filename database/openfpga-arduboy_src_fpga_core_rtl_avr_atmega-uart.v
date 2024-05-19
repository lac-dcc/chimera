// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the ATMEGA UART implementation.
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


// UCSRA
`define RXC		7
`define TXC		6
`define UDRE	5
`define FE		4
`define DOR		3
`define UPE		2
`define U2X		1
`define MPCM	0
// UCSRB
`define RXCIE	7
`define TXCIE	6
`define UDREIE	5
`define RXEN	4
`define TXEN	3
`define UCSZ2	2
`define RXB8	1
`define TXB8	0
// UCSRC
`define UMSEL1	7
`define UMSEL0	6
`define UPM1	5
`define UPM0	4
`define USBS	3
`define UCSZ1	2
`define UCSZ0	1
`define UCPOL	0
// UCSRD
`define CTSEN	1
`define RTSEN	0


module atmega_uart # (
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter UDR_ADDR = 'hc1,
	parameter UCSRA_ADDR = 'hc8,
	parameter UCSRB_ADDR = 'hc9,
	parameter UCSRC_ADDR = 'hca,
	parameter UCSRD_ADDR = 'h00,
	parameter UBRRL_ADDR = 'hcc,
	parameter UBRRH_ADDR = 'hcd,
	parameter USE_TX = "TRUE",
	parameter USE_RX = "TRUE",
	parameter USE_RX_FILTER = "FALSE"
	)(
	input rst_i,
	input clk_i,
	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [7:0]bus_i,
	output reg [7:0]bus_o,
	
	output rxc_int_o,
	input rxc_int_ack_i,
	output txc_int_o,
	input txc_int_ack_i,
	output udre_int_o,
	input udre_int_ack_i,

	input rx_i,
	output reg tx_o,
	output tx_connect_o
	);


reg [7:0]UDR_rx;
reg [7:0]UDR_tx;
reg [7:0]UCSRA;
reg [7:0]UCSRB;
reg [7:0]UCSRC;
//reg [7:0]UCSRD;
reg [7:0]UBRRL;
reg [3:0]UBRRH;

reg udre_p, udre_n;
reg udre_int_p, udre_int_n;
reg txc_p, txc_n;

wire [15:0]tx_prescaller_value_int = ({UBRRH, UBRRL} + 1) << (UCSRA[`U2X] ? 3 : 4);
wire [13:0]rx_prescaller_value_int = ({UBRRH, UBRRL} + 1) << (UCSRA[`U2X] ? 0 : 1);
reg [3:0]bit_per_word_int;
wire stop_bits_int = UCSRC[`USBS];
always @ *
begin
	case({UCSRB[`UCSZ2], UCSRC[`UCSZ1:`UCSZ0]})
	3'd0: bit_per_word_int = 4'd5;
	3'd1: bit_per_word_int = 4'd6;
	3'd2: bit_per_word_int = 4'd7;
	//3'd3: bit_per_word_int = 4'd8;
	3'd7: bit_per_word_int = 4'd9;
	default: bit_per_word_int = 4'd8;
	endcase
end

reg [15:0]tx_prescaller_cnt;
reg [1:0]tx_state;
reg [8:0]tx_shift_reg;
reg [3:0]tx_bit_cnt;
reg send_p;
reg send_n;
reg udre_old;

always @ (posedge clk_i)
begin
	if(USE_TX == "TRUE")
	begin
		if(rst_i)
		begin
			UDR_tx <= 8'h00;
			UCSRA[3:0] <= 4'h0;
			UCSRB[7:2] <= 6'h00;
			UCSRB[0] <= 1'b0;
			UCSRC <= 8'h00;
			//UCSRD <= 8'h00;
			UBRRL <= 8'h00;
			UBRRH <= 4'h00;
			tx_prescaller_cnt <= 16'h0000;
			tx_state <= 2'h0;
			tx_o <= 1'b1;
			send_p <= 1'b0;
			send_n <= 1'b0;
			udre_p <= 1'b0;
			udre_n <= 1'b0;
			txc_p <= 1'b0;
			txc_n <= 1'b0;
			tx_bit_cnt <= 4'h0;
			tx_shift_reg <= 9'h000;
			udre_old <= 1'b1;
		end
		else
		begin
			udre_old <= UCSRA[`UDRE];
			if(~UCSRB[`TXEN])
			begin
				tx_prescaller_cnt <= 16'h0000;
				tx_state <= 2'h0;
				tx_o <= 1'b1;
				send_p <= 1'b0;
				send_n <= 1'b0;
				udre_p <= 1'b0;
				udre_n <= 1'b0;
				tx_bit_cnt <= 4'h0;
			end
			else
			begin
				if(tx_prescaller_cnt)
				begin
					tx_prescaller_cnt <= tx_prescaller_cnt - 1;
				end
				else
				begin
					tx_prescaller_cnt <= tx_prescaller_value_int - 1;
					if(tx_state == 2'h1)
					begin
						if(tx_bit_cnt)
						begin
							tx_o <= tx_shift_reg[0];
						end
						else
						begin
							if(~stop_bits_int)
							begin
								tx_state <= 2'h3;
							end
							else
							begin
								tx_state <= 2'h2;
							end
							tx_o <= 1'b1;
						end
						tx_shift_reg <= {1'b0, tx_shift_reg[8:1]};
						tx_bit_cnt <= tx_bit_cnt - 1;
					end
					else if(tx_state == 2'h2)
					begin
						tx_state <= 2'h3;
					end
					else if(tx_state == 2'h3)
					begin
						tx_state <= 2'h0;
						txc_p <= ~txc_n;
					end
				end
				if(udre_p ^ udre_n & send_p == send_n)
				begin
					udre_n <= udre_p;
					send_p <= ~send_n;
				end
				if((send_p ^ send_n) & tx_state == 2'h0)
				begin
					send_n <= send_p;
					tx_prescaller_cnt <= tx_prescaller_value_int - 1;
					tx_shift_reg <= UDR_tx;
					tx_shift_reg[8] <= UCSRB[`TXB8];
					tx_o <= 1'b0;
					tx_bit_cnt <= bit_per_word_int;
					tx_state <= 2'h1;
				end
			end
		end
		if(~UCSRB[`UDREIE])
		begin
			udre_p <= 1'b0;
			udre_n <= 1'b0;
		end
		if(~UCSRB[`TXCIE])
		begin
			txc_p <= 1'b0;
			txc_n <= 1'b0;
		end
		if(udre_int_ack_i)
		begin
			udre_int_n <= udre_int_p;
		end
		if(txc_int_ack_i)
		begin
			txc_n <= txc_p;
		end
		if(~udre_old & UCSRA[`UDRE])
			udre_int_p <= ~udre_int_n;
	end
	if(wr_i)
	begin
		case(addr_i)
			UDR_ADDR:
			begin
				UDR_tx <= bus_i;
				udre_p <= ~udre_n;
			end
			UCSRA_ADDR:
			begin
				txc_n <= txc_p;
				UCSRA[3:0] <= bus_i[3:0];
			end
			UCSRB_ADDR: 
			begin
				UCSRB[7:2] <= bus_i[7:2];
				UCSRB[0] <= bus_i[0];
			end
			UCSRC_ADDR: UCSRC <= bus_i;
			//UCSRD_ADDR: UCSRD <= bus_i;
			UBRRL_ADDR: UBRRL <= bus_i;
			UBRRH_ADDR: UBRRH <= bus_i[3:0];
		endcase
	end
end

always @ * UCSRA[`UDRE] = udre_p == udre_n & send_p == send_n;
always @ * UCSRA[`TXC] = txc_p ^ txc_n;
assign udre_int_o = UCSRB[`UDREIE] ? udre_int_p ^ udre_int_n : 1'b0;
assign txc_int_o = UCSRB[`TXCIE] ? UCSRA[`TXC] : 1'b0;
assign tx_connect_o = UCSRB[`TXEN];

reg [13:0]rx_prescaller_cnt;
reg [1:0]rx_state;
reg [8:0]rx_shift_reg;
reg [2:0]rx_pin_state_0_cnt;
reg [2:0]rx_pin_state_1_cnt;
reg [2:0]rx_sample_cnt;
reg [3:0]rx_bit_cnt;
wire rx_pin_state = USE_RX_FILTER == "TRUE" ? ((rx_pin_state_0_cnt <= rx_pin_state_1_cnt) & ((rx_pin_state_0_cnt == 3'b100) | (rx_pin_state_1_cnt == 3'b100))) : rx_i;
reg rxc_p;
reg rxc_n;

always @ (posedge clk_i)
begin
	if(USE_RX == "TRUE")
	begin
		if(rst_i)
		begin
			rx_prescaller_cnt <= 16'h0000;
			rx_state <= 2'h0;
			if(USE_RX_FILTER == "TRUE")
			begin
				rx_pin_state_0_cnt <= 3'h0;
				rx_pin_state_1_cnt <= 3'h0;
			end
			rx_bit_cnt <= 4'h0;
			rx_sample_cnt <= 4'h0;
			rx_shift_reg <= 'h0;
			UCSRA[`FE] <= 1'b0;
			rxc_p <= 1'b0;
			rxc_n <= 1'b0;
			UDR_rx <= 8'h00;
			UCSRB[`RXB8] <= 1'b0;
		end
		else
		begin
			if(~UCSRB[`RXEN])
			begin
				rx_prescaller_cnt <= 16'h0000;
				rx_state <= 2'h0;
				if(USE_RX_FILTER == "TRUE")
				begin
					rx_pin_state_0_cnt <= 3'h0;
					rx_pin_state_1_cnt <= 3'h0;
				end
				rx_bit_cnt <= 4'h0;
				rx_sample_cnt <= 4'h0;
				rx_shift_reg <= 'h0;
				UCSRA[`FE] <= 1'b0;
				rxc_p <= 1'b0;
				rxc_n <= 1'b0;
			end
			else
			begin
				rx_prescaller_cnt <= rx_prescaller_cnt - 1;
				if(rx_prescaller_cnt == 0)
				begin
					rx_prescaller_cnt <= rx_prescaller_value_int - 1;
					rx_sample_cnt <= rx_sample_cnt + 1;
					if(USE_RX_FILTER == "TRUE")
					begin
						if(rx_i)
						begin
							if(rx_pin_state_1_cnt != 3'b100)
							begin
								rx_pin_state_1_cnt <= rx_pin_state_1_cnt + 1;
							end
							if(rx_pin_state_0_cnt)
							begin
								rx_pin_state_0_cnt <= rx_pin_state_0_cnt - 1;
							end
						end
						else
						begin
							if(rx_pin_state_0_cnt != 3'b100)
							begin
								rx_pin_state_0_cnt <= rx_pin_state_0_cnt + 1;
							end
							if(rx_pin_state_1_cnt)
							begin
								rx_pin_state_1_cnt <= rx_pin_state_1_cnt - 1;
							end
						end
					end
					case(rx_state)
						2'h1:
						begin
							if(rx_sample_cnt == 4'h5)
							begin
								if(~rx_pin_state) // Check the START condition thru filter.
								begin // Start confirmed
									rx_bit_cnt <= 4'h0;
									rx_shift_reg <= 'h0;
									rx_state <= 2'h2;
								end
								else
								begin // False start, go back to IDLE
									if(USE_RX_FILTER == "TRUE")
									begin
										rx_pin_state_0_cnt <= 3'h0;
										rx_pin_state_1_cnt <= 3'h0;
									end
									rx_state <= 2'h0;
								end
							end
						end
						2'h2:
						begin
							if(rx_sample_cnt == 4'h0)
							begin
								if(USE_RX_FILTER == "TRUE")
								begin
									rx_pin_state_0_cnt <= 3'h0;
									rx_pin_state_1_cnt <= 3'h0;
								end
							end
							if(rx_sample_cnt == 4'h5)
								begin
								if(rx_bit_cnt < bit_per_word_int)
								begin
									rx_shift_reg[rx_bit_cnt] <= rx_pin_state;
									rx_bit_cnt <= rx_bit_cnt + 1;
								end
								else
								begin
									if(rx_pin_state)
									begin
										UCSRA[`FE] <= 1'b0;
									end
									else
									begin
										UCSRA[`FE] <= 1'b1;
									end
									if(~stop_bits_int)
									begin
										UDR_rx <= rx_shift_reg;
										UCSRB[`RXB8] <= rx_shift_reg[8];
										rxc_p <= ~rxc_n;
										if(USE_RX_FILTER == "TRUE")
										begin
											rx_pin_state_0_cnt <= 3'h0;
											rx_pin_state_1_cnt <= 3'h0;
										end
										rx_sample_cnt <= 4'd0;
										rx_state <= 2'h0;
									end
									else
									begin
										rx_state <= 2'h3;
									end
								end
							end
						end
						2'h3:
						begin
							if(rx_sample_cnt == 4'h5)
							begin
								if(~rx_pin_state)
								begin
									UCSRA[`FE] <= 1'b1;
								end
								UDR_rx <= rx_shift_reg;
								UCSRB[`RXB8] <= rx_shift_reg[8];
								rxc_p <= ~rxc_n;
								if(USE_RX_FILTER == "TRUE")
								begin
									rx_pin_state_0_cnt <= 3'h0;
									rx_pin_state_1_cnt <= 3'h0;
								end
								rx_sample_cnt <= 4'd0;
								rx_state <= 2'h0;
							end
						end
					endcase
				end
			end
			case(rx_state)
				2'h0:
				begin
					if(~rx_i)
					begin // Check for low level on RX pin.
						if(USE_RX_FILTER == "TRUE")
						begin
							rx_pin_state_0_cnt <= 3'h0;
							rx_pin_state_1_cnt <= 3'h0;
						end
						rx_prescaller_cnt <= rx_prescaller_value_int - 1;
						rx_sample_cnt <= 4'h0;
						rx_state <= 2'h1;
					end
				end
			endcase
		end
		/*if(~UCSRB[`RXCIE])
		begin
			rxc_p <= 1'b0;
			rxc_n <= 1'b0;
		end*/
		if(rd_i)
		begin
			case(addr_i)
				UDR_ADDR: 
				begin
					rxc_n <= rxc_p;
				end
			endcase
		end
		if(rxc_int_ack_i)
		begin
			rxc_n <= rxc_p;
		end
	end
end

always @ * UCSRA[`RXC] = rxc_p ^ rxc_n;
assign rxc_int_o = UCSRB[`RXCIE] ? UCSRA[`RXC] : 1'b0;


always @ *
begin
	if(rst_i)
	begin
		bus_o = 8'b0;
	end
	else
	begin
		bus_o = 8'b0;
		if(rd_i)
		begin
			case(addr_i)
				UDR_ADDR: bus_o = UDR_rx;
				UCSRA_ADDR: bus_o = UCSRA;
				UCSRB_ADDR: bus_o = {UCSRB[7:`RXEN + 1], USE_RX == "TRUE" ? UCSRB[`RXEN] : 1'b0, USE_TX == "TRUE" ? UCSRB[`TXEN] : 1'b0, UCSRB[`TXEN - 1 : 0]};
				UCSRC_ADDR: bus_o = UCSRC;
				//UCSRD_ADDR: bus_o = UCSRD;
				UBRRL_ADDR: bus_o = UBRRL;
				UBRRH_ADDR: bus_o = {4'h0, UBRRH[3:0]};
			endcase
		end
	end
end
endmodule