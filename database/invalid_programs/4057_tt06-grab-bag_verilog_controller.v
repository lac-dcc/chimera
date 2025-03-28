// This program was cloned from: https://github.com/algofoogle/tt06-grab-bag
// License: Apache License 2.0

`default_nettype none

// module controller(
//     input wire clk,
//     input wire rst_n,
//     input wire [3:0] data_in,
//     input wire load,
//     output reg [7:0] data_out
// );

module controller(
  input wire clk,
  input wire rst_n,
  input wire [7:0] ui_in,
  output wire hsync, vsync,   // Polarity determined by vga_sync module per vga_timing_mode.
  output wire hblank, vblank, // High during blanking.
  output [7:0] r, g, b,       // Primarily goes to DAC.
  output r7,g7,b7, r6,g6,b6   // Extra convenience outputs to wire up to digital outs on the north side of the macro.
);

  localparam MODE_PASS = 0;
  localparam MODE_RAMP = 1;
  localparam MODE_BARS = 2;
  localparam MODE_XORS = 3;

  assign {r7,r6, g7,g6, b7,b6} = {r[7:6], g[7:6], b[7:6]};

  wire [9:0] h, v;
  wire hmax, vmax, visible; // Used to detect end of frame.

  wire reset = ~rst_n;

  // VGA sync generator:
  vga_sync vga_sync(
    .clk      (clk),
    .reset    (reset),
    .mode     (vga_timing_mode),
    .o_hsync  (hsync),
    .o_vsync  (vsync),
    .o_hblank (hblank),
    .o_vblank (vblank),
    .o_hpos   (h),
    .o_vpos   (v),
    .o_hmax   (hmax),
    .o_vmax   (vmax),
    .o_visible(visible)
  );

  // // Make async reset synchronous:
  // reg reset;
  // always @(posedge clk or posedge rst_n) begin
  //   reset <= ~rst_n;
  // end

  // Select mode and other parameters at reset:
  reg [7:0] mode_params;
  wire vga_timing_mode  = mode_params[7];
  wire [2:0] mode       = mode_params[6:4];
  always @(posedge clk) begin
    if (reset) begin
      mode_params <= ui_in;
    end
  end

  // These are for mode 0 (pass-thru):
  wire gate             = mode_params[1];
  wire registered       = mode_params[0];

  // These are for modes 1 (ramps) and 2 (bars):
  wire [1:0] divider    = mode_params[3:2];
  wire [1:0] primary    = mode_params[1:0]; // 0=R, 1=G, 2=B, 3=All

  wire [9:0] ramphdiv = h >> divider;
  wire [7:0] rampa = ramphdiv[7:0];
  wire [7:0] rampb = v[7:0];
  // rampc always increments per frame:
  reg [7:0] rampc; // ...so this is basically a frame counter.
  always @(posedge clk) begin
    if (reset)
      rampc <= 0;
    else if (vmax && hmax)
      rampc <= rampc + 1;
  end

  // Direct outputs to DACs (with blanking):
  assign {r,g,b} = visible ? {tr,tg,tb} : 0;

  // Intermediate video values (before blanking, etc):
  wire [7:0] tr, tg, tb;

  // For now, just worry about unregistered outputs:
  assign {tr,tg,tb} =
    (mode == MODE_PASS) ? {ui_in, ui_in, ui_in} :
    (mode == MODE_RAMP) ?
      (
        primary == 0 ?    {rampa, rampb, rampc} : // Red primary, green secondary, blue fade.
        primary == 1 ?    {rampc, rampa, rampb} : // Green primary, blue secondary, red fade.
        primary == 2 ?    {rampb, rampc, rampa} : // Blue primary, red secondary, green fade.
                          {rampa, rampa, rampa}   // All primary.
      ) :
    (mode == MODE_XORS) ? {h[7:0]^v[7:0], h[7:0]&v[7:0], (h[7:0]-v[7:0])+rampc} :
                          {0, rampa, 0}; // MODE_BARS not supported yet.

endmodule

