// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/***************************************************************************************************
** fpga_nes/hw/src/ppu/ppu.v
*
*  Copyright (c) 2012, Brian Bennett
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without modification, are permitted
*  provided that the following conditions are met:
*
*  1. Redistributions of source code must retain the above copyright notice, this list of conditions
*     and the following disclaimer.
*  2. Redistributions in binary form must reproduce the above copyright notice, this list of
*     conditions and the following disclaimer in the documentation and/or other materials provided
*     with the distribution.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
*  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
*  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
*  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
*  WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*  Picture processing unit block.
***************************************************************************************************/
`timescale 1ps / 1ps

module ppu #(
  parameter           CLOCK_RATE    = 100000000,
  parameter           FPS           = 60,

  //Should be at the center of the screen
  parameter           FRAME_WIDTH   = 480,
  parameter           FRAME_HEIGHT  = 272,
  parameter           X_OFFSET      = 112,
  parameter           Y_OFFSET      = 6,
  parameter           BG_COLOR      = 8'h00
)
(
  input              clk_in,        // 100MHz system clock signal
  input              rst_in,        // reset signal
  input       [ 2:0] ri_sel_in,     // register interface reg select
  input              ri_ncs_in,     // register interface enable
  input              ri_r_nw_in,    // register interface read/write select
  input       [ 7:0] ri_d_in,       // register interface data in
  input       [ 7:0] vram_d_in,     // video memory data bus (input)
  output      [ 7:0] ri_d_out,      // register interface data out

  // Video Out
  output            o_video_hsync,  // Video Active
  output            o_sof_stb,      // Start of frame strobe
  output      [2:0] o_r_out,        // vga red signal
  output      [2:0] o_g_out,        // vga green signal
  output      [1:0] o_b_out,        // vga blue signal

  //Register Interface
  output             nvbl_out,      // /VBL (low during vertical blank)
  output      [13:0] vram_a_out,    // video memory address bus
  output      [ 7:0] vram_d_out,    // video memory data bus (output)
  output             vram_wr_out    // video memory read/write select
);

(* keep_hierarchy="yes" *)
//
// PPU_VGA: VGA output block.
//

wire  [9:0] nes_x;
wire  [9:0] nes_y;
wire  [9:0] nes_y_next;
wire        pix_pulse;
wire        vblank;

wire [5:0] sys_palette_idx;
wire [9:0] vga_nes_x;
wire [9:0] vga_nes_y;
wire [9:0] vga_nes_y_next;
wire       vga_pix_pulse;
wire       vga_vblank;


/*
ppu_vga ppu_vga_blk(
  .clk_in             (clk_in              ),
  .rst_in             (rst_in              ),

  //Video Output
  .hsync_out          (hsync_out           ),
  .vsync_out          (vsync_out           ),
  .r_out              (r_out               ),
  .g_out              (g_out               ),
  .b_out              (b_out               ),

  //PPU Control

  //Input from the PPU
  .sys_palette_idx_in (sys_palette_idx     ),

  //Signals to control PPU
  .nes_x_out          (vga_nes_x           ), //Fed into both the background and sprite controller
  .nes_y_out          (vga_nes_y           ), //Fed into both the background and sprite controller
  .nes_y_next_out     (vga_nes_y_next      ), //Fed into both the background and sprite controller as well as a column control
  .pix_pulse_out      (vga_pix_pulse       ), //Fed into both the background and sprite controller
  .vblank_out         (vga_vblank          )  //Fed into register control (For the CPU to write to here)
);
*/

//
// RGB_GENERATOR: Generate a generic RGB Color stream with hsync and vsync
//

wire          gen_vsync;
wire          gen_hsync;
wire  [2:0]   gen_r_out;
wire  [2:0]   gen_g_out;
wire  [1:0]   gen_b_out;

wire  [9:0]   gen_nes_x;
wire  [9:0]   gen_nes_y;
wire  [9:0]   gen_nes_y_next;
wire          gen_pix_pulse;
wire          gen_vblank;


rgb_generator #(
  .CLOCK_RATE           (CLOCK_RATE         ),
  .FPS                  (FPS                ),

  //Should be at the center of the screen
  .FRAME_WIDTH          (FRAME_WIDTH        ),
  .FRAME_HEIGHT         (FRAME_HEIGHT       ),
  .X_OFFSET             (X_OFFSET           ),
  .Y_OFFSET             (Y_OFFSET           ),
  .BG_COLOR             (BG_COLOR           )

)rgb(
  .clk                  (clk_in             ),
  .rst                  (rst_in             ),

  .i_sys_palette_idx_in (sys_palette_idx    ),
  .o_nes_x_out          (gen_nes_x          ),
  .o_nes_y_out          (gen_nes_y          ),
  .o_nes_y_next_out     (gen_nes_y_next     ),
  .o_pix_pulse_out      (gen_pix_pulse      ),
  .o_vblank             (gen_vblank         ),

  //Output Video
  .o_video_hsync        (o_video_hsync      ),
  .o_sof_stb            (o_sof_stb          ),
  .o_r_out              (o_r_out            ),
  .o_g_out              (o_g_out            ),
  .o_b_out              (o_b_out            )
);

assign  nes_x         = gen_nes_x;
assign  nes_y         = gen_nes_y;
assign  nes_y_next    = gen_nes_y_next;
assign  pix_pulse     = gen_pix_pulse;
assign  vblank        = gen_vblank;

//
// PPU_RI: PPU register interface block.
//
wire [7:0] ri_vram_din;
wire [7:0] ri_pram_din;
wire [7:0] ri_spr_ram_din;
wire       ri_spr_overflow;
wire       ri_spr_pri_col;
wire [7:0] ri_vram_dout;
wire       ri_vram_wr;
wire       ri_pram_wr;
wire [2:0] ri_fv;
wire [4:0] ri_vt;
wire       ri_v;
wire [2:0] ri_fh;
wire [4:0] ri_ht;
wire       ri_h;
wire       ri_s;
wire       ri_inc_addr;
wire       ri_inc_addr_amt;
wire       ri_nvbl_en;
wire       ri_vblank;
wire       ri_bg_en;
wire       ri_spr_en;
wire       ri_bg_ls_clip;
wire       ri_spr_ls_clip;
wire       ri_spr_h;
wire       ri_spr_pt_sel;
wire       ri_upd_cntrs;
wire [7:0] ri_spr_ram_a;
wire [7:0] ri_spr_ram_dout;
wire       ri_spr_ram_wr;

ppu_ri ppu_ri_blk(
  .clk_in           (clk_in          ),
  .rst_in           (rst_in          ),
  .sel_in           (ri_sel_in       ),
  .ncs_in           (ri_ncs_in       ),
  .r_nw_in          (ri_r_nw_in      ),
  .cpu_d_in         (ri_d_in         ),
  .vram_a_in        (vram_a_out      ),
  .vram_d_in        (ri_vram_din     ),
  .pram_d_in        (ri_pram_din     ),
  .vblank_in        (vblank          ),
  .spr_ram_d_in     (ri_spr_ram_din  ),
  .spr_overflow_in  (ri_spr_overflow ),
  .spr_pri_col_in   (ri_spr_pri_col  ),
  .cpu_d_out        (ri_d_out        ),
  .vram_d_out       (ri_vram_dout    ),
  .vram_wr_out      (ri_vram_wr      ),
  .pram_wr_out      (ri_pram_wr      ),
  .fv_out           (ri_fv           ),
  .vt_out           (ri_vt           ),
  .v_out            (ri_v            ),
  .fh_out           (ri_fh           ),
  .ht_out           (ri_ht           ),
  .h_out            (ri_h            ),
  .s_out            (ri_s            ),
  .inc_addr_out     (ri_inc_addr     ),
  .inc_addr_amt_out (ri_inc_addr_amt ),
  .nvbl_en_out      (ri_nvbl_en      ),
  .vblank_out       (ri_vblank       ),
  .bg_en_out        (ri_bg_en        ),
  .spr_en_out       (ri_spr_en       ),
  .bg_ls_clip_out   (ri_bg_ls_clip   ),
  .spr_ls_clip_out  (ri_spr_ls_clip  ),
  .spr_h_out        (ri_spr_h        ),
  .spr_pt_sel_out   (ri_spr_pt_sel   ),
  .upd_cntrs_out    (ri_upd_cntrs    ),
  .spr_ram_a_out    (ri_spr_ram_a    ),
  .spr_ram_d_out    (ri_spr_ram_dout ),
  .spr_ram_wr_out   (ri_spr_ram_wr   )
);

//
// PPU_BG: PPU backgroud/playfield generator block.
//
wire [13:0] bg_vram_a;
wire [ 3:0] bg_palette_idx;

ppu_bg ppu_bg_blk(
  .clk_in             (clk_in          ),
  .rst_in             (rst_in          ),
  .en_in              (ri_bg_en        ),
  .ls_clip_in         (ri_bg_ls_clip   ),
  .fv_in              (ri_fv           ),
  .vt_in              (ri_vt           ),
  .v_in               (ri_v            ),
  .fh_in              (ri_fh           ),
  .ht_in              (ri_ht           ),
  .h_in               (ri_h            ),
  .s_in               (ri_s            ),
  .nes_x_in           (nes_x           ),
  .nes_y_in           (nes_y           ),
  .nes_y_next_in      (nes_y_next      ),
  .pix_pulse_in       (pix_pulse       ),
  .vram_d_in          (vram_d_in       ),
  .ri_upd_cntrs_in    (ri_upd_cntrs    ),
  .ri_inc_addr_in     (ri_inc_addr     ),
  .ri_inc_addr_amt_in (ri_inc_addr_amt ),
  .vram_a_out         (bg_vram_a       ),
  .palette_idx_out    (bg_palette_idx  )
);

//
// PPU_SPR: PPU sprite generator block.
//
wire  [3:0] spr_palette_idx;
wire        spr_primary;
wire        spr_priority;
wire [13:0] spr_vram_a;
wire        spr_vram_req;

ppu_spr ppu_spr_blk(
  .clk_in          (clk_in          ),
  .rst_in          (rst_in          ),
  .en_in           (ri_spr_en       ),
  .ls_clip_in      (ri_spr_ls_clip  ),
  .spr_h_in        (ri_spr_h        ),
  .spr_pt_sel_in   (ri_spr_pt_sel   ),
  .oam_a_in        (ri_spr_ram_a    ),
  .oam_d_in        (ri_spr_ram_dout ),
  .oam_wr_in       (ri_spr_ram_wr   ),
  .nes_x_in        (nes_x           ),
  .nes_y_in        (nes_y           ),
  .nes_y_next_in   (nes_y_next      ),
  .pix_pulse_in    (pix_pulse       ),
  .vram_d_in       (vram_d_in       ),
  .oam_d_out       (ri_spr_ram_din  ),
  .overflow_out    (ri_spr_overflow ),
  .palette_idx_out (spr_palette_idx ),
  .primary_out     (spr_primary     ),
  .priority_out    (spr_priority    ),
  .vram_a_out      (spr_vram_a      ),
  .vram_req_out    (spr_vram_req    )
);

//
// Vidmem interface.
//
reg  [5:0] palette_ram [31:0];  // internal palette RAM.  32 entries, 6-bits per entry.

`define PRAM_A(addr) ((addr & 5'h03) ? addr :  (addr & 5'h0f))

