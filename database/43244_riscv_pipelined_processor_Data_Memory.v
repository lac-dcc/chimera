// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module Data_Memory(
input [63:0] Mem_Addr,
input[63:0] Write_Data,
input clk,
input MemWrite,
input MemRead,
output reg [63:0] Read_Data
);
reg [7:0] DM [511:0];

integer i;

initial
begin
    Read_Data <= 0;
    for (i = 0; i < 512; i = i + 1)
        DM[i] = 0;
    DM[256] = 8'd5;
    DM[264] = 8'd9;
    DM[272] = 8'd1;
    DM[280] = 8'd2;
    
end

always @(posedge clk)
begin
    if (MemWrite)
        {DM[Mem_Addr+7], DM[Mem_Addr+6], DM[Mem_Addr+5], DM[Mem_Addr+4], DM[Mem_Addr+3], DM[Mem_Addr+2], DM[Mem_Addr+1], DM[Mem_Addr]} <= Write_Data;
end

always @(*)
begin
    if (MemRead)
        Read_Data <= {DM[Mem_Addr+7], DM[Mem_Addr+6], DM[Mem_Addr+5], DM[Mem_Addr+4], DM[Mem_Addr+3], DM[Mem_Addr+2], DM[Mem_Addr+1], DM[Mem_Addr]};
end

endmodule