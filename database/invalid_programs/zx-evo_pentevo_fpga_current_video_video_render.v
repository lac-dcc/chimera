// This module renders video data for output

`include "tune.v"

module video_render
(
  // clocks
  input wire clk, c1,

  // video controls
  input wire hvpix,
  input wire hvtspix,
  input wire nogfx,
  input wire notsu,
  input wire gfxovr,
  input wire flash,
  input wire hires,
  input wire [3:0] psel,
  input wire [3:0] palsel,

  // mode controls
  input wire [1:0] render_mode,

  // video data
  input  wire [31:0] data,
  input  wire [ 7:0] border_in,
  input  wire [ 7:0] tsdata_in,
  output wire [ 7:0] vplex_out
);

  localparam R_ZX = 2'h0;
  localparam R_HC = 2'h1;
  localparam R_XC = 2'h2;
  localparam R_TX = 2'h3;

  reg [3:0] temp;

  // ZX graphics
  wire [15:0] zx_gfx = data[15: 0];
  wire [15:0] zx_atr = data[31:16];
  wire zx_dot = zx_gfx[{psel[3], ~psel[2:0]}];
  wire [7:0] zx_attr  = ~psel[3] ? zx_atr[7:0] : zx_atr[15:8];
  wire [7:0] zx_pix = {palsel, zx_attr[6], zx_dot ^ (flash & zx_attr[7]) ? zx_attr[2:0] : zx_attr[5:3]};

  // text graphics
  // (uses common renderer with ZX, but different attributes)
  wire [7:0] tx_pix = {palsel, zx_dot ? zx_attr[3:0] : zx_attr[7:4]};

  // 16c graphics
  wire [3:0] hc_dot[0:3];
  assign hc_dot[0] = data[ 7: 4];
  assign hc_dot[1] = data[ 3: 0];
  assign hc_dot[2] = data[15:12];
  assign hc_dot[3] = data[11: 8];
  wire [7:0] hc_pix = {palsel, hc_dot[psel[1:0]]};

  // 256c graphics
  wire [7:0] xc_dot[0:1];
  assign xc_dot[0] = data[ 7: 0];
  assign xc_dot[1] = data[15: 8];
  wire [7:0] xc_pix = xc_dot[psel[0]];

  // mode selects
  wire [7:0] pix[0:3];
  assign pix[R_ZX] = zx_pix;  // ZX
  assign pix[R_HC] = hc_pix;  // 16c
  assign pix[R_XC] = xc_pix;  // 256c
  assign pix[R_TX] = tx_pix;  // text

  wire pixv[0:3];
  assign pixv[R_ZX] = zx_dot ^ (flash & zx_attr[7]);
  assign pixv[R_HC] = |hc_dot[psel[1:0]];
  assign pixv[R_XC] = |xc_dot[psel[0]];
  assign pixv[R_TX] = zx_dot;

  // video plex muxer
  wire tsu_visible = (|tsdata_in[3:0] && !notsu);
  wire gfx_visible = (pixv[render_mode] && !nogfx);
  wire [7:0] video1 = tsu_visible ? tsdata_in : (nogfx ? border_in : pix[render_mode]);
  wire [7:0] video2 = gfx_visible ? pix[render_mode] : (tsu_visible ? tsdata_in : border_in);
  wire [7:0] video = hvpix ? (gfxovr ? video2 : video1) : ((hvtspix && tsu_visible) ? tsdata_in : border_in);
  assign vplex_out = hires ? {temp, video[3:0]} : video;    // in hi-res plex contains two pixels 4 bits each

  always @(posedge clk) if (c1)
    temp <= video[3:0];

endmodule
