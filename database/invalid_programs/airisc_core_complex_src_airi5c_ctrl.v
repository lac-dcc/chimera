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
// File             : airi5c_ctrl.v
// Author           : A. Stanitzki
// Creation Date    : 02.12.16 
// Last Modified    : Thu 20 Jan 2022 10:27:24 AM CET
// Version          : 1.0
// Abstract         : control logic for the AIRI5C core pipeline
// History          : 05.01.20 - First instantiation on GitLab (ASt)
//
`timescale 1ns/100ps


`include "airi5c_ctrl_constants.vh"
`include "airi5c_alu_ops.vh"
`include "rv32_opcodes.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_hasti_constants.vh"

`ifdef ISA_EXT_F
  `include "modules/airi5c_fpu/airi5c_FPU_constants.vh"
`endif

module airi5c_ctrl(
  input                               clk_i,        // system clock
  input                               rst_ni,        // neg. async reset (0 = reset, 1 = normal op)
  input [`INST_WIDTH-1:0]             inst_ex_i,        // instruction in DX stage pipeline register
  input                               if_valid_i,    // IMEM requires additional cycles
  input                               de_valid_i,
  input                               ex_valid_i,
  input                               ex_ready_i,
  input                               imem_badmem_e,    // IMEM error (access violations are handled in airi5c_csr.v)
  input                               dmem_hready_i,
  input                               dmem_badmem_e,    // DMEM error (access violations are handled in airi5c_csr.v)
  input                               cmp_true,        // ALU result for comparesf
  input                               pcpi_ready,    // coprocessor has taken inst
  input                               pcpi_wait,    // coprocessor is processing inst (0 = propagate result to WB)
  input                               pcpi_wr,        // coprocessor inst will write into reg during WB stage
  input                               illegal_instruction,
  input [`PRV_WIDTH-1:0]              prv,        // current priviledge level (from airi5c_csr.v)
  input                               predicted_branch_ex_i,

  // ALU and branch control signals
  input                               jal_unkilled,
  input                               jalr_unkilled,
  input                               eret_unkilled,
  output reg  [`PC_SRC_SEL_WIDTH-1:0] PC_src_sel,        // select source of next inst address (ALU/exception/PC+4/...)
  output                              bypass_rs1,        // signal bypassing for source register a
  output                              bypass_rs2,        // signal bypassing for source register b
  output                              bypass_rs3,
  input                               uses_pcpi_unkilled,

  input                               dmem_en_unkilled,
  input                               dmem_wen_unkilled,
  output [`HASTI_TRANS_WIDTH-1:0]     dmem_htrans_o,
  output wire                         dmem_wen,          // enable DMEM write
  output [`HASTI_BURST_WIDTH-1:0]     dmem_hburst_o,
  output                              dmem_hmastlock_o,
  output [`HASTI_PROT_WIDTH-1:0]      dmem_hprot_o,



  // CSR file interface
  input       [`CSR_CMD_WIDTH-1:0]    csr_cmd_unkilled,
  output wire                         eret,              // signal return from exception handler (to airi5c_csr.v)
  output wire                         dret,              // signal return from debug ROM (to airi5c_csr.v)
  output wire                         redirect,          // signal taken branch
  output wire                         redirect_WB,
  output      [`CSR_CMD_WIDTH-1:0]    csr_cmd,
  input                               illegal_csr_access,
  input                               interrupt_pending,
  input                               interrupt_taken,
  input  [`MCAUSE_WIDTH-1:0]          interrupt_code_EX,
  input                               stepmode,

  // pipeline control
  input                               ebreak,
  input                               ecall,
  input                               dret_unkilled,
  input                               wfi_unkilled_EX,
  input                               pcpi_valid_unkilled,
  output                              pcpi_valid,

  output wire                         inject_ebreak,
  input                               prev_killed_WB,
  output wire                         ex_EX,
  input                               had_ex_WB,
  input       [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_EX,
  input                               uses_rs1,
  input                               uses_rs2,
  input                               uses_rs3,
  input                               dmode_WB,          // debug mode was entered by finishing WB stage of last inst
  input                               wr_reg_unkilled_EX,
  output wire                         wr_reg_WB,         // WB shall write to register
  output reg  [`REG_ADDR_WIDTH-1:0]   reg_to_wr_WB,      // dest register address for WB
  output reg  [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_WB,     // data source for WB (ALU, PC, DMEM, immediate, ..)
  output wire                         flush_pipeline_o,
  input                               de_ready_i,
  output wire                         stall_EX,          // stall decode/execute stage
  output wire                         kill_EX,           // kill decode/execute stage
  output wire                         stall_WB,          // stall writeback stage
  output wire                         kill_WB,           // kill writeback stage
  output wire [`MCAUSE_WIDTH-1:0]     exception_code_WB, // signal exception cause in WB stage to airi5c_csr_file.v)
  output                              exception_int_WB,
  output wire                         retire_WB          // signal instruction completion in WB stage to airi5c_csr_file.v)
`ifdef ISA_EXT_P
  ,
  input                               pcpi_ready_mul_div
`endif
`ifdef ISA_EXT_F
  ,
  // FPU
  input                               fpu_busy,
  input                               fpu_ready,
  input       [`FPU_OP_WIDTH-1:0]     fpu_op, 
  input                               sel_fpu_rs1_EX,
  input                               sel_fpu_rs2_EX,
  input                               sel_fpu_rs3_EX,
  input                               sel_fpu_rd_EX,
  output                              sel_fpu_rd_WB,
  output                              load_fpu,
  output                              kill_fpu                     
