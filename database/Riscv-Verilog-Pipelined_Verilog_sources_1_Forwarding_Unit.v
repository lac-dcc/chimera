// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 02:20:03 PM
// Design Name: 
// Module Name: Forwarding_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Forwarding_Unit(
    input [4:0] ID_EX_Rs1, ID_EX_Rs2,
    input EX_MEM_RegWrite, MEM_WB_RegWrite,
    input [4:0] EX_MEM_RegisterRd, MEM_WB_RegisterRd,
    output  [1:0] forwardA, forwardB
);

     reg [1:0] fA,fB;
    always @(*)begin

        // Handling EX hazard
        if (EX_MEM_RegWrite && EX_MEM_RegisterRd != 0 && EX_MEM_RegisterRd == ID_EX_Rs1)
            fA = 2'b10;
        else if ((MEM_WB_RegWrite && MEM_WB_RegisterRd != 0) && (MEM_WB_RegisterRd == ID_EX_Rs1 && !((EX_MEM_RegWrite && EX_MEM_RegisterRd != 0) && (EX_MEM_RegisterRd == ID_EX_Rs1))))
            fA = 2'b01;
        else
            fA=0;


        if (EX_MEM_RegWrite && EX_MEM_RegisterRd != 0 && EX_MEM_RegisterRd == ID_EX_Rs2)
            fB = 2'b10;

        else if ((MEM_WB_RegWrite && MEM_WB_RegisterRd != 0) && (MEM_WB_RegisterRd == ID_EX_Rs2 && !((EX_MEM_RegWrite && EX_MEM_RegisterRd != 0) && (EX_MEM_RegisterRd == ID_EX_Rs2))))
            fB = 2'b01;
        else
            fB=0;

    end
    
    assign forwardA =fA;
    assign forwardB =fB;
endmodule

