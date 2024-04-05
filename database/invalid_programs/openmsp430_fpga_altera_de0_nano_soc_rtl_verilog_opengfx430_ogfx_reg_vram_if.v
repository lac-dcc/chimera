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
// *File Name: ogfx_reg_vram_if.v
//
// *Module Description:
//                      Video-RAM Registers interface.
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

module  ogfx_reg_vram_if (

// OUTPUTs
    vid_ram_cfg_o,                             // VID_RAMx_CFG     Register
    vid_ram_width_o,                           // VID_RAMx_WIDTH   Register
`ifdef VRAM_BIGGER_4_KW
    vid_ram_addr_hi_o,                         // VID_RAMx_ADDR_HI Register
`endif
    vid_ram_addr_lo_o,                         // VID_RAMx_ADDR_LO Register
    vid_ram_data_o,                            // VID_RAMx_DATA    Register

    vid_ram_we_o,                              // Video-RAM Write strobe
    vid_ram_ce_o,                              // Video-RAM Chip enable
    vid_ram_din_o,                             // Video-RAM Data input
    vid_ram_addr_nxt_o,                        // Video-RAM Next address
    vid_ram_access_o,                          // Video-RAM Access

// INPUTs
    mclk,                                      // Main system clock
    puc_rst,                                   // Main system reset

    vid_ram_cfg_wr_i,                          // VID_RAMx_CFG     Write strobe
    vid_ram_width_wr_i,                        // VID_RAMx_WIDTH   Write strobe
    vid_ram_addr_hi_wr_i,                      // VID_RAMx_ADDR_HI Write strobe
    vid_ram_addr_lo_wr_i,                      // VID_RAMx_ADDR_LO Write strobe
    vid_ram_data_wr_i,                         // VID_RAMx_DATA    Write strobe
    vid_ram_data_rd_i,                         // VID_RAMx_DATA    Read  strobe

    dbg_freeze_i,                              // Freeze auto-increment on read when CPU stopped
    display_width_i,                           // Display width
    gfx_mode_1_bpp_i,                          // Graphic mode  1 bpp resolution
    gfx_mode_2_bpp_i,                          // Graphic mode  2 bpp resolution
    gfx_mode_4_bpp_i,                          // Graphic mode  4 bpp resolution
    gfx_mode_8_bpp_i,                          // Graphic mode  8 bpp resolution
    gfx_mode_16_bpp_i,                         // Graphic mode 16 bpp resolution

    per_din_i,                                 // Peripheral data input
    vid_ram_base_addr_i,                       // Video-RAM base address
    vid_ram_dout_i                             // Video-RAM data input
);

// OUTPUTs
//=========
output        [15:0] vid_ram_cfg_o;            // VID_RAMx_CFG     Register
output        [15:0] vid_ram_width_o;          // VID_RAMx_WIDTH   Register
`ifdef VRAM_BIGGER_4_KW
output        [15:0] vid_ram_addr_hi_o;        // VID_RAMx_ADDR_HI Register
`endif
output        [15:0] vid_ram_addr_lo_o;        // VID_RAMx_ADDR_LO Register
output        [15:0] vid_ram_data_o;           // VID_RAMx_DATA    Register

output               vid_ram_we_o;             // Video-RAM Write strobe
output               vid_ram_ce_o;             // Video-RAM Chip enable
output        [15:0] vid_ram_din_o;            // Video-RAM Data input
output [`APIX_MSB:0] vid_ram_addr_nxt_o;       // Video-RAM Next address
output               vid_ram_access_o;         // Video-RAM Access

// INPUTs
//=========
input                mclk;                     // Main system clock
input                puc_rst;                  // Main system reset

input                vid_ram_cfg_wr_i;         // VID_RAMx_CFG     Write strobe
input                vid_ram_width_wr_i;       // VID_RAMx_WIDTH   Write strobe
input                vid_ram_addr_hi_wr_i;     // VID_RAMx_ADDR_HI Write strobe
input                vid_ram_addr_lo_wr_i;     // VID_RAMx_ADDR_LO Write strobe
input                vid_ram_data_wr_i;        // VID_RAMx_DATA    Write strobe
input                vid_ram_data_rd_i;        // VID_RAMx_DATA    Read  strobe

input                dbg_freeze_i;             // Freeze auto-increment on read when CPU stopped
input  [`LPIX_MSB:0] display_width_i;          // Display width
input                gfx_mode_1_bpp_i;         // Graphic mode  1 bpp resolution
input                gfx_mode_2_bpp_i;         // Graphic mode  2 bpp resolution
input                gfx_mode_4_bpp_i;         // Graphic mode  4 bpp resolution
input                gfx_mode_8_bpp_i;         // Graphic mode  8 bpp resolution
input                gfx_mode_16_bpp_i;        // Graphic mode 16 bpp resolution

