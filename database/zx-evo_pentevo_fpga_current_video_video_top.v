`include "tune.v"

// This module is a video top-level

module video_top
(
  // clocks
  input wire clk,
  input wire f0, f1,
  input wire h1,
  input wire c0, c1, c3,
  // input wire t0,  // debug!!!

  // video DAC
  output wire  [1:0] vred,
  output wire  [1:0] vgrn,
  output wire  [1:0] vblu,

  // video raw (for 15 bit DAC)
  output wire  [4:0] vred_raw,
  output wire  [4:0] vgrn_raw,
  output wire  [4:0] vblu_raw,
  output wire  vdac_mode,
`ifdef IDE_VDAC2
  output wire vdac2_msel,
`endif

  // video syncs
  output wire hsync,
  output wire vsync,
  output wire csync,

  // Z80 controls
  input wire [ 7:0] d,
  input wire [15:0] zmd,
  input wire [ 7:0] zma,
  input wire cram_we,
  input wire sfile_we,

  // port write strobes
  input wire zborder_wr,
  input wire border_wr,
  input wire zvpage_wr,
  input wire vpage_wr,
  input wire vconf_wr,
  input wire gx_offsl_wr,
  input wire gx_offsh_wr,
  input wire gy_offsl_wr,
  input wire gy_offsh_wr,
  input wire t0x_offsl_wr,
  input wire t0x_offsh_wr,
  input wire t0y_offsl_wr,
  input wire t0y_offsh_wr,
  input wire t1x_offsl_wr,
  input wire t1x_offsh_wr,
  input wire t1y_offsl_wr,
  input wire t1y_offsh_wr,
  input wire tsconf_wr,
  input wire palsel_wr,
  input wire tmpage_wr,
  input wire t0gpage_wr,
  input wire t1gpage_wr,
  input wire sgpage_wr,
  input wire hint_beg_wr ,
  input wire vint_begl_wr,
  input wire vint_begh_wr,

  // ZX controls
  input wire  res,
  output wire int_start,
  output wire line_start_s,
`ifdef PENT_312
  output wire [4:0] hcnt,
  output wire upper8,
`endif

  // DRAM interface
  output wire [20:0] video_addr,
  output wire [ 4:0] video_bw,
  output wire        video_go,
  input  wire [15:0] dram_rdata,      // raw, should be latched by c2
  input  wire        video_pre_next,
  input  wire        video_strobe,
  output wire [20:0] ts_addr,
  output wire        ts_req,
  input  wire        ts_pre_next,
  input  wire        ts_next,
  output wire [20:0] tm_addr,
  output wire        tm_req,
  input  wire        tm_next,

  // video controls
  input wire cfg_60hz,
  input wire vga_on
);

  // video config
  wire [7:0] vpage;      // re-latched at line_start
  wire [7:0] vconf;      //
  wire [8:0] gx_offs;    //
  wire [8:0] gy_offs;    //
  wire [7:0] palsel;     //
  wire [8:0] t0x_offs;   //
  wire [8:0] t1x_offs;   //
  wire [7:0] t0gpage;    //
  wire [7:0] t1gpage;    //
  wire [7:0] sgpage;     // * not yet !!!
  wire [8:0] t0y_offs;
  wire [8:0] t1y_offs;
  wire [7:0] tsconf;
  wire [7:0] tmpage;
  wire [7:0] hint_beg;
  wire [8:0] vint_beg;
  wire [8:0] hpix_beg;
  wire [8:0] hpix_end;
  wire [8:0] vpix_beg;
  wire [8:0] vpix_end;
  wire [8:0] hpix_beg_ts;
  wire [8:0] hpix_end_ts;
  wire [8:0] vpix_beg_ts;
  wire [8:0] vpix_end_ts;
  wire [5:0] x_tiles;
  wire [9:0] x_offs_mode;
  wire [4:0] go_offs;
  wire [1:0] render_mode;
  wire tv_hires;
  wire vga_hires;
  wire v60hz;
  wire nogfx = vconf[5];
  wire notsu = vconf[4];
`ifdef IDE_VDAC2
  assign vdac2_msel = vconf[2];
