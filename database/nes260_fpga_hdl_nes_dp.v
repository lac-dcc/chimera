// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Simple DP driver to send NES video at nes_dp
// Feng Zhou, 2022.7
// 
//////////////////////////////////////////////////////////////////////////////////
// See: https://projectf.io/posts/video-timings-vga-720p-1080p/     for timing numbers
//      https://github.com/projf/projf-explore/blob/main/graphics/fpga-graphics/simple_720p.sv

module nes_dp(
    input clk_pixel,    // pixel clock
    input rst_pixel,     // reset in pixel clock domain
  
    // input from PPU
    input clk_nes,      // 21.47 Mhz??signal input circuits work in this domain
    input ppu_clk,      // 5.369 Mhz, not a clock domain, only sampled
    input [5:0] ppu_video,
    input [8:0] ppu_scanline,
    input [8:0] ppu_cycle,

    output reg de,      // data enable, registered to sync with video
    output reg vsync,   // positive polarity, registered to sync with video
    output reg hsync,   // positive polarity, registered to sync with video
    output [35:0] video // driven from register 'pixel'
    );

    reg [11:0] sx = 0;  // horizontal screen position
    reg [11:0] sy = 0;  // vertical screen position

    wire ppu_clk_edge = r_ppu_clk == 1'b0 && ppu_clk == 1'b1;
    
    reg r_ppu_clk = 1;
    always @(posedge clk_nes) begin
        r_ppu_clk <= ppu_clk;
    end    
    reg ppu_refresh = 1;
    //  stop refreshing PPU after 20 seconds, 1200 frames
//    reg [15:0] counter = 0;
//    always @(posedge clk_nes) begin
//        if (counter == 1200) begin
//            ppu_refresh <= 0;
//        end else if (r_ppu_clk == 0 && ppu_clk == 1 && ppu_scanline == 1 && ppu_cycle == 0) begin
//            counter <= counter + 1;
//        end
//    end

