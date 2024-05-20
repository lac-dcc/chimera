// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: csrFiles
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-17 09:46:11
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-05 15:39:09
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



module csrFiles (

	//from csr exe
	input [11:0] csrexe_addr,
	input [63:0] op,
	output [63:0] csrexe_res,
	input rw,
	input rs,
	input rc,





	//from privileged
	input isTrap,
	input isXRet,
	input [63:0] mstatus_except_in,
	input [63:0] mtval_except_in,
	input [63:0] mcause_except_in,
	input [63:0] mepc_except_in,

	output [63:0] mstatus_csr_out,
	output [63:0] mip_csr_out,
	output [63:0] mie_csr_out,
	output [63:0] mepc_csr_out,
	output [63:0] mtvec_csr_out,

	//from outside

	input isExternInterrupt,
	input isRTimerInterrupt,
	input isSoftwvInterrupt,

	input CLK,
	input RSTn
);

wire [63:0] mstatus_qout;

wire [31:0] mvendorid;
wire [63:0] marchid;
wire [63:0] mimpid;
wire [63:0] mhartid;
wire [63:0] mstatus;
wire [63:0] misa;
wire [63:0] medeleg;
wire [63:0] mideleg;
wire [63:0] mie;
wire [63:0] mtvec;
wire [63:0] mcounteren;
wire [63:0] mstatush;
wire [63:0] mscratch;
wire [63:0] mepc;
wire [63:0] mcause;
wire [63:0] mtval;
wire [63:0] mip;
wire [63:0] mcycle;
wire [63:0] minstret;
wire [63:0] mhpmcounter3;
wire [63:0] dcsr;
wire [63:0] dpc;
wire [63:0] dscratch0;
wire [63:0] dscratch1;



assign mstatus_csr_out = mstatus;
assign mie_csr_out = mie;
assign mip_csr_out = mip;
assign mepc_csr_out = mepc;
assign mtvec_csr_out = mtvec;



// Machine Information Registers

//0xF11
assign mvendorid = 32'd0;
//0xf12
assign marchid = 64'd0;
//0xf13
assign mimpid = 64'd0;
//0xf14
assign mhartid = 64'd0;


//Machine Trap Setup

//0x300
gen_csrreg #(.CSRADDR(12'h300)) mstatus_csrreg
( .privi_data(mstatus_except_in), .isPrivi(isTrap | isXRet),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mstatus_qout), .CLK(CLK), .RSTn(RSTn)
);

assign mstatus = mstatus_qout | 64'h1800;


//0x301
assign misa = {2'b10,36'b0,26'b00000000000001000100000100};

//0x302
gen_csrreg #(.CSRADDR(12'h302)) medeleg_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(medeleg), .CLK(CLK), .RSTn(RSTn)
);

//0x303
gen_csrreg #(.CSRADDR(12'h303)) mideleg_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mideleg), .CLK(CLK), .RSTn(RSTn)
);

//0x304
gen_csrreg #(.CSRADDR(12'h304)) mie_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mie), .CLK(CLK), .RSTn(RSTn)
);

//0x305
gen_csrreg #(.CSRADDR(12'h305)) mtvec_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mtvec), .CLK(CLK), .RSTn(RSTn)
);

//0x306
gen_csrreg #(.CSRADDR(12'h306)) mcounteren_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mcounteren), .CLK(CLK), .RSTn(RSTn)
);

//0x310
gen_csrreg #(.CSRADDR(12'h310)) mstatush_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mstatush), .CLK(CLK), .RSTn(RSTn)
);

//Machine Trap Handling

//0x340
gen_csrreg #(.CSRADDR(12'h340)) mscratch_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mscratch), .CLK(CLK), .RSTn(RSTn)
);

//0x341
gen_csrreg #(.CSRADDR(12'h341)) mepc_csrreg
( .privi_data(mepc_except_in), .isPrivi(isTrap),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mepc), .CLK(CLK), .RSTn(RSTn)
);

//0x342
gen_csrreg #(.CSRADDR(12'h342)) mcause_csrreg
( .privi_data(mcause_except_in), .isPrivi(isTrap),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mcause), .CLK(CLK), .RSTn(RSTn)
);

//0x343
gen_csrreg #(.CSRADDR(12'h343)) mtval_csrreg
( .privi_data(mtval_except_in), .isPrivi(isTrap),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mtval), .CLK(CLK), .RSTn(RSTn)
);

//0x344
assign mip = isExternInterrupt << 11 | isRTimerInterrupt << 7 | isSoftwvInterrupt << 3;

//Machine Memory Protection

//Machine Counter/Timer

//0xb00
gen_csrreg #(.CSRADDR(12'hb00)) mcycle_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mcycle), .CLK(CLK), .RSTn(RSTn)
);

//0xb02
gen_csrreg #(.CSRADDR(12'hb02)) minstret_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(minstret), .CLK(CLK), .RSTn(RSTn)
);

//0xb03
gen_csrreg #(.CSRADDR(12'hb03)) mhpmcounter3_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(mhpmcounter3), .CLK(CLK), .RSTn(RSTn)
);


//Machine Counter Setup

//Debug/Trace Register

//Debug Mode Register

//0x7b0
gen_csrreg #(.CSRADDR(12'h7b0)) dcsr_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(dcsr), .CLK(CLK), .RSTn(RSTn)
);

//0x7b1
gen_csrreg #(.CSRADDR(12'h7b1)) dpc_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(dpc), .CLK(CLK), .RSTn(RSTn)
);

//0x7b2
gen_csrreg #(.CSRADDR(12'h7b2)) dscratch0_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(dscratch0), .CLK(CLK), .RSTn(RSTn)
);

//0x7b3
gen_csrreg #(.CSRADDR(12'h7b3)) dscratch1_csrreg
( .privi_data(64'b0), .isPrivi(1'b0),
	.csr_op(op), .addr(csrexe_addr), .rw(rw), .rs(rs), .rc(rc),
	.qout(dscratch1), .CLK(CLK), .RSTn(RSTn)
);






assign csrexe_res = ({64{csrexe_addr == 12'hF11}} & {32'b0,mvendorid})
					|
					({64{csrexe_addr == 12'hF12}} & marchid)
					|
					({64{csrexe_addr == 12'hF13}} & mimpid)
					|
					({64{csrexe_addr == 12'hF14}} & mhartid)
					|
					({64{csrexe_addr == 12'h300}} & mstatus)
					|
					({64{csrexe_addr == 12'h301}} & misa)
					|
					({64{csrexe_addr == 12'h304}} & mie)
					|
					({64{csrexe_addr == 12'h340}} & mscratch)
					|
					({64{csrexe_addr == 12'h305}} & mtvec)
					|
					({64{csrexe_addr == 12'h341}} & mepc)
					|
					({64{csrexe_addr == 12'h342}} & mcause)
					|
					({64{csrexe_addr == 12'h343}} & mtval)
					|
					({64{csrexe_addr == 12'h344}} & mip)
					;




endmodule