`endif
  wire tv_blank;

  // counters
  wire [7:0] cnt_col;
  wire [8:0] cnt_row;
  wire cptr;
  wire [3:0] scnt;
  wire [8:0] lcount;

  // synchro
  wire frame_start;
  wire pix_start;
  wire tv_pix_start;
  wire vga_pix_start;
  wire ts_start;
  wire vga_blank;
  wire vga_line;
  wire v_ts;
  wire v_pf;
  wire hpix;
  wire vpix;
  wire hvpix;
  wire hvtspix;
  wire frame;
  wire flash;
  wire pix_stb;

  // fetcher
  wire [31:0] fetch_data;
  wire [31:0] fetch_temp;
  wire [3:0] fetch_sel;
  wire [1:0] fetch_bsl;
  wire fetch_stb;

  // video data
  wire [7:0] border;
  wire [7:0] vplex;
  wire [7:0] vgaplex;

  // TS
  wire tsr_go;
  wire [5:0] tsr_addr;
  wire [8:0] tsr_line;
  wire [7:0] tsr_page;
  wire [8:0] tsr_x;
  wire [2:0] tsr_xs;
  wire tsr_xf;
  wire [3:0] tsr_pal;
  wire tsr_rdy;

  // TS-line
  wire [8:0] ts_waddr;
  wire [7:0] ts_wdata;
  wire ts_we;
  wire [8:0] ts_raddr;

  // VGA-line
  wire [9:0] vga_cnt_in;
  wire [9:0] vga_cnt_out;

  wire [7:0] ts_rdata0, ts_rdata1;
  wire tl_act0 = lcount[0];
  wire tl_act1 = ~lcount[0];
  wire [8:0] ts_waddr0 = tl_act0 ? ts_raddr : ts_waddr;
  wire [7:0] ts_wdata0 = tl_act0 ? 8'd0 : ts_wdata;
  wire       ts_we0    = tl_act0 ? c3 : ts_we;
  wire [8:0] ts_waddr1 = tl_act1 ? ts_raddr : ts_waddr;
  wire [7:0] ts_wdata1 = tl_act1 ? 8'd0 : ts_wdata;
  wire       ts_we1    = tl_act1 ? c3 : ts_we;
  wire [7:0] ts_rdata  = tl_act0 ? ts_rdata0 : ts_rdata1;

  video_ports video_ports
  (
    .clk          (clk),
    .d            (d),
    .res          (res),
    .line_start_s (line_start_s),
    .border_wr    (border_wr),
    .zborder_wr   (zborder_wr),
    .zvpage_wr    (zvpage_wr),
    .vpage_wr     (vpage_wr),
    .vconf_wr     (vconf_wr),
    .gx_offsl_wr  (gx_offsl_wr),
    .gx_offsh_wr  (gx_offsh_wr),
    .gy_offsl_wr  (gy_offsl_wr),
    .gy_offsh_wr  (gy_offsh_wr),
    .t0x_offsl_wr (t0x_offsl_wr),
    .t0x_offsh_wr (t0x_offsh_wr),
    .t0y_offsl_wr (t0y_offsl_wr),
    .t0y_offsh_wr (t0y_offsh_wr),
    .t1x_offsl_wr (t1x_offsl_wr),
    .t1x_offsh_wr (t1x_offsh_wr),
    .t1y_offsl_wr (t1y_offsl_wr),
    .t1y_offsh_wr (t1y_offsh_wr),
    .palsel_wr    (palsel_wr),
    .hint_beg_wr  (hint_beg_wr),
    .vint_begl_wr (vint_begl_wr),
    .vint_begh_wr (vint_begh_wr),
    .tsconf_wr    (tsconf_wr),
    .tmpage_wr    (tmpage_wr),
    .t0gpage_wr   (t0gpage_wr),
    .t1gpage_wr   (t1gpage_wr),
    .sgpage_wr    (sgpage_wr),
    .border       (border),
    .vpage        (vpage),
    .vconf        (vconf),
    .gx_offs      (gx_offs),
    .gy_offs      (gy_offs),
    .t0x_offs     (t0x_offs),
    .t1x_offs     (t1x_offs),
    .t0y_offs     (t0y_offs),
    .t1y_offs     (t1y_offs),
    .palsel       (palsel),
    .hint_beg     (hint_beg),
    .vint_beg     (vint_beg),
`ifdef AUTO_INT
    .int_start    (int_start),
