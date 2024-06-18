// This program was cloned from: https://github.com/mcjtag/eth_switch
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 14.08.2020 20:20:45
// Design Name: 
// Module Name: mactable_dpcam
// Project Name: eth_switch
// Target Devices: 
// Tool Versions: 
// Description: Dual Port CAM MAC-address table
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

module mactable_dpcam #(
	parameter ADDR_WIDTH = 4,
	parameter KEY_WIDTH = 4,
	parameter DATA_WIDTH = 4,
	parameter RAM_STYLE_DATA = "block",
	parameter CONFIG_WIDTH = ADDR_WIDTH+DATA_WIDTH+KEY_WIDTH,
	parameter REQUEST_WIDTH = KEY_WIDTH*2,
	parameter RESPONSE_WIDTH = (ADDR_WIDTH+DATA_WIDTH)*2
)
(
	input wire aclk,
	input wire aresetn,
	input wire [CONFIG_WIDTH-1:0]s_axis_config_tdata,
	input wire s_axis_config_tuser,
	input wire s_axis_config_tvalid,
	/* Request */
	input wire [REQUEST_WIDTH-1:0]s_axis_request_tdata,
	input wire s_axis_request_tvalid,
	output wire s_axis_request_tready,
	/* Response */
	output wire [RESPONSE_WIDTH-1:0]m_axis_response_tdata,
	output wire [1:0]m_axis_response_tuser,
	output wire m_axis_response_tvalid	
);

wire [ADDR_WIDTH-1:0]set_addr; 
wire [DATA_WIDTH-1:0]set_data;
wire [KEY_WIDTH-1:0]set_key;
wire set_clr;
wire set_valid;

wire [KEY_WIDTH-1:0]req_key[1:0];
wire req_valid;
wire req_ready;

reg [ADDR_WIDTH-1:0]res_addr[1:0];
wire [DATA_WIDTH-1:0]res_data[1:0];
reg res_valid;
reg res_null[1:0];

reg line_valid;
wire [2**ADDR_WIDTH-1:0]line_match[1:0];
wire [ADDR_WIDTH-1:0]enc_addr[1:0];
wire enc_valid;
wire enc_null[1:0];

assign {set_key,set_data,set_addr} = s_axis_config_tdata; 
assign set_clr = s_axis_config_tuser;
assign set_valid = s_axis_config_tvalid;

assign {req_key[1],req_key[0]} = s_axis_request_tdata;
assign req_valid = s_axis_request_tvalid & s_axis_request_tready;
assign s_axis_request_tready = req_ready;

assign m_axis_response_tdata = {{res_data[1],res_addr[1]},{res_data[0],res_addr[0]}};
assign m_axis_response_tuser = {res_null[1],res_null[0]};
assign m_axis_response_tvalid = res_valid;

assign req_ready = (aresetn == 1'b0) ? 1'b0 : ~(line_valid | enc_valid | res_valid);

always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		line_valid <= 1'b0;
		res_addr[0] <= 0;
		res_addr[1] <= 0;
		res_valid <= 1'b0;
		res_null[0] <= 1'b0;
		res_null[1] <= 1'b0;
	end else begin
		line_valid <= req_valid;
		res_addr[0] <= enc_addr[0];
		res_addr[1] <= enc_addr[1];
		res_valid <= enc_valid;
		res_null[0] <= enc_null[0];
		res_null[1] <= enc_null[1];
	end
end

mactable_dpcam_line_array #(
	.ADDR_WIDTH(ADDR_WIDTH),
	.KEY_WIDTH(KEY_WIDTH)
) mactable_dpcam_line_array_inst (
	.clk(aclk),
	.rst(~aresetn),
	.set_addr(set_addr),
	.set_key(set_key),
	.set_clr(set_clr),
	.set_valid(set_valid),
	.req_key0(req_key[0]),
	.req_key1(req_key[1]),
	.req_valid(req_valid & req_ready),
	.line_match0(line_match[0]),
	.line_match1(line_match[1])
);

mactable_dpcam_line_encoder #(
	.ADDR_WIDTH(ADDR_WIDTH)
) mactable_dpcam_line_encoder0_inst (
	.clk(aclk),
	.rst(~aresetn),
	.line_match(line_match[0]),
	.line_valid(line_valid),
	.addr(enc_addr[0]),
	.addr_valid(enc_valid),
	.addr_null(enc_null[0])
);

mactable_dpcam_line_encoder #(
	.ADDR_WIDTH(ADDR_WIDTH)
) mactable_dpcam_line_encoder1_inst (
	.clk(aclk),
	.rst(~aresetn),
	.line_match(line_match[1]),
	.line_valid(line_valid),
	.addr(enc_addr[1]),
	.addr_valid(),
	.addr_null(enc_null[1])
);

