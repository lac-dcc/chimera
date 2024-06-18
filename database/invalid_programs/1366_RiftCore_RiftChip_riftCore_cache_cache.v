// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: cache
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-26 15:39:04
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-15 17:32:49
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

`include "define.vh"


module cache (

	input [31:0] IL1_ARADDR,
	input [7:0] IL1_ARLEN,
	input [1:0] IL1_ARBURST,
	input IL1_ARVALID,
	output IL1_ARREADY,

	output [63:0] IL1_RDATA,
	output [1:0] IL1_RRESP,
	output IL1_RLAST,
	output IL1_RVALID,
	input IL1_RREADY,

	input [31:0] DL1_AWADDR,
	input [7:0] DL1_AWLEN,
	input [1:0] DL1_AWBURST,
	input DL1_AWVALID,
	output DL1_AWREADY,

	input [63:0] DL1_WDATA,
	input [7:0] DL1_WSTRB,
	input DL1_WLAST,
	input DL1_WVALID,
	output DL1_WREADY,

	output [1:0] DL1_BRESP,
	output DL1_BVALID,
	input DL1_BREADY,

	input [31:0] DL1_ARADDR,
	input [7:0] DL1_ARLEN,
	input [1:0] DL1_ARBURST,
	input DL1_ARVALID,
	output DL1_ARREADY,

	output [63:0] DL1_RDATA,
	output [1:0] DL1_RRESP,
	output DL1_RLAST,
	output DL1_RVALID,
	input DL1_RREADY,



	output [0:0] MEM_AWID,
	output [63:0] MEM_AWADDR,
	output [7:0] MEM_AWLEN,
	output [2:0] MEM_AWSIZE,
	output [1:0] MEM_AWBURST,
	output MEM_AWLOCK,
	output [3:0] MEM_AWCACHE,
	output [2:0] MEM_AWPROT,
	output [3:0] MEM_AWQOS,
	output [0:0] MEM_AWUSER,
	output MEM_AWVALID,
	input MEM_AWREADY,

	output [63:0] MEM_WDATA,
	output [7:0] MEM_WSTRB,
	output MEM_WLAST,
	output [0:0] MEM_WUSER,
	output MEM_WVALID,
	input MEM_WREADY,

	input [0:0] MEM_BID,
	input [1:0] MEM_BRESP,
	input [0:0] MEM_BUSER,
	input MEM_BVALID,
	output MEM_BREADY,

	output [0:0] MEM_ARID,
	output [63:0] MEM_ARADDR,
	output [7:0] MEM_ARLEN,
	output [2:0] MEM_ARSIZE,
	output [1:0] MEM_ARBURST,
	output MEM_ARLOCK,
	output [3:0] MEM_ARCACHE,
	output [2:0] MEM_ARPROT,
	output [3:0] MEM_ARQOS,
	output [0:0] MEM_ARUSER,
	output MEM_ARVALID,
	input MEM_ARREADY,

	input [0:0] MEM_RID,
	input [63:0] MEM_RDATA,
	input [1:0] MEM_RRESP,
	input MEM_RLAST,
	input [0:0] MEM_RUSER,
	input MEM_RVALID,
	output MEM_RREADY,


	input l2c_fence,
	output l2c_fence_end,
	input l3c_fence,
	output l3c_fence_end,

	input CLK,
	input RSTn

);







	//L3Cache
	wire [31:0] L2C_L3C_AWADDR;
	wire [7:0] L2C_L3C_AWLEN;
	wire [1:0] L2C_L3C_AWBURST;
	wire L2C_L3C_AWVALID;
	wire L2C_L3C_AWREADY;
	wire [63:0] L2C_L3C_WDATA;
	wire [7:0] L2C_L3C_WSTRB;
	wire L2C_L3C_WLAST;
	wire L2C_L3C_WVALID;
	wire L2C_L3C_WREADY;

	wire [1:0] L2C_L3C_BRESP;
	wire L2C_L3C_BVALID;
	wire L2C_L3C_BREADY;

	wire [31:0] L2C_L3C_ARADDR;
	wire [7:0] L2C_L3C_ARLEN;
	wire [1:0] L2C_L3C_ARBURST;
	wire L2C_L3C_ARVALID;
	wire L2C_L3C_ARREADY;

	wire [63:0] L2C_L3C_RDATA;
	wire [1:0] L2C_L3C_RRESP;
	wire L2C_L3C_RLAST;
	wire L2C_L3C_RVALID;
	wire L2C_L3C_RREADY;



L2cache i_L2cache(

	//L1 I Cache
	.IL1_ARADDR   (IL1_ARADDR),
	.IL1_ARLEN    (IL1_ARLEN),
	.IL1_ARBURST  (IL1_ARBURST),
	.IL1_ARVALID  (IL1_ARVALID),
	.IL1_ARREADY  (IL1_ARREADY),
	.IL1_RDATA    (IL1_RDATA),
	.IL1_RRESP    (IL1_RRESP),
	.IL1_RLAST    (IL1_RLAST),
	.IL1_RVALID   (IL1_RVALID),
	.IL1_RREADY   (IL1_RREADY),

	.DL1_AWADDR   (DL1_AWADDR),
	.DL1_AWLEN    (DL1_AWLEN),
	.DL1_AWBURST  (DL1_AWBURST),
	.DL1_AWVALID  (DL1_AWVALID),
	.DL1_AWREADY  (DL1_AWREADY),
	.DL1_WDATA    (DL1_WDATA),
	.DL1_WSTRB    (DL1_WSTRB),
	.DL1_WLAST    (DL1_WLAST),
	.DL1_WVALID   (DL1_WVALID),
	.DL1_WREADY   (DL1_WREADY),
	.DL1_BRESP    (DL1_BRESP),
	.DL1_BVALID   (DL1_BVALID),
	.DL1_BREADY   (DL1_BREADY),
	.DL1_ARADDR   (DL1_ARADDR),
	.DL1_ARLEN    (DL1_ARLEN),
	.DL1_ARBURST  (DL1_ARBURST),
	.DL1_ARVALID  (DL1_ARVALID),
	.DL1_ARREADY  (DL1_ARREADY),
	.DL1_RDATA    (DL1_RDATA),
	.DL1_RRESP    (DL1_RRESP),
	.DL1_RLAST    (DL1_RLAST),
	.DL1_RVALID   (DL1_RVALID),
	.DL1_RREADY   (DL1_RREADY),

	.MEM_AWADDR(L2C_L3C_AWADDR),
	.MEM_AWLEN(L2C_L3C_AWLEN),
	.MEM_AWBURST(L2C_L3C_AWBURST),
	.MEM_AWVALID(L2C_L3C_AWVALID),
	.MEM_AWREADY(L2C_L3C_AWREADY),
	.MEM_WDATA(L2C_L3C_WDATA),
	.MEM_WSTRB(L2C_L3C_WSTRB),
	.MEM_WLAST(L2C_L3C_WLAST),
	.MEM_WVALID(L2C_L3C_WVALID),
	.MEM_WREADY(L2C_L3C_WREADY),
	.MEM_BRESP(L2C_L3C_BRESP),
	.MEM_BVALID(L2C_L3C_BVALID),
	.MEM_BREADY(L2C_L3C_BREADY),
	.MEM_ARADDR(L2C_L3C_ARADDR),
	.MEM_ARLEN(L2C_L3C_ARLEN),
	.MEM_ARBURST(L2C_L3C_ARBURST),
	.MEM_ARVALID(L2C_L3C_ARVALID),
	.MEM_ARREADY(L2C_L3C_ARREADY),
	.MEM_RDATA(L2C_L3C_RDATA),
	.MEM_RRESP(L2C_L3C_RRESP),
	.MEM_RLAST(L2C_L3C_RLAST),
	.MEM_RVALID(L2C_L3C_RVALID),
	.MEM_RREADY(L2C_L3C_RREADY),

	.l2c_fence(l2c_fence),
	.l2c_fence_end(l2c_fence_end),
	.CLK(CLK),
	.RSTn(RSTn)
);


L3cache i_L3cache(

	//form L2cache
	.L2C_AWADDR(L2C_L3C_AWADDR),
	.L2C_AWLEN(L2C_L3C_AWLEN),
	.L2C_AWBURST(L2C_L3C_AWBURST),
	.L2C_AWVALID(L2C_L3C_AWVALID),
	.L2C_AWREADY(L2C_L3C_AWREADY),
	.L2C_WDATA(L2C_L3C_WDATA),
	.L2C_WSTRB(L2C_L3C_WSTRB),
	.L2C_WLAST(L2C_L3C_WLAST),
	.L2C_WVALID(L2C_L3C_WVALID),
	.L2C_WREADY(L2C_L3C_WREADY),
	.L2C_BRESP(L2C_L3C_BRESP),
	.L2C_BVALID(L2C_L3C_BVALID),
	.L2C_BREADY(L2C_L3C_BREADY),


	.L2C_ARADDR(L2C_L3C_ARADDR),
	.L2C_ARLEN(L2C_L3C_ARLEN),
	.L2C_ARBURST(L2C_L3C_ARBURST),
	.L2C_ARVALID(L2C_L3C_ARVALID),
	.L2C_ARREADY(L2C_L3C_ARREADY),
	.L2C_RDATA(L2C_L3C_RDATA),
	.L2C_RRESP(L2C_L3C_RRESP),
	.L2C_RLAST(L2C_L3C_RLAST),
	.L2C_RVALID(L2C_L3C_RVALID),
	.L2C_RREADY(L2C_L3C_RREADY),


	//from DDR
	.MEM_AWID(MEM_AWID),
	.MEM_AWADDR(MEM_AWADDR),
	.MEM_AWLEN(MEM_AWLEN),
	.MEM_AWSIZE(MEM_AWSIZE),
	.MEM_AWBURST(MEM_AWBURST),
	.MEM_AWLOCK(MEM_AWLOCK),
	.MEM_AWCACHE(MEM_AWCACHE),
	.MEM_AWPROT(MEM_AWPROT),
	.MEM_AWQOS(MEM_AWQOS),
	.MEM_AWUSER(MEM_AWUSER),
	.MEM_AWVALID(MEM_AWVALID),
	.MEM_AWREADY(MEM_AWREADY),

	.MEM_WDATA(MEM_WDATA),
	.MEM_WSTRB(MEM_WSTRB),
	.MEM_WLAST(MEM_WLAST),
	.MEM_WUSER(MEM_WUSER),
	.MEM_WVALID(MEM_WVALID),
	.MEM_WREADY(MEM_WREADY),

	.MEM_BID(MEM_BID),
	.MEM_BRESP(MEM_BRESP),
	.MEM_BUSER(MEM_BUSER),
	.MEM_BVALID(MEM_BVALID),
	.MEM_BREADY(MEM_BREADY),

	.MEM_ARID(MEM_ARID),
	.MEM_ARADDR(MEM_ARADDR),
	.MEM_ARLEN(MEM_ARLEN),
	.MEM_ARSIZE(MEM_ARSIZE),
	.MEM_ARBURST(MEM_ARBURST),
	.MEM_ARLOCK(MEM_ARLOCK),
	.MEM_ARCACHE(MEM_ARCACHE),
	.MEM_ARPROT(MEM_ARPROT),
	.MEM_ARQOS(MEM_ARQOS),
	.MEM_ARUSER(MEM_ARUSER),
	.MEM_ARVALID(MEM_ARVALID),
	.MEM_ARREADY(MEM_ARREADY),

	.MEM_RID(MEM_RID),
	.MEM_RDATA(MEM_RDATA),
	.MEM_RRESP(MEM_RRESP),
	.MEM_RLAST(MEM_RLAST),
	.MEM_RUSER(MEM_RUSER),
	.MEM_RVALID(MEM_RVALID),
	.MEM_RREADY(MEM_RREADY),

	.l3c_fence(l3c_fence),
	.l3c_fence_end(l3c_fence_end),
	.CLK(CLK),
	.RSTn(RSTn)

);










endmodule








