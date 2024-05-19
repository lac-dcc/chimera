// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: backEnd
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-02 17:24:26
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 10:10:10
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

module backEnd (
	output [31:0] DL1_AWADDR,
	output [7:0] DL1_AWLEN,
	output [1:0] DL1_AWBURST,
	output DL1_AWVALID,
	input DL1_AWREADY,
	output [63:0] DL1_WDATA,
	output [7:0] DL1_WSTRB,
	output DL1_WLAST,
	output DL1_WVALID,
	input DL1_WREADY,
	input [1:0] DL1_BRESP,
	input DL1_BVALID,
	output DL1_BREADY,
	output [31:0] DL1_ARADDR,
	output [7:0] DL1_ARLEN,
	output [1:0] DL1_ARBURST,
	output DL1_ARVALID,
	input DL1_ARREADY,
	input [63:0] DL1_RDATA,
	input [1:0] DL1_RRESP,
	input DL1_RLAST,
	input DL1_RVALID,
	output DL1_RREADY,

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

	output lsu_fencei_valid,

	input [`DECODE_INFO_DW-1:0] decode_microInstr_pop,
	output instrFifo_pop,
	input instrFifo_empty,

	// to pcGen
	output jalr_valid_qout,
	output [63:0] jalr_pc_qout,
	input isMisPredict,

	output takenBranch_qout,
	output takenBranch_valid_qout,

	output isFlush,

	input isExternInterrupt,
	input isRTimerInterrupt,
	input isSoftwvInterrupt,

	output [63:0] privileged_pc,
	output privileged_valid,


	output l2c_fence,
	input l2c_fence_end,
	output l3c_fence,
	input l3c_fence_end,

	input CLK,
	input RSTn

);

	wire flush;
	assign isFlush = flush;


	wire [63:0] commit_pc;

	wire  [(64*`RP*32)-1:0] regFileX_dnxt;
	wire [(64*`RP*32)-1:0] regFileX_qout;
	wire [ `RB*32 - 1 :0 ] rnAct_X_dnxt;
	wire [ `RB*32 - 1 :0 ] rnAct_X_qout;
	wire [32*`RP-1 : 0] rnBufU_rename_set;
	wire [32*`RP-1 : 0] rnBufU_commit_rst;
	wire [32*`RP-1 : 0] rnBufU_qout;
	wire [32*`RP-1 : 0] wbLog_writeb_set;
	wire [32*`RP-1 : 0] wbLog_commit_rst;
	wire [32*`RP-1 : 0] wbLog_qout;
	wire [ `RB*32 - 1 :0 ] archi_X_dnxt;
	wire [ `RB*32 - 1 :0 ] archi_X_qout;



	//dispat to issue
	wire alu_buffer_pop;
	wire [$clog2(`ALU_ISSUE_INFO_DP)-1:0] alu_buffer_pop_index;
	wire [`ALU_ISSUE_INFO_DP-1:0] alu_buffer_malloc;
	wire [`ALU_ISSUE_INFO_DW*`ALU_ISSUE_INFO_DP-1 : 0] alu_issue_info;
	wire bru_fifo_pop;
	wire bru_fifo_push;
	wire bru_fifo_empty;
	wire [`BRU_ISSUE_INFO_DW-1:0] bru_issue_info;
	wire csr_fifo_pop;
	wire csr_fifo_empty;
	wire [`CSR_ISSUE_INFO_DW-1:0] csr_issue_info;
	wire lsu_fifo_pop;
	wire lsu_fifo_empty;
	wire [`LSU_ISSUE_INFO_DW-1:0] lsu_issue_info;
	wire mul_fifo_pop;
	wire mul_fifo_empty;
	wire [`MUL_ISSUE_INFO_DW-1:0] mul_issue_info;




	//issue to execute
	wire alu_exeparam_valid;
	wire [`ALU_EXEPARAM_DW-1:0] alu_exeparam;
	wire bru_exeparam_ready;
	wire bru_exeparam_valid;
	wire [`BRU_EXEPARAM_DW-1:0] bru_exeparam;
	wire csr_exeparam_valid;
	wire [`CSR_EXEPARAM_DW-1 :0] csr_exeparam;
	wire issue_lsu_ready;
	wire issue_lsu_valid;
	wire [`LSU_EXEPARAM_DW-1:0] issue_lsu_info;
	wire mul_exeparam_valid;
	wire mul_execute_ready;
	wire [`MUL_EXEPARAM_DW-1 :0] mul_exeparam;



	//execute to writeback
	wire alu_writeback_valid;
	wire [63:0] alu_res;
	wire [(5+`RB-1):0] alu_rd0;
	wire bru_writeback_valid;
	wire [(5+`RB-1):0] bru_rd0;
	wire [63:0] bru_res;
	wire lsu_wb_valid;
	wire [(5+`RB-1):0] lsu_wb_rd0;
	wire [63:0] lsu_wb_res;
	wire csr_writeback_valid;
	wire [(5+`RB-1):0] csr_rd0;
	wire [63:0] csr_res;
	wire mul_writeback_valid;
	wire [(5+`RB-1):0] mul_rd0;
	wire [63:0] mul_res;

	wire bruILP_ready;
	wire isSuCommited;
	wire isFenceCommited;
//C3


	wire [`REORDER_INFO_DW-1:0] dispat_info;
	wire reOrder_fifo_push;
	wire reOrder_fifo_full;
	wire reOrder_fifo_empty;
	wire reOrder_fifo_pop;
	wire [`REORDER_INFO_DW-1:0] commit_info;


	wire alu_buffer_push;
	wire alu_buffer_full;
	wire [`ALU_ISSUE_INFO_DW-1:0] alu_dispat_info;
	wire bru_dispat_push;
	wire bru_fifo_full;
	wire [`BRU_ISSUE_INFO_DW-1:0] bru_dispat_info;
	wire lsu_fifo_push;
	wire lsu_fifo_full;
	wire [`LSU_ISSUE_INFO_DW-1:0] lsu_dispat_info;
	wire csr_fifo_push;
	wire csr_fifo_full;
	wire [`CSR_ISSUE_INFO_DW-1:0] csr_dispat_info;
	wire mul_fifo_push;
	wire mul_fifo_full;
	wire [`MUL_ISSUE_INFO_DW-1:0] mul_dispat_info;

	//csrexe to csrFiles
	wire [11:0] csrexe_addr;
	wire [63:0] op;
	wire [63:0] csrexe_res;
	wire rw, rs, rc;


	//commit to csrFile
	wire [63:0] mstatus_except_in;
	wire [63:0] mtval_except_in;
	wire [63:0] mcause_except_in;
	wire [63:0] mepc_except_in;
	wire [63:0] mstatus_csr_out;
	wire [63:0] mip_csr_out;
	wire [63:0] mie_csr_out;
	wire [63:0] mepc_csr_out;
	wire [63:0] mtvec_csr_out;
	wire isTrap;
	wire isXRet;

	wire isLSUAccessFault;
	wire isLSUMisAlign;
	wire [63:0] lsu_trap_addr;


dispatch i_dispatch(
	.rnAct_X_dnxt(rnAct_X_dnxt),
	.rnAct_X_qout(rnAct_X_qout),

	.rnBufU_rename_set(rnBufU_rename_set),
	.rnBufU_qout(rnBufU_qout),

	//from instr fifo
	.decode_microInstr_pop(decode_microInstr_pop),
	.instrFifo_pop(instrFifo_pop),
	.instrFifo_empty(instrFifo_empty),

	.dispat_info(dispat_info),
	.reOrder_fifo_push(reOrder_fifo_push),
	.reOrder_fifo_full(reOrder_fifo_full),



	//to issue
	.alu_buffer_push(alu_buffer_push),
	.alu_buffer_full(alu_buffer_full),
	.alu_dispat_info(alu_dispat_info),

	.bru_fifo_push(bru_fifo_push),
	.bru_fifo_full(bru_fifo_full),
	.bru_dispat_info(bru_dispat_info),

	.lsu_fifo_push(lsu_fifo_push),
	.lsu_fifo_full(lsu_fifo_full),
	.lsu_dispat_info(lsu_dispat_info),
	.lsu_fifo_empty(lsu_fifo_empty),

	.csr_fifo_push(csr_fifo_push),
	.csr_fifo_full(csr_fifo_full),
	.csr_dispat_info(csr_dispat_info),

	.mul_fifo_push(mul_fifo_push),
	.mul_fifo_full(mul_fifo_full),
	.mul_dispat_info(mul_dispat_info)
);



//T3
issue_buffer #( .DW(`ALU_ISSUE_INFO_DW), .DP(`ALU_ISSUE_INFO_DP))
alu_issue_buffer
(
	.dispat_info(alu_dispat_info),
	.issue_info_qout(alu_issue_info),

	.buffer_push(alu_buffer_push),
	.buffer_pop(alu_buffer_pop),	

	.buffer_full(alu_buffer_full),
	.buffer_malloc_qout(alu_buffer_malloc),
	.pop_index(alu_buffer_pop_index),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)	
);

