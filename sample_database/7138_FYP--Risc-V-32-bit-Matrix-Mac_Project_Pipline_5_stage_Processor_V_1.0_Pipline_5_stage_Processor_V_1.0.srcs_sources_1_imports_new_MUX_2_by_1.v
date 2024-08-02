// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 05:59:43 PM
// Design Name: 
// Module Name: MUX_2_by_1
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


module MUX_2_by_1(
    input [31:0] a,b,
    input s,
    output [31:0] c
);
    
    assign c = (~s) ? a : b;
    //s = 0 => c = a
    //s = 1 => c = b;



endmodule















