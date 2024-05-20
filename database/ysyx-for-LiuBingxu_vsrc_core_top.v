// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the top design module for cpu core
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

module core_top#(parameter MHARTID = 0,RST_PC=64'h0)(
    input                   clk,
    input                   rst_n,
//interface with interrupt sign
    input                   stip_asyn,
    input                   seip_asyn,
    input                   ssip_asyn,
    input                   mtip_asyn,
    input                   meip_asyn,
    input                   msip_asyn,
//interface with mmu
    output        	        MXR,
    output        	        SUM,
    output        	        MPRV,
    output [1:0]  	        MPP,
    output [3:0]            satp_mode,
    output [15:0]           satp_asid,
    output [43:0]           satp_ppn,
//interface with Icache
    //read addr channel
    input                   ifu_arready,
    output                  ifu_arvalid,
    output [63:0]           ifu_araddr,
    //read data channel
    input                   ifu_rvalid,
    output                  ifu_rready,
    input  [1:0]            ifu_rresp,
    input  [31:0]           ifu_rdata,
//interface with dcache
    //read addr channel
    output                  lsu_arvalid,
    input                   lsu_arready,
    output                  lsu_arlock,
    output  [2:0]           lsu_arsize,
    output  [63:0]          lsu_araddr,
    //read data channel
    input                   lsu_rvalid,
    output                  lsu_rready,
    input  [1:0]            lsu_rresp,
    input  [63:0]           lsu_rdata,
    //write addr channel
    output                  lsu_awvalid,
    input                   lsu_awready,
    output                  lsu_awlock,
    output  [2:0]           lsu_awsize,
    output  [63:0]          lsu_awaddr,
    //write data channel
    output                  lsu_wvalid,
    input                   lsu_wready,
    output [7:0]            lsu_wstrob,
    output [63:0]           lsu_wdata,
    //write resp channel
    input                   lsu_bvalid,
    output                  lsu_bready,
    input  [1:0]            lsu_bresp
);

wire            jump_flag;
wire [63:0]     jump_addr;

// ifu outports wire
wire        	IF_ID_reg_inst_valid;
wire        	IF_ID_reg_inst_compress_flag;
wire [1:0]  	IF_ID_reg_rresp;
wire [15:0] 	IF_ID_reg_inst_compress;
wire [31:0] 	IF_ID_reg_inst;
wire [63:0] 	IF_ID_reg_PC;

// idu outports wire
wire        	ID_IF_inst_ready;
wire        	ID_IF_flush_flag;
wire        	ID_EX_reg_decode_valid;
wire [4:0]  	rs1;
wire [4:0]  	rs2;
wire [63:0] 	ID_EX_reg_PC;
wire [63:0] 	ID_EX_reg_next_PC;
wire [31:0] 	ID_EX_reg_inst;
wire [4:0]  	ID_EX_reg_rd;
wire        	ID_EX_reg_dest_wen;
wire        	ID_EX_reg_sub;
wire        	ID_EX_reg_word;
wire        	ID_EX_reg_logic_valid;
wire        	ID_EX_reg_logic_or;
wire        	ID_EX_reg_logic_xor;
wire        	ID_EX_reg_logic_and;
wire        	ID_EX_reg_load_valid;
wire        	ID_EX_reg_load_signed;
wire        	ID_EX_reg_load_byte;
wire        	ID_EX_reg_load_half;
wire        	ID_EX_reg_load_word;
wire        	ID_EX_reg_load_double;
wire        	ID_EX_reg_store_valid;
wire        	ID_EX_reg_store_byte;
wire        	ID_EX_reg_store_half;
wire        	ID_EX_reg_store_word;
wire        	ID_EX_reg_store_double;
wire [63:0] 	ID_EX_reg_store_data;
wire        	ID_EX_reg_branch_valid;
wire        	ID_EX_reg_branch_ne;
wire        	ID_EX_reg_branch_eq;
wire        	ID_EX_reg_branch_lt;
wire        	ID_EX_reg_branch_ge;
wire        	ID_EX_reg_branch_signed;
wire        	ID_EX_reg_shift_valid;
wire        	ID_EX_reg_shift_al;
wire        	ID_EX_reg_shift_lr;
wire        	ID_EX_reg_shift_word;
wire        	ID_EX_reg_set_valid;
wire        	ID_EX_reg_set_signed;
wire        	ID_EX_reg_jump_valid;
wire        	ID_EX_reg_csr_valid;
wire        	ID_EX_reg_csr_wen;
wire        	ID_EX_reg_csr_ren;
wire [11:0] 	ID_EX_reg_csr_addr;
wire [11:0] 	ID_WB_csr_addr;
wire        	ID_EX_reg_csr_set;
wire        	ID_EX_reg_csr_clear;
wire        	ID_EX_reg_csr_swap;
wire        	ID_EX_reg_mul_valid;
wire        	ID_EX_reg_mul_high;
wire [1:0]  	ID_EX_reg_mul_signed;
wire        	ID_EX_reg_mul_word;
wire        	ID_EX_reg_div_valid;
wire        	ID_EX_reg_div_signed;
wire        	ID_EX_reg_div_rem;
wire        	ID_EX_reg_div_word;
wire        	ID_EX_reg_atomic_valid;
wire        	ID_EX_reg_atomic_word;
wire        	ID_EX_reg_atomic_lr;
wire        	ID_EX_reg_atomic_sc;
wire        	ID_EX_reg_atomic_swap;
wire        	ID_EX_reg_atomic_add;
wire        	ID_EX_reg_atomic_xor;
wire        	ID_EX_reg_atomic_and;
wire        	ID_EX_reg_atomic_or;
wire        	ID_EX_reg_atomic_min;
wire        	ID_EX_reg_atomic_max;
wire        	ID_EX_reg_atomic_signed;
wire        	ID_EX_reg_trap_valid;
wire        	ID_EX_reg_mret_valid;
wire        	ID_EX_reg_sret_valid;
wire [63:0] 	ID_EX_reg_trap_cause;
wire [63:0] 	ID_EX_reg_trap_tval;
wire [63:0] 	ID_EX_reg_operand1;
wire [63:0] 	ID_EX_reg_operand2;
wire [62:0] 	ID_EX_reg_operand3;
wire [62:0] 	ID_EX_reg_operand4;

