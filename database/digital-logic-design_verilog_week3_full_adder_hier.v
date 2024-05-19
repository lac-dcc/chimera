// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 11:53:09 PM
// Design Name: 
// Module Name: full_adder_hier
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


module full_adder_hier
(
input a_i,
input b_i,
input cin_i,
output s_o,
output cout_o
);

wire ha1_s, ha1_cout, ha2_cout;

half_adder HA1 
(
.a_i    (a_i),
.b_i    (b_i),
.s_o    (ha1_s),
.cout_o (ha1_cout)
);

half_adder HA2 
(
.a_i    (ha1_s),
.b_i    (cin_i),
.s_o    (s_o),
.cout_o (ha2_cout)
);

or G1 (cout_o,ha2_cout,ha1_cout);

endmodule