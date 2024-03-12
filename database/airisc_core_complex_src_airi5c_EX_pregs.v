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
`timescale 1ns/100ps

`include "airi5c_ctrl_constants.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_alu_ops.vh"
`include "airi5c_arch_options.vh"
`include "rv32_opcodes.vh"

`ifdef ISA_EXT_F
  `include "modules/airi5c_fpu/airi5c_FPU_constants.vh"
`endif

module airi5c_EX_pregs(
  input                           clk_i,
  input                           rst_ni,


  input                           flush_i, 

  input                           killed_de_i,
  input                           killed_ex_i,
  input                           stall_ex_i,

  input                           de_valid_i,
  input                           wb_ready_i,
  output                          ex_ready_o,
  output                          ex_valid_o,


  input   [`XPR_LEN-1:0]          pc_de_i,
  input   [`INST_WIDTH-1:0]       inst_de_i,
  input                           imem_compressed_de_i,
  input   [`ALU_OP_WIDTH-1:0]     alu_op_de_i,
  input   [`SRC_A_SEL_WIDTH-1:0]  src_a_sel_de_i,
  input   [`SRC_B_SEL_WIDTH-1:0]  src_b_sel_de_i,
  input   [`SRC_C_SEL_WIDTH-1:0]  src_c_sel_de_i,
  input                           dmem_en_unkilled_de_i,
  input                           dmem_wen_unkilled_de_i,
  input                           wr_reg_unkilled_de_i,
  input                           illegal_instruction_de_i,
  input                           jal_unkilled_de_i,
  input                           jalr_unkilled_de_i,
  input                           eret_unkilled_de_i,
  input                           fence_i_de_i,
  input   [`CSR_CMD_WIDTH-1:0]    csr_cmd_unkilled_de_i,
  input                           uses_rs1_de_i,
  input                           uses_rs2_de_i,
  input                           uses_rs3_de_i,
  input   [`IMM_TYPE_WIDTH-1:0]   imm_type_de_i,
  input                           pcpi_valid_de_i,
  input   [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_de_i,
  input                           uses_pcpi_unkilled_de_i,
  input   [2:0]                   dmem_size_de_i,
  input   [`MEM_TYPE_WIDTH-1:0]   dmem_type_de_i,
  input                           csr_imm_sel_de_i,
  input                           ecall_de_i,
  input                           ebreak_de_i,
  input                           dret_unkilled_de_i,
  input                           wfi_unkilled_de_i,
  input   [4:0]                   rs1_addr_de_i,
  input   [4:0]                   rs2_addr_de_i,
  input   [4:0]                   rs3_addr_de_i,
  input                           loadstore_de_i,
  input                           predicted_branch_de_i,

`ifdef ISA_EXT_F
  // FPU
  input   [`FPU_OP_WIDTH-1:0]     fpu_op_de_i,
  input                           sel_fpu_rs1_de_i,
  input                           sel_fpu_rs2_de_i,
  input                           sel_fpu_rs3_de_i,
  input                           sel_fpu_rd_de_i,
`endif

  output  [`XPR_LEN-1:0]          PC_EX_o,
  output  [`INST_WIDTH-1:0]       inst_EX_o,
  output                          imem_compressed_EX_o,
  output  [`ALU_OP_WIDTH-1:0]     alu_op_EX_o,
  output  [`SRC_A_SEL_WIDTH-1:0]  src_a_sel_EX_o,
  output  [`SRC_B_SEL_WIDTH-1:0]  src_b_sel_EX_o,
  output  [`SRC_C_SEL_WIDTH-1:0]  src_c_sel_EX_o,
  output                          dmem_en_unkilled_EX_o,
  output                          dmem_wen_unkilled_EX_o,
  output                          wr_reg_unkilled_EX_o,
  output                          illegal_instruction_EX_o,
  output                          jal_unkilled_EX_o,
  output                          jalr_unkilled_EX_o,
  output                          eret_unkilled_EX_o,
  output                          fence_i_EX_o,
  output  [`CSR_CMD_WIDTH-1:0]    csr_cmd_unkilled_EX_o,
  output                          uses_rs1_EX_o,
  output                          uses_rs2_EX_o,
  output                          uses_rs3_EX_o,
  output  [`IMM_TYPE_WIDTH-1:0]   imm_type_EX_o,
  output                          pcpi_valid_unkilled_EX_o,
  output  [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_EX_o,
  output                          uses_pcpi_unkilled_EX_o,
  output  [2:0]                   dmem_size_EX_o,
  output  [`MEM_TYPE_WIDTH-1:0]   dmem_type_EX_o,
  output                          csr_imm_sel_EX_o,
  output                          ecall_EX_o,
  output                          ebreak_EX_o,
  output                          dret_unkilled_EX_o,
  output                          wfi_unkilled_EX_o,
  output  [4:0]                   rs1_addr_EX_o,
  output  [4:0]                   rs2_addr_EX_o,
  output  [4:0]                   rs3_addr_EX_o,
  output                          loadstore_EX_o,
  output                          predicted_branch_ex_o

