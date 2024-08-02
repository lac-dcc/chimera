// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 12:29:40 PM
// Design Name: 
// Module Name: add8
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

module add8(
input c,
input [7:0] in0,
input [7:0] in1,
output [7:0] out,
output co
    );
    wire t0;
    wire ct0;
    full_adder (.in0(in0[0:0]),.in1(in1[0:0]),.c(c),.out(t0),.co(ct0));
    wire t1;
    wire ct1;
    full_adder (.in0(in0[1:1]),.in1(in1[1:1]),.c(ct0),.out(t1),.co(ct1));
    wire t2;
    wire ct2;
    full_adder (.in0(in0[2:2]),.in1(in1[2:2]),.c(ct1),.out(t2),.co(ct2));
    wire t3;
    wire ct3;
    full_adder (.in0(in0[3:3]),.in1(in1[3:3]),.c(ct2),.out(t3),.co(ct3));
    wire t4;
    wire ct4;
    full_adder (.in0(in0[4:4]),.in1(in1[4:4]),.c(ct3),.out(t4),.co(ct4));
    wire t5;
    wire ct5;
    full_adder (.in0(in0[5:5]),.in1(in1[5:5]),.c(ct4),.out(t5),.co(ct5));
    wire t6;
    wire ct6;
    full_adder (.in0(in0[6:6]),.in1(in1[6:6]),.c(ct5),.out(t6),.co(ct6));
    wire t7;
    wire ct7;
    full_adder (.in0(in0[7:7]),.in1(in1[7:7]),.c(ct6),.out(t7),.co(ct7));
    assign out[0:0]=t0;
    assign out[1:1]=t1;
    assign out[2:2]=t2;
    assign out[3:3]=t3;
    assign out[4:4]=t4;
    assign out[5:5]=t5;
    assign out[6:6]=t6;
    assign out[7:7]=t7;
    assign co=ct7;
endmodule
