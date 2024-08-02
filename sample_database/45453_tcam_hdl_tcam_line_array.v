// This program was cloned from: https://github.com/mcjtag/tcam
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 21.07.2020 13:40:57
// Design Name: 
// Module Name: tcam_line_array
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

module tcam_line_array #(
	parameter ADDR_WIDTH = 8,
	parameter KEY_WIDTH = 8,
	parameter MASK_DISABLE = 0
)
(
	input wire clk,
	input wire rst,
	input wire [ADDR_WIDTH-1:0]set_addr,
	input wire [KEY_WIDTH-1:0]set_key,
	input wire [KEY_WIDTH-1:0]set_xmask,
	input wire set_clr,
	input wire set_valid,
	input wire [KEY_WIDTH-1:0]req_key,
	input wire req_valid,
	output wire [2**ADDR_WIDTH-1:0]line_match
);

localparam MEM_WIDTH = (MASK_DISABLE) ? KEY_WIDTH : KEY_WIDTH*2;

reg [MEM_WIDTH-1:0]mem[2**ADDR_WIDTH-1:0];
reg [2**ADDR_WIDTH-1:0]active;
reg [2**ADDR_WIDTH-1:0]match;
wire [KEY_WIDTH-1:0]key[2**ADDR_WIDTH-1:0];
wire [KEY_WIDTH-1:0]xmask[2**ADDR_WIDTH-1:0];

integer i;
genvar g;

generate for (g = 0; g < 2**ADDR_WIDTH; g = g + 1) begin
	wire [MEM_WIDTH-1:0]mem_tmp;
	assign mem_tmp = mem[g];
	if (MASK_DISABLE) begin
		assign key[g] = mem_tmp;
		assign xmask[g] = {KEY_WIDTH{1'b0}};
	end else begin
		assign key[g] = mem_tmp[KEY_WIDTH-1-:KEY_WIDTH];
		assign xmask[g] = mem_tmp[KEY_WIDTH*2-1-:KEY_WIDTH];
	end
end endgenerate

assign line_match = match;

/* Initial */
initial begin
	for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
		mem[i] = 0;
	end
end

/* Set */
always @(posedge clk) begin
	if (rst == 1'b1) begin
		active = {KEY_WIDTH{1'b0}};
	end else begin
		if (set_valid == 1'b1) begin
			for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
				if (set_addr == i) begin
					if (MASK_DISABLE) begin
						mem[i] <= set_key;
					end else begin
						mem[i] <= {set_xmask, set_key};
					end
					active[i] <= ~set_clr;
				end
			end
		end
	end
end

/* Request */
always @(posedge clk) begin
	if (rst == 1'b1) begin
		match <= {2**ADDR_WIDTH{1'b0}};
	end else begin
		if (req_valid == 1'b1) begin
			for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
				if (MASK_DISABLE) begin
					match[i] <= ((key[i] ^ req_key) == 0) & active[i];
				end else begin
					match[i] <= ((key[i] ^ req_key & ~xmask[i]) == 0) & active[i];
				end
			end
		end
	end
end

endmodule
