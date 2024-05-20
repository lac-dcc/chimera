// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_or_
`define _h_or_
`timescale 1ns / 1ps

`include "hNot.v"
`include "hNand.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:58:00 08/01/2023 
// Design Name: 
// Module Name:    hOr 
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
module hOr(
    input a,
    input b,
    output out
    );
	
	wire a_out;
	wire b_out;

	hNot h_not_a(.in(a), .out(a_out));
	hNot h_not_b(.in(b), .out(b_out));
	hNand h_nand(.a(a_out), .b(b_out), .out(out));
	
endmodule

`endif