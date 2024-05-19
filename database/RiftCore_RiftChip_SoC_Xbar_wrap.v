// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: Xbar_wrap
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-18 15:55:44
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-19 14:37:03
*/



/*
	Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at

			 http://www.apache.org/licenses/LICENSE-2.0

	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
*/

`timescale 1 ns / 1 ps


module Xbar_wrap (

	input [63:0] DM_AWADDR,
	input [2:0] DM_AWPROT,
	input DM_AWVALID,
	output DM_AWREADY,
	input [63:0] DM_WDATA,
	input [7:0] DM_WSTRB,
	input DM_WVALID,
	output DM_WREADY,
	output [1:0] DM_BRESP,
	output DM_BVALID,
	input DM_BREADY,
	input [63:0] DM_ARADDR,
	input [2:0] DM_ARPROT,
	input DM_ARVALID,
	output DM_ARREADY,
	output [63:0] DM_RDATA,
	output [1:0] DM_RRESP,
	output DM_RVALID,
	input DM_RREADY,

	input [63:0] IFU_AWADDR,
	input [2:0] IFU_AWPROT,
	input IFU_AWVALID,
	output IFU_AWREADY,
	input [63:0] IFU_WDATA,
	input [7:0] IFU_WSTRB,
	input IFU_WVALID,
	output IFU_WREADY,
	output [1:0] IFU_BRESP,
	output IFU_BVALID,
	input IFU_BREADY,
	input [63:0] IFU_ARADDR,
	input [2:0] IFU_ARPROT,
	input IFU_ARVALID,
	output IFU_ARREADY,
	output [63:0] IFU_RDATA,
	output [1:0] IFU_RRESP,
	output IFU_RVALID,
	input IFU_RREADY,

	input [63:0] LSU_AWADDR,
	input [2:0] LSU_AWPROT,
	input LSU_AWVALID,
	output LSU_AWREADY,
	input [63:0] LSU_WDATA,
	input [7:0] LSU_WSTRB,
	input LSU_WVALID,
	output LSU_WREADY,
	output [1:0] LSU_BRESP,
	output LSU_BVALID,
	input LSU_BREADY,
	input [63:0] LSU_ARADDR,
	input [2:0] LSU_ARPROT,
	input LSU_ARVALID,
	output LSU_ARREADY,
	output [63:0] LSU_RDATA,
	output [1:0] LSU_RRESP,
	output LSU_RVALID,
	input LSU_RREADY,






	output [63:0] CLINT_AXI_AWADDR,
	output CLINT_AXI_AWVALID,
	input CLINT_AXI_AWREADY,
	output [63:0] CLINT_AXI_WDATA,   
	output [7:0] CLINT_AXI_WSTRB,
	output CLINT_AXI_WVALID,
	input CLINT_AXI_WREADY,
	input [1:0] CLINT_AXI_BRESP,
	input CLINT_AXI_BVALID,
	output CLINT_AXI_BREADY,
	output [63:0] CLINT_AXI_ARADDR,
	output CLINT_AXI_ARVALID,
	input CLINT_AXI_ARREADY,
	input [63:0] CLINT_AXI_RDATA,
	input [1:0] CLINT_AXI_RRESP,
	input CLINT_AXI_RVALID,
	output CLINT_AXI_RREADY,

	output [63:0] PLIC_AXI_AWADDR,
	output PLIC_AXI_AWVALID,
	input PLIC_AXI_AWREADY,
	output [63:0] PLIC_AXI_WDATA,   
	output [7:0] PLIC_AXI_WSTRB,
	output PLIC_AXI_WVALID,
	input PLIC_AXI_WREADY,
	input [1:0] PLIC_AXI_BRESP,
	input PLIC_AXI_BVALID,
	output PLIC_AXI_BREADY,
	output [63:0] PLIC_AXI_ARADDR,
	output PLIC_AXI_ARVALID,
	input PLIC_AXI_ARREADY,
	input [63:0] PLIC_AXI_RDATA,
	input [1:0] PLIC_AXI_RRESP,
	input PLIC_AXI_RVALID,
	output PLIC_AXI_RREADY,

	output [63:0] PREPH_AXI_AWADDR,
	output PREPH_AXI_AWVALID,
	input PREPH_AXI_AWREADY,
	output [63:0] PREPH_AXI_WDATA,   
	output [7:0] PREPH_AXI_WSTRB,
	output PREPH_AXI_WVALID,
	input PREPH_AXI_WREADY,
	input [1:0] PREPH_AXI_BRESP,
	input PREPH_AXI_BVALID,
	output PREPH_AXI_BREADY,
	output [63:0] PREPH_AXI_ARADDR,
	output PREPH_AXI_ARVALID,
	input PREPH_AXI_ARREADY,
	input [63:0] PREPH_AXI_RDATA,
	input [1:0] PREPH_AXI_RRESP,
	input PREPH_AXI_RVALID,
	output PREPH_AXI_RREADY,

	output [63:0] SYS_AXI_AWADDR,
	output SYS_AXI_AWVALID,
	input SYS_AXI_AWREADY,
	output [63:0] SYS_AXI_WDATA,   
	output [7:0] SYS_AXI_WSTRB,
	output SYS_AXI_WVALID,
	input SYS_AXI_WREADY,
	input [1:0] SYS_AXI_BRESP,
	input SYS_AXI_BVALID,
	output SYS_AXI_BREADY,
	output [63:0] SYS_AXI_ARADDR,
	output SYS_AXI_ARVALID,
	input SYS_AXI_ARREADY,
	input [63:0] SYS_AXI_RDATA,
	input [1:0] SYS_AXI_RRESP,
	input SYS_AXI_RVALID,
	output SYS_AXI_RREADY,

	output [63:0] MEM_AXI_AWADDR,
	output MEM_AXI_AWVALID,
	input MEM_AXI_AWREADY,
	output [63:0] MEM_AXI_WDATA,   
	output [7:0] MEM_AXI_WSTRB,
	output MEM_AXI_WVALID,
	input MEM_AXI_WREADY,
	input [1:0] MEM_AXI_BRESP,
	input MEM_AXI_BVALID,
	output MEM_AXI_BREADY,
	output [63:0] MEM_AXI_ARADDR,
	output MEM_AXI_ARVALID,
	input MEM_AXI_ARREADY,
	input [63:0] MEM_AXI_RDATA,
	input [1:0] MEM_AXI_RRESP,
	input MEM_AXI_RVALID,
	output MEM_AXI_RREADY,

	input CLK,
	input RSTn


);




wire [191 : 0] s_axi_awaddr;
wire [8 : 0] s_axi_awprot;
wire [2 : 0] s_axi_awvalid;
wire [2 : 0] s_axi_awready;
wire [191 : 0] s_axi_wdata;
wire [23 : 0] s_axi_wstrb;
wire [2 : 0] s_axi_wvalid;
wire [2 : 0] s_axi_wready;
wire [5 : 0] s_axi_bresp;
wire [2 : 0] s_axi_bvalid;
wire [2 : 0] s_axi_bready;
wire [191 : 0] s_axi_araddr;
wire [8 : 0] s_axi_arprot;
wire [2 : 0] s_axi_arvalid;
wire [2 : 0] s_axi_arready;
wire [191 : 0] s_axi_rdata;
wire [5 : 0] s_axi_rresp;
wire [2 : 0] s_axi_rvalid;
wire [2 : 0] s_axi_rready;
wire [319 : 0] m_axi_awaddr;
wire [14 : 0] m_axi_awprot;
wire [4 : 0] m_axi_awvalid;
wire [4 : 0] m_axi_awready;
wire [319 : 0] m_axi_wdata;
wire [39 : 0] m_axi_wstrb;
wire [4 : 0] m_axi_wvalid;
wire [4 : 0] m_axi_wready;
wire [9 : 0] m_axi_bresp;
wire [4 : 0] m_axi_bvalid;
wire [4 : 0] m_axi_bready;
wire [319 : 0] m_axi_araddr;
wire [14 : 0] m_axi_arprot;
wire [4 : 0] m_axi_arvalid;
wire [4 : 0] m_axi_arready;
wire [319 : 0] m_axi_rdata;
wire [9 : 0] m_axi_rresp;
wire [4 : 0] m_axi_rvalid;
wire [4 : 0] m_axi_rready;




assign s_axi_awaddr = {LSU_AWADDR, IFU_AWADDR, DM_AWADDR};
assign s_axi_awprot = {LSU_AWPROT, IFU_AWPROT, DM_ARPROT};
assign s_axi_awvalid = {LSU_AWVALID, IFU_AWVALID, DM_AWVALID};
assign {LSU_AWREADY, IFU_AWREADY, DM_AWREADY} = s_axi_awready;
assign s_axi_wdata = { LSU_WDATA, IFU_WDATA, DM_WDATA };
assign s_axi_wstrb = { LSU_WSTRB, IFU_WSTRB, DM_WSTRB };
assign s_axi_wvalid = {LSU_WVALID, IFU_WVALID, DM_WVALID};
assign { LSU_WREADY, IFU_WREADY, DM_WREADY }=s_axi_wready;
assign {LSU_BRESP, IFU_BRESP, DM_BRESP} = s_axi_bresp;
assign {LSU_BVALID, IFU_BVALID, DM_BVALID} = s_axi_bvalid;
assign s_axi_bready = {LSU_BREADY, IFU_BREADY, DM_BREADY};
assign s_axi_araddr = {LSU_ARADDR, IFU_ARADDR, DM_ARADDR};
assign s_axi_arprot = {LSU_ARPROT, IFU_ARPROT, DM_ARPROT};
assign s_axi_arvalid = {LSU_ARVALID, IFU_ARVALID, DM_ARVALID};
assign {LSU_ARREADY, IFU_ARREADY, DM_ARREADY} = s_axi_arready;
assign {LSU_RDATA, IFU_RDATA, DM_RDATA} = s_axi_rdata;
assign {LSU_RRESP, IFU_RRESP, DM_RRESP} = s_axi_rresp;
assign {LSU_RVALID, IFU_RVALID, DM_RVALID} = s_axi_rvalid;
assign s_axi_rready = {LSU_RREADY, IFU_RREADY, DM_RREADY};


assign {MEM_AXI_AWADDR, SYS_AXI_AWADDR, PREPH_AXI_AWADDR, PLIC_AXI_AWADDR, CLINT_AXI_AWADDR} = m_axi_awaddr;
// assign {MEM_AXI_AWPROT, SYS_AXI_AWPROT, PREPH_AXI_AWPROT, PLIC_AXI_AWPROT, CLINT_AXI_AWPROT} = m_axi_awprot;
assign {MEM_AXI_AWVALID, SYS_AXI_AWVALID, PREPH_AXI_AWVALID, PLIC_AXI_AWVALID, CLINT_AXI_AWVALID} = m_axi_awvalid;
assign m_axi_awready = {MEM_AXI_AWREADY, SYS_AXI_AWREADY, PREPH_AXI_AWREADY, PLIC_AXI_AWREADY, CLINT_AXI_AWREADY};
assign {MEM_AXI_WDATA, SYS_AXI_WDATA, PREPH_AXI_WDATA, PLIC_AXI_WDATA, CLINT_AXI_WDATA} = m_axi_wdata;
assign {MEM_AXI_WSTRB, SYS_AXI_WSTRB, PREPH_AXI_WSTRB, PLIC_AXI_WSTRB, CLINT_AXI_WSTRB} = m_axi_wstrb;
assign {MEM_AXI_WVALID, SYS_AXI_WVALID, PREPH_AXI_WVALID, PLIC_AXI_WVALID, CLINT_AXI_WVALID} = m_axi_wvalid;
assign m_axi_wready = {MEM_AXI_WREADY, SYS_AXI_WREADY, PREPH_AXI_WREADY, PLIC_AXI_WREADY, CLINT_AXI_WREADY};
assign m_axi_bresp = {MEM_AXI_BRESP, SYS_AXI_BRESP, PREPH_AXI_BRESP, PLIC_AXI_BRESP, CLINT_AXI_BRESP};
assign m_axi_bvalid = {MEM_AXI_BVALID, SYS_AXI_BVALID, PREPH_AXI_BVALID, PLIC_AXI_BVALID, CLINT_AXI_BVALID};
assign {MEM_AXI_BREADY, SYS_AXI_BREADY, PREPH_AXI_BREADY, PLIC_AXI_BREADY, CLINT_AXI_BREADY} = m_axi_bready;
assign {MEM_AXI_ARADDR, SYS_AXI_ARADDR, PREPH_AXI_ARADDR, PLIC_AXI_ARADDR, CLINT_AXI_ARADDR} = m_axi_araddr;
// assign {MEM_AXI_ARPROT, SYS_AXI_ARPROT, PREPH_AXI_ARPROT, PLIC_AXI_ARPROT, CLINT_AXI_ARPROT} = m_axi_arprot;
assign {MEM_AXI_ARVALID, SYS_AXI_ARVALID, PREPH_AXI_ARVALID, PLIC_AXI_ARVALID, CLINT_AXI_ARVALID} = m_axi_arvalid;
assign m_axi_arready = {MEM_AXI_ARREADY, SYS_AXI_ARREADY, PREPH_AXI_ARREADY, PLIC_AXI_ARREADY, CLINT_AXI_ARREADY};
assign m_axi_rdata = {MEM_AXI_RDATA, SYS_AXI_RDATA, PREPH_AXI_RDATA, PLIC_AXI_RDATA, CLINT_AXI_RDATA};
assign m_axi_rresp = {MEM_AXI_RRESP, SYS_AXI_RRESP, PREPH_AXI_RRESP, PLIC_AXI_RRESP, CLINT_AXI_RRESP};
assign m_axi_rvalid = {MEM_AXI_RVALID, SYS_AXI_RVALID, PREPH_AXI_RVALID, PLIC_AXI_RVALID, CLINT_AXI_RVALID};
assign {MEM_AXI_RREADY, SYS_AXI_RREADY, PREPH_AXI_RREADY, PLIC_AXI_RREADY, CLINT_AXI_RREADY} = m_axi_rready;












inner_crossBar i_innerXbar(

	.s_axi_awaddr (s_axi_awaddr),
	.s_axi_awprot (s_axi_awprot),
	.s_axi_awvalid(s_axi_awvalid),
	.s_axi_awready(s_axi_awready),
	.s_axi_wdata  (s_axi_wdata),
	.s_axi_wstrb  (s_axi_wstrb),
	.s_axi_wvalid (s_axi_wvalid),
	.s_axi_wready (s_axi_wready),
	.s_axi_bresp  (s_axi_bresp),
	.s_axi_bvalid (s_axi_bvalid),
	.s_axi_bready (s_axi_bready),
	.s_axi_araddr (s_axi_araddr),
	.s_axi_arprot (s_axi_arprot),
	.s_axi_arvalid(s_axi_arvalid),
	.s_axi_arready(s_axi_arready),
	.s_axi_rdata  (s_axi_rdata),
	.s_axi_rresp  (s_axi_rresp),
	.s_axi_rvalid (s_axi_rvalid),
	.s_axi_rready (s_axi_rready),
	.m_axi_awaddr (m_axi_awaddr),
	.m_axi_awprot (m_axi_awprot),
	.m_axi_awvalid(m_axi_awvalid),
	.m_axi_awready(m_axi_awready),
	.m_axi_wdata  (m_axi_wdata),
	.m_axi_wstrb  (m_axi_wstrb),
	.m_axi_wvalid (m_axi_wvalid),
	.m_axi_wready (m_axi_wready),
	.m_axi_bresp  (m_axi_bresp),
	.m_axi_bvalid (m_axi_bvalid),
	.m_axi_bready (m_axi_bready),
	.m_axi_araddr (m_axi_araddr),
	.m_axi_arprot (m_axi_arprot),
	.m_axi_arvalid(m_axi_arvalid),
	.m_axi_arready(m_axi_arready),
	.m_axi_rdata  (m_axi_rdata),
	.m_axi_rresp  (m_axi_rresp),
	.m_axi_rvalid (m_axi_rvalid),
	.m_axi_rready (m_axi_rready),

	.aclk         (CLK),
	.aresetn      (RSTn)

);

















endmodule







