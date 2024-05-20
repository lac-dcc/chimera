// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 06:34:05 PM
// Design Name: 
// Module Name: Adder
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


module Adder(
        input [31:0] A, B,
        output [31:0] Sum,
        output Carry_Out
    );
     wire [31:0] two_comp_offset = (~B) + 2;
       
       //               branch flag high & condition satisfies & offset is positive then add current address + offset else subtract current address - offset 
//       assign next_address = ( branch & ALU_Out == 32'd1) ? ( (offset[31] != 1'b1) ? ( curr_address + offset ) : ( curr_address - two_comp_offset ) ) : curr_address + 32'd4 ;
       
    assign {Carry_Out, Sum } = ( B[31] == 1 )  ? (A - two_comp_offset) : (A + B);
    
    
    
endmodule











