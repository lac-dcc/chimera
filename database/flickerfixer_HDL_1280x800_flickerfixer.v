/*
 * Written Christmas 2019 by Niklas Ekström
 */
module flickerfixer(
   input             MAX10_CLK1_50,

   output            DRAM_CLK,
   output            DRAM_CKE,
   output            DRAM_CS_N,
   output            DRAM_RAS_N,
   output            DRAM_CAS_N,
   output            DRAM_WE_N,
   output   [1:0]    DRAM_BA,
   output   [12:0]   DRAM_ADDR,
   output            DRAM_LDQM,
   output            DRAM_UDQM,
   inout    [15:0]   DRAM_DQ,

   input             AM_7M,
   input             AM_CDAC,
   input             AM_PIXELSW,
   input             AM_CSYNC_n,
   input    [11:0]   AM_RGB,

   output            VGA_HS,
   output            VGA_VS,
   output   [11:0]   VGA_RGB,

   input    [1:0]    KEY,
   input    [9:0]    SW,
   output   [9:0]    LEDR,

   output   [7:0]    HEX0,
   output   [7:0]    HEX1,
   output   [7:0]    HEX2,
   output   [7:0]    HEX3,
   output   [7:0]    HEX4,
   output   [7:0]    HEX5
   );

   wire amiga_pix_clk;
   wire vga_pix_clk;
   wire sdram_clk;

   wire pll_locked;
   wire vga_pll_locked;

   pll pll_inst(
      .inclk0(AM_7M),
      .c0(amiga_pix_clk),
      .c1(sdram_clk),
      .locked(pll_locked)
      );

   vga_pll vga_pll_inst(
      .inclk0(MAX10_CLK1_50),
      .c0(vga_pix_clk),
      .locked(vga_pll_locked)
      );

   wire reset_n = KEY[0] && pll_locked && vga_pll_locked;

   wire [10:0] sc_wr_address;
   wire [15:0] sc_wr_data;
   wire sc_wr_en;

   wire [10:0] sc_rd_address;
   wire [15:0] sc_rd_data;

   scanline_cache sampler_cache(
      .wrclock(amiga_pix_clk),
      .wraddress(sc_wr_address),
      .wren(sc_wr_en),
      .data(sc_wr_data),
      .rdclock(sdram_clk),
      .rdaddress(sc_rd_address),
      .q(sc_rd_data)
      );

   wire [10:0] gc_wr_address;
   wire [15:0] gc_wr_data;
   wire gc_wr_en;

   wire [10:0] gc_rd_address;
   wire [15:0] gc_rd_data;

   scanline_cache generator_cache(
      .wrclock(sdram_clk),
      .wraddress(gc_wr_address),
      .wren(gc_wr_en),
      .data(gc_wr_data),
      .rdclock(vga_pix_clk),
      .rdaddress(gc_rd_address),
      .q(gc_rd_data)
      );

   wire interlaced;
   wire field_no;

   wire        s_req;
   wire        s_ack;
   wire        s_cache_row;
   wire  [9:0] s_sdram_row;

   amiga_frame_sampler sampler(
      .reset_n(reset_n),
      .clk(amiga_pix_clk),
      .csync_n(AM_CSYNC_n),
      .am_rgb(AM_RGB),
      .wr_address(sc_wr_address),
      .wr_data(sc_wr_data),
      .wr_en(sc_wr_en),
      .s_req(s_req),
      .s_ack(s_ack),
      .s_cache_row(s_cache_row),
      .s_sdram_row(s_sdram_row),
      .interlaced(interlaced),
      .field_no(field_no)
      );

   wire        g_req;
   wire        g_ack;
   wire        g_cache_row;
   wire  [9:0] g_sdram_row;

   vga_frame_generator generator(
      .reset_n(reset_n),
      .clk(vga_pix_clk),
      .vga_hs(VGA_HS),
      .vga_vs(VGA_VS),
      .vga_rgb(VGA_RGB),
      .rd_address(gc_rd_address),
      .rd_data(gc_rd_data),
      .g_req(g_req),
      .g_ack(g_ack),
      .g_cache_row(g_cache_row),
      .g_sdram_row(g_sdram_row),
      .interlaced(interlaced),
      .field_no(field_no)
      );

   sdram_controller sdram_controller(
      .reset_n(reset_n),
      .clk(sdram_clk),
      .DRAM_CLK(DRAM_CLK),
      .DRAM_CKE(DRAM_CKE),
      .DRAM_CS_N(DRAM_CS_N),
      .DRAM_RAS_N(DRAM_RAS_N),
      .DRAM_CAS_N(DRAM_CAS_N),
      .DRAM_WE_N(DRAM_WE_N),
      .DRAM_BA(DRAM_BA),
      .DRAM_ADDR(DRAM_ADDR),
      .DRAM_LDQM(DRAM_LDQM),
      .DRAM_UDQM(DRAM_UDQM),
      .DRAM_DQ(DRAM_DQ),
      .sc_rd_address(sc_rd_address),
      .sc_rd_data(sc_rd_data),
      .gc_wr_address(gc_wr_address),
      .gc_wr_data(gc_wr_data),
      .gc_wr_en(gc_wr_en),
      .s_req(s_req),
      .s_ack(s_ack),
      .s_cache_row(s_cache_row),
      .s_sdram_row(s_sdram_row),
      .g_req(g_req),
      .g_ack(g_ack),
      .g_cache_row(g_cache_row),
      .g_sdram_row(g_sdram_row)
      );

   // Debug.
   assign LEDR[0] = interlaced;
   assign LEDR[1] = field_no;
   assign LEDR[9:2] = 8'b11111111;

   wire [23:0] seg_values = {4'h0, 4'h0, 4'h0, 4'h0, 4'h0, 4'h0};

   seg7_lut_6 u0(
      .hex0(HEX0),
      .hex1(HEX1),
      .hex2(HEX2),
      .hex3(HEX3),
      .hex4(HEX4),
      .hex5(HEX5),
      .values(seg_values)
      );

endmodule
