//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
`include "airi5c_alu_ops.vh"
`include "rv32_opcodes.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_arch_options.vh"

`ifdef ISA_EXT_F
  `include "modules/airi5c_fpu/airi5c_FPU_constants.vh"
`endif

module airi5c_pipeline(
  input                        rst_ni,            // system reset
  input                        clk_i,               // system clock

  // interrrupts
  input                        debug_haltreq,     // external debug halt request (interrupt)
  input  [`N_EXT_INTS-1:0]     ext_interrupts,    // external interrupts
  input                        system_timer_tick, // system timer interrupt (timer is mem-mapped periph)

  // I-/D-Memory port

  input                        imem_hready_i,
  output [`XPR_LEN-1:0]        imem_haddr_o,         // Instruction Memory Address
  input  [`XPR_LEN-1:0]        imem_hrdata_i,        // Instruction Memory Data
  input                        imem_badmem_e,     // Instruction Memory error signal
  output [`HASTI_TRANS_WIDTH-1:0] imem_htrans_o,
  output [`HASTI_BURST_WIDTH-1:0] imem_hburst_o,
  output                          imem_hmastlock_o,
  output [`HASTI_PROT_WIDTH-1:0]  imem_hprot_o,

  input                        dmem_hready_i,
  output                       dmem_hwrite_o,          // Data Memory Write Enable
  output [`MEM_TYPE_WIDTH-1:0] dmem_hsize_o,         // Data Memory access width (byte, word, dword)
  output [`XPR_LEN-1:0]        dmem_haddr_o,         // Data Memory address
  output [`XPR_LEN-1:0]        dmem_hwdata_o,
  output [`HASTI_TRANS_WIDTH-1:0] dmem_htrans_o,
  output [`HASTI_BURST_WIDTH-1:0] dmem_hburst_o,
  output                          dmem_hmastlock_o,
  output [`HASTI_PROT_WIDTH-1:0]  dmem_hprot_o,
  input  [`XPR_LEN-1:0]        dmem_hrdata_i,        // Word read from data memory
  input                        dmem_badmem_e,     // Data memory error signal

  // debug module register access port

  input  [`REG_ADDR_WIDTH-1:0] dm_wara,          // debug module register access - write/read address
  `ifdef ISA_EXT_F
  input                        dm_sel_fpu_reg,   // switch between int and float registers
  `endif
  input  [`XPR_LEN-1:0]        dm_wd,            // debug module register access - write data
  input                        dm_wen,           // debug module register access - write enable
  output [`XPR_LEN-1:0]        dm_rd,            // debug module register access - read data

  output                       dm_illegal_csr_access,
  input  [`CSR_ADDR_WIDTH-1:0] dm_csr_addr,      // CSR address
  input  [`CSR_CMD_WIDTH-1:0]  dm_csr_cmd,       // CSR command (0 == IDLE)
  input  [`XPR_LEN-1:0]        dm_csr_wdata,     // data to be written to CSR
  output [`XPR_LEN-1:0]        dm_csr_rdata,     // data read from CSR

  `ifdef CVXIF
  // =======================================
  // == CoreV Extension Interface (CVXIF) ==
  // =======================================

  output [`XPR_LEN-1:0]        q_instr_data,
  output [`XPR_LEN-1:0]        q_rs1,
  output [`XPR_LEN-1:0]        q_rs0,
  output [1:0]                 q_rs_valid,
  output                       q_rd_clean,
  input                        k_accept,
  input                        k_is_mem_op,
  input                        k_writeback,
  output                       q_valid,
  input                        q_ready,

  input  [4:0]                 p_rd,
  input  [`XPR_LEN-1:0]        p_data0,
  input                        p_dualwb,
  input                        p_type,
  input                        p_error

  `else
  // ======================================
  // == PCPI Coprocessor interface       ==
  // ======================================

  output                       pcpi_valid,
  output [`XPR_LEN-1:0]        pcpi_insn,
  output [`XPR_LEN-1:0]        pcpi_rs1,
  output [`XPR_LEN-1:0]        pcpi_rs2,
  output [`XPR_LEN-1:0]        pcpi_rs3,
  input                        pcpi_wr,           // unused - assumes to always write a result.
  input  [`XPR_LEN-1:0]        pcpi_rd,
  input  [`XPR_LEN-1:0]        pcpi_rd2,
  input                        pcpi_use_rd64,
  input                        pcpi_wait,
  input                        pcpi_ready
  `ifdef ISA_EXT_P
  ,
  input                        pcpi_ready_mul_div
  `endif
`endif
);


  // ==============================================================
  // == Helper functions for memory accesses of different width  ==
  // ==============================================================

  // store_data()
  // differentiate between byte/halfword/word wide writes to memory

  function [`XPR_LEN-1:0] store_data;
    input [`XPR_LEN-1:0]        addr;
    input [`XPR_LEN-1:0]        data;
    input [`MEM_TYPE_WIDTH-1:0] mem_type;
    begin
       case (mem_type)
         `MEM_TYPE_SB : store_data = {4{data[7:0]}};
         `MEM_TYPE_SH : store_data = {2{data[15:0]}};
         default : store_data = data;
       endcase
    end
  endfunction