// exu outports wire
wire        	EX_ID_flush_flag;
wire        	EX_ID_decode_ready;
wire        	EX_LS_reg_execute_valid;
wire [63:0] 	EX_LS_reg_PC;
wire [63:0] 	EX_LS_reg_next_PC;
wire [31:0] 	EX_LS_reg_inst;
wire [4:0]  	EX_LS_reg_rd;
wire        	EX_LS_reg_dest_wen;
wire        	EX_LS_reg_load_valid;
wire        	EX_LS_reg_load_signed;
wire        	EX_LS_reg_load_byte;
wire        	EX_LS_reg_load_half;
wire        	EX_LS_reg_load_word;
wire        	EX_LS_reg_load_double;
wire        	EX_LS_reg_store_valid;
wire        	EX_LS_reg_store_byte;
wire        	EX_LS_reg_store_half;
wire        	EX_LS_reg_store_word;
wire        	EX_LS_reg_store_double;
wire [63:0] 	EX_LS_reg_store_data;
wire        	EX_LS_reg_csr_wen;
wire        	EX_LS_reg_csr_ren;
wire [11:0] 	EX_LS_reg_csr_addr;
wire        	EX_LS_reg_atomic_valid;
wire        	EX_LS_reg_atomic_word;
wire        	EX_LS_reg_atomic_lr;
wire        	EX_LS_reg_atomic_sc;
wire        	EX_LS_reg_atomic_swap;
wire        	EX_LS_reg_atomic_add;
wire        	EX_LS_reg_atomic_xor;
wire        	EX_LS_reg_atomic_and;
wire        	EX_LS_reg_atomic_or;
wire        	EX_LS_reg_atomic_min;
wire        	EX_LS_reg_atomic_max;
wire        	EX_LS_reg_atomic_signed;
wire        	EX_LS_reg_trap_valid;
wire        	EX_LS_reg_mret_valid;
wire        	EX_LS_reg_sret_valid;
wire [63:0] 	EX_LS_reg_trap_cause;
wire [63:0] 	EX_LS_reg_trap_tval;
wire [63:0] 	EX_LS_reg_operand;
wire        	EX_IF_jump_flag;
wire [63:0] 	EX_IF_jump_addr;

// lsu outports wire
wire        	LS_EX_flush_flag;
wire        	LS_EX_execute_ready;
wire        	LS_WB_reg_ls_valid;
wire [63:0] 	LS_WB_reg_PC;
wire [63:0] 	LS_WB_reg_next_PC;
wire [31:0] 	LS_WB_reg_inst;
wire        	LS_WB_reg_trap_valid;
wire        	LS_WB_reg_mret_valid;
wire        	LS_WB_reg_sret_valid;
wire [63:0] 	LS_WB_reg_trap_cause;
wire [63:0] 	LS_WB_reg_trap_tval;
wire        	LS_WB_reg_csr_wen;
wire        	LS_WB_reg_csr_ren;
wire [11:0] 	LS_WB_reg_csr_addr;
wire [4:0]  	LS_WB_reg_rd;
wire        	LS_WB_reg_dest_wen;
wire [63:0] 	LS_WB_reg_data;

// wbu outports wire
wire [1:0]  	current_priv_status;
wire        	WB_IF_jump_flag;
wire [63:0] 	WB_IF_jump_addr;
wire [63:0] 	WB_ID_src1;
wire [63:0] 	WB_ID_src2;
wire [63:0] 	WB_ID_csr_rdata;
wire        	TSR;
wire        	TW;
wire        	TVM;
wire        	WB_EX_interrupt_flag;
wire        	WB_LS_ls_ready;
wire        	WB_LS_flush_flag;

