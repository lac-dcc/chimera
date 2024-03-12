/*
 * This IP is the BUS demultiplexer implementation.
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

module io_bus_dmux # (
		parameter BITS_PER_BUS = 8,
		parameter NR_OF_BUSSES_IN = 1
		)(
		input [(NR_OF_BUSSES_IN * BITS_PER_BUS) - 1 : 0]bus_in,
		output reg[BITS_PER_BUS - 1:0]bus_out
		);
reg [NR_OF_BUSSES_IN - 1 : 0]tmp_busses_bits;
integer cnt_add_busses;
integer cnt_add_bits;
		always @ *
		begin
			for(cnt_add_bits = 0; cnt_add_bits < BITS_PER_BUS; cnt_add_bits = cnt_add_bits + 1)
			begin: DMUX_IO_DATA_BITS
				for(cnt_add_busses = 0; cnt_add_busses < NR_OF_BUSSES_IN; cnt_add_busses = cnt_add_busses + 1)
				begin: DMUX_IO_DATA_BUSES
					tmp_busses_bits[cnt_add_busses] = bus_in[(cnt_add_busses * BITS_PER_BUS) + cnt_add_bits];
				end
				bus_out[cnt_add_bits] = |tmp_busses_bits;
			end
		end
endmodule

