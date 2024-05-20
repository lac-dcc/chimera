// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _segcom_
`define _segcom_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:09:24 09/07/2023 
// Design Name: 
// Module Name:    segcom 
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
module segcom(
    input [3:0] val,
    output reg [7:0] data
    );
	
	 always @* begin
		case (val)
			4'b0000: data = 8'b11000000; // 0
			4'b0001: data = 8'b11111001; // 1
			4'b0010: data = 8'b10100100; // 2
			4'b0011: data = 8'b10110000; // 3
			4'b0100: data = 8'b10011001; // 4
			4'b0101: data = 8'b10010010; // 5
			4'b0110: data = 8'b10000010; // 6
			4'b0111: data = 8'b11111000; // 7
			4'b1000: data = 8'b10000000; // 8
			4'b1001: data = 8'b10010000; // 9
			4'b1010: data = 8'b10100000; // a
			4'b1011: data = 8'b10000011; // b
			4'b1100: data = 8'b11000110; // c
			4'b1101: data = 8'b10100001; // d
			4'b1110: data = 8'b10000110; // E
			4'b1111: data = 8'b10001110; // F
			default: data = 8'b11111111; // blank display
		endcase
	 end

endmodule

`endif