always @(posedge clk_in)
  begin
    if (rst_in)
      begin
        palette_ram[`PRAM_A(5'h00)] <= 6'h09;
        palette_ram[`PRAM_A(5'h01)] <= 6'h01;
        palette_ram[`PRAM_A(5'h02)] <= 6'h00;
        palette_ram[`PRAM_A(5'h03)] <= 6'h01;
        palette_ram[`PRAM_A(5'h04)] <= 6'h00;
        palette_ram[`PRAM_A(5'h05)] <= 6'h02;
        palette_ram[`PRAM_A(5'h06)] <= 6'h02;
        palette_ram[`PRAM_A(5'h07)] <= 6'h0d;
        palette_ram[`PRAM_A(5'h08)] <= 6'h08;
        palette_ram[`PRAM_A(5'h09)] <= 6'h10;
        palette_ram[`PRAM_A(5'h0a)] <= 6'h08;
        palette_ram[`PRAM_A(5'h0b)] <= 6'h24;
        palette_ram[`PRAM_A(5'h0c)] <= 6'h00;
        palette_ram[`PRAM_A(5'h0d)] <= 6'h00;
        palette_ram[`PRAM_A(5'h0e)] <= 6'h04;
        palette_ram[`PRAM_A(5'h0f)] <= 6'h2c;
        palette_ram[`PRAM_A(5'h11)] <= 6'h01;
        palette_ram[`PRAM_A(5'h12)] <= 6'h34;
        palette_ram[`PRAM_A(5'h13)] <= 6'h03;
        palette_ram[`PRAM_A(5'h15)] <= 6'h04;
        palette_ram[`PRAM_A(5'h16)] <= 6'h00;
        palette_ram[`PRAM_A(5'h17)] <= 6'h14;
        palette_ram[`PRAM_A(5'h19)] <= 6'h3a;
        palette_ram[`PRAM_A(5'h1a)] <= 6'h00;
        palette_ram[`PRAM_A(5'h1b)] <= 6'h02;
        palette_ram[`PRAM_A(5'h1d)] <= 6'h20;
        palette_ram[`PRAM_A(5'h1e)] <= 6'h2c;
        palette_ram[`PRAM_A(5'h1f)] <= 6'h08;
      end
    else if (ri_pram_wr)
      palette_ram[`PRAM_A(vram_a_out[4:0])] <= ri_vram_dout[5:0];
  end

assign ri_vram_din = vram_d_in;
assign ri_pram_din = palette_ram[`PRAM_A(vram_a_out[4:0])];

assign vram_a_out  = (spr_vram_req) ? spr_vram_a : bg_vram_a;
assign vram_d_out  = ri_vram_dout;
assign vram_wr_out = ri_vram_wr;

//
// Multiplexer.  Final system palette index derivation.
//
reg  q_pri_obj_col;
wire d_pri_obj_col;

always @(posedge clk_in)
  begin
    if (rst_in)
      q_pri_obj_col <= 1'b0;
    else
      q_pri_obj_col <= d_pri_obj_col;
  end

wire spr_foreground;
wire spr_trans;
wire bg_trans;

assign spr_foreground  = ~spr_priority;
assign spr_trans       = ~|spr_palette_idx[1:0];
assign bg_trans        = ~|bg_palette_idx[1:0];

assign d_pri_obj_col = (gen_nes_y_next == 0)                    ? 1'b0 :
                       (spr_primary && !spr_trans && !bg_trans) ? 1'b1 : q_pri_obj_col;

assign sys_palette_idx =
  ((spr_foreground || bg_trans) && !spr_trans) ? palette_ram[{ 1'b1, spr_palette_idx }] :
  (!bg_trans)                                  ? palette_ram[{ 1'b0, bg_palette_idx }]  :
                                                 palette_ram[5'h00];

assign ri_spr_pri_col = q_pri_obj_col;

//
// Assign miscellaneous output signals.
//
assign nvbl_out = ~(ri_vblank & ri_nvbl_en);

endmodule

