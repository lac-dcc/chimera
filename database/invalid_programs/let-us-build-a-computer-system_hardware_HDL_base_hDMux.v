// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_dmux_
`define _h_dmux_

`timescale 1ns / 1ps
`include "hNot.v"
`include "hAnd.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:46:16 08/02/2023 
// Design Name: 
// Module Name:    hDMux 
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
module hDMux(
    input in,
    input sel,
    output a,
    output b
    );
	
	wire sel_inv;
	
	hNot h_not_sel(.in(sel), .out(sel_inv));
	
	hAnd h_and_a(.a(in), .b(sel_inv), .out(a));
	hAnd h_and_b(.a(in), .b(sel), .out(b));

endmodule

`endif