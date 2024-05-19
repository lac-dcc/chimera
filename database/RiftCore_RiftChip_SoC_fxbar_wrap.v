// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: fxbar_wrap
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-08 15:50:33
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 16:09:05
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

module fxbar_wrap (
	// input [1:0] DM_AWID,
	input [31:0] DM_AWADDR,
	input [7:0] DM_AWLEN,
	input [2:0] DM_AWSIZE,
	input [1:0] DM_AWBURST,
	// input DM_AWLOCK,
	// input [3:0] DM_AWCACHE,
	// input [2:0] DM_AWPROT,
	// input [3:0] DM_AWQOS,
	// input [3:0] DM_AWREGION,
	input DM_AWVALID,
	output DM_AWREADY,
	input [63:0] DM_WDATA,
	input [7:0] DM_WSTRB,
	input DM_WLAST,
	input DM_WVALID,
	output DM_WREADY,
	// output [1:0] DM_BID,
	output [1:0] DM_BRESP,
	output DM_BVALID,
	input DM_BREADY,
	// input [1:0] DM_ARID,
	input [31:0] DM_ARADDR,
	input [7:0] DM_ARLEN,
	input [2:0] DM_ARSIZE,
	input [1:0] DM_ARBURST,
	// input DM_ARLOCK,
	// input [3:0] DM_ARCACHE,
	// input [2:0] DM_ARPROT,
	// input [3:0] DM_ARQOS,
	// input [3:0] DM_ARREGION,
	input DM_ARVALID,
	output DM_ARREADY,
	// output [1:0] DM_RID,
	output [63:0] DM_RDATA,
	output [1:0] DM_RRESP,
	output DM_RLAST,
	output DM_RVALID,
	input DM_RREADY,


	// input [1:0] SYS_AWID,
	input [31:0] SYS_AWADDR,
	input [7:0] SYS_AWLEN,
	input [2:0] SYS_AWSIZE,
	input [1:0] SYS_AWBURST,
	// input SYS_AWLOCK,
	// input [3:0] SYS_AWCACHE,
	// input [2:0] SYS_AWPROT,
	// input [3:0] SYS_AWQOS,
	// input [3:0] SYS_AWREGION,
	input SYS_AWVALID,
	output SYS_AWREADY,
	input [63:0] SYS_WDATA,
	input [7:0] SYS_WSTRB,
	input SYS_WLAST,
	input SYS_WVALID,
	output SYS_WREADY,
	// output [1:0] SYS_BID,
	output [1:0] SYS_BRESP,
	output SYS_BVALID,
	input SYS_BREADY,
	// input [1:0] SYS_ARID,
	input [31:0] SYS_ARADDR,
	input [7:0] SYS_ARLEN,
	input [2:0] SYS_ARSIZE,
	input [1:0] SYS_ARBURST,
	// input SYS_ARLOCK,
	// input [3:0] SYS_ARCACHE,
	// input [2:0] SYS_ARPROT,
	// input [3:0] SYS_ARQOS,
	// input [3:0] SYS_ARREGION,
	input SYS_ARVALID,
	output SYS_ARREADY,
	// output [1:0] SYS_RID,
	output [63:0] SYS_RDATA,
	output [1:0] SYS_RRESP,
	output SYS_RLAST,
	output SYS_RVALID,
	input SYS_RREADY,


	// input [1:0] CACHE_AWID,
	input [31:0] CACHE_AWADDR,
	input [7:0] CACHE_AWLEN,
	input [2:0] CACHE_AWSIZE,
	input [1:0] CACHE_AWBURST,
	// input CACHE_AWLOCK,
	// input [3:0] CACHE_AWCACHE,
	// input [2:0] CACHE_AWPROT,
	// input [3:0] CACHE_AWQOS,
	// input [3:0] CACHE_AWREGION,
	input CACHE_AWVALID,
	output CACHE_AWREADY,
	input [63:0] CACHE_WDATA,
	input [7:0] CACHE_WSTRB,
	input CACHE_WLAST,
	input CACHE_WVALID,
	output CACHE_WREADY,
	// output [1:0] CACHE_BID,
	output [1:0] CACHE_BRESP,
	output CACHE_BVALID,
	input CACHE_BREADY,
	// input [1:0] CACHE_ARID,
	input [31:0] CACHE_ARADDR,
	input [7:0] CACHE_ARLEN,
	input [2:0] CACHE_ARSIZE,
	input [1:0] CACHE_ARBURST,
	// input CACHE_ARLOCK,
	// input [3:0] CACHE_ARCACHE,
	// input [2:0] CACHE_ARPROT,
	// input [3:0] CACHE_ARQOS,
	// input [3:0] CACHE_ARREGION,
	input CACHE_ARVALID,
	output CACHE_ARREADY,
	// output [1:0] CACHE_RID,
	output [63:0] CACHE_RDATA,
	output [1:0] CACHE_RRESP,
	output CACHE_RLAST,
	output CACHE_RVALID,
	input CACHE_RREADY,







	// output [1:0] CLINT_AWID,
	output [31:0] CLINT_AWADDR,
	output [7:0] CLINT_AWLEN,
	output [2:0] CLINT_AWSIZE,
	output [1:0] CLINT_AWBURST,
	// output CLINT_AWLOCK,
	// output [3:0] CLINT_AWCACHE,
	// output [2:0] CLINT_AWPROT,
	// output [3:0] CLINT_AWQOS,
	output CLINT_AWVALID,
	input CLINT_AWREADY,
	output [63:0] CLINT_WDATA,
	output [7:0] CLINT_WSTRB,
	output CLINT_WLAST,
	output CLINT_WVALID,
	input CLINT_WREADY,
	// input [1:0] CLINT_BID,
	input [1:0] CLINT_BRESP,
	input CLINT_BVALID,
	output CLINT_BREADY,
	// output [1:0] CLINT_ARID,
	output [31:0] CLINT_ARADDR,
	output [7:0] CLINT_ARLEN,
	output [2:0] CLINT_ARSIZE,
	output [1:0] CLINT_ARBURST,
	// output CLINT_ARLOCK,
	// output [3:0] CLINT_ARCACHE,
	// output [2:0] CLINT_ARPROT,
	// output [3:0] CLINT_ARQOS,
	output CLINT_ARVALID,
	input CLINT_ARREADY,
	// input [1:0] CLINT_RID,
	input [63:0] CLINT_RDATA,
	input [1:0] CLINT_RRESP,
	input CLINT_RLAST,
	input CLINT_RVALID,
	output CLINT_RREADY,


	// output [1:0] PLIC_AWID,
	output [31:0] PLIC_AWADDR,
	output [7:0] PLIC_AWLEN,
	output [2:0] PLIC_AWSIZE,
	output [1:0] PLIC_AWBURST,
	// output PLIC_AWLOCK,
	// output [3:0] PLIC_AWCACHE,
	// output [2:0] PLIC_AWPROT,
	// output [3:0] PLIC_AWQOS,
	output PLIC_AWVALID,
	input PLIC_AWREADY,
	output [63:0] PLIC_WDATA,
	output [7:0] PLIC_WSTRB,
	output PLIC_WLAST,
	output PLIC_WVALID,
	input PLIC_WREADY,
	// input [1:0] PLIC_BID,
	input [1:0] PLIC_BRESP,
	input PLIC_BVALID,
	output PLIC_BREADY,
	// output [1:0] PLIC_ARID,
	output [31:0] PLIC_ARADDR,
	output [7:0] PLIC_ARLEN,
	output [2:0] PLIC_ARSIZE,
	output [1:0] PLIC_ARBURST,
	// output PLIC_ARLOCK,
	// output [3:0] PLIC_ARCACHE,
	// output [2:0] PLIC_ARPROT,
	// output [3:0] PLIC_ARQOS,
	output PLIC_ARVALID,
	input PLIC_ARREADY,
	// input [1:0] PLIC_RID,
	input [63:0] PLIC_RDATA,
	input [1:0] PLIC_RRESP,
	input PLIC_RLAST,
	input PLIC_RVALID,
	output PLIC_RREADY,


	// output [1:0] PERPH_AWID,
	output [31:0] PERPH_AWADDR,
	output [7:0] PERPH_AWLEN,
	output [2:0] PERPH_AWSIZE,
	output [1:0] PERPH_AWBURST,
	// output PERPH_AWLOCK,
	// output [3:0] PERPH_AWCACHE,
	// output [2:0] PERPH_AWPROT,
	// output [3:0] PERPH_AWQOS,
	output PERPH_AWVALID,
	input PERPH_AWREADY,
	output [63:0] PERPH_WDATA,
	output [7:0] PERPH_WSTRB,
	output PERPH_WLAST,
	output PERPH_WVALID,
	input PERPH_WREADY,
	// input [1:0] PERPH_BID,
	input [1:0] PERPH_BRESP,
	input PERPH_BVALID,
	output PERPH_BREADY,
	// output [1:0] PERPH_ARID,
	output [31:0] PERPH_ARADDR,
	output [7:0] PERPH_ARLEN,
	output [2:0] PERPH_ARSIZE,
	output [1:0] PERPH_ARBURST,
	// output PERPH_ARLOCK,
	// output [3:0] PERPH_ARCACHE,
	// output [2:0] PERPH_ARPROT,
	// output [3:0] PERPH_ARQOS,
	output PERPH_ARVALID,
	input PERPH_ARREADY,
	// input [1:0] PERPH_RID,
	input [63:0] PERPH_RDATA,
	input [1:0] PERPH_RRESP,
	input PERPH_RLAST,
	input PERPH_RVALID,
	output PERPH_RREADY,


	// output [1:0] MEM_AWID,
	output [31:0] MEM_AWADDR,
	output [7:0] MEM_AWLEN,
	output [2:0] MEM_AWSIZE,
	output [1:0] MEM_AWBURST,
	// output MEM_AWLOCK,
	// output [3:0] MEM_AWCACHE,
	// output [2:0] MEM_AWPROT,
	// output [3:0] MEM_AWQOS,
	output MEM_AWVALID,
	input MEM_AWREADY,
	output [63:0] MEM_WDATA,
	output [7:0] MEM_WSTRB,
	output MEM_WLAST,
	output MEM_WVALID,
	input MEM_WREADY,
	// input [1:0] MEM_BID,
	input [1:0] MEM_BRESP,
	input MEM_BVALID,
	output MEM_BREADY,
	// output [1:0] MEM_ARID,
	output [31:0] MEM_ARADDR,
	output [7:0] MEM_ARLEN,
	output [2:0] MEM_ARSIZE,
	output [1:0] MEM_ARBURST,
	// output MEM_ARLOCK,
	// output [3:0] MEM_ARCACHE,
	// output [2:0] MEM_ARPROT,
	// output [3:0] MEM_ARQOS,
	output MEM_ARVALID,
	input MEM_ARREADY,
	// input [1:0] MEM_RID,
	input [63:0] MEM_RDATA,
	input [1:0] MEM_RRESP,
	input MEM_RLAST,
	input MEM_RVALID,
	output MEM_RREADY,



	input CLK,
	input RSTn
	
);





