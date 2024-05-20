// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_dmux4way_
`define _h_dmux4way_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:55:18 08/04/2023 
// Design Name: 
// Module Name:    hDMux4Way 
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
module hDMux4Way(
    input wire in,
    input wire [1:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d
    );
	
	assign a = (sel == 2'b00)? in : 1'b0;
	assign b = (sel == 2'b01)? in : 1'b0;
	assign c = (sel == 2'b10)? in : 1'b0;
	assign d = (sel == 2'b11)? in : 1'b0;

endmodule

`endif