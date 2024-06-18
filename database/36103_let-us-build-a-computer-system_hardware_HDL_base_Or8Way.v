// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _or8way_h_
`define _or8way_h_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:50:08 08/07/2023 
// Design Name: 
// Module Name:    Or8Way 
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
module Or8Way(
    input [7:0] in,
    output reg out
    );

	always @* begin
		if (in == 8'b0) begin
			out = 1'b0;
		end else begin
			out = 1'b1;
		end
	end

endmodule

`endif