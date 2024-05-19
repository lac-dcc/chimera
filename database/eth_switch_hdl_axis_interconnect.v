// This program was cloned from: https://github.com/mcjtag/eth_switch
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 31.07.2020 17:04:38
// Design Name: 
// Module Name: axis_interconnect
// Project Name: axis_interconnect
// Target Devices: 
// Tool Versions: 
// Description: Parameterizable AXI4-Stream Interconnect with Round-Robin Arbitration (on TLAST)
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

module axis_interconnect #(
	parameter CHANNELS_IN = 4,
	parameter CHANNELS_OUT = 1,
	parameter DATA_WIDTH = 8,
	parameter USER_WIDTH = 2
)
(
	input wire aclk,
	input wire aresetn,
	input wire [CHANNELS_IN*DATA_WIDTH-1:0]s_axis_tdata,
	input wire [CHANNELS_IN*$clog2(CHANNELS_OUT)-1:0]s_axis_tdest,
	input wire [CHANNELS_IN*USER_WIDTH-1:0]s_axis_tuser,
	input wire [CHANNELS_IN-1:0]s_axis_tvalid,
	output wire [CHANNELS_IN-1:0]s_axis_tready,
	input wire [CHANNELS_IN-1:0]s_axis_tlast,
	output wire [CHANNELS_OUT*DATA_WIDTH-1:0]m_axis_tdata,
	output wire [CHANNELS_OUT*USER_WIDTH-1:0]m_axis_tuser,
	output wire [CHANNELS_OUT-1:0]m_axis_tvalid,
	input wire [CHANNELS_OUT-1:0]m_axis_tready,
	output wire [CHANNELS_OUT-1:0]m_axis_tlast	
);

genvar g, h;

generate 
	wire [CHANNELS_IN*CHANNELS_OUT-1:0]arb_tready;
	wire [CHANNELS_IN*CHANNELS_OUT-1:0]axis_tready;

	for (g = 0; g < CHANNELS_OUT; g = g + 1) begin : ARBITER
		for (h = 0; h < CHANNELS_IN; h = h + 1) begin
			assign axis_tready[CHANNELS_OUT*h+g+:1] = arb_tready[CHANNELS_IN*g+h+:1];
		end
	
		axis_arbiter #(
			.CHAN_NUM(CHANNELS_IN),
			.DATA_WIDTH(DATA_WIDTH),
			.DEST_INDEX(g),
			.DEST_WIDTH($clog2(CHANNELS_OUT)),
			.USER_WIDTH(USER_WIDTH)
		) axis_arbiter_inst (
			.aclk(aclk),
			.aresetn(aresetn),
			.s_axis_tdata(s_axis_tdata),
			.s_axis_tuser(s_axis_tuser),
			.s_axis_tdest(s_axis_tdest),
			.s_axis_tvalid(s_axis_tvalid),
			.s_axis_tready(arb_tready[CHANNELS_IN*(g+1)-1-:CHANNELS_IN]),
			.s_axis_tlast(s_axis_tlast),
			.m_axis_tdata(m_axis_tdata[DATA_WIDTH*(g+1)-1-:DATA_WIDTH]),
			.m_axis_tuser(m_axis_tuser[USER_WIDTH*(g+1)-1-:USER_WIDTH]),
			.m_axis_tvalid(m_axis_tvalid[g]),
			.m_axis_tready(m_axis_tready[g]),
			.m_axis_tlast(m_axis_tlast[g])
		);
	end 
	for (h = 0; h < CHANNELS_IN; h = h + 1) begin
		assign s_axis_tready[h] = (axis_tready[CHANNELS_OUT*(h+1)-1-:CHANNELS_OUT] != 0);
	end 
endgenerate

endmodule

module axis_arbiter #(
	parameter CHAN_NUM = 4,
	parameter DATA_WIDTH = 8,
	parameter DEST_INDEX = 0,
	parameter DEST_WIDTH = 4,
	parameter USER_WIDTH = 2
)
(
	input wire aclk,
	input wire aresetn,
	input wire [DATA_WIDTH*CHAN_NUM-1:0]s_axis_tdata,
	input wire [USER_WIDTH*CHAN_NUM-1:0]s_axis_tuser,
	input wire [CHAN_NUM*DEST_WIDTH-1:0]s_axis_tdest,
	input wire [CHAN_NUM-1:0]s_axis_tvalid,
	output wire [CHAN_NUM-1:0]s_axis_tready,
	input wire [CHAN_NUM-1:0]s_axis_tlast,
	output wire [DATA_WIDTH-1:0]m_axis_tdata,
	output wire [USER_WIDTH-1:0]m_axis_tuser,
	output wire m_axis_tvalid,
	input wire m_axis_tready,
	output wire m_axis_tlast
);

localparam PTR_WIDTH = $clog2(CHAN_NUM);

reg [PTR_WIDTH-1:0]curr;
reg curr_wrap;
reg [PTR_WIDTH-1:0]next;
reg act;
wire [CHAN_NUM-1:0]axis_tvalid;

integer i,j;
genvar g;

generate for (g = 0; g < CHAN_NUM; g = g + 1) begin
	if (DEST_WIDTH > 0) begin
		wire dest_valid = (s_axis_tdest[DEST_WIDTH*(g+1)-1-:DEST_WIDTH] == DEST_INDEX);
		assign s_axis_tready[g] = (dest_valid ? (curr == g ? m_axis_tready : 1'b0) : 1'b0) & aresetn;
		assign axis_tvalid[g] = (dest_valid ? s_axis_tvalid[g] : 1'b0) & aresetn;
	end else begin
		assign s_axis_tready[g] = (curr == g ? m_axis_tready : 1'b0) & aresetn;
		assign axis_tvalid[g] = s_axis_tvalid[g] & aresetn;
	end
end endgenerate

assign m_axis_tdata = axis_tvalid[curr] ? s_axis_tdata[DATA_WIDTH*(curr+1)-1-:DATA_WIDTH] : 0;
assign m_axis_tuser = axis_tvalid[curr] ? s_axis_tuser[USER_WIDTH*(curr+1)-1-:USER_WIDTH] : 0;
assign m_axis_tvalid = aresetn ? axis_tvalid[curr] : 1'b0;
assign m_axis_tlast = s_axis_tlast[curr] & axis_tvalid[curr];

always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		act <= 1'b0;
		next <= 0;
	end else begin
		if (act == 1'b0) begin
			if (m_axis_tvalid) begin
				if (m_axis_tready & m_axis_tlast) begin
					act <= 1'b0;
					if (curr == (CHAN_NUM - 1)) begin
						next <= 0;
					end else begin
						next <= curr + 1;
					end
				end else begin
					act <= 1'b1;
					next <= curr;
				end
			end
		end else begin
			if (m_axis_tvalid & m_axis_tready & m_axis_tlast) begin
				act <= 1'b0;
				if (curr == (CHAN_NUM - 1)) begin
					next <= 0;
				end else begin
					next <= curr + 1;
				end
			end
		end
	end
end

always @(*) begin
	curr = next;
	curr_wrap = 1'b1;
	if (act == 1'b0) begin
		for (i = 0; i < CHAN_NUM; i = i + 1) begin
			if (i == next) begin
				for (j = (CHAN_NUM - 1); j >= i; j = j - 1) begin
					if (axis_tvalid[j]) begin
						curr = j;
						curr_wrap = 1'b0;
					end
				end
				if (curr_wrap == 1'b1) begin
					for (j = i - 1; j >= 0; j = j - 1) begin
						if (axis_tvalid[j]) begin
							curr = j;
						end
					end
				end
			end
		end
	end
end

endmodule
