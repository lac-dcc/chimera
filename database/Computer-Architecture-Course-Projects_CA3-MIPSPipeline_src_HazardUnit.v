// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define beq 6'b000100
`define lw 6'b100011
`define jr 6'b001000
`define j 6'b000010

`define f_jr 6'b001000

module HazardUnit (
    ID_EX_inst_op,
    ID_EX_inst_func,
    IF_ID_inst_op,
    ID_EX_rt,
    IF_ID_rs,
    IF_ID_rt,
    regs_are_eq,
    cancel_ID_EX_signals,
    pc_write,
    pc_sel,
    IF_ID_write_en,
    IF_ID_flush
);

  input [5:0] ID_EX_inst_op, ID_EX_inst_func, IF_ID_inst_op;
  input [4:0] ID_EX_rt, IF_ID_rs, IF_ID_rt;
  input regs_are_eq;

  output reg cancel_ID_EX_signals, pc_write, IF_ID_write_en, IF_ID_flush;
  output reg [1:0] pc_sel;

  always @(ID_EX_inst_op, ID_EX_inst_func, IF_ID_inst_op, ID_EX_rt, IF_ID_rs, IF_ID_rt, regs_are_eq) begin
    cancel_ID_EX_signals = 1'b0;
    pc_write = 1'b1;
    pc_sel = 1'b0;
    IF_ID_write_en = 1'b1;
    IF_ID_flush = 1'b0;

    if(ID_EX_inst_op == `lw & (ID_EX_rt == IF_ID_rs | ID_EX_rt == IF_ID_rt)) begin
      cancel_ID_EX_signals = 1'b1;
      pc_write = 1'b0;
      IF_ID_write_en = 1'b0;
    end

    if(IF_ID_inst_op == `beq & regs_are_eq) begin
      IF_ID_flush = 1'b1;
      pc_sel = 2'd1;
    end

    if(ID_EX_inst_op == `jr & ID_EX_inst_func == `f_jr) begin
      IF_ID_flush = 1'b1;
      pc_sel = 2'd3;
    end

    if(IF_ID_inst_op == `j) begin
      pc_sel = 2'd2;
      IF_ID_flush = 1'b1;
    end
  end

endmodule