ifu #(RST_PC)u_ifu(
    .clk                          	( clk                           ),
    .rst_n                        	( rst_n                         ),
    .jump_flag                    	( jump_flag                     ),
    .jump_addr                    	( jump_addr                     ),
    .ifu_arready                  	( ifu_arready                   ),
    .ifu_arvalid                  	( ifu_arvalid                   ),
    .ifu_araddr                   	( ifu_araddr                    ),
    .ifu_rvalid                   	( ifu_rvalid                    ),
    .ifu_rready                   	( ifu_rready                    ),
    .ifu_rresp                    	( ifu_rresp                     ),
    .ifu_rdata                    	( ifu_rdata                     ),
    .IF_ID_reg_inst_valid         	( IF_ID_reg_inst_valid          ),
    .ID_IF_inst_ready             	( ID_IF_inst_ready              ),
    .ID_IF_flush_flag             	( ID_IF_flush_flag              ),
    .IF_ID_reg_inst_compress_flag 	( IF_ID_reg_inst_compress_flag  ),
    .IF_ID_reg_rresp              	( IF_ID_reg_rresp               ),
    .IF_ID_reg_inst_compress      	( IF_ID_reg_inst_compress       ),
    .IF_ID_reg_inst               	( IF_ID_reg_inst                ),
    .IF_ID_reg_PC                 	( IF_ID_reg_PC                  )
);

