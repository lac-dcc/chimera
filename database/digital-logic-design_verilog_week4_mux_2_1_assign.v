`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 11:38:34 PM
// Design Name: 
// Module Name: mux_2_1_assign
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


module mux_2_1_assign
(
input i0_i,
input i1_i,
input sel_i,
output out_o
);

// not G1 (not1,sel_i);
// and G2 (and1,i0_i,not1);
// and G3 (and2,i1_i,sel_i);
// or G4 (out_o,and1,and2);

assign out_o = (sel_i == 1'b0) ? i0_i : i1_i;

endmodule