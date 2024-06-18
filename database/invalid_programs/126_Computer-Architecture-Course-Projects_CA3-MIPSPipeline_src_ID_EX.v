// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/Register.v"

module ID_EX (
    next_pc_in,
    reg_file_r1_in,
    reg_file_r2_in,
    imm_in,
    rt_in,
    rd_in,
    rs_in,
    imm_sel_in,
    mem_write_en_in,
    mem_read_en_in,
    reg_dest_sel_in,
    reg_data_sel_in,
    reg_write_en_in,
    alu_op_code_in,
    inst_op_in,
    inst_func_in,
    clk,
    rst,
    next_pc_out,
    reg_file_r1_out,
    reg_file_r2_out,
    imm_out,
    rt_out,
    rd_out,
    rs_out,
    imm_sel_out,
    mem_write_en_out,
    mem_read_en_out,
    reg_dest_sel_out,
    reg_data_sel_out,
    reg_write_en_out,
    alu_op_code_out,
    inst_op_out,
    inst_func_out
);

  input [31:0] next_pc_in, reg_file_r1_in, reg_file_r2_in;
  input [31:0] imm_in;
  input [4:0] rt_in, rd_in, rs_in;
  input imm_sel_in;
  input mem_write_en_in, mem_read_en_in, reg_write_en_in;
  input [1:0] reg_dest_sel_in, reg_data_sel_in;
  input [2:0] alu_op_code_in;
  input [5:0] inst_op_in, inst_func_in;
  input clk, rst;

  output [31:0] next_pc_out, reg_file_r1_out, reg_file_r2_out;
  output [31:0] imm_out;
  output [4:0] rt_out, rd_out, rs_out;
  output imm_sel_out;
  output mem_write_en_out, mem_read_en_out, reg_write_en_out;
  output [1:0] reg_dest_sel_out, reg_data_sel_out;
  output [2:0] alu_op_code_out;
  output [5:0] inst_op_out, inst_func_out;


  Register #(
      .word_len(32)
  ) next_pc_reg (
      .par_in(next_pc_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(next_pc_out)
  );

  Register #(
      .word_len(32)
  ) reg_file_r1 (
      .par_in(reg_file_r1_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_file_r1_out)
  );

  Register #(
      .word_len(32)
  ) reg_file_r2 (
      .par_in(reg_file_r2_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_file_r2_out)
  );

  Register #(
      .word_len(32)
  ) imm_reg (
      .par_in(imm_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(imm_out)
  );

  Register #(
      .word_len(5)
  ) rt_reg (
      .par_in(rt_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(rt_out)
  );

  Register #(
      .word_len(5)
  ) rd_reg (
      .par_in(rd_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(rd_out)
  );

  Register #(
      .word_len(5)
  ) rs_reg (
      .par_in(rs_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(rs_out)
  );

  Register #(
      .word_len(1)
  ) imm_sel_reg (
      .par_in(imm_sel_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(imm_sel_out)
  );

  Register #(
      .word_len(1)
  ) mem_write_en_reg (
      .par_in(mem_write_en_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(mem_write_en_out)
  );

  Register #(
      .word_len(1)
  ) mem_read_en_reg (
      .par_in(mem_read_en_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(mem_read_en_out)
  );

  Register #(
      .word_len(1)
  ) reg_write_en_reg (
      .par_in(reg_write_en_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_write_en_out)
  );

  Register #(
      .word_len(2)
  ) reg_dest_sel_reg (
      .par_in(reg_dest_sel_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_dest_sel_out)
  );

  Register #(
      .word_len(2)
  ) reg_data_sel_reg (
      .par_in(reg_data_sel_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_data_sel_out)
  );

  Register #(
    .word_len(3)
  ) alu_op_code_reg (
    .par_in(alu_op_code_in),
    .clk(clk),
    .rst(rst),
    .load_en(1'b1),
    .par_out(alu_op_code_out)
  );

  Register #(
    .word_len(6)
  ) inst_op_reg (
    .par_in(inst_op_in),
    .clk(clk),
    .rst(rst),
    .load_en(1'b1),
    .par_out(inst_op_out)
  );

  Register #(
    .word_len(6)
  ) inst_func_reg (
    .par_in(inst_func_in),
    .clk(clk),
    .rst(rst),
    .load_en(1'b1),
    .par_out(inst_func_out)
  );

endmodule