idu u_idu(
    .clk                          	( clk                           ),
    .rst_n                        	( rst_n                         ),
    .current_priv_status          	( current_priv_status           ),
    .IF_ID_reg_rresp              	( IF_ID_reg_rresp               ),
    .IF_ID_reg_inst_compress      	( IF_ID_reg_inst_compress       ),
    .IF_ID_reg_inst               	( IF_ID_reg_inst                ),
    .IF_ID_reg_PC                 	( IF_ID_reg_PC                  ),
    .IF_ID_reg_inst_valid         	( IF_ID_reg_inst_valid          ),
    .IF_ID_reg_inst_compress_flag 	( IF_ID_reg_inst_compress_flag  ),
    .ID_IF_inst_ready             	( ID_IF_inst_ready              ),
    .ID_IF_flush_flag             	( ID_IF_flush_flag              ),
    .EX_IF_jump_flag                ( EX_IF_jump_flag               ),
    .ID_EX_reg_decode_valid       	( ID_EX_reg_decode_valid        ),
    .EX_ID_decode_ready           	( EX_ID_decode_ready            ),
    .EX_ID_flush_flag             	( EX_ID_flush_flag              ),
    .rs1                          	( rs1                           ),
    .rs2                          	( rs2                           ),
    .WB_ID_src1                   	( WB_ID_src1                    ),
    .WB_ID_src2                   	( WB_ID_src2                    ),
    .ID_EX_reg_PC                 	( ID_EX_reg_PC                  ),
    .ID_EX_reg_next_PC            	( ID_EX_reg_next_PC             ),
    .ID_EX_reg_inst               	( ID_EX_reg_inst                ),
    .ID_EX_reg_rd                 	( ID_EX_reg_rd                  ),
    .ID_EX_reg_dest_wen           	( ID_EX_reg_dest_wen            ),
    .ID_EX_reg_sub                	( ID_EX_reg_sub                 ),
    .ID_EX_reg_word               	( ID_EX_reg_word                ),
    .ID_EX_reg_logic_valid        	( ID_EX_reg_logic_valid         ),
    .ID_EX_reg_logic_or           	( ID_EX_reg_logic_or            ),
    .ID_EX_reg_logic_xor          	( ID_EX_reg_logic_xor           ),
    .ID_EX_reg_logic_and          	( ID_EX_reg_logic_and           ),
    .ID_EX_reg_load_valid         	( ID_EX_reg_load_valid          ),
    .ID_EX_reg_load_signed        	( ID_EX_reg_load_signed         ),
    .ID_EX_reg_load_byte          	( ID_EX_reg_load_byte           ),
    .ID_EX_reg_load_half          	( ID_EX_reg_load_half           ),
    .ID_EX_reg_load_word          	( ID_EX_reg_load_word           ),
    .ID_EX_reg_load_double        	( ID_EX_reg_load_double         ),
    .ID_EX_reg_store_valid        	( ID_EX_reg_store_valid         ),
    .ID_EX_reg_store_byte         	( ID_EX_reg_store_byte          ),
    .ID_EX_reg_store_half         	( ID_EX_reg_store_half          ),
    .ID_EX_reg_store_word         	( ID_EX_reg_store_word          ),
    .ID_EX_reg_store_double       	( ID_EX_reg_store_double        ),
    .ID_EX_reg_store_data         	( ID_EX_reg_store_data          ),
    .ID_EX_reg_branch_valid       	( ID_EX_reg_branch_valid        ),
    .ID_EX_reg_branch_ne          	( ID_EX_reg_branch_ne           ),
    .ID_EX_reg_branch_eq          	( ID_EX_reg_branch_eq           ),
    .ID_EX_reg_branch_lt          	( ID_EX_reg_branch_lt           ),
    .ID_EX_reg_branch_ge          	( ID_EX_reg_branch_ge           ),
    .ID_EX_reg_branch_signed      	( ID_EX_reg_branch_signed       ),
    .ID_EX_reg_shift_valid        	( ID_EX_reg_shift_valid         ),
    .ID_EX_reg_shift_al           	( ID_EX_reg_shift_al            ),
    .ID_EX_reg_shift_lr           	( ID_EX_reg_shift_lr            ),
    .ID_EX_reg_shift_word         	( ID_EX_reg_shift_word          ),
    .ID_EX_reg_set_valid          	( ID_EX_reg_set_valid           ),
    .ID_EX_reg_set_signed         	( ID_EX_reg_set_signed          ),
    .ID_EX_reg_jump_valid         	( ID_EX_reg_jump_valid          ),
    .ID_EX_reg_csr_valid          	( ID_EX_reg_csr_valid           ),
    .ID_EX_reg_csr_wen            	( ID_EX_reg_csr_wen             ),
    .ID_EX_reg_csr_ren            	( ID_EX_reg_csr_ren             ),
    .ID_EX_reg_csr_addr           	( ID_EX_reg_csr_addr            ),
    .ID_WB_csr_addr               	( ID_WB_csr_addr                ),
    .WB_ID_csr_rdata              	( WB_ID_csr_rdata               ),
    .ID_EX_reg_csr_set            	( ID_EX_reg_csr_set             ),
    .ID_EX_reg_csr_clear          	( ID_EX_reg_csr_clear           ),
    .ID_EX_reg_csr_swap           	( ID_EX_reg_csr_swap            ),
    .ID_EX_reg_mul_valid          	( ID_EX_reg_mul_valid           ),
    .ID_EX_reg_mul_high           	( ID_EX_reg_mul_high            ),
    .ID_EX_reg_mul_signed         	( ID_EX_reg_mul_signed          ),
    .ID_EX_reg_mul_word           	( ID_EX_reg_mul_word            ),
    .ID_EX_reg_div_valid          	( ID_EX_reg_div_valid           ),
    .ID_EX_reg_div_signed         	( ID_EX_reg_div_signed          ),
    .ID_EX_reg_div_rem            	( ID_EX_reg_div_rem             ),
    .ID_EX_reg_div_word           	( ID_EX_reg_div_word            ),
    .ID_EX_reg_atomic_valid       	( ID_EX_reg_atomic_valid        ),
    .ID_EX_reg_atomic_word        	( ID_EX_reg_atomic_word         ),
    .ID_EX_reg_atomic_lr          	( ID_EX_reg_atomic_lr           ),
    .ID_EX_reg_atomic_sc          	( ID_EX_reg_atomic_sc           ),
    .ID_EX_reg_atomic_swap        	( ID_EX_reg_atomic_swap         ),
    .ID_EX_reg_atomic_add         	( ID_EX_reg_atomic_add          ),
    .ID_EX_reg_atomic_xor         	( ID_EX_reg_atomic_xor          ),
    .ID_EX_reg_atomic_and         	( ID_EX_reg_atomic_and          ),
    .ID_EX_reg_atomic_or          	( ID_EX_reg_atomic_or           ),
    .ID_EX_reg_atomic_min         	( ID_EX_reg_atomic_min          ),
    .ID_EX_reg_atomic_max         	( ID_EX_reg_atomic_max          ),
    .ID_EX_reg_atomic_signed      	( ID_EX_reg_atomic_signed       ),
    .ID_EX_reg_trap_valid         	( ID_EX_reg_trap_valid          ),
    .ID_EX_reg_mret_valid         	( ID_EX_reg_mret_valid          ),
    .ID_EX_reg_sret_valid         	( ID_EX_reg_sret_valid          ),
    .ID_EX_reg_trap_cause         	( ID_EX_reg_trap_cause          ),
    .ID_EX_reg_trap_tval          	( ID_EX_reg_trap_tval           ),
    .ID_EX_reg_operand1           	( ID_EX_reg_operand1            ),
    .ID_EX_reg_operand2           	( ID_EX_reg_operand2            ),
    .ID_EX_reg_operand3           	( ID_EX_reg_operand3            ),
    .ID_EX_reg_operand4           	( ID_EX_reg_operand4            ),
    .EX_LS_reg_execute_valid      	( EX_LS_reg_execute_valid       ),
    .EX_LS_reg_csr_wen            	( EX_LS_reg_csr_wen             ),
    .EX_LS_reg_atomic_valid       	( EX_LS_reg_atomic_valid        ),
    .EX_LS_reg_load_valid         	( EX_LS_reg_load_valid          ),
    .EX_LS_reg_rd                 	( EX_LS_reg_rd                  ),
    .EX_LS_reg_dest_wen           	( EX_LS_reg_dest_wen            ),
    .EX_LS_reg_operand            	( EX_LS_reg_operand             ),
    .TSR                          	( TSR                           ),
    .TW                           	( TW                            ),
    .TVM                          	( TVM                           ),
    .LS_WB_reg_ls_valid           	( LS_WB_reg_ls_valid            ),
    .LS_WB_reg_csr_wen            	( LS_WB_reg_csr_wen             ),
    .LS_WB_reg_rd                 	( LS_WB_reg_rd                  ),
    .LS_WB_reg_dest_wen           	( LS_WB_reg_dest_wen            ),
    .LS_WB_reg_data               	( LS_WB_reg_data                )
);