input         [15:0] per_din_i;                // Peripheral data input
input  [`APIX_MSB:0] vid_ram_base_addr_i;      // Video-RAM base address
input         [15:0] vid_ram_dout_i;           // Video-RAM data input


//=============================================================================
// 1)  WIRE AND FUNCTION DECLARATIONS
//=============================================================================

// 16 bits one-hot decoder
function [15:0] one_hot16;
   input  [3:0] binary;
   begin
      one_hot16         = 16'h0000;
      one_hot16[binary] =  1'b1;
   end
endfunction



//============================================================================
// 2) REGISTERS
//============================================================================

//------------------------------------------------
// VID_RAMx_CFG Register
//------------------------------------------------
reg                vid_ram_rmw_mode;
reg                vid_ram_msk_mode;
reg                vid_ram_win_mode;
reg                vid_ram_win_x_swap;
reg                vid_ram_win_y_swap;
reg                vid_ram_win_cl_swap;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       vid_ram_win_cl_swap  <=  1'b0;
       vid_ram_win_y_swap   <=  1'b0;
       vid_ram_win_x_swap   <=  1'b0;
       vid_ram_rmw_mode     <=  1'b0;
       vid_ram_msk_mode     <=  1'b0;
       vid_ram_win_mode     <=  1'b0;
    end
  else if (vid_ram_cfg_wr_i)
    begin
       vid_ram_win_cl_swap  <=  per_din_i[0];
       vid_ram_win_y_swap   <=  per_din_i[1];
       vid_ram_win_x_swap   <=  per_din_i[2];
       vid_ram_rmw_mode     <=  per_din_i[4];
       vid_ram_msk_mode     <=  per_din_i[5];
       vid_ram_win_mode     <=  per_din_i[6];
    end

assign vid_ram_cfg_o  = {8'h00, 1'b0,  vid_ram_win_mode,   vid_ram_msk_mode,   vid_ram_rmw_mode   ,
                                1'b0,  vid_ram_win_x_swap, vid_ram_win_y_swap, vid_ram_win_cl_swap};

//------------------------------------------------
// VID_RAMx_WIDTH Register
//------------------------------------------------
reg  [`LPIX_MSB:0] vid_ram_width;

