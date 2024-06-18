// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/18 12:33:48
// Design Name: 
// Module Name: mux32
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


module mux32(
    input [4:0] mux_sel,
    input [1023:0] mux_data_in,
    output reg [31:0] mux_data_out
    );
//////////////////////////////变量定义/////////////////////////////////
////////////内部寄存器变量/////////////////////////////////////////////
//////定义表示一个数据的位宽的参数//////////////////////////////////////
parameter width = 8'd32;

/////////////选择器控制逻辑///////////////////////////////////////////
always@(*) begin
  case(mux_sel)
        5'b00000: mux_data_out = mux_data_in[1*width-1:0*width];
        5'b00001: mux_data_out = mux_data_in[2*width-1:1*width];
        5'b00010: mux_data_out = mux_data_in[3*width-1:2*width];
        5'b00011: mux_data_out = mux_data_in[4*width-1:3*width];
        5'b00100: mux_data_out = mux_data_in[5*width-1:4*width];
        5'b00101: mux_data_out = mux_data_in[6*width-1:5*width];
        5'b00110: mux_data_out = mux_data_in[7*width-1:6*width];
        5'b00111: mux_data_out = mux_data_in[8*width-1:7*width];
        5'b01000: mux_data_out = mux_data_in[9*width-1:8*width];
        5'b01001: mux_data_out = mux_data_in[10*width-1:9*width];
        5'b01010: mux_data_out = mux_data_in[11*width-1:10*width];
        5'b01011: mux_data_out = mux_data_in[12*width-1:11*width];
        5'b01100: mux_data_out = mux_data_in[13*width-1:12*width];
        5'b01101: mux_data_out = mux_data_in[14*width-1:13*width];
        5'b01110: mux_data_out = mux_data_in[15*width-1:14*width];
        5'b01111: mux_data_out = mux_data_in[16*width-1:15*width];
        5'b10000: mux_data_out = mux_data_in[17*width-1:16*width];
        5'b10001: mux_data_out = mux_data_in[18*width-1:17*width];
        5'b10010: mux_data_out = mux_data_in[19*width-1:18*width];
        5'b10011: mux_data_out = mux_data_in[20*width-1:19*width];
        5'b10100: mux_data_out = mux_data_in[21*width-1:20*width];
        5'b10101: mux_data_out = mux_data_in[22*width-1:21*width];
        5'b10110: mux_data_out = mux_data_in[23*width-1:22*width];
        5'b10111: mux_data_out = mux_data_in[24*width-1:23*width];
        5'b11000: mux_data_out = mux_data_in[25*width-1:24*width];
        5'b11001: mux_data_out = mux_data_in[26*width-1:25*width];
        5'b11010: mux_data_out = mux_data_in[27*width-1:26*width];
        5'b11011: mux_data_out = mux_data_in[28*width-1:27*width];
        5'b11100: mux_data_out = mux_data_in[29*width-1:28*width];
        5'b11101: mux_data_out = mux_data_in[30*width-1:29*width];
        5'b11110: mux_data_out = mux_data_in[31*width-1:30*width];
        5'b11111: mux_data_out = mux_data_in[32*width-1:31*width];
    default : mux_data_out = mux_data_in[31:0];
  endcase
end

endmodule
