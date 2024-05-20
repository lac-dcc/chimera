// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _halu_h_
`define _halu_h_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:53:29 08/08/2023 
// Design Name: 
// Module Name:    hALU 
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
module hALU(
    input [15:0] x,
    input zx,
    input nx,
    input [15:0] y,
    input zy,
    input ny,
    input f,
    input no,
    output reg [15:0] out,
    output reg zr,
    output reg ng
    );
	 
	 reg [15 : 0] temp_x, temp_y, temp_out;
	
	always @* begin
		if (zx == 1'b1) begin
			temp_x = 16'b0;
		end else begin
			temp_x = x;
		end
		
		if (nx == 1'b1) begin
			temp_x = ~temp_x;		
		end
		
		if (zy == 1'b1) begin
			temp_y = 16'b0;
		end else begin
			temp_y = y;
		end
		
		if (ny == 1'b1) begin
			temp_y = ~temp_y;
		end
		
		if (f == 1'b0) begin // x & y
			temp_out = temp_x & temp_y;
		end else begin // x + y
			temp_out = temp_x + temp_y;
		end
		
		if (no == 1'b1) begin
			temp_out = ~temp_out;
		end
		
		if (temp_out == 0) begin
			zr = 1'b1;
			ng = 1'b0;
		end else if (temp_out[15] == 1'b0) begin
			zr = 1'b0;
			ng = 1'b0;
		end else begin
			zr = 1'b0;
			ng = 1'b1;
		end
		
		out = temp_out;
	end

endmodule

`endif