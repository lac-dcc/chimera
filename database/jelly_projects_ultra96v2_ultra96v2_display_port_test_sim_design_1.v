// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module design_1
   (dp_video_ref_clk_0,
    dp_external_custom_event1_0,
    dp_external_custom_event2_0,
    dp_external_vsync_event_0,
    dp_live_gfx_alpha_in_0,
    dp_live_gfx_pixel1_in_0,
    dp_live_video_de_out_0,
    dp_live_video_in_de_0,
    dp_live_video_in_hsync_0,
    dp_live_video_in_pixel1_0,
    dp_live_video_in_vsync_0,
    dp_video_in_clk_0,
    dp_video_out_hsync_0,
    dp_video_out_pixel1_0,
    dp_video_out_vsync_0,
    pl_clk0_0);
  output dp_video_ref_clk_0;
  input dp_external_custom_event1_0;
  input dp_external_custom_event2_0;
  input dp_external_vsync_event_0;
  input [7:0]dp_live_gfx_alpha_in_0;
  input [35:0]dp_live_gfx_pixel1_in_0;
  output dp_live_video_de_out_0;
  input dp_live_video_in_de_0;
  input dp_live_video_in_hsync_0;
  input [35:0]dp_live_video_in_pixel1_0;
  input dp_live_video_in_vsync_0;
  input dp_video_in_clk_0;
  output dp_video_out_hsync_0;
  output [35:0]dp_video_out_pixel1_0;
  output dp_video_out_vsync_0;
  output pl_clk0_0;

  wire dp_external_custom_event1_0;
  wire dp_external_custom_event2_0;
  wire dp_external_vsync_event_0;
  wire [7:0]dp_live_gfx_alpha_in_0;
  wire [35:0]dp_live_gfx_pixel1_in_0;
  wire dp_live_video_de_out_0;
  wire dp_live_video_in_de_0;
  wire dp_live_video_in_hsync_0;
  wire [35:0]dp_live_video_in_pixel1_0;
  wire dp_live_video_in_vsync_0;
  wire dp_video_in_clk_0;
  wire dp_video_out_hsync_0;
  wire [35:0]dp_video_out_pixel1_0;
  wire dp_video_out_vsync_0;
  wire pl_clk0_0;
  
  
  
    localparam RATE150 = 1000.0/150.00;
    
    reg         reset = 1;
    initial #100 reset = 0;
    
    reg         clk150 = 1'b1;
    always #(RATE150/2.0) clk150 <= ~clk150;
    
    assign pl_clk0_0 = clk150;
    
    
endmodule

