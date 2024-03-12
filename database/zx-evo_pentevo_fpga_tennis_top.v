
`include "tune.v"

module top(

 // clocks
 input fclk,
 output clkz_out,
 input clkz_in,

 // z80
 input iorq_n,
 input mreq_n,
 input rd_n,
 input wr_n,
 input m1_n,
 input rfsh_n,
 input int_n,
 input nmi_n,
 input wait_n,
 output res,

 input [7:0] d,
 output [15:0] a,

 // zxbus and related
 output csrom,
 output romoe_n,
 output romwe_n,

 output rompg0_n,
 output dos_n, // aka rompg1
 output rompg2,
 output rompg3,
 output rompg4,

 input iorqge1,
 input iorqge2,
 output iorq1_n,
 output iorq2_n,

 // DRAM
 input [15:0] rd,
 output [9:0] ra,
 output rwe_n,
 output rucas_n,
 output rlcas_n,
 output rras0_n,
 output rras1_n,

 // video
 output reg [1:0] vred,
 output reg [1:0] vgrn,
 output reg [1:0] vblu,

 output reg vhsync,
 output reg vvsync,
 output reg vcsync,

 // AY control and audio/tape
 output ay_clk,
 output ay_bdir,
 output ay_bc1,

 output reg beep,

 // IDE
`ifdef IDE_VDAC
 output [2:0] ide_a,
 output [15:0] ide_d,
`elsif IDE_VDAC2
 output [2:0] ide_a,
 output [15:0] ide_d,
`else
 input [2:0] ide_a,
 input [15:0] ide_d,
`endif

 output ide_dir,

 input ide_rdy,

 output ide_cs0_n,
 output ide_cs1_n,
 output ide_rs_n,
 output ide_rd_n,
 output ide_wr_n,

 // VG93 and diskdrive
 output vg_clk,

 output vg_cs_n,
 output vg_res_n,

 input vg_hrdy,
 input vg_rclk,
 input vg_rawr,
 input [1:0] vg_a, // disk drive selection
 input vg_wrd,
 input vg_side,

 input step,
 input vg_sl,
 input vg_sr,
 input vg_tr43,
 input rdat_b_n,
 input vg_wf_de,
 input vg_drq,
 input vg_irq,
 input vg_wd,

 // serial links (atmega-fpga, sdcard)
 output sdcs_n,
 input sddo,
 input sdclk,
 input sddi,

 input spics_n,
 input spick,
 input spido,
 output spidi,
 output spiint_n

);

//--Dummy----------------------------------------------------------------------

 assign iorq1_n   = 1'b1;
 assign iorq2_n   = 1'b1;

 assign res       = 1'b1;

 assign ay_bdir   = 1'b0;
 assign ay_bc1    = 1'b0;

 assign vg_cs_n   = 1'b1;
 assign vg_res_n  = 1'b0;

`ifdef IDE_VDAC
 assign ide_d[ 4: 0] = { vred[1:0], vred[1:0], vred[1] };
 assign ide_d[ 9: 5] = { vgrn[1:0], vgrn[1:0], vgrn[1] };
 assign ide_d[14:10] = { vblu[1:0], vblu[1:0], vblu[1] };
 assign ide_d[15] = 1'b1;
 assign ide_dir = 1'b0;      // always output
 assign ide_a[0] = 1'b0;
 assign ide_a[1] = !fclk;
 assign ide_a[2] = vhsync;
 assign ide_cs1_n = vvsync;
 assign ide_rs_n  = 1'b0;
 assign ide_cs0_n = 1'b1;
 assign ide_rd_n  = 1'b1;
 assign ide_wr_n  = 1'b1;