exu u_exu(
    .clk                     	( clk                      ),
    .rst_n                   	( rst_n                    ),
    .EX_ID_flush_flag        	( EX_ID_flush_flag         ),
    .EX_ID_decode_ready      	( EX_ID_decode_ready       ),
    .ID_EX_reg_decode_valid  	( ID_EX_reg_decode_valid   ),
    .ID_EX_reg_PC            	( ID_EX_reg_PC             ),
    .ID_EX_reg_next_PC       	( ID_EX_reg_next_PC        ),
    .ID_EX_reg_inst          	( ID_EX_reg_inst           ),
    .ID_EX_reg_rd            	( ID_EX_reg_rd             ),
    .ID_EX_reg_dest_wen      	( ID_EX_reg_dest_wen       ),
    .ID_EX_reg_sub           	( ID_EX_reg_sub            ),
    .ID_EX_reg_word          	( ID_EX_reg_word           ),
    .ID_EX_reg_logic_valid   	( ID_EX_reg_logic_valid    ),
    .ID_EX_reg_logic_or      	( ID_EX_reg_logic_or       ),
    .ID_EX_reg_logic_xor     	( ID_EX_reg_logic_xor      ),
    .ID_EX_reg_logic_and     	( ID_EX_reg_logic_and      ),
    .ID_EX_reg_load_valid    	( ID_EX_reg_load_valid     ),
    .ID_EX_reg_load_signed   	( ID_EX_reg_load_signed    ),
    .ID_EX_reg_load_byte     	( ID_EX_reg_load_byte      ),
    .ID_EX_reg_load_half     	( ID_EX_reg_load_half      ),
    .ID_EX_reg_load_word     	( ID_EX_reg_load_word      ),
    .ID_EX_reg_load_double   	( ID_EX_reg_load_double    ),
    .ID_EX_reg_store_valid   	( ID_EX_reg_store_valid    ),
    .ID_EX_reg_store_byte    	( ID_EX_reg_store_byte     ),
    .ID_EX_reg_store_half    	( ID_EX_reg_store_half     ),
    .ID_EX_reg_store_word    	( ID_EX_reg_store_word     ),
    .ID_EX_reg_store_double  	( ID_EX_reg_store_double   ),
    .ID_EX_reg_store_data    	( ID_EX_reg_store_data     ),
    .ID_EX_reg_branch_valid  	( ID_EX_reg_branch_valid   ),
    .ID_EX_reg_branch_ne     	( ID_EX_reg_branch_ne      ),
    .ID_EX_reg_branch_eq     	( ID_EX_reg_branch_eq      ),
    .ID_EX_reg_branch_lt     	( ID_EX_reg_branch_lt      ),
    .ID_EX_reg_branch_ge     	( ID_EX_reg_branch_ge      ),
    .ID_EX_reg_branch_signed 	( ID_EX_reg_branch_signed  ),
    .ID_EX_reg_shift_valid   	( ID_EX_reg_shift_valid    ),
    .ID_EX_reg_shift_al      	( ID_EX_reg_shift_al       ),
    .ID_EX_reg_shift_lr      	( ID_EX_reg_shift_lr       ),
    .ID_EX_reg_shift_word    	( ID_EX_reg_shift_word     ),
    .ID_EX_reg_set_valid     	( ID_EX_reg_set_valid      ),
    .ID_EX_reg_set_signed    	( ID_EX_reg_set_signed     ),
    .ID_EX_reg_jump_valid    	( ID_EX_reg_jump_valid     ),
    .ID_EX_reg_csr_valid     	( ID_EX_reg_csr_valid      ),
    .ID_EX_reg_csr_wen       	( ID_EX_reg_csr_wen        ),
    .ID_EX_reg_csr_ren       	( ID_EX_reg_csr_ren        ),
    .ID_EX_reg_csr_addr      	( ID_EX_reg_csr_addr       ),
    .ID_EX_reg_csr_set       	( ID_EX_reg_csr_set        ),
    .ID_EX_reg_csr_clear     	( ID_EX_reg_csr_clear      ),
    .ID_EX_reg_csr_swap      	( ID_EX_reg_csr_swap       ),
    .ID_EX_reg_mul_valid     	( ID_EX_reg_mul_valid      ),
    .ID_EX_reg_mul_high      	( ID_EX_reg_mul_high       ),
    .ID_EX_reg_mul_signed    	( ID_EX_reg_mul_signed     ),
    .ID_EX_reg_mul_word      	( ID_EX_reg_mul_word       ),
    .ID_EX_reg_div_valid     	( ID_EX_reg_div_valid      ),
    .ID_EX_reg_div_signed    	( ID_EX_reg_div_signed     ),
    .ID_EX_reg_div_rem       	( ID_EX_reg_div_rem        ),
    .ID_EX_reg_div_word      	( ID_EX_reg_div_word       ),
    .ID_EX_reg_atomic_valid  	( ID_EX_reg_atomic_valid   ),
    .ID_EX_reg_atomic_word   	( ID_EX_reg_atomic_word    ),
    .ID_EX_reg_atomic_lr     	( ID_EX_reg_atomic_lr      ),
    .ID_EX_reg_atomic_sc     	( ID_EX_reg_atomic_sc      ),
    .ID_EX_reg_atomic_swap   	( ID_EX_reg_atomic_swap    ),
    .ID_EX_reg_atomic_add    	( ID_EX_reg_atomic_add     ),
    .ID_EX_reg_atomic_xor    	( ID_EX_reg_atomic_xor     ),
    .ID_EX_reg_atomic_and    	( ID_EX_reg_atomic_and     ),
    .ID_EX_reg_atomic_or     	( ID_EX_reg_atomic_or      ),
    .ID_EX_reg_atomic_min    	( ID_EX_reg_atomic_min     ),
    .ID_EX_reg_atomic_max    	( ID_EX_reg_atomic_max     ),
    .ID_EX_reg_atomic_signed 	( ID_EX_reg_atomic_signed  ),
    .ID_EX_reg_trap_valid    	( ID_EX_reg_trap_valid     ),
    .ID_EX_reg_mret_valid    	( ID_EX_reg_mret_valid     ),
    .ID_EX_reg_sret_valid    	( ID_EX_reg_sret_valid     ),
    .ID_EX_reg_trap_cause    	( ID_EX_reg_trap_cause     ),
    .ID_EX_reg_trap_tval     	( ID_EX_reg_trap_tval      ),
    .ID_EX_reg_operand1      	( ID_EX_reg_operand1       ),
    .ID_EX_reg_operand2      	( ID_EX_reg_operand2       ),
    .ID_EX_reg_operand3      	( ID_EX_reg_operand3       ),
    .ID_EX_reg_operand4      	( ID_EX_reg_operand4       ),
    .LS_EX_flush_flag        	( LS_EX_flush_flag         ),
    .LS_EX_execute_ready     	( LS_EX_execute_ready      ),
    .EX_LS_reg_execute_valid 	( EX_LS_reg_execute_valid  ),
    .EX_LS_reg_PC            	( EX_LS_reg_PC             ),
    .EX_LS_reg_next_PC       	( EX_LS_reg_next_PC        ),
    .EX_LS_reg_inst          	( EX_LS_reg_inst           ),
    .EX_LS_reg_rd            	( EX_LS_reg_rd             ),
    .EX_LS_reg_dest_wen      	( EX_LS_reg_dest_wen       ),
    .EX_LS_reg_load_valid    	( EX_LS_reg_load_valid     ),
    .EX_LS_reg_load_signed   	( EX_LS_reg_load_signed    ),
    .EX_LS_reg_load_byte     	( EX_LS_reg_load_byte      ),
    .EX_LS_reg_load_half     	( EX_LS_reg_load_half      ),
    .EX_LS_reg_load_word     	( EX_LS_reg_load_word      ),
    .EX_LS_reg_load_double   	( EX_LS_reg_load_double    ),
    .EX_LS_reg_store_valid   	( EX_LS_reg_store_valid    ),
    .EX_LS_reg_store_byte    	( EX_LS_reg_store_byte     ),
    .EX_LS_reg_store_half    	( EX_LS_reg_store_half     ),
    .EX_LS_reg_store_word    	( EX_LS_reg_store_word     ),
    .EX_LS_reg_store_double  	( EX_LS_reg_store_double   ),
    .EX_LS_reg_store_data    	( EX_LS_reg_store_data     ),
    .EX_LS_reg_csr_wen       	( EX_LS_reg_csr_wen        ),
    .EX_LS_reg_csr_ren       	( EX_LS_reg_csr_ren        ),
    .EX_LS_reg_csr_addr      	( EX_LS_reg_csr_addr       ),
    .EX_LS_reg_atomic_valid  	( EX_LS_reg_atomic_valid   ),
    .EX_LS_reg_atomic_word   	( EX_LS_reg_atomic_word    ),
    .EX_LS_reg_atomic_lr     	( EX_LS_reg_atomic_lr      ),
    .EX_LS_reg_atomic_sc     	( EX_LS_reg_atomic_sc      ),
    .EX_LS_reg_atomic_swap   	( EX_LS_reg_atomic_swap    ),
    .EX_LS_reg_atomic_add    	( EX_LS_reg_atomic_add     ),
    .EX_LS_reg_atomic_xor    	( EX_LS_reg_atomic_xor     ),
    .EX_LS_reg_atomic_and    	( EX_LS_reg_atomic_and     ),
    .EX_LS_reg_atomic_or     	( EX_LS_reg_atomic_or      ),
    .EX_LS_reg_atomic_min    	( EX_LS_reg_atomic_min     ),
    .EX_LS_reg_atomic_max    	( EX_LS_reg_atomic_max     ),
    .EX_LS_reg_atomic_signed 	( EX_LS_reg_atomic_signed  ),
    .EX_LS_reg_trap_valid    	( EX_LS_reg_trap_valid     ),
    .EX_LS_reg_mret_valid    	( EX_LS_reg_mret_valid     ),
    .EX_LS_reg_sret_valid    	( EX_LS_reg_sret_valid     ),
    .EX_LS_reg_trap_cause    	( EX_LS_reg_trap_cause     ),
    .EX_LS_reg_trap_tval     	( EX_LS_reg_trap_tval      ),
    .EX_LS_reg_operand       	( EX_LS_reg_operand        ),
    .WB_EX_interrupt_flag    	( WB_EX_interrupt_flag     ),
    .EX_IF_jump_flag         	( EX_IF_jump_flag          ),
    .EX_IF_jump_addr         	( EX_IF_jump_addr          )
);

