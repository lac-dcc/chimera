// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: commit
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-11 15:41:55
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 09:25:07
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

module commit (

	//from phyRegister
	output [ `RB*32 - 1 :0 ] archi_X_dnxt,
	input  [ `RB*32 - 1 :0 ] archi_X_qout,

	output [32*`RP-1 : 0] wbLog_commit_rst,
	input [32*`RP-1 : 0] wbLog_qout,

	output [32*`RP-1 : 0] rnBufU_commit_rst,

	//from reOrder FIFO
	input [`REORDER_INFO_DW-1:0] commit_fifo,
	input reOrder_fifo_empty,
	output reOrder_fifo_pop,

	input isMisPredict,
	input isLSUAccessFault,
	input isLSUMisAlign,
	input [63:0] lsu_trap_addr,

	output commit_abort,
	output [63:0] commit_pc,
	// output suILP_ready,
	output isSuCommited,
	output isFenceCommited,
	output bruILP_ready,

	output [63:0] privileged_pc,
	output isTrap,
	output isXRet,

	//from csrFiles
	output [63:0] mstatus_except_in,
	output [63:0] mtval_except_in,
	output [63:0] mcause_except_in,
	output [63:0] mepc_except_in,

	input [63:0] mstatus_csr_out,
	input [63:0] mip_csr_out,
	input [63:0] mie_csr_out,
	input [63:0] mepc_csr_out,
	input [63:0] mtvec_csr_out

);


	wire isException;

	wire [5+`RB-1:0] commit_rd0;
	wire isBranch;

	wire isSu;
	wire isLu;
	wire isFence;
	wire isCsr;

	wire isEcall;
	wire isEbreak;
	wire isMret;
	wire isInstrAccessFault;
	wire isIlleage;
	wire isLoadAccessFault_ACK;
	wire isStoreAccessFault_ACK;
	wire isLoadMisAlign_ACK;
	wire isStoreMisAlign_ACK;

	wire csrILP_ready = isCsr;

	wire commit_wb;
	wire commit_comfirm;

	assign isSuCommited = isSu & commit_wb;
	assign isFenceCommited = isFence & commit_wb;
	
	assign bruILP_ready = isBranch;
	assign isLoadAccessFault_ACK = isLSUAccessFault & isLu & ~commit_wb;
	assign isStoreAccessFault_ACK = isLSUAccessFault & isSu & ~commit_wb;
	assign isLoadMisAlign_ACK = isLSUMisAlign & isLu & ~commit_wb;
	assign isStoreMisAlign_ACK = isLSUMisAlign & isSu & ~commit_wb;

	assign {commit_pc, commit_rd0, isBranch, isLu, isSu, isFence, isCsr, isEcall, isEbreak, isMret, isInstrAccessFault, isIlleage} = commit_fifo;

	assign commit_abort = (~reOrder_fifo_empty) & 
							((isBranch & isMisPredict) 
							| isXRet
							| isTrap);

	assign rnBufU_commit_rst = wbLog_commit_rst;

	assign reOrder_fifo_pop = commit_comfirm;

	assign commit_wb = (wbLog_qout[commit_rd0] == 1'b1) & (~reOrder_fifo_empty);
	assign commit_comfirm = ~commit_abort & commit_wb; 

generate
	for ( genvar regNum = 0; regNum < 32; regNum = regNum + 1 ) begin

			assign archi_X_dnxt[regNum*`RB +: `RB] = (( regNum == commit_rd0[`RB +: 5] ) & commit_comfirm)
											? commit_rd0[`RB-1:0]
											: archi_X_qout[regNum*`RB +: `RB];

			assign wbLog_commit_rst[regNum*`RP +: `RP] = (( regNum == commit_rd0[`RB +: 5] ) & commit_comfirm)
														?	(1'b1 <<	archi_X_qout[regNum*`RB +: `RB])
														: {`RP{1'b0}};
	end
endgenerate






                                                                                                                                                                       
//                                                                                                                                                                dddddddd
// PPPPPPPPPPPPPPPPP                        iiii                            iiii  lllllll                                                                         d::::::d
// P::::::::::::::::P                      i::::i                          i::::i l:::::l                                                                         d::::::d
// P::::::PPPPPP:::::P                      iiii                            iiii  l:::::l                                                                         d::::::d
// PP:::::P     P:::::P                                                           l:::::l                                                                         d:::::d 
//   P::::P     P:::::Prrrrr   rrrrrrrrr  iiiiiiivvvvvvv           vvvvvvviiiiiii  l::::l     eeeeeeeeeeee       ggggggggg   ggggg    eeeeeeeeeeee        ddddddddd:::::d 
//   P::::P     P:::::Pr::::rrr:::::::::r i:::::i v:::::v         v:::::v i:::::i  l::::l   ee::::::::::::ee    g:::::::::ggg::::g  ee::::::::::::ee    dd::::::::::::::d 
//   P::::PPPPPP:::::P r:::::::::::::::::r i::::i  v:::::v       v:::::v   i::::i  l::::l  e::::::eeeee:::::ee g:::::::::::::::::g e::::::eeeee:::::ee d::::::::::::::::d 
//   P:::::::::::::PP  rr::::::rrrrr::::::ri::::i   v:::::v     v:::::v    i::::i  l::::l e::::::e     e:::::eg::::::ggggg::::::gge::::::e     e:::::ed:::::::ddddd:::::d 
//   P::::PPPPPPPPP     r:::::r     r:::::ri::::i    v:::::v   v:::::v     i::::i  l::::l e:::::::eeeee::::::eg:::::g     g:::::g e:::::::eeeee::::::ed::::::d    d:::::d 
//   P::::P             r:::::r     rrrrrrri::::i     v:::::v v:::::v      i::::i  l::::l e:::::::::::::::::e g:::::g     g:::::g e:::::::::::::::::e d:::::d     d:::::d 
//   P::::P             r:::::r            i::::i      v:::::v:::::v       i::::i  l::::l e::::::eeeeeeeeeee  g:::::g     g:::::g e::::::eeeeeeeeeee  d:::::d     d:::::d 
//   P::::P             r:::::r            i::::i       v:::::::::v        i::::i  l::::l e:::::::e           g::::::g    g:::::g e:::::::e           d:::::d     d:::::d 
// PP::::::PP           r:::::r           i::::::i       v:::::::v        i::::::il::::::le::::::::e          g:::::::ggggg:::::g e::::::::e          d::::::ddddd::::::dd
// P::::::::P           r:::::r           i::::::i        v:::::v         i::::::il::::::l e::::::::eeeeeeee   g::::::::::::::::g  e::::::::eeeeeeee   d:::::::::::::::::d
// P::::::::P           r:::::r           i::::::i         v:::v          i::::::il::::::l  ee:::::::::::::e    gg::::::::::::::g   ee:::::::::::::e    d:::::::::ddd::::d
// PPPPPPPPPP           rrrrrrr           iiiiiiii          vvv           iiiiiiiillllllll    eeeeeeeeeeeeee      gggggggg::::::g     eeeeeeeeeeeeee     ddddddddd   ddddd
//                                                                                                                        g:::::g                                         
//                                                                                                            gggggg      g:::::g                                         
//                                                                                                            g:::::gg   gg:::::g                                         
//                                                                                                             g::::::ggg:::::::g                                         
//                                                                                                              gg:::::::::::::g                                          
//                                                                                                                ggg::::::ggg                                            
//                                                                                                                   gggggg                                               





wire isXRet = isMret;
assign isTrap = isInterrupt | isException;

assign privileged_pc = ({64{isXRet}} & mepc_csr_out)
						|
						({64{isTrap}} & mtvec_csr_out);






initial $info("for tiny, extern interrupt will observer directly from csrfiles in this version");
wire isExInterrupt = mip_csr_out[11] & mie_csr_out[11] & mstatus_csr_out[3];
wire isTimeInterrupt = mip_csr_out[7] & mie_csr_out[7] & mstatus_csr_out[3];
wire isSoftInterrupt = mip_csr_out[3] & mie_csr_out[3] & mstatus_csr_out[3];

wire isInterrupt = isExInterrupt | isTimeInterrupt | isSoftInterrupt;

assign isException =
				  isEcall
				| isEbreak
				| isInstrAccessFault
				| isIlleage
				| isLoadAccessFault_ACK
				| isStoreAccessFault_ACK
				| isLoadMisAlign_ACK
				| isStoreMisAlign_ACK;

assign mcause_except_in[63] = isInterrupt;
assign mcause_except_in[62:0] = ({63{isEcall}} & 63'd11)
								| ({63{isEbreak}} & 63'd3)
								| ( {63{isExInterrupt}} & 63'd11 )
								| ( {63{isTimeInterrupt}} & 63'd7 )
								| ( {63{isSoftInterrupt}} & 63'd3 )
								| ( {63{isIlleage}} & 63'd2 )
								| ( {63{isInstrAccessFault}} & 63'd1 )
								| ( {63{isLoadAccessFault_ACK}} & 63'd5 )
								| ( {63{isStoreAccessFault_ACK}} & 63'd7 )
								| ( {63{isLoadMisAlign_ACK}} & 63'd4 )
								| ( {63{isStoreMisAlign_ACK}} & 63'd6 );

//Exception nedd undo, interrupt comes from outside and will no pop commit_pc
assign mepc_except_in = ({64{isException}} & commit_pc)
						|
						({64{isInterrupt}} & commit_pc);


assign mtval_except_in = ( {64{isLoadAccessFault_ACK | isStoreAccessFault_ACK | isLoadMisAlign_ACK | isStoreMisAlign_ACK}} & lsu_trap_addr);


assign mstatus_except_in[2:0] = 3'b0;
assign mstatus_except_in[3] = (isTrap & 1'b0) | (isXRet & mstatus_csr_out[7]); //MIE
assign mstatus_except_in[6:4] = 3'b0;
assign mstatus_except_in[7] = (isTrap & mstatus_csr_out[3]) | (isXRet & 1'b1); //MPIE
assign mstatus_except_in[10:8] = 3'b0;
assign mstatus_except_in[12:11] = 2'b11; //MPP
assign mstatus_except_in[63:13] = 51'b0;






endmodule


