// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 01:59:53 AM
// Design Name: 
// Module Name: Initial_CAVLC
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




module Pre_Processing_Step #(parameter WIDTH = 8)(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] reg0,
    input wire [WIDTH-1:0] reg1,
    input wire [WIDTH-1:0] reg2,
    input wire [WIDTH-1:0] reg3,
    input wire [WIDTH-1:0] reg4,
    input wire [WIDTH-1:0] reg5,
    input wire [WIDTH-1:0] reg6,
    input wire [WIDTH-1:0] reg7,
    input wire [WIDTH-1:0] reg8,
    input wire [WIDTH-1:0] reg9,
    input wire [WIDTH-1:0] reg10,
    input wire [WIDTH-1:0] reg11,
    input wire [WIDTH-1:0] reg12,
    input wire [WIDTH-1:0] reg13,
    input wire [WIDTH-1:0] reg14,
    input wire [WIDTH-1:0] reg15,

    output [4:0] NZQ_num,
    output [3:0] total_zeros_num,
    output reg [3:0] total_ones
    
);
reg  reg0_out, reg1_out, reg2_out, reg3_out,
                    reg4_out, reg5_out, reg6_out, reg7_out,
                    reg8_out, reg9_out, reg10_out, reg11_out,
                    reg12_out, reg13_out, reg14_out, reg15_out;

reg  reg0_out0, reg1_out1, reg2_out2, reg3_out3,
                    reg4_out4, reg5_out5, reg6_out6, reg7_out7,
                    reg8_out8, reg9_out9, reg10_out10, reg11_out11,
                    reg12_out12, reg13_out13, reg14_out14, reg15_out15;

reg [3:0]sum;
    // Counting logic for reg10
    always @ (posedge clk ) begin
        
        reg0_out = &(reg0 ^ 8'b11111111);
        reg1_out = &(reg1 ^ 8'b11111111);
        reg2_out = &(reg2 ^ 8'b11111111);
        reg3_out = &(reg3 ^ 8'b11111111);
        reg4_out = &(reg4 ^ 8'b11111111);
        reg5_out = &(reg5 ^ 8'b11111111);
        reg6_out = &(reg6 ^ 8'b11111111);
        reg7_out = &(reg7 ^ 8'b11111111);
        reg8_out = &(reg8 ^ 8'b11111111);
        reg9_out = &(reg9 ^ 8'b11111111);
        reg10_out = &(reg10 ^ 8'b11111111);
        reg11_out = &(reg11 ^ 8'b11111111);
        reg12_out = &(reg12 ^ 8'b11111111);
        reg13_out = &(reg13 ^ 8'b11111111);
        reg14_out = &(reg14 ^ 8'b11111111);
        reg15_out = &(reg15 ^ 8'b11111111);

    end

    // Counting logic for reg10
    always @ (posedge clk ) begin
        
        reg0_out0 = (reg0 & 8'b00000001);
        reg1_out1 = (reg1 & 8'b00000001);
        reg2_out2 = (reg2 & 8'b00000001);
        reg3_out3 = (reg3 & 8'b00000001);
        reg4_out4 = (reg4 & 8'b00000001);
        reg5_out5 = (reg5 & 8'b00000001);
        reg6_out6 = (reg6 & 8'b00000001);
        reg7_out7 = (reg7 & 8'b00000001);
        reg8_out8 = (reg8 & 8'b00000001);
        reg9_out9 = (reg9 & 8'b00000001);
        reg10_out10 = (reg10 & 8'b00000001);    
        reg11_out11 = (reg11 & 8'b00000001);
        reg12_out12 = (reg12 & 8'b00000001);
        reg13_out13 = (reg13 & 8'b00000001);   
	reg14_out14 = (reg14 & 8'b00000001);
	reg15_out15 = (reg15 & 8'b00000001);   
    end




always@*
begin
sum = reg0_out+ reg1_out+ reg2_out+ reg3_out+ reg4_out+ reg5_out+ reg6_out+ reg7_out+
                    reg8_out+ reg9_out+ reg10_out +reg11_out+
                    reg12_out+ reg13_out+ reg14_out+ reg15_out;
end


always@*
begin
total_ones = reg0_out0+ reg1_out1+ reg2_out2+ reg3_out3+ reg4_out4+ reg5_out5+ reg6_out6+ reg7_out7+
                    reg8_out8+ reg9_out9+ reg10_out10 +reg11_out11 +
                    reg12_out12+ reg13_out13+ reg14_out14+ reg15_out15;
end


    assign NZQ_num = 5'b10000-sum;
    assign total_zeros_num = sum;
endmodule