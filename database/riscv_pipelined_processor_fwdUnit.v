// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module fwdUnit(
    input clk,
    
    input [4:0] ex_mem_rd, 
    input ex_mem_RW,
    input [4:0] mem_wb_rd,
    input mem_wb_RW,
    input [4:0] id_ex_rs1, id_ex_rs2,
        
    output wire [1:0] forwardA, forwardB
    );
    
    assign forwardA = (ex_mem_RW & (ex_mem_rd != 0) & (ex_mem_rd == id_ex_rs1)) ? 2'b10 : (mem_wb_RW & (mem_wb_rd != 0) & (mem_wb_rd == id_ex_rs1)) ? 2'b01 : 0;
    assign forwardB = (ex_mem_RW & (ex_mem_rd != 0) & (ex_mem_rd == id_ex_rs2)) ? 2'b10 : (mem_wb_RW & (mem_wb_rd != 0) & (mem_wb_rd == id_ex_rs2)) ? 2'b01 : 0;
    
endmodule
