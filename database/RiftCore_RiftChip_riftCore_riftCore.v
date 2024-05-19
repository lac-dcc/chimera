// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: riftCore
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-19 14:09:26
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-15 18:14:43
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

module riftCore (

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

	output [31:0] SYS_AWADDR,
	output SYS_AWVALID,
	input SYS_AWREADY,
	output [63:0] SYS_WDATA,
	output [7:0] SYS_WSTRB,
	output SYS_WVALID,
	input SYS_WREADY,
	input [1:0] SYS_BRESP,
	input SYS_BVALID,
	output SYS_BREADY,
	output [31:0] SYS_ARADDR,
	output SYS_ARVALID,
	input SYS_ARREADY,
	input [63:0] SYS_RDATA,
	input [1:0] SYS_RRESP,
	input SYS_RVALID,
	output SYS_RREADY,

	input isExternInterrupt,
	input isRTimerInterrupt,
	input isSoftwvInterrupt,



	input CLK,
	input RSTn
	
);




wire instrFifo_push;
wire instrFifo_reject;
wire [`DECODE_INFO_DW-1:0] decode_microInstr_push;

wire feflush;
wire beflush;

wire [`DECODE_INFO_DW-1:0] decode_microInstr_pop;
wire instrFifo_pop;
wire instrFifo_empty;
wire jalr_valid;
wire [63:0] jalr_pc;

wire istakenBranch;
wire takenBranch_valid;

wire [63:0] privileged_pc;
wire privileged_valid;



wire isMisPredict_set;
wire isMisPredict_rst;
wire isMisPredict_qout;

assign isMisPredict_rst = beflush;
assign isMisPredict_set = feflush & ~beflush;


wire lsu_fencei_valid;


wire [31:0] IL1_ARADDR;
wire [7:0] IL1_ARLEN;
wire [1:0] IL1_ARBURST;
wire IL1_ARVALID;
wire IL1_ARREADY;
wire [63:0] IL1_RDATA;
wire [1:0] IL1_RRESP;
wire IL1_RLAST;
wire IL1_RVALID;
wire IL1_RREADY;


wire [31:0] DL1_AWADDR;
wire [7:0] DL1_AWLEN;
wire [1:0] DL1_AWBURST;
wire DL1_AWVALID;
wire DL1_AWREADY;
wire [63:0] DL1_WDATA;
wire [7:0] DL1_WSTRB;
wire DL1_WLAST;
wire DL1_WVALID;
wire DL1_WREADY;
wire [1:0] DL1_BRESP;
wire DL1_BVALID;
wire DL1_BREADY;
wire [31:0] DL1_ARADDR;
wire [7:0] DL1_ARLEN;
wire [1:0] DL1_ARBURST;
wire DL1_ARVALID;
wire DL1_ARREADY;
wire [63:0] DL1_RDATA;
wire [1:0] DL1_RRESP;
wire DL1_RLAST;
wire DL1_RVALID;
wire DL1_RREADY;

wire l2c_fence;
wire l2c_fence_end;
wire l3c_fence;
wire l3c_fence_end;

frontEnd i_frontEnd(
	.lsu_fencei_valid(lsu_fencei_valid),

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

	.instrFifo_reject(instrFifo_reject),
	.instrFifo_push(instrFifo_push),
	.decode_microInstr(decode_microInstr_push),

	.bru_res_valid(takenBranch_valid&~isMisPredict_qout),
	.bru_takenBranch(istakenBranch),

	.jalr_valid(jalr_valid&(~isMisPredict_qout)),
	.jalr_pc(jalr_pc),

	.privileged_pc(privileged_pc),
	.privileged_valid(privileged_valid),

	.flush(feflush),
	.CLK(CLK),
	.RSTn(RSTn)
	
);



instr_fifo #(.DW(`DECODE_INFO_DW),.AW(3)) i_instr_fifo(

	.instrFifo_pop(instrFifo_pop),
	.instrFifo_push(instrFifo_push),
	.decode_microInstr_push(decode_microInstr_push),

	.instrFifo_empty(instrFifo_empty),
	.instrFifo_reject(instrFifo_reject), 
	.decode_microInstr_pop(decode_microInstr_pop),

	.feflush(feflush),
	.CLK(CLK),
	.RSTn(RSTn)
);



backEnd i_backEnd(

	.DL1_AWADDR            (DL1_AWADDR),
	.DL1_AWLEN             (DL1_AWLEN),
	.DL1_AWBURST           (DL1_AWBURST),
	.DL1_AWVALID           (DL1_AWVALID),
	.DL1_AWREADY           (DL1_AWREADY),
	.DL1_WDATA             (DL1_WDATA),
	.DL1_WSTRB             (DL1_WSTRB),
	.DL1_WLAST             (DL1_WLAST),
	.DL1_WVALID            (DL1_WVALID),
	.DL1_WREADY            (DL1_WREADY),
	.DL1_BRESP             (DL1_BRESP),
	.DL1_BVALID            (DL1_BVALID),
	.DL1_BREADY            (DL1_BREADY),
	.DL1_ARADDR            (DL1_ARADDR),
	.DL1_ARLEN             (DL1_ARLEN),
	.DL1_ARBURST           (DL1_ARBURST),
	.DL1_ARVALID           (DL1_ARVALID),
	.DL1_ARREADY           (DL1_ARREADY),
	.DL1_RDATA             (DL1_RDATA),
	.DL1_RRESP             (DL1_RRESP),
	.DL1_RLAST             (DL1_RLAST),
	.DL1_RVALID            (DL1_RVALID),
	.DL1_RREADY            (DL1_RREADY),

	.SYS_AWADDR           (SYS_AWADDR),
	.SYS_AWVALID          (SYS_AWVALID),
	.SYS_AWREADY          (SYS_AWREADY),
	.SYS_WDATA            (SYS_WDATA),
	.SYS_WSTRB            (SYS_WSTRB),
	.SYS_WVALID           (SYS_WVALID),
	.SYS_WREADY           (SYS_WREADY),
	.SYS_BRESP            (SYS_BRESP),
	.SYS_BVALID           (SYS_BVALID),
	.SYS_BREADY           (SYS_BREADY),
	.SYS_ARADDR           (SYS_ARADDR),
	.SYS_ARVALID          (SYS_ARVALID),
	.SYS_ARREADY          (SYS_ARREADY),
	.SYS_RDATA            (SYS_RDATA),
	.SYS_RRESP            (SYS_RRESP),
	.SYS_RVALID           (SYS_RVALID),
	.SYS_RREADY           (SYS_RREADY),

	.l2c_fence             (l2c_fence),
	.l2c_fence_end         (l2c_fence_end),
	.l3c_fence             (l3c_fence),
	.l3c_fence_end         (l3c_fence_end),


	.lsu_fencei_valid(lsu_fencei_valid),

	.decode_microInstr_pop(decode_microInstr_pop),
	.instrFifo_pop(instrFifo_pop),
	.instrFifo_empty(instrFifo_empty | isMisPredict_qout),

	// to pcGen
	.jalr_valid_qout(jalr_valid),
	.jalr_pc_qout(jalr_pc),
	.isMisPredict(isMisPredict_qout),

	.takenBranch_qout(istakenBranch),
	.takenBranch_valid_qout(takenBranch_valid),

	.isFlush(beflush),

	.isExternInterrupt(isExternInterrupt),
	.isRTimerInterrupt(isRTimerInterrupt),
	.isSoftwvInterrupt(isSoftwvInterrupt),

	.privileged_pc(privileged_pc),
	.privileged_valid(privileged_valid),

	.CLK(CLK),
	.RSTn(RSTn)

);





gen_rsffr # (.DW(1)) isFlush_rsffr ( .set_in(isMisPredict_set), .rst_in(isMisPredict_rst), .qout(isMisPredict_qout), .CLK(CLK), .RSTn(RSTn));











cache i_cache
(
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

	.MEM_AWID     (MEM_AWID),
	.MEM_AWADDR   (MEM_AWADDR),
	.MEM_AWLEN    (MEM_AWLEN),
	.MEM_AWSIZE   (MEM_AWSIZE),
	.MEM_AWBURST  (MEM_AWBURST),
	.MEM_AWLOCK   (MEM_AWLOCK),
	.MEM_AWCACHE  (MEM_AWCACHE),
	.MEM_AWPROT   (MEM_AWPROT),
	.MEM_AWQOS    (MEM_AWQOS),
	.MEM_AWUSER   (MEM_AWUSER),
	.MEM_AWVALID  (MEM_AWVALID),
	.MEM_AWREADY  (MEM_AWREADY),
	.MEM_WDATA    (MEM_WDATA),
	.MEM_WSTRB    (MEM_WSTRB),
	.MEM_WLAST    (MEM_WLAST),
	.MEM_WUSER    (MEM_WUSER),
	.MEM_WVALID   (MEM_WVALID),
	.MEM_WREADY   (MEM_WREADY),
	.MEM_BID      (MEM_BID),
	.MEM_BRESP    (MEM_BRESP),
	.MEM_BUSER    (MEM_BUSER),
	.MEM_BVALID   (MEM_BVALID),
	.MEM_BREADY   (MEM_BREADY),
	.MEM_ARID     (MEM_ARID),
	.MEM_ARADDR   (MEM_ARADDR),
	.MEM_ARLEN    (MEM_ARLEN),
	.MEM_ARSIZE   (MEM_ARSIZE),
	.MEM_ARBURST  (MEM_ARBURST),
	.MEM_ARLOCK   (MEM_ARLOCK),
	.MEM_ARCACHE  (MEM_ARCACHE),
	.MEM_ARPROT   (MEM_ARPROT),
	.MEM_ARQOS    (MEM_ARQOS),
	.MEM_ARUSER   (MEM_ARUSER),
	.MEM_ARVALID  (MEM_ARVALID),
	.MEM_ARREADY  (MEM_ARREADY),
	.MEM_RID      (MEM_RID),
	.MEM_RDATA    (MEM_RDATA),
	.MEM_RRESP    (MEM_RRESP),
	.MEM_RLAST    (MEM_RLAST),
	.MEM_RUSER    (MEM_RUSER),
	.MEM_RVALID   (MEM_RVALID),
	.MEM_RREADY   (MEM_RREADY),


	.l2c_fence    (l2c_fence),
	.l2c_fence_end(l2c_fence_end),
	.l3c_fence    (l3c_fence),
	.l3c_fence_end(l3c_fence_end),

	.CLK          (CLK),
	.RSTn         (RSTn)
);


















endmodule














