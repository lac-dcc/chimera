// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

`include "Processing_Unit.v"
`include "Control_Unit.v"

module RISC_SPM #(
    parameter word_size = 8,
    Sel1_size = 3,
    Sel2_size = 2
) (
    input clk, rst
);
    wire [Sel1_size-1: 0] Sel_Bus_1_Mux;
    wire [Sel2_size-1: 0] Sel_Bus_2_Mux;


    // Data Nets
    wire zero;
    wire [word_size-1: 0] instruction, address, Bus_1, mem_word;

    // Control Nets
    wire Load_R0, Load_R1, Load_R2, Load_R3, Load_PC, Inc_PC, Load_IR;   
    wire Load_Add_R, Load_Reg_Y, Load_Reg_Z;
    wire write;

    Processing_Unit M0_Processor (instruction, zero, address, Bus_1, mem_word, Load_R0, Load_R1,
        Load_R2, Load_R3, Load_PC, Inc_PC, Sel_Bus_1_Mux, Load_IR, Load_Add_R, Load_Reg_Y,
        Load_Reg_Z,  Sel_Bus_2_Mux, clk, rst);

    Control_Unit M1_Controller (Load_R0, Load_R1, Load_R2, Load_R3, Load_PC, Inc_PC, 
        Sel_Bus_1_Mux, Sel_Bus_2_Mux , Load_IR, Load_Add_R, Load_Reg_Y, Load_Reg_Z, 
        write, instruction, zero, clk, rst);

    Memory_Unit M2_SRAM (
        .data_out(mem_word), 
        .data_in(Bus_1), 
        .address(address), 
        .clk(clk),
        .write(write) );
    
endmodule