wire [5 : 0] s_axi_awid;
wire [95 : 0] s_axi_awaddr;
wire [23 : 0] s_axi_awlen;
wire [8 : 0] s_axi_awsize;
wire [5 : 0] s_axi_awburst;
wire [2 : 0] s_axi_awlock;
wire [11 : 0] s_axi_awcache;
wire [8 : 0] s_axi_awprot;
wire [11 : 0] s_axi_awqos;
wire [2 : 0] s_axi_awvalid;
wire [2 : 0] s_axi_awready;
wire [191 : 0] s_axi_wdata;
wire [23 : 0] s_axi_wstrb;
wire [2 : 0] s_axi_wlast;
wire [2 : 0] s_axi_wvalid;
wire [2 : 0] s_axi_wready;
wire [5 : 0] s_axi_bid;
wire [5 : 0] s_axi_bresp;
wire [2 : 0] s_axi_bvalid;
wire [2 : 0] s_axi_bready;
wire [5 : 0] s_axi_arid;
wire [95 : 0] s_axi_araddr;
wire [23 : 0] s_axi_arlen;
wire [8 : 0] s_axi_arsize;
wire [5 : 0] s_axi_arburst;
wire [2 : 0] s_axi_arlock;
wire [11 : 0] s_axi_arcache;
wire [8 : 0] s_axi_arprot;
wire [11 : 0] s_axi_arqos;
wire [2 : 0] s_axi_arvalid;
wire [2 : 0] s_axi_arready;
wire [5 : 0] s_axi_rid;
wire [191 : 0] s_axi_rdata;
wire [5 : 0] s_axi_rresp;
wire [2 : 0] s_axi_rlast;
wire [2 : 0] s_axi_rvalid;
wire [2 : 0] s_axi_rready;






