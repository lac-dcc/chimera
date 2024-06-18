// This program was cloned from: https://github.com/mcjtag/tcam
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 21.07.2020 11:56:59
// Design Name: 
// Module Name: tcam_line_encoder
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

module tcam_line_encoder #(
	parameter ADDR_WIDTH = 8
)
(
	input wire clk,
	input wire rst,
	input wire [2**ADDR_WIDTH-1:0]line_match,
	input wire line_valid,
	output wire [ADDR_WIDTH-1:0]addr,
	output wire addr_valid,
	output wire addr_null
);

reg encode;
reg [2**ADDR_WIDTH-1:0]line;
reg [ADDR_WIDTH-1:0]addr_out;
reg valid_out;
reg null_out;
integer i;

assign addr = addr_out;
assign addr_valid = valid_out;
assign addr_null = null_out;

always @(posedge clk) begin
	if (rst == 1'b1) begin
		encode <= 1'b0;
	end else begin
		if (encode == 1'b0) begin
			if (line_valid) begin
				line <= line_match;
				encode <= 1'b1;
			end
		end else begin
			if (line == 0) begin
				encode <= 1'b0;
			end else begin
				if ((line & ~(2**addr_out))) begin
					line[addr_out] <= 1'b0;
				end else begin
					encode <= 1'b0;
				end
			end
		end
	end
end

always @(*) begin
	addr_out = 0;
	valid_out = 1'b0;
	null_out = 1'b0;
	
	if (encode == 1'b1) begin
		if (line == 0) begin
			valid_out = 1'b1;
			null_out = 1'b1;
		end else begin
			for (i = 2**ADDR_WIDTH - 1; i >= 0; i = i - 1) begin
				if (line[i] == 1'b1) begin
					addr_out = i;
					valid_out = 1'b1;
				end
			end
		end
	end
end

endmodule
