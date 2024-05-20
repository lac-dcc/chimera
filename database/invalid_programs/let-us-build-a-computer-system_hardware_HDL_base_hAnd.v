// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_and_
`define _h_and_
`timescale 1ns / 1ps

`include "hNand.v"
`include "hNot.v"

module hAnd(
    input wire a,
    input wire b,
    output wire out
    );

    wire nand_out;

    hNand h_nand(.a(a), .b(b), .out(nand_out));
	hNot h_not(.in(nand_out), .out(out));	

endmodule

`endif