wire [7 : 0] m_axi_awid;
wire [127 : 0] m_axi_awaddr;
wire [31 : 0] m_axi_awlen;
wire [11 : 0] m_axi_awsize;
wire [7 : 0] m_axi_awburst;
wire [3 : 0] m_axi_awlock;
wire [15 : 0] m_axi_awcache;
wire [11 : 0] m_axi_awprot;
wire [15 : 0] m_axi_awregion;
wire [15 : 0] m_axi_awqos;
wire [3 : 0] m_axi_awvalid;
wire [3 : 0] m_axi_awready;
wire [255 : 0] m_axi_wdata;
wire [31 : 0] m_axi_wstrb;
wire [3 : 0] m_axi_wlast;
wire [3 : 0] m_axi_wvalid;
wire [3 : 0] m_axi_wready;
wire [7 : 0] m_axi_bid;
wire [7 : 0] m_axi_bresp;
wire [3 : 0] m_axi_bvalid;
wire [3 : 0] m_axi_bready;
wire [7 : 0] m_axi_arid;
wire [127 : 0] m_axi_araddr;
wire [31 : 0] m_axi_arlen;
wire [11 : 0] m_axi_arsize;
wire [7 : 0] m_axi_arburst;
wire [3 : 0] m_axi_arlock;
wire [15 : 0] m_axi_arcache;
wire [11 : 0] m_axi_arprot;
wire [15 : 0] m_axi_arregion;
wire [15 : 0] m_axi_arqos;
wire [3 : 0] m_axi_arvalid;
wire [3 : 0] m_axi_arready;
wire [7 : 0] m_axi_rid;
wire [255 : 0] m_axi_rdata;
wire [7 : 0] m_axi_rresp;
wire [3 : 0] m_axi_rlast;
wire [3 : 0] m_axi_rvalid;
wire [3 : 0] m_axi_rready;










