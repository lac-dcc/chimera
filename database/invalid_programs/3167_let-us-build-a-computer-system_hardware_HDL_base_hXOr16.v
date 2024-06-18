// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_xor16_
`define _h_xor16_

`include "hXOr.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:43:25 08/03/2023 
// Design Name: 
// Module Name:    hXOr16 
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
module hXOr16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] out
    );
	
	genvar i;
	generate
		for(i = 0; i < 16; i = i + 1) begin : hXOr16_loop
			hXOr xor_inst(.a(a[i]), .b(b[i]), .out(out[i]));
		end
	endgenerate

endmodule

`endif