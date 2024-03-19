`timescale 1ns / 1ps
//
// Plaid Bib CPLD Version - Test bench YM3812 module
// Copyright (c) 2020 Eric Schlaepfer
// This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
// International License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.
//

// This module is not as exciting as you may have thought. It simulates reads
// and writes for the main test bench and implementes no sound synthesis.
module ym3812tst(
    inout [7:0] yd,
    input ym_cs_l,
    input ym_a0,
    input ym_wr_l,
    input ym_rd_l
    );

wire [7:0] int_regs;

assign int_regs = (ym_a0) ? 8'b10101010 : 8'b01010101; 
assign yd = (!ym_rd_l && !ym_cs_l) ? int_regs : 8'bZ;

endmodule
