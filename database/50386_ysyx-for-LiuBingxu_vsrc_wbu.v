// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the write back Unit for a cpu core
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

module wbu#(parameter MHARTID = 0,RST_PC=64'h0)(
    input                   clk,
    input                   rst_n,
    output  [1:0]           current_priv_status,
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
//interface with ifu
    output                  WB_IF_jump_flag,
    output [63:0]           WB_IF_jump_addr,
//interface with idu
    input  [4 :0]           rs1,
    input  [4 :0]           rs2,
    output [63:0]           WB_ID_src1,
    output [63:0]           WB_ID_src2,
    input  [11:0]           ID_WB_csr_addr,
    output [63:0]           WB_ID_csr_rdata,
    output                  TSR,
    output                  TW,
    output                  TVM,
//interface with exu
    input                   EX_LS_reg_execute_valid,
    output                  WB_EX_interrupt_flag,
//interface with lsu 
    //common
    input                   LS_WB_reg_ls_valid,
    output                  WB_LS_ls_ready,
    output                  WB_LS_flush_flag,
    input  [63:0]           LS_WB_reg_PC,
    input  [63:0]           LS_WB_reg_next_PC,
    input  [31:0]           LS_WB_reg_inst,
    //trap:
    input                   LS_WB_reg_trap_valid,
    input                   LS_WB_reg_mret_valid,
    input                   LS_WB_reg_sret_valid,
    input  [63:0]           LS_WB_reg_trap_cause,
    input  [63:0]           LS_WB_reg_trap_tval,
    //csr
    input                   LS_WB_reg_csr_wen,
    input                   LS_WB_reg_csr_ren,
    input  [11:0]           LS_WB_reg_csr_addr,
    //gpr
    input  [4:0]            LS_WB_reg_rd,
    input                   LS_WB_reg_dest_wen,
    input  [63:0]           LS_WB_reg_data
);

wire [63:0]     write_data;
wire            meip;
wire            msip;
wire            mtip;
wire            seip;
wire            ssip;
wire            stip;

// csr outports wire
wire [63:0] 	csr_rdata;

gpr u_gpr(
    .clk                	( clk                 ),
    .rs1                	( rs1                 ),
    .rs2                	( rs2                 ),
    .WB_ID_src1         	( WB_ID_src1          ),
    .WB_ID_src2         	( WB_ID_src2          ),
    .LS_WB_reg_rd       	( LS_WB_reg_rd        ),
    .LS_WB_reg_dest_wen 	( LS_WB_reg_dest_wen  ),
    .write_data         	( write_data          )
);

csr #(
    .MHARTID 	( MHARTID  ),
    .RST_PC     ( RST_PC   )
)u_csr
(
    .clk                     	( clk                      ),
    .rst_n                   	( rst_n                    ),
    .stip                    	( stip                     ),
    .seip                    	( seip                     ),
    .ssip                    	( ssip                     ),
    .mtip                    	( mtip                     ),
    .meip                    	( meip                     ),
    .msip                    	( msip                     ),
    .current_priv_status     	( current_priv_status      ),
    .MXR                     	( MXR                      ),
    .SUM                     	( SUM                      ),
    .MPRV                    	( MPRV                     ),
    .MPP                     	( MPP                      ),
    .satp_mode                  ( satp_mode                ),
    .satp_asid                  ( satp_asid                ),
    .satp_ppn                   ( satp_ppn                 ),
    .WB_IF_jump_flag         	( WB_IF_jump_flag          ),
    .WB_IF_jump_addr         	( WB_IF_jump_addr          ),
    .ID_WB_csr_addr          	( ID_WB_csr_addr           ),
    .WB_ID_csr_rdata         	( WB_ID_csr_rdata          ),
    .TSR                     	( TSR                      ),
    .TW                      	( TW                       ),
    .TVM                     	( TVM                      ),
    .EX_LS_reg_execute_valid 	( EX_LS_reg_execute_valid  ),
    .WB_EX_interrupt_flag    	( WB_EX_interrupt_flag     ),
    .LS_WB_reg_ls_valid      	( LS_WB_reg_ls_valid       ),
    .LS_WB_reg_PC            	( LS_WB_reg_PC             ),
    .LS_WB_reg_next_PC       	( LS_WB_reg_next_PC        ),
    .LS_WB_reg_trap_valid    	( LS_WB_reg_trap_valid     ),
    .LS_WB_reg_mret_valid    	( LS_WB_reg_mret_valid     ),
    .LS_WB_reg_sret_valid    	( LS_WB_reg_sret_valid     ),
    .LS_WB_reg_trap_cause    	( LS_WB_reg_trap_cause     ),
    .LS_WB_reg_trap_tval     	( LS_WB_reg_trap_tval      ),
    .LS_WB_reg_csr_wen       	( LS_WB_reg_csr_wen        ),
    .LS_WB_reg_csr_addr      	( LS_WB_reg_csr_addr       ),
    .LS_WB_reg_data          	( LS_WB_reg_data           ),
    .csr_rdata               	( csr_rdata                )
);

sync #(.DATA_LEN( 1 )) u_meip(.clk( clk ), .rst_n( rst_n ), .in_asyn( meip_asyn ), .out_syn( meip ));
sync #(.DATA_LEN( 1 )) u_msip(.clk( clk ), .rst_n( rst_n ), .in_asyn( msip_asyn ), .out_syn( msip ));
sync #(.DATA_LEN( 1 )) u_mtip(.clk( clk ), .rst_n( rst_n ), .in_asyn( mtip_asyn ), .out_syn( mtip ));
sync #(.DATA_LEN( 1 )) u_seip(.clk( clk ), .rst_n( rst_n ), .in_asyn( seip_asyn ), .out_syn( seip ));
sync #(.DATA_LEN( 1 )) u_ssip(.clk( clk ), .rst_n( rst_n ), .in_asyn( ssip_asyn ), .out_syn( ssip ));
sync #(.DATA_LEN( 1 )) u_stip(.clk( clk ), .rst_n( rst_n ), .in_asyn( stip_asyn ), .out_syn( stip ));

assign write_data       = (LS_WB_reg_csr_ren) ? csr_rdata : LS_WB_reg_data;

//**********************************************************************************************
assign WB_LS_ls_ready   = 1'b1;
assign WB_LS_flush_flag = WB_IF_jump_flag;
//**********************************************************************************************

endmodule //wbu
