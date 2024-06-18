// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_mux8way16_
`define _h_mux8way16_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:14:32 08/04/2023 
// Design Name: 
// Module Name:    hMux8Way16 
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
module hMux8Way16(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [15:0] e,
    input [15:0] f,
    input [15:0] g,
    input [15:0] h,
    input [2:0] sel,
    output [15:0] out
    );

	reg [15:0] mux_out;
	
	always @* begin
		case (sel)
			3'b000: mux_out = a;
			3'b001: mux_out = b;
			3'b010: mux_out = c;
			3'b011: mux_out = d;
			3'b100: mux_out = e;
			3'b101: mux_out = f;
			3'b110: mux_out = g;
			default: mux_out = h;
		endcase
	end

	assign out = mux_out;
	
endmodule

`endif