// This program was cloned from: https://github.com/mcjtag/eth_switch
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 03.08.2020 14:51:23
// Design Name: 
// Module Name: eth_switch
// Project Name: eth_switch
// Target Devices: 
// Tool Versions: 
// Description: Ethernet Switch (L2)
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

module eth_switch #(
	parameter PORT_NUM = 4,
	parameter ADDR_WIDTH = 8,
	parameter ETHERNET_MTU = 1500,
	parameter FLOODING_ENABLE = 1,
	parameter CRC_CHECK = 0,
	parameter RAM_STYLE_DATA = "block",	/* "block" or "distributed" */
	parameter MODE = "dynamic"			/* "static or "dynamic" */
)
(
	input wire aclk,
	input wire aresetn,
	input wire [PORT_NUM*8-1:0]s_axis_tdata,
	input wire [PORT_NUM-1:0]s_axis_tvalid,
	output wire [PORT_NUM-1:0]s_axis_tready,
	input wire [PORT_NUM-1:0]s_axis_tlast,
	output wire [PORT_NUM*8-1:0]m_axis_tdata,
	output wire [PORT_NUM-1:0]m_axis_tvalid,
	input wire [PORT_NUM-1:0]m_axis_tready,
	output wire [PORT_NUM-1:0]m_axis_tlast,
	input wire [ADDR_WIDTH+$clog2(PORT_NUM)+47:0]s_axis_config_tdata,
	input wire s_axis_config_tuser,
	input wire s_axis_config_tvalid
);

localparam PORT_WIDTH = $clog2(PORT_NUM);

wire [8*PORT_NUM-1:0]m_axis_chan_tdata;
wire [PORT_WIDTH*PORT_NUM-1:0]m_axis_chan_tdest;
wire [PORT_NUM-1:0]m_axis_chan_tvalid;
wire [PORT_NUM-1:0]m_axis_chan_tready;
wire [PORT_NUM-1:0]m_axis_chan_tlast;

wire [PORT_NUM*96-1:0]m_axis_table_request_tdata;
wire [PORT_NUM*PORT_WIDTH-1:0]m_axis_table_request_tuser;
wire [PORT_NUM-1:0]m_axis_table_request_tvalid;
wire [PORT_NUM-1:0]m_axis_table_request_tready;

wire [95:0]s_axis_table_request_tdata;
wire [PORT_WIDTH-1:0]s_axis_table_request_tuser;
wire s_axis_table_request_tvalid;
wire s_axis_table_request_tready;

wire [3:0]s_axis_table_response_tdata;
wire [PORT_WIDTH*2-1:0]s_axis_table_response_tuser;
wire s_axis_table_response_tvalid;

genvar g;

/* Input Channels */
generate for (g = 0; g < PORT_NUM; g = g + 1) begin : CHANNEL_IN
	channel_in #(
		.PORT_ADDR(g),
		.PORT_HIGH(PORT_NUM-1),
		.ETHERNET_MTU(ETHERNET_MTU),
		.FLOODING_ENABLE(FLOODING_ENABLE),
		.CRC_CHECK(CRC_CHECK),
		.PORT_WIDTH(PORT_WIDTH)
	) channel_in_inst (
		.aclk(aclk),
		.aresetn(aresetn),
		.s_axis_tdata(s_axis_tdata[8*(g+1)-1-:8]),
		.s_axis_tvalid(s_axis_tvalid[g]),
		.s_axis_tready(s_axis_tready[g]),
		.s_axis_tlast(s_axis_tlast[g]),
		.m_axis_tdata(m_axis_chan_tdata[8*(g+1)-1-:8]),
		.m_axis_tdest(m_axis_chan_tdest[PORT_WIDTH*(g+1)-1-:PORT_WIDTH]),
		.m_axis_tvalid(m_axis_chan_tvalid[g]),
		.m_axis_tready(m_axis_chan_tready[g]),
		.m_axis_tlast(m_axis_chan_tlast[g]),
		.m_axis_table_request_tdata(m_axis_table_request_tdata[96*(g+1)-1-:96]),
		.m_axis_table_request_tuser(m_axis_table_request_tuser[PORT_WIDTH*(g+1)-1-:PORT_WIDTH]),
		.m_axis_table_request_tvalid(m_axis_table_request_tvalid[g]),
		.m_axis_table_request_tready(m_axis_table_request_tready[g]),
		.s_axis_table_response_tdata(s_axis_table_response_tdata),
		.s_axis_table_response_tuser(s_axis_table_response_tuser),
		.s_axis_table_response_tvalid(s_axis_table_response_tvalid),
		.m_axis_status_tdata(),
		.m_axis_status_tvalid()
	);
end endgenerate

/* Main Interconnection (PORT_NUM x PORT_NUM) */
axis_interconnect #(
	.CHANNELS_IN(PORT_NUM),
	.CHANNELS_OUT(PORT_NUM),
	.DATA_WIDTH(8),
	.USER_WIDTH(1)
) axis_interconnect_channel (
	.aclk(aclk),
	.aresetn(aresetn),
	.s_axis_tdata(m_axis_chan_tdata),
	.s_axis_tdest(m_axis_chan_tdest),
	.s_axis_tuser(0),
	.s_axis_tvalid(m_axis_chan_tvalid),
	.s_axis_tready(m_axis_chan_tready),
	.s_axis_tlast(m_axis_chan_tlast),
	.m_axis_tdata(m_axis_tdata),
	.m_axis_tuser(),
	.m_axis_tvalid(m_axis_tvalid),
	.m_axis_tready(m_axis_tready),
	.m_axis_tlast(m_axis_tlast)
);

/* Table Interconnection (PORT_NUM x 1) */
axis_interconnect #(
	.CHANNELS_IN(PORT_NUM),
	.CHANNELS_OUT(1),
	.DATA_WIDTH(96),
	.USER_WIDTH(PORT_WIDTH)
) axis_interconnect_table (
	.aclk(aclk),
	.aresetn(aresetn),
	.s_axis_tdata(m_axis_table_request_tdata),
	.s_axis_tuser(m_axis_table_request_tuser),
	.s_axis_tdest(),
	.s_axis_tvalid(m_axis_table_request_tvalid),
	.s_axis_tready(m_axis_table_request_tready),
	.s_axis_tlast({PORT_NUM{1'b1}}),
	.m_axis_tdata(s_axis_table_request_tdata),
	.m_axis_tuser(s_axis_table_request_tuser),
	.m_axis_tvalid(s_axis_table_request_tvalid),
	.m_axis_tready(s_axis_table_request_tready),
	.m_axis_tlast()
);

mactable #(
	.ADDR_WIDTH(ADDR_WIDTH),
	.PORT_WIDTH(PORT_WIDTH),
	.RAM_STYLE_DATA(RAM_STYLE_DATA),
	.MODE(MODE)
) mactable_inst (
	.aclk(aclk),
	.aresetn(aresetn),
	.s_axis_table_request_tdata(s_axis_table_request_tdata),
	.s_axis_table_request_tuser(s_axis_table_request_tuser),
	.s_axis_table_request_tvalid(s_axis_table_request_tvalid),
	.s_axis_table_request_tready(s_axis_table_request_tready),
	.m_axis_table_response_tdata(s_axis_table_response_tdata),
	.m_axis_table_response_tuser(s_axis_table_response_tuser),
	.m_axis_table_response_tvalid(s_axis_table_response_tvalid),
	.s_axis_table_config_tdata(s_axis_config_tdata),
	.s_axis_table_config_tuser(s_axis_config_tuser),
	.s_axis_table_config_tvalid(s_axis_config_tvalid)
);

endmodule
