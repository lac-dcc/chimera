// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module Keypad(
    input clk,
    input rst,
    // keypad control
    input [3:0] keypad_row,
    output reg[3:0] keypad_col,
    // data output
    output reg[15:0] keypad
);

    reg [3:0] key_value;
    reg [5:0] count;     // delay_20ms
    reg [2:0] state;     // 状态标志
    reg key_flag;        // 按键标志位
    reg clk_500khz;      // 500kHz 时钟信号
    reg [3:0] col_reg;   // 寄存扫描列值
    reg [3:0] row_reg;   // 寄存扫描行值


    always @(posedge clk) begin
        if (!rst) begin
            clk_500khz <= 0;
            count <= 0;
        end
        else begin
            if (count >= 50) begin
                clk_500khz <= ~clk_500khz;
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end
    end

    always @(posedge clk_500khz or negedge rst) begin
        if (!rst) begin
            keypad_col <= 4'b0000;
            state <= 0;
        end
        else begin
            case (state)
                0: begin
                    keypad_col <= 4'b0000;
                    key_flag <= 1'b0;
                    if (keypad_row != 4'b1111) begin
                        // 有键按下，扫描第一行
                        state <= 1;
                        keypad_col <= 4'b1110;
                    end
                    else begin
                        state <= 0;
                    end
                end
                1: begin
                    if (keypad_row != 4'b1111) begin
                        // 判断是否是第一行
                        state <= 5;
                    end
                    else begin
                        // 扫描第二行
                        state <= 2;
                        keypad_col <= 4'b1101;
                    end
                end
                2: begin
                    if (keypad_row != 4'b1111) begin
                        // 判断是否是第二行
                        state <= 5;
                    end
                    else begin
                        // 扫描第三行
                        state <= 3;
                        keypad_col <= 4'b1011;
                    end
                end
                3: begin
                    if (keypad_row != 4'b1111) begin
                        // 判断是否是第三行
                        state <= 5;
                    end
                    else begin
                        // 扫描第四行
                        state <= 4;
                        keypad_col <= 4'b0111;
                    end
                end
                4: begin
                    if (keypad_row != 4'b1111) begin
                        // 判断是否是第一行
                        state <= 5;
                    end
                    else begin
                        state <= 0;
                    end
                end
                5: begin
                    if (keypad_row != 4'b1111) begin
                        col_reg <= keypad_col;   // 保存扫描列值
                        row_reg <= keypad_row;   // 保存扫描行值
                        state <= 5;
                        key_flag <= 1'b1;   // 有键按下
                    end
                    else begin
                        state <= 0;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        if (key_flag == 1'b1) begin
            case ({col_reg, row_reg})
                8'b1110_1110: keypad <= 16'h0001;
                8'b1110_1101: keypad <= 16'h0002;
                8'b1110_1011: keypad <= 16'h0004;
                8'b1110_0111: keypad <= 16'h0008;
                8'b1101_1110: keypad <= 16'h0010;
                8'b1101_1101: keypad <= 16'h0020;
                8'b1101_1011: keypad <= 16'h0040;
                8'b1101_0111: keypad <= 16'h0080;
                8'b1011_1110: keypad <= 16'h0100;
                8'b1011_1101: keypad <= 16'h0200;
                8'b1011_1011: keypad <= 16'h0400;
                8'b1011_0111: keypad <= 16'h0800;
                8'b0111_1110: keypad <= 16'h1000;
                8'b0111_1101: keypad <= 16'h2000;
                8'b0111_1011: keypad <= 16'h4000;
                8'b0111_0111: keypad <= 16'h8000;
            endcase
        end
        else begin
            keypad <= 0;
        end
    end

endmodule // Keypad
