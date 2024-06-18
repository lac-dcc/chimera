// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

`include "Memory_Unit.v"
`include "Alu_RISC.v"
`include "D_flop.v"
`include "Register_Unit.v"
`include "Address_Register.v"
`include "Instruction_Register.v"
`include "Program_Counter.v"
`include "Multiplexer_3ch.v"
`include "Multiplexer_5ch.v"

module Processing_Unit #(
    parameter word_size = 8,
    op_size = 4,
    Sel1_size = 3,
    Sel2_size = 2
) (
    output[word_size-1: 0] instruction,
    output Zflag,
    output[word_size-1: 0] address, 
    output[word_size-1: 0] Bus_1,
    input [word_size-1: 0] mem_word,
    input Load_R0,
    input Load_R1, 
    input Load_R2, 
    input Load_R3, 
    input Load_PC, 
    input Inc_PC,
    input [Sel1_size-1: 0] Sel_Bus_1_Mux,
    input Load_IR, Load_Add_R, Load_Reg_Y, Load_Reg_Z,
    input [Sel2_size-1: 0] Sel_Bus_2_Mux,
    input clk, rst
);
    wire [word_size-1: 0] Bus_2;
    wire [word_size-1: 0] R0_out, R1_out, R2_out, R3_out;
    wire [word_size-1: 0] PC_count, Y_value, alu_out;
    wire alu_zero_flag;
    wire [op_size-1 : 0] opcode = instruction [word_size-1: word_size-op_size];

    Register_Unit R0(R0_out, Bus_2, Load_R0, clk, rst);
    Register_Unit R1(R1_out, Bus_2, Load_R1, clk, rst);
    Register_Unit R2(R2_out, Bus_2, Load_R2, clk, rst);
    Register_Unit R3(R3_out, Bus_2, Load_R3, clk, rst);
    Register_Unit Reg_Y(Y_value, Bus_2, Load_Reg_Y, clk, rst);
    D_flop Reg_Z(Zflag, alu_zero_flag, Load_Reg_Z, clk, rst);
    Address_Register Add_R(address, Bus_2, Load_Add_R, clk, rst);
    Instruction_Register IR(instruction, Bus_2, Load_IR, clk, rst);
    Program_Counter PC(PC_count, Bus_2, Load_PC, Inc_PC, clk, rst);
    Multiplexer_5ch Mux_1(Bus_1, R0_out, R1_out, R2_out, R3_out, PC_count, Sel_Bus_1_Mux);
    Multiplexer_3ch Mux_2(Bus_2, alu_out, Bus_1, mem_word, Sel_Bus_2_Mux);
    Alu_RISC ALU(alu_zero_flag, alu_out, Y_value, Bus_1, opcode);

endmodule