lsu u_lsu(
    .clk                     	( clk                      ),
    .rst_n                   	( rst_n                    ),
    .lsu_arvalid             	( lsu_arvalid              ),
    .lsu_arready             	( lsu_arready              ),
    .lsu_arlock              	( lsu_arlock               ),
    .lsu_arsize              	( lsu_arsize               ),
    .lsu_araddr              	( lsu_araddr               ),
    .lsu_rvalid              	( lsu_rvalid               ),
    .lsu_rready              	( lsu_rready               ),
    .lsu_rresp               	( lsu_rresp                ),
    .lsu_rdata               	( lsu_rdata                ),
    .lsu_awvalid             	( lsu_awvalid              ),
    .lsu_awready             	( lsu_awready              ),
    .lsu_awlock              	( lsu_awlock               ),
    .lsu_awsize              	( lsu_awsize               ),
    .lsu_awaddr              	( lsu_awaddr               ),
    .lsu_wvalid              	( lsu_wvalid               ),
    .lsu_wready              	( lsu_wready               ),
    .lsu_wstrob              	( lsu_wstrob               ),
    .lsu_wdata               	( lsu_wdata                ),
    .lsu_bvalid              	( lsu_bvalid               ),
    .lsu_bready              	( lsu_bready               ),
    .lsu_bresp               	( lsu_bresp                ),
    .LS_EX_flush_flag        	( LS_EX_flush_flag         ),
    .LS_EX_execute_ready     	( LS_EX_execute_ready      ),
    .EX_LS_reg_execute_valid 	( EX_LS_reg_execute_valid  ),
    .EX_LS_reg_PC            	( EX_LS_reg_PC             ),
    .EX_LS_reg_next_PC       	( EX_LS_reg_next_PC        ),
    .EX_LS_reg_inst          	( EX_LS_reg_inst           ),
    .EX_LS_reg_rd            	( EX_LS_reg_rd             ),
    .EX_LS_reg_dest_wen      	( EX_LS_reg_dest_wen       ),
    .EX_LS_reg_load_valid    	( EX_LS_reg_load_valid     ),
    .EX_LS_reg_load_signed   	( EX_LS_reg_load_signed    ),
    .EX_LS_reg_load_byte     	( EX_LS_reg_load_byte      ),
    .EX_LS_reg_load_half     	( EX_LS_reg_load_half      ),
    .EX_LS_reg_load_word     	( EX_LS_reg_load_word      ),
    .EX_LS_reg_load_double   	( EX_LS_reg_load_double    ),
    .EX_LS_reg_store_valid   	( EX_LS_reg_store_valid    ),
    .EX_LS_reg_store_byte    	( EX_LS_reg_store_byte     ),
    .EX_LS_reg_store_half    	( EX_LS_reg_store_half     ),
    .EX_LS_reg_store_word    	( EX_LS_reg_store_word     ),
    .EX_LS_reg_store_double  	( EX_LS_reg_store_double   ),
    .EX_LS_reg_store_data    	( EX_LS_reg_store_data     ),
    .EX_LS_reg_csr_wen       	( EX_LS_reg_csr_wen        ),
    .EX_LS_reg_csr_ren       	( EX_LS_reg_csr_ren        ),
    .EX_LS_reg_csr_addr      	( EX_LS_reg_csr_addr       ),
    .EX_LS_reg_atomic_valid  	( EX_LS_reg_atomic_valid   ),
    .EX_LS_reg_atomic_word   	( EX_LS_reg_atomic_word    ),
    .EX_LS_reg_atomic_lr     	( EX_LS_reg_atomic_lr      ),
    .EX_LS_reg_atomic_sc     	( EX_LS_reg_atomic_sc      ),
    .EX_LS_reg_atomic_swap   	( EX_LS_reg_atomic_swap    ),
    .EX_LS_reg_atomic_add    	( EX_LS_reg_atomic_add     ),
    .EX_LS_reg_atomic_xor    	( EX_LS_reg_atomic_xor     ),
    .EX_LS_reg_atomic_and    	( EX_LS_reg_atomic_and     ),
    .EX_LS_reg_atomic_or     	( EX_LS_reg_atomic_or      ),
    .EX_LS_reg_atomic_min    	( EX_LS_reg_atomic_min     ),
    .EX_LS_reg_atomic_max    	( EX_LS_reg_atomic_max     ),
    .EX_LS_reg_atomic_signed 	( EX_LS_reg_atomic_signed  ),
    .EX_LS_reg_trap_valid    	( EX_LS_reg_trap_valid     ),
    .EX_LS_reg_mret_valid    	( EX_LS_reg_mret_valid     ),
    .EX_LS_reg_sret_valid    	( EX_LS_reg_sret_valid     ),
    .EX_LS_reg_trap_cause    	( EX_LS_reg_trap_cause     ),
    .EX_LS_reg_trap_tval     	( EX_LS_reg_trap_tval      ),
    .EX_LS_reg_operand       	( EX_LS_reg_operand        ),
    .LS_WB_reg_ls_valid      	( LS_WB_reg_ls_valid       ),
    .WB_LS_ls_ready          	( WB_LS_ls_ready           ),
    .WB_LS_flush_flag        	( WB_LS_flush_flag         ),
    .LS_WB_reg_PC            	( LS_WB_reg_PC             ),
    .LS_WB_reg_next_PC       	( LS_WB_reg_next_PC        ),
    .LS_WB_reg_inst          	( LS_WB_reg_inst           ),
    .LS_WB_reg_trap_valid    	( LS_WB_reg_trap_valid     ),
    .LS_WB_reg_mret_valid    	( LS_WB_reg_mret_valid     ),
    .LS_WB_reg_sret_valid    	( LS_WB_reg_sret_valid     ),
    .LS_WB_reg_trap_cause    	( LS_WB_reg_trap_cause     ),
    .LS_WB_reg_trap_tval     	( LS_WB_reg_trap_tval      ),
    .LS_WB_reg_csr_wen       	( LS_WB_reg_csr_wen        ),
    .LS_WB_reg_csr_ren       	( LS_WB_reg_csr_ren        ),
    .LS_WB_reg_csr_addr      	( LS_WB_reg_csr_addr       ),
    .LS_WB_reg_rd            	( LS_WB_reg_rd             ),
    .LS_WB_reg_dest_wen      	( LS_WB_reg_dest_wen       ),
    .LS_WB_reg_data          	( LS_WB_reg_data           )
);

