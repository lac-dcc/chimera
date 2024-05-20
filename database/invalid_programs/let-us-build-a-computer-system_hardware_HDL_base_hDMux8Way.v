// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _h_dmux8way_
`define _h_dmux8way_

`include "hDMux4Way.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:43:15 08/04/2023 
// Design Name: 
// Module Name:    hDMux8Way 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hDMux8Way(
    input in,
    input [2:0] sel,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output h
    );

    wire [3:0] dmux4way_out;

    hDMux4Way dmux4way(.in(in), .sel(sel[1:0]), .a(dmux4way_out[0]), .b(dmux4way_out[1]), .c(dmux4way_out[2]), .d(dmux4way_out[3]));

    assign {d, c, b, a} = (sel[2] == 1'b0) ? dmux4way_out : 4'b0;
    assign {h, g, f, e} = (sel[2] == 1'b1) ? dmux4way_out : 4'b0;

endmodule

`endif