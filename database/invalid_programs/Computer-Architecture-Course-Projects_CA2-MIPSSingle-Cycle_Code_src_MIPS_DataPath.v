// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/ALU.v"
`include "inner_modules/Memory.v"
`include "inner_modules/MUX.v"
`include "inner_modules/RegFile.v"
`include "inner_modules/Register.v"
`include "inner_modules/InstMemory.v"

module MIPSDataPath (
    reg_write_en,
    reg_write_sel,
    pc_load_en,
    pc_next_sel,
    ALU_B_sel,
    ALU_op_code,
    mem_write_en,
    mem_read_en,
    mem_out_sel,
    slt_ALU_sel,
    jal_sel,
    clk,
    rst,
    zer,
    st,
    instruction_bus
);
  input [1:0] reg_write_sel, pc_next_sel;
  input [2:0] ALU_op_code;
  input 
    reg_write_en,
    pc_load_en,
    ALU_B_sel,
    mem_write_en,
    mem_read_en,
    mem_out_sel,
    slt_ALU_sel,
    jal_sel,
    clk,
    rst;

  output [31:0] instruction_bus;
  output zer, st;

  wire [4:0] rs, rt, rd, r31, write_addr_bus;
  wire [31:0]
    write_bus,
    reg1_bus,
    reg2_bus,
    imm,
    ALU_B_in,
    ALU_out,
    mem_out,
    selected_mem_out,
    pc_in_bus,
    pc_out_bus,
    next_pc_bus,
    label,
    st_bus,
    selected_alu_out,
    beq_label;

  wire zero_flag, neg_flag;

  assign rs = instruction_bus[25:21];
  assign rt = instruction_bus[20:16];
  assign rd = instruction_bus[15:11];
  assign label = {pc_out_bus[31:28], instruction_bus[25:0], 2'b0};
  assign beq_label = {{14{imm[15]}}, imm, 2'b0} + 32'd4;
  assign imm = instruction_bus[15:0];
  assign r31 = 5'd31;
  assign next_pc_bus = pc_out_bus + 32'd4;
  assign st_bus = {31'b0, st};

  MUX #(.word_len(5), .input_size(3), .sel_len(2)) mux1 (
    .mux_in ({rd, rt, r31}),
    .sel (reg_write_sel),
    .mux_out (write_addr_bus)
  );

  MUX #(.word_len(32), .input_size(2), .sel_len(1)) mux2 (
    .mux_in ({reg2_bus, imm}),
    .sel (ALU_B_sel),
    .mux_out (ALU_B_in)
  );

  MUX #(.word_len(32), .input_size(2), .sel_len(1)) mux3 (
    .mux_in ({{selected_alu_out, mem_out}}),
    .sel (mem_out_sel),
    .mux_out (selected_mem_out)
  );

  MUX #(.word_len(32), .input_size(2), .sel_len(1)) mux4 (
    .mux_in ({selected_mem_out, pc_out_bus}),
    .sel (jal_sel),
    .mux_out (write_bus)
  );

  MUX #(.word_len(32), .input_size(4), .sel_len(2)) mux5 (
    .mux_in ({next_pc_bus, beq_label, label, reg1_bus}),
    .sel (pc_next_sel),
    .mux_out (pc_in_bus)
  );

  MUX #(.word_len(32), .input_size(2), .sel_len(1)) mux6 (
    .mux_in ({st_bus, ALU_out}),
    .sel (slt_ALU_sel),
    .mux_out (selected_alu_out)
  );

  ALU #(.word_len(32)) alu (
    .in1 (reg1_bus),
    .in2 (ALU_B_in),
    .op_code (ALU_op_code),
    .result (ALU_out),
    .zer_flag (zer),
    .neg_flag (neg_flag),
    .st (st)
  );

  RegFile #(.word_len(32), .word_count(32), .addr_len(5)) reg_file (
    .reg1_addr (rs),
    .reg2_addr (rt),
    .write_bus (write_bus),
    .write_addr (write_addr_bus),
    .write_en (reg_write_en),
    .clk (clk),
    .rst (rst),
    .data1 (reg1_bus),
    .data2 (reg2_bus)
  );

  Memory #(.word_len(32), .addr_len(32), .word_count(3000)) memory (
    .address ({ALU_out[29:0], 2'b0}),
    .write_bus (reg2_bus),
    .write_en (mem_write_en),
    .read_en (mem_read_en),
    .clk (clk),
    .out_bus (mem_out)
  );

  InstMemory instructions_memory (
    .addr (pc_out_bus),
    .clk (clk),
    .out_bus (instruction_bus)
  );

  Register #(.word_len(32)) pc_reg (
    .par_in (pc_in_bus),
    .clk (clk),
    .rst (rst),
    .load_en (pc_load_en),
    .par_out (pc_out_bus)
  );

endmodule
