// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module registerFile  (    
    input [63:0] WriteData, input [4:0] RS1, input [4:0] RS2,   
    input [4:0] RD,   
    input RegWrite,   
    input clk,   
    input reset,   
    output reg [63:0] ReadData1,   
    output reg [63:0] ReadData2  
);   

reg [63:0] Registers [31:0];
integer i;
initial
begin
//    Registers[0] <= 0;
    for (i = 0; i < 32; i = i + 1)
        Registers[i] <= i;
end

always @(negedge clk)
begin
    if (RegWrite)
        Registers[RD] = WriteData;
end

always @(*)
begin
    if (reset)
     begin
        ReadData1 = 0;
        ReadData2 = 0;
     end
     else
        begin
            ReadData1 = Registers[RS1];
            ReadData2 = Registers[RS2];
        end
end


endmodule