`endif
);

// IF stage ctrl signals
wire                             ex_DE;
reg                              had_ex_DE;

// DX stage ctrl pipeline registers
reg                              had_ex_EX;

// DX stage ctrl signals
wire [6:0]                       opcode = inst_ex_i[6:0];
wire [`REG_ADDR_WIDTH-1:0]       rs1_addr = inst_ex_i[19:15];
wire [`REG_ADDR_WIDTH-1:0]       rs2_addr = inst_ex_i[24:20];
wire [`REG_ADDR_WIDTH-1:0]       rs3_addr = inst_ex_i[31:27];
wire [`REG_ADDR_WIDTH-1:0]       reg_to_wr_EX = inst_ex_i[11:7];


reg                              branch_taken_unkilled;
wire                             branch_taken;
wire                             uses_pcpi;
wire                             jal;
wire                             jalr;
wire                             wr_reg_EX;
wire                             new_ex_EX;
//wire                             ex_EX;
reg  [`MCAUSE_WIDTH-1:0]         ex_code_EX;
reg                              ex_int_EX;
wire                             wfi_EX;
wire                             illegal;

// WB stage ctrl pipeline registers
reg                              wr_reg_unkilled_WB;
//reg                              had_ex_WB;
reg [`MCAUSE_WIDTH-1:0]          prev_ex_code_WB;
reg                              prev_ex_int_WB;
reg                              store_in_WB;
reg                              dmem_en_WB;
//reg                              prev_killed_WB;
reg                              wfi_unkilled_WB;
reg                              uses_pcpi_WB;
`ifdef ISA_EXT_F
reg                              sel_fpu_rd_uk_WB;
`endif

// WB stage ctrl signals
wire                             ex_WB;
reg                              ex_WB_r; 
reg [`MCAUSE_WIDTH-1:0]          ex_code_WB;
reg                              ex_int_WB;
wire                             dmem_access_exception;
wire                             killed_WB;
wire                             load_in_WB;
wire                             active_wfi_WB;

// Hazard signals
// RAW: Read after Write
wire                             load_use;
wire                             raw_rs1;
wire                             raw_rs2;
wire                             raw_rs3;
wire                             raw_on_busy_pcpi;
wire                             ex_IF;

wire                             fpu_wait_for_WB;

reg                              bubble_in_WB;
reg                              had_inst;

wire dmem_en;
assign dmem_hburst_o    = `HASTI_BURST_SINGLE;
assign dmem_hmastlock_o = `HASTI_MASTER_NO_LOCK;
assign dmem_hprot_o     = `HASTI_NO_PROT;

assign flush_pipeline_o      = ex_WB || redirect;

// == IF stage ctrl ==
assign ex_IF        = imem_badmem_e && !(~if_valid_i || redirect);

always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    had_ex_DE    <= 1'b0;
  end else begin
    if(flush_pipeline_o) begin 
    end else if(de_ready_i & if_valid_i) begin
        had_ex_DE    <= ex_IF;       
    end
  end     
end

// == DE stage ctrl ==
assign ex_DE         = had_ex_DE;

// if an interrupt occurs 
reg had_taken_interrupt;
reg [`MCAUSE_WIDTH-1:0] interrupt_code_r;

// in stepmode, always produce ebreak instructions at the decoder output, 
// once a single real instruction has been decoded.
assign inject_ebreak = (de_valid_i && stepmode && ~dmode_WB) || had_inst;
 

