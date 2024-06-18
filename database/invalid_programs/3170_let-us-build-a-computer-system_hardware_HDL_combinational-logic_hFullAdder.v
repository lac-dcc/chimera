// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _hfulladder_h_
`define _hfulladder_h_

`timescale 1ns / 1ps
`include "hHalfAdder.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:12:05 08/07/2023 
// Design Name: 
// Module Name:    FullAdder 
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
module hFullAdder(
    input a,
    input b,
    input carry_in,
    output carry_out,
    output out
    );
	
	wire sum0, carry0, carry1;
	
	hHalfAdder half_adder0(.a(a), .b(b), .carry(carry0), .out(sum0));
	hHalfAdder half_adder1(.a(sum0), .b(carry_in), .carry(carry1), .out(out));
	
	assign carry_out = carry0 | carry1;

endmodule

`endif