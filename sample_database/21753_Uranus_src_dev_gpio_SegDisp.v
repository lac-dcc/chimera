// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module SegDisplay(
    input clk,
    input rst,
    input [31:0] num,
    output reg[7:0] seg_sel,
    output reg[7:0] seg_bit
);

    reg[15:0] counter;
    reg[3:0] cur_num;

    always @(posedge clk) begin
        if (!rst) begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            seg_sel <= 8'hf;
        end
        else begin
            case (counter[15:13])
                3'd0: seg_sel <= 8'b01111111;
                3'd1: seg_sel <= 8'b10111111;
                3'd2: seg_sel <= 8'b11011111;
                3'd3: seg_sel <= 8'b11101111;
                3'd4: seg_sel <= 8'b11110111;
                3'd5: seg_sel <= 8'b11111011;
                3'd6: seg_sel <= 8'b11111101;
                3'd7: seg_sel <= 8'b11111110;
                default:;
            endcase
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            cur_num <= 0;
        end
        else begin
            case (counter[15:13])
                3'd0: cur_num <= num[31:28];
                3'd1: cur_num <= num[27:24];
                3'd2: cur_num <= num[23:20];
                3'd3: cur_num <= num[19:16];
                3'd4: cur_num <= num[15:12];
                3'd5: cur_num <= num[11:8];
                3'd6: cur_num <= num[7:4];
                3'd7: cur_num <= num[3:0];
                default:;
            endcase
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            seg_bit <= 0;
        end
        else begin
            case (cur_num)
                4'h0: seg_bit <= 8'b11111100;
                4'h1: seg_bit <= 8'b01100000;
                4'h2: seg_bit <= 8'b11011010;
                4'h3: seg_bit <= 8'b11110010;
                4'h4: seg_bit <= 8'b01100110;
                4'h5: seg_bit <= 8'b10110110;
                4'h6: seg_bit <= 8'b10111110;
                4'h7: seg_bit <= 8'b11100000;
                4'h8: seg_bit <= 8'b11111110;
                4'h9: seg_bit <= 8'b11110110;
                4'ha: seg_bit <= 8'b11101110;
                4'hb: seg_bit <= 8'b00111110;
                4'hc: seg_bit <= 8'b10011100;
                4'hd: seg_bit <= 8'b01111010;
                4'he: seg_bit <= 8'b10011110;
                4'hf: seg_bit <= 8'b10001110;
            endcase
        end
    end

endmodule // SegDisplay