`elsif IDE_VDAC2
 wire [4:0] vred_raw = { vred[1:0], vred[1:0], vred[1] };
 wire [4:0] vgrn_raw = { vgrn[1:0], vgrn[1:0], vgrn[1] };
 wire [4:0] vblu_raw = { vblu[1:0], vblu[1:0], vblu[1] };
 assign ide_d[ 0] = vgrn_raw[2];
 assign ide_d[ 1] = vred_raw[0];
 assign ide_d[ 2] = vred_raw[1];
 assign ide_d[ 3] = vred_raw[2];
 assign ide_d[ 4] = vred_raw[3];
 assign ide_d[ 5] = vred_raw[4];
 assign ide_d[ 6] = vgrn_raw[0];
 assign ide_d[ 7] = vgrn_raw[1];
 assign ide_d[ 8] = vgrn_raw[3];
 assign ide_d[ 9] = vgrn_raw[4];
 assign ide_d[10] = vblu_raw[0];
 assign ide_d[11] = vblu_raw[1];
 assign ide_d[12] = vblu_raw[2];
 assign ide_d[13] = vblu_raw[3];
 assign ide_d[14] = vblu_raw[4];
 assign ide_d[15] = 1'b1;    // always 0-31 luma scale
 assign ide_rs_n = vgrn_raw[2]; // for lame RevA
 assign ide_dir = 1'b0;      // always output
 assign ide_a[0] = 1'b0;  // FT812 SCK
 assign ide_a[1] = 1'b0;  // FT812 MOSI
 assign ide_a[2] = !fclk;
 assign ide_rd_n = 1'b1; // FT812 CS_n
 assign ide_wr_n = 1'b0;
 assign ide_cs0_n = vhsync;
 assign ide_cs1_n = vvsync;
`else
 assign ide_dir   = 1'b1;
 assign ide_cs1_n = 1'b1;
 assign ide_rs_n  = 1'b0;
 assign ide_cs0_n = 1'b1;
 assign ide_rd_n  = 1'b1;
 assign ide_wr_n  = 1'b1;
