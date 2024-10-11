// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 03:43:08 PM
// Design Name: 
// Module Name: PC_Adder
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


module PC_Adder(
    input [31:0] curr_address, offset, ALU_Out,
    input branch,
   
    output [31:0] next_address
    );
    wire [31:0] two_comp_offset = (~offset) + 2;
    
    //               branch flag high & condition satisfies & offset is positive then add current address + offset else subtract current address - offset 
    assign next_address = ( branch & ALU_Out == 32'd1) ? ( (offset[31] != 1'b1) ? ( curr_address + offset ) : ( curr_address - two_comp_offset ) ) : curr_address + 32'd4 ;
    
endmodule














