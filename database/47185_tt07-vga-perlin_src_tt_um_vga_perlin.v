// This program was cloned from: https://github.com/urish/tt07-vga-perlin
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_vga_perlin (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;
  wire hsync, vsync;

  assign uo_out[0] = R[1];
  assign uo_out[1] = G[1];
  assign uo_out[2] = B[1];
  assign uo_out[3] = vsync;
  assign uo_out[4] = R[0];
  assign uo_out[5] = G[0];
  assign uo_out[6] = B[0];
  assign uo_out[7] = hsync;

  vga_perlin vga_perlin (
      .clk   (clk),
      .rst_n (rst_n),
      .pattern_sel(ui_in[0]),
      .hsync (hsync),
      .vsync (vsync),
      .rrggbb({R, G, B})
  );

endmodule