`ifdef ISA_EXT_F
  ,
  // FPU
  output  [`FPU_OP_WIDTH-1:0]     fpu_op_EX_o,
  output                          sel_fpu_rs1_EX_o,
  output                          sel_fpu_rs2_EX_o,
  output                          sel_fpu_rs3_EX_o,
  output                          sel_fpu_rd_EX_o
`endif
);

  reg ex_valid_r;
  assign ex_valid_o = ex_valid_r;
  assign ex_ready_o = ~stall_ex_i;

  reg   [`XPR_LEN-1:0]          PC_EX_d;
  reg   [`INST_WIDTH-1:0]       inst_EX_d;
  reg                           imem_compressed_EX_d;
  reg   [`ALU_OP_WIDTH-1:0]     alu_op_EX_d;
  reg   [`SRC_A_SEL_WIDTH-1:0]  src_a_sel_EX_d;
  reg   [`SRC_B_SEL_WIDTH-1:0]  src_b_sel_EX_d;
  reg   [`SRC_C_SEL_WIDTH-1:0]  src_c_sel_EX_d;
  reg                           dmem_en_unkilled_EX_d;
  reg                           dmem_wen_unkilled_EX_d;
  reg                           wr_reg_unkilled_EX_d;
  reg                           illegal_instruction_EX_d;
  reg                           jal_unkilled_EX_d;
  reg                           jalr_unkilled_EX_d;
  reg                           eret_unkilled_EX_d;
  reg                           fence_i_EX_d;
  reg   [`CSR_CMD_WIDTH-1:0]    csr_cmd_unkilled_EX_d;
  reg                           uses_rs1_EX_d;
  reg                           uses_rs2_EX_d;
  reg                           uses_rs3_EX_d;
  reg   [`IMM_TYPE_WIDTH-1:0]   imm_type_EX_d;
  reg                           pcpi_valid_unkilled_EX_d;
  reg   [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_EX_d;
  reg                           uses_pcpi_unkilled_EX_d;
  reg   [2:0]                   dmem_size_EX_d;
  reg   [`MEM_TYPE_WIDTH-1:0]   dmem_type_EX_d;
  reg                           csr_imm_sel_EX_d;
  reg                           ecall_EX_d;
  reg                           ebreak_EX_d;
  reg                           dret_unkilled_EX_d;
  reg                           wfi_unkilled_EX_d;
  reg   [4:0]                   rs1_addr_EX_d;
  reg   [4:0]                   rs2_addr_EX_d;
  reg   [4:0]                   rs3_addr_EX_d;
  reg                           loadstore_EX_d;
  reg                           predicted_branch_ex_d;

`ifdef ISA_EXT_F
  // FPU
  reg   [`FPU_OP_WIDTH-1:0]     fpu_op_EX_d;
  reg                           sel_fpu_rs1_EX_d;
  reg                           sel_fpu_rs2_EX_d;
  reg                           sel_fpu_rs3_EX_d;
  reg                           sel_fpu_rd_EX_d;
