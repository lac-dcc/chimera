// This program was cloned from: https://github.com/mcjtag/tcam
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 21.07.2020 13:40:23
// Design Name: 
// Module Name: tcam_sdpram
// Project Name: tcam
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// License: MIT
//  Copyright (c) 2020 Dmitry Matyunin
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//////////////////////////////////////////////////////////////////////////////////

module tcam_sdpram #(
	parameter ADDR_WIDTH = 8,
	parameter DATA_WIDTH = 8,
	parameter RAM_STYLE = "block"
)
(
	input wire clk,
	input wire rst,
	input wire [DATA_WIDTH-1:0]dina,
	input wire [ADDR_WIDTH-1:0]addra,
	input wire [ADDR_WIDTH-1:0]addrb,
	input wire wea,
	output wire [DATA_WIDTH-1:0]doutb
);

(* ram_style = RAM_STYLE *)
reg [DATA_WIDTH-1:0]ram[2**ADDR_WIDTH-1:0];
reg [ADDR_WIDTH-1:0]readb;
integer i;

assign doutb = readb;

initial begin
	for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
		ram[i] = 0;
	end
end

always @(posedge clk) begin
	if (wea) begin
		ram[addra] <= dina;
	end
	readb <= ram[addrb];
end

endmodule
