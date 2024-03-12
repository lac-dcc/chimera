/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

`default_nettype wire

  module Frix(
              input wire         CLOCK_100,
              input wire         RST_IN,

              // PSRAM
              output wire        PSRAM_CLK,
              output wire        PSRAM_ADV_N,
              output wire        PSRAM_CE_N,
              output wire        PSRAM_OE_N,
              output wire        PSRAM_WE_N,
              output wire        PSRAM_LB_N,
              output wire        PSRAM_UB_N,
              inout wire [15:0]  PSRAM_DATA,
              output wire [22:0] PSRAM_ADDR,


              //PS2 KEYBOARD
              inout wire         PS2_CLK,
              inout wire         PS2_DAT,

              //SD
              output wire        SD_CLK,
              inout wire         SD_CMD,
              inout wire [3:0]   SD_DAT,
              input wire         SD_CD,
              output wire        SD_RESET,

              //VGA
              output wire        VGA_HS,
              output wire        VGA_VS,

              output wire [3:0]  VGA_R,
              output wire [3:0]  VGA_G,
              output wire [3:0]  VGA_B,

              //LED
              output reg [15:0]  LED
              );

    //------------------------------------------------------------------------------

    wire                         clk_sys;
    wire                         clk_vga;
    wire                         clk_sound;

    wire                         rst;
    wire                         rst_n;

    assign DRAM_CLK = clk_sys;

    GEN gen(
            .CLK_IN      (CLOCK_100),
            .RST_X_IN    (~RST_IN),
            .CLK_OUT     (clk_sys),
            .VGA_CLK_OUT (clk_vga),
            .RST_X_OUT   (rst_n)
            );

    assign SD_RESET = rst;

    assign rst = ~rst_n;

    //------------------------------------------------------------------------------

    wire                         ao486_reset;

    wire [7:0]                   VGA_R_8, VGA_G_8, VGA_B_8;
    assign VGA_R = VGA_R_8[7:4];
    assign VGA_G = VGA_G_8[7:4];
    assign VGA_B = VGA_B_8[7:4];

    //------------------------------------------------------------------------------

    reg [25:0]                   cnt;

    always @(posedge clk_sys) cnt <= cnt + 1;

    always @(posedge clk_sys) begin
        LED[0] <= cnt[25];
        LED[1] <= ~rst;
        LED[2] <= ~ao486_reset;
        LED[3] <= ~SD_CD;
        LED[4] <= ~SD_RESET;
        LED[9:5] <= {~SD_CMD, ~SD_DAT};
        LED[13:10] <= {~PSRAM_CE_N, ~PSRAM_OE_N, ~PSRAM_WE_N, ~PSRAM_ADV_N};
        LED[15:14] <= {~PS2_CLK, ~PS2_DAT};
    end

    //------------------------------------------------------------------------------

    system u0(
              .clk_sys          (clk_sys),
              .reset_sys        (rst),

              .clk_vga          (clk_vga),
              .reset_vga        (rst),

              .vga_clock        (VGA_CLK),
              .vga_horiz_sync   (VGA_HS),
              .vga_vert_sync    (VGA_VS),
              .vga_r            (VGA_R_8),
              .vga_g            (VGA_G_8),
              .vga_b            (VGA_B_8),

              .PSRAM_CLK        (PSRAM_CLK),
              .PSRAM_ADV_N      (PSRAM_ADV_N),
              .PSRAM_CE_N       (PSRAM_CE_N),
              .PSRAM_OE_N       (PSRAM_OE_N),
              .PSRAM_WE_N       (PSRAM_WE_N),
              .PSRAM_LB_N       (PSRAM_LB_N),
              .PSRAM_UB_N       (PSRAM_UB_N),
              .PSRAM_DATA       (PSRAM_DATA),
              .PSRAM_ADDR       (PSRAM_ADDR),

              .sd_clk           (SD_CLK),
              .sd_dat           (SD_DAT),
              .sd_cmd           (SD_CMD),

              .ps2_kbclk        (PS2_CLK),
              .ps2_kbdat        (PS2_DAT),

              .reset_only_ao486 (ao486_reset)
              );
endmodule
