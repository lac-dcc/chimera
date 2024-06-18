// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 11:46:44 PM
// Design Name: 
// Module Name: mux_4_1_assign
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


module mux_4_1_assign
(
input i0_i,
input i1_i,
input i2_i,
input i3_i,
input sel0_i,
input sel1_i,
output out_o
);

assign out_o =  (sel0_i == 1'b0) ? 
                (sel1_i == 1'b0) ? i0_i : i2_i :
                (sel1_i == 1'b0) ? i1_i : i3_i;


endmodule