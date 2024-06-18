// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:10:54 PM
// Design Name: 
// Module Name: nBit_Shift_Left
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


module nBit_Shift_Left #(parameter n=8)(input[n-1:0] num, output[n-1:0] res );

    assign res = {num[n-2:0],1'b0};
    
endmodule