`endif


  assign PC_EX_o                  = PC_EX_d;
  assign inst_EX_o                = inst_EX_d;
  assign imem_compressed_EX_o     = imem_compressed_EX_d;
  assign alu_op_EX_o              = alu_op_EX_d;
  assign src_a_sel_EX_o           = src_a_sel_EX_d;
  assign src_b_sel_EX_o           = src_b_sel_EX_d;
  assign src_c_sel_EX_o           = src_c_sel_EX_d;
  assign dmem_en_unkilled_EX_o    = dmem_en_unkilled_EX_d;
  assign dmem_wen_unkilled_EX_o   = dmem_wen_unkilled_EX_d;
  assign wr_reg_unkilled_EX_o     = wr_reg_unkilled_EX_d;
  assign illegal_instruction_EX_o = illegal_instruction_EX_d;
  assign jal_unkilled_EX_o        = jal_unkilled_EX_d;
  assign jalr_unkilled_EX_o       = jalr_unkilled_EX_d;
  assign eret_unkilled_EX_o      = eret_unkilled_EX_d;
  assign fence_i_EX_o             = fence_i_EX_d;
  assign csr_cmd_unkilled_EX_o    = csr_cmd_unkilled_EX_d;
  assign uses_rs1_EX_o            = uses_rs1_EX_d;
  assign uses_rs2_EX_o            = uses_rs2_EX_d;
  assign uses_rs3_EX_o            = uses_rs3_EX_d;
  assign imm_type_EX_o            = imm_type_EX_d;
  assign pcpi_valid_unkilled_EX_o = pcpi_valid_unkilled_EX_d;
  assign wb_src_sel_EX_o          = wb_src_sel_EX_d;
  assign uses_pcpi_unkilled_EX_o  = uses_pcpi_unkilled_EX_d;
  assign dmem_size_EX_o           = dmem_size_EX_d;
  assign dmem_type_EX_o           = dmem_type_EX_d;
  assign csr_imm_sel_EX_o         = csr_imm_sel_EX_d;
  assign ecall_EX_o               = ecall_EX_d;
  assign ebreak_EX_o              = ebreak_EX_d;
  assign dret_unkilled_EX_o       = dret_unkilled_EX_d;
  assign wfi_unkilled_EX_o        = wfi_unkilled_EX_d;
  assign rs1_addr_EX_o            = rs1_addr_EX_d;
  assign rs2_addr_EX_o            = rs2_addr_EX_d;
  assign rs3_addr_EX_o            = rs3_addr_EX_d;
  assign loadstore_EX_o           = loadstore_EX_d;
  assign predicted_branch_ex_o    = predicted_branch_ex_d;

`ifdef ISA_EXT_F
  // FPU
  assign fpu_op_EX_o              = fpu_op_EX_d;
  assign sel_fpu_rs1_EX_o         = sel_fpu_rs1_EX_d;
  assign sel_fpu_rs2_EX_o         = sel_fpu_rs2_EX_d;
  assign sel_fpu_rs3_EX_o         = sel_fpu_rs3_EX_d;
  assign sel_fpu_rd_EX_o          = sel_fpu_rd_EX_d;
`endif


  always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
      ex_valid_r               <= 1'b0;
      PC_EX_d                  <= `START_HANDLER;
      inst_EX_d                <= `RV_NOP; 
      imem_compressed_EX_d     <= 1'b0;
      rs1_addr_EX_d            <= 0;
      rs2_addr_EX_d            <= 0;
      rs3_addr_EX_d            <= 0;
      alu_op_EX_d              <= `ALU_OP_ADD;
      src_a_sel_EX_d           <= `SRC_A_RS1;
      src_b_sel_EX_d           <= `SRC_B_IMM;
      src_c_sel_EX_d           <= `SRC_C_ZERO;
      dmem_en_unkilled_EX_d    <= 1'b0;
      dmem_wen_unkilled_EX_d   <= 1'b0;
      wr_reg_unkilled_EX_d     <= 1'b0;
      illegal_instruction_EX_d <= 1'b0;
      jal_unkilled_EX_d        <= 1'b0;
      jalr_unkilled_EX_d       <= 1'b0;
      eret_unkilled_EX_d       <= 1'b0;
      fence_i_EX_d             <= 1'b0;
      csr_cmd_unkilled_EX_d    <= `CSR_IDLE;
      uses_rs1_EX_d            <= 1'b1;
      uses_rs2_EX_d            <= 1'b0;
      uses_rs3_EX_d            <= 1'b0;
      imm_type_EX_d            <= `IMM_I;
      pcpi_valid_unkilled_EX_d <= 1'b0;
      wb_src_sel_EX_d          <= `WB_SRC_ALU;
      uses_pcpi_unkilled_EX_d  <= 1'b0;
      dmem_size_EX_d           <= 3'h2;
      dmem_type_EX_d           <= 0;
      csr_imm_sel_EX_d         <= 1'b0;
      ecall_EX_d               <= 1'b0;
      ebreak_EX_d              <= 1'b0;
      dret_unkilled_EX_d       <= 1'b0;
      wfi_unkilled_EX_d        <= 1'b0;
      loadstore_EX_d           <= 1'b0;
      predicted_branch_ex_d    <= 1'b0;
