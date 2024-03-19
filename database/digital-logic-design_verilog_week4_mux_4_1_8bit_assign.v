`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2022 12:00:22 AM
// Design Name: 
// Module Name: mux_4_1_8bit_assign
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


module mux_4_1_8bit_assign
(
input [7:0] i0_i,
input [7:0] i1_i,
input [7:0] i2_i,
input [7:0] i3_i,
input [1:0] sel_i,
output [7:0] out_o
);

assign out_o =  (sel_i[0] == 1'b0) ? 
                (sel_i[1] == 1'b0) ? i0_i : i2_i :
                (sel_i[1] == 1'b0) ? i1_i : i3_i;

//assign out_o =  (sel_i == 2'b00) ? i0_i : 
//                (sel_i == 2'b01) ? i1_i :
//                (sel_i == 2'b10) ? i2_i :
//                                   i3_i;                

endmodule