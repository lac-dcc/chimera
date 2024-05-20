// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

`include "vdp_constants.vh"

module clocks (
    // assumed to be 27Mhz
    input clk,

    // active low RESET signal
    input rst_n,

    // the buffered 27Mhz clock
    output clk_w,

    // generated 135Mhz pixel clock for use with by the HDMI serializer
    output clk_135_w,
    // lock status of the 135Mhz clock
    output clk_135_lock_w,

    // generated 44.1khz clock for the HDMI audio stream
    output clk_audio_w,

    // generated clocks and lock for the SDRAM
    output clk_sdram_w,
    output clk_sdramp_w,
    output clk_sdram_lock_w
);

  bit clk_135;
  bit clk_audio;
  bit clk_sdram;
  bit clk_sdramp;

  // Main 27Mhz Clock
  BUFG clk_bufg_inst (
      .I(clk),
      .O(clk_w)
  );

  // 135Mhz Clock pixel clock
  CLK_135 clk_135_inst (
      .clkin (clk),
      .reset (~rst_n),
      .clkout(clk_135),
      .lock  (clk_135_lock_w)
  );

  BUFG clk_135_bufg_inst (
      .I(clk_135),
      .O(clk_135_w)
  );

  // 44.1khz HDMI Audio clock
  CLOCK_DIV #(
      .CLK_SRC(27),
      .CLK_DESIRED(0.044100),
      .PRECISION_BITS(16)
  ) audio_clk (
      .clk_src(clk_w),
      .clk_desired(clk_audio)
  );

  BUFG clk_audio_bufg_inst (
      .I(clk_audio),
      .O(clk_audio_w)
  );

  // 108Mhz Clock for RAM
  CLK_108P clk_sdramp_inst (
      .clkin(clk),
      .reset(~rst_n),
      .clkout(clk_sdram),
      .lock(clk_sdram_lock_w),
      .clkoutp(clk_sdramp)
  );

  BUFG clk_sdram_bufg_inst (
      .I(clk_sdram),
      .O(clk_sdram_w)
  );

  BUFG clk_sdramp_bufg_inst (
      .I(clk_sdramp),
      .O(clk_sdramp_w)
  );

endmodule
