// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_mux16_
`define _h_mux16_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:11:11 08/03/2023 
// Design Name: 
// Module Name:    hMux16 
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
module hMux16(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] out
    );
	
	assign out = sel ? b : a;

endmodule

`endif