// ==============================================================
// Nets and assigns

  wire                              flush_pipeline;

  wire [`XPR_LEN-1:0]               PC_PIF;         
  wire [`PC_SRC_SEL_WIDTH-1:0]      PC_src_sel; // PC mux select signal, select between different sources for the 
                                              // next PC value (e.g. next instruction, jump target, 

  wire [`XPR_LEN-1:0]               PC_IF;
  wire [`XPR_LEN-1:0]               inst_IF;
  wire                              badmem_e_IF;
  wire                              imem_compressed_IF;
  wire                              if_valid;
  wire                              predicted_branch_if;

  // DECODE stage signals
  wire                              de_valid;
  wire                              inject_ebreak;
  wire                              predicted_branch_de;
  wire  [`XPR_LEN-1:0]              PC_DE;      // this is the PC of the instruction currently in IF stage
  wire  [`XPR_LEN-1:0]              inst_DE;
  wire                              de_ready;
  wire                              imem_compressed_DE;
  wire  [`ALU_OP_WIDTH-1:0]         alu_op_DE;
  wire  [`SRC_A_SEL_WIDTH-1:0]      src_a_sel_DE;
  wire  [`SRC_B_SEL_WIDTH-1:0]      src_b_sel_DE;
  wire  [`SRC_C_SEL_WIDTH-1:0]      src_c_sel_DE;
  wire                              dmem_en_unkilled_DE;
  wire                              dmem_wen_unkilled_DE;
  wire                              wr_reg_unkilled_DE;
  wire                              illegal_instruction_DE;
  wire                              loadstore_DE;
  wire                              jal_unkilled_DE;
  wire                              jalr_unkilled_DE;
  wire                              eret_unkilled_DE;
  wire                              fence_i_DE;
  wire  [`CSR_CMD_WIDTH-1:0]        csr_cmd_unkilled_DE;
  wire                              uses_rs1_DE;
  wire                              uses_rs2_DE;
  wire                              uses_rs3_DE;
  wire  [`IMM_TYPE_WIDTH-1:0]       imm_type_DE;
  wire                              pcpi_valid_DE;
  wire  [`WB_SRC_SEL_WIDTH-1:0]     wb_src_sel_DE;
  wire                              uses_pcpi_unkilled_DE;
  wire  [2:0]                       dmem_size_DE;
  wire  [`MEM_TYPE_WIDTH-1:0]       dmem_type_DE;
  wire                              csr_imm_sel_DE;
  wire                              ecall_DE;
  wire                              ebreak_DE;
  wire                              dret_unkilled_DE;
  wire                              wfi_unkilled_DE;
  wire  [4:0]                       rs1_addr_DE;
  wire  [4:0]                       rs2_addr_DE;
  wire  [4:0]                       rs3_addr_DE;

  // EXECUTE stage signals / ALU signals
  wire                           ex_valid;
  wire [`XPR_LEN-1:0]            PC_EX;            // this is the PC of the instruction currently in EX stage
  wire [`INST_WIDTH-1:0]         inst_EX;          // this is the instruction word currently in EX stage
  wire                           imem_compressed_EX;
  wire                           predicted_branch_ex;
  wire                           kill_EX;
  wire                           stall_EX;
  wire                           ex_ready;
  wire                           pcpi_valid_EX;
  wire   [`ALU_OP_WIDTH-1:0]     alu_op_EX;
  wire   [`SRC_A_SEL_WIDTH-1:0]  src_a_sel_EX;
  wire   [`SRC_B_SEL_WIDTH-1:0]  src_b_sel_EX;
  wire   [`SRC_C_SEL_WIDTH-1:0]  src_c_sel_EX;
  wire                           dmem_en_unkilled_EX;
  wire                           dmem_wen_unkilled_EX;
  wire                           wr_reg_unkilled_EX;
  wire                           illegal_instruction_EX;
  wire                           jal_unkilled_EX;
  wire                           jalr_unkilled_EX;
  wire                           eret_unkilled_EX;
  wire                           fence_i_EX;
  wire   [`CSR_CMD_WIDTH-1:0]    csr_cmd_unkilled_EX;
  wire                           uses_rs1_EX;
  wire                           uses_rs2_EX;
  wire                           uses_rs3_EX;
  wire   [`IMM_TYPE_WIDTH-1:0]   imm_type_EX;
  wire                           pcpi_valid_unkilled_EX;
  wire   [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_EX;
  wire                           uses_pcpi_unkilled_EX;
  wire   [2:0]                   dmem_size_EX;
  wire   [`MEM_TYPE_WIDTH-1:0]   dmem_type_EX;
  wire                           csr_imm_sel_EX;
  wire                           ecall_EX;
  wire                           ebreak_EX;
  wire                           dret_unkilled_EX;
  wire                           wfi_unkilled_EX;
  wire   [4:0]                   rs1_addr_EX;
  wire   [4:0]                   rs2_addr_EX;
  wire   [4:0]                   rs3_addr_EX;
  wire                           loadstore_EX;
  wire                           ex_EX;

  wire [`IMM_TYPE_WIDTH-1:0]   imm_type;
  wire [`XPR_LEN-1:0]          imm;              // Immediate value retrieved from instruction word
  wire [`SRC_A_SEL_WIDTH-1:0]  src_a_sel;        // ALU A input source select (register, immediate, something from WB stage...)
  wire [`SRC_B_SEL_WIDTH-1:0]  src_b_sel;        // ALU B input source select
  wire [`REG_ADDR_WIDTH-1:0]   rs1_addr;         // source register 1 (rs1) addr (0 - 31)
  wire [`XPR_LEN-1:0]          rs1_data;         // data from source register 1
  wire [`XPR_LEN-1:0]          rs1_data_bypassed;
  wire [`REG_ADDR_WIDTH-1:0]   rs2_addr;         // source register 2 (rs2) addr
  wire [`XPR_LEN-1:0]          rs2_data;         // source register 2 data
  wire [`XPR_LEN-1:0]          rs2_data_bypassed;
  wire [`REG_ADDR_WIDTH-1:0]   rs3_addr;         // source register 3 (rs3) addr
  wire [`XPR_LEN-1:0]          rs3_data;         // source register 3 data
  wire [`XPR_LEN-1:0]          rs3_data_bypassed;
  wire [`ALU_OP_WIDTH-1:0]     alu_op;           // ALU operation
  wire [`XPR_LEN-1:0]          alu_src_a;        // ALU input A (selected by src_a_sel)
  wire [`XPR_LEN-1:0]          alu_src_b;        // ALU input B (selected by src_b_sel)
  wire [`XPR_LEN-1:0]          alu_src_c;        // ALU input C (selected by src_c_sel)
  wire [`XPR_LEN-1:0]          alu_out;          // ALU output
  wire                         cmp_true;         // (parallel) branch condition evaluation result.
  wire                         bypass_rs1;       // controls if rs1 is bypassed
  wire                         bypass_rs2;       // controls if rs2 is bypassed
  wire                         bypass_rs3;       // controls if rs3 is bypassed

  // WB stage sigals
  wire  [`INST_WIDTH-1:0]        inst_WB;          // this is the instruction word currently in WB stage
  wire  [`XPR_LEN-1:0]          PC_WB;            // PC of the instruction currently in WB stage
  wire  [`XPR_LEN-1:0]           alu_out_WB;       // register for holding the ALU output in WB stage
  wire  [`XPR_LEN-1:0]           csr_rdata_WB;     // register for holding the data read from CSR in WB stage
  wire  [`XPR_LEN-1:0]           store_data_WB;
  wire  [`XPR_LEN-1:0]           pcpi_rd_WB;
  wire  [`XPR_LEN-1:0]           pcpi_rd2_WB;
  wire                           pcpi_rd64_WB;
  wire                          kill_WB;
  wire                          stall_WB;
  wire  [`XPR_LEN-1:0]           bypass_data_WB;
  wire  [`XPR_LEN-1:0]           wb_data_WB;
  wire [`REG_ADDR_WIDTH-1:0]    reg_to_wr_WB;
  wire                          wr_reg_WB;
  wire [`WB_SRC_SEL_WIDTH-1:0]  wb_src_sel_WB;
  wire  [`MEM_TYPE_WIDTH-1:0]    dmem_type_WB;
  wire                          prev_killed_WB;
  wire                          had_ex_WB;

  // CSR management
  wire [`CSR_ADDR_WIDTH-1:0]   csr_addr;           // CSR address
  wire [`CSR_CMD_WIDTH-1:0]    csr_cmd;            // CSR command (0 == IDLE)
  wire [`PRV_WIDTH-1:0]        prv;                // privilege level (00 == USER, 01 == SUPERVISOR, 10 == RESERVED, 11 == MACHINE)
  wire                         illegal_csr_access; // signal from CSR if illegal access occured
  wire                         interrupt_pending;
  wire                         interrupt_taken;
  wire [`XPR_LEN-1:0]          csr_wdata;          // Data to write into CSR registers
  wire [`XPR_LEN-1:0]          csr_rdata;          // Data from CSR registers
  wire                         retire_WB;          // if an instruction is in WB stage and it is executed (i.e. WB is not killed/stalled), this is HIGH.
  wire [`MCAUSE_WIDTH-1:0]     exception_code_WB;
  wire                         exception_int_WB;
  wire [`XPR_LEN-1:0]          handler_PC;         // address of the exception handler. This is determined in the CSR file and 

  wire                         eret;               // signals a return from an exception handler
  wire                         dret;               // signals a return from debug ROM (i.e. resume)
  wire                         redirect;
  wire                         redirect_WB;
  wire [`XPR_LEN-1:0]          mepc;                // this is the return address stored before entering the exception handler (?)
  wire [`XPR_LEN-1:0]          dpc;

  // Debug Module access to CSR file
  wire [`MCAUSE_WIDTH-1:0]    interrupt_code_EX;
  wire                        stepmode;
  wire                        dmode_WB;

  `ifdef ISA_EXT_F
  // FPU
  wire                        fpu_ena;
  wire    [31:0]              fpu_out;
  wire    [31:0]              fpu_out_WB;
  wire                        NX;
  wire                        UF;
  wire                        OF;
  wire                        DZ;
  wire                        NV;

  wire  [`FPU_OP_WIDTH-1:0]   fpu_op_DE;
  wire                        sel_fpu_rs1_DE;
  wire                        sel_fpu_rs2_DE;
  wire                        sel_fpu_rs3_DE;
  wire                        sel_fpu_rd_DE;

  wire  [`FPU_OP_WIDTH-1:0]   fpu_op_EX;
  wire                        sel_fpu_rs1_EX;
  wire                        sel_fpu_rs2_EX;
  wire                        sel_fpu_rs3_EX;
  wire                        sel_fpu_rd_EX;

  wire                        sel_fpu_rd_WB;

  wire                        sel_rs3;
  wire                        fpu_load;
  wire                        kill_fpu;
  wire                        fpu_busy;
  wire                        fpu_ready;

  wire [2:0]                  rounding_mode;
  `endif

  wire   [`XPR_LEN-1:0]        rs1_data_WB;

// ===================================
// PCPI coprocessor interface
// ===================================

  assign pcpi_rs1  = rs1_data_bypassed;
  assign pcpi_rs2  = rs2_data_bypassed;
  assign pcpi_rs3  = rs3_data;
  assign pcpi_insn = inst_EX;

// ==============================================================
// Control state machine

airi5c_ctrl ctrl(
  .clk_i(clk_i),                    // system clock
  .rst_ni(rst_ni),           

  .flush_pipeline_o(flush_pipeline),

  // port to IF stage
  .PC_src_sel(PC_src_sel),
  .if_valid_i(if_valid),
  .imem_badmem_e(badmem_e_IF),
  .predicted_branch_ex_i(predicted_branch_ex),
    
  // port to DE stage
  .de_ready_i(de_ready),
  .de_valid_i(de_valid),

  // port to EX stage
  .ex_valid_i(ex_valid),
  .ex_ready_i(ex_ready),
  .stall_EX(stall_EX),
  .kill_EX(kill_EX),
  .inst_ex_i(inst_EX),            
  .illegal_instruction(illegal_instruction_EX),
  .cmp_true(cmp_true),
  .jal_unkilled(jal_unkilled_EX),
  .jalr_unkilled(jalr_unkilled_EX),
  .uses_rs1(uses_rs1_EX),
  .uses_rs2(uses_rs2_EX),
  .eret_unkilled(eret_unkilled_EX),
  .bypass_rs1(bypass_rs1),
  .bypass_rs2(bypass_rs2),
  .uses_rs3(uses_rs3_EX),
  .bypass_rs3(bypass_rs3),
  .ecall(ecall_EX),
  .ebreak(ebreak_EX),
  .interrupt_pending(interrupt_pending),
  .interrupt_taken(interrupt_taken),
  .interrupt_code_EX(interrupt_code_EX),
  .csr_cmd_unkilled(csr_cmd_unkilled_EX),
  .csr_cmd(csr_cmd),
  .illegal_csr_access(illegal_csr_access),
  .dret_unkilled(dret_unkilled_EX),
  .wfi_unkilled_EX(wfi_unkilled_EX),
  .ex_EX(ex_EX),
  .prv(prv),
  .eret(eret),
  .dret(dret),
  .redirect(redirect),
  .stepmode(stepmode),
  .inject_ebreak(inject_ebreak),

  .uses_pcpi_unkilled(uses_pcpi_unkilled_EX),
  .pcpi_ready(pcpi_ready),
  .pcpi_wait(pcpi_wait),
  .pcpi_wr(pcpi_wr),
  .pcpi_valid_unkilled(pcpi_valid_unkilled_EX),
  .pcpi_valid(pcpi_valid_EX),

  .wb_src_sel_EX(wb_src_sel_EX),
  .wr_reg_unkilled_EX(wr_reg_unkilled_EX),
  .dmem_en_unkilled(dmem_en_unkilled_EX),
  .dmem_wen_unkilled(dmem_wen_unkilled_EX),
  .dmem_wen(dmem_hwrite_o),
  .dmem_hready_i(dmem_hready_i),
  .dmem_badmem_e(dmem_badmem_e),
  .dmem_hburst_o(dmem_hburst_o),
  .dmem_hmastlock_o(dmem_hmastlock_o),
  .dmem_hprot_o(dmem_hprot_o),
  .dmem_htrans_o(dmem_htrans_o),

  // port to WB stage
  .stall_WB(stall_WB),
  .kill_WB(kill_WB),
  .exception_code_WB(exception_code_WB),
  .exception_int_WB(exception_int_WB),
  .retire_WB(retire_WB),
  .redirect_WB(redirect_WB),
  .wr_reg_WB(wr_reg_WB),
  .reg_to_wr_WB(reg_to_wr_WB),
  .wb_src_sel_WB(wb_src_sel_WB),
  .dmode_WB(dmode_WB),
  .prev_killed_WB(prev_killed_WB),
  .had_ex_WB(had_ex_WB)
  `ifdef ISA_EXT_P
  ,
  .pcpi_ready_mul_div(pcpi_ready_mul_div)
  `endif
`ifdef ISA_EXT_F
  //FPU
  ,
  .fpu_busy(fpu_busy),
  .fpu_ready(fpu_ready),
  .fpu_op(fpu_op_EX),
  .sel_fpu_rs1_EX(sel_fpu_rs1_EX),
  .sel_fpu_rs2_EX(sel_fpu_rs2_EX),
  .sel_fpu_rs3_EX(sel_fpu_rs3_EX),
  .sel_fpu_rd_EX(sel_fpu_rd_EX),
  .sel_fpu_rd_WB(sel_fpu_rd_WB),
  .load_fpu(load_fpu),
  .kill_fpu(kill_fpu)
`endif
);

// ==============================================================
// Program counter and Program counter MUX
//
// The program counter MUX selects the next program counter
// address from several possible inputs, e.g. a jump target address,
// an exception handler address or just the next instruction


airi5c_pc_mux PCmux(
  .pc_src_sel_i(PC_src_sel),
  .compressed_if_i(imem_compressed_IF),
  .compressed_ex_i(imem_compressed_EX),
  .inst_ex_i(inst_EX),
  .rs1_data_bypassed_i(rs1_data_bypassed),
  .pc_if_i(PC_IF),
  .pc_ex_i(PC_EX),
  .handler_pc_i(handler_PC),
  .epc_i(mepc),
  .dpc_i(dpc),
  .pc_pif_o(PC_PIF)
);
// ==============================================================

// ==============================================================
// IF stage

airi5c_fetch fetcher(
  .rst_ni(rst_ni),
  .clk_i(clk_i),

  .pc_pif_i(PC_PIF),
  .de_ready_i(de_ready),
  .kill_if_i(flush_pipeline),
  .pc_if_o(PC_IF),
  .inst_if_o(inst_IF),
  .if_valid_o(if_valid),
  .compressed_o(imem_compressed_IF),
  .predicted_branch_if_o(predicted_branch_if),
  .error_in_if_o(badmem_e_IF),

  .imem_hready_i(imem_hready_i),
  .imem_haddr_o(imem_haddr_o),
  .imem_hrdata_i(imem_hrdata_i),
  .imem_badmem_i(imem_badmem_e),
  .imem_htrans_o(imem_htrans_o),
  .imem_hburst_o(imem_hburst_o),
  .imem_hmastlock_o(imem_hmastlock_o),
  .imem_hprot_o(imem_hprot_o)
);

// ==============================================================
// Decode (DE) stage

airi5c_decode decoder(
  .clk_i(clk_i),
  .rst_ni(rst_ni),

  .if_valid_i(if_valid),
  .de_ready_o(de_ready),
  .ex_ready_i(ex_ready),
  .de_valid_o(de_valid),

  .predicted_branch_if_i(predicted_branch_if),
  .predicted_branch_de_o(predicted_branch_de),

  .inject_ebreak_i(inject_ebreak),
  .pc_if_i(PC_IF),
  .pc_de_o(PC_DE),
  .imem_compressed_if_i(imem_compressed_IF),
  .imem_compressed_de_o(imem_compressed_DE),
  .inst_if_i(inst_IF),
  .inst_de_o(inst_DE),
  .killed_de_i(flush_pipeline),
  .rs1_addr_de_o(rs1_addr_DE),
  .rs2_addr_de_o(rs2_addr_DE),
  .rs3_addr_de_o(rs3_addr_DE),
  .prv_i(prv),
  .alu_op_o(alu_op_DE),
  .src_a_sel_o(src_a_sel_DE),
  .src_b_sel_o(src_b_sel_DE),
  .src_c_sel_o(src_c_sel_DE),

  .dmem_en_unkilled_o(dmem_en_unkilled_DE),
  .dmem_wen_unkilled_o(dmem_wen_unkilled_DE),
  .wr_reg_unkilled_o(wr_reg_unkilled_DE),
  .illegal_instruction_o(illegal_instruction_DE),
  .jal_unkilled_o(jal_unkilled_DE),
  .jalr_unkilled_o(jalr_unkilled_DE),
  .loadstore_de_o(loadstore_DE),
  .eret_unkilled_o(eret_unkilled_DE),
  .fence_i_o(fence_i_DE),
  .csr_cmd_unkilled_o(csr_cmd_unkilled_DE),
  .uses_rs1_o(uses_rs1_DE),
  .uses_rs2_o(uses_rs2_DE),
  .uses_rs3_o(uses_rs3_DE),
  .imm_type_o(imm_type_DE),
  .pcpi_valid_o(pcpi_valid_DE),
  .wb_src_sel_o(wb_src_sel_DE),
  .uses_pcpi_unkilled_o(uses_pcpi_unkilled_DE),
  .dmem_size_o(dmem_size_DE),
  .dmem_type_o(dmem_type_DE),
  .csr_imm_sel_o(csr_imm_sel_DE),
  .ecall_o(ecall_DE),
  .ebreak_o(ebreak_DE),
  .dret_unkilled_o(dret_unkilled_DE),
  .wfi_unkilled_o(wfi_unkilled_DE)
`ifdef ISA_EXT_F
  ,
  .fpu_ena_i(fpu_ena),
  .fpu_op_o(fpu_op_DE),
  .sel_fpu_rs1_o(sel_fpu_rs1_DE),
  .sel_fpu_rs2_o(sel_fpu_rs2_DE),
  .sel_fpu_rs3_o(sel_fpu_rs3_DE),
  .sel_fpu_rd_o(sel_fpu_rd_DE)
`endif
);

// ================================================
// Execute stage

// DE->EX pipeline regs
airi5c_EX_pregs EX_pipeline_regs(
  .clk_i(clk_i),
  .rst_ni(rst_ni),

  .killed_de_i(flush_pipeline),
  .killed_ex_i(kill_EX),

  .flush_i(flush_pipeline), // kill_DE || kill_EX

  .stall_ex_i(stall_EX),

  .ex_ready_o(ex_ready),
  .ex_valid_o(ex_valid),
  .de_valid_i(de_valid),
  .wb_ready_i(1'b1),

  .predicted_branch_de_i(predicted_branch_de), // implement me.
  .predicted_branch_ex_o(predicted_branch_ex),     // implement me.

  .pc_de_i(PC_DE),
  .inst_de_i(inst_DE),
  .imem_compressed_de_i(imem_compressed_DE),
  .alu_op_de_i(alu_op_DE),
  .src_a_sel_de_i(src_a_sel_DE),
  .src_b_sel_de_i(src_b_sel_DE),
  .src_c_sel_de_i(src_c_sel_DE),
  .dmem_en_unkilled_de_i(dmem_en_unkilled_DE),
  .dmem_wen_unkilled_de_i(dmem_wen_unkilled_DE),
  .wr_reg_unkilled_de_i(wr_reg_unkilled_DE),
  .illegal_instruction_de_i(illegal_instruction_DE),
  .jal_unkilled_de_i(jal_unkilled_DE),
  .jalr_unkilled_de_i(jalr_unkilled_DE),
  .eret_unkilled_de_i(eret_unkilled_DE),
  .fence_i_de_i(fence_i_DE),
  .csr_cmd_unkilled_de_i(csr_cmd_unkilled_DE),
  .uses_rs1_de_i(uses_rs1_DE),
  .uses_rs2_de_i(uses_rs2_DE),
  .uses_rs3_de_i(uses_rs3_DE),
  .imm_type_de_i(imm_type_DE),
  .pcpi_valid_de_i(pcpi_valid_DE),
  .wb_src_sel_de_i(wb_src_sel_DE),
  .uses_pcpi_unkilled_de_i(uses_pcpi_unkilled_DE),
  .dmem_size_de_i(dmem_size_DE),
  .dmem_type_de_i(dmem_type_DE),
  .csr_imm_sel_de_i(csr_imm_sel_DE),
  .ecall_de_i(ecall_DE),
  .ebreak_de_i(ebreak_DE),
  .dret_unkilled_de_i(dret_unkilled_DE),
  .wfi_unkilled_de_i(wfi_unkilled_DE),
  .rs1_addr_de_i(rs1_addr_DE),
  .rs2_addr_de_i(rs2_addr_DE),
  .rs3_addr_de_i(rs3_addr_DE),
  .loadstore_de_i(loadstore_DE),

`ifdef ISA_EXT_F
  .fpu_op_de_i(fpu_op_DE),
  .sel_fpu_rs1_de_i(sel_fpu_rs1_DE),
  .sel_fpu_rs2_de_i(sel_fpu_rs2_DE),
  .sel_fpu_rs3_de_i(sel_fpu_rs3_DE),
  .sel_fpu_rd_de_i(sel_fpu_rd_DE),
`endif

  .PC_EX_o(PC_EX),
  .inst_EX_o(inst_EX),
  .imem_compressed_EX_o(imem_compressed_EX),
  .alu_op_EX_o(alu_op_EX),
  .src_a_sel_EX_o(src_a_sel_EX),
  .src_b_sel_EX_o(src_b_sel_EX),
  .src_c_sel_EX_o(src_c_sel_EX),
  .dmem_en_unkilled_EX_o(dmem_en_unkilled_EX),
  .dmem_wen_unkilled_EX_o(dmem_wen_unkilled_EX),
  .wr_reg_unkilled_EX_o(wr_reg_unkilled_EX),
  .illegal_instruction_EX_o(illegal_instruction_EX),
  .jal_unkilled_EX_o(jal_unkilled_EX),
  .jalr_unkilled_EX_o(jalr_unkilled_EX),
  .eret_unkilled_EX_o(eret_unkilled_EX),
  .fence_i_EX_o(fence_i_EX),
  .csr_cmd_unkilled_EX_o(csr_cmd_unkilled_EX),
  .uses_rs1_EX_o(uses_rs1_EX),
  .uses_rs2_EX_o(uses_rs2_EX),
  .uses_rs3_EX_o(uses_rs3_EX),
  .imm_type_EX_o(imm_type_EX),
  .pcpi_valid_unkilled_EX_o(pcpi_valid_unkilled_EX),
  .wb_src_sel_EX_o(wb_src_sel_EX),
  .uses_pcpi_unkilled_EX_o(uses_pcpi_unkilled_EX),
  .dmem_size_EX_o(dmem_size_EX),
  .dmem_type_EX_o(dmem_type_EX),
  .csr_imm_sel_EX_o(csr_imm_sel_EX),
  .ecall_EX_o(ecall_EX),
  .ebreak_EX_o(ebreak_EX),
  .dret_unkilled_EX_o(dret_unkilled_EX),
  .wfi_unkilled_EX_o(wfi_unkilled_EX),
  .rs1_addr_EX_o(rs1_addr_EX),
  .rs2_addr_EX_o(rs2_addr_EX),
  .rs3_addr_EX_o(rs3_addr_EX),
  .loadstore_EX_o(loadstore_EX)
`ifdef ISA_EXT_F
  ,
  .fpu_op_EX_o(fpu_op_EX),
  .sel_fpu_rs1_EX_o(sel_fpu_rs1_EX),
  .sel_fpu_rs2_EX_o(sel_fpu_rs2_EX),
  .sel_fpu_rs3_EX_o(sel_fpu_rs3_EX),
  .sel_fpu_rd_EX_o(sel_fpu_rd_EX)
`endif
);

assign rs1_addr    = rs1_addr_EX;
assign rs2_addr    = rs2_addr_EX;
assign rs3_addr    = rs3_addr_EX;
assign alu_op      = alu_op_EX;
assign src_a_sel   = src_a_sel_EX;
assign src_b_sel   = src_b_sel_EX;
//assign src_c_sel   = src_c_sel_EX;
assign imm_type    = imm_type_EX;
assign pcpi_valid  = pcpi_valid_EX;
assign dmem_hsize_o   = dmem_size_EX;

// ==============================================================

airi5c_regfile regfile(
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .ra1_i(rs1_addr),
  .rd1_o(rs1_data),
  .ra2_i(rs2_addr),
  .rd2_o(rs2_data),
  .ra3_i(rs3_addr),
  .rd3_o(rs3_data),
  .wen_i(wr_reg_WB),
  .wa_i(reg_to_wr_WB),
  .wd_i(wb_data_WB),
  .wd2_i(pcpi_rd2_WB),
  .use_rd64_i(pcpi_rd64_WB),
`ifdef ISA_EXT_F
  .sel_fpu_rs1_i(sel_fpu_rs1_EX),
  .sel_fpu_rs2_i(sel_fpu_rs2_EX),
  .sel_fpu_rs3_i(sel_fpu_rs3_EX),
  .sel_fpu_rd_i(sel_fpu_rd_WB),
  .dm_sel_fpu_reg_i(dm_sel_fpu_reg),
`endif
  .dm_wara_i(dm_wara),
  .dm_rd_o(dm_rd),
  .dm_wd_i(dm_wd),
  .dm_wen_i(dm_wen)
);

airi5c_imm_gen imm_gen(
  .inst_i(inst_EX),
  .imm_type_i(imm_type),
  .imm_o(imm)
);

airi5c_src_a_mux src_a_mux(
  .src_a_sel_i(src_a_sel),
  .pc_ex_i(PC_EX),
  .rs1_data_i(rs1_data_bypassed),
  .alu_src_a_o(alu_src_a)
);

airi5c_src_b_mux src_b_mux(
  .src_b_sel_i(src_b_sel),
  .was_compressed_i(imem_compressed_EX),
  .imm_i(imm),
  .rs2_data_i(rs2_data_bypassed),
  .alu_src_b_o(alu_src_b)
);

assign rs1_data_bypassed = bypass_rs1 ? bypass_data_WB : rs1_data;
assign rs2_data_bypassed = bypass_rs2 ? bypass_data_WB : rs2_data;
assign rs3_data_bypassed = bypass_rs3 ? bypass_data_WB : rs3_data;

airi5c_alu alu(
  .op_i(alu_op),
  .in1_i(alu_src_a),
  .in2_i(alu_src_b),
  .out_o(alu_out),
  .cmp_true_o(cmp_true)
);

// a comparison performed by the ALU (BEQ, BEL, ...)
// sets the LSB according to the result.

//assign cmp_true = alu_out[0];

`ifdef ISA_EXT_F
  airi5c_FPU FPU
  (
    .clk(clk_i),
    .n_reset(rst_ni),
    .kill(kill_fpu),
    .load(load_fpu),

    .op(fpu_op_EX),
    .rm(inst_EX[14:12] == `FPU_RM_DYN ? rounding_mode : inst_EX[14:12]),

    .a(rs1_data_bypassed),
    .b(rs2_data_bypassed),
    .c(rs3_data_bypassed),

    .result(fpu_out),

	.IV(NV),
    .DZ(DZ),
    .OF(OF),
    .UF(UF),
    .IE(NX),

	.busy(fpu_busy),
    .ready(fpu_ready)
  );
