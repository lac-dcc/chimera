// This program was cloned from: https://github.com/mcjtag/tcam
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 21.07.2020 12:36:33
// Design Name: 
// Module Name: tcam
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

module tcam #(
	parameter ADDR_WIDTH = 4,
	parameter KEY_WIDTH = 4,
	parameter DATA_WIDTH = 4,
	parameter MASK_DISABLE = 0,
	parameter RAM_STYLE_DATA = "block"
)
(
	input wire clk,
	input wire rst,
	/* Set */
	input wire [ADDR_WIDTH-1:0]set_addr,
	input wire [DATA_WIDTH-1:0]set_data,
	input wire [KEY_WIDTH-1:0]set_key,
	input wire [KEY_WIDTH-1:0]set_xmask,
	input wire set_clr,
	input wire set_valid,
	/* Request */
	input wire [KEY_WIDTH-1:0]req_key,
	input wire req_valid,
	output wire req_ready,
	/* Response */
	output wire [ADDR_WIDTH-1:0]res_addr,
	output wire [DATA_WIDTH-1:0]res_data,
	output wire res_valid,
	output wire res_null
);

reg line_valid;
wire [2**ADDR_WIDTH-1:0]line_match;
wire [ADDR_WIDTH-1:0]enc_addr;
wire enc_valid;
wire enc_null;

reg [ADDR_WIDTH-1:0]res_addr_out;
reg res_valid_out;
reg res_null_out;

genvar g;

assign req_ready = (rst == 1'b1) ? 1'b0 : ~(line_valid | enc_valid | res_valid_out);
assign res_addr = res_addr_out;
assign res_valid = res_valid_out;
assign res_null = res_null_out;

always @(posedge clk) begin
	if (rst == 1'b1) begin
		line_valid <= 1'b0;
		res_addr_out <= 0;
		res_valid_out <= 1'b0;
		res_null_out <= 1'b0;
	end else begin
		line_valid <= req_valid;
		res_addr_out <= enc_addr;
		res_valid_out <= enc_valid;
		res_null_out <= enc_null;
	end
end

tcam_line_array #(
	.ADDR_WIDTH(ADDR_WIDTH),
	.KEY_WIDTH(KEY_WIDTH),
	.MASK_DISABLE(MASK_DISABLE)
) tcam_line_array_inst (
	.clk(clk),
	.rst(rst),
	.set_addr(set_addr),
	.set_key(set_key),
	.set_xmask(set_xmask),
	.set_clr(set_clr),
	.set_valid(set_valid),
	.req_key(req_key),
	.req_valid(req_valid & req_ready),
	.line_match(line_match)
);

tcam_line_encoder #(
	.ADDR_WIDTH(ADDR_WIDTH)
) tcam_line_encoder_inst (
	.clk(clk),
	.rst(rst),
	.line_match(line_match),
	.line_valid(line_valid),
	.addr(enc_addr),
	.addr_valid(enc_valid),
	.addr_null(enc_null)
);

tcam_sdpram #(
	.ADDR_WIDTH(ADDR_WIDTH),
	.DATA_WIDTH(DATA_WIDTH),
	.RAM_STYLE(RAM_STYLE_DATA)
) tcam_sdpram_inst (
	.clk(clk),
	.rst(rst),
	.dina(set_data),
	.addra(set_addr),
	.addrb(enc_addr),
	.wea(set_valid),
	.doutb(res_data)
);

endmodule
