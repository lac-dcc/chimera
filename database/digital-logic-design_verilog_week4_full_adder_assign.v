// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 12:19:05 AM
// Design Name: 
// Module Name: full_adder_assign
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


module full_adder_assign
(
input a_i,
input b_i,
input cin_i,
output s_o,
output cout_o
);

// xor G1 (s_o,a_i,b_i,cin_i);
// and G2 (and1,a_i,b_i);
// and G3 (and2,a_i,cin_i);
// and G4 (and3,b_i,cin_i);
// or G5 (cout_o,and1,and2,and3);

assign {cout_o,s_o} = a_i + b_i + cin_i;

endmodule