`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2022 11:45:16 PM
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1
(
input i0_i,
input i1_i,
input i2_i,
input i3_i,
input sel0_i,
input sel1_i,
output out_o
);

wire muxout1, muxout2;

mux_2_1 MUX1 
(
.i0_i   (i0_i),
.i1_i   (i1_i),
.sel_i  (sel0_i),
.out_o  (muxout1)
);

mux_2_1 MUX2 
(
.i0_i   (i2_i),
.i1_i   (i3_i),
.sel_i  (sel0_i),
.out_o  (muxout2)
);

mux_2_1 MUX3
(
.i0_i   (muxout1),
.i1_i   (muxout2),
.sel_i  (sel1_i),
.out_o  (out_o)
);

endmodule