assign s_axi_awaddr = {CACHE_AWADDR, SYS_AWADDR, DM_AWADDR};
// assign s_axi_awprot = {CACHE_AWPROT, SYS_AWPROT, DM_ARPROT};
assign s_axi_awvalid = {CACHE_AWVALID, SYS_AWVALID, DM_AWVALID};
assign {CACHE_AWREADY, SYS_AWREADY, DM_AWREADY} = s_axi_awready;
assign s_axi_wlast = { CACHE_WLAST, SYS_WLAST, DM_WLAST };
assign s_axi_wdata = { CACHE_WDATA, SYS_WDATA, DM_WDATA };
assign s_axi_wstrb = { CACHE_WSTRB, SYS_WSTRB, DM_WSTRB };
assign s_axi_wvalid = {CACHE_WVALID, SYS_WVALID, DM_WVALID};
assign { CACHE_WREADY, SYS_WREADY, DM_WREADY }=s_axi_wready;
assign {CACHE_BRESP, SYS_BRESP, DM_BRESP} = s_axi_bresp;
assign {CACHE_BVALID, SYS_BVALID, DM_BVALID} = s_axi_bvalid;
assign s_axi_bready = {CACHE_BREADY, SYS_BREADY, DM_BREADY};
assign s_axi_araddr = {CACHE_ARADDR, SYS_ARADDR, DM_ARADDR};
// assign s_axi_arprot = {CACHE_ARPROT, SYS_ARPROT, DM_ARPROT};
assign s_axi_arvalid = {CACHE_ARVALID, SYS_ARVALID, DM_ARVALID};
assign {CACHE_ARREADY, SYS_ARREADY, DM_ARREADY} = s_axi_arready;
assign {CACHE_RDATA, SYS_RDATA, DM_RDATA} = s_axi_rdata;
assign {CACHE_RRESP, SYS_RRESP, DM_RRESP} = s_axi_rresp;
assign {CACHE_RVALID, SYS_RVALID, DM_RVALID} = s_axi_rvalid;
assign s_axi_rready = {CACHE_RREADY, SYS_RREADY, DM_RREADY};
assign {CACHE_RLAST, SYS_RLAST, DM_RLAST} = s_axi_rlast;

