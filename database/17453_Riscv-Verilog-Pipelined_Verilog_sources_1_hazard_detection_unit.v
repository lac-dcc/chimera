// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 07:45:56 PM
// Design Name: 
// Module Name: hazard_detection_unit
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


module hazard_detection_unit(
    input [4:0] IF_ID_Rs1, IF_ID_Rs2,
    input ID_EX_MemRead,EX_MEM_MemRead,EX_MEM_MemWrite,
    input [4:0] ID_EX_RegisterRd,
    output reg stall
);

    always @(*)begin

         if(ID_EX_MemRead && ID_EX_RegisterRd!=0 && (IF_ID_Rs1 == ID_EX_RegisterRd || IF_ID_Rs2 == ID_EX_RegisterRd )|| EX_MEM_MemWrite || EX_MEM_MemRead )
               stall = 1;
        else
            stall=0;
    end
endmodule