`endif

// ==============================================================
// DMEM address latch
airi5c_dmem_latch the_dmem_latch(
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .alu_out_i(alu_out),
  .loadstore_EX_i(loadstore_EX),
  .dmem_addr_o(dmem_haddr_o)
);
// ==============================================================

// ==============================================================
// MEM pipeline registers



// ==============================================================
// WB pipeline registers
//
// these are the pipeline registers between EX and WB stage

airi5c_WB_pregs WB_pipeline_regs(
  .clk_i(clk_i),
  .rst_ni(rst_ni),

  .stall_WB_i(stall_WB),

  .PC_EX_i(PC_EX),
  .killed_EX_i(kill_EX),
  .ex_EX_i(ex_EX),
  .alu_out_i(alu_out),
  .csr_rdata_i(csr_rdata),
  .dmem_type_i(dmem_type_EX),
  .store_data_i(dmem_hwrite_o ? rs2_data_bypassed : 0),
  .pcpi_rd_i(pcpi_rd),
  .pcpi_rd2_i(pcpi_rd2),
  .pcpi_use_rd64_i(pcpi_use_rd64),
  .inst_ex_i(inst_EX),
  .rs1_data_i(rs1_data_bypassed),

  .PC_WB_o(PC_WB),
  .prev_killed_WB_o(prev_killed_WB),
  .had_ex_WB_o(had_ex_WB),
  .alu_out_wb_o(alu_out_WB),
  .csr_rdata_wb_o(csr_rdata_WB),
  .dmem_type_wb_o(dmem_type_WB),
  .store_data_wb_o(store_data_WB),
  .pcpi_rd_wb_o(pcpi_rd_WB),
  .pcpi_rd2_wb_o(pcpi_rd2_WB),
  .pcpi_use_rd64_wb_o(pcpi_rd64_WB),
  .inst_wb_o(inst_WB),
  .rs1_data_wb_o(rs1_data_WB)

`ifdef ISA_EXT_F
  ,
  .fpu_out_i(fpu_out),
  .fpu_out_wb_o(fpu_out_WB)
