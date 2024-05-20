// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_nand_
`define _h_nand_
`timescale 1ns / 1ps

module hNand(
    input wire a,
    input wire b,
    output wire out
    );

	assign out = ~(a&b);
endmodule

`endif