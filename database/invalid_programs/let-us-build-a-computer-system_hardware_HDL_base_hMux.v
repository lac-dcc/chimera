// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_mux_
`define _h_mux_

`timescale 1ns / 1ps
`include "hNot.v"
`include "hAnd.v"
`include "hOr.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:25:14 08/02/2023 
// Design Name: 
// Module Name:    hMux 
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
module hMux(
    input a,
    input b,
    input sel,
    output out
    );
	
	wire sel_inv;
	wire a_v;
	wire b_v;
	
	hNot h_not_sel(.in(sel), .out(sel_inv));
	
	hAnd h_and_a(.a(a), .b(sel_inv), .out(a_v));
	hAnd h_and_b(.a(b), .b(sel), .out(b_v));
	
	hOr h_or_out(.a(a_v), .b(b_v), .out(out));

endmodule

`endif
