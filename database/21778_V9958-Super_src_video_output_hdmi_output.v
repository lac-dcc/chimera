// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License


module hdmi_output #(

    // Defaults to 640x480 which should be supported by almost if not all HDMI sinks.
    // See README.md or CEA-861-D for enumeration of video id codes.
    // Pixel repetition, interlaced scans and other special output modes are not implemented (yet).
    parameter int VIDEO_ID_CODE = 1,

    // Defaults to 16-bit audio, the minmimum supported by HDMI sinks. Can be anywhere from 16-bit to 24-bit.
    parameter int AUDIO_BIT_WIDTH = 16,

    // As specified in Section 7.3, the minimal audio requirements are met: 16-bit or more L-PCM audio at 32 kHz, 44.1 kHz, or 48 kHz.
    // See Table 7-4 or README.md for an enumeration of sampling frequencies supported by HDMI.
    // Note that sinks may not support rates above 48 kHz.
    parameter int AUDIO_RATE = 44100,

    // Starting screen coordinate when module comes out of reset.
    //
    // Setting these to something other than (0, 0) is useful when positioning
    // an external video signal within a larger overall frame (e.g.
    // letterboxing an input video signal). This allows you to synchronize the
    // negative edge of reset directly to the start of the external signal
    // instead of to some number of clock cycles before.
    //
    // You probably don't need to change these parameters if you are
    // generating a signal from scratch instead of processing an
    // external signal.
    parameter int NUM_CHANNELS = 3
) (
    input include_audio,
    input clk_pixel_x5,
    input clk_pixel,
    input clk_audio,

    // synchronous reset back to 0,0
    input logic reset,
    input logic [23:0] rgb,
    input logic [AUDIO_BIT_WIDTH-1:0] audio_sample_word[1:0],

    output logic [9:0] tmds_channels[NUM_CHANNELS-1:0],

    // All outputs below this line stay inside the FPGA
    // They are used (by you) to pick the color each pixel should have
    // i.e. always_ff @(posedge pixel_clk) rgb <= {8'd0, 8'(cx), 8'(cy)};
    output logic [10:0] cx,
    output logic [ 9:0] cy
);

  hdmi #(
      .VIDEO_ID_CODE(VIDEO_ID_CODE),
      .IT_CONTENT(1),
      .VENDOR_NAME({"Unknown", 8'd0}),  // Must be 8 bytes null-padded 7-bit ASCII
      .PRODUCT_DESCRIPTION({"FPGA", 96'd0}),  // Must be 16 bytes null-padded 7-bit ASCII
      .SOURCE_DEVICE_INFORMATION(8'h09)  // PC Device Code
  ) hdmi (
      .include_audio(include_audio),
      .clk_pixel_x5(clk_pixel_x5),
      .clk_pixel(clk_pixel),
      .clk_audio(clk_audio),
      .rgb(rgb),
      .reset(reset),
      .audio_sample_word(audio_sample_word),
      .cx(cx),
      .cy(cy),
      .tmds_channels(tmds_channels),
      .frame_width(),
      .frame_height(),
      .screen_width(),
      .screen_height()
  );

endmodule