`endif

);

// ==============================================================
// WB multiplexer

airi5c_wb_src_mux wb_src_mux(
  .wb_src_sel_i(wb_src_sel_WB),
  .store_data_wb_i(store_data_WB),

  .csr_rdata_wb_i(csr_rdata_WB),
  .pcpi_rd_wb_i(pcpi_rd_WB),
  .rs1_data_wb_i(rs1_data_WB),
  .alu_out_wb_i(alu_out_WB),
`ifdef ISA_EXT_F
  .fpu_out_wb_i(fpu_out_WB),
`endif
  .dmem_rdata_i(dmem_hrdata_i),
  .dmem_type_wb_i(dmem_type_WB),
  .dmem_hwdata_o(dmem_hwdata_o),

  .bypass_data_wb_o(bypass_data_WB),
  .wb_data_wb_o(wb_data_WB)
);

//assign dmem_hwdata_o = store_data(alu_out_WB,store_data_WB,dmem_type_WB);


// ==============================================================
// Control and status register (CSR) file
//

assign csr_addr  = inst_EX[31:20];
assign csr_wdata = csr_imm_sel_EX ? {27'd0,inst_EX[19:15]} : rs1_data_bypassed;

// instantiation of the CSR file
airi5c_csr_file csr(
  .clk(clk_i),
  .nreset(rst_ni),

  .ext_interrupts(ext_interrupts),
  .system_timer_tick(system_timer_tick),
  .debug_haltreq(debug_haltreq),
  .interrupt_pending(interrupt_pending),
  .interrupt_taken(interrupt_taken),
  .interrupt_code_EX(interrupt_code_EX),

  .debug_handler_addr(`DEBUG_HANDLER),
  .handler_PC(handler_PC),

  .addr(csr_addr),
  .cmd(csr_cmd),
  .rdata(csr_rdata),
  .wdata(csr_wdata),

  .dm_csr_addr(dm_csr_addr),
  .dm_csr_cmd(dm_csr_cmd),
  .dm_csr_rdata(dm_csr_rdata),
  .dm_csr_wdata(dm_csr_wdata),

  .mepc(mepc),
  .dpc(dpc),
  .eret(eret),
  .dret(dret),
  .stepmode(stepmode),

  .prv(prv),
  .illegal_access(illegal_csr_access),
  .illegal_access_debug(dm_illegal_csr_access),

  .exception(had_ex_WB),
  .exception_PC(PC_WB),
  .interrupt_PC(PC_EX),
  .exception_code(exception_code_WB),
  .exception_int(exception_int_WB),
  .exception_load_addr(alu_out_WB),

  .inst_WB(inst_WB),
  .retire(retire_WB),
  .redirect(redirect_WB),
  .stall_WB(stall_WB),

`ifdef ISA_EXT_F
  .fpu_op(fpu_op_EX),
  .fpu_ready(fpu_ready),
  .NX(NX),
  .UF(UF),
  .OF(OF),
  .DZ(DZ),
  .NV(NV),
  .rounding_mode(rounding_mode),
  .fpu_ena(fpu_ena),
  .fpu_reg_dirty(sel_fpu_rd_WB && wr_reg_WB),
`endif
  .dmode_WB(dmode_WB)
);

endmodule