wbu #(
    .MHARTID 	( MHARTID  ),
    .RST_PC     ( RST_PC   )
)u_wbu
(
    .clk                     	( clk                      ),
    .rst_n                   	( rst_n                    ),
    .current_priv_status     	( current_priv_status      ),
    .stip_asyn               	( stip_asyn                ),
    .seip_asyn               	( seip_asyn                ),
    .ssip_asyn               	( ssip_asyn                ),
    .mtip_asyn               	( mtip_asyn                ),
    .meip_asyn               	( meip_asyn                ),
    .msip_asyn               	( msip_asyn                ),
    .MXR                     	( MXR                      ),
    .SUM                     	( SUM                      ),
    .MPRV                    	( MPRV                     ),
    .MPP                     	( MPP                      ),
    .satp_mode                  ( satp_mode                ),
    .satp_asid                  ( satp_asid                ),
    .satp_ppn                   ( satp_ppn                 ),
    .WB_IF_jump_flag         	( WB_IF_jump_flag          ),
    .WB_IF_jump_addr         	( WB_IF_jump_addr          ),
    .rs1                     	( rs1                      ),
    .rs2                     	( rs2                      ),
    .WB_ID_src1              	( WB_ID_src1               ),
    .WB_ID_src2              	( WB_ID_src2               ),
    .ID_WB_csr_addr          	( ID_WB_csr_addr           ),
    .WB_ID_csr_rdata         	( WB_ID_csr_rdata          ),
    .TSR                     	( TSR                      ),
    .TW                      	( TW                       ),
    .TVM                     	( TVM                      ),
    .EX_LS_reg_execute_valid 	( EX_LS_reg_execute_valid  ),
    .WB_EX_interrupt_flag    	( WB_EX_interrupt_flag     ),
    .LS_WB_reg_ls_valid      	( LS_WB_reg_ls_valid       ),
    .WB_LS_ls_ready          	( WB_LS_ls_ready           ),
    .WB_LS_flush_flag        	( WB_LS_flush_flag         ),
    .LS_WB_reg_PC            	( LS_WB_reg_PC             ),
    .LS_WB_reg_next_PC       	( LS_WB_reg_next_PC        ),
    .LS_WB_reg_inst          	( LS_WB_reg_inst           ),
    .LS_WB_reg_trap_valid    	( LS_WB_reg_trap_valid     ),
    .LS_WB_reg_mret_valid    	( LS_WB_reg_mret_valid     ),
    .LS_WB_reg_sret_valid    	( LS_WB_reg_sret_valid     ),
    .LS_WB_reg_trap_cause    	( LS_WB_reg_trap_cause     ),
    .LS_WB_reg_trap_tval     	( LS_WB_reg_trap_tval      ),
    .LS_WB_reg_csr_wen       	( LS_WB_reg_csr_wen        ),
    .LS_WB_reg_csr_ren       	( LS_WB_reg_csr_ren        ),
    .LS_WB_reg_csr_addr      	( LS_WB_reg_csr_addr       ),
    .LS_WB_reg_rd            	( LS_WB_reg_rd             ),
    .LS_WB_reg_dest_wen      	( LS_WB_reg_dest_wen       ),
    .LS_WB_reg_data          	( LS_WB_reg_data           )
);

assign jump_flag = (EX_IF_jump_flag | WB_IF_jump_flag);
assign jump_addr = (WB_IF_jump_flag) ? WB_IF_jump_addr : EX_IF_jump_addr;

endmodule //core_top