`else
    .int_start    (1'b0),
`endif
    .tsconf       (tsconf),
    .tmpage       (tmpage),
    .t0gpage      (t0gpage),
    .t1gpage      (t1gpage),
    .sgpage       (sgpage)
  );

  video_mode video_mode
  (
    .clk          (clk),
    .f1           (f1),
    .c3           (c3),
    .vpage        (vpage),
    .vconf        (vconf),
    .v60hz        (v60hz),
    .fetch_sel    (fetch_sel),
    .fetch_bsl    (fetch_bsl),
    .fetch_cnt    (scnt),
    .fetch_stb    (fetch_stb),
    .txt_char     (fetch_temp[15:0]),
    .gx_offs      (gx_offs),
    .x_offs_mode  (x_offs_mode),
`ifdef XTR_FEAT
    .ts_rres_ext  (tsconf[0]),
`else
    .ts_rres_ext  (1'b0),
`endif
    .hpix_beg     (hpix_beg),
    .hpix_end     (hpix_end),
    .vpix_beg     (vpix_beg),
    .vpix_end     (vpix_end),
    .hpix_beg_ts  (hpix_beg_ts),
    .hpix_end_ts  (hpix_end_ts),
    .vpix_beg_ts  (vpix_beg_ts),
    .vpix_end_ts  (vpix_end_ts),
    .x_tiles      (x_tiles),
    .go_offs      (go_offs),
    .cnt_col      (cnt_col),
    .cnt_row      (cnt_row),
    .cptr         (cptr),
    .line_start_s (line_start_s),
    .pix_start    (pix_start),
    .tv_hires     (tv_hires),
    .vga_hires    (vga_hires),
    .pix_stb      (pix_stb),
    .render_mode  (render_mode),
    .video_addr   (video_addr),
    .video_bw     (video_bw)
  );

  video_sync video_sync
  (
    .clk            (clk),
    .f1             (f1),
    .c0             (c0),
    .c3             (c3),
    .hpix_beg       (hpix_beg),
    .hpix_end       (hpix_end),
    .vpix_beg       (vpix_beg),
    .vpix_end       (vpix_end),
    .hpix_beg_ts    (hpix_beg_ts),
    .hpix_end_ts    (hpix_end_ts),
    .vpix_beg_ts    (vpix_beg_ts),
    .vpix_end_ts    (vpix_end_ts),
    .go_offs        (go_offs),
    .x_offs         (x_offs_mode[1:0]),
    .y_offs_wr      (gy_offsl_wr || gy_offsh_wr),
    .line_start_s   (line_start_s),
    .hint_beg       (hint_beg),
    .vint_beg       (vint_beg),
    .hsync          (hsync),
    .vsync          (vsync),
    .csync          (csync),
    .tv_blank       (tv_blank),
    .vga_blank      (vga_blank),
    .vga_cnt_in     (vga_cnt_in),
    .vga_cnt_out    (vga_cnt_out),
    .ts_raddr       (ts_raddr),
    .lcount         (lcount),
    .cnt_col        (cnt_col),
    .cnt_row        (cnt_row),
    .cptr           (cptr),
    .scnt           (scnt),
`ifdef PENT_312
    .hcnt           (hcnt),
    .upper8         (upper8),
`endif
    .frame          (frame),
    .flash          (flash),
    .pix_stb        (pix_stb),
    .pix_start      (pix_start),
    .ts_start       (ts_start),
    .cstart         (x_offs_mode[9:2]),
    .rstart         (gy_offs),
    .vga_line       (vga_line),
    .frame_start    (frame_start),
    .int_start      (int_start),
    .v_pf           (v_pf),
    .hpix           (hpix),
    .v_ts           (v_ts),
    .vpix           (vpix),
    .hvpix          (hvpix),
    .hvtspix        (hvtspix),
    .nogfx          (nogfx),
    .vga_on         (vga_on),
    .cfg_60hz       (cfg_60hz),
    .v60hz          (v60hz),
    .video_go       (video_go),
    .video_pre_next (video_pre_next)
  );

  video_fetch video_fetch
  (
    .clk          (clk),
    .f_sel        (fetch_sel),
    .b_sel        (fetch_bsl),
    .fetch_stb    (fetch_stb),
    .fetch_data   (fetch_data),
    .fetch_temp   (fetch_temp),
    .video_strobe (video_strobe),
    .video_data   (dram_rdata)
  );

  video_ts video_ts
  (
    .clk       (clk),
    .start     (ts_start),
    .line      (lcount),
    .v_ts      (v_ts),

`ifdef DISABLE_TSU
     .tsconf        (0),
`else
    .tsconf         (tsconf),
    // .tsconf         ({3'b0, tsconf[4:0]}),  // no TSU
    // .tsconf         ({1'b0, tsconf[6:0]}),  // no sprites
    // .tsconf         ({tsconf[7], 2'b00, tsconf[4:0]}),    // no tiles
`endif
     .t0gpage       (t0gpage),
     .t1gpage       (t1gpage),
     .sgpage        (sgpage),
     .tmpage        (tmpage),
     .num_tiles     (x_tiles),
     .v_pf          (v_pf),
     .t0x_offs      (t0x_offs),
     .t1x_offs      (t1x_offs),
     .t0y_offs      (t0y_offs),
     .t1y_offs      (t1y_offs),
     .t0_palsel     (palsel[5:4]),
     .t1_palsel     (palsel[7:6]),

     .dram_addr     (tm_addr),
     .dram_req      (tm_req),
     .dram_next     (tm_next),
     .dram_rdata    (dram_rdata),

     .tsr_go        (tsr_go),
     .tsr_addr      (tsr_addr),
     .tsr_line      (tsr_line),
     .tsr_page      (tsr_page),
     .tsr_pal       (tsr_pal),
     .tsr_x         (tsr_x),
     .tsr_xs        (tsr_xs),
     .tsr_xf        (tsr_xf),
     .tsr_rdy       (tsr_rdy),

     .sfile_addr_in (zma),
     .sfile_data_in (zmd),
     .sfile_we      (sfile_we)
  );

  video_ts_render video_ts_render
  (
    .clk            (clk),

    .reset          (ts_start),

    .tsr_go         (tsr_go),
    .addr           (tsr_addr),
    .line           (tsr_line),
    .page           (tsr_page),
    .pal            (tsr_pal),
    .x_coord        (tsr_x),
    .x_size         (tsr_xs),
    .flip           (tsr_xf),
    .mem_rdy        (tsr_rdy),

    .ts_waddr       (ts_waddr),
    .ts_wdata       (ts_wdata),
    .ts_we          (ts_we),

    .dram_addr      (ts_addr),
    .dram_req       (ts_req),
    .dram_pre_next  (ts_pre_next),
    .dram_next      (ts_next),
    .dram_rdata     (dram_rdata)
  );

  video_render video_render
  (
     .clk        (clk),
     .c1         (c1),
     .hvpix      (hvpix),
     .hvtspix    (hvtspix),
     .nogfx      (nogfx),
     .notsu      (notsu),
`ifdef XTR_FEAT
    .gfxovr      (vconf[3]),
`else
    .gfxovr      (1'b0),
`endif
    .flash       (flash),
    .hires       (tv_hires),
    .psel        (scnt),
    .palsel      (palsel[3:0]),
    .render_mode (render_mode),
    .data        (fetch_data),
    .border_in   (border),
    .tsdata_in   (ts_rdata),
    .vplex_out   (vplex)
  );

  video_out video_out
  (
    .clk          (clk),
    .c3           (c3),
    .vga_on       (vga_on),
    .tv_blank     (tv_blank),
    .vga_blank    (vga_blank),
    .vga_line     (vga_line),
    .palsel       (palsel[3:0]),
    .plex_sel_in  ({h1, f1}),
    .tv_hires     (tv_hires),
    .vga_hires    (vga_hires),
    .cram_addr_in (zma),
    .cram_data_in (zmd[15:0]),
    .cram_we      (cram_we),
    .vplex_in     (vplex),
    .vgaplex      (vgaplex),
    .vred         (vred),
    .vgrn         (vgrn),
    .vblu         (vblu),
    .vred_raw     (vred_raw),
    .vgrn_raw     (vgrn_raw),
    .vblu_raw     (vblu_raw),
    .vdac_mode    (vdac_mode)
  );

  // 2 buffers: 512 pixels * 8 bits (9x8) - used as bitmap buffer for TS overlay over graphics
  altdpram video_tsline0
  (
    .inclock        (clk),
    .wren           (ts_we0),
    .data           (ts_wdata0),
    .rdaddress      (ts_raddr),
    .wraddress      (ts_waddr0),
    .q              (ts_rdata0),
    .aclr           (1'b0),
    .byteena        (1'b1),
    .inclocken      (1'b1),
    .outclock       (1'b1),
    .outclocken     (1'b1),
    .rdaddressstall (1'b0),
    .rden           (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    video_tsline0.indata_aclr = "OFF",
    video_tsline0.indata_reg = "INCLOCK",
    video_tsline0.intended_device_family = "ACEX1K",
    video_tsline0.lpm_type = "altdpram",
    video_tsline0.outdata_aclr = "OFF",
    video_tsline0.outdata_reg = "UNREGISTERED",
    video_tsline0.rdaddress_aclr = "OFF",
    video_tsline0.rdaddress_reg = "INCLOCK",
    video_tsline0.rdcontrol_aclr = "OFF",
    video_tsline0.rdcontrol_reg = "UNREGISTERED",
    video_tsline0.width = 8,
    video_tsline0.widthad = 9,
    video_tsline0.wraddress_aclr = "OFF",
    video_tsline0.wraddress_reg = "INCLOCK",
    video_tsline0.wrcontrol_aclr = "OFF",
    video_tsline0.wrcontrol_reg = "INCLOCK";

  altdpram video_tsline1
  (
    .inclock        (clk),
    .wren           (ts_we1),
    .data           (ts_wdata1),
    .rdaddress      (ts_raddr),
    .wraddress      (ts_waddr1),
    .q              (ts_rdata1),
    .aclr           (1'b0),
    .byteena        (1'b1),
    .inclocken      (1'b1),
    .outclock       (1'b1),
    .outclocken     (1'b1),
    .rdaddressstall (1'b0),
    .rden           (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    video_tsline1.indata_aclr = "OFF",
    video_tsline1.indata_reg = "INCLOCK",
    video_tsline1.intended_device_family = "ACEX1K",
    video_tsline1.lpm_type = "altdpram",
    video_tsline1.outdata_aclr = "OFF",
    video_tsline1.outdata_reg = "UNREGISTERED",
    video_tsline1.rdaddress_aclr = "OFF",
    video_tsline1.rdaddress_reg = "INCLOCK",
    video_tsline1.rdcontrol_aclr = "OFF",
    video_tsline1.rdcontrol_reg = "UNREGISTERED",
    video_tsline1.width = 8,
    video_tsline1.widthad = 9,
    video_tsline1.wraddress_aclr = "OFF",
    video_tsline1.wraddress_reg = "INCLOCK",
    video_tsline1.wrcontrol_aclr = "OFF",
    video_tsline1.wrcontrol_reg = "INCLOCK";

  // 2 lines * 512 pix * 8 bit (10x8) - used for VGA doubler
  altdpram video_vmem
  (
    .inclock        (clk),
    .outclock       (clk),
    .wren           (c3),
    .data           (vplex),
    .rdaddress      (vga_cnt_out),
    .wraddress      (vga_cnt_in),
    .q              (vgaplex),
    .aclr           (1'b0),
    .byteena        (1'b1),
    .inclocken      (1'b1),
    .outclocken     (1'b1),
    .rdaddressstall (1'b0),
    .rden           (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    video_vmem.indata_aclr = "OFF",
    video_vmem.indata_reg = "INCLOCK",
    video_vmem.intended_device_family = "ACEX1K",
    video_vmem.lpm_type = "altdpram",
    video_vmem.outdata_aclr = "OFF",
    video_vmem.outdata_reg = "OUTCLOCK",
    video_vmem.rdaddress_aclr = "OFF",
    video_vmem.rdaddress_reg = "INCLOCK",
    video_vmem.rdcontrol_aclr = "OFF",
    video_vmem.rdcontrol_reg = "UNREGISTERED",
    video_vmem.width = 8,
    video_vmem.widthad = 10,
    video_vmem.wraddress_aclr = "OFF",
    video_vmem.wraddress_reg = "INCLOCK",
    video_vmem.wrcontrol_aclr = "OFF",
    video_vmem.wrcontrol_reg = "INCLOCK";

endmodule
