// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _hadder16_h_
`define _hadder16_h_

`include "hFullAdder.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:54 08/08/2023 
// Design Name: 
// Module Name:    Adder16 
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
module hAdder16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] out,
	 output cout
    );
	
	wire [15:0] c;
	genvar i;
	
	hFullAdder fa0(.a(a[0]), .b(b[0]), .carry_in(1'b0), .carry_out(c[0]), .out(out[0]));
	
	generate
		for (i = 1; i < 16; i = i + 1) begin: adder_loop
			hFullAdder fa(.a(a[i]), .b(b[i]), .carry_in(c[i - 1]), .carry_out(c[i]), .out(out[i]));
		end
	endgenerate
	
	assign cout = c[15];

endmodule

`endif