// assign s_axi_awid = {CACHE_AWID, SYS_AWID, DM_AWID};
assign s_axi_awlen = {CACHE_AWLEN, SYS_AWLEN, DM_AWLEN};
assign s_axi_awsize = {CACHE_AWSIZE, SYS_AWSIZE, DM_AWSIZE};
assign s_axi_awburst = {CACHE_AWBURST, SYS_AWBURST, DM_AWBURST};
// assign s_axi_awlock = {CACHE_AWLOCK, SYS_AWLOCK, DM_AWLOCK};
// assign s_axi_awcache = {CACHE_AWCACHE, SYS_AWCACHE, DM_AWCACHE};
// assign s_axi_awqos = {CACHE_AWQOS, SYS_AWQOS, DM_AWQOS};
// assign {CACHE_BID, SYS_BID, DM_BID} = s_axi_bid;
// assign s_axi_arid = {CACHE_ARID, SYS_ARID, DM_ARID};
assign s_axi_arlen = {CACHE_ARLEN, SYS_ARLEN, DM_ARLEN};
assign s_axi_arsize = {CACHE_ARSIZE, SYS_ARSIZE, DM_ARSIZE};
assign s_axi_arburst = {CACHE_ARBURST, SYS_ARBURST, DM_ARBURST};
// assign s_axi_arlock = {CACHE_ARLOCK, SYS_ARLOCK, DM_ARLOCK};
// assign s_axi_arcache = {CACHE_ARCACHE, SYS_ARCACHE, DM_ARCACHE};
// assign s_axi_arqos = {CACHE_ARQOS, SYS_ARQOS, DM_ARQOS};
// assign {CACHE_RID, SYS_RID, DM_RID} = s_axi_rid;




