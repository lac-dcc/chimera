// This program was cloned from: https://github.com/Men1scus/Principles_of_Computer_Organization
// License: MIT License

`timescale 1ns / 1ps
//*************************************************************************
//   > 文件名: adder.v
//   > 描述  ：加法器，直接使用"+"，会自动调用库里的加法器
//   > 作者  : LOONGSON
//   > 日期  : 2016-04-14
//*************************************************************************
module adder(
    // input  [31:0] operand1,
    // input  [31:0] operand2,
    input  [31:0] operand1_H,
    input  [31:0] operand1_L,
    input  [31:0] operand2_H,
    input  [31:0] operand2_L,

    input         cin,

    // output [31:0] result,
    output [31:0] result_H,
    output [31:0] result_L,

    output cout
    );

    wire [31:0] cout_L;
    
    // assign {cout,result} = operand1 + operand2 + cin;
    assign {cout_L, result_L} = operand1_L + operand2_L + cin;
    assign {cout, result_H} = operand1_H + operand2_H + cout_L;
    // assign {cout, result_H, result_L} = {operand1_H, operand1_L} + {operand2_H, operand2_L} + cin;

endmodule
