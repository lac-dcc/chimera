// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 05:18:48 PM
// Design Name: 
// Module Name: Mux_3_by_1
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


module Mux_3_by_1(
    input [31:0] a,b,c,
    input [1:0] s,
    output [31:0] y
    );
    
    assign y = ( s == 2'b00 ) ? a : 
               ( s == 2'b01 ) ? b : 
               ( s == 2'b10 ) ? c : 32'h00000000;
    
    
    
endmodule
