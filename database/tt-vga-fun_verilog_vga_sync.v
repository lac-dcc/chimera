// This program was cloned from: https://github.com/algofoogle/tt-vga-fun
// License: Apache License 2.0

`default_nettype none
//`timescale 1ns / 1ps

module vga_sync #(

  //SMELL: Instead of having lots of ternary operators (muxes based on mode),
  // it might be better to just use registers to store the parameters and load
  // those registers at the end of each frame. It seems there are only 8
  // actual registers we'd need to worry about (as their reset values are
  // derived from all the other constants). The ones that matter are:
  // - H_MAX, V_MAX
  // - H_VIEW, V_VIEW
  // - H_SYNC_START, V_SYNC_START
  // - H_SYNC_END, V_SYNC_END
  
  //SMELL: If we use these parameters in future, should they just be localparams instead?

  // Mode 0: 640x480@60Hz timing (http://tinyvga.com/vga-timing/640x480@60Hz).
  // Overall timing for true VGA 25.175MHz clock: 25,175,000 / 800 / 525 = 59.94Hz
  // or for 25.0MHz clock: 59.52Hz
  // 800 clocks wide:
  parameter M0_H_VIEW       = 640,  // Visible area comes first...
  parameter M0_H_FRONT      =  16,  // ...then HBLANK starts with M0_H_FRONT (RHS border)...
  parameter M0_H_SYNC       =  96,  // ...then sync pulse starts...
  parameter M0_H_BACK       =  48,  // ...then remainder of HBLANK (LHS border).
  parameter M0_H_MAX        = M0_H_VIEW + M0_H_FRONT + M0_H_SYNC + M0_H_BACK - 1,
  parameter M0_H_SYNC_START = M0_H_VIEW + M0_H_FRONT,
  parameter M0_H_SYNC_END   = M0_H_SYNC_START + M0_H_SYNC,
  // 525 lines tall:
  parameter M0_V_VIEW       = 480,
  parameter M0_V_FRONT      =  10,
  parameter M0_V_SYNC       =   2,
  parameter M0_V_BACK       =  33,
  parameter M0_V_MAX        = M0_V_VIEW + M0_V_FRONT + M0_V_SYNC + M0_V_BACK - 1,
  parameter M0_V_SYNC_START = M0_V_VIEW + M0_V_FRONT,
  parameter M0_V_SYNC_END   = M0_V_SYNC_START + M0_V_SYNC,

  // Mode 1: 1440x900@60 timing (http://tinyvga.com/vga-timing/1440x900@60Hz),
  // but with the clock divided by 4 (so 360x900) from 106.47MHz to 26.6175MHz.
  // 476 clocks wide (normally 1904 at full 1440x900 pixel clock):
  parameter M1_H_VIEW       = 360,  // 1440/4 // Visible area comes first...
  parameter M1_H_FRONT      =  20,  //   80/4 // ...then HBLANK starts with M1_H_FRONT (RHS border)...
  parameter M1_H_SYNC       =  38,  //  152/4 // ...then sync pulse starts...
  parameter M1_H_BACK       =  58,  //  232/4 // ...then remainder of HBLANK (LHS border).
  parameter M1_H_MAX        = M1_H_VIEW + M1_H_FRONT + M1_H_SYNC + M1_H_BACK - 1,
  parameter M1_H_SYNC_START = M1_H_VIEW + M1_H_FRONT,
  parameter M1_H_SYNC_END   = M1_H_SYNC_START + M1_H_SYNC,
  // 932 lines tall:
  parameter M1_V_VIEW       = 900,
  parameter M1_V_FRONT      =   1,
  parameter M1_V_SYNC       =   3,
  parameter M1_V_BACK       =  28,
  parameter M1_V_MAX        = M1_V_VIEW + M1_V_FRONT + M1_V_SYNC + M1_V_BACK - 1,
  parameter M1_V_SYNC_START = M1_V_VIEW + M1_V_FRONT,
  parameter M1_V_SYNC_END   = M1_V_SYNC_START + M1_V_SYNC

  //NOTE: If we were to use the 26.6175MHz clock for 640x480, this would be 63.375Hz.
  // Alternatively, 26.6175MHz for div-2 of this: http://tinyvga.com/vga-timing/800x600@85Hz
  // ...would mean 80.502Hz.
  // Or how about: http://tinyvga.com/vga-timing/640x400@70Hz
  // ...74.102Hz
  // On the flipside, 25.175MHz could give us 1440x900-div4 at 56.747Hz. Would my monitor sync to that?
  // It's also close mul-4 to 102.1MHz (1280x960@60), and 124.54MHz (1280x960@72).
) (
  // Inputs:
  input wire          clk,
  input wire          reset,
  input wire          mode,   // Selects between 640x480@60 timing (mode 0) and 1440x900@60 timing (mode 1).
  // Outputs:
  output wire         o_hsync,  // Polarity matches whatever the selected 'mode' needs.
  output wire         o_vsync,  // Polarity matches whatever the selected 'mode' needs.
  output wire [9:0]   o_hpos,
  output wire [9:0]   o_vpos,
  output wire         o_hmax,
  output wire         o_vmax,
  output wire         o_vblank, // High during vertical blanking.
  output wire         o_hblank, // High during horizontal blanking.
  output wire         o_visible
);

  // HSYNC and VSYNC:
  // These are the internal POSITIVE polarity sync signals.
  reg hsync, vsync;
  // Mode 0 and 1 both use negative polarity HSYNC:
  assign o_hsync = ~hsync;
  // Mode 0 VSYNC is neg polarity. For Mode 1 it is pos:
  assign o_vsync = (mode==0) ? ~vsync : vsync;
  
  // Pixel counters:
  reg [9:0] hpos, vpos;
  assign o_hpos = hpos;
  assign o_vpos = vpos;

  //TODO: Reduce equality checks to just test the bits that matter,
  // because we don't care about values ABOVE these.
  // Might also be able to do similar with comparisons.
  //TODO: Consider making 'visible' a reg insted of combo.

  assign o_hmax   = (mode==0) ? (hpos == M0_H_MAX)  : (hpos == M1_H_MAX);
  assign o_vmax   = (mode==0) ? (vpos == M0_V_MAX)  : (vpos == M1_V_MAX);
  assign o_hblank = (mode==0) ? (hpos >= M0_H_VIEW) : (hpos >= M1_H_VIEW);
  assign o_vblank = (mode==0) ? (vpos >= M0_V_VIEW) : (vpos >= M1_V_VIEW);
  assign o_visible = (~o_hblank) & (~o_vblank);

  // Horizontal tracing:
  always @(posedge clk) begin
          if (reset)                      hpos <= 0;
    else  if (o_hmax)                     hpos <= 0;
    else                                  hpos <= hpos + 1'b1;
  end

  // Vertical tracing:
  always @(posedge clk) begin
          if (reset)                      vpos <= 0;
    else  if (o_hmax)                     vpos <= (o_vmax) ? 10'b0 : vpos + 1'b1;
  end

  // HSYNC:
  always @(posedge clk) begin
    if (mode==0) begin
            if (hpos==M0_H_SYNC_END || reset)  hsync <= 0;
      else  if (hpos==M0_H_SYNC_START)         hsync <= 1;
    end else begin
            if (hpos==M1_H_SYNC_END || reset)  hsync <= 0;
      else  if (hpos==M1_H_SYNC_START)         hsync <= 1;
    end
  end

  // VSYNC:
  always @(posedge clk) begin
    if (mode==0) begin
            if (vpos==M0_V_SYNC_END || reset)  vsync <= 0;
      else  if (vpos==M0_V_SYNC_START)         vsync <= 1;
    end else begin
            if (vpos==M1_V_SYNC_END || reset)  vsync <= 0;
      else  if (vpos==M1_V_SYNC_START)         vsync <= 1;
    end
  end
endmodule
