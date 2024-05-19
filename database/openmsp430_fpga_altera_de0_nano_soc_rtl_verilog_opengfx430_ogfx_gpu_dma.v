// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2015 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: ogfx_gpu_dma.v
//
// *Module Description:
//                      Graphic-Processing unit 2D-DMA.
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$
// $LastChangedBy$
// $LastChangedDate$
//----------------------------------------------------------------------------
`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_defines.v"
`endif

module  ogfx_gpu_dma (

// OUTPUTs
    gpu_exec_done_o,                              // GPU execution done
    gpu_dma_busy_o,                               // GPU DMA execution on going

    vid_ram_addr_o,                               // Video-RAM address
    vid_ram_din_o,                                // Video-RAM data
    vid_ram_wen_o,                                // Video-RAM write strobe (active low)
    vid_ram_cen_o,                                // Video-RAM chip enable (active low)

// INPUTs
    mclk,                                         // Main system clock
    puc_rst,                                      // Main system reset

    cfg_dst_px_addr_i,                            // Destination pixel address configuration
    cfg_dst_cl_swp_i,                             // Destination Column/Line-Swap configuration
    cfg_dst_x_swp_i,                              // Destination X-Swap configuration
    cfg_dst_y_swp_i,                              // Destination Y-Swap configuration
    cfg_fill_color_i,                             // Fill color (for rectangle fill operation)
    cfg_pix_op_sel_i,                             // Pixel operation to be performed during the copy
    cfg_rec_width_i,                              // Rectangle width configuration
    cfg_rec_height_i,                             // Rectangle height configuration
    cfg_src_px_addr_i,                            // Source pixel address configuration
    cfg_src_cl_swp_i,                             // Source Column/Line-Swap configuration
    cfg_src_x_swp_i,                              // Source X-Swap configuration
    cfg_src_y_swp_i,                              // Source Y-Swap configuration
    cfg_transparent_color_i,                      // Transparent color (for rectangle transparent copy operation)

    display_width_i,                              // Display width

    gfx_mode_i,                                   // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    gpu_enable_i,                                 // GPU enable

    exec_fill_i,                                  // Rectangle fill on going
    exec_copy_i,                                  // Rectangle copy on going
    exec_copy_trans_i,                            // Rectangle transparent copy on going
    trig_exec_i,                                  // Trigger rectangle execution

    vid_ram_dout_i,                               // Video-RAM data input
    vid_ram_dout_rdy_nxt_i                        // Video-RAM data output ready during next cycle
);

// OUTPUTs
//=========
output                 gpu_exec_done_o;           // GPU execution done
output                 gpu_dma_busy_o;            // GPU DMA execution on going

output   [`VRAM_MSB:0] vid_ram_addr_o;            // Video-RAM address
output          [15:0] vid_ram_din_o;             // Video-RAM data
output                 vid_ram_wen_o;             // Video-RAM write strobe (active low)
output                 vid_ram_cen_o;             // Video-RAM chip enable (active low)

// INPUTs
//=========
input                  mclk;                      // Main system clock
input                  puc_rst;                   // Main system reset

input    [`APIX_MSB:0] cfg_dst_px_addr_i;         // Destination pixel address configuration
input                  cfg_dst_cl_swp_i;          // Destination Column/Line-Swap configuration
input                  cfg_dst_x_swp_i;           // Destination X-Swap configuration
input                  cfg_dst_y_swp_i;           // Destination Y-Swap configuration
input           [15:0] cfg_fill_color_i;          // Fill color (for rectangle fill operation)
input            [3:0] cfg_pix_op_sel_i;          // Pixel operation to be performed during the copy
input    [`LPIX_MSB:0] cfg_rec_width_i;           // Rectangle width configuration
input    [`LPIX_MSB:0] cfg_rec_height_i;          // Rectangle height configuration
input    [`APIX_MSB:0] cfg_src_px_addr_i;         // Source pixel address configuration
input                  cfg_src_cl_swp_i;          // Source Column/Line-Swap configuration
input                  cfg_src_x_swp_i;           // Source X-Swap configuration
input                  cfg_src_y_swp_i;           // Source Y-Swap configuration
input           [15:0] cfg_transparent_color_i;   // Transparent color (for rectangle transparent copy operation)

input    [`LPIX_MSB:0] display_width_i;           // Display width

