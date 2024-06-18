// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "DataPath.v"
`include "Controller.v"
`include "ForwardingUnit.v"
`include "HazardUnit.v"

module Processor (
    clk,
    rst
);

  input clk, rst;

  wire [1:0] forward_a, forward_b;
  wire cancel_ID_EX_signals, pc_write;
  wire [1:0] pc_sel;
  wire imm_sel;
  wire IF_ID_write_en, IF_ID_flush, reg_file_write_en, mem_write_en, mem_read_en;
  wire [1:0] reg_dest_sel, reg_data_sel;
  wire [2:0] alu_op_code;
  wire [5:0] ID_EX_inst_op, ID_EX_inst_func, IF_ID_inst_op, IF_ID_inst_func;
  wire [4:0] ID_EX_rs, ID_EX_rt, IF_ID_rt, IF_ID_rs, ID_EX_reg_dest;
  wire regs_are_equal;
  wire [4:0] EX_Mem_rd;
  wire EX_Mem_reg_write_en, Mem_WB_reg_write_en;
  wire [4:0] Mem_WB_rd;
  wire forward_r1_eq, forward_r2_eq;

  DataPath data_path (
    .forward_a(forward_a),
    .forward_b(forward_b),
    .forward_r1_eq(forward_r1_eq),
    .forward_r2_eq(forward_r2_eq),
    .cancel_ID_EX_signals(cancel_ID_EX_signals),
    .pc_write(pc_write),
    .pc_sel(pc_sel),
    .imm_sel(imm_sel),
    .IF_ID_write_en(IF_ID_write_en),
    .IF_ID_flush(IF_ID_flush),
    .reg_file_write_en(reg_file_write_en),
    .mem_write_en(mem_write_en),
    .mem_read_en(mem_read_en),
    .reg_dest_sel(reg_dest_sel),
    .reg_data_sel(reg_data_sel),
    .alu_op_code(alu_op_code),
    .clk(clk),
    .rst(rst),
    .ID_EX_inst_op(ID_EX_inst_op),
    .ID_EX_inst_func(ID_EX_inst_func),
    .IF_ID_inst_op(IF_ID_inst_op),
    .IF_ID_inst_func(IF_ID_inst_func),
    .ID_EX_rs(ID_EX_rs),
    .ID_EX_rt(ID_EX_rt),
    .IF_ID_rt(IF_ID_rt),
    .IF_ID_rs(IF_ID_rs),
    .ID_EX_reg_dest(ID_EX_reg_dest),
    .regs_are_equal(regs_are_equal),
    .EX_Mem_rd(EX_Mem_rd),
    .EX_Mem_reg_write_en(EX_Mem_reg_write_en),
    .Mem_WB_reg_write_en(Mem_WB_reg_write_en),
    .Mem_WB_rd(Mem_WB_rd)
  );

  Controller controller (
    .inst_op_code(IF_ID_inst_op),
    .inst_func_code(IF_ID_inst_func),
    .imm_sel(imm_sel),
    .mem_write_en(mem_write_en),
    .mem_read_en(mem_read_en),
    .reg_dest_sel(reg_dest_sel),
    .reg_data_sel(reg_data_sel),
    .reg_write_en(reg_file_write_en),
    .alu_op_code(alu_op_code)
  );

  ForwardingUnit forwarding_unit (
    .EX_Mem_rd(EX_Mem_rd),
    .EX_Mem_reg_write_en(EX_Mem_reg_write_en),
    .Mem_WB_reg_write_en(Mem_WB_reg_write_en),
    .ID_EX_rs(ID_EX_rs),
    .ID_EX_rt(ID_EX_rt),
    .IF_ID_rs(IF_ID_rs),
    .IF_ID_rt(IF_ID_rt),
    .ID_EX_reg_dest(ID_EX_reg_dest),
    .Mem_WB_rd(Mem_WB_rd),
    .forward_a(forward_a),
    .forward_b(forward_b),
    .forward_r1_eq(forward_r1_eq),
    .forward_r2_eq(forward_r2_eq)
  );

  HazardUnit hazard_unit (
    .ID_EX_inst_op(ID_EX_inst_op),
    .ID_EX_inst_func(ID_EX_inst_func),
    .IF_ID_inst_op(IF_ID_inst_op),
    .ID_EX_rt(ID_EX_rt),
    .IF_ID_rs(IF_ID_rs),
    .IF_ID_rt(IF_ID_rt),
    .regs_are_eq(regs_are_equal),
    .cancel_ID_EX_signals(cancel_ID_EX_signals),
    .pc_write(pc_write),
    .pc_sel(pc_sel),
    .IF_ID_write_en(IF_ID_write_en),
    .IF_ID_flush(IF_ID_flush)
  );
endmodule
