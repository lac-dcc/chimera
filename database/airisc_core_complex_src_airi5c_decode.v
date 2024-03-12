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
// File             : airi5c_decode.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : Wed Mar  8 10:12:38 CET 2023
// Version          : 1.0
// Abstract         : Instruction decoder 
//
`timescale 1ns/100ps


`include "airi5c_ctrl_constants.vh"
`include "airi5c_alu_ops.vh"
`include "rv32_opcodes.vh"

`ifdef ISA_EXT_F
  `include "modules/airi5c_fpu/airi5c_FPU_constants.vh"
`endif

module airi5c_decode(
  input                          clk_i,
  input                          rst_ni,
  input                          inject_ebreak_i,
  input  [`XPR_LEN-1:0]          pc_if_i,
  output [`XPR_LEN-1:0]          pc_de_o,


  output                         de_ready_o,
  input                          if_valid_i,
  output                         de_valid_o, 
  input                          ex_ready_i,


  input  [`XPR_LEN-1:0]          inst_if_i,
  output [`XPR_LEN-1:0]          inst_de_o,
  input                          killed_de_i,
  input                          predicted_branch_if_i,
  output                         predicted_branch_de_o,
  input                          imem_compressed_if_i,
  output                         imem_compressed_de_o,
  output                         loadstore_de_o,
  input  [`PRV_WIDTH-1:0]        prv_i,
  output [`ALU_OP_WIDTH-1:0]     alu_op_o,
  output [`SRC_A_SEL_WIDTH-1:0]  src_a_sel_o,
  output [`SRC_B_SEL_WIDTH-1:0]  src_b_sel_o,
  output [`SRC_C_SEL_WIDTH-1:0]  src_c_sel_o,
  output [4:0]                   rs1_addr_de_o,
  output [4:0]                   rs2_addr_de_o,
  output [4:0]                   rs3_addr_de_o,
  output                         dmem_en_unkilled_o,
  output                         dmem_wen_unkilled_o,
  output                         wr_reg_unkilled_o,
  output                         illegal_instruction_o,
  output                         jal_unkilled_o,
  output                         jalr_unkilled_o,
  output                         eret_unkilled_o,
  output                         fence_i_o,
  output [`CSR_CMD_WIDTH-1:0]    csr_cmd_unkilled_o,
  output                         uses_rs1_o,
  output                         uses_rs2_o,
  output                         uses_rs3_o,
  output [`IMM_TYPE_WIDTH-1:0]   imm_type_o,
  output                         pcpi_valid_o,
  output [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_o,
  output                         uses_pcpi_unkilled_o,
  output [2:0]                   dmem_size_o,
  output [`MEM_TYPE_WIDTH-1:0]   dmem_type_o,
  output                         csr_imm_sel_o,
  output                         ebreak_o,
  output                         ecall_o,
  output                         dret_unkilled_o,
  output                         wfi_unkilled_o
  
  `ifdef ISA_EXT_F
  ,
  // FPU
  input                       fpu_ena_i,
  output [`FPU_OP_WIDTH-1:0]  fpu_op_o,
  output                      sel_fpu_rs1_o,
  output                      sel_fpu_rs2_o,
  output                      sel_fpu_rs3_o,
  output                      sel_fpu_rd_o
  `endif
  );

  reg                         de_valid_r;
  assign                      de_ready_o = ex_ready_i;
  assign                      de_valid_o = de_valid_r;

 
  reg  [`XPR_LEN-1:0]         inst_de_r;
  assign                      inst_de_o = inst_de_r;
  reg  [`XPR_LEN-1:0]         pc_de_r;
  assign                      pc_de_o = pc_de_r;

  reg                         predicted_branch_de_r;
  assign                      predicted_branch_de_o = predicted_branch_de_r;
  
  reg                         imem_compressed_de_r;
  assign                      imem_compressed_de_o = imem_compressed_de_r;
  assign                      loadstore_de_o = (inst_de_r[6:0] == `RV32_LOAD || inst_de_r[6:0] == `RV32_STORE ||
                                            inst_de_r[6:0] == `RV32_F_LOAD || inst_de_r[6:0] == `RV32_F_STORE);

  assign                      rs1_addr_de_o = inst_de_o[19:15];
  assign                      rs2_addr_de_o = inst_de_o[24:20];
  assign                      rs3_addr_de_o = inst_de_o[31:27];

  wire [6:0]                  opcode   = inst_de_r[6:0];
  wire [6:0]                  funct7   = inst_de_r[31:25];
  wire [11:0]                 funct12  = inst_de_r[31:20];
  wire [2:0]                  funct3   = inst_de_r[14:12];
  wire [`REG_ADDR_WIDTH-1:0]  rs1_addr = inst_de_r[19:15];
  wire [`REG_ADDR_WIDTH-1:0]  rs2_addr = inst_de_r[24:20];
  wire [`REG_ADDR_WIDTH-1:0]  rs3_addr = inst_de_r[31:27];
  wire [`REG_ADDR_WIDTH-1:0]  reg_to_wr_dx = inst_de_r[11:7];

  reg  [`ALU_OP_WIDTH-1:0]      alu_op_r;              assign alu_op_o = alu_op_r;
  reg  [`ALU_OP_WIDTH-1:0]      alu_op_arith_r;        
  reg  [`SRC_A_SEL_WIDTH-1:0]   src_a_sel_r;           assign src_a_sel_o = src_a_sel_r;
  reg  [`SRC_B_SEL_WIDTH-1:0]   src_b_sel_r;           assign src_b_sel_o = src_b_sel_r;
  reg  [`SRC_C_SEL_WIDTH-1:0]   src_c_sel_r;           assign src_c_sel_o = src_c_sel_r;
  reg                           dmem_en_unkilled_r;    assign dmem_en_unkilled_o = dmem_en_unkilled_r;
  reg                           dmem_wen_unkilled_r;   assign dmem_wen_unkilled_o = dmem_wen_unkilled_r;
  reg                           wr_reg_unkilled_r;     assign wr_reg_unkilled_o = wr_reg_unkilled_r;
  reg                           illegal_instruction_r; assign illegal_instruction_o = illegal_instruction_r;
  reg                           jal_unkilled_r;        assign jal_unkilled_o = jal_unkilled_r;
  reg                           jalr_unkilled_r;       assign jalr_unkilled_o = jalr_unkilled_r;
  reg                           eret_unkilled_r;       assign eret_unkilled_o = eret_unkilled_r;
  reg                           fence_i_r;             assign fence_i_o = fence_i_r;
  reg  [`CSR_CMD_WIDTH-1:0]     csr_cmd_unkilled_r;    assign csr_cmd_unkilled_o = csr_cmd_unkilled_r;
  reg                           uses_rs1_r;            assign uses_rs1_o = uses_rs1_r;
  reg                           uses_rs2_r;            assign uses_rs2_o = uses_rs2_r;
  reg                           uses_rs3_r;            assign uses_rs3_o = uses_rs3_r;
  reg  [`IMM_TYPE_WIDTH-1:0]    imm_type_r;            assign imm_type_o = imm_type_r;
  reg                           pcpi_valid_r;          assign pcpi_valid_o = pcpi_valid_r;
  reg  [`WB_SRC_SEL_WIDTH-1:0]  wb_src_sel_r;          assign wb_src_sel_o = wb_src_sel_r;
  reg                           uses_pcpi_unkilled_r;  assign uses_pcpi_unkilled_o = uses_pcpi_unkilled_r;
  reg                           ebreak_r;              assign ebreak_o = ebreak_r;
  reg                           ecall_r;               assign ecall_o = ecall_r;
  reg                           dret_unkilled_r;       assign dret_unkilled_o = dret_unkilled_r;
  reg                           wfi_unkilled_r;        assign wfi_unkilled_o = wfi_unkilled_r;

  `ifdef ISA_EXT_F
  // FPU
  reg  [`FPU_OP_WIDTH-1:0]      fpu_op_r;              assign fpu_op_o = fpu_op_r;
  reg                           sel_fpu_rs1_r;         assign sel_fpu_rs1_o = sel_fpu_rs1_r;
  reg                           sel_fpu_rs2_r;         assign sel_fpu_rs2_o = sel_fpu_rs2_r;
  reg                           sel_fpu_rs3_r;         assign sel_fpu_rs3_o = sel_fpu_rs3_r;
  reg                           sel_fpu_rd_r;          assign sel_fpu_rd_o = sel_fpu_rd_r;
  // currently decoded in ctrl, should be moved here.
  reg                           load_fpu_r;            assign load_fpu_o = load_fpu_r;
  `endif

  wire [`ALU_OP_WIDTH-1:0]      add_or_sub;
  wire [`ALU_OP_WIDTH-1:0]      srl_or_sra;

  assign add_or_sub    = ((opcode == `RV32_OP) && (funct7[5])) ? `ALU_OP_SUB : `ALU_OP_ADD;
  assign srl_or_sra    = (funct7[5]) ? `ALU_OP_SRA : `ALU_OP_SRL;
  assign dmem_size_o   = {1'b0,funct3[1:0]};
  assign dmem_type_o   = funct3;
  assign csr_imm_sel_o = funct3[2];

  wire alu_op_invalid = ~((funct7 == 0) || (funct7 == 7'h20)) || (opcode == 7'h77);

  always @(posedge clk_i or negedge rst_ni) begin
    if(~rst_ni) begin
      inst_de_r            <= `RV_NOP;
      pc_de_r              <= `START_HANDLER;
      imem_compressed_de_r <= 1'b0;
      predicted_branch_de_r <= 1'b0;
      de_valid_r           <= 1'b0;
    end else begin
      if(killed_de_i) begin 
        inst_de_r <= `RV_NOP; 
        pc_de_r   <= pc_de_r;
        de_valid_r <= 1'b0;
        imem_compressed_de_r <= 1'b0;
        predicted_branch_de_r <= 1'b0;
      end else if(ex_ready_i) begin  
        //inst_de_r  <= inject_ebreak_i ? 32'h00100073 : (if_valid_i ? inst_if_i : `RV_NOP);
        inst_de_r  <= if_valid_i ? (inject_ebreak_i ? 32'h00100073 : inst_if_i) : `RV_NOP;
        pc_de_r    <= pc_if_i;
        de_valid_r <= if_valid_i;
        imem_compressed_de_r <= imem_compressed_if_i;
        predicted_branch_de_r <= predicted_branch_if_i;
      end
    end
  end

  
  always @(*) begin
    case (funct3)
      `RV32_FUNCT3_ADD_SUB : alu_op_arith_r = add_or_sub;
      `RV32_FUNCT3_SLL     : alu_op_arith_r = `ALU_OP_SLL;
      `RV32_FUNCT3_SLT     : alu_op_arith_r = `ALU_OP_SLT;
      `RV32_FUNCT3_SLTU    : alu_op_arith_r = `ALU_OP_SLTU;
      `RV32_FUNCT3_XOR     : alu_op_arith_r = `ALU_OP_XOR;
      `RV32_FUNCT3_SRA_SRL : alu_op_arith_r = srl_or_sra;
      `RV32_FUNCT3_OR      : alu_op_arith_r = `ALU_OP_OR;
      `RV32_FUNCT3_AND     : alu_op_arith_r = `ALU_OP_AND;
    endcase
  end 
    
  always @(*) begin
    alu_op_r              = `ALU_OP_ADD;
    src_a_sel_r           = `SRC_A_RS1;
    src_b_sel_r           = `SRC_B_IMM;
    src_c_sel_r           = `SRC_C_ZERO;
    dmem_en_unkilled_r    = 1'b0;
    dmem_wen_unkilled_r   = 1'b0;
    wr_reg_unkilled_r     = 1'b0;
    illegal_instruction_r = 1'b0;
    jal_unkilled_r        = 1'b0;
    jalr_unkilled_r       = 1'b0;
    eret_unkilled_r       = 1'b0;
    fence_i_r             = 1'b0;
    csr_cmd_unkilled_r    = `CSR_IDLE;
    uses_rs1_r            = 1'b1;
    uses_rs2_r            = 1'b0;
    uses_rs3_r            = 1'b0;
    imm_type_r            = `IMM_I;
    pcpi_valid_r          = 1'b0;
    wb_src_sel_r          = `WB_SRC_ALU;
    uses_pcpi_unkilled_r  = 1'b0;
    ebreak_r              = 1'b0;
    ecall_r               = 1'b0;
    dret_unkilled_r       = 1'b0;
    wfi_unkilled_r        = 1'b0;
    `ifdef ISA_EXT_F
    fpu_op_r              = `FPU_OP_NOP;
    sel_fpu_rs1_r         = 1'b0;
    sel_fpu_rs2_r         = 1'b0;
    sel_fpu_rs3_r         = 1'b0;
    sel_fpu_rd_r          = 1'b0;
    load_fpu_r            = 1'b0;
    `endif
    case(opcode) 
      `RV32_LOAD : begin
        wr_reg_unkilled_r  = 1'b1;
        dmem_en_unkilled_r = 1'b1;
        wb_src_sel_r       = `WB_SRC_MEM;
      end
      `RV32_STORE : begin
        dmem_en_unkilled_r  = 1'b1;
        dmem_wen_unkilled_r = 1'b1;
        uses_rs2_r = 1'b1;
        imm_type_r = `IMM_S;
      end
      `RV32_BRANCH : begin
        src_b_sel_r = `SRC_B_RS2;
        uses_rs2_r  = 1'b1;
        case (funct3)
          `RV32_FUNCT3_BEQ  : alu_op_r = `ALU_OP_SEQ;
          `RV32_FUNCT3_BNE  : alu_op_r = `ALU_OP_SNE;
          `RV32_FUNCT3_BLT  : alu_op_r = `ALU_OP_SLT;
          `RV32_FUNCT3_BLTU : alu_op_r = `ALU_OP_SLTU;
          `RV32_FUNCT3_BGE  : alu_op_r = `ALU_OP_SGE;
          `RV32_FUNCT3_BGEU : alu_op_r = `ALU_OP_SGEU;
          default: illegal_instruction_r = 1'b1;
        endcase // case (funct3)
      end
      `RV32_JAL    : begin
        uses_rs1_r        = 1'b0;
        src_a_sel_r       = `SRC_A_PC;
        src_b_sel_r       = `SRC_B_FOUR;
        wr_reg_unkilled_r = 1'b1;
        jal_unkilled_r    = 1'b1;
      end  
      `RV32_JALR : begin
        jalr_unkilled_r = 1'b1;
        illegal_instruction_r = (funct3 != 0);
        src_a_sel_r = `SRC_A_PC;
        src_b_sel_r = `SRC_B_FOUR;
        wr_reg_unkilled_r = 1'b1;
      end    
      `RV32_MISC_MEM : begin
        case (funct3)
          `RV32_FUNCT3_FENCE : begin // support normal FENCE and FENCE.tso
            if ((inst_de_r[30:28] == 0) && (rs1_addr == 0) && (reg_to_wr_dx == 0))
              ; // NOP
            else
              illegal_instruction_r = 1'b1;
          end
          `RV32_FUNCT3_FENCE_I : begin
            if ((inst_de_r[31:20] == 0) && (rs1_addr == 0) && (reg_to_wr_dx == 0))
              fence_i_r = 1'b1;
            else
              illegal_instruction_r = 1'b1;
          end
          default : illegal_instruction_r = 1'b1;
        endcase
      end  
      `RV32_OP_IMM : begin
        alu_op_r = alu_op_arith_r;
        wr_reg_unkilled_r = 1'b1;
      end
      `RV32_OP : begin
        src_b_sel_r = `SRC_B_RS2;
        alu_op_r    = alu_op_arith_r;
        wr_reg_unkilled_r = 1'b1;
        uses_rs2_r  = 1'b1;      
        if (alu_op_invalid & ~killed_de_i) begin
          illegal_instruction_r = 1'b0;//(pcpi_timeout_counter_r == 0) ? 1'b1 : 1'b0;
          pcpi_valid_r = 1'b1;
          wb_src_sel_r = `WB_SRC_PCPI;
          uses_pcpi_unkilled_r = 1'b1;
        end
      end
  
      `RV32_CUSTOM0 : begin
        src_b_sel_r = `SRC_B_RS2;
        src_c_sel_r = `SRC_C_RS3;
        alu_op_r    = `ALU_OP_ADD;
        wr_reg_unkilled_r = 1'b1;
        uses_rs2_r  = 1'b1;      
        uses_rs3_r  = 1'b1;      
        if (~killed_de_i) begin
          illegal_instruction_r = 1'b0;//(pcpi_timeout_counter_r == 0) ? 1'b1 : 1'b0;
          pcpi_valid_r = 1'b1;
          wb_src_sel_r = `WB_SRC_PCPI;
          uses_pcpi_unkilled_r = 1'b1;
        end
      end

      `RV32_CUSTOM1 : begin
        src_b_sel_r = `SRC_B_RS2;
        src_c_sel_r = `SRC_C_RS3;
        alu_op_r    = `ALU_OP_ADD;
        wr_reg_unkilled_r = 1'b1;
        uses_rs2_r  = 1'b1;      
        uses_rs3_r  = 1'b1;      
        if (~killed_de_i) begin
          illegal_instruction_r = 1'b0;//(pcpi_timeout_counter_r == 0) ? 1'b1 : 1'b0;
          pcpi_valid_r = 1'b1;
          wb_src_sel_r = `WB_SRC_PCPI;
          uses_pcpi_unkilled_r = 1'b1;
        end
      end

  
      `RV32_SYSTEM : begin    
        wr_reg_unkilled_r = (funct3 != `RV32_FUNCT3_PRIV);
        wb_src_sel_r      = `WB_SRC_CSR;
        case (funct3)
          `RV32_FUNCT3_PRIV : if ((rs1_addr == 0) && (reg_to_wr_dx == 0)) begin
            case (funct12)
              `RV32_FUNCT12_ECALL   : ecall_r = 1'b1;
              `RV32_FUNCT12_EBREAK  : ebreak_r = 1'b1;
              `RV32_FUNCT12_MRET    : begin        
              if (prv_i == 0)
                illegal_instruction_r = 1'b1;
              else
                eret_unkilled_r = 1'b1;
              end
              `RV32_FUNCT12_DRET  : dret_unkilled_r = 1'b1;
              `RV32_FUNCT12_WFI   : wfi_unkilled_r = 1'b1;    
              default             : illegal_instruction_r = 1'b1;
            endcase
          end
          `RV32_FUNCT3_CSRRW  : csr_cmd_unkilled_r = `CSR_WRITE;
          `RV32_FUNCT3_CSRRS  : csr_cmd_unkilled_r = (rs1_addr == 0) ? `CSR_READ : `CSR_SET;
          `RV32_FUNCT3_CSRRC  : csr_cmd_unkilled_r = (rs1_addr == 0) ? `CSR_READ : `CSR_CLEAR;
          `RV32_FUNCT3_CSRRWI : csr_cmd_unkilled_r = `CSR_WRITE;
          `RV32_FUNCT3_CSRRSI : csr_cmd_unkilled_r = (rs1_addr == 0) ? `CSR_READ : `CSR_SET;
          `RV32_FUNCT3_CSRRCI : csr_cmd_unkilled_r = (rs1_addr == 0) ? `CSR_READ : `CSR_CLEAR;
          default             : illegal_instruction_r = 1'b1;
        endcase
      end
    
      `RV32_AUIPC : begin
        src_a_sel_r = `SRC_A_PC;
        uses_rs1_r = 1'b0;
        wr_reg_unkilled_r = 1'b1;
        imm_type_r = `IMM_U;
      end
    
      `RV32_LUI : begin
        uses_rs1_r = 1'b0;
        src_a_sel_r = `SRC_A_ZERO;
        wr_reg_unkilled_r = 1'b1;
        imm_type_r = `IMM_U;
      end
      
      // F extension
    `ifdef ISA_EXT_F
      `RV32_F_LOAD: begin
        if (funct3 == `RV32_F_FUNCT3_LOAD && fpu_ena_i) begin
          sel_fpu_rd_r        = 1'b1;
          dmem_en_unkilled_r  = 1'b1;
          wr_reg_unkilled_r   = 1'b1;
          wb_src_sel_r        = `WB_SRC_MEM;
        end else illegal_instruction_r = 1'b1;
      end   
           
      `RV32_F_STORE: begin
        if (funct3 == `RV32_F_FUNCT3_STORE && fpu_ena_i) begin
          sel_fpu_rs2_r        = 1'b1;
          uses_rs2_r           = 1'b1;
          imm_type_r           = `IMM_S;
          dmem_en_unkilled_r   = 1'b1;
          dmem_wen_unkilled_r  = 1'b1;			
        end else illegal_instruction_r = 1'b1;
      end
      
      `RV32_F_MADD: begin
        if (funct7[1:0] == 2'b00 && fpu_ena_i) begin
          fpu_op_r            = `FPU_OP_MADD;
          sel_fpu_rs1_r       = 1'b1;
          sel_fpu_rs2_r       = 1'b1;
          sel_fpu_rs3_r       = 1'b1;
          sel_fpu_rd_r        = 1'b1;
          wb_src_sel_r        = `WB_SRC_FPU;
          uses_rs2_r          = 1'b1;
          uses_rs3_r          = 1'b1;
          wr_reg_unkilled_r   = 1'b1;
        end else illegal_instruction_r = 1'b1;
      end
      
      `RV32_F_MSUB: begin
        if (funct7[1:0] == 2'b00 && fpu_ena_i) begin
          fpu_op_r            = `FPU_OP_MSUB;
          sel_fpu_rs1_r       = 1'b1;
          sel_fpu_rs2_r       = 1'b1;
          sel_fpu_rs3_r       = 1'b1;
          sel_fpu_rd_r        = 1'b1;
          wb_src_sel_r        = `WB_SRC_FPU;
          uses_rs2_r          = 1'b1;
          uses_rs3_r          = 1'b1;
          wr_reg_unkilled_r   = 1'b1;
        end else illegal_instruction_r = 1'b1;
      end
      
      `RV32_F_NMSUB: begin
        if (funct7[1:0] == 2'b00 && fpu_ena_i) begin
          fpu_op_r            = `FPU_OP_NMSUB;
          sel_fpu_rs1_r       = 1'b1;
          sel_fpu_rs2_r       = 1'b1;
          sel_fpu_rs3_r       = 1'b1;
          sel_fpu_rd_r        = 1'b1;
          wb_src_sel_r        = `WB_SRC_FPU;
          uses_rs2_r          = 1'b1;
          uses_rs3_r          = 1'b1;
          wr_reg_unkilled_r   = 1'b1;
        end else illegal_instruction_r = 1'b1;
      end
      
      `RV32_F_NMADD: begin
        if (funct7[1:0] == 2'b00 && fpu_ena_i) begin
          fpu_op_r            = `FPU_OP_NMADD;
          sel_fpu_rs1_r       = 1'b1;
          sel_fpu_rs2_r       = 1'b1;
          sel_fpu_rs3_r       = 1'b1;
          sel_fpu_rd_r        = 1'b1;
          wb_src_sel_r        = `WB_SRC_FPU;
          uses_rs2_r          = 1'b1;
          uses_rs3_r          = 1'b1;
          wr_reg_unkilled_r   = 1'b1;
        end else illegal_instruction_r = 1'b1;
      end
      
      `RV32_F_OP: begin
        if (fpu_ena_i) begin
          case (funct7)
          `RV32_F_FUNCT7_MFICL: begin
            if (rs2_addr == `RV32_F_RS2_MOV && funct3 == `RV32_F_FUNCT3_MOV) begin
              sel_fpu_rs1_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_REG;
              wr_reg_unkilled_r = 1'b1;
            end
            else if (rs2_addr == `RV32_F_RS2_CLASS && funct3 == `RV32_F_FUNCT3_CLASS) begin
              fpu_op_r          = `FPU_OP_CLASS;
              sel_fpu_rs1_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              wr_reg_unkilled_r = 1'b1;
            end
            else illegal_instruction_r = 1'b1;
          end
          `RV32_F_FUNCT7_MOVIF:  if (rs2_addr == `RV32_F_RS2_MOV && funct3 == `RV32_F_FUNCT3_MOV) begin
            sel_fpu_rd_r		  = 1'b1;
            wb_src_sel_r      = `WB_SRC_REG;
            wr_reg_unkilled_r = 1'b1;
          end	
          else illegal_instruction_r = 1'b1;
          `RV32_F_FUNCT7_ADD:   begin
            fpu_op_r          = `FPU_OP_ADD;
            sel_fpu_rs1_r     = 1'b1;
            sel_fpu_rs2_r     = 1'b1;
            sel_fpu_rd_r      = 1'b1;
            wb_src_sel_r      = `WB_SRC_FPU;
            uses_rs2_r        = 1'b1;
            wr_reg_unkilled_r = 1'b1;
          end
          `RV32_F_FUNCT7_SUB:   begin
            fpu_op_r          = `FPU_OP_SUB;
            sel_fpu_rs1_r     = 1'b1;
            sel_fpu_rs2_r     = 1'b1;
            sel_fpu_rd_r      = 1'b1;
            wb_src_sel_r      = `WB_SRC_FPU;
            uses_rs2_r        = 1'b1;
            wr_reg_unkilled_r = 1'b1;
          end
          `RV32_F_FUNCT7_MUL:   begin
            fpu_op_r          = `FPU_OP_MUL;
            sel_fpu_rs1_r     = 1'b1;
            sel_fpu_rs2_r     = 1'b1;
            sel_fpu_rd_r      = 1'b1;
            wb_src_sel_r      = `WB_SRC_FPU;
            uses_rs2_r        = 1'b1;
            wr_reg_unkilled_r	= 1'b1;
           end
          `RV32_F_FUNCT7_DIV:   begin
            fpu_op_r          = `FPU_OP_DIV;
            sel_fpu_rs1_r     = 1'b1;
            sel_fpu_rs2_r     = 1'b1;
            sel_fpu_rd_r      = 1'b1;
            wb_src_sel_r      = `WB_SRC_FPU;
            uses_rs2_r        = 1'b1;
            wr_reg_unkilled_r = 1'b1;
          end
          `RV32_F_FUNCT7_SQRT:  if (rs2_addr == `RV32_F_RS2_SQRT) begin
            fpu_op_r          = `FPU_OP_SQRT;
            sel_fpu_rs1_r     = 1'b1;
            sel_fpu_rd_r      = 1'b1;
            wb_src_sel_r      = `WB_SRC_FPU;
            wr_reg_unkilled_r = 1'b1;
           end
          `RV32_F_FUNCT7_SGN:   case (funct3)
            `RV32_F_FUNCT3_J:   begin
              fpu_op_r          = `FPU_OP_SGNJ;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_FUNCT3_JN:  begin
              fpu_op_r          = `FPU_OP_SGNJN;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_FUNCT3_JX:  begin
             fpu_op_r          = `FPU_OP_SGNJX;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            default: illegal_instruction_r = 1'b1;
          endcase			
          `RV32_F_FUNCT7_SEL:   case (funct3)
            `RV32_F_FUNCT3_MIN: begin
              fpu_op_r          = `FPU_OP_MIN;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_FUNCT3_MAX: begin
              fpu_op_r          = `FPU_OP_MAX;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            default: illegal_instruction_r = 1'b1;
          endcase
          `RV32_F_FUNCT7_CVTFI: case (rs2_addr)
            `RV32_F_RS2_FI: begin
              fpu_op_r          = `FPU_OP_CVTFI;
              sel_fpu_rs1_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_RS2_FU:	begin
              fpu_op_r          = `FPU_OP_CVTFU;
              sel_fpu_rs1_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              wr_reg_unkilled_r = 1'b1;
            end
            default: illegal_instruction_r = 1'b1;
          endcase
          `RV32_F_FUNCT7_CVTIF: case (rs2_addr)
            `RV32_F_RS2_IF: begin
              fpu_op_r          = `FPU_OP_CVTIF;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_RS2_UF: begin
              fpu_op_r          = `FPU_OP_CVTUF;
              sel_fpu_rd_r      = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              wr_reg_unkilled_r = 1'b1;
             end
             default: illegal_instruction_r = 1'b1;
          endcase
          `RV32_F_FUNCT7_CMP:   case (funct3)
            `RV32_F_FUNCT3_EQ:  begin
              fpu_op_r          = `FPU_OP_EQ;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_FUNCT3_LT:  begin
              fpu_op_r          = `FPU_OP_LT;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            `RV32_F_FUNCT3_LE:  begin
              fpu_op_r          = `FPU_OP_LE;
              sel_fpu_rs1_r     = 1'b1;
              sel_fpu_rs2_r     = 1'b1;
              wb_src_sel_r      = `WB_SRC_FPU;
              uses_rs2_r        = 1'b1;
              wr_reg_unkilled_r = 1'b1;
            end
            default: illegal_instruction_r = 1'b1;
          endcase // funct3
          default: illegal_instruction_r = 1'b1;
      endcase // funct7
      end
      else
        illegal_instruction_r = 1'b1;
      end
    `endif // ISA_EXT_F
  
      default   : begin
        illegal_instruction_r = 1'b1;
      end  
    endcase
  end
endmodule
