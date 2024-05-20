// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/23 14:39:36
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    input i0,
    input i1,
    input i2,
    input i3,
    input i4,
    input i5,
    input i6,
    input i7,
    input s0,
    input s1,
    input s2,
    output reg o
    );
    always @ (i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or s0 or s1 or s2)
    begin
    case ({s2, s1, s0}) // 使用花括号组合选择信号
        3'b000: o = i0; // 当选择信号为 3'b000 时，选择输入 i0
        3'b001: o = i1; // 当选择信号为 3'b001 时，选择输入 i1
        3'b010: o = i2; // 当选择信号为 3'b010 时，选择输入 i2
        3'b011: o = i3; // 当选择信号为 3'b011 时，选择输入 i3
        3'b100: o = i4; // 当选择信号为 3'b100 时，选择输入 i4
        3'b101: o = i5; // 当选择信号为 3'b101 时，选择输入 i5
        3'b110: o = i6; // 当选择信号为 3'b110 时，选择输入 i6
        3'b111: o = i7; // 当选择信号为 3'b111 时，选择输入 i7
        default: o = 1'b0; // 如果选择信号不在上述范围内，默认输出0
    endcase
    end
endmodule
