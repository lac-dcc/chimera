`timescale 1ns / 1ps
//
// Plaid Bib CPLD Version - Test bench SAA1099 module
// Copyright (c) 2020 Eric Schlaepfer
// This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
// International License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.
//

// This module is not as exciting as you may have thought. It simulates reads
// and writes for the main test bench and implementes no sound synthesis.
module saa1099tst(
    input [7:0] sd,
    input s_cs_l,
    input s_a0,
    input s_wr_l,
    output dtack_l
    );

reg [7:0] int_regs;
reg int_dtack;
wire sel;

assign sel = ~s_cs_l & ~s_wr_l;

assign dtack_l = ~int_dtack;

always @ (posedge sel) begin
    int_regs <= sd;
    int_dtack = 1;
    #360
    int_dtack = 0;
    #400
    int_dtack = 0;
end

initial begin
    int_dtack = 0;
end

endmodule
