// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_not16_
`define _h_not16_

`timescale 1ns / 1ps
`include "hNot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:11:07 08/02/2023 
// Design Name: 
// Module Name:    hNot16 
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
module hNot16(
    input [15:0] in,
    output [15:0] out
    );

	hNot not0(.in(in[0]), .out(out[0]));
	hNot not1(.in(in[1]), .out(out[1]));
	hNot not2(.in(in[2]), .out(out[2]));
	hNot not3(.in(in[3]), .out(out[3]));

	hNot not4(.in(in[4]), .out(out[4]));
	hNot not5(.in(in[5]), .out(out[5]));
	hNot not6(.in(in[6]), .out(out[6]));
	hNot not7(.in(in[7]), .out(out[7]));

	hNot not8(.in(in[8]), .out(out[8]));
	hNot not9(.in(in[9]), .out(out[9]));
	hNot not10(.in(in[10]), .out(out[10]));
	hNot not11(.in(in[11]), .out(out[11]));

	hNot not12(.in(in[12]), .out(out[12]));
	hNot not13(.in(in[13]), .out(out[13]));
	hNot not14(.in(in[14]), .out(out[14]));
	hNot not15(.in(in[15]), .out(out[15]));

endmodule

`endif