// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2023 09:24:19 AM
// Design Name: 
// Module Name: alu_mux
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


module alu_mux_480(
    input [31:0] immout,    //立即数的输出时alu的一个输入可能
    input [31:0] RD2,
    input ALUSrc,
    output [31:0] B
    );
    assign B = (ALUSrc) ? immout : RD2;
endmodule
