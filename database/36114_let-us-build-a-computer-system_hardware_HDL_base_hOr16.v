// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_or16_
`define _h_or16_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:28:45 08/03/2023 
// Design Name: 
// Module Name:    hOr16 
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
module hOr16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] out
    );
	
	assign out = a | b;

endmodule

`endif