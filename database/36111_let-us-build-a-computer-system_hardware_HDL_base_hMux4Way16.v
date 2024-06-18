// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_mux4way16_
`define _h_mux4way16_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:27:09 08/03/2023 
// Design Name: 
// Module Name:    hMux4Way16 
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
module hMux4Way16(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [1:0] sel,
    output [15:0] out
    );
	
	reg [15:0] mux_out;

	always @* begin
		case(sel) 
			2'b00: mux_out = a;
			2'b01: mux_out = b;
			2'b10: mux_out = c;
			default: mux_out = d;
		endcase
	end
	
	assign out = mux_out;

endmodule

`endif