issue_fifo #( .DW(`BRU_ISSUE_INFO_DW), .DP(`BRU_ISSUE_INFO_DP))
bru_issue_fifo (
	.issue_info_push(bru_dispat_info),
	.issue_info_pop(bru_issue_info),

	.issue_push(bru_fifo_push),
	.issue_pop(bru_fifo_pop),
	.fifo_full(bru_fifo_full),
	.fifo_empty(bru_fifo_empty),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);

issue_fifo #(.DW(`LSU_ISSUE_INFO_DW), .DP(`LSU_ISSUE_INFO_DP))
lsu_issue_fifo
(
	.issue_info_push(lsu_dispat_info),
	.issue_info_pop(lsu_issue_info),

	.issue_push(lsu_fifo_push),
	.issue_pop(lsu_fifo_pop),
	.fifo_full(lsu_fifo_full),
	.fifo_empty(lsu_fifo_empty),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
	
);

issue_fifo #(.DW(`CSR_ISSUE_INFO_DW),.DP(`CSR_ISSUE_INFO_DP))
csr_issue_fifo
(
	.issue_info_push(csr_dispat_info),
	.issue_info_pop(csr_issue_info),

	.issue_push(csr_fifo_push),
	.issue_pop(csr_fifo_pop),	
	
	.fifo_full(csr_fifo_full),
	.fifo_empty(csr_fifo_empty),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)	
	
);

