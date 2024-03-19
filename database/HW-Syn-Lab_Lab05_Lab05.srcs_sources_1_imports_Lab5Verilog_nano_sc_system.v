`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : nano_sc_system.v
// Title        : nanoCPU Single Cycle system.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module nano_sc_system(
    output wire [6:0]seg,
    output [3:0] an,
    output dp,
    input clk,
    input [11:0] sw
);

wire 	[31:0]	p_address;
wire 	[31:0]	p_data;
wire	[31:0]	d_address;
wire	[31:0]	d_data;
wire mem_wr;
reg nreset = 1;

nanocpu	CPU(p_address, p_data, d_address, d_data, mem_wr, clk, nreset);
rom 	PROGMEM(p_data, p_address[17:2]);
memory 	DATAMEM(d_data, d_address[15:0], mem_wr, clk, sw, seg, an, dp);

endmodule
