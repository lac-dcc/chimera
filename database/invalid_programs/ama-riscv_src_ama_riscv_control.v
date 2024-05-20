// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

`include "ama_riscv_defines.v"

module ama_riscv_control (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] inst_id,
    input  wire        bc_a_eq_b,
    input  wire        bc_a_lt_b,
 /* input  wire        bp_taken,
    input  wire        bp_clear, */
    input  wire [ 1:0] store_mask_offset,
    input  wire [31:0] inst_ex,
    input  wire        reg_we_ex,
    input  wire        reg_we_mem,
    input  wire [ 4:0] rd_ex,
    input  wire [ 4:0] rd_mem,
    input  wire        store_inst_ex,
    output wire        stall_if,
    output wire        clear_if,
    output wire        clear_id,
    output wire        clear_ex,
    output wire        clear_mem,
    output wire [ 1:0] pc_sel,
    output wire        pc_we,
    output wire        load_inst,
    output wire        store_inst,
    output wire        branch_inst,
    output wire        jump_inst,
    output wire        csr_en,
    output wire        csr_we,
    output wire        csr_ui,
    output wire [ 3:0] alu_op_sel,
    output wire [ 2:0] ig_sel,
    output wire        bc_uns,
    output wire        dmem_en,
    output wire        load_sm_en,
    output wire [ 1:0] wb_sel,
    output wire        reg_we,
    output wire [ 1:0] alu_a_sel_fwd,
    output wire [ 1:0] alu_b_sel_fwd,
    output wire        bc_a_sel_fwd,
    output wire        bcs_b_sel_fwd,
    output wire        rf_a_sel_fwd,
    output wire        rf_b_sel_fwd,
    output wire [ 3:0] dmem_we  
);

// Signals
wire         alu_a_sel;
wire         alu_b_sel;
wire  [ 4:0] rs1_id     = inst_id[19:15];
wire  [ 4:0] rs2_id     = inst_id[24:20];
wire  [ 2:0] funct3_ex  = inst_ex[14:12];

ama_riscv_decoder ama_riscv_decoder_i (
    .clk (clk),
    .rst (rst),
    .inst_id (inst_id),
    .inst_ex (inst_ex),
    .bc_a_eq_b (bc_a_eq_b),
    .bc_a_lt_b (bc_a_lt_b),
 /* .bp_taken (bp_taken),
    .bp_clear (bp_clear), */
    .stall_if (stall_if),
    .clear_if (clear_if),
    .clear_id (clear_id),
    .clear_ex (clear_ex),
    .clear_mem (clear_mem),
    .pc_sel (pc_sel),
    .pc_we (pc_we),
    .load_inst (load_inst),
    .store_inst (store_inst),
    .branch_inst (branch_inst),
    .jump_inst (jump_inst),
    .csr_en (csr_en),
    .csr_we (csr_we),
    .csr_ui (csr_ui),
    .alu_op_sel (alu_op_sel),
    .alu_a_sel (alu_a_sel),
    .alu_b_sel (alu_b_sel),
    .ig_sel (ig_sel),
    .bc_uns (bc_uns),
    .dmem_en (dmem_en),
    .load_sm_en (load_sm_en),
    .wb_sel (wb_sel),
    .reg_we (reg_we)
);

ama_riscv_operand_forwarding ama_riscv_operand_forwarding_i (
    .reg_we_ex (reg_we_ex),
    .reg_we_mem (reg_we_mem),
    .store_inst_id (store_inst),
    .branch_inst_id (branch_inst),
    .rs1_id (rs1_id),
    .rs2_id (rs2_id),
    .rd_ex (rd_ex),
    .rd_mem (rd_mem),
    .alu_a_sel (alu_a_sel),
    .alu_b_sel (alu_b_sel),
    .alu_a_sel_fwd (alu_a_sel_fwd),
    .alu_b_sel_fwd (alu_b_sel_fwd),
    .bc_a_sel_fwd (bc_a_sel_fwd),
    .bcs_b_sel_fwd (bcs_b_sel_fwd),
    .rf_a_sel_fwd (rf_a_sel_fwd),
    .rf_b_sel_fwd (rf_b_sel_fwd)
);

ama_riscv_store_mask ama_riscv_store_mask_i (
    .en (store_inst_ex),
    .offset (store_mask_offset),
    .width (funct3_ex),
    .mask (dmem_we)
);

endmodule
