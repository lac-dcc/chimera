// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 15:09:39
// Design Name: 
// Module Name: alu
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


module alu(
        input rst, // 复位信号
        input alu_en, // 使能信号
        input [1:0] operation, // 指明计算方式，来自ins_code[1]和ins_code[0]
        input [7:0] reg_out, // 来自reg的数据
        input [7:0] ac_out, // 来自ac的数据
        input [7:0] immediate, // 来自rom的立即数

        output reg [7:0] alu_out // 输出计算的结果
    );

    // 复位
    always @(negedge rst) begin
        alu_out <= 8'bZZZZ_ZZZZ;
    end

    parameter 
        ADDI = 2'b00,
        ADD = 2'b01,
        LS = 2'b10,
        RS = 2'b11;
 
    // 计算过程
    always @(posedge alu_en) begin
        case (operation)
            ADDI: begin
                // 如果立即数为0，则对ac_out按位取反
                if (immediate == 8'b0000_0000) begin
                    alu_out <= ~ac_out;
                end else begin
                    alu_out <= ac_out + immediate; 
                end
            end
            ADD: begin
                alu_out <= ac_out + reg_out;
            end 
            LS: begin
                alu_out <= ac_out << reg_out;
            end
            RS: begin
                alu_out <= ac_out >> reg_out;
            end
            default: begin
                alu_out <= 8'bZZZZ_ZZZZ;
            end
        endcase        
    end
endmodule
