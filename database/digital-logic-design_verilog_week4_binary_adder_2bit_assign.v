`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 12:31:15 AM
// Design Name: 
// Module Name: binary_adder_2bit_assign
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


module binary_adder_2bit_assign
(
input [1:0] a_i,
input [1:0] b_i,
input cin_i,
output [1:0] s_o,
output cout_o
);

assign {cout_o,s_o} = a_i + b_i + cin_i;

endmodule