// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IPs is the RAM memory for the Atmel MEGA CPU implementation.
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
 
 module mega_ram  #(
	parameter PLATFORM = "XILINX",
	parameter MEM_MODE = "BLOCK",
	parameter ADDR_BUS_WIDTH = 13,  /* < in address lines */
	parameter ADDR_RAM_DEPTH = 2 ** ADDR_BUS_WIDTH,  /* < in address lines */
	parameter DATA_BUS_WIDTH = 8,
	parameter RAM_PATH = ""
) (
	input clk,
	input cs,
	input we,
	input re,
	input [ADDR_BUS_WIDTH-1:0] a,
	input [DATA_BUS_WIDTH - 1:0] d_in,
	output [DATA_BUS_WIDTH - 1:0] d_out
);

generate

if(PLATFORM == "XILINX")
begin
	
(* ram_style="block" *)
reg [DATA_BUS_WIDTH - 1:0] mem [ADDR_RAM_DEPTH-1:0];
    
initial begin
if (RAM_PATH != "")
	$readmemh({RAM_PATH, ".mem"}, mem);
end

always@(posedge clk) begin
	if(cs & we)
		mem[a] <= d_in;
end

reg [DATA_BUS_WIDTH - 1:0]d_out_tmp;

always@(posedge clk) begin
	d_out_tmp <= mem[a];
end
assign d_out = (cs & re) ? d_out_tmp : 8'b00;

end
else if(PLATFORM == "iCE40UP")
begin

wire [15:0]d_out_w;
wire [DATA_BUS_WIDTH - 1:0]d_out_w_b;
reg [DATA_BUS_WIDTH - 1:0]d_out_tmp;
reg [ADDR_BUS_WIDTH-1:0] addr;
if(MEM_MODE == "BLOCK")
begin
(* ram_style="block" *)
reg [DATA_BUS_WIDTH - 1:0] mem [ADDR_RAM_DEPTH-1:0];
    
initial begin
if (RAM_PATH != "")
	$readmemh(RAM_PATH, mem);
end

always@(posedge clk) begin
	if(cs & we)
		mem[a] <= d_in;
end
always@(posedge clk) begin
	d_out_tmp <= mem[a];
end
end/* MEM_MODE != "BLOCK" */
else
begin/* MEM_MODE == "SRAM" */

always @ (*)
begin
	addr = a;
end

reg delayed_a0;

always @ (posedge clk) delayed_a0 = addr[0];
wire [13:0]ram_addr = DATA_BUS_WIDTH == 8 ? addr[ADDR_BUS_WIDTH-1 : 1] : addr;
SP256K  ramfn_inst1(
	.DI(DATA_BUS_WIDTH == 8 ? {d_in[7:0], d_in[7:0]} : d_in),
	.AD(ram_addr),
	.MASKWE(DATA_BUS_WIDTH == 8 ? (addr[0] ? 4'b1100 : 4'b0011) : 4'b1111),
	.WE(we),
	.CS(1'b1),
	.CK(clk),
	.STDBY(1'b0),
	.SLEEP(1'b0),
	.PWROFF_N(1'b1),
	.DO(d_out_w)
);

assign d_out_w_b = DATA_BUS_WIDTH == 8 ? (delayed_a0 ? d_out_w[15:8] : d_out_w[7:0]) : d_out_w;

always @ (*)
begin
	d_out_tmp = d_out_w_b;
end

end/* MEM_MODE != "SRAM" */
assign d_out = (cs & re) ? d_out_tmp : 'b00;
end/* PLATFORM != "iCE40UP" */

endgenerate
endmodule
