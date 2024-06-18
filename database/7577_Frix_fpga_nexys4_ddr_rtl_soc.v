// This program was cloned from: https://github.com/archlabo/Frix
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

`default_nettype wire

`define SYSTEM_NEXYS4_DDR

  module Frix(
              input wire         CLOCK_100,
              input wire         RST_IN,

              // DDR2
              inout wire [15:0]  DDR2DQ,
              inout wire [1:0]   DDR2DQS_N,
              inout wire [1:0]   DDR2DQS_P,
              output wire [12:0] DDR2ADDR,
              output wire [2:0]  DDR2BA,
              output wire        DDR2RAS_N,
              output wire        DDR2CAS_N,
              output wire        DDR2WE_N,
              output wire [0:0]  DDR2CK_P,
              output wire [0:0]  DDR2CK_N,
              output wire [0:0]  DDR2CKE,
              output wire [0:0]  DDR2CS_N,
              output wire [1:0]  DDR2DM,
              output wire [0:0]  DDR2ODT,

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

    wire                         clk_sys, clk_unused;
    wire                         clk_vga;
    wire                         clk_200m;

    wire                         locked;

    wire                         rst;
    wire                         rst_n;
    wire                         dram_rst_out;


    clk_wiz_0 clkgen(.clk_in1(CLOCK_100), .clk_out1(clk_unused), .clk_out2(clk_vga),
                     .clk_out3(clk_200m), .locked(locked));
    RSTGEN rstgen(.CLK(clk_sys), .RST_X_I(~(RST_IN || dram_rst_out)), .RST_X_O(rst_n));

    assign SD_RESET = rst;

    assign rst = ~rst_n;

    //------------------------------------------------------------------------------

    wire                         ao486_reset;
    wire                         sdram_read, sdram_write, dram_read, dram_write;

    wire [7:0]                   VGA_R_8, VGA_G_8, VGA_B_8;
    assign VGA_R = VGA_R_8[7:4];
    assign VGA_G = VGA_G_8[7:4];
    assign VGA_B = VGA_B_8[7:4];

    //------------------------------------------------------------------------------

    reg [25:0]                   cnt;

    always @(posedge clk_sys) cnt <= cnt + 1;

    always @(posedge clk_sys) begin
        LED[0]     <= cnt[25];
        LED[1]     <= ~rst;
        LED[2]     <= ~ao486_reset;
        LED[3]     <= ~SD_CD;
        LED[4]     <= ~SD_RESET;
        LED[9:5]   <= {~SD_CMD, ~SD_DAT};
        LED[13:10] <= {sdram_read, sdram_write, dram_read, dram_write};
        LED[15:14] <= {~PS2_CLK, ~PS2_DAT};
    end

    //------------------------------------------------------------------------------

    system u0(
              .clk_sys          (clk_sys),
              .reset_sys        (rst),

              .clk_vga          (clk_vga),
              .reset_vga        (rst),

              .clk_200m         (clk_200m),
              .dram_rst_in      (~locked),
              .dram_rst_out     (dram_rst_out),

              .vga_clock        (VGA_CLK),
              .vga_horiz_sync   (VGA_HS),
              .vga_vert_sync    (VGA_VS),
              .vga_r            (VGA_R_8),
              .vga_g            (VGA_G_8),
              .vga_b            (VGA_B_8),

              .DDR2DQ           (DDR2DQ),
              .DDR2DQS_N        (DDR2DQS_N),
              .DDR2DQS_P        (DDR2DQS_P),
              .DDR2ADDR         (DDR2ADDR),
              .DDR2BA           (DDR2BA),
              .DDR2RAS_N        (DDR2RAS_N),
              .DDR2CAS_N        (DDR2CAS_N),
              .DDR2WE_N         (DDR2WE_N),
              .DDR2CK_P         (DDR2CK_P),
              .DDR2CK_N         (DDR2CK_N),
              .DDR2CKE          (DDR2CKE),
              .DDR2CS_N         (DDR2CS_N),
              .DDR2DM           (DDR2DM),
              .DDR2ODT          (DDR2ODT),

              .sd_clk           (SD_CLK),
              .sd_dat           (SD_DAT),
              .sd_cmd           (SD_CMD),

              .ps2_kbclk        (PS2_CLK),
              .ps2_kbdat        (PS2_DAT),

              .reset_only_ao486 (ao486_reset),
              .sdram_read       (sdram_read),
              .sdram_write      (sdram_write),
              .dram_read        (dram_read),
              .dram_write       (dram_write)
              );
endmodule