issue_fifo #(.DW(`MUL_ISSUE_INFO_DW),.DP(`MUL_ISSUE_INFO_DP))
mul_issue_fifo
(
	.issue_info_push(mul_dispat_info),
	.issue_info_pop(mul_issue_info),

	.issue_push(mul_fifo_push),
	.issue_pop(mul_fifo_pop),	
	
	.fifo_full(mul_fifo_full),
	.fifo_empty(mul_fifo_empty),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)	
	
);

//C4 and T4

alu_issue i_aluIssue(
	.alu_buffer_pop(alu_buffer_pop),
	.alu_buffer_pop_index(alu_buffer_pop_index),
	.alu_buffer_malloc(alu_buffer_malloc),
	.alu_issue_info(alu_issue_info),

	.alu_exeparam_valid_qout(alu_exeparam_valid),
	.alu_exeparam_qout(alu_exeparam),

	.wbLog_qout(wbLog_qout),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);

bru_issue i_bruIssue(
	.bru_fifo_pop(bru_fifo_pop),
	.bru_fifo_empty(bru_fifo_empty),
	.bru_issue_info(bru_issue_info),

	.bru_exeparam_ready(bru_exeparam_ready),
	.bru_exeparam_valid_qout(bru_exeparam_valid),
	.bru_exeparam_qout(bru_exeparam),
	.bruILP_ready(bruILP_ready),

	.wbLog_qout(wbLog_qout),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);



csr_issue i_csrIssue(
	.csr_fifo_pop(csr_fifo_pop),
	.csr_fifo_empty(csr_fifo_empty),
	.csr_issue_info(csr_issue_info),

	.csr_exeparam_valid_qout(csr_exeparam_valid),
	.csr_exeparam_qout(csr_exeparam),

	.wbLog_qout(wbLog_qout),

	//from commit
	.commit_pc(commit_pc),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);



lsu_issue i_lsuIssue(
	.lsu_fifo_pop(lsu_fifo_pop),
	.lsu_fifo_empty(lsu_fifo_empty),
	.lsu_issue_info(lsu_issue_info),

	.issue_lsu_ready (issue_lsu_ready),
	.issue_lsu_valid (issue_lsu_valid),
	.issue_lsu_info  (issue_lsu_info),

	.regFileX_read(regFileX_qout),
	.wbLog_qout(wbLog_qout),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);

mul_issue i_mulIssue(
	.mul_fifo_pop(mul_fifo_pop),
	.mul_fifo_empty(mul_fifo_empty),
	.mul_issue_info(mul_issue_info),

	.mul_execute_ready(mul_execute_ready),
	.mul_exeparam_valid_qout(mul_exeparam_valid),
	.mul_exeparam_qout(mul_exeparam),

	.wbLog_qout(wbLog_qout),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);




//C5 and T5
alu i_alu(
	.alu_exeparam_valid(alu_exeparam_valid),
	.alu_exeparam(alu_exeparam),

	.alu_writeback_valid(alu_writeback_valid),
	.alu_res_qout(alu_res),
	.alu_rd0_qout(alu_rd0),

	.regFileX_read(regFileX_qout),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)	
);

bru i_bru(

	.bru_exeparam_ready(bru_exeparam_ready),
	.bru_exeparam_valid(bru_exeparam_valid),
	.bru_exeparam(bru_exeparam), 

	.takenBranch_qout(takenBranch_qout),
	.takenBranch_valid_qout(takenBranch_valid_qout),
	.jalr_valid_qout(jalr_valid_qout),
	.jalr_pc_qout(jalr_pc_qout),

	.bru_writeback_valid(bru_writeback_valid),
	.bru_res_qout(bru_res),
	.bru_rd0_qout(bru_rd0),

	.regFileX_read(regFileX_qout),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);

csr i_csr(
	.csr_exeparam_valid(csr_exeparam_valid),
	.csr_exeparam(csr_exeparam),

	.csrexe_addr(csrexe_addr),
	.op(op),
	.csrexe_res(csrexe_res),
	.rw(rw),
	.rs(rs),
	.rc(rc),

	.csr_writeback_valid(csr_writeback_valid),
	.csr_res_qout(csr_res),
	.csr_rd0_qout(csr_rd0),

	.regFileX_read(regFileX_qout),

	.CLK(CLK),
	.RSTn(RSTn),
	.flush(flush)
);

// lsu i_lsu(
// 	.LSU_AWADDR(LSU_AWADDR),
// 	.LSU_AWPROT(LSU_AWPROT),
// 	.LSU_AWVALID(LSU_AWVALID),
// 	.LSU_AWREADY(LSU_AWREADY),
// 	.LSU_WDATA(LSU_WDATA),
// 	.LSU_WSTRB(LSU_WSTRB),
// 	.LSU_WVALID(LSU_WVALID),
// 	.LSU_WREADY(LSU_WREADY),
// 	.LSU_BRESP(LSU_BRESP),
// 	.LSU_BVALID(LSU_BVALID),
// 	.LSU_BREADY(LSU_BREADY),
// 	.LSU_ARADDR(LSU_ARADDR),
// 	.LSU_ARPROT(LSU_ARPROT),
// 	.LSU_ARVALID(LSU_ARVALID),
// 	.LSU_ARREADY(LSU_ARREADY),
// 	.LSU_RDATA(LSU_RDATA),
// 	.LSU_RRESP(LSU_RRESP),
// 	.LSU_RVALID(LSU_RVALID),
// 	.LSU_RREADY(LSU_RREADY),

// 	.lsu_fencei_valid(lsu_fencei_valid),

// 	.lsu_exeparam_ready(lsu_exeparam_ready),
// 	.lsu_exeparam_valid(lsu_exeparam_valid),
// 	.lsu_exeparam(lsu_exeparam),
	
// 	.lsu_writeback_valid(lsu_writeback_valid),
// 	.lsu_res_qout(lsu_res),
// 	.lsu_rd0_qout(lsu_rd0),

// 	.isLsuAccessFault(isLsuAccessFault),

// 	.flush(flush),
// 	.CLK(CLK),
// 	.RSTn(RSTn)
// );


lsu i_lsu 
(
	.DL1_AWADDR      (DL1_AWADDR),
	.DL1_AWLEN       (DL1_AWLEN),
	.DL1_AWBURST     (DL1_AWBURST),
	.DL1_AWVALID     (DL1_AWVALID),
	.DL1_AWREADY     (DL1_AWREADY),
	.DL1_WDATA       (DL1_WDATA),
	.DL1_WSTRB       (DL1_WSTRB),
	.DL1_WLAST       (DL1_WLAST),
	.DL1_WVALID      (DL1_WVALID),
	.DL1_WREADY      (DL1_WREADY),
	.DL1_BRESP       (DL1_BRESP),
	.DL1_BVALID      (DL1_BVALID),
	.DL1_BREADY      (DL1_BREADY),
	.DL1_ARADDR      (DL1_ARADDR),
	.DL1_ARLEN       (DL1_ARLEN),
	.DL1_ARBURST     (DL1_ARBURST),
	.DL1_ARVALID     (DL1_ARVALID),
	.DL1_ARREADY     (DL1_ARREADY),
	.DL1_RDATA       (DL1_RDATA),
	.DL1_RRESP       (DL1_RRESP),
	.DL1_RLAST       (DL1_RLAST),
	.DL1_RVALID      (DL1_RVALID),
	.DL1_RREADY      (DL1_RREADY),

	.SYS_AWADDR     (SYS_AWADDR),
	.SYS_AWVALID    (SYS_AWVALID),
	.SYS_AWREADY    (SYS_AWREADY),
	.SYS_WDATA      (SYS_WDATA),
	.SYS_WSTRB      (SYS_WSTRB),
	.SYS_WVALID     (SYS_WVALID),
	.SYS_WREADY     (SYS_WREADY),
	.SYS_BRESP      (SYS_BRESP),
	.SYS_BVALID     (SYS_BVALID),
	.SYS_BREADY     (SYS_BREADY),
	.SYS_ARADDR     (SYS_ARADDR),
	.SYS_ARVALID    (SYS_ARVALID),
	.SYS_ARREADY    (SYS_ARREADY),
	.SYS_RDATA      (SYS_RDATA),
	.SYS_RRESP      (SYS_RRESP),
	.SYS_RVALID     (SYS_RVALID),
	.SYS_RREADY     (SYS_RREADY),

	.lsu_fencei_valid(lsu_fencei_valid),

	.issue_lsu_ready (issue_lsu_ready),
	.issue_lsu_valid (issue_lsu_valid),
	.issue_lsu_info  (issue_lsu_info),
	.lsu_wb_valid    (lsu_wb_valid),
	.lsu_wb_res      (lsu_wb_res),
	.lsu_wb_rd0      (lsu_wb_rd0),

	.isSuCommited    (isSuCommited),
	.isFenceCommited (isFenceCommited),
	.isLSUAccessFault (isLSUAccessFault),
	.isLSUMisAlign    (isLSUMisAlign),
	.lsu_trap_addr   (lsu_trap_addr),


	.flush           (flush),
	.l2c_fence       (l2c_fence),
	.l2c_fence_end   (l2c_fence_end),
	.l3c_fence       (l3c_fence),
	.l3c_fence_end   (l3c_fence_end),

	.CLK             (CLK),
	.RSTn            (RSTn)
);






mul i_mul(
	.mul_exeparam_valid(mul_exeparam_valid),
	.mul_execute_ready(mul_execute_ready),
	.mul_exeparam(mul_exeparam),

	.mul_writeback_valid(mul_writeback_valid),
	.mul_res_qout(mul_res),
	.mul_rd0_qout(mul_rd0),

	.regFileX_read(regFileX_qout),

	.CLK(CLK),
	.RSTn(RSTn),
	.flush(flush)
);





//C6
writeBack i_writeBack(
	.regFileX_qout(regFileX_qout),
	.regFileX_dnxt(regFileX_dnxt),

	.wbLog_writeb_set(wbLog_writeb_set),

	.alu_writeback_valid(alu_writeback_valid),
	.alu_res(alu_res),
	.alu_rd0(alu_rd0),

	.bru_writeback_valid(bru_writeback_valid),
	.bru_res(bru_res),
	.bru_rd0(bru_rd0),

	.lsu_writeback_valid(lsu_wb_valid),
	.lsu_rd0(lsu_wb_rd0),
	.lsu_res(lsu_wb_res),

	.csr_writeback_valid(csr_writeback_valid),
	.csr_rd0(csr_rd0),
	.csr_res(csr_res),

	.mul_writeback_valid(mul_writeback_valid),
	.mul_rd0(mul_rd0),
	.mul_res(mul_res)

);

wire commit_abort;
//C7 and T7
commit i_commit(
	.archi_X_dnxt(archi_X_dnxt),
	.archi_X_qout(archi_X_qout),

	.wbLog_commit_rst(wbLog_commit_rst),
	.wbLog_qout(wbLog_qout),

	.rnBufU_commit_rst(rnBufU_commit_rst),

	.reOrder_fifo_pop(reOrder_fifo_pop),
	.reOrder_fifo_empty(reOrder_fifo_empty),
	.commit_fifo(commit_info),

	.isMisPredict(isMisPredict),
	.isLSUAccessFault (isLSUAccessFault),
	.isLSUMisAlign    (isLSUMisAlign),
	.lsu_trap_addr     (lsu_trap_addr),

	.commit_abort(commit_abort),
	.commit_pc(commit_pc),
	.bruILP_ready(bruILP_ready),
	.isSuCommited      (isSuCommited),
	.isFenceCommited   (isFenceCommited),

	.privileged_pc(privileged_pc),
	.isTrap(isTrap),
	.isXRet(isXRet),

	.mstatus_except_in(mstatus_except_in),
	.mtval_except_in(mtval_except_in),
	.mcause_except_in(mcause_except_in),
	.mepc_except_in(mepc_except_in),

	.mstatus_csr_out(mstatus_csr_out),
	.mip_csr_out(mip_csr_out),
	.mie_csr_out(mie_csr_out),
	.mepc_csr_out(mepc_csr_out),
	.mtvec_csr_out(mtvec_csr_out)

);

assign flush = commit_abort;

assign privileged_valid = (~reOrder_fifo_empty) & (isTrap | isXRet);





gen_fifo #(
	.DW(`REORDER_INFO_DW),
	.AW(4)
)
reOrder_fifo(

	.fifo_push(reOrder_fifo_push),
	.data_push(dispat_info),

	.fifo_empty(reOrder_fifo_empty), 
	.fifo_full(reOrder_fifo_full), 

	.data_pop(commit_info),
	.fifo_pop(reOrder_fifo_pop), 

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);


csrFiles i_csrFiles(

	.csrexe_addr(csrexe_addr),
	.op(op),
	.csrexe_res(csrexe_res),
	.rw(rw),
	.rs(rs),
	.rc(rc),

	.isTrap(isTrap),
	.isXRet(isXRet),
	.mstatus_except_in(mstatus_except_in),
	.mtval_except_in(mtval_except_in),
	.mcause_except_in(mcause_except_in),
	.mepc_except_in(mepc_except_in),

	.mstatus_csr_out(mstatus_csr_out),
	.mip_csr_out(mip_csr_out),
	.mie_csr_out(mie_csr_out),
	.mepc_csr_out(mepc_csr_out),
	.mtvec_csr_out(mtvec_csr_out),

	.isExternInterrupt(isExternInterrupt),
	.isRTimerInterrupt(isRTimerInterrupt),
	.isSoftwvInterrupt(isSoftwvInterrupt),

	.CLK(CLK),
	.RSTn(RSTn)
);







phyRegister i_phyRegister(

	.flush(flush),

	.regFileX_dnxt(regFileX_dnxt),
	.regFileX_qout(regFileX_qout), 

	.rnAct_X_dnxt(rnAct_X_dnxt),
	.rnAct_X_qout(rnAct_X_qout),

	.rnBufU_rename_set(rnBufU_rename_set),
	.rnBufU_commit_rst(rnBufU_commit_rst),
	.rnBufU_qout(rnBufU_qout),

	.wbLog_writeb_set(wbLog_writeb_set),
	.wbLog_commit_rst(wbLog_commit_rst),
	.wbLog_qout(wbLog_qout),

	.archi_X_dnxt(archi_X_dnxt),
	.archi_X_qout(archi_X_qout),

	.CLK(CLK),
	.RSTn(RSTn)
	
);




endmodule









