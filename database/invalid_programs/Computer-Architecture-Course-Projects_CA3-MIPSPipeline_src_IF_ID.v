// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/Register.v"

module IF_ID (
    inst_in,
    pc_in,
    write_en,
    clk,
    rst,
    inst_out,
    pc_out
);

  input [31:0] inst_in, pc_in;
  input write_en, clk, rst;

  output [31:0] inst_out, pc_out;

  Register #(
      .word_len(32)
  ) inst_reg (
      .par_in(inst_in),
      .clk(clk),
      .rst(rst),
      .load_en(write_en),
      .par_out(inst_out)
  );

  Register #(
      .word_len(32)
  ) pc_reg (
      .par_in(pc_in),
      .clk(clk),
      .rst(rst),
      .load_en(write_en),
      .par_out(pc_out)
  );

endmodule
