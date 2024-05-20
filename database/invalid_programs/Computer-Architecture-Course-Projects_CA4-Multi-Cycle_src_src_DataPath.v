// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/ALU.v"
`include "inner_modules/MUX.v"
`include "inner_modules/Register.v"
`include "inner_modules/RegFile.v"
`include "inner_modules/Memory.v"

module MIPS_DataPath (
    clk,
    rst,
    pc_write,
    pc_write_cond,
    mem_write,
    mem_read,
    IR_write,
    reg_write_en,
    mem_adr_sel,
    reg_write_adr_sel,
    reg_write_sel,
    ALU_src_A_sel,
    ALU_src_B_sel,
    pc_sel,
    ALU_op_code,
    inst_bus
);

  input clk, rst;
  input pc_write, pc_write_cond, mem_write, mem_read, IR_write, reg_write_en;
  input mem_adr_sel, reg_write_adr_sel;
  input [2:0] reg_write_sel;
  input ALU_src_A_sel;
  input [1:0] ALU_src_B_sel;
  input [1:0] pc_sel;
  input [1:0] ALU_op_code;

  output [15:0] inst_bus;

  wire [11:0] pc_out_bus, memory_addr_bus;
  wire [15:0] memory_out, mdr_out, reg_file_write_data, reg_file_read1, reg_file_read2, data2_reg_out;
  wire [2:0] reg_file_write_addr;
  wire [15:0] alu_src_a, alu_src_b, alu_out, alu_result_reg_out;
  wire [11:0] selected_pc;

  wire zero;
  wire pc_load_en;
  assign pc_load_en = pc_write | (pc_write_cond & zero);

  wire [11:0] branch_z_pc;
  assign branch_z_pc = {pc_out_bus[11:9], inst_bus[8:0]};

  wire [11:0] jump_pc;
  assign jump_pc = inst_bus[11:0];

  wire [15:0] imm_data;
  assign imm_data = {{4{inst_bus[11]}}, inst_bus[11:0]};

  wire [15:0] pc_out_sgn_ext;
  assign pc_out_sgn_ext = {{4{pc_out_bus[11]}}, pc_out_bus};

  wire [2:0] ri;
  assign ri = inst_bus[11:9];

  wire [2:0] r0;
  assign r0 = 3'b0;

  Register #(
      .word_len(12)
  ) pc_register (
      .par_in(selected_pc),
      .clk(clk),
      .rst(rst),
      .load_en(pc_load_en),
      .par_out(pc_out_bus)
  );

  Register #(
      .word_len(16)
  ) ir_register (
      .par_in(memory_out),
      .clk(clk),
      .rst(rst),
      .load_en(IR_write),
      .par_out(inst_bus)
  );

  Register #(
      .word_len(16)
  ) mdr (
      .par_in(memory_out),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(mdr_out)
  );

  Register #(
    .word_len(16)
  ) alu_result_reg (
    .par_in(alu_out),
    .clk(clk),
    .rst(rst),
    .load_en(1'b1),
    .par_out(alu_result_reg_out)
  );

  Register #(
      .word_len(16)
  ) data2 (
      .par_in(reg_file_read2),
      .clk(clk),
      .rst(rst),
      .load_en(1'b1),
      .par_out(data2_reg_out)
  );

  MUX #(
      .word_len(12),
      .input_size(2),
      .sel_len(1)
  ) mem_addr_mux (
      .mux_in({pc_out_bus, inst_bus[11:0]}),
      .sel(mem_adr_sel),
      .mux_out(memory_addr_bus)
  );

  MUX #(
      .word_len(16),
      .input_size(5),
      .sel_len(3)
  ) reg_file_write_data_mux (
      .mux_in({mdr_out, reg_file_read1, data2_reg_out, alu_result_reg_out, ~data2_reg_out}),
      .sel(reg_write_sel),
      .mux_out(reg_file_write_data)
  );

  MUX #(
      .word_len(3),
      .input_size(2),
      .sel_len(1)
  ) reg_file_write_addr_mux (
      .mux_in({r0, ri}),
      .sel(reg_write_adr_sel),
      .mux_out(reg_file_write_addr)
  );

  MUX #(
      .word_len(16),
      .input_size(2),
      .sel_len(1)
  ) alu_src_a_mux (
      .mux_in({pc_out_sgn_ext, reg_file_read1}),
      .sel(ALU_src_A_sel),
      .mux_out(alu_src_a)
  );

  MUX #(
      .word_len(16),
      .input_size(3),
      .sel_len(2)
  ) alu_src_b_mux (
      .mux_in({data2_reg_out, 16'd1, imm_data}),
      .sel(ALU_src_B_sel),
      .mux_out(alu_src_b)
  );

  MUX #(
      .word_len(12),
      .input_size(4),
      .sel_len(2)
  ) pc_sel_mux (
      .mux_in({alu_out[11:0], jump_pc, branch_z_pc, alu_result_reg_out[11:0]}),
      .sel(pc_sel),
      .mux_out(selected_pc)
  );

  Memory #(
      .word_len  (16),
      .addr_len  (12),
      .word_count(2 ** 12)
  ) memory (
      .address(memory_addr_bus),
      .write_bus(reg_file_read1),
      .write_en(mem_write),
      .read_en(mem_read),
      .clk(clk),
      .out_bus(memory_out)
  );

  RegFile #(
      .word_len  (16),
      .word_count(8),
      .addr_len  (3)
  ) reg_file (
      .reg1_addr(r0),
      .reg2_addr(ri),
      .write_bus(reg_file_write_data),
      .write_addr(reg_file_write_addr),
      .write_en(reg_write_en),
      .clk(clk),
      .rst(rst),
      .data1(reg_file_read1),
      .data2(reg_file_read2)
  );

  ALU #(
      .word_len(16)
  ) alu (
      .in1(alu_src_a),
      .in2(alu_src_b),
      .op_code(ALU_op_code),
      .result(alu_out),
      .zer_flag(zero)
  );

endmodule
