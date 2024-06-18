// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/Register.v"

module Mem_WB (
    mem_read_data_in,
    alu_result_in,
    next_pc_in,
    reg_dest_in,
    reg_data_sel_in,
    reg_write_en_in,
    less_than_in,
    clk,
    rst,
    mem_read_data_out,
    alu_result_out,
    next_pc_out,
    reg_dest_out,
    reg_data_sel_out,
    reg_write_en_out,
    less_than_out
);

  input [31:0] mem_read_data_in, alu_result_in, next_pc_in;
  input [4:0] reg_dest_in;
  input [1:0] reg_data_sel_in;
  input reg_write_en_in, less_than_in, clk, rst;

  output [31:0] mem_read_data_out, alu_result_out, next_pc_out;
  output [4:0] reg_dest_out;
  output [1:0] reg_data_sel_out;
  output reg_write_en_out, less_than_out;

  Register #(
      .word_len(32)
  ) mem_read_data_reg (
      .par_in(mem_read_data_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(mem_read_data_out)
  );

  Register #(
      .word_len(32)
  ) alu_result_reg (
      .par_in(alu_result_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(alu_result_out)
  );

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
      .word_len(5)
  ) reg_dest_reg (
      .par_in(reg_dest_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_dest_out)
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
      .word_len(1)
  ) reg_write_en_reg (
      .par_in(reg_write_en_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_write_en_out)
  );

  Register #(
      .word_len(1)
  ) less_than_reg (
      .par_in(less_than_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(less_than_out)
  );

endmodule
