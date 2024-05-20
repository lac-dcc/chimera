// This program was cloned from: https://github.com/urish/tt07-vga-perlin
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module vga_perlin (
    input wire clk,
    input wire rst_n,
    input wire pattern_sel,
    output wire hsync,
    output wire vsync,
    output wire [5:0] rrggbb
);

  wire reset = ~rst_n;

  wire                 [9:0] x_px;  // X position for actual pixel.
  wire                 [9:0] y_px;  // Y position for actual pixel.

  wire                       activevideo;
  wire                       px_clk;
  assign px_clk = clk;

  VgaSyncGen vga_0 (
      .px_clk(px_clk),
      .hsync(hsync),
      .vsync(vsync),
      .x_px(x_px),
      .y_px(y_px),
      .activevideo(activevideo),
      .reset(reset)
  );

  reg  [ 9:0] prev_y;
  reg  [19:0] counter;
  wire [ 7:0] noise_value;

  perlin_noise_generator perlin_inst (
      .clk(clk),
      .x({x_px[9:2], 2'b0}),
      .y({y_px[9:2], 2'b0}),
      .t(counter),
      .noise(noise_value)
  );

  
  wire [5:0] pattern1 = {noise_value[7], noise_value[2], noise_value[6], noise_value[3], noise_value[5], noise_value[4]};
  wire [5:0] pattern2 = noise_value[7:2];

  assign rrggbb = activevideo ? (pattern_sel ? pattern2 : pattern1) : 6'b0;

  always @(posedge clk) begin
    if (reset) begin
      counter <= 20'b0;
      prev_y  <= 10'b0;
    end else begin
      prev_y <= y_px;
      if (prev_y != y_px && y_px == 0) begin
        counter <= counter + 1;
      end
    end
  end
endmodule