// assign {MEM_AWID, PERPH_AWID, PLIC_AWID, CLINT_AWID} = m_axi_awid;
assign {MEM_AWLEN, PERPH_AWLEN, PLIC_AWLEN, CLINT_AWLEN} = m_axi_awlen;
assign {MEM_AWSIZE, PERPH_AWSIZE, PLIC_AWSIZE, CLINT_AWSIZE} = m_axi_awsize;
assign {MEM_AWBURST, PERPH_AWBURST, PLIC_AWBURST, CLINT_AWBURST} = m_axi_awburst;
// assign {MEM_AWLOCK, PERPH_AWLOCK, PLIC_AWLOCK, CLINT_AWLOCK} = m_axi_awlock;
// assign {MEM_AWCACHE, PERPH_AWCACHE, PLIC_AWCACHE, CLINT_AWCACHE} = m_axi_awcache;
// assign {MEM_AWREGION, PERPH_AWREGION, PLIC_AWREGION, CLINT_AWREGION} = m_axi_awregion;
// assign {MEM_AWQOS, PERPH_AWQOS, PLIC_AWQOS, CLINT_AWQOS} = m_axi_awqos;
// assign m_axi_bid = {MEM_BID, PERPH_BID, PLIC_BID, CLINT_BID};
// assign {MEM_ARID, PERPH_ARID, PLIC_ARID, CLINT_ARID} = m_axi_arid;
assign {MEM_ARLEN, PERPH_ARLEN, PLIC_ARLEN, CLINT_ARLEN} = m_axi_arlen;
assign {MEM_ARSIZE, PERPH_ARSIZE, PLIC_ARSIZE, CLINT_ARSIZE} = m_axi_arsize;
assign {MEM_ARBURST, PERPH_ARBURST, PLIC_ARBURST, CLINT_ARBURST} = m_axi_arburst;
// assign {MEM_ARLOCK, PERPH_ARLOCK, PLIC_ARLOCK, CLINT_ARLOCK} = m_axi_arlock;
// assign {MEM_ARCACHE, PERPH_ARCACHE, PLIC_ARCACHE, CLINT_ARCACHE} = m_axi_arcache;
// assign {MEM_ARREGION, PERPH_ARREGION, PLIC_ARREGION, CLINT_ARREGION} = m_axi_arregion;
// assign {MEM_ARQOS, PERPH_ARQOS, PLIC_ARQOS, CLINT_ARQOS} = m_axi_arqos;
// assign m_axi_rid = {MEM_RID, PERPH_RID, PLIC_RID, CLINT_RID};






assign {MEM_AWADDR, PERPH_AWADDR, PLIC_AWADDR, CLINT_AWADDR} = m_axi_awaddr;
// assign {MEM_AWPROT, PERPH_AWPROT, PLIC_AWPROT, CLINT_AWPROT} = m_axi_awprot;
assign {MEM_AWVALID, PERPH_AWVALID, PLIC_AWVALID, CLINT_AWVALID} = m_axi_awvalid;
assign m_axi_awready = {MEM_AWREADY, PERPH_AWREADY, PLIC_AWREADY, CLINT_AWREADY};
assign {MEM_WDATA, PERPH_WDATA, PLIC_WDATA, CLINT_WDATA} = m_axi_wdata;
assign {MEM_WSTRB, PERPH_WSTRB, PLIC_WSTRB, CLINT_WSTRB} = m_axi_wstrb;
assign {MEM_WVALID, PERPH_WVALID, PLIC_WVALID, CLINT_WVALID} = m_axi_wvalid;
assign {MEM_WLAST, PERPH_WLAST, PLIC_WLAST, CLINT_WLAST} = m_axi_wlast;
assign m_axi_wready = {MEM_WREADY, PERPH_WREADY, PLIC_WREADY, CLINT_WREADY};
assign m_axi_bresp = {MEM_BRESP, PERPH_BRESP, PLIC_BRESP, CLINT_BRESP};
assign m_axi_bvalid = {MEM_BVALID, PERPH_BVALID, PLIC_BVALID, CLINT_BVALID};
assign {MEM_BREADY, PERPH_BREADY, PLIC_BREADY, CLINT_BREADY} = m_axi_bready;
assign {MEM_ARADDR, PERPH_ARADDR, PLIC_ARADDR, CLINT_ARADDR} = m_axi_araddr;
// assign {MEM_ARPROT, PERPH_ARPROT, PLIC_ARPROT, CLINT_ARPROT} = m_axi_arprot;
assign {MEM_ARVALID, PERPH_ARVALID, PLIC_ARVALID, CLINT_ARVALID} = m_axi_arvalid;
assign m_axi_arready = {MEM_ARREADY, PERPH_ARREADY, PLIC_ARREADY, CLINT_ARREADY};
assign m_axi_rdata = {MEM_RDATA, PERPH_RDATA, PLIC_RDATA, CLINT_RDATA};
assign m_axi_rresp = {MEM_RRESP, PERPH_RRESP, PLIC_RRESP, CLINT_RRESP};
assign m_axi_rvalid = {MEM_RVALID, PERPH_RVALID, PLIC_RVALID, CLINT_RVALID};
assign {MEM_RREADY, PERPH_RREADY, PLIC_RREADY, CLINT_RREADY} = m_axi_rready;
assign m_axi_rlast = { MEM_RLAST, PERPH_RLAST, PLIC_RLAST, CLINT_RLAST };



















