// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ns

// VGA @ 640x480, 60Hz

module VGADrive(
    input clk,   // 25Mhz clock
    input rst,
    output hsync,
    output vsync,
    output valid,
    output [9:0] h_cnt,
    output [9:0] v_cnt
);

    parameter kHFrontPorch = 96;
    parameter kHActive = 144;
    parameter kHBackPorch = 784;
    parameter kHTotal = 800;

    parameter kVFrontPorch = 2;
    parameter kVActive = 35;
    parameter kVBackPorch = 515;
    parameter kVTotal = 525;

    reg[9:0] x_cnt;
    reg[9:0] y_cnt;
    wire h_valid;
    wire v_valid;

    assign hsync = x_cnt > kHFrontPorch;
    assign vsync = y_cnt > kVFrontPorch;
    assign h_valid = (x_cnt > kHActive) && (x_cnt <= kHBackPorch);
    assign v_valid = (y_cnt > kVActive) && (y_cnt <= kVBackPorch);
    assign valid = h_valid && v_valid;
    assign h_cnt = h_valid ? x_cnt - kHActive - 1 : 10'hfff;
    assign v_cnt = v_valid ? y_cnt - kVActive - 1 : 10'hfff;

    always @(posedge clk) begin   // count h-scan
        if (!rst) begin
            x_cnt <= 1;
        end
        else if (x_cnt == kHTotal) begin
            x_cnt <= 1;
        end
        else begin
            x_cnt <= x_cnt + 1;
        end
    end

    always @(posedge clk) begin   // count v-scan
        if (!rst) begin
            y_cnt <= 1;
        end
        else if (y_cnt == kVTotal && x_cnt == kHTotal) begin
            y_cnt <= 1;
        end
        else if (x_cnt == kHTotal) begin
            y_cnt <= y_cnt + 1;
        end
    end

endmodule // VGADrive