`endif

 assign a[15:0]   = 16'hffff;
 assign rompg0_n  = 1'b0;
 assign rompg4    = 1'b1;
 assign rompg3    = 1'b1;
 assign rompg2    = 1'b1;
 assign dos_n     = 1'b1;
 assign csrom     = 1'b0;
 assign romoe_n   = 1'b1;
 assign romwe_n   = 1'b1;

 assign sdcs_n    = 1'b1;

 assign ra        = 10'h3ff;
 assign rwe_n     = 1'b1;
 assign rucas_n   = 1'b1;
 assign rlcas_n   = 1'b1;
 assign rras0_n   = 1'b1;
 assign rras1_n   = 1'b1;

 assign spidi     = 1'b0;
 assign spiint_n  = 1'b1;

//-----------------------------------------------------------------------------

 reg [3:0] pix_div;             initial pix_div = 4'd0;
 reg dummyclk;                  initial dummyclk = 1'b0;
 wire pixtick;

 assign pixtick = (vga_mode) ? (pix_div==4'd6) : (pix_div==4'd13);

 always @(posedge fclk)
 begin
  if ( pixtick )
  begin
   pix_div <= 4'd0;
   dummyclk <= ~dummyclk;
  end
  else
   pix_div <= pix_div + 4'd1;
 end

 assign clkz_out = dummyclk;
 assign vg_clk = dummyclk;
 assign ay_clk = dummyclk;

//--GAME-----------------------------------------------------------------------
                          // GgRrBb
 localparam BLACK       = 6'b000000;
 localparam WHITE       = 6'b111111;
 localparam CYAN_3      = 6'b110011;
 localparam YELLOW_3    = 6'b111100;
 localparam GREEN_2     = 6'b100000;

 reg l_human;           initial l_human = 1'd0;
 reg [1:0] l_move;      initial l_move = 2'd0;
 reg r_human;           initial r_human = 1'd0;
 reg [8:0] r_move;      initial r_move = 9'd0;
 reg [7:0] r_prev_y;    initial r_prev_y = 8'd1;
 reg prev_vsync;        initial prev_vsync = 1'd1;
 reg [2:0] m_delay;     initial m_delay = 3'd7;

 wire hsync, vsync, csync, ball, left_bat, right_bat, field_and_score, sound;
 wire [7:0] m_diff_y;

 tennis game( .glb_clk(fclk),
              .pixtick(pixtick),
              .reset(game_reset),
              .lbat_human(l_human),
              .lbat_move({l_move[1],l_move[1],l_move[1],l_move[1],l_move[1],l_move[1],l_move[0],2'd0}),
              .rbat_human(r_human),
              .rbat_move(r_move),
              .tv_mode(~vga_mode),
              .scanlines(scanlines),
              .hsync(hsync),
              .vsync(vsync),
              .csync(csync),
              .ball(ball),
              .left_bat(left_bat),
              .right_bat(right_bat),
              .field_and_score(field_and_score),
              .sound(sound)
            );

 always @(posedge fclk)
 begin
  if ( pixtick )
  begin
   { vgrn[1:0], vred[1:0], vblu[1:0] } <= (ball) ? WHITE :
                                          (left_bat) ? CYAN_3 :
                                          (right_bat) ? YELLOW_3 :
                                          (field_and_score) ? GREEN_2 : BLACK ;
   vhsync <= hsync;
   vvsync <= vsync;
   vcsync <= csync;
   beep <= sound;
  end
 end

 always @(posedge fclk)
  prev_vsync <= vsync;

 always @(posedge fclk or posedge game_reset)
 begin
  if ( game_reset )
  begin
   l_human <= 1'd0;
   l_move <= 2'd0;
  end
  else if ( key_stb )
  begin
   if ( key_q_a[0] | key_q_a[1] )
    l_human <= 1'd1;
   l_move <= { ~key_q_a[1] & key_q_a[0], key_q_a[1] ^ key_q_a[0] };
  end
 end

 assign m_diff_y = mouse_y - r_prev_y;

 always @(posedge fclk or posedge game_reset)
 begin
  if ( game_reset )
  begin
   r_human <= 1'd0;
   r_move <= 9'd0;
   m_delay <= 3'd7;
  end
  else if ( vsync & ~prev_vsync )
  begin
   if ( m_delay!=3'd0 )
    m_delay = m_delay - 3'd1;
   if ( msy_stb & (m_delay==3'd0) )
   begin
    r_human <= 1'd1;
    r_move <= { m_diff_y[7], m_diff_y };
    r_prev_y <= mouse_y;
   end
   else
    r_move <= 9'd0;
  end
  else // ~(vsync & ~prev_vsync )
  begin
   if ( msy_stb & (m_delay==3'd0) )
   begin
    r_human <= 1'd1;
    r_move <= r_move + { m_diff_y[7], m_diff_y };
    r_prev_y <= mouse_y;
   end
  end // ~(vsync & ~prev_vsync )
 end

//--avrspi---------------------------------------------------------------------

 reg [7:0] number;          initial number = 8'd0;
 reg [7:0] indata;          initial indata = 8'd0;
 reg [7:0] tmpkbd;          initial tmpkbd = 8'd0;
 reg vga_mode;              initial vga_mode = 1'd0;
 reg scanlines;             initial scanlines = 1'd1;
 reg [1:0] key_q_a;         initial key_q_a = 2'd0;
 reg cs_trg, prev_spics_n, num_clr_stb;
 wire spicsn_rising, spicsn_falling, key_stb, msy_stb, game_reset;
 wire [7:0] mouse_y;

 assign spicsn_rising  = ( { cs_trg, prev_spics_n, spics_n }==4'b011 );
 assign spicsn_falling = ( { cs_trg, prev_spics_n, spics_n }==4'b100 );
 assign mouse_y = indata[7:0];
 assign key_stb = (number[7:4]==4'h1) & number[0] & spicsn_rising; // "kbdstb"
 assign msy_stb = (number[7:4]==4'h2) & (number[1:0]==2'h1) & spicsn_rising; // "musycr"
 assign game_reset = (number[7:4]==4'h3) & spicsn_rising; // "rstreg"

 always @(posedge spick or posedge num_clr_stb)
 begin
  if ( num_clr_stb )
   number <= 8'd0;
  else if ( cs_trg )
   number <= { spido, number[7:1] };
 end

 always @(posedge spick)
 begin
  if ( ~cs_trg )
  begin
   indata <= { spido, indata[7:1] };
   if ( (number[7:4]==4'h1) & ~number[0] )
    tmpkbd <= { spido, tmpkbd[7:1] };
  end
 end

 always @(posedge fclk)
 begin
  if ( spicsn_rising )
  begin
   num_clr_stb <= 1'd1;
   cs_trg <= 1'd1;
   if ( (number[7:4]==4'h1) & ~number[0] ) // "kbdreg"
    key_q_a <= tmpkbd[2:1]; // Q=[34], A=[33]
   if (number[7:4]==4'h5) // "cfg0"
   begin
    vga_mode <= indata[0];
    if ( ( vga_mode ^ indata[0] ) & indata[0] )
     scanlines <= ~scanlines;
   end
  end
  else
  begin
   num_clr_stb <= 1'd0;
   if ( spicsn_falling )
    cs_trg <= 1'd0;
  end
  prev_spics_n <= spics_n;
 end

//-----------------------------------------------------------------------------

endmodule
