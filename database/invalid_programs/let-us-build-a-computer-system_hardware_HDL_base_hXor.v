// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_xor_
`define _h_xor_

`timescale 1ns / 1ps
`include "hNot.v"
`include "hAnd.v"
`include "hOr.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:50:07 08/01/2023 
// Design Name: 
// Module Name:    hXor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hXOr(
    input a,
    input b,
    output out
    );

	wire a_inv;
	wire b_inv;
	wire and_out1;
	wire and_out2;
	
	hNot h_not_a(.in(a), .out(a_inv));
	hNot h_not_b(.in(b), .out(b_inv));
	
	hAnd h_and1(.a(a), .b(b_inv), .out(and_out1));
	hAnd h_and2(.a(a_inv), .b(b), .out(and_out2));
	
	hOr h_or(.a(and_out1), .b(and_out2), .out(out));

endmodule

`endif