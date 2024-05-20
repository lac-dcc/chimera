// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps
module MEM_WB(
    input clk,
   
    input wire MemToReg, RegWrite,
   
    input wire [63:0] Read_Data, ALUResult,
   
    input wire [4:0] RD,  
   
    output reg memtoreg, regwrite,
   
    output reg [63:0] read_data, aluresult,
   
    output reg [4:0] rd    
     
    );
    
initial
begin
    memtoreg <= 0;
    regwrite <= 0;
end
   
    always @ (posedge clk)
    begin
        memtoreg <= MemToReg;
        regwrite <= RegWrite;
        read_data <= Read_Data;
        aluresult <= ALUResult;
        rd <= RD;
    end
endmodule