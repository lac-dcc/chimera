// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "DataPath.v"
`include "Controller.v"

module MIPS (
  clk,
  rst
);
  input clk, rst;
  wire pc_write, pc_write_cond, mem_write, mem_read, IR_write, reg_write_en;
  wire mem_adr_sel, reg_write_adr_sel;
  wire [2:0] reg_write_sel;
  wire ALU_src_a_sel;
  wire [1:0] ALU_src_b_sel;
  wire [1:0] pc_sel;
  wire [1:0] ALU_op_code;
  wire [15:0] cur_inst;

  MIPS_DataPath data_path (
      .clk(clk),
      .rst(rst),
      .pc_write(pc_write),
      .pc_write_cond(pc_write_cond),
      .mem_write(mem_write),
      .mem_read(mem_read),
      .IR_write(IR_write),
      .reg_write_en(reg_write_en),
      .mem_adr_sel(mem_adr_sel),
      .reg_write_adr_sel(reg_write_adr_sel),
      .reg_write_sel(reg_write_sel),
      .ALU_src_A_sel(ALU_src_a_sel),
      .ALU_src_B_sel(ALU_src_b_sel),
      .pc_sel(pc_sel),
      .ALU_op_code(ALU_op_code),
      .inst_bus(cur_inst)
  );

  Controller controller (
      .mem_read(mem_read),
      .alu_src_a(ALU_src_a_sel),
      .mem_adr_sel(mem_adr_sel),
      .IR_write(IR_write),
      .alu_src_b(ALU_src_b_sel),
      .alu_op(ALU_op_code),
      .pc_write(pc_write),
      .pc_sel(pc_sel),
      .Inst(cur_inst),
      .mem_write(mem_write),
      .reg_write_adr(reg_write_adr_sel),
      .reg_write_sel(reg_write_sel),
      .reg_write_en(reg_write_en),
      .pc_write_cond(pc_write_cond),
      .clk(clk),
      .rst(rst)
  );

endmodule
