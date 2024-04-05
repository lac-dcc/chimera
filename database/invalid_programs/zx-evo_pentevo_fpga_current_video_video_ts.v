`include "tune.v"

// This is the Tile Sprite Processing Unit

// Tiles map address:
//  bits    desc
//  20:13   tmpage
//  12:

// Graphics address:
//  bits    desc
//  20:13   Xgpage
//  15:7    line (bits 15:13 are added) - 512 lines
//  6:0     word within line - 128 words = 512 pixels


module video_ts
(
  // clocks
  input wire clk,

  // video controls
  input wire start,
  input wire [8:0] line,  // = vcount - vpix_beg + 9'b1;
  input wire v_ts,
  input wire v_pf,        // vertical tilemap prefetch window

  // video config
  input wire [7:0] tsconf,
  input wire [7:0] t0gpage,
  input wire [7:0] t1gpage,
  input wire [7:0] sgpage,
  input wire [7:0] tmpage,
  input wire [5:0] num_tiles,
  input wire [8:0] t0x_offs,
  input wire [8:0] t1x_offs,
  input wire [8:0] t0y_offs,
  input wire [8:0] t1y_offs,
  input wire [1:0] t0_palsel,
  input wire [1:0] t1_palsel,

  // SFYS interface
  input  wire  [7:0] sfile_addr_in,
  input  wire [15:0] sfile_data_in,
  input  wire sfile_we,

  // renderer interface
  output wire tsr_go,
  output wire [5:0] tsr_addr,  // graphics address within the line
  output wire [8:0] tsr_line,  // bitmap line
  output wire [7:0] tsr_page,  // bitmap 1st page
  output wire [8:0] tsr_x,     // addr in buffer (0-359 visibles)
  output wire [2:0] tsr_xs,    // size (8-64 pix)
  output wire tsr_xf,          // X flip
  output wire [3:0] tsr_pal,   // palette
  input wire tsr_rdy,          // renderer is done and ready to receive a new task

  // DRAM interface
  output wire [20:0] dram_addr,
  output wire        dram_req,
  input  wire        dram_next,
  input  wire [15:0] dram_rdata
);

  // config
  wire s_en = tsconf[7];
  wire t1_en = tsconf[6];
  wire t0_en = tsconf[5];
  wire t1z_en = tsconf[3];
  wire t0z_en = tsconf[2];

  // tile descriptor fields
  wire [15:0] tmb_rdata;

  wire [11:0] t_tnum = tmb_rdata[11:0];
  wire [1:0]  t_pal  = tmb_rdata[13:12];
  wire        t_xflp = tmb_rdata[14];
  wire        t_yflp = tmb_rdata[15];

  // Layer selectors control
  localparam LAYERS = 6;    // total number of layers to process

  localparam TM = 0;    // Individual layers
  localparam S0 = 1;
  localparam T0 = 2;
  localparam S1 = 3;
  localparam T1 = 4;
  localparam S2 = 5;

  reg [LAYERS-1:0] layer_active;
  reg [LAYERS-1:0] layer_skip;

  wire tmap = layer_active[TM];
  wire sprites = layer_active[S0] || layer_active[S1] || layer_active[S2];
  wire tiles = layer_active[T0] || layer_active[T1];

  reg [LAYERS-1:0] layer;
  always @(posedge clk)
    if (start)
      layer <= 1;
    else if (|(layer & layer_skip))
      layer <= {layer[LAYERS-2:0], 1'b0};

  always @(posedge clk)
    if (start)
      layer_active <= 0;
    else
      layer_active <= layer & ~layer_skip;

  wire [2:0] spr_end;
  wire [1:0] tile_end;
  wire tm_end;
  wire [LAYERS-1:0] layer_enabled = {s_en, t1_en, s_en, t0_en, s_en, t1_en || t0_en};
  wire [LAYERS-1:0] layer_allowed = {{5{v_ts}}, v_pf};
  wire [LAYERS-1:0] layer_end = {spr_end[2], tile_end[1], spr_end[1], tile_end[0], spr_end[0], tm_end};

  always @(posedge clk)
    if (start)
      layer_skip <= ~(layer_enabled & layer_allowed);
    else
      layer_skip <= layer_skip | layer_end;

  // --- Tile map prefetch ---
  // TMB control
  reg [4:0] tm_x;

  wire [8:0] tm_line = line + 9'd16;
  wire [2:0] tm_b_line = tm_line[2:0];
  wire [2:0] tm_num = tm_x[2:0];
  wire tm_layer = tm_x[3];
  wire [8:0] tmb_waddr = {tm_line[4:3], tm_b_line, tm_num, tm_layer};  // 8:7 - buffer #, 6:4 - burst number (of 8 bursts), 3:1 - number in burst (8 tiles per burst), 0 - layer
  wire [5:0] tm_b_row = tm_line[8:3] + (tm_layer ? t1y_offs[8:3] : t0y_offs[8:3]);

  // DRAM controls
  assign dram_addr = {tmpage, tm_b_row, tm_layer, tm_b_line, tm_num};  // 20:13 - page, 12:7 - row, 6 - layer, 5:0 - column (burst number : number in burst)
  assign dram_req = tmap;

  // internal layers control
  assign tm_end = tm_x == (t1_en ? 5'd16 : 5'd8);
  wire tm_next = dram_next && tmap;

  reg [1:0] m_layer;
  always @(posedge clk)
    if (start)
      m_layer <= 2'b1;
    else if (tm_end)
      m_layer <= {m_layer[0], 1'b0};

  // tilemap X coordinate
  always @(posedge clk)
    if (start)
      tm_x <= t0_en ? 5'd0 : 5'd8;
    else if (tm_next)
      tm_x <= tm_x + 5'd1;

  // --- Tiles ---
  // layer parameter selectors
  reg [1:0] t_layer;
  reg [5:0] tx;

  wire t_sel = t_layer[0];
  wire [8:0] tx_offs = t_sel ? t0x_offs : t1x_offs;
  wire [3:0] ty_offs = t_sel ? t0y_offs[2:0] : t1y_offs[2:0];

  // TSR control
  wire [4:0] t_line;
  wire [7:0] tile_page = t_sel ? t0gpage : t1gpage;
  wire [8:0] tile_line = {t_tnum[11:6], (t_line[2:0] ^ {3{t_yflp}})};
  wire [5:0] tile_addr = t_tnum[5:0];
  wire [8:0] tile_x = {(tx - 6'd1), 3'd0} - tx_offs[2:0];
  wire [3:0] tile_pal = {t_sel ? t0_palsel : t1_palsel, t_pal};

  // TMB control
  wire [8:0] tmb_raddr = {t_line[4:3], tx + tx_offs[8:3], ~t_sel};

  // internal layers control
  wire t_layer_end = tx == num_tiles;
  wire t_layer_start = start || t_layer_end;
  assign tile_end = {2{t_layer_end}} & t_layer[1:0];

  always @(posedge clk)
    if (start)
      t_layer <= t0_en ? 2'b01 : 2'b10;
    else if (t_layer_end)
      t_layer <=  {t_layer[0], 1'b0};

  // TMBUF control
    // condition        write to tx    write to tm_valid
    //  t_layer_start    0              TM_PRE_VALID
    //  tm_pre_valid     tx+1           TM_VALID
    //  tile_skip        tx+1           -
    //  tile_go          tx+1           TM_VALID
    //  tile_wait        tx-1           TM_PRE_VALID

  localparam TM_PRE_VALID  = 2'b01;
  localparam TM_VALID    = 2'b10;

  reg [1:0] tm_valid_r;
  wire tm_valid = tm_valid_r[1];
  wire tm_pre_valid = tm_valid_r[0];

  wire tile_valid = |t_tnum || (t_sel ? t0z_en : t1z_en);
  wire tsr_allowed = tiles && tsr_rdy;
  wire tile_good = tm_valid && tile_valid;
  wire tile_wait = tile_good && !tsr_allowed;
  wire tile_skip = tm_valid && !tile_valid;
  wire tile_go = tile_good && tsr_allowed;

  always @(posedge clk)
    if (t_layer_start || tile_wait)
      tm_valid_r <= TM_PRE_VALID;
    else if (tm_pre_valid || tile_go)
      tm_valid_r <= TM_VALID;

  always @(posedge clk)
    if (t_layer_start)
      tx <= 6'd0;
    else if (tm_pre_valid || tile_skip || tile_go)
      tx <= tx + 6'd1;
    else if (tile_wait)
      tx <= tx - 6'd1;

  // tile Y geometry
  assign t_line = line[4:0] + ty_offs;

  // --- Sprites ---
  // sprite descriptor fields
  // R0
  wire [15:0] sfile_rdata;

  wire [8:0]  s_ycrd = sfile_rdata[8:0];
  wire [2:0]  s_ysz  = sfile_rdata[11:9];
  wire        s_act  = sfile_rdata[13];
  wire        s_leap = sfile_rdata[14];
  wire        s_yflp = sfile_rdata[15];
  // R1
  wire [8:0]  s_xcrd = sfile_rdata[8:0];
  wire [2:0]  s_xsz  = sfile_rdata[11:9];
  wire        s_xflp = sfile_rdata[15];
  // R2
  wire [11:0] s_tnum = sfile_rdata[11:0];
  wire [3:0]  s_pal  = sfile_rdata[15:12];

  // TSR control
  wire [5:0] sprites_addr = s_tnum[5:0];

  // internal layers control
  reg sprites_last_r;
  reg [2:0] s_layer;
  reg [7:0] sreg;
  reg [4:0] sr_valid;
  reg s_leap_r;

  wire sr0_pre_valid = sr_valid[0];
  wire sr0_valid     = sr_valid[1];
  wire sr1_pre_valid = sr_valid[2];
  wire sr1_valid     = sr_valid[3];
  wire sr2_valid     = sr_valid[4];

  wire sprite_go;
  wire s_visible;
  wire spr_valid = s_visible && s_act;
  wire s_layer_end = (sr0_valid && !spr_valid && s_leap) || (sprite_go && s_leap_r);
  wire sprites_last = sr0_valid && sprites_last_r;
  assign spr_end = ({3{s_layer_end}} & s_layer[2:0]) | {3{sprites_last}};

  always @(posedge clk)
    sprites_last_r <= sreg == 8'd255;

  always @(posedge clk)
    if (start)
      s_layer <= 3'b1;
    else if (s_layer_end)
      s_layer <= {s_layer[1:0], 1'b0};

  // SFile registers control
    // condition                 write to sreg  write to sr_valid  action
    //  start                     0              SR0_PRE_VALID      Start
    //  sr0_pre_valid             sreg+3         SR0_VALID          SR0 pre-read
    //  sr0_valid && !spr_valid   sreg+3         -                  Skip sprite
    //  sr0_valid && spr_valid    sreg-2         SR1_PRE_VALID      SR1 pre-read
    //  sr1_pre_valid             sreg+1         SR1_VALID          SR1 read
    //  sr1_valid                 sreg+1         SR2_VALID          SR2 pre-read
    //  sr2_valid && !tsr_rdy     -              -                  Wait for TSR ready
    //  sr2_valid && tsr_rdy      sreg+1         SR0_PRE_VALID      Next sprite
    //  sprites_last              -              NONE_VALID         End

  localparam NONE_VALID    = 5'b00000;
  localparam SR0_PRE_VALID  = 5'b00001;
  localparam SR0_VALID    = 5'b00010;
  localparam SR1_PRE_VALID  = 5'b00100;
  localparam SR1_VALID    = 5'b01000;
  localparam SR2_VALID    = 5'b10000;

  assign sprite_go = sr2_valid && sprites && tsr_rdy;    // a kick to renderer

  always @(posedge clk)
    if (start)
      sr_valid <= SR0_PRE_VALID;
    else if (sprites_last)
      sr_valid <= NONE_VALID;
    else if (sr0_pre_valid)
      sr_valid <= SR0_VALID;
    else if (sr0_valid && spr_valid)
      sr_valid <= SR1_PRE_VALID;
    else if (sr1_pre_valid)
      sr_valid <= SR1_VALID;
    else if (sr1_valid)
      sr_valid <= SR2_VALID;
    else if (sprite_go)
      sr_valid <= SR0_PRE_VALID;

  always @(posedge clk)
    if (start)
      sreg <= 8'd0;
    else if (sr0_pre_valid)
      sreg <= sreg + 8'd3;
    else if (sr0_valid)
      sreg <= spr_valid ? (sreg - 8'd2) : (sreg + 8'd3);
    else if (sr1_pre_valid || sprite_go)
      sreg <= sreg + 8'd1;

  // sprite Y geometry
  reg [5:0] s_bmline_offset_r;

  wire [8:0] s_line = line - s_ycrd;      // visible line of sprite in current video line
  wire [5:0] s_ymax = {s_ysz, 3'b111};
  assign s_visible = (s_line <= s_ymax);    // check if sprite line is within Y size

  wire [8:0] sprites_line = {s_tnum[11:6], 3'b0} + s_bmline_offset_r;
  wire [5:0] s_bmline_offset = s_yflp ? (s_ymax - s_line[5:0]) : s_line[5:0];

  // SFile control
  reg [8:0] sprites_x;
  reg [2:0] sprites_xs;
  reg sprites_xf;

  always @(posedge clk)
  begin
    if (sr0_valid)
    begin
      s_leap_r <= s_leap;
      s_bmline_offset_r <= s_bmline_offset;
    end

    if (sr1_valid)
    begin
      sprites_x <= s_xcrd;
      sprites_xs <= s_xsz;
      sprites_xf <= s_xflp;
    end
  end

  // SFile
  altdpram video_sfile
  (
    .outclock       (clk),
    .wren           (sfile_we),
    .inclock        (clk),
    .data           (sfile_data_in),
    .rdaddress      (sreg),
    .wraddress      (sfile_addr_in),
    .q              (sfile_rdata),
    .aclr           (1'b0),
    .byteena        (1'b1),
    .inclocken      (1'b1),
    .outclocken     (1'b1),
    .rdaddressstall (1'b0),
    .rden           (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    video_sfile.indata_aclr = "OFF",
    video_sfile.indata_reg = "INCLOCK",
    video_sfile.intended_device_family = "ACEX1K",
    video_sfile.lpm_type = "altdpram",
    video_sfile.outdata_aclr = "OFF",
    video_sfile.outdata_reg = "OUTCLOCK",
    video_sfile.rdaddress_aclr = "OFF",
    video_sfile.rdaddress_reg = "UNREGISTERED",
    video_sfile.rdcontrol_aclr = "OFF",
    video_sfile.rdcontrol_reg = "UNREGISTERED",
    video_sfile.width = 16,
    video_sfile.widthad = 8,
    video_sfile.wraddress_aclr = "OFF",
    video_sfile.wraddress_reg = "INCLOCK",
    video_sfile.wrcontrol_aclr = "OFF",
    video_sfile.wrcontrol_reg = "INCLOCK";

  // 4 buffers * 2 tile-planes * 64 tiles * 16 bits (9x16) - used to prefetch tiles
  // (2 altdprams)
  altdpram video_tmbuf
  (
    .outclock       (clk),
    .wren           (tm_next),
    .inclock        (clk),
    .data           (dram_rdata),
    .rdaddress      (tmb_raddr),
    .wraddress      (tmb_waddr),
    .q              (tmb_rdata),
    .aclr           (1'b0),
    .byteena        (1'b1),
    .inclocken      (1'b1),
    .outclocken     (1'b1),
    .rdaddressstall (1'b0),
    .rden           (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    video_tmbuf.indata_aclr = "OFF",
    video_tmbuf.indata_reg = "INCLOCK",
    video_tmbuf.intended_device_family = "ACEX1K",
    video_tmbuf.lpm_type = "altdpram",
    video_tmbuf.outdata_aclr = "OFF",
    video_tmbuf.outdata_reg = "OUTCLOCK",
    video_tmbuf.rdaddress_aclr = "OFF",
    video_tmbuf.rdaddress_reg = "UNREGISTERED",
    video_tmbuf.rdcontrol_aclr = "OFF",
    video_tmbuf.rdcontrol_reg = "UNREGISTERED",
    video_tmbuf.width = 16,
    video_tmbuf.widthad = 9,
    video_tmbuf.wraddress_aclr = "OFF",
    video_tmbuf.wraddress_reg = "INCLOCK",
    video_tmbuf.wrcontrol_aclr = "OFF",
    video_tmbuf.wrcontrol_reg = "INCLOCK";

  // TS renderer interface
  assign tsr_go = sprite_go || tile_go;
  assign tsr_x = sprites ? sprites_x : tile_x;
  assign tsr_xs = sprites ? sprites_xs : 3'd0;
  assign tsr_xf = sprites ? sprites_xf : t_xflp;
  assign tsr_page = sprites ? sgpage : tile_page;
  assign tsr_line = sprites ? sprites_line : tile_line;
  assign tsr_addr = sprites ? sprites_addr : tile_addr;
  assign tsr_pal = sprites ? s_pal : tile_pal;

endmodule
