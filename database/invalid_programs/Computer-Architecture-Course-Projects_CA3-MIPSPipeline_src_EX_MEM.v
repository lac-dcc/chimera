// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/Register.v"

module EX_MEM (
    next_pc_in,
    alu_res_in,
    mem_write_data_in,
    reg_dest_in,
    mem_write_en_in,
    mem_read_en_in,
    reg_data_sel_in,
    reg_write_en_in,
    less_than_in,
    clk,
    rst,
    next_pc_out,
    alu_res_out,
    mem_write_data_out,
    reg_dest_out,
    mem_write_en_out,
    mem_read_en_out,
    reg_data_sel_out,
    reg_write_en_out,
    less_than_out
);

  input [31:0] next_pc_in, alu_res_in, mem_write_data_in;
  input [4:0] reg_dest_in;
  input mem_write_en_in, mem_read_en_in, reg_write_en_in;
  input [1:0] reg_data_sel_in;
  input less_than_in;
  input clk, rst;

  output [31:0] next_pc_out, alu_res_out, mem_write_data_out;
  output [4:0] reg_dest_out;
  input mem_write_en_out, mem_read_en_out, reg_write_en_out;
  input [1:0] reg_data_sel_out;
  output less_than_out;

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
  ) alu_res_reg (
      .par_in(alu_res_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(alu_res_out)
  );

  Register #(
      .word_len(32)
  ) mem_write_data_reg (
      .par_in(mem_write_data_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(mem_write_data_out)
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
  ) reg_data_sel_reg (
      .par_in(reg_data_sel_in),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(reg_data_sel_out)
  );

  Register #(
      .word_len(1)
  ) less_than_reg (
      .par_in(less_than_in),
      .clk(clK),
      .rst(rst),
      .load_en(1'b1),
      .par_out(less_than_out)
  );

endmodule
