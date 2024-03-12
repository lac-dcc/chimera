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

`define SYSTEM_DE2_115

  module Frix(
              input wire         CLOCK_50,

              // KEY
              input wire [3:0]   KEY,

              // SDRAM
              output wire [12:0] DRAM_ADDR,
              output wire [1:0]  DRAM_BA,
              output wire        DRAM_CAS_N,
              output wire        DRAM_CKE,
              output wire        DRAM_CLK,
              output wire        DRAM_CS_N,
              inout wire [31:0]  DRAM_DQ,
              output wire [3:0]  DRAM_DQM,
              output wire        DRAM_RAS_N,
              output wire        DRAM_WE_N,


              // PS2 KEYBOARD
              inout wire         PS2_CLK,
              inout wire         PS2_DAT,

              // SD
              output wire        SD_CLK,
              inout wire         SD_CMD,
              inout wire [3:0]   SD_DAT,
              input wire         SD_WP_N,

              // VGA
              output wire        VGA_CLK,
              output wire        VGA_SYNC_N,
              output wire        VGA_BLANK_N,
              output wire        VGA_HS,
              output wire        VGA_VS,

              output wire [7:0]  VGA_R,
              output wire [7:0]  VGA_G,
              output wire [7:0]  VGA_B,

              // LED
              output reg [17:0]  LEDR,
              output reg [ 8:0]  LEDG
              );


    //------------------------------------------------------------------------------

    wire                         clk_sys;
    wire                         clk_vga;
    wire                         clk_sound;

    wire                         rst;
    wire                         rst_n;

    wire                         RST_X_IN;

    assign RST_X_IN = KEY[3];
    assign DRAM_CLK = clk_sys;

    GEN gen(
            .CLK_IN      (CLOCK_50),
            .RST_X_IN    (RST_X_IN),
            .CLK_OUT     (clk_sys),
            .VGA_CLK_OUT (clk_vga),
            .RST_X_OUT   (rst_n)
            );

    assign rst = ~rst_n;

    //------------------------------------------------------------------------------

    wire                         ao486_reset;

    //------------------------------------------------------------------------------

    wire                         cache_waitrequest;

    reg [25:0]                   cnt;

    always @(posedge clk_sys) cnt <= cnt + 1;

    always @(posedge clk_sys) begin
        LEDG[0] <= cnt[25];
        LEDG[1] <= ~rst;
        LEDG[2] <= ~ao486_reset;
        LEDG[3] <= ~SD_WP_N;
        LEDG[5:4] <= {~PS2_CLK, ~PS2_DAT};
        LEDG[8:6] <= {~SD_DAT[1:0], ~SD_CMD};
        LEDR[17:0] <= {DRAM_ADDR[11:0], DRAM_BA, DRAM_CAS_N, DRAM_CKE, DRAM_CS_N};
    end

    //------------------------------------------------------------------------------

    system u0(
              .clk_sys          (clk_sys),
              .reset_sys        (rst),

              .clk_vga          (clk_vga),
              .reset_vga        (rst),

              .vga_clock        (VGA_CLK),
              .vga_sync_n       (VGA_SYNC_N),
              .vga_blank_n      (VGA_BLANK_N),
              .vga_horiz_sync   (VGA_HS),
              .vga_vert_sync    (VGA_VS),
              .vga_r            (VGA_R),
              .vga_g            (VGA_G),
              .vga_b            (VGA_B),

              .sdram_addr       (DRAM_ADDR),
              .sdram_ba         (DRAM_BA),
              .sdram_cas_n      (DRAM_CAS_N),
              .sdram_cke        (DRAM_CKE),
              .sdram_cs_n       (DRAM_CS_N),
              .sdram_dq         (DRAM_DQ),
              .sdram_dqm        (DRAM_DQM),
              .sdram_ras_n      (DRAM_RAS_N),
              .sdram_we_n       (DRAM_WE_N),

              .sd_clk           (SD_CLK),
              .sd_dat           (SD_DAT),
              .sd_cmd           (SD_CMD),

              .ps2_kbclk        (PS2_CLK),
              .ps2_kbdat        (PS2_DAT),

              .reset_only_ao486 (ao486_reset)
              );

endmodule
