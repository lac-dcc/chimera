`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 12:03:13 AM
// Design Name: 
// Module Name: half_adder_assign
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


module half_adder_assign
(
input a_i,
input b_i,
output s_o,
output cout_o
);

// xor G1 (s_o,a_i,b_i);
// and G2 (cout_o,a_i,b_i);

assign s_o      = a_i ^ b_i; 
assign cout_o   = a_i & b_i; 

endmodule