always @(posedge clk_i or negedge rst_ni) begin
  if(~rst_ni) begin
    had_inst <= 1'b0;
  end else begin
    if(ex_WB)
      had_inst <= 1'b0;
    else
      if(inject_ebreak) had_inst <= 1'b1;
  end
end

// == EX stage ctrl ==
always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    had_ex_EX <= 0;
  end else if (!stall_EX) begin
    had_ex_EX <= ex_DE;
  end
end

always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    had_taken_interrupt <= 1'b0;
    interrupt_code_r    <= 0;
  end else begin
    if(interrupt_taken) begin 
      had_taken_interrupt <= 1'b1;
      interrupt_code_r    <= interrupt_code_EX;
    end else if (~stall_EX) had_taken_interrupt <= interrupt_taken;
  end
end

// interrupts kill IF, DX instructions -- WB may commit
// Exceptions never show up falsely due to hazards -- don't get exceptions on stall
assign illegal = illegal_instruction & ~pcpi_wait & ~pcpi_ready;
//assign kill_EX = stall_EX || ex_EX || ex_WB || interrupt_taken;

// all stalls lead to kills, not all kills stall..
assign kill_EX = stall_EX || ex_EX || ex_WB || interrupt_taken;
`ifdef ISA_EXT_P
reg pcpi_ready_mul_div_r; 

always @(posedge clk_i) begin 
  pcpi_ready_mul_div_r <= pcpi_ready_mul_div; 
end 
`endif
assign stall_EX = stall_WB || (dmem_en & ~dmem_hready_i) || 
  ((load_use || raw_on_busy_pcpi || (uses_pcpi_unkilled && ~pcpi_ready)) &&
  !(ex_EX || ex_WB || ex_WB_r || interrupt_taken)) 
`ifdef ISA_EXT_F
  || (fpu_op != `FPU_OP_NOP && !fpu_ready && !kill_fpu)
`endif
  ;

assign new_ex_EX = ebreak || ecall || illegal || illegal_csr_access || had_taken_interrupt;
assign ex_EX = had_ex_EX || new_ex_EX;
   
`ifdef ISA_EXT_F
  // FPU
  assign fpu_wait_for_WB = stall_WB || (load_use && !(ex_EX || ex_WB || ex_WB_r || interrupt_taken));
//  assign kill_fpu = prev_killed_DE || ex_EX || ex_WB || ex_WB_r || interrupt_taken;
  assign kill_fpu = ex_EX || ex_WB || ex_WB_r || interrupt_taken;
  assign load_fpu = fpu_op != `FPU_OP_NOP && !(fpu_busy || fpu_ready) && !fpu_wait_for_WB;
`endif  


always @(*) begin
  ex_int_EX = 1'b0;
  ex_code_EX = `MCAUSE_INST_ADDR_MISALIGNED;
  if (had_ex_EX) begin
    ex_code_EX = `MCAUSE_INST_ADDR_MISALIGNED;
  end else if (illegal) begin
    ex_code_EX = `MCAUSE_ILLEGAL_INST;
  end else if (illegal_csr_access) begin
    ex_code_EX = `MCAUSE_ILLEGAL_INST;    
  end else if (ebreak) begin
    ex_code_EX = `MCAUSE_BREAKPOINT;
  end else if (had_taken_interrupt) begin
    ex_code_EX = interrupt_code_r;
    ex_int_EX = 1'b1;
  end else if (ecall) begin
    ex_code_EX = `MCAUSE_ECALL_FROM_U + prv;
  end
end

// branch decision

