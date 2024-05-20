// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module Data_Path (
    input [3:0] ALU_sel,
    input [2:0] Imm_sel, load_sel,
    input [1:0] WB_sel,
    input PC_sel, Reg_W_en, A_sel, B_sel,
    input [31:0] current_instr, data_mem_out,
    input clk, rst,
    output BrEQ, BrLT,
    output [31:0] current_inst_addr_to_Imem, data_to_mem, addr_to_mem
    
);

wire [31:0] A_mux, B_mux, ALU_out;

wire [31:0] reg_file_in, data_a, data_b, data_mem_out_modified;

wire [31:0] Immd_val;

wire [31:0] inst_add, next_inst_addr, PC_mux;

PC PC(
    .next_inst(PC_mux),
    .clk(clk),
    .rst(rst),
    .current_inst(inst_add)
);

assign current_inst_addr_to_Imem = inst_add;

add_4 add_4 (
    .in(inst_add),
    .out(next_inst_addr)
);

mux mux_PC (
    .in0(next_inst_addr),
    .in1(ALU_out),
    .sel(PC_sel),
    .out(PC_mux)
);



Reg_file RegisterFile (
    .address_read_a(current_instr[19:15]),
    .address_read_b(current_instr[24:20]),
    .Address_write(current_instr[11:7]),
    .data_write(reg_file_in),
    .clk(clk),
    .W_en(Reg_W_en),
    .rst(rst),
    .data_out_a(data_a),
    .data_out_b(data_b)
);

branch_comparator Br_Comp (
    .A(data_a),
    .B(data_b),
    .BrEQ(BrEQ),
    .BrLT(BrLT)
);

Imm_gen ImmGen (
    .instruction(current_instr[31:7]),
    .imm_sel(Imm_sel),
    .immediate_value(Immd_val)
);


mux ALU_A (
    .in0(data_a),
    .in1(inst_add),
    .sel(A_sel),
    .out(A_mux)
);

mux ALU_B (
    .in0(data_b),
    .in1(Immd_val),
    .sel(B_sel),
    .out(B_mux)
);

ALU ALU (
    .A(A_mux), 
    .B(B_mux),
    .opcode(ALU_sel),
    .out(ALU_out)
);

assign addr_to_mem = ALU_out;
assign data_to_mem = data_b;

mux4 WB_mux(
    .in0(data_mem_out_modified),
    .in1(ALU_out),
    .in2(next_inst_addr),
    .in3(Immd_val),
    .sel(WB_sel),
    .out(reg_file_in)
);

load_size LS (
    .in_load(data_mem_out),
    .load_sel(load_sel),
    .out_load(data_mem_out_modified)
);
endmodule
