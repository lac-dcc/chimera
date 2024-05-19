// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the TWI implementation.
 * 
 * Copyright (C) 2018  Iulian Gheorghiu (morgoth@devboard.tech)
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

`include "atmega-twi_s_h.v"

module twi_s #(
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter DINAMIC_BAUDRATE = "TRUE",
	parameter BAUDRATE_DIVIDER = 255,
	parameter CTRLA_ADDR = 'hA0,
	parameter CTRLB_ADDR = 'hA1,
	parameter CTRLC_ADDR = 'hA2,
	parameter STATUS_ADDR = 'hA3,
	parameter BAUD_ADDR = 'hA4,
	parameter DATA_ADDR = 'hA5
	)(
	input rst_i,
	input clk_i,
	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [7:0]bus_i,
	output reg[7:0]bus_o,
	output int_o,
	input int_ack_i,
	
	inout scl_io,
	inout sda_io
    );

reg [7:0]CTRLA;
reg [7:0]CTRLB;
reg [7:0]CTRLC;
reg [7:0]STATUS;
reg [7:0]BAUD;
reg [7:0]DATA;

assign req_bus = 0;//addr >= ADDRESS && addr < (ADDRESS + 16);
wire rd_int = rd_i;
wire wr_int = wr_i;

reg [7:0]baud_cnt;
reg [1:0]cmd;
reg tx_mode;
reg start_sent;
reg rcv_ack;
reg send_ack;
reg send_ack_st2;
reg [1:0]stage;
reg [2:0]bit_count;
reg scl_int;
reg sda_int;
reg send_ack_int;

localparam [2:0]CMD_NOP = {1'b1, 2'b00};
localparam [2:0]CMD_RESTART = {1'b0, 2'b01};
localparam [2:0]CMD_RECEIVE = {1'b0, 2'b10};
localparam [2:0]CMD_STOP = {1'b0, 2'b11};

always @ (*)
begin
	bus_o <= 8'h00;
	if(rd_int)
	begin
		case(addr_i[BUS_ADDR_DATA_LEN-1:0])
			CTRLA_ADDR: bus_o <= CTRLA;
			CTRLB_ADDR: bus_o <= CTRLB;
			CTRLC_ADDR: bus_o <= CTRLC;
			STATUS_ADDR: bus_o <= STATUS;
			BAUD_ADDR: bus_o <= BAUD;
			DATA_ADDR: bus_o <= DATA;
		endcase
	end
end

always @ (posedge clk_i or posedge rst_i)
begin
	if(rst_i)
	begin
		CTRLA <= 'h0;
		CTRLB <= 'h0;
		CTRLC <= 'h0;
		STATUS <= 'h0;
		BAUD <= 'h0;
		DATA <= 'h0;
		baud_cnt <= 'h00;
		cmd <= 'h00;
		tx_mode <= 1'b0;
		start_sent <= 1'b0;
		scl_int <= 1'b1;
		sda_int <= 1'b1;
		rcv_ack <= 1'b0;
		send_ack <= 1'b0;
		send_ack_st2 <= 1'b0;
		stage <= 'h00;
		send_ack_int <= 1'b1;
	end
	else
	begin
		if(DINAMIC_BAUDRATE == "TRUE" ? baud_cnt == BAUD : baud_cnt == BAUDRATE_DIVIDER)
		begin
			baud_cnt <= 'h00;
			if(CTRLA[`TWI_MASTER_ENABLE_bp])
			begin
				case({tx_mode, cmd})
				CMD_NOP:
				begin
					if(~start_sent)
					begin/* Send the start sequence */
						stage <= stage + 1;
						case(stage)
						'h0:
						begin
							scl_int <= 1'b1;
							sda_int <= 1'b0;
						end
						'h1:
						begin
							scl_int <= 1'b0;
							bit_count <= 'hF;
							start_sent <= 1'b1;
							stage <= 'h0;
						end
						endcase
					end
					else
					begin/* Send bits */
						stage <= stage + 1;
						case(stage)
						'h0:
						begin
							case(rcv_ack)
							1'b0:
							begin
								sda_int <= DATA[bit_count];
							end
							1'b1:
								sda_int <= 1'b1;
							endcase
						end
						'h1:
						begin
							scl_int <= 1'b1;
						end
						'h2:
						begin
							if(rcv_ack)
								STATUS[`TWI_MASTER_RXACK_bp] <= sda_io;
						end
						'h3:
						begin
							stage <= 'h0;
							scl_int <= 1'b0;
							case(rcv_ack)
							1'b0:
							begin
								if(~|bit_count)
									rcv_ack <= 1'b1;
								bit_count <= bit_count - 1;
							end
							1'b1:
							begin
								tx_mode <= 1'b0;
								STATUS[`TWI_MASTER_WIF_bp] <= 1'b1;
								rcv_ack <= 1'b0;
							end
							endcase
						end
						endcase
					end
				end
				CMD_RESTART:
				begin/* Send restart */
					stage <= stage + 1;
					case(stage)
					'h0:
					begin
						sda_int <= 1'b1;
					end
					'h1:
					begin
						scl_int <= 1'b1;
					end
					'h2:
					begin
						sda_int <= 1'b0;
					end
					'h3:
					begin
						scl_int <= 1'b0;
						bit_count <= 'hF;
						start_sent <= 1'b1;
						stage <= 'h0;
						cmd <= 'h0;
						CTRLC[`TWI_MASTER_CMD_gp + 1:`TWI_MASTER_CMD_gp] <= 'h0;
					end
					endcase
				end
				CMD_RECEIVE:
				begin/* Receive bits */
					stage <= stage + 1;
					case(stage)
					'h0:
					begin
						if(send_ack && ~send_ack_st2)
							sda_int <= send_ack_int;
						else if(send_ack_st2)
						begin
							STATUS[`TWI_MASTER_RIF_bp] <= 1'b1;
							cmd <= 'h0;
							CTRLC[`TWI_MASTER_CMD_gp + 1:`TWI_MASTER_CMD_gp] <= 'h0;
							sda_int <= 1'b1;
						end
					end
					'h1:
					begin
						scl_int <= 1'b1;
					end
					'h2:
					begin
						if(~send_ack)
							DATA[bit_count] <= sda_io;
					end
					'h3:
					begin
						scl_int <= 1'b0;
						stage <= 'h0;
						case(send_ack)
						1'b0:
						begin
							if(~|bit_count)
								send_ack <= 1'b1;
							bit_count <= bit_count - 1;
						end
						1'b1: send_ack_st2 <= 1'b1;
						endcase
					end
					endcase
				end
				CMD_STOP:
				begin/* Send stop */
					stage <= stage + 1;
					case(stage)
					'h0: sda_int <= 1'b0;
					'h1: scl_int <= 1'b1;
					'h2:
					begin
						sda_int <= 1'b1;
						start_sent <= 1'b0;
						stage <= 'h0;
						cmd <= 'h0;
						CTRLC[`TWI_MASTER_CMD_gp + 1:`TWI_MASTER_CMD_gp] <= 'h0;
					end
					endcase
				end
			endcase
			end
		end
		else
		begin
			baud_cnt <= baud_cnt + 1;
		end
		if(CTRLA[`TWI_MASTER_ENABLE_bp])
		begin
			if(CTRLC[`TWI_MASTER_CMD_gp + 1:`TWI_MASTER_CMD_gp] && ~|cmd && ~tx_mode)
			begin
				cmd <= CTRLC[`TWI_MASTER_CMD_gp + 1:`TWI_MASTER_CMD_gp];
				stage <= 'h0;
				send_ack <= 1'b0;
				send_ack_st2 <= 1'b0;
				send_ack_int <= CTRLC[`TWI_SLAVE_ACKACT_bp];
			end
		end
		if(wr_int)
		begin
			case(addr_i[BUS_ADDR_DATA_LEN-1:0])
				CTRLA_ADDR: CTRLA <= bus_i;
				CTRLB_ADDR: CTRLB <= bus_i;
				CTRLC_ADDR: CTRLC <= bus_i;
				STATUS_ADDR: STATUS <= STATUS ^ bus_i;
				BAUD_ADDR: BAUD <= bus_i;
				//`TWI_MASTER_ADDR: ADDR <= bus_i;
				DATA_ADDR: 
				begin
					if(~|CTRLC[`TWI_MASTER_CMD_gp + 1:`TWI_MASTER_CMD_gp])
					begin
						DATA <= bus_i;
						tx_mode <= 1'b1;
						STATUS[`TWI_MASTER_WIF_bp] <= 1'b0;
					end
				end
			endcase
		end
		if(rd_int)
		begin
			case(addr_i[BUS_ADDR_DATA_LEN-1:0])
			`TWI_MASTER_DATA: 
				begin
					STATUS[`TWI_MASTER_RIF_bp] <= 1'b0;
				end
			endcase
		end
	end
end

generate
if(PLATFORM == "XILINX")
begin
PULLUP PULLUP_scl_inst (
	.O(scl_io)  // 1-bit output: Pullup output (connect directly to top-level port)
);
PULLUP PULLUP_sda_inst (
	.O(sda_io)  // 1-bit output: Pullup output (connect directly to top-level port)
);
end
endgenerate


assign scl_io = scl_int ? 1'bz : scl_int;
assign sda_io = sda_int ? 1'bz : sda_int;

endmodule
