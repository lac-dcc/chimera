// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

`include "vdp_constants.vh"

module v9958_top (
    output bit led1_n,
    output bit led2_n,
    output bit led3_n,
    output bit led4_n,
    output bit led5_n,
    output bit led_ws2812,

    //high => send a HDMI single without any audio encoded
    //low => send HDMI single with audio encoded
    input exclude_audio,

    input [7:2] A,

    input rd_iorq_n,
    input wr_iorq_n,

    input clk,

    input reset_n,
    input [1:0] mode,
    output cs_n,

    output int_n,
    inout [7:0] cd,

    output adc_clk,
    output adc_cs,
    output adc_mosi,
    input  adc_miso,

    output       tmds_clk_p,
    output       tmds_clk_n,
    output [2:0] tmds_data_p,
    output [2:0] tmds_data_n,

    // SDRAM
    output              O_sdram_clk,
    output              O_sdram_cke,
    output              O_sdram_cs_n,   // chip select
    output              O_sdram_cas_n,  // columns address select
    output              O_sdram_ras_n,  // row address select
    output              O_sdram_wen_n,  // write enable
    inout  logic [31:0] IO_sdram_dq,    // 32 bit bidirectional data bus
    output       [10:0] O_sdram_addr,   // 11 bit multiplexed address bus
    output       [ 1:0] O_sdram_ba,     // two banks
    output       [ 3:0] O_sdram_dqm     // 32/4
);

  import custom_timings::*;

  // leds
  assign led1_n = cs_n;
  assign led2_n = cs_n;
  assign led3_n = cs_n;
  assign led4_n = cs_n;
  assign led5_n = cs_n;

  // ----------------------------------------
  // All Clocks
  // ----------------------------------------
  bit clk_w;
  bit clk_135_w;
  bit clk_135_lock_w;
  bit clk_audio_w;
  bit clk_sdram_w;
  bit clk_sdramp_w;
  bit clk_sdram_lock_w;

  clocks clocks (
      .rst_n(reset_n),
      .clk(clk),
      .clk_w(clk_w),
      .clk_135_w(clk_135_w),
      .clk_135_lock_w(clk_135_lock_w),
      .clk_audio_w(clk_audio_w),
      .clk_sdram_w(clk_sdram_w),
      .clk_sdramp_w(clk_sdramp_w),
      .clk_sdram_lock_w(clk_sdram_lock_w)
  );

  // ----------------------------------------
  // Master Reset combined with clock phase locks
  // ----------------------------------------

  bit reset_w;
  bit reset_n_w;
  assign reset_n_w = clk_135_lock_w & clk_sdram_lock_w & reset_n;
  assign reset_w   = ~reset_n_w;

  // ----------------------------------------
  // V5598 Video Generation
  // ----------------------------------------

  bit          vdp_io_req;
  bit          vdp_io_wr;
  bit   [ 7:0] vdp_data_in;
  bit   [ 7:0] vdp_data_out;
  bit          VideoDLClk;
  bit          VideoDHClk;
  bit          WeVdp_n;
  bit   [ 1:0] VdpDb_Wr_size;
  bit   [18:0] VdpAdr;
  bit   [ 7:0] VrmDbo_8;
  bit   [31:0] VrmDbo_32;
  bit   [15:0] VrmDbo_16;
  bit   [31:0] VrmDbi_32;
  bit   [31:0] VrmDbi_32_B;
  bit   [15:0] VrmDbi_16;

  logic [10:0] cx;
  logic [ 9:0] cy;

  bit ram_busy, ram_fail;
  bit ram_enabled;

  bit v9958_read;
  bit v9958_write;
  bit memory_refresh;
  bit [16:0] super_res_vram_addr;
  bit vdp_super;

  logic [15:0] audio_sample_word[1:0];

  // Memory Interface
  assign v9958_read = (WeVdp_n & VideoDLClk & VideoDHClk);
  assign v9958_write = ~WeVdp_n & VideoDLClk & VideoDHClk;
  assign memory_refresh = ~VideoDLClk & ~VideoDHClk;

  MEM_CONTROLLER #(
      .FREQ(108_000_000)
  ) vram (
      .clk(clk_sdramp_w),
      .clk_sdram(clk_sdram_w),
      .resetn(reset_n_w),
      .read(v9958_read),
      .write(v9958_write),
      .refresh(memory_refresh),
      .fail(ram_fail),
      .enabled(ram_enabled),
      .addr({4'b0, VdpAdr}),
      .din8(VrmDbo_8),
      .din32(VrmDbo_32),
      .din16(VrmDbo_16),
      .dout32(VrmDbi_32),
      .dout32B(VrmDbi_32_B),
      .dout16(VrmDbi_16),
      .word_wr_size(VdpDb_Wr_size),
      .IO_sdram_dq(IO_sdram_dq),
      .O_sdram_addr(O_sdram_addr),
      .O_sdram_ba(O_sdram_ba),
      .O_sdram_cs_n(O_sdram_cs_n),
      .O_sdram_wen_n(O_sdram_wen_n),
      .O_sdram_ras_n(O_sdram_ras_n),
      .O_sdram_cas_n(O_sdram_cas_n),
      .O_sdram_clk(O_sdram_clk),
      .O_sdram_cke(O_sdram_cke),
      .O_sdram_dqm(O_sdram_dqm)
  );

  bit ws2812_io_req;
  bit ws2812_io_wr;
  bit [7:0] ws2812_data_in;
  bit [7:0] ws2812_data_out;

  CPU_IO cpu_io (
      .clk(clk_w),
      .reset_n(reset_n_w),
      .A(A),
      .rd_iorq_n(rd_iorq_n),
      .wr_iorq_n(wr_iorq_n),
      .cd(cd),
      .clk_sdram(clk_sdram_w),

      .vdp_io_req(vdp_io_req),
      .vdp_io_wr(vdp_io_wr),
      .vdp_data_in(vdp_data_in),
      .vdp_data_out(vdp_data_out),

      .ws2812_io_req(ws2812_io_req),
      .ws2812_io_wr(ws2812_io_wr),
      .ws2812_data_in(ws2812_data_in),
      .ws2812_data_out(ws2812_data_out),

      .cs_n(cs_n)
  );

  WS2812 ws2812 (
      .clk(clk_w),
      .reset_n(reset_n),
      .WS2812(led_ws2812),

      .mode(mode),
      .ws2812_io_req(ws2812_io_req),
      .ws2812_io_wr(ws2812_io_wr),
      .ws2812_data_in(ws2812_data_in),
      .ws2812_data_out(ws2812_data_out)
  );

  bit       pal_mode;
  bit       scanlin;
  bit [7:0] dvi_r;
  bit [7:0] dvi_g;
  bit [7:0] dvi_b;

  VDP u_v9958 (
      .CLK21M      (clk_w),
      .RESET       (reset_w),
      .REQ         (vdp_io_req),
      .ACK         (),
      .scanlin     (scanlin),
      .WRT         (vdp_io_wr),
      .mode        (mode),
      .DBI         (vdp_data_out),
      .DBO         (vdp_data_in),
      .INT_N       (int_n),
      .PRAMWE_N    (WeVdp_n),
      .PRAM_WR_SIZE(VdpDb_Wr_size),
      .PRAMADR     (VdpAdr),
      .PRAMDBI_32  (VrmDbi_32),
      .PRAMDBI_32_B(VrmDbi_32_B),
      .PRAMDBI_16  (VrmDbi_16),
      .PRAMDBO_8   (VrmDbo_8),
      .PRAMDBO_16  (VrmDbo_16),
      .PRAMDBO_32  (VrmDbo_32),
      .VDPSPEEDMODE(1'b1),           // for V9958 MSX2+/tR VDP
      .PVIDEODHCLK (VideoDHClk),
      .PVIDEODLCLK (VideoDLClk),
      .PAL_MODE    (pal_mode),
      .SPMAXSPR    (1'b0),
      .CX          (cx),
      .CY          (cy),
      .vdp_super   (vdp_super),
      .red         (dvi_r),
      .green       (dvi_g),
      .blue        (dvi_b)
  );

  //--------------------------------------------------------------
  // HDMI output
  //--------------------------------------------------------------

  logic [2:0] tmds;

  assign scanlin = 1'b0;

  hdmi_selection #() hdmi (
      .include_audio(~exclude_audio),
      .clk_pixel_x5(clk_135_w),
      .clk_pixel(clk_w),
      .clk_audio(clk_audio_w),
      .rgb({dvi_r, dvi_g, dvi_b}),
      .reset(reset_w),
      .audio_sample_word(audio_sample_word),
      .pal_mode(pal_mode),
      .cx(cx),
      .cy(cy),
      .tmds(tmds)
  );

  // now take the tmds encoded feed and send it to the Gowin LVDS output buffer
  ELVDS_OBUF tmds_bufds[3:0] (
      .I ({clk_w, tmds}),
      .O ({tmds_clk_p, tmds_data_p}),
      .OB({tmds_clk_n, tmds_data_n})
  );

  //--------------------------------------------------------------

  AUDIO #() audio (
      .clk(clk_w),
      .clk_135(clk_135_w),
      .reset_n(reset_n_w),
      .audio_sample_word(audio_sample_word),
      .adc_miso(adc_miso),
      .adc_clk(adc_clk),
      .adc_cs(adc_cs),
      .adc_mosi(adc_mosi)
  );

endmodule

