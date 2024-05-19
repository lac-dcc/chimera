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

`define TWCR_TWINT					7 // TWI Interrupt Flag
`define TWCR_TWEA					6 // TWI Enable Acknowledge Bit
`define TWCR_TWSTA					5 // TWI START Condition Bit
`define TWCR_TWSTO					4 // TWI STOP Condition Bit
`define TWCR_TWWC					3 // TWI Write Collision Flag
`define TWCR_TWEN					2 // TWI Enable Bit
`define TWCR_TWIE					0 // TWI Interrupt Enable

`define TWSR_TWS7					7 // TWI Status
`define TWSR_TWS6					6 // TWI Status
`define TWSR_TWS5					5 // TWI Status
`define TWSR_TWS4					4 // TWI Status
`define TWSR_TWS3					3 // TWI Status
`define TWSR_TWPS1					1 // TWI Prescaler Bits
`define TWSR_TWPS0					0 // TWI Prescaler Bits


`define TWI_START_STATE_IDLE		2'h0
`define TWI_START_STATE_1			2'h1
`define TWI_START_STATE_END			2'h2

`define TWI_STOP_STATE_IDLE			2'h0
`define TWI_STOP_STATE_1			2'h1
`define TWI_STOP_STATE_END			2'h2

`define TWI_DATA_STATE_IDLE			2'h0
`define TWI_DATA_STATE_DATA			2'h1
`define TWI_DATA_STATE_END			2'h2

module atmega_twi #(
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter TWBR_ADDR = 'hb8,
	parameter TWSR_ADDR = 'hb9,
	parameter TWAR_ADDR = 'hba,
	parameter TWDR_ADDR = 'hbb,
	parameter TWCR_ADDR = 'hbc,
	parameter TWAMR_ADDR = 'hbd
    )(
	input rst_i,
	input clk_i,
	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [7:0]bus_i,
	output reg[7:0]bus_o,
	input int_o,
	input int_ack_i,
	
	inout scl_io,
	inout sda_io
    );

reg [7:0]TWBR;
reg [7:0]TWSR;
//reg [7:0]TWAR;
reg [7:0]TWDR;
reg [7:0]TWCR;
//reg [7:0]TWAMR;

reg tx_mode;
reg tx_en;
reg [5:0]presc_value;
reg [5:0]presc_cnt;
wire [7:0]baud_value = TWBR;
reg [7:0]baud_cnt;
reg [3:0]clk_cnt;
reg [1:0]start_state_cnt;
reg [1:0]stop_state_cnt;
reg [1:0]data_state_cnt;
reg [3:0]bit_cnt;
reg int_p, int_n;
reg scl_int;
reg sda_int;

always @ *
begin
	case(TWSR[`TWSR_TWPS1:`TWSR_TWPS0])
		2'h0: presc_value = 1;
		2'h1: presc_value = 4;
		2'h2: presc_value = 16;
		default: presc_value = 64;
	endcase
end

always @ (*)
begin
	bus_o <= 8'h00;
	if(rd_i)
	begin
		case(addr_i)
		TWBR_ADDR: bus_o <= TWBR;
		TWSR_ADDR: bus_o <= TWSR;
		//TWAR_ADDR: bus_o <= TWAR;
		TWDR_ADDR: bus_o <= TWDR;
		TWCR_ADDR: bus_o <= TWCR;
		//TWAMR_ADDR: bus_o <= TWAMR;
		endcase
	end
end

always @ (posedge clk_i or posedge rst_i)
begin
	if(rst_i)
	begin
		TWBR <= 8'h0;
		TWSR <= 8'h0;
		//TWAR <= 8'h0;
		TWDR <= 8'h0;
		TWCR <= 8'h0;
		//TWAMR <= 8'h0;
		tx_mode <= 1'b0;
		tx_en <= 1'b0;
		scl_int <= 1'b1;
		sda_int = 1'b1;
		int_p <= 1'b0;
		int_n <= 1'b0;
		start_state_cnt <= `TWI_START_STATE_IDLE;
		stop_state_cnt <= `TWI_STOP_STATE_IDLE;
		data_state_cnt <= `TWI_DATA_STATE_IDLE;
		clk_cnt = 4'b0;
		bit_cnt <= 4'b0;
	end
	else
	begin
		if(presc_cnt)
		begin
			presc_cnt <= presc_cnt - 1;
		end
		else
		begin
			presc_cnt <= presc_value;
			if(baud_cnt)
			begin
				baud_cnt <= baud_cnt - 1;
			end
			else
			begin
				baud_cnt <= baud_value;
				if(|data_state_cnt)
				begin
					scl_int = clk_cnt[3] ? 1'bz : 1'b0;
					if(clk_cnt == 4'h0)
					begin
						if(tx_mode & data_state_cnt == `TWI_DATA_STATE_DATA)
						begin // Transmit data
							if(bit_cnt[2:0] == 4'h8)
							begin // All bits has been send, switch to receive ack.
								sda_int = 1'bz;
								tx_en <= 1'b0;
							end
							else
							begin
								sda_int = TWDR[7];
								TWDR <= {TWDR[6:0], TWDR[7]};
								bit_cnt <= bit_cnt + 4'h1;
							end
						end
						if(tx_mode & data_state_cnt == `TWI_DATA_STATE_END)
						begin // Ack receiving complete, go to IDLE.
							sda_int = 1'b0;
							scl_int = 1'b0;
							data_state_cnt <= `TWI_DATA_STATE_IDLE;
							TWCR[`TWCR_TWIE] <= 1'b1;
						end
					end
					else if(clk_cnt == 4'h0D)
					begin // Receive data
						if(data_state_cnt == `TWI_DATA_STATE_DATA & tx_mode & ~tx_en)
						begin // All bits has been send, receive ack.
							data_state_cnt <= `TWI_DATA_STATE_END;
						end
					end
					clk_cnt = clk_cnt + 1;
				end
				if(|start_state_cnt)
				begin
					if(~&clk_cnt)
					begin
						case(start_state_cnt)
							`TWI_START_STATE_1: 
							begin
								scl_int = 1'bz;
								//sda_int = 1'bz;
								start_state_cnt <= `TWI_START_STATE_END;
							end
							`TWI_START_STATE_END: 
							begin
								scl_int = 1'b0;
								TWCR[`TWCR_TWSTA] <= 1'b0;
								TWCR[`TWCR_TWIE] <= 1'b1;
							end
						endcase
					end
					if(clk_cnt == 4'h8)
					begin
						sda_int = 1'b0;
					end
					clk_cnt = clk_cnt + 1;
				end
				if(|stop_state_cnt)
				begin
					if(~&clk_cnt)
					begin
						case(start_state_cnt)
							`TWI_STOP_STATE_1: 
							begin
								scl_int = 1'bz;
								//sda_int = 1'bz;
								start_state_cnt <= `TWI_STOP_STATE_END;
							end
							`TWI_START_STATE_END: 
							begin
								TWCR[`TWCR_TWSTO] <= 1'b0;
								TWCR[`TWCR_TWIE] <= 1'b1;
							end
						endcase
					end
					if(clk_cnt == 4'h8)
					begin
						sda_int = 1'bz;
					end
					clk_cnt = clk_cnt + 1;
				end
			end
		end
		
		if(wr_i)
		begin
			case(addr_i)
				TWBR_ADDR: TWBR <= bus_i;
				TWSR_ADDR: TWSR <= bus_i;
				//TWAR_ADDR: TWAR <= bus_i;
				TWDR_ADDR: 
				begin
					TWDR <= bus_i;
					TWCR[`TWCR_TWEN] <= ~TWCR[`TWCR_TWINT];
					if(TWCR[`TWCR_TWINT])
					begin
						data_state_cnt <= `TWI_DATA_STATE_DATA;
						start_state_cnt <= `TWI_START_STATE_IDLE;
						tx_en <= 1'b1;
						clk_cnt <= 4'h0;
					end
				end
				TWCR_ADDR: 
				begin
					TWCR[`TWCR_TWIE] <= bus_i[`TWCR_TWIE];
					TWCR[`TWCR_TWEN] <= bus_i[`TWCR_TWEN];
					TWCR[`TWCR_TWSTO] <= bus_i[`TWCR_TWSTO];
					TWCR[`TWCR_TWSTA] <= bus_i[`TWCR_TWSTA];
					TWCR[`TWCR_TWEA] <= bus_i[`TWCR_TWEA];
					if(bus_i[`TWCR_TWINT])
					begin
						TWCR[`TWCR_TWINT] <= 1'b0;
					end
					if(~|data_state_cnt)
					begin
						if(bus_i[`TWCR_TWSTA] & ~TWCR[`TWCR_TWSTO])
						begin
							start_state_cnt <= `TWI_START_STATE_1;
							tx_en <= 1'b1;
							clk_cnt <= 4'h0;
						end
						if(bus_i[`TWCR_TWSTO] & ~TWCR[`TWCR_TWSTA])
						begin
							stop_state_cnt <= 2'h1;
							tx_en <= 1'b1;
							clk_cnt <= 4'h0;
						end
					end
				end
				//TWAMR_ADDR: TWAMR <= bus_i;
			endcase
		end
		if(rd_i)
		begin
			case(addr_i)
			TWDR_ADDR: 
			begin
				//STATUS[`TWI_MASTER_RIF_bp] <= 1'b0;
			end
			endcase
		end
		if(int_ack_i)
		begin
			int_n <= int_p;
		end
	end
end

generate
if (PLATFORM == "XILINX")
begin
PULLUP PULLUP_scl_inst (
	.O(scl_io)  // 1-bit output: Pullup output (connect directly to top-level port)
);
PULLUP PULLUP_sda_inst (
	.O(sda_io)  // 1-bit output: Pullup output (connect directly to top-level port)
);
end
endgenerate

assign scl_io = scl_int;

assign sda_io = sda_int ? 1'bz : sda_int;

endmodule
