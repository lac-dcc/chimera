// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License


`include "vdp_constants.vh"

module hdmi_selection #(

    // Defaults to 16-bit audio, the minmimum supported by HDMI sinks. Can be anywhere from 16-bit to 24-bit.
    parameter int AUDIO_BIT_WIDTH = 16,

    parameter int NUM_CHANNELS = 3

) (
    input include_audio,
    input bit clk_pixel_x5,
    input bit clk_pixel,
    input bit clk_audio,
    input logic reset,
    input logic [23:0] rgb,
    input logic [AUDIO_BIT_WIDTH-1:0] audio_sample_word[1:0],
    input logic pal_mode,

    output logic [ 2:0] tmds,
    output logic [10:0] cx,
    output logic [ 9:0] cy
);

  logic [10:0] cx_ntsc;
  logic [ 9:0] cy_ntsc;
  logic [10:0] cx_pal;
  logic [ 9:0] cy_pal;
  logic [10:0] nx_ntsc;
  logic [ 9:0] ny_ntsc;
  logic [10:0] nx_pal;
  logic [ 9:0] ny_pal;
  logic [ 9:0] tmds_channels_ntsc[NUM_CHANNELS-1:0];
  logic [ 9:0] tmds_channels_pal [NUM_CHANNELS-1:0];

  hdmi_output #(
      .VIDEO_ID_CODE(2)
  ) video_ntsc_output (
      .include_audio(include_audio),
      .clk_pixel_x5(clk_pixel_x5),
      .clk_pixel(clk_pixel),
      .clk_audio(clk_audio),
      .rgb(rgb),
      .reset(reset),
      .audio_sample_word(audio_sample_word),
      .cx(cx_ntsc),
      .cy(cy_ntsc),
      .tmds_channels(tmds_channels_ntsc)
  );

  hdmi_output #(
      .VIDEO_ID_CODE(17)
  ) video_pal_output (
      .include_audio(include_audio),
      .clk_pixel_x5(clk_pixel_x5),
      .clk_pixel(clk_pixel),
      .clk_audio(clk_audio),
      .rgb(rgb),
      .reset(reset),
      .audio_sample_word(audio_sample_word),
      .cx(cx_pal),
      .cy(cy_pal),
      .tmds_channels(tmds_channels_pal)
  );

  assign cx = pal_mode ? cx_pal : cx_ntsc;
  assign cy = pal_mode ? cy_pal : cy_ntsc;

  // Select the tmds_channels based on video mode (pal/ntsc)
  // encode it with the serializer
  SERIALIZER_DIPLEXER SERIALIZER_DIPLEXER_inst (
      .clk_pixel(clk_pixel),
      .clk_pixel_x5(clk_pixel_x5),
      .reset(reset),
      .pal_mode(pal_mode),
      .tmds_channels_ntsc(tmds_channels_ntsc),
      .tmds_channels_pal(tmds_channels_pal),
      .tmds(tmds)
  );

endmodule