mactable_dpcam_dpram #(
	.ADDR_WIDTH(ADDR_WIDTH),
	.DATA_WIDTH(DATA_WIDTH),
	.RAM_STYLE(RAM_STYLE_DATA)
) mactable_dpcam_dpram_inst (
	.clk(aclk),
	.dina(set_data),
	.addra(set_valid ? set_addr : enc_addr[0]),
	.addrb(enc_addr[1]),
	.wea(set_valid),
	.douta(res_data[0]),
	.doutb(res_data[1])
);

endmodule


//////////////////////////////////////////////////////////////////////////////////
// Module Name: mactable_dpcam_line_array
// Project Name: eth_switch
// Description: Dual Port CAM Index Memory Array
//////////////////////////////////////////////////////////////////////////////////

(* DONT_TOUCH = "TRUE" *)
module mactable_dpcam_line_array #(
	parameter ADDR_WIDTH = 8,
	parameter KEY_WIDTH = 8
)
(
	input wire clk,
	input wire rst,
	input wire [ADDR_WIDTH-1:0]set_addr,
	input wire [KEY_WIDTH-1:0]set_key,
	input wire set_clr,
	input wire set_valid,
	input wire [KEY_WIDTH-1:0]req_key0,
	input wire [KEY_WIDTH-1:0]req_key1,
	input wire req_valid,
	output wire [2**ADDR_WIDTH-1:0]line_match0,
	output wire [2**ADDR_WIDTH-1:0]line_match1
);

localparam MEM_WIDTH = KEY_WIDTH;

reg [MEM_WIDTH-1:0]mem[2**ADDR_WIDTH-1:0];
reg [2**ADDR_WIDTH-1:0]active;

reg [2**ADDR_WIDTH-1:0]match[1:0];
wire [KEY_WIDTH-1:0]key[2**ADDR_WIDTH-1:0];

integer i;
genvar g;

generate for (g = 0; g < 2**ADDR_WIDTH; g = g + 1) begin
	wire [MEM_WIDTH-1:0]mem_tmp;
	assign mem_tmp = mem[g];
	assign key[g] = mem_tmp;
end endgenerate

assign line_match0 = match[0];
assign line_match1 = match[1];

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
					mem[i] <= set_key;
					active[i] <= ~set_clr;
				end
			end
		end
	end
end

/* Request */
always @(posedge clk) begin
	if (rst == 1'b1) begin
		match[0] <= {2**ADDR_WIDTH{1'b0}};
		match[1] <= {2**ADDR_WIDTH{1'b0}};
	end else begin
		if (req_valid == 1'b1) begin
			for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
				match[0][i] <= ((key[i] ^ req_key0) == 0) & active[i];
				match[1][i] <= ((key[i] ^ req_key1) == 0) & active[i];
			end
		end
	end
end

endmodule


//////////////////////////////////////////////////////////////////////////////////
// Module Name: mactable_dpcam_line_encoder
// Project Name: eth_switch
// Description: Dual Port CAM Matched Line Encoder
//////////////////////////////////////////////////////////////////////////////////

module mactable_dpcam_line_encoder #(
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


//////////////////////////////////////////////////////////////////////////////////
// Module Name: mactable_dpcam_dpram
// Project Name: eth_switch
// Description: Dual Port CAM Data Memory
//////////////////////////////////////////////////////////////////////////////////

module mactable_dpcam_dpram #(
	parameter ADDR_WIDTH = 8,
	parameter DATA_WIDTH = 8,
	parameter RAM_STYLE = "block"
)
(
	input wire clk,
	input wire [DATA_WIDTH-1:0]dina,
	input wire [ADDR_WIDTH-1:0]addra,
	input wire [ADDR_WIDTH-1:0]addrb,
	input wire wea,
	output wire [DATA_WIDTH-1:0]douta,
	output wire [DATA_WIDTH-1:0]doutb
);

(* ram_style = RAM_STYLE *) reg [DATA_WIDTH-1:0]ram[2**ADDR_WIDTH-1:0];
reg [ADDR_WIDTH-1:0]rdouta; 
reg [ADDR_WIDTH-1:0]rdoutb;
integer i;

assign douta = rdouta;
assign doutb = rdoutb;

initial begin
	for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
		ram[i] = 0;
	end
end

always @(posedge clk) begin
	if (wea) begin
		ram[addra] <= dina;
	end
	rdouta <= ram[addra];
	rdoutb <= ram[addrb];
end

endmodule
