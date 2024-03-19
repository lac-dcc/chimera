`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 02:16:25 PM
// Design Name: 
// Module Name: adder
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


module adder
(
input [3:0] a_i,
input [3:0] b_i,
input [3:0] c_i,
input [3:0] d_i,
input [3:0] e_i,
input [3:0] f_i,
input [3:0] g_i,
input [3:0] h_i,
input [3:0] i_i,
input [3:0] j_i,
input [3:0] k_i,
input [3:0] l_i,
input [3:0] m_i,
input [3:0] n_i,
input [3:0] o_i,
input [3:0] p_i,
output [7:0] sum_o
);

reg [4:0] ab,cd,ef,gh,ij,kl,mn,op;
reg [5:0] sum1,sum2,sum3,sum4;
reg [6:0] sum5, sum6;
reg [7:0] sum7;

always @(*) begin
    
   ab = a_i + b_i;
   cd = c_i + d_i;
   ef = e_i + f_i;
   gh = g_i + h_i;
   ij = i_i + j_i;
   kl = k_i + l_i;
   mn = m_i + n_i;
   op = o_i + p_i;

   sum1 = ab + cd;
   sum2 = ef + gh;
   sum3 = ij + kl;
   sum4 = mn + op;

   sum5 = sum1 + sum2;
   sum6 = sum3 + sum4;

   sum7 = sum5 + sum6;

end

assign sum_o = sum7;

endmodule