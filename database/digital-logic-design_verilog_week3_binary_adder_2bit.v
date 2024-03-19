`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2022 10:21:36 PM
// Design Name: 
// Module Name: binary_adder_2bit
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


module binary_adder_2bit
(
input [1:0] a_i,
input [1:0] b_i,
input cin_i,
output [1:0] s_o,
output cout_o
);

wire cout_fa1;

full_adder_hier FA1 
(
.a_i    (a_i[0]),
.b_i    (b_i[0]),
.cin_i  (cin_i),
.s_o    (s_o[0]),
.cout_o (cout_fa)
);

full_adder_hier FA2 
(
.a_i    (a_i[1]),
.b_i    (b_i[1]),
.cin_i  (cout_fa),
.s_o    (s_o[1]),
.cout_o (cout_o)
);

endmodule