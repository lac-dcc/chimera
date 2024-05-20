// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_and16_
`define _h_and16_

`include "hAnd.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:59:37 08/03/2023 
// Design Name: 
// Module Name:    hAnd16 
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
module hAnd16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] out
    );
	
	hAnd h_and0(.a(a[0]), .b(b[0]), .out(out[0]));
	hAnd h_and1(.a(a[1]), .b(b[1]), .out(out[1]));
	hAnd h_and2(.a(a[2]), .b(b[2]), .out(out[2]));
	hAnd h_and3(.a(a[3]), .b(b[3]), .out(out[3]));
	
	hAnd h_and4(.a(a[4]), .b(b[4]), .out(out[4]));
	hAnd h_and5(.a(a[5]), .b(b[5]), .out(out[5]));
	hAnd h_and6(.a(a[6]), .b(b[6]), .out(out[6]));
	hAnd h_and7(.a(a[7]), .b(b[7]), .out(out[7]));

	hAnd h_and8(.a(a[8]), .b(b[8]), .out(out[8]));
	hAnd h_and9(.a(a[9]), .b(b[9]), .out(out[9]));
	hAnd h_and10(.a(a[10]), .b(b[10]), .out(out[10]));
	hAnd h_and11(.a(a[11]), .b(b[11]), .out(out[11]));
	
	hAnd h_and12(.a(a[12]), .b(b[12]), .out(out[12]));
	hAnd h_and13(.a(a[13]), .b(b[13]), .out(out[13]));
	hAnd h_and14(.a(a[14]), .b(b[14]), .out(out[14]));
	hAnd h_and15(.a(a[15]), .b(b[15]), .out(out[15]));
endmodule

`endif