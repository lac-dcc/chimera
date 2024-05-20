// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "EX_MEM.v"
`include "ForwardingUnit.v"
`include "HazardUnit.v"
`include "ID_EX.v"
`include "IF_ID.v"
`include "Mem_WB.v"
`include "inner_modules/ALU.v"
`include "inner_modules/Equal.v"
`include "inner_modules/Memory.v"
`include "inner_modules/MUX.v"
`include "inner_modules/RegFile.v"
`include "inner_modules/Register.v"
`include "inner_modules/InstMemory.v"
`include "inner_modules/Adder.v"
`include "inner_modules/shl2.v"

module DataPath (
    forward_a,
    forward_b,
    forward_r1_eq,
    forward_r2_eq,
    cancel_ID_EX_signals,
    pc_write,
    pc_sel,
    imm_sel,
    IF_ID_write_en,
    IF_ID_flush,
    reg_file_write_en,
    mem_write_en,
    mem_read_en,
    reg_dest_sel,
    reg_data_sel,
    alu_op_code,
    clk,
    rst,
    ID_EX_inst_op,
    ID_EX_inst_func,
    IF_ID_inst_op,
    IF_ID_inst_func,
    ID_EX_rs,
    ID_EX_rt,
    IF_ID_rt,
    IF_ID_rs,
    ID_EX_reg_dest,
    regs_are_equal,
    EX_Mem_rd,
    EX_Mem_reg_write_en,
    Mem_WB_reg_write_en,
    Mem_WB_rd
);
  input [1:0] forward_a, forward_b;
  input forward_r1_eq, forward_r2_eq;
  input cancel_ID_EX_signals, pc_write;
  input [1:0] pc_sel;
  input imm_sel, IF_ID_write_en, IF_ID_flush, reg_file_write_en, mem_write_en, mem_read_en;
  input [1:0] reg_dest_sel, reg_data_sel;
  input [2:0] alu_op_code;
  input clk, rst;

  output [5:0] ID_EX_inst_op, ID_EX_inst_func, IF_ID_inst_op, IF_ID_inst_func;
  output [4:0] ID_EX_rs, ID_EX_rt, IF_ID_rt, IF_ID_rs, ID_EX_reg_dest;
  output regs_are_equal;
  output [4:0] EX_Mem_rd;
  output EX_Mem_reg_write_en, Mem_WB_reg_write_en;
  output [4:0] Mem_WB_rd;

  //IF
  wire [31:0] pc_out_bus, next_pc, current_inst;
  wire [31:0] beq_pc, jump_pc, jump_reg_pc;
  wire [31:0] next_selected_pc;
  wire [31:0] if_id_pc_out, if_id_inst_out;

  assign IF_ID_inst_op   = if_id_inst_out[31:26];
  assign IF_ID_inst_func = if_id_inst_out[5:0];

  InstMemory ins_mem (
      .addr(pc_out_bus),
      .clk(clk),
      .out_bus(current_inst)
  );

  Adder #(
      .word_len(32)
  ) next_pc_adder (
      .a(pc_out_bus),
      .b(32'd4),
      .result(next_pc)
  );

  MUX #(
      .word_len(32),
      .input_size(4),
      .sel_len(2)
  ) next_pc_mux (
      .mux_in({next_pc, beq_pc, jump_pc, jump_reg_pc}),
      .sel(pc_sel),
      .mux_out(next_selected_pc)
  );

  Register #(
      .word_len(32)
  ) pc_reg (
      .par_in(next_selected_pc),
      .clk(clk),
      .rst(rst),
      .load_en(pc_write),
      .par_out(pc_out_bus)
  );

  IF_ID if_id (
      .inst_in(current_inst),
      .pc_in(next_pc),
      .write_en(IF_ID_write_en),
      .clk(clk),
      .rst(rst || IF_ID_flush),
      .inst_out(if_id_inst_out),
      .pc_out(if_id_pc_out)
  );

  //////////
  //ID

  wire [31:0] selected_reg_data;
  wire Mem_WB_reg_write_en;
  wire [4:0] Mem_WB_reg_dest;

  //inst decoded parts
  wire [4:0] rs, rt, rd;
  wire [15:0] imm;
  wire [25:0] target_addr;
  wire [5:0] inst_op, inst_func;
  wire [ 5:0] r_type_func;

  wire [31:0] reg_file_write_bus;
  wire [ 4:0] reg_file_write_addr;
  wire [31:0] reg_file_read1, reg_file_read2;
  wire [31:0] sgn_ext_imm;
  wire [31:0] selected_r1, selected_r2;

  wire [31:0] ID_EX_next_pc_out, ID_EX_reg_file_r1, ID_EX_reg_file_r2;
  wire [31:0] ID_EX_imm;
  wire [4:0] ID_EX_rt, ID_EX_rd, ID_EX_rs;
  wire ID_EX_imm_sel, ID_EX_mem_write_en, ID_EX_mem_read_en;
  wire [1:0] ID_EX_reg_dest_sel, ID_EX_reg_data_sel;
  wire ID_EX_reg_write_en;
  wire [2:0] ID_EX_alu_op_code;

  assign inst_op = if_id_inst_out[31:26];
  assign inst_func = if_id_inst_out[5:0];
  assign rs = if_id_inst_out[25:21];
  assign rt = if_id_inst_out[20:16];
  assign rd = if_id_inst_out[15:11];
  assign imm = if_id_inst_out[15:0];
  assign target_addr = if_id_inst_out[25:0];
  assign sgn_ext_imm = {{16{imm[15]}}, imm};
  assign jump_pc = {pc_out_bus[31:30], target_addr, 2'b0};
  assign jump_reg_pc = reg_file_read1;
  assign IF_ID_rt = rt;
  assign IF_ID_rs = rs;

  RegFile #(
      .word_len  (32),
      .word_count(32),
      .addr_len  (5)
  ) reg_file (
      .reg1_addr(rs),
      .reg2_addr(rt),
      .write_bus(selected_reg_data),
      .write_addr(Mem_WB_reg_dest),
      .write_en(Mem_WB_reg_write_en),
      .clk(clk),
      .rst(rst),
      .data1(reg_file_read1),
      .data2(reg_file_read2)
  );

  Adder #(
      .word_len(32)
  ) beq_adder (
      .a(if_id_pc_out),
      .b({sgn_ext_imm[29:0], 2'b0}),
      .result(beq_pc)
  );

  Equal #(
      .word_len(32)
  ) regs_equal (
      .a(selected_r1),
      .b(selected_r2),
      .is_equal(regs_are_equal)
  );

  wire selected_reg_write_en, selected_mem_read_en, selected_mem_write_en;

  MUX #(
      .word_len(3),
      .input_size(2),
      .sel_len(1)
  ) cancel_signals_mux (
      .mux_in({{reg_file_write_en, mem_read_en, mem_write_en}, 3'b0}),
      .sel(cancel_ID_EX_signals),
      .mux_out({selected_reg_write_en, selected_mem_read_en, selected_mem_write_en})
  );

  ID_EX id_ex (
      .next_pc_in(if_id_pc_out),
      .reg_file_r1_in(reg_file_read1),
      .reg_file_r2_in(reg_file_read2),
      .imm_in(sgn_ext_imm),
      .rt_in(rt),
      .rd_in(rd),
      .rs_in(rs),
      .imm_sel_in(imm_sel),
      .mem_write_en_in(selected_mem_write_en),
      .mem_read_en_in(selected_mem_read_en),
      .reg_dest_sel_in(reg_dest_sel),
      .reg_data_sel_in(reg_data_sel),
      .reg_write_en_in(selected_reg_write_en),
      .alu_op_code_in(alu_op_code),
      .inst_op_in(inst_op),
      .inst_func_in(inst_func),
      .clk(clk),
      .rst(rst),
      .next_pc_out(ID_EX_next_pc_out),
      .reg_file_r1_out(ID_EX_reg_file_r1),
      .reg_file_r2_out(ID_EX_reg_file_r2),
      .imm_out(ID_EX_imm),
      .rt_out(ID_EX_rt),
      .rd_out(ID_EX_rd),
      .rs_out(ID_EX_rs),
      .imm_sel_out(ID_EX_imm_sel),
      .mem_write_en_out(ID_EX_mem_write_en),
      .mem_read_en_out(ID_EX_mem_read_en),
      .reg_dest_sel_out(ID_EX_reg_dest_sel),
      .reg_data_sel_out(ID_EX_reg_data_sel),
      .reg_write_en_out(ID_EX_reg_write_en),
      .alu_op_code_out(ID_EX_alu_op_code),
      .inst_op_out(ID_EX_inst_op),
      .inst_func_out(ID_EX_inst_func)
  );

  //////////
  //EX
  wire [31:0] alu_a, alu_b, alu_b_imm_selected, alu_result;
  wire alu_zer_flag, neg_flag, alu_st;
  wire [4:0] selected_reg_dest;

  wire [31:0] EX_Mem_next_pc, EX_Mem_alu_result, EX_Mem_mem_write_data;
  wire [4:0] EX_Mem_reg_dest;
  wire EX_Mem_mem_write_en, EX_Mem_mem_read_en;
  wire [1:0] EX_Mem_reg_data_sel;
  wire EX_Mem_reg_write_en, EX_Mem_less_than;

  assign EX_Mem_rd = EX_Mem_reg_dest;
  assign ID_EX_reg_dest = selected_reg_dest;

  MUX #(
      .word_len(32),
      .input_size(2),
      .sel_len(1)
  ) r1_eq_mux (
      .mux_in({reg_file_read1, alu_result}),
      .sel(forward_r1_eq),
      .mux_out(selected_r1)
  );

  MUX #(
      .word_len(32),
      .input_size(2),
      .sel_len(1)
  ) r2_eq_mux (
      .mux_in({reg_file_read2, alu_result}),
      .sel(forward_r2_eq),
      .mux_out(selected_r2)
  );

  MUX #(
      .word_len(32),
      .input_size(3),
      .sel_len(2)
  ) alu_src_a_mux (
      .mux_in({ID_EX_reg_file_r1, EX_Mem_alu_result, selected_reg_data}),
      .sel(forward_a),
      .mux_out(alu_a)
  );

  MUX #(
      .word_len(32),
      .input_size(3),
      .sel_len(2)
  ) alu_src_b_mux (
      .mux_in({ID_EX_reg_file_r2, EX_Mem_alu_result, selected_reg_data}),
      .sel(forward_b),
      .mux_out(alu_b)
  );

  MUX #(
      .word_len(32),
      .input_size(2),
      .sel_len(1)
  ) imm_sel_mux (
      .mux_in({alu_b, ID_EX_imm}),
      .sel(ID_EX_imm_sel),
      .mux_out(alu_b_imm_selected)
  );

  MUX #(
      .word_len(5),
      .input_size(3),
      .sel_len(2)
  ) reg_dest_mux (
      .mux_in({ID_EX_rt, ID_EX_rd, 5'd31}),
      .sel(ID_EX_reg_dest_sel),
      .mux_out(selected_reg_dest)
  );

  ALU #(
      .word_len(32)
  ) alu (
      .in1(alu_a),
      .in2(alu_b_imm_selected),
      .op_code(ID_EX_alu_op_code),
      .result(alu_result),
      .zer_flag(alu_zer_flag),
      .neg_flag(alu_neg_flag),
      .st(alu_st)
  );

  EX_MEM ex_mem (
      .next_pc_in(ID_EX_next_pc_out),
      .alu_res_in(alu_result),
      .mem_write_data_in(alu_b),
      .reg_dest_in(selected_reg_dest),
      .mem_write_en_in(ID_EX_mem_write_en),
      .mem_read_en_in(ID_EX_mem_read_en),
      .reg_data_sel_in(ID_EX_reg_data_sel),
      .reg_write_en_in(ID_EX_reg_write_en),
      .clk(clk),
      .rst(rst),
      .next_pc_out(EX_Mem_next_pc),
      .alu_res_out(EX_Mem_alu_result),
      .mem_write_data_out(EX_Mem_mem_write_data),
      .reg_dest_out(EX_Mem_reg_dest),
      .mem_write_en_out(EX_Mem_mem_write_en),
      .mem_read_en_out(EX_Mem_mem_read_en),
      .reg_data_sel_out(EX_Mem_reg_data_sel),
      .reg_write_en_out(EX_Mem_reg_write_en)
  );

  //////////
  //Mem

  wire [31:0] mem_read_data;
  wire [31:0] Mem_WB_mem_read_data, Mem_WB_alu_result, Mem_WB_next_pc;
  wire [1:0] Mem_WB_reg_data_sel;
  wire Mem_WB_less_than;

  assign Mem_WB_rd = Mem_WB_reg_dest;

  Memory #(
      .word_len  (32),
      .addr_len  (32),
      .word_count(2 ** 15)
  ) data_mem (
      .address({EX_Mem_alu_result[29:0], 2'b0}),
      .write_bus(EX_Mem_mem_write_data),
      .write_en(EX_Mem_mem_write_en),
      .read_en(EX_Mem_mem_read_en),
      .clk(clk),
      .out_bus(mem_read_data)
  );

  Mem_WB mem_wb (
      .mem_read_data_in(mem_read_data),
      .alu_result_in(EX_Mem_alu_result),
      .next_pc_in(EX_Mem_next_pc),
      .reg_dest_in(EX_Mem_reg_dest),
      .reg_data_sel_in(EX_Mem_reg_data_sel),
      .reg_write_en_in(EX_Mem_reg_write_en),
      .clk(clk),
      .rst(rst),
      .mem_read_data_out(Mem_WB_mem_read_data),
      .alu_result_out(Mem_WB_alu_result),
      .next_pc_out(Mem_WB_next_pc),
      .reg_dest_out(Mem_WB_reg_dest),
      .reg_data_sel_out(Mem_WB_reg_data_sel),
      .reg_write_en_out(Mem_WB_reg_write_en)
  );

  //////////
  //WB

  MUX #(
      .word_len(32),
      .input_size(3),
      .sel_len(2)
  ) reg_data_mux (
      .mux_in({Mem_WB_next_pc, Mem_WB_alu_result, Mem_WB_mem_read_data}),
      .sel(Mem_WB_reg_data_sel),
      .mux_out(selected_reg_data)
  );

  //////////

endmodule