/*
    // double buffering
    reg cur = 0;        // current frame buffer, in ppu_clk domain
    reg r_cur = 0;
    reg r2_cur = 0;     // current frame buffer, in clk_pixel domain

    always @(posedge clk_pixel) begin
        r_cur <= cur;   // r_cur is meta-stable
        r2_cur <= r_cur;    // r2_cur is stable
    end

    always @(posedge clk_nes) begin
        if (ppu_clk_edge && ppu_scanline == 239 && ppu_cycle == 256) begin
            // flip to the other buffer
            cur = ~cur;
        end
    end
    */

    // horizontal timings
    parameter HA_END = 1919;          // end of active pixels
    parameter HS_STA = HA_END + 88;   // sync starts after front porch
    parameter HS_END = HS_STA + 44;   // sync ends
    parameter LINE   = 2199;          // last pixel on line (after back porch)

    // vertical timings
    parameter VA_END = 1079;          // end of active pixels
    parameter VS_STA = VA_END + 4;    // sync starts after front porch
    parameter VS_END = VS_STA + 5;    // sync ends
    parameter SCREEN = 1124;          // last line on screen (after back porch)

    always @(posedge clk_pixel) begin
         p_hsync <= (sx >= HS_STA && sx < HS_END);
         p_vsync <= (sy >= VS_STA && sy < VS_END);
         p_de <= (sx <= HA_END && sy <= VA_END);
         
        if (sx == LINE) begin  // last pixel on line?
            sx <= 0;
            sy <= (sy == SCREEN) ? 0 : sy + 1;  // last line on screen?
        end else begin
            sx <= sx + 1;
        end
        if (rst_pixel) begin
            sx <= 0;
            sy <= 0;
        end
    end
    
    // 4x upscale, 256x240 becomes 1024*960
    // 448 left black bar, 60 top black bar
    // video active area is x: 448-1471, y:60-1019
    // framebuffer x and y
    wire video_active = sx >= 448 && sx <= 1471 && sy >= 60 && sy <= 1019;
    wire [7:0] fx = (sx - 448) >> 2;
    wire [7:0] fy = (sy - 60) >> 2;
    wire [15:0] fb_raddr = {fy, fx};      // framebuffer read address

    // Put PPU data in framebuffer, all in ppu_clk domain
    wire ppu_active = ppu_scanline <= 239 && ppu_cycle != 0 && ppu_cycle <= 256;
    wire [15:0] fb_waddr = {ppu_scanline[7:0], ppu_cycle_minus_one[7:0]};         // framebuffer write address
    wire [8:0] ppu_cycle_minus_one = ppu_cycle - 1;
    
    /* Double buffer
    wire [5:0] pixel0, pixel1;
    wire [5:0] pixel = r2_cur ? pixel0 : pixel1;                        // directly drives video
    // wiring up the frame buffer
    nes_fb fb0(clk_pixel, video_active, fb_raddr, pixel0, 
               clk_nes, ppu_clk_edge & ppu_active & ~cur, fb_waddr, ppu_video);
    nes_fb fb1(clk_pixel, video_active, fb_raddr, pixel1, 
               clk_nes, ppu_clk_edge & ppu_active & cur, fb_waddr, ppu_video);
    */
    // No double buffer
    reg [8:0] r_ppu_cycle;
    wire ppu_signal = r_ppu_cycle != ppu_cycle;     // detect new pixel
    always @(posedge clk_nes) begin
        r_ppu_cycle <= ppu_cycle;    
    end
    
    wire [5:0] p_pixel;
    (* ram_style = "registers" *) reg [5:0] pixel;
    reg p_de, p_hsync, p_vsync;
    nes_fb fb0(clk_pixel, video_active, fb_raddr, p_pixel,
               clk_nes, ppu_signal & ppu_active & ppu_refresh, fb_waddr, ppu_video);
    always @(posedge clk_pixel) begin
        // delay all output by one cycle 
        pixel <= p_pixel;
        de <= p_de;
        hsync <= p_hsync;
        vsync <= p_vsync;
    end

    // End no double buffer

    wire [23:0] pixel_rgb = video_active ? nes_palette(pixel) : 8'h0f;          // 0x0f is black
    assign video = {pixel_rgb[23:16], 4'b0, pixel_rgb[15:8], 4'b0, pixel_rgb[7:0], 4'b0};        // fetch video data, will be ready for next cycle

    // 2C02 palette: https://www.nesdev.org/wiki/PPU_palettes
    function [23:0] nes_palette(input [5:0] p);
      case (p)
      0: nes_palette = 24'h545454;  1: nes_palette = 24'h001e74;  2: nes_palette = 24'h081090;  3: nes_palette = 24'h300088;  4: nes_palette = 24'h440064;  5: nes_palette = 24'h5c0030;  6: nes_palette = 24'h540400;  7: nes_palette = 24'h3c1800;
      8: nes_palette = 24'h202a00;  9: nes_palette = 24'h083a00;  10: nes_palette = 24'h004000;  11: nes_palette = 24'h003c00;  12: nes_palette = 24'h00323c;  13: nes_palette = 24'h000000;  14: nes_palette = 24'h000000;  15: nes_palette = 24'h000000;
      16: nes_palette = 24'h989698;  17: nes_palette = 24'h084cc4;  18: nes_palette = 24'h3032ec;  19: nes_palette = 24'h5c1ee4;  20: nes_palette = 24'h8814b0;  21: nes_palette = 24'ha01464;  22: nes_palette = 24'h982220;  23: nes_palette = 24'h783c00;
      24: nes_palette = 24'h545a00;  25: nes_palette = 24'h287200;  26: nes_palette = 24'h087c00;  27: nes_palette = 24'h007628;  28: nes_palette = 24'h006678;  29: nes_palette = 24'h000000;  30: nes_palette = 24'h000000;  31: nes_palette = 24'h000000;
      32: nes_palette = 24'heceeec;  33: nes_palette = 24'h4c9aec;  34: nes_palette = 24'h787cec;  35: nes_palette = 24'hb062ec;  36: nes_palette = 24'he454ec;  37: nes_palette = 24'hec58b4;  38: nes_palette = 24'hec6a64;  39: nes_palette = 24'hd48820;
      40: nes_palette = 24'ha0aa00;  41: nes_palette = 24'h74c400;  42: nes_palette = 24'h4cd020;  43: nes_palette = 24'h38cc6c;  44: nes_palette = 24'h38b4cc;  45: nes_palette = 24'h3c3c3c;  46: nes_palette = 24'h000000;  47: nes_palette = 24'h000000;
      48: nes_palette = 24'heceeec;  49: nes_palette = 24'ha8ccec;  50: nes_palette = 24'hbcbcec;  51: nes_palette = 24'hd4b2ec;  52: nes_palette = 24'hecaeec;  53: nes_palette = 24'hecaed4;  54: nes_palette = 24'hecb4b0;  55: nes_palette = 24'he4c490;
      56: nes_palette = 24'hccd278;  57: nes_palette = 24'hb4de78;  58: nes_palette = 24'ha8e290;  59: nes_palette = 24'h98e2b4;  60: nes_palette = 24'ha0d6e4;  61: nes_palette = 24'ha0a2a0;  62: nes_palette = 24'h000000;  63: nes_palette = 24'h000000;
      endcase
    endfunction
           
endmodule