/*
 * This IP is the ATMEGA EEPROM implementation.
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


module atmega_eep # (
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter EEARH_ADDR = 'h20,
	parameter EEARL_ADDR = 'h21,
	parameter EEDR_ADDR = 'h22,
	parameter EECR_ADDR = 'h23,
	parameter EEP_SIZE = 512
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
	
	input [16:0]ext_eep_addr_i,
	input [7:0]ext_eep_data_i,
	input ext_eep_data_wr_i,
	output [7:0]ext_eep_data_o,
	input ext_eep_data_rd_i,
	input ext_eep_data_en_i,
	
	output reg content_modifyed_o,
	output [4:0]debug_o
	);

(* ram_style="block" *)
reg [7:0]eep[EEP_SIZE -1 : 0];

reg [7:0]EEARH;
reg [7:0]EEARL;
reg [7:0]EEDR_WRITE;
reg [7:0]EEDR_READ;
reg [7:0]EECR;

reg[2:0]eempe_timeout_cnt;
reg eep_wr;
reg [7:0]dat_to_write;
reg [7:0]read_tmp;

reg int_p;
reg int_n;

integer clear_cnt;
initial begin
	for(clear_cnt = 0; clear_cnt < EEP_SIZE; clear_cnt = clear_cnt + 1)
	begin : CLEAR_EEP
		eep[clear_cnt] = 8'h00;
	end
end

always @ *
begin
	bus_o = 8'h00;
	if(rd_i)
	begin
		case(addr_i)
			EEARH_ADDR: bus_o = EEARH;
			EEARL_ADDR: bus_o = EEARL;
			EEDR_ADDR: bus_o = EEDR_READ;
			EECR_ADDR: bus_o = EECR;
		endcase
	end
end

always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		EEARH <= 8'h00;
		EEARL <= 8'h00;
		EEDR_READ <= 8'h00;
		EEDR_WRITE <= 8'h00;
		EECR <= 8'h00;
		content_modifyed_o <= 1'b0;
		eempe_timeout_cnt <= 3'h0;
		int_p <= 1'b0;
		int_n <= 1'b0;
		dat_to_write <= 1'b0;
		eep_wr <= 1'b0;
	end
	else
	begin
		content_modifyed_o <= 1'b0;
		eep_wr <= 1'b0;
		if(eempe_timeout_cnt)
		begin
			eempe_timeout_cnt <= eempe_timeout_cnt - 1;
		end
		if(wr_i)
		begin
			case(addr_i)
				EEARH_ADDR: EEARH <= bus_i;
				EEARL_ADDR: EEARL <= bus_i;
				EEDR_ADDR: EEDR_WRITE <= bus_i;
				EECR_ADDR: 
				begin
					EECR <= bus_i;
					if(EECR[2] | bus_i[1])
					begin
						eempe_timeout_cnt <= 3'h4;
					end
				end
			endcase
		end
		if((&EECR[2:1]) )
		begin
			if(|eempe_timeout_cnt)
			begin
				case(EECR[5:4])
					2'h0, 2'h2: 
					begin
						dat_to_write <= ~EEDR_WRITE;
						eep_wr <= 1'b1;
					end
					2'h1: 
					begin
						dat_to_write <= 8'h00;
						eep_wr <= 1'b1;
					end
				endcase
			end
			EECR[2:1] <= 2'b00;
			if(int_p == int_n)
			begin
				int_p <= ~int_p;
			end
		end
		if(EECR[0])
		begin
			EEDR_READ <= ~read_tmp;
			EECR[0] <= 1'b0;
		end
		if(int_ack_i)
		begin
			int_n <= int_p;
		end
		if(eep_wr)
		begin
			content_modifyed_o <= content_modifyed_o | 1'b1;
		end
	end
end

always @ (posedge clk_i)
begin
	if(eep_wr)
	begin
		eep[ext_eep_data_en_i ? ext_eep_addr_i : {EEARH, EEARL}] <= ext_eep_data_en_i ? ~ext_eep_data_i : dat_to_write;
	end
	read_tmp <= eep[ext_eep_data_en_i ? ext_eep_addr_i : {EEARH, EEARL}];
end

assign ext_eep_data_o = (ext_eep_data_rd_i & ext_eep_data_en_i) ? ~read_tmp : 8'h00;
assign int_o = EECR[3] ? (int_p ^ int_n) : 1'b0;

endmodule