// width must be at least 1
wire [`LPIX_MSB:0] vid_ram_width_nxt  = (|per_din_i[`LPIX_MSB:0]) ? per_din_i[`LPIX_MSB:0] : {{`LPIX_MSB{1'b0}}, 1'b1};

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                 vid_ram_width   <=  {{`LPIX_MSB{1'b0}}, 1'b1};
  else if (vid_ram_width_wr_i) vid_ram_width   <=  vid_ram_width_nxt;

wire [16:0] vid_ram_width_tmp = {{16-`LPIX_MSB{1'b0}}, vid_ram_width};
assign      vid_ram_width_o   = vid_ram_width_tmp[15:0];


//------------------------------------------------
// VID_RAMx_ADDR_HI Register
//------------------------------------------------
wire   [`APIX_MSB:0] vid_ram_addr;
wire   [`APIX_MSB:0] vid_ram_addr_inc;
wire                 vid_ram_addr_inc_wr;
reg                  vid_ram_addr_hi_wr_dly;

`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] vid_ram_addr_hi;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   vid_ram_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (vid_ram_addr_hi_wr_i) vid_ram_addr_hi <=  per_din_i[`APIX_HI_MSB:0];
  else if (vid_ram_addr_inc_wr)  vid_ram_addr_hi <=  vid_ram_addr_inc[`APIX_MSB:16];

wire [16:0] vid_ram_addr_hi_tmp = {{16-`APIX_HI_MSB{1'b0}},vid_ram_addr_hi};
assign      vid_ram_addr_hi_o   = vid_ram_addr_hi_tmp[15:0];
`endif

//------------------------------------------------
// VID_RAMx_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] vid_ram_addr_lo;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   vid_ram_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (vid_ram_addr_lo_wr_i) vid_ram_addr_lo <=  per_din_i[`APIX_LO_MSB:0];
  else if (vid_ram_addr_inc_wr)  vid_ram_addr_lo <=  vid_ram_addr_inc[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      vid_ram_addr        = {vid_ram_addr_hi[`APIX_HI_MSB:0], vid_ram_addr_lo};
assign      vid_ram_addr_lo_o   =  vid_ram_addr_lo;
`else
assign      vid_ram_addr        = {vid_ram_addr_lo[`APIX_LO_MSB:0]};
wire [16:0] vid_ram_addr_lo_tmp = {{16-`APIX_LO_MSB{1'b0}},vid_ram_addr_lo};
assign      vid_ram_addr_lo_o   = vid_ram_addr_lo_tmp[15:0];
`endif

// Compute the next address
ogfx_reg_vram_addr ogfx_reg_vram_addr_inst (

// OUTPUTs
    .vid_ram_addr_nxt_o      ( vid_ram_addr_inc       ),   // Next Video-RAM address

// INPUTs
    .mclk                    ( mclk                   ),   // Main system clock
    .puc_rst                 ( puc_rst                ),   // Main system reset
    .display_width_i         ( display_width_i        ),   // Display width
    .gfx_mode_1_bpp_i        ( gfx_mode_1_bpp_i       ),   // Graphic mode  1 bpp resolution
    .gfx_mode_2_bpp_i        ( gfx_mode_2_bpp_i       ),   // Graphic mode  2 bpp resolution
    .gfx_mode_4_bpp_i        ( gfx_mode_4_bpp_i       ),   // Graphic mode  4 bpp resolution
    .gfx_mode_8_bpp_i        ( gfx_mode_8_bpp_i       ),   // Graphic mode  8 bpp resolution
    .gfx_mode_16_bpp_i       ( gfx_mode_16_bpp_i      ),   // Graphic mode 16 bpp resolution
    .vid_ram_addr_i          ( vid_ram_addr           ),   // Video-RAM address
    .vid_ram_addr_init_i     ( vid_ram_addr_hi_wr_dly ),   // Video-RAM address initialization
    .vid_ram_addr_step_i     ( vid_ram_addr_inc_wr    ),   // Video-RAM address step
    .vid_ram_width_i         ( vid_ram_width          ),   // Video-RAM width
    .vid_ram_msk_mode_i      ( vid_ram_msk_mode       ),   // Video-RAM Mask mode enable
    .vid_ram_win_mode_i      ( vid_ram_win_mode       ),   // Video-RAM Windows mode enable
    .vid_ram_win_x_swap_i    ( vid_ram_win_x_swap     ),   // Video-RAM X-Swap configuration
    .vid_ram_win_y_swap_i    ( vid_ram_win_y_swap     ),   // Video-RAM Y-Swap configuration
    .vid_ram_win_cl_swap_i   ( vid_ram_win_cl_swap    )    // Video-RAM CL-Swap configuration
);


//------------------------------------------------
// VID_RAMx_DATA Register
//------------------------------------------------

// Format input data for masked mode
wire [15:0] per_din_mask_mode = (({16{gfx_mode_1_bpp_i  &  vid_ram_msk_mode }} & {16{per_din_i[0]  }}) |
                                 ({16{gfx_mode_2_bpp_i  &  vid_ram_msk_mode }} &  {8{per_din_i[1:0]}}) |
                                 ({16{gfx_mode_4_bpp_i  &  vid_ram_msk_mode }} &  {4{per_din_i[3:0]}}) |
                                 ({16{gfx_mode_8_bpp_i  &  vid_ram_msk_mode }} &  {2{per_din_i[7:0]}}) |
                                 ({16{gfx_mode_16_bpp_i | ~vid_ram_msk_mode }} &     per_din_i       ) );

// Prepare data to be written according to mask mode enable
reg  [15:0] vid_ram_data_mask;
wire [15:0] per_din_ram_nxt   = per_din_mask_mode & vid_ram_data_mask;

// VIDEO-RAM data Register
reg  [15:0] vid_ram_data;
wire [15:0] vid_ram_data_mux;
wire        vid_ram_dout_rdy;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                vid_ram_data <=  16'h0000;
  else if (vid_ram_data_wr_i) vid_ram_data <=  per_din_ram_nxt | (vid_ram_data_mux & ~vid_ram_data_mask);
  else if (vid_ram_dout_rdy)  vid_ram_data <=  vid_ram_dout_i;

// Make value available in case of early read
assign      vid_ram_data_mux            =  vid_ram_dout_rdy ? vid_ram_dout_i : vid_ram_data;

// Format read-path for mask mode
wire [15:0] vid_ram_data_rd_mask        =  vid_ram_data_mux & vid_ram_data_mask;
wire        vid_ram_data_rd_mask_1_bpp  =  (|vid_ram_data_rd_mask);
wire  [1:0] vid_ram_data_rd_mask_2_bpp  = {(|{vid_ram_data_rd_mask[15], vid_ram_data_rd_mask[13], vid_ram_data_rd_mask[11], vid_ram_data_rd_mask[9], vid_ram_data_rd_mask[7], vid_ram_data_rd_mask[5], vid_ram_data_rd_mask[3], vid_ram_data_rd_mask[1]}),
                                           (|{vid_ram_data_rd_mask[14], vid_ram_data_rd_mask[12], vid_ram_data_rd_mask[10], vid_ram_data_rd_mask[8], vid_ram_data_rd_mask[6], vid_ram_data_rd_mask[4], vid_ram_data_rd_mask[2], vid_ram_data_rd_mask[0]})};
wire  [3:0] vid_ram_data_rd_mask_4_bpp  = {(|{vid_ram_data_rd_mask[15], vid_ram_data_rd_mask[11], vid_ram_data_rd_mask[7] , vid_ram_data_rd_mask[3]}),
                                           (|{vid_ram_data_rd_mask[14], vid_ram_data_rd_mask[10], vid_ram_data_rd_mask[6] , vid_ram_data_rd_mask[2]}),
                                           (|{vid_ram_data_rd_mask[13], vid_ram_data_rd_mask[9] , vid_ram_data_rd_mask[5] , vid_ram_data_rd_mask[1]}),
                                           (|{vid_ram_data_rd_mask[12], vid_ram_data_rd_mask[8] , vid_ram_data_rd_mask[4] , vid_ram_data_rd_mask[0]})};
wire  [7:0] vid_ram_data_rd_mask_8_bpp  = {(|{vid_ram_data_rd_mask[15], vid_ram_data_rd_mask[7]}),
                                           (|{vid_ram_data_rd_mask[14], vid_ram_data_rd_mask[6]}),
                                           (|{vid_ram_data_rd_mask[13], vid_ram_data_rd_mask[5]}),
                                           (|{vid_ram_data_rd_mask[12], vid_ram_data_rd_mask[4]}),
                                           (|{vid_ram_data_rd_mask[11], vid_ram_data_rd_mask[3]}),
                                           (|{vid_ram_data_rd_mask[10], vid_ram_data_rd_mask[2]}),
                                           (|{vid_ram_data_rd_mask[9] , vid_ram_data_rd_mask[1]}),
                                           (|{vid_ram_data_rd_mask[8] , vid_ram_data_rd_mask[0]})};
wire [15:0] vid_ram_data_rd_mask_16_bpp =     vid_ram_data_rd_mask;

assign      vid_ram_data_o              =  ({16{gfx_mode_1_bpp_i  &  vid_ram_msk_mode }} & {{15{1'b0}},vid_ram_data_rd_mask_1_bpp}) |
                                           ({16{gfx_mode_2_bpp_i  &  vid_ram_msk_mode }} & {{14{1'b0}},vid_ram_data_rd_mask_2_bpp}) |
                                           ({16{gfx_mode_4_bpp_i  &  vid_ram_msk_mode }} & {{12{1'b0}},vid_ram_data_rd_mask_4_bpp}) |
                                           ({16{gfx_mode_8_bpp_i  &  vid_ram_msk_mode }} & { {8{1'b0}},vid_ram_data_rd_mask_8_bpp}) |
                                           ({16{gfx_mode_16_bpp_i | ~vid_ram_msk_mode }} &             vid_ram_data_rd_mask_16_bpp) ;


//============================================================================
// 3) VIDEO MEMORY INTERFACE
//============================================================================
//
// Trigger a VIDEO-RAM write access after:
//   - a VID_RAMx_DATA register write access
//
// Trigger a VIDEO-RAM read access immediately after:
//   - a VID_RAMx_ADDR_LO register write access
//   - a VID_RAMx_DATA register read access
//   - a VID_RAMx_DATA register write access in MSK mode (for resolutions lower than 16bpp)
//

//--------------------------------------------------
// VID_RAM0: Delay software read and write strobes
//--------------------------------------------------

// Strobe writing to VID_RAMx_ADDR_LO register
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_addr_hi_wr_dly  <= 1'b0;
  else         vid_ram_addr_hi_wr_dly  <= vid_ram_addr_hi_wr_i;

// Strobe reading from VID_RAMx_DATA register
reg        vid_ram_data_rd_dly;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_data_rd_dly     <= 1'b0;
  else         vid_ram_data_rd_dly     <= vid_ram_data_rd_i;

// Strobe writing to VID_RAMx_DATA register
reg        vid_ram_data_wr_dly;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_data_wr_dly     <= 1'b0;
  else         vid_ram_data_wr_dly     <= vid_ram_data_wr_i;

// Trigger read access after a write in MSK mode
wire       vid_ram_data_rd_msk   = ((vid_ram_data_wr_dly  | vid_ram_data_rd_dly | vid_ram_addr_hi_wr_i) & vid_ram_msk_mode & ~gfx_mode_16_bpp_i);


//------------------------------------------------
// Compute VIDEO-RAM Strobes & Data
//------------------------------------------------

// Write access strobe
//       - one cycle after a VID_RAM_DATA register write access
assign vid_ram_we_o     =  vid_ram_data_wr_dly;

// Chip enable.
// Note: we perform a data read access:
//       - one cycle after a VID_RAM_DATA register read access (so that the address has been incremented)
//       - one cycle after a VID_RAM_ADDR_LO register write
wire   vid_ram_ce_early = (vid_ram_addr_hi_wr_i | vid_ram_data_rd_dly | vid_ram_data_rd_msk | // Read access
                           vid_ram_data_wr_i);                                                // Write access

reg [1:0] vid_ram_ce;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_ce <= 2'b00;
  else         vid_ram_ce <= {vid_ram_ce[0] & ~vid_ram_data_wr_dly, vid_ram_ce_early};

assign vid_ram_ce_o     = vid_ram_ce[0];

// Data to be written
assign vid_ram_din_o    = {16{vid_ram_ce[0]}} & vid_ram_data;

// Update the VRAM_DATA register one cycle after each memory access
assign vid_ram_dout_rdy = vid_ram_ce[1];


//------------------------------------------------
// Compute VIDEO-RAM Address
//------------------------------------------------

// Mux ram address for early read access when ADDR_LO is updated
`ifdef VRAM_BIGGER_4_KW
wire [`APIX_MSB:0] vid_ram_addr_mux    = vid_ram_addr_hi_wr_i ? {per_din_i[`APIX_HI_MSB:0], vid_ram_addr[15:0]} :
                                         vid_ram_data_rd_msk  ?  vid_ram_addr_inc                               : vid_ram_addr;
`else
wire [`APIX_MSB:0] vid_ram_addr_mux    = vid_ram_addr_hi_wr_i ? {per_din_i[`APIX_LO_MSB:0]}                     :
                                         vid_ram_data_rd_msk  ?  vid_ram_addr_inc                               : vid_ram_addr;
`endif

// Add frame pointer offset
wire [`APIX_MSB:0] vid_ram_addr_offset = vid_ram_base_addr_i + vid_ram_addr_mux;

// Detect memory accesses for ADDR update
wire               vid_ram_access_o    = vid_ram_data_wr_i | vid_ram_data_rd_dly | vid_ram_addr_hi_wr_i | vid_ram_data_rd_msk;

// Mux Address between the two interfaces
wire [`APIX_MSB:0] vid_ram_addr_nxt_o  = {`APIX_MSB+1{vid_ram_access_o}} & vid_ram_addr_offset;

// Increment the address when accessing the VID_RAMx_DATA register:
// - one clock cycle after a write access
// - with the read access (if not in read-modify-write mode)
assign             vid_ram_addr_inc_wr = vid_ram_addr_hi_wr_dly | vid_ram_data_wr_dly | (vid_ram_data_rd_i & ~dbg_freeze_i & ~vid_ram_rmw_mode);

// Compute mask for the address LSBs depending on BPP resolution
wire         [3:0] gfx_mode_addr_msk   = (        {4{gfx_mode_1_bpp_i}}  | // Take  4 address LSBs in  1bpp mode
                                          {1'b0,  {3{gfx_mode_2_bpp_i}}} | // Take  3 address LSBs in  2bpp mode
                                          {2'b00, {2{gfx_mode_4_bpp_i}}} | // Take  2 address LSBs in  4bpp mode
                                          {3'b000,   gfx_mode_8_bpp_i});   // Take  1 address LSB  in  8bpp mode
                                                                           // Take no address LSB  in 16bpp mode
// Generate Data-Mask for the mask mode (Bank 0)
wire    [15:0] vid_ram_data_mask_shift = one_hot16(vid_ram_addr_offset[3:0] & gfx_mode_addr_msk);
wire    [15:0] vid_ram_data_mask_nxt   = ({16{gfx_mode_1_bpp_i }} &     vid_ram_data_mask_shift      ) |
                                         ({16{gfx_mode_2_bpp_i }} & {{2{vid_ram_data_mask_shift[7]}},
                                                                     {2{vid_ram_data_mask_shift[6]}},
                                                                     {2{vid_ram_data_mask_shift[5]}},
                                                                     {2{vid_ram_data_mask_shift[4]}},
                                                                     {2{vid_ram_data_mask_shift[3]}},
                                                                     {2{vid_ram_data_mask_shift[2]}},
                                                                     {2{vid_ram_data_mask_shift[1]}},
                                                                     {2{vid_ram_data_mask_shift[0]}}}) |
                                         ({16{gfx_mode_4_bpp_i }} & {{4{vid_ram_data_mask_shift[3]}},
                                                                     {4{vid_ram_data_mask_shift[2]}},
                                                                     {4{vid_ram_data_mask_shift[1]}},
                                                                     {4{vid_ram_data_mask_shift[0]}}}) |
                                         ({16{gfx_mode_8_bpp_i }} & {{8{vid_ram_data_mask_shift[1]}},
                                                                     {8{vid_ram_data_mask_shift[0]}}}) |
                                         ({16{gfx_mode_16_bpp_i}} & {16{1'b1}}                       ) ;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   vid_ram_data_mask <=  16'hffff;
  else if (vid_ram_data_rd_msk)  vid_ram_data_mask <=  vid_ram_data_mask_nxt;
  else if (vid_ram_access_o)     vid_ram_data_mask <=  16'hffff;


endmodule // ogfx_reg_vram_if

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