input            [2:0] gfx_mode_i;                // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

input                  gpu_enable_i;              // GPU enable

input                  exec_fill_i;               // Rectangle fill on going
input                  exec_copy_i;               // Rectangle copy on going
input                  exec_copy_trans_i;         // Rectangle transparent copy on going
input                  trig_exec_i;               // Trigger rectangle execution

input           [15:0] vid_ram_dout_i;            // Video-RAM data input
input                  vid_ram_dout_rdy_nxt_i;    // Video-RAM data output ready during next cycle


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// Video modes decoding
wire       gfx_mode_1_bpp    =  (gfx_mode_i == 3'b000);
wire       gfx_mode_2_bpp    =  (gfx_mode_i == 3'b001);
wire       gfx_mode_4_bpp    =  (gfx_mode_i == 3'b010);
wire       gfx_mode_8_bpp    =  (gfx_mode_i == 3'b011);
wire       gfx_mode_16_bpp   = ~(gfx_mode_8_bpp | gfx_mode_4_bpp | gfx_mode_2_bpp | gfx_mode_1_bpp);


// Pixel operation decoding
wire       pix_op_00         =  (cfg_pix_op_sel_i == 4'b0000);  // S
wire       pix_op_01         =  (cfg_pix_op_sel_i == 4'b0001);  // not S
wire       pix_op_02         =  (cfg_pix_op_sel_i == 4'b0010);  // not D

wire       pix_op_03         =  (cfg_pix_op_sel_i == 4'b0011);  // S and D
wire       pix_op_04         =  (cfg_pix_op_sel_i == 4'b0100);  // S or  D
wire       pix_op_05         =  (cfg_pix_op_sel_i == 4'b0101);  // S xor D

wire       pix_op_06         =  (cfg_pix_op_sel_i == 4'b0110);  // not (S and D)
wire       pix_op_07         =  (cfg_pix_op_sel_i == 4'b0111);  // not (S or  D)
wire       pix_op_08         =  (cfg_pix_op_sel_i == 4'b1000);  // not (S xor D)

wire       pix_op_09         =  (cfg_pix_op_sel_i == 4'b1001);  // (not S) and      D
wire       pix_op_10         =  (cfg_pix_op_sel_i == 4'b1010);  //      S  and (not D)
wire       pix_op_11         =  (cfg_pix_op_sel_i == 4'b1011);  // (not S) or       D
wire       pix_op_12         =  (cfg_pix_op_sel_i == 4'b1100);  //      S  or  (not D)

wire       pix_op_13         =  (cfg_pix_op_sel_i == 4'b1101);  // Fill 0            if S not transparent
wire       pix_op_14         =  (cfg_pix_op_sel_i == 4'b1110);  // Fill 1            if S not transparent
wire       pix_op_15         =  (cfg_pix_op_sel_i == 4'b1111);  // Fill 'fill_color' if S not transparent

wire       dma_done;
wire       pixel_is_transparent;

// 16 bits one-hot decoder
function [15:0] one_hot16;
   input  [3:0] binary;
   begin
      one_hot16         = 16'h0000;
      one_hot16[binary] =  1'b1;
   end
endfunction


//=============================================================================
// 2)  DMA STATE MACHINE
//=============================================================================

// State definition
parameter  IDLE           = 3'h0;
parameter  INIT           = 3'h1;
parameter  SKIP           = 3'h2;
parameter  SRC_READ       = 3'h3;
parameter  DST_READ       = 3'h4;
parameter  DST_WRITE      = 3'h5;

// State machine
reg  [2:0] dma_state;
reg  [2:0] dma_state_nxt;

// State arcs
wire       needs_src_read    = (exec_copy_i & ~pix_op_02) | exec_copy_trans_i;
wire       needs_dst_read    = (exec_fill_i | exec_copy_trans_i | exec_copy_i) & (~(pix_op_00 | pix_op_01 | pix_op_13 | pix_op_14 | pix_op_15) | ~gfx_mode_16_bpp);
wire       needs_dst_write   = (exec_fill_i | exec_copy_trans_i | exec_copy_i) &  ~pixel_is_transparent;

wire       data_ready_nxt    =   (dma_state==SRC_READ) |
                               (((dma_state==DST_READ) |
                                 (dma_state==DST_WRITE)) & ~pixel_is_transparent) ? vid_ram_dout_rdy_nxt_i : 1'b1;

// State transition
always @(dma_state or trig_exec_i or needs_src_read or needs_dst_read or data_ready_nxt or dma_done or needs_dst_write)
  case (dma_state)
    IDLE           : dma_state_nxt = ~trig_exec_i       ?  IDLE	     :	INIT      ;

    INIT	   : dma_state_nxt =  needs_src_read	?  SRC_READ  :
				      needs_dst_read	?  DST_READ  :
				      needs_dst_write   ?  DST_WRITE :  SKIP      ;

    SKIP           : dma_state_nxt =  dma_done          ?  IDLE      :  SKIP      ;

    SRC_READ       : dma_state_nxt = ~data_ready_nxt    ?  SRC_READ  :
                                      needs_dst_read    ?  DST_READ  :  DST_WRITE ;

    DST_READ       : dma_state_nxt = ~data_ready_nxt    ?  DST_READ  :
                                      needs_dst_write   ?  DST_WRITE :
                                      dma_done          ?  IDLE      :  SRC_READ  ;

    DST_WRITE      : dma_state_nxt = ~data_ready_nxt    ?  DST_WRITE :
                                      dma_done          ?  IDLE      :
                                      needs_src_read    ?  SRC_READ  :
                                      needs_dst_read    ?  DST_READ  :  DST_WRITE ;
  // pragma coverage off
    default        : dma_state_nxt =  IDLE;
  // pragma coverage on
  endcase

// State machine
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)            dma_state <= IDLE;
  else if (~gpu_enable_i) dma_state <= IDLE;
  else                    dma_state <= dma_state_nxt;


// Utility signals
wire   dma_init        = (dma_state==INIT);
wire   dma_pixel_done  = (dma_state==SKIP) | ((dma_state==DST_READ)  & pixel_is_transparent) |
                                             ((dma_state==DST_WRITE) & data_ready_nxt      ) ;
assign gpu_exec_done_o = (dma_state==IDLE) & ~trig_exec_i;
assign gpu_dma_busy_o  = (dma_state!=IDLE);


//=============================================================================
// 3)  COUNT TRANSFERS
//=============================================================================
reg [`LPIX_MSB:0] height_cnt;
wire              height_cnt_done;
reg [`LPIX_MSB:0] width_cnt;
wire              width_cnt_done;

// Height Counter
wire              height_cnt_init = dma_init;
wire              height_cnt_dec  = dma_pixel_done & width_cnt_done & ~height_cnt_done;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)              height_cnt <= {{`LPIX_MSB{1'h0}},1'b1};
  else if (height_cnt_init) height_cnt <= cfg_rec_height_i;
  else if (height_cnt_dec)  height_cnt <= height_cnt-{{`LPIX_MSB{1'h0}},1'b1};

assign                      height_cnt_done = (height_cnt=={{`LPIX_MSB{1'h0}}, 1'b1});

// Width Counter
wire              width_cnt_init = dma_init | height_cnt_dec;
wire              width_cnt_dec  = dma_pixel_done & ~width_cnt_done;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)              width_cnt <= {{`LPIX_MSB{1'h0}},1'b1};
  else if (width_cnt_init)  width_cnt <= cfg_rec_width_i;
  else if (width_cnt_dec)   width_cnt <= width_cnt-{{`LPIX_MSB{1'h0}},1'b1};

assign            width_cnt_done = (width_cnt=={{`LPIX_MSB{1'h0}}, 1'b1});

// DMA Transfer is done when both counters are done
assign            dma_done       = height_cnt_done & width_cnt_done;


//=============================================================================
// 4)  SOURCE ADDRESS GENERATION
//=============================================================================

reg  [`APIX_MSB:0] vram_src_addr;
wire [`APIX_MSB:0] vram_src_addr_calc;

wire               vram_src_addr_inc  = dma_pixel_done & needs_src_read;
wire [`APIX_MSB:0] vram_src_addr_nxt  = trig_exec_i ? cfg_src_px_addr_i : vram_src_addr_calc;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                              vram_src_addr <=  {`APIX_MSB+1{1'b0}};
  else if (trig_exec_i | vram_src_addr_inc) vram_src_addr <=  vram_src_addr_nxt;


// Compute the next address
ogfx_gpu_dma_addr ogfx_gpu_dma_src_addr_inst (

// OUTPUTs
    .vid_ram_addr_nxt_o      ( vram_src_addr_calc      ),   // Next Video-RAM address

// INPUTs
    .mclk                    ( mclk                    ),   // Main system clock
    .puc_rst                 ( puc_rst                 ),   // Main system reset
    .display_width_i         ( display_width_i         ),   // Display width
    .gfx_mode_1_bpp_i        ( gfx_mode_1_bpp          ),   // Graphic mode  1 bpp resolution
    .gfx_mode_2_bpp_i        ( gfx_mode_2_bpp          ),   // Graphic mode  2 bpp resolution
    .gfx_mode_4_bpp_i        ( gfx_mode_4_bpp          ),   // Graphic mode  4 bpp resolution
    .gfx_mode_8_bpp_i        ( gfx_mode_8_bpp          ),   // Graphic mode  8 bpp resolution
    .gfx_mode_16_bpp_i       ( gfx_mode_16_bpp         ),   // Graphic mode 16 bpp resolution
    .vid_ram_addr_i          ( vram_src_addr           ),   // Video-RAM address
    .vid_ram_addr_init_i     ( dma_init                ),   // Video-RAM address initialization
    .vid_ram_addr_step_i     ( vram_src_addr_inc       ),   // Video-RAM address step
    .vid_ram_width_i         ( cfg_rec_width_i         ),   // Video-RAM width
    .vid_ram_win_x_swap_i    ( cfg_src_x_swp_i         ),   // Video-RAM X-Swap configuration
    .vid_ram_win_y_swap_i    ( cfg_src_y_swp_i         ),   // Video-RAM Y-Swap configuration
    .vid_ram_win_cl_swap_i   ( cfg_src_cl_swp_i        )    // Video-RAM CL-Swap configuration
);

//=============================================================================
// 5)  SOURCE DATA MASK
//=============================================================================

reg  [15:0] vram_src_mask;
wire [15:0] vram_src_mask_shift    = one_hot16(vram_src_addr_nxt[3:0]);
wire [15:0] vram_src_mask_vram_nxt = ({16{gfx_mode_1_bpp }} &     vram_src_mask_shift       ) |
                                     ({16{gfx_mode_2_bpp }} & {{2{vram_src_mask_shift[14]}},
                                                               {2{vram_src_mask_shift[12]}},
                                                               {2{vram_src_mask_shift[10]}},
                                                               {2{vram_src_mask_shift[8] }},
                                                               {2{vram_src_mask_shift[6] }},
                                                               {2{vram_src_mask_shift[4] }},
                                                               {2{vram_src_mask_shift[2] }},
                                                               {2{vram_src_mask_shift[0] }}}) |
                                     ({16{gfx_mode_4_bpp }} & {{4{vram_src_mask_shift[12]}},
                                                               {4{vram_src_mask_shift[8] }},
                                                               {4{vram_src_mask_shift[4] }},
                                                               {4{vram_src_mask_shift[0] }}}) |
                                     ({16{gfx_mode_8_bpp }} & {{8{vram_src_mask_shift[8] }},
                                                               {8{vram_src_mask_shift[0] }}}) |
                                     ({16{gfx_mode_16_bpp}} & {16{1'b1}}                    ) ;

wire [15:0] vram_src_mask_fill_nxt = ({16{gfx_mode_1_bpp }} &  16'h0001) |
                                     ({16{gfx_mode_2_bpp }} &  16'h0003) |
                                     ({16{gfx_mode_4_bpp }} &  16'h000f) |
                                     ({16{gfx_mode_8_bpp }} &  16'h00ff) |
                                     ({16{gfx_mode_16_bpp}} &  16'hffff) ;

wire [15:0] vram_src_mask_nxt      = exec_fill_i ? vram_src_mask_fill_nxt :
                                                   vram_src_mask_vram_nxt ;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                               vram_src_mask <=  16'h0000;
  else if (trig_exec_i | vram_src_addr_inc)  vram_src_mask <=  vram_src_mask_nxt;


//=============================================================================
// 6)  DESTINATION ADDRESS GENERATION
//=============================================================================

reg  [`APIX_MSB:0] vram_dst_addr;
wire [`APIX_MSB:0] vram_dst_addr_calc;

wire               vram_dst_addr_inc  = dma_pixel_done;
wire [`APIX_MSB:0] vram_dst_addr_nxt  = trig_exec_i ? cfg_dst_px_addr_i : vram_dst_addr_calc;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                              vram_dst_addr <=  {`APIX_MSB+1{1'b0}};
  else if (trig_exec_i | vram_dst_addr_inc) vram_dst_addr <=  vram_dst_addr_nxt;


// Compute the next address
ogfx_gpu_dma_addr ogfx_gpu_dma_dst_addr_inst (

// OUTPUTs
    .vid_ram_addr_nxt_o      ( vram_dst_addr_calc      ),   // Next Video-RAM address

// INPUTs
    .mclk                    ( mclk                    ),   // Main system clock
    .puc_rst                 ( puc_rst                 ),   // Main system reset
    .display_width_i         ( display_width_i         ),   // Display width
    .gfx_mode_1_bpp_i        ( gfx_mode_1_bpp          ),   // Graphic mode  1 bpp resolution
    .gfx_mode_2_bpp_i        ( gfx_mode_2_bpp          ),   // Graphic mode  2 bpp resolution
    .gfx_mode_4_bpp_i        ( gfx_mode_4_bpp          ),   // Graphic mode  4 bpp resolution
    .gfx_mode_8_bpp_i        ( gfx_mode_8_bpp          ),   // Graphic mode  8 bpp resolution
    .gfx_mode_16_bpp_i       ( gfx_mode_16_bpp         ),   // Graphic mode 16 bpp resolution
    .vid_ram_addr_i          ( vram_dst_addr           ),   // Video-RAM address
    .vid_ram_addr_init_i     ( dma_init                ),   // Video-RAM address initialization
    .vid_ram_addr_step_i     ( vram_dst_addr_inc       ),   // Video-RAM address step
    .vid_ram_width_i         ( cfg_rec_width_i         ),   // Video-RAM width
    .vid_ram_win_x_swap_i    ( cfg_dst_x_swp_i         ),   // Video-RAM X-Swap configuration
    .vid_ram_win_y_swap_i    ( cfg_dst_y_swp_i         ),   // Video-RAM Y-Swap configuration
    .vid_ram_win_cl_swap_i   ( cfg_dst_cl_swp_i        )    // Video-RAM CL-Swap configuration
);

//=============================================================================
// 7)  DESTINATION DATA MASK
//=============================================================================

reg  [15:0] vram_dst_mask;
wire [15:0] vram_dst_mask_shift = one_hot16(vram_dst_addr_nxt[3:0]);
wire [15:0] vram_dst_mask_nxt   = ({16{gfx_mode_1_bpp }} &     vram_dst_mask_shift       ) |
                                  ({16{gfx_mode_2_bpp }} & {{2{vram_dst_mask_shift[14]}},
                                                            {2{vram_dst_mask_shift[12]}},
                                                            {2{vram_dst_mask_shift[10]}},
                                                            {2{vram_dst_mask_shift[8] }},
                                                            {2{vram_dst_mask_shift[6] }},
                                                            {2{vram_dst_mask_shift[4] }},
                                                            {2{vram_dst_mask_shift[2] }},
                                                            {2{vram_dst_mask_shift[0] }}}) |
                                  ({16{gfx_mode_4_bpp }} & {{4{vram_dst_mask_shift[12]}},
                                                            {4{vram_dst_mask_shift[8] }},
                                                            {4{vram_dst_mask_shift[4] }},
                                                            {4{vram_dst_mask_shift[0] }}}) |
                                  ({16{gfx_mode_8_bpp }} & {{8{vram_dst_mask_shift[8] }},
                                                            {8{vram_dst_mask_shift[0] }}}) |
                                  ({16{gfx_mode_16_bpp}} & {16{1'b1}}                    ) ;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                               vram_dst_mask <=  16'h0000;
  else if (trig_exec_i | vram_dst_addr_inc)  vram_dst_mask <=  vram_dst_mask_nxt;


//=============================================================================
// 8)  VIDEO-MEMORY INTERFACE
//=============================================================================

//--------------------------
// Source data
//--------------------------

// Align source data to destination for lower resolution
wire [15:0] src_data_mask        = ((exec_fill_i ? cfg_fill_color_i : vid_ram_dout_i) & vram_src_mask);
wire        src_data_mask_1_bpp  =  (|src_data_mask);
wire  [1:0] src_data_mask_2_bpp  = {(|{src_data_mask[15], src_data_mask[13], src_data_mask[11], src_data_mask[9], src_data_mask[7], src_data_mask[5], src_data_mask[3], src_data_mask[1]}),
                                    (|{src_data_mask[14], src_data_mask[12], src_data_mask[10], src_data_mask[8], src_data_mask[6], src_data_mask[4], src_data_mask[2], src_data_mask[0]})};
wire  [3:0] src_data_mask_4_bpp  = {(|{src_data_mask[15], src_data_mask[11], src_data_mask[7] , src_data_mask[3]}),
                                    (|{src_data_mask[14], src_data_mask[10], src_data_mask[6] , src_data_mask[2]}),
                                    (|{src_data_mask[13], src_data_mask[9] , src_data_mask[5] , src_data_mask[1]}),
                                    (|{src_data_mask[12], src_data_mask[8] , src_data_mask[4] , src_data_mask[0]})};
wire  [7:0] src_data_mask_8_bpp  = {(|{src_data_mask[15], src_data_mask[7]}),
                                    (|{src_data_mask[14], src_data_mask[6]}),
                                    (|{src_data_mask[13], src_data_mask[5]}),
                                    (|{src_data_mask[12], src_data_mask[4]}),
                                    (|{src_data_mask[11], src_data_mask[3]}),
                                    (|{src_data_mask[10], src_data_mask[2]}),
                                    (|{src_data_mask[9] , src_data_mask[1]}),
                                    (|{src_data_mask[8] , src_data_mask[0]})};
wire [15:0] src_data_mask_16_bpp =     src_data_mask;

wire [15:0] src_data_align       =  ({16{gfx_mode_1_bpp }} & {16{src_data_mask_1_bpp}}) |
                                    ({16{gfx_mode_2_bpp }} &  {8{src_data_mask_2_bpp}}) |
                                    ({16{gfx_mode_4_bpp }} &  {4{src_data_mask_4_bpp}}) |
                                    ({16{gfx_mode_8_bpp }} &  {2{src_data_mask_8_bpp}}) |
                                    ({16{gfx_mode_16_bpp}} &     src_data_mask_16_bpp ) ;

// Detect read accesses
reg         src_data_ready;
wire        src_data_ready_nxt = ((dma_state==SRC_READ) & data_ready_nxt) | (exec_fill_i & dma_init);
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) src_data_ready <=  1'b0;
  else         src_data_ready <=  src_data_ready_nxt;

// Read data buffer
reg  [15:0] src_data_buf;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)              src_data_buf <=  16'h0000;
  else if (src_data_ready)  src_data_buf <=  src_data_align;

// Source data
wire [15:0] src_data =  src_data_ready ? src_data_align : src_data_buf;

//--------------------------
// Destination data
//--------------------------

// Detect read access
reg         dst_data_ready;
wire        dst_data_ready_nxt = ((dma_state==DST_READ) & data_ready_nxt);
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) dst_data_ready <=  1'b0;
  else         dst_data_ready <=  dst_data_ready_nxt;

// Read data buffer
reg  [15:0] dst_data_buf;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)              dst_data_buf <=  16'h0000;
  else if (dst_data_ready)  dst_data_buf <=  vid_ram_dout_i;

// Source data
wire [15:0] dst_data =  dst_data_ready ? vid_ram_dout_i : dst_data_buf;

//--------------------------
// Detect transparency
//--------------------------
wire [15:0] transparent_color_align  = ({16{gfx_mode_1_bpp }} & {16{cfg_transparent_color_i[0]  }}) |
                                       ({16{gfx_mode_2_bpp }} &  {8{cfg_transparent_color_i[1:0]}}) |
                                       ({16{gfx_mode_4_bpp }} &  {4{cfg_transparent_color_i[3:0]}}) |
                                       ({16{gfx_mode_8_bpp }} &  {2{cfg_transparent_color_i[7:0]}}) |
                                       ({16{gfx_mode_16_bpp}} &     cfg_transparent_color_i       ) ;

wire        pixel_is_transparent_nxt = ((exec_copy_trans_i & src_data_ready                                      ) |
                                        (exec_copy_i       & src_data_ready & (pix_op_13 | pix_op_14 | pix_op_15)) |
                                        (exec_fill_i       &                  (pix_op_13 | pix_op_14 | pix_op_15)) ) & (src_data_align==transparent_color_align);
reg         pixel_is_transparent_reg;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                                 pixel_is_transparent_reg <=  1'b0;
  else if (dma_pixel_done | (dma_state==IDLE)) pixel_is_transparent_reg <=  1'b0;
  else if (pixel_is_transparent_nxt)           pixel_is_transparent_reg <=  1'b1;

assign      pixel_is_transparent     = (pixel_is_transparent_nxt | pixel_is_transparent_reg);

//--------------------------
// Pixel operation
//--------------------------
wire [15:0] fill_color_align         = ({16{gfx_mode_1_bpp }} & {16{cfg_fill_color_i[0]  }}) |
                                       ({16{gfx_mode_2_bpp }} &  {8{cfg_fill_color_i[1:0]}}) |
                                       ({16{gfx_mode_4_bpp }} &  {4{cfg_fill_color_i[3:0]}}) |
                                       ({16{gfx_mode_8_bpp }} &  {2{cfg_fill_color_i[7:0]}}) |
                                       ({16{gfx_mode_16_bpp}} &     cfg_fill_color_i       ) ;

wire [15:0] pixel_data               = ({16{pix_op_00}} &  ( src_data             )) |  // S
                                       ({16{pix_op_01}} &  (~src_data             )) |  // not S
                                       ({16{pix_op_02}} &  (             ~dst_data)) |  // not D

                                       ({16{pix_op_03}} &  ( src_data  &  dst_data)) |  // S and D
                                       ({16{pix_op_04}} &  ( src_data  |  dst_data)) |  // S or  D
                                       ({16{pix_op_05}} &  ( src_data  ^  dst_data)) |  // S xor D

                                       ({16{pix_op_06}} & ~( src_data  &  dst_data)) |  // not (S and D)
                                       ({16{pix_op_07}} & ~( src_data  |  dst_data)) |  // not (S or  D)
                                       ({16{pix_op_08}} & ~( src_data  ^  dst_data)) |  // not (S xor D)

                                       ({16{pix_op_09}} &  (~src_data  &  dst_data)) |  // (not S) and      D
                                       ({16{pix_op_10}} &  ( src_data  & ~dst_data)) |  //      S  and (not D)
                                       ({16{pix_op_11}} &  (~src_data  |  dst_data)) |  // (not S) or       D
                                       ({16{pix_op_12}} &  ( src_data  | ~dst_data)) |  //      S  or  (not D)

                                       ({16{pix_op_13}} &  ( 16'h0000             )) |  // Fill 0 if S not transparent
                                       ({16{pix_op_14}} &  ( 16'hffff             )) |  // Fill 1 if S not transparent
                                       ({16{pix_op_15}} &  ( fill_color_align     )) ;  // Fill 'fill_color' if S not transparent



// RAM interface
assign      vid_ram_din_o  =  (pixel_data & vram_dst_mask) | (dst_data & ~vram_dst_mask);

assign      vid_ram_addr_o =  (dma_state==SRC_READ) ? vram_src_addr[`APIX_MSB:4] :
                                                      vram_dst_addr[`APIX_MSB:4] ;

assign      vid_ram_wen_o  = ~( (dma_state==DST_WRITE) & ~pixel_is_transparent) ;

assign      vid_ram_cen_o  = ~( (dma_state==SRC_READ)                           |
                               ((dma_state==DST_READ)  & ~pixel_is_transparent) |
                               ((dma_state==DST_WRITE) & ~pixel_is_transparent));


endmodule // ogfx_gpu_dma

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