always @(*) begin
  branch_taken_unkilled = 1'b0;
  if (opcode == `RV32_BRANCH)
      branch_taken_unkilled = cmp_true;
end

assign branch_taken  = branch_taken_unkilled && !kill_EX;
assign jal           = jal_unkilled        && !kill_EX;
assign jalr          = jalr_unkilled       && !kill_EX;
assign eret          = eret_unkilled       && !kill_EX;
assign dret          = dret_unkilled       && !kill_EX;
assign dmem_en       = dmem_en_unkilled && !ex_WB;//    && !(kill_EX && !stall_WB);
//assign dmem_wen      = dmem_wen_unkilled;//   && !kill_EX;
assign dmem_wen      = dmem_wen_unkilled && !ex_WB && ex_ready_i;//   && !(kill_EX & !stall_WB);
assign wr_reg_EX     = wr_reg_unkilled_EX  && !kill_EX;
assign wfi_EX        = wfi_unkilled_EX     && !kill_EX;
assign uses_pcpi     = uses_pcpi_unkilled  && !kill_EX;
assign csr_cmd       = csr_cmd_unkilled;
assign pcpi_valid    = pcpi_valid_unkilled && !load_use && uses_pcpi_unkilled;
assign dmem_htrans_o = dmem_en ? `HASTI_TRANS_NONSEQ : `HASTI_TRANS_IDLE;


/*assign redirect = ~stall_EX &((predicted_branch_EX & ~branch_taken_unkilled & ~jal_unkilled) || (branch_taken_unkilled & ~predicted_branch_EX) || eret_unkilled || dret_unkilled || jalr_unkilled);// || jal_unkilled );*/

assign redirect = ~stall_EX &((predicted_branch_ex_i & ~branch_taken_unkilled & ~jal_unkilled) || (branch_taken_unkilled & ~predicted_branch_ex_i) || eret_unkilled || dret_unkilled || jalr_unkilled || jal_unkilled );

always @(*) begin
  if (ex_WB) begin
    PC_src_sel = `PC_HANDLER;
  end else if (eret) begin
    PC_src_sel = `PC_EPC;
  end else if (dret) begin
    PC_src_sel = `PC_DPC;
  end else if (branch_taken & ~predicted_branch_ex_i) begin
    PC_src_sel = `PC_BRANCH_TARGET;
  end else if (~branch_taken & predicted_branch_ex_i) begin
    PC_src_sel = `PC_MISSED_PREDICT;
  end else if (jal) begin
    PC_src_sel = `PC_JAL_TARGET;
  end else if (jalr) begin
    PC_src_sel = `PC_JALR_TARGET;
  end else if (~de_ready_i && if_valid_i) begin
    PC_src_sel = `PC_HANDLER;
//    PC_src_sel = `PC_REPLAY;
  end else begin
    PC_src_sel = `PC_HANDLER;
//    PC_src_sel = `PC_PLUS_FOUR;
  end
end

reg        redirect_WB_r; assign redirect_WB = redirect_WB_r;

// == WB stage ctrl ==
always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    wr_reg_unkilled_WB <= 0;
    wb_src_sel_WB      <= 0;
    prev_ex_code_WB    <= 0;
    prev_ex_int_WB     <= 0;
    reg_to_wr_WB       <= 0;
    store_in_WB        <= 0;
    dmem_en_WB         <= 0;
    wfi_unkilled_WB    <= 0;
    uses_pcpi_WB       <= 0;
    bubble_in_WB       <= 1;
    redirect_WB_r      <= 0;
`ifdef ISA_EXT_F
    sel_fpu_rd_uk_WB   <= 0;   
`endif
  end else if (!stall_WB) begin
    wr_reg_unkilled_WB <= wr_reg_EX || (uses_pcpi && pcpi_wr);
    wb_src_sel_WB      <= wb_src_sel_EX;
    prev_ex_code_WB    <= ex_code_EX;
    prev_ex_int_WB     <= ex_int_EX;
    reg_to_wr_WB       <= reg_to_wr_EX;
    store_in_WB        <= dmem_wen;
    dmem_en_WB         <= dmem_en;
    wfi_unkilled_WB    <= wfi_EX;
    uses_pcpi_WB       <= uses_pcpi;
`ifdef ISA_EXT_F
    sel_fpu_rd_uk_WB   <= sel_fpu_rd_EX && !kill_EX;
`endif
    bubble_in_WB       <= kill_EX ? 1'b1 : ~ex_valid_i;
    if(ex_valid_i) begin
      redirect_WB_r        <= redirect;
    end
  end
end

// WFI handling
// can't be killed while in WB stage
assign active_wfi_WB = !prev_killed_WB && wfi_unkilled_WB 
    && !(interrupt_taken || interrupt_pending);
assign kill_WB = stall_WB || ex_WB;
assign stall_WB = ((~dmem_hready_i && dmem_en_WB) || active_wfi_WB) && !ex_WB;
assign dmem_access_exception = dmem_badmem_e;
assign ex_WB = had_ex_WB || dmem_access_exception;

always @ (posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    ex_WB_r <= 1'b0;
  end else begin
    ex_WB_r <= ex_WB;
  end
end

assign killed_WB = prev_killed_WB || kill_WB;

always @(*) begin
  ex_code_WB = prev_ex_code_WB;
  ex_int_WB  = prev_ex_int_WB;  
  if (!had_ex_WB) begin
    if (dmem_access_exception) begin
      ex_code_WB = wr_reg_unkilled_WB ?
      `MCAUSE_LOAD_ADDR_MISALIGNED :
      `MCAUSE_STORE_AMO_ADDR_MISALIGNED;
/*    end else if(stepmode) begin
      ex_code_WB = `MCAUSE_BREAKPOINT;*/
    end
  end
end

assign exception_int_WB = ex_int_WB;
assign exception_code_WB = ex_code_WB;
assign wr_reg_WB = wr_reg_unkilled_WB && (!kill_WB || stepmode);
assign retire_WB = !(kill_WB || killed_WB || bubble_in_WB) || (~dmode_WB && stepmode && ~stall_WB);
`ifdef ISA_EXT_F
  assign sel_fpu_rd_WB = sel_fpu_rd_uk_WB && (!kill_WB || stepmode);
`endif

// Hazard logic

assign load_in_WB = dmem_en_WB && !store_in_WB;

//assign raw_rs1 = wr_reg_WB && (rs1_addr == reg_to_wr_WB) && (sel_fpu_rs1_EX == sel_fpu_rd_WB)

//In Case of SIMD: writeback uses address and address +1, hence errors for RAW extend to reg_to_wr_WB+1
//To-Do: Add actual SIMD dependency to avoid unneccessary stalls. 
`ifdef ISA_EXT_P
`ifdef ISA_EXT_F
  assign raw_rs1 = wr_reg_unkilled_WB && (rs1_addr == reg_to_wr_WB || ( pcpi_ready_mul_div_r  == 1 && rs1_addr == (reg_to_wr_WB+1)) ) && (sel_fpu_rs1_EX == sel_fpu_rd_uk_WB) && (rs1_addr != 0 || sel_fpu_rs1_EX) && uses_rs1;
  assign raw_rs2 = (wr_reg_unkilled_WB && (rs2_addr == reg_to_wr_WB || ( pcpi_ready_mul_div_r  == 1 && rs2_addr == (reg_to_wr_WB+1)) ) && (sel_fpu_rs2_EX == sel_fpu_rd_uk_WB)) && (rs2_addr != 0 || sel_fpu_rs2_EX) && uses_rs2;
`else
  assign raw_rs1 = wr_reg_unkilled_WB && (rs1_addr == reg_to_wr_WB || ( pcpi_ready_mul_div_r  == 1 && rs1_addr == (reg_to_wr_WB+1)) ) && (rs1_addr != 0) && uses_rs1;
  assign raw_rs2 = wr_reg_unkilled_WB && (rs2_addr == reg_to_wr_WB || ( pcpi_ready_mul_div_r  == 1 && rs2_addr == (reg_to_wr_WB+1)) ) && (rs2_addr != 0) && uses_rs2;
`endif
`else
`ifdef ISA_EXT_F
  assign raw_rs1 = wr_reg_unkilled_WB && (rs1_addr == reg_to_wr_WB) && (sel_fpu_rs1_EX == sel_fpu_rd_uk_WB) && (rs1_addr != 0 || sel_fpu_rs1_EX) && uses_rs1;
  assign raw_rs2 = (wr_reg_unkilled_WB && (rs2_addr == reg_to_wr_WB) && (sel_fpu_rs2_EX == sel_fpu_rd_uk_WB)) && (rs2_addr != 0 || sel_fpu_rs2_EX) && uses_rs2;
`else
  assign raw_rs1 = wr_reg_unkilled_WB && (rs1_addr == reg_to_wr_WB) && (rs1_addr != 0) && uses_rs1;
  assign raw_rs2 = (wr_reg_unkilled_WB && (rs2_addr == reg_to_wr_WB)) && (rs2_addr != 0) && uses_rs2;
`endif
`endif
assign bypass_rs1 = !load_in_WB && raw_rs1;

assign bypass_rs2 = !load_in_WB && raw_rs2;

`ifdef ISA_EXT_F
  assign raw_rs3 = (wr_reg_unkilled_WB && (rs3_addr == reg_to_wr_WB) && (sel_fpu_rs3_EX == sel_fpu_rd_uk_WB)) && (rs3_addr != 0 || sel_fpu_rs3_EX) && uses_rs3;
`else
  assign raw_rs3 = (wr_reg_unkilled_WB && (rs3_addr == reg_to_wr_WB)) && (rs3_addr != 0) && uses_rs3;
`endif
assign bypass_rs3 = !load_in_WB && raw_rs3;

assign raw_on_busy_pcpi = uses_pcpi_WB && (raw_rs1 || raw_rs2) && !pcpi_ready;
assign load_use = load_in_WB && (raw_rs1 || raw_rs2 || raw_rs3);


endmodule