axi_full_crossbar i_axi_full_crossbar
(
	.s_axi_awid    (6'b100100),
	.s_axi_awaddr  (s_axi_awaddr),
	.s_axi_awlen   (s_axi_awlen),
	.s_axi_awsize  (s_axi_awsize),
	.s_axi_awburst (s_axi_awburst),
	.s_axi_awlock  (3'b0),
	.s_axi_awcache (12'b0),
	.s_axi_awprot  (9'b0),
	.s_axi_awqos   (12'b0),
	.s_axi_awvalid (s_axi_awvalid),
	.s_axi_awready (s_axi_awready),
	.s_axi_wdata   (s_axi_wdata),
	.s_axi_wstrb   (s_axi_wstrb),
	.s_axi_wlast   (s_axi_wlast),
	.s_axi_wvalid  (s_axi_wvalid),
	.s_axi_wready  (s_axi_wready),
	.s_axi_bid     (),
	.s_axi_bresp   (s_axi_bresp),
	.s_axi_bvalid  (s_axi_bvalid),
	.s_axi_bready  (s_axi_bready),
	.s_axi_arid    (6'b100100),
	.s_axi_araddr  (s_axi_araddr),
	.s_axi_arlen   (s_axi_arlen),
	.s_axi_arsize  (s_axi_arsize),
	.s_axi_arburst (s_axi_arburst),
	.s_axi_arlock  (3'b0),
	.s_axi_arcache (12'b0),
	.s_axi_arprot  (9'b0),
	.s_axi_arqos   (12'b0),
	.s_axi_arvalid (s_axi_arvalid),
	.s_axi_arready (s_axi_arready),
	.s_axi_rid     (),
	.s_axi_rdata   (s_axi_rdata),
	.s_axi_rresp   (s_axi_rresp),
	.s_axi_rlast   (s_axi_rlast),
	.s_axi_rvalid  (s_axi_rvalid),
	.s_axi_rready  (s_axi_rready),
	.m_axi_awaddr  (m_axi_awaddr),
	.m_axi_awlen   (m_axi_awlen),
	.m_axi_awsize  (m_axi_awsize),
	.m_axi_awburst (m_axi_awburst),
	.m_axi_awlock  (),
	.m_axi_awcache (),
	.m_axi_awprot  (),
	.m_axi_awregion(),
	.m_axi_awqos   (),
	.m_axi_awvalid (m_axi_awvalid),
	.m_axi_awready (m_axi_awready),
	.m_axi_wdata   (m_axi_wdata),
	.m_axi_wstrb   (m_axi_wstrb),
	.m_axi_wlast   (m_axi_wlast),
	.m_axi_wvalid  (m_axi_wvalid),
	.m_axi_wready  (m_axi_wready),
	.m_axi_bresp   (m_axi_bresp),
	.m_axi_bvalid  (m_axi_bvalid),
	.m_axi_bready  (m_axi_bready),
	.m_axi_araddr  (m_axi_araddr),
	.m_axi_arlen   (m_axi_arlen),
	.m_axi_arsize  (m_axi_arsize),
	.m_axi_arburst (m_axi_arburst),
	.m_axi_arlock  (),
	.m_axi_arcache (),
	.m_axi_arprot  (),
	.m_axi_arregion(),
	.m_axi_arqos   (),
	.m_axi_arvalid (m_axi_arvalid),
	.m_axi_arready (m_axi_arready),
	.m_axi_rdata   (m_axi_rdata),
	.m_axi_rresp   (m_axi_rresp),
	.m_axi_rlast   (m_axi_rlast),
	.m_axi_rvalid  (m_axi_rvalid),
	.m_axi_rready  (m_axi_rready),

	.aclk          (CLK),
	.aresetn       (RSTn)
);















endmodule

