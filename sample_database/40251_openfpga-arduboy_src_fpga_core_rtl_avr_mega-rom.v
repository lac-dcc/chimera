// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the ROM memory for the Atmel MEGA CPU implementation.
 * 
 * Copyright (C) 2017  Iulian Gheorghiu  (morgoth@devboard.tech)
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
 
module mega_rom  #(
	parameter PLATFORM = "",
	parameter ADDR_ROM_BUS_WIDTH = 14, /* < in address lines */
	parameter ROM_PATH = ""
) (
	input clk,
	input [ADDR_ROM_BUS_WIDTH-1:0] a,
	input cs,
	output [15:0]d
);

reg[15:0]d_int;
wire[15:0]dw_int;
generate

if(PLATFORM == "XILINX")
begin
(* ram_style="block" *)
reg [15:0] mem [(2**ADDR_ROM_BUS_WIDTH)-1:0];

initial begin
if (ROM_PATH != "")
	$readmemh({ROM_PATH, ".mem"}, mem);
end


always @ (posedge clk)
begin
	d_int <= mem[a];
end

assign d = cs ? d_int : 16'h0000;
end
else if(PLATFORM == "iCE40UP")
begin
wire[15:0]d_int;

pmi_rom 
#(
	.pmi_addr_depth       (2 ** ADDR_ROM_BUS_WIDTH), // integer       
    .pmi_addr_width       (ADDR_ROM_BUS_WIDTH), // integer       
    .pmi_data_width       (16), // integer       
    .pmi_regmode          ("noreg"), // "reg"|"noreg"     
    .pmi_gsr              ("enable"), // "enable" | "disable"
    .pmi_resetmode        ("sync"), // "async" | "sync"	
    .pmi_init_file        ({ROM_PATH, ".mem"}), // string		
    .pmi_init_file_format ("hex"), // "binary"|"hex"    
	.pmi_family           ("iCE40UP"), // "iCE40UP" | "LIFCL"		
	.module_type          ("pmi_rom")  // string
) rom_inst (
	.Address    (a),  // I:
	.OutClock   (clk),  // I:
	.OutClockEn (1'b1),  // I:
	.Reset      (1'b1),  // I:
	.Q          (dw_int)   // O:
);
assign d = cs ? dw_int : 16'h0000;
end

endgenerate


endmodule


