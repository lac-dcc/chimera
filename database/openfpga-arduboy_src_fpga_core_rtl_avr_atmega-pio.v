/*
 * This IP is the ATMEGA PIO implementation.
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
 
/************************************************************/
/* Atention!  This file contain platform dependent modules. */
/************************************************************/

`timescale 1ns / 1ps


module atmega_pio # (
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter PORT_WIDTH = 8,
	parameter USE_CLEAR_SET = "FALSE",
	parameter PORT_OUT_ADDR = 'h00,
	parameter DDR_ADDR = 'h03,
	parameter PIN_ADDR = 'h04,
	parameter PORT_CLEAR_ADDR = 'h01,	
	parameter PORT_SET_ADDR = 'h02,
	parameter PINMASK = 'hFF,
	parameter PULLUP_MASK = 'h0,
	parameter PULLDN_MASK = 'h0,
	parameter INVERSE_MASK = 'h0,
	parameter OUT_ENABLED_MASK = 'hFF,
	parameter INITIAL_OUTPUT_VALUE = 'h00,
	parameter INITIAL_DIR_VALUE = 'h00
)(
	input rst_i,
	input clk_i,

	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [PORT_WIDTH - 1:0]bus_i,
	output reg [PORT_WIDTH - 1:0]bus_o,

	input [PORT_WIDTH - 1:0]io_i,
	output [PORT_WIDTH - 1:0]io_o,
	output [PORT_WIDTH - 1:0]pio_out_io_connect_o
	);

reg [PORT_WIDTH - 1:0]DDR;
reg [PORT_WIDTH - 1:0]PORT;
reg [PORT_WIDTH - 1:0]PIN;

localparam BUS_LEN_SHIFT = PORT_WIDTH > 16 ? 2 : (PORT_WIDTH > 8 ? 1 : 0);

integer cnt_int;

always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		DDR <= INITIAL_DIR_VALUE;
		PORT <= INITIAL_OUTPUT_VALUE;
		PIN <=  0;
	end
	else
	begin
		for (cnt_int = 0; cnt_int < PORT_WIDTH; cnt_int = cnt_int + 1)
		begin
			if (PINMASK[cnt_int])
			begin
				PIN[cnt_int] <= io_i[cnt_int];
				if(wr_i)
				begin
					case(addr_i[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT])
						DDR_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: DDR[cnt_int] <= bus_i[cnt_int];
						PORT_OUT_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: PORT[cnt_int] <= bus_i[cnt_int];
						PORT_CLEAR_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: 	
						begin	
							if(USE_CLEAR_SET == "TRUE")	
								PORT[cnt_int] <= PORT[cnt_int] & ~bus_i[cnt_int];	
						end	
						PORT_SET_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: 	
						begin	
							if(USE_CLEAR_SET == "TRUE")	
								PORT[cnt_int] <= PORT[cnt_int] | bus_i[cnt_int];	
						end					
					endcase
				end
			end
		end
	end
end

always @ *
begin
	for (cnt_int = 0; cnt_int < PORT_WIDTH; cnt_int = cnt_int + 1)
	begin
		if (PINMASK[cnt_int])
		begin
			bus_o[cnt_int] = 1'b0;
			if(rd_i & ~rst_i)
			begin
				case(addr_i[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT])
					PORT_OUT_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: bus_o[cnt_int] = PORT[cnt_int];
					DDR_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: bus_o[cnt_int] = DDR[cnt_int];
					PIN_ADDR[BUS_ADDR_DATA_LEN-1 : BUS_LEN_SHIFT]: bus_o[cnt_int] = INVERSE_MASK[cnt_int] ? ~PIN[cnt_int] : PIN[cnt_int];
				endcase
			end
		end
		else
			bus_o[cnt_int] = 1'b0;
	end
end

genvar cnt;
generate

for (cnt = 0; cnt < PORT_WIDTH; cnt = cnt + 1)
begin:OUTS_CONNECT
	assign pio_out_io_connect_o[cnt] = (PINMASK[cnt] & OUT_ENABLED_MASK[cnt]) ? DDR[cnt] : 1'b0;
end

for (cnt = 0; cnt < PORT_WIDTH; cnt = cnt + 1)
begin:OUTS
	if (PINMASK[cnt] & OUT_ENABLED_MASK[cnt])
	begin
		assign io_o[cnt] = DDR[cnt] ? (INVERSE_MASK[cnt] ? ~PORT[cnt] : PORT[cnt]) : 1'bz;
	end
	else
	begin
		assign io_o[cnt] = 1'bz;
	end
end

for (cnt = 0; cnt < PORT_WIDTH; cnt = cnt + 1)
begin:PULLUPS
	if (PULLUP_MASK[cnt] & PINMASK[cnt])
	begin
		if (PLATFORM == "XILINX")
		begin
			PULLUP PULLUP_inst (
				.O(io_o[cnt])     // PullUp output (connect directly to top-level port)
			);
		end
	end
end

for (cnt = 0; cnt < PORT_WIDTH; cnt = cnt + 1)
begin:PULLDOWNS
	if (PULLDN_MASK[cnt] & PINMASK[cnt])
	begin
		if (PLATFORM == "XILINX")
		begin
			PULLDOWN PULLDOWN_inst (
				.O(io_o[cnt])     // PullDown output (connect directly to top-level port)
			);
		end
	end
end

endgenerate


endmodule