`ifdef ISA_EXT_F
      fpu_op_EX_d              <= 0;
      sel_fpu_rs1_EX_d         <= 0;
      sel_fpu_rs2_EX_d         <= 0;
      sel_fpu_rs3_EX_d         <= 0;
      sel_fpu_rd_EX_d          <= 0;
`endif
    end else if (~stall_ex_i) begin
      if (killed_de_i | killed_ex_i) begin
        ex_valid_r               <= 1'b0;
        inst_EX_d                <= `RV_NOP;  
        rs1_addr_EX_d            <= 0;
        rs2_addr_EX_d            <= 0;
        rs3_addr_EX_d            <= 0;
        alu_op_EX_d              <= `ALU_OP_ADD;
        src_a_sel_EX_d           <= `SRC_A_RS1;
        src_b_sel_EX_d           <= `SRC_B_IMM;
        src_c_sel_EX_d           <= `SRC_C_ZERO;
        dmem_en_unkilled_EX_d    <= 1'b0;
        dmem_wen_unkilled_EX_d   <= 1'b0;
        wr_reg_unkilled_EX_d     <= 1'b0;
        illegal_instruction_EX_d <= 1'b0;
        jal_unkilled_EX_d        <= 1'b0;
        jalr_unkilled_EX_d       <= 1'b0;
        eret_unkilled_EX_d       <= 1'b0;
        fence_i_EX_d             <= 1'b0;
        csr_cmd_unkilled_EX_d    <= `CSR_IDLE;
        uses_rs1_EX_d            <= 1'b1;
        uses_rs2_EX_d            <= 1'b0;
        uses_rs3_EX_d            <= 1'b0;
        imm_type_EX_d            <= `IMM_I;
        pcpi_valid_unkilled_EX_d <= 1'b0;
        wb_src_sel_EX_d          <= `WB_SRC_ALU;
        uses_pcpi_unkilled_EX_d  <= 1'b0;
        dmem_size_EX_d           <= 3'h2;
        dmem_type_EX_d           <= 0;
        csr_imm_sel_EX_d         <= 1'b0;
        ecall_EX_d               <= 1'b0;
        ebreak_EX_d              <= 1'b0;
        dret_unkilled_EX_d       <= 1'b0;
        wfi_unkilled_EX_d        <= 1'b0;
        loadstore_EX_d           <= 1'b0;
        predicted_branch_ex_d    <= 1'b0;
`ifdef ISA_EXT_F
        fpu_op_EX_d              <= 0;
        sel_fpu_rs1_EX_d         <= 0;
        sel_fpu_rs2_EX_d         <= 0;
        sel_fpu_rs3_EX_d         <= 0;
        sel_fpu_rd_EX_d          <= 0;
`endif
      end else begin
        ex_valid_r               <= de_valid_i;
        PC_EX_d                  <= pc_de_i;     
        imem_compressed_EX_d     <= imem_compressed_de_i;
        inst_EX_d                <= inst_de_i;
        rs1_addr_EX_d            <= rs1_addr_de_i;
        rs2_addr_EX_d            <= rs2_addr_de_i;
        rs3_addr_EX_d            <= rs3_addr_de_i;
        alu_op_EX_d              <= alu_op_de_i;
        src_a_sel_EX_d           <= src_a_sel_de_i;
        src_b_sel_EX_d           <= src_b_sel_de_i;
        src_c_sel_EX_d           <= src_c_sel_de_i;
        dmem_en_unkilled_EX_d    <= dmem_en_unkilled_de_i;
        dmem_wen_unkilled_EX_d   <= dmem_wen_unkilled_de_i;
        wr_reg_unkilled_EX_d     <= wr_reg_unkilled_de_i;
        illegal_instruction_EX_d <= illegal_instruction_de_i;
        jal_unkilled_EX_d        <= jal_unkilled_de_i;
        jalr_unkilled_EX_d       <= jalr_unkilled_de_i;
        eret_unkilled_EX_d       <= eret_unkilled_de_i;
        fence_i_EX_d             <= fence_i_de_i;
        csr_cmd_unkilled_EX_d    <= csr_cmd_unkilled_de_i; 
        uses_rs1_EX_d            <= uses_rs1_de_i;
        uses_rs2_EX_d            <= uses_rs2_de_i;
        uses_rs3_EX_d            <= uses_rs3_de_i;
        imm_type_EX_d            <= imm_type_de_i;
        pcpi_valid_unkilled_EX_d <= pcpi_valid_de_i;
        wb_src_sel_EX_d          <= wb_src_sel_de_i;
        uses_pcpi_unkilled_EX_d  <= uses_pcpi_unkilled_de_i;
        dmem_size_EX_d           <= dmem_size_de_i;
        dmem_type_EX_d           <= dmem_type_de_i;
        csr_imm_sel_EX_d         <= csr_imm_sel_de_i;
        ecall_EX_d               <= ecall_de_i;
        ebreak_EX_d              <= ebreak_de_i;
        dret_unkilled_EX_d       <= dret_unkilled_de_i;
        wfi_unkilled_EX_d        <= wfi_unkilled_de_i;
        loadstore_EX_d           <= loadstore_de_i;
        predicted_branch_ex_d    <= predicted_branch_de_i;
`ifdef ISA_EXT_F
        fpu_op_EX_d              <= fpu_op_de_i;
        sel_fpu_rs1_EX_d         <= sel_fpu_rs1_de_i;
        sel_fpu_rs2_EX_d         <= sel_fpu_rs2_de_i;
        sel_fpu_rs3_EX_d         <= sel_fpu_rs3_de_i;
        sel_fpu_rd_EX_d          <= sel_fpu_rd_de_i;
`endif
      end
    end
  end
endmodule

