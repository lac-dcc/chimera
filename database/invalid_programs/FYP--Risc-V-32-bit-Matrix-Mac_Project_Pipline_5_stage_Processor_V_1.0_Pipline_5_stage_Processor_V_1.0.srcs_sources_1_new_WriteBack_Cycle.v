// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 05:01:55 PM
// Design Name: 
// Module Name: WriteBack_Cycle
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


`include "MUX_2_by_1.v"

module WriteBack_Cycle(
    input clk, rst, ResultSrcW,
    input [31:0] PCPlus4W, ALU_ResultW, ReadDataW,
    
    output [31:0] ResultW
    );

    MUX_2_by_1 ResultMux(
        .a(ALU_ResultW),
        .b(ReadDataW),
        .s(ResultSrcW),
        .c(ResultW)
    );
         
endmodule






















