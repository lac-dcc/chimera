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
// *File Name: ogfx_ram_arbiter.v
//
// *Module Description:
//                      RAM arbiter for LUT and VIDEO memories
//                      LUT-RAM arbitration:
//
//                              - Software interface: fixed highest priority
//                              - Refresh  interface: fixed lowest priority
//
//                      Video-RAM arbitration:
//
//                              - Software interface: fixed highest priority
//                              - Refresh  interface: round-robin with GPIO if
//                              - GPU      interface: round-robin with Refresh if
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

module  ogfx_ram_arbiter (

    mclk,                                                // Main system clock
    puc_rst,                                             // Main system reset

   //------------------------------------------------------------

   // SW interface, fixed highest priority
    lut_ram_sw_addr_i,                                   // LUT-RAM Software address
    lut_ram_sw_din_i,                                    // LUT-RAM Software data
    lut_ram_sw_wen_i,                                    // LUT-RAM Software write strobe (active low)
    lut_ram_sw_cen_i,                                    // LUT-RAM Software chip enable (active low)
    lut_ram_sw_dout_o,                                   // LUT-RAM Software data input

   // Refresh-backend, fixed lowest priority
    lut_ram_refr_addr_i,                                 // LUT-RAM Refresh address
    lut_ram_refr_din_i,                                  // LUT-RAM Refresh data
    lut_ram_refr_wen_i,                                  // LUT-RAM Refresh write strobe (active low)
    lut_ram_refr_cen_i,                                  // LUT-RAM Refresh enable (active low)
    lut_ram_refr_dout_o,                                 // LUT-RAM Refresh data output
    lut_ram_refr_dout_rdy_nxt_o,                         // LUT-RAM Refresh data output ready during next cycle

   // LUT Memory interface
    lut_ram_addr_o,                                      // LUT-RAM address
    lut_ram_din_o,                                       // LUT-RAM data
    lut_ram_wen_o,                                       // LUT-RAM write strobe (active low)
    lut_ram_cen_o,                                       // LUT-RAM chip enable (active low)
    lut_ram_dout_i,                                      // LUT-RAM data input

   //------------------------------------------------------------

   // SW interface, fixed highest priority
    vid_ram_sw_addr_i,                                   // Video-RAM Software address
    vid_ram_sw_din_i,                                    // Video-RAM Software data
    vid_ram_sw_wen_i,                                    // Video-RAM Software write strobe (active low)
    vid_ram_sw_cen_i,                                    // Video-RAM Software chip enable (active low)
    vid_ram_sw_dout_o,                                   // Video-RAM Software data input

   // GPU interface (round-robin with refresh-backend)
    vid_ram_gpu_addr_i,                                  // Video-RAM GPU address
    vid_ram_gpu_din_i,                                   // Video-RAM GPU data
    vid_ram_gpu_wen_i,                                   // Video-RAM GPU write strobe (active low)
    vid_ram_gpu_cen_i,                                   // Video-RAM GPU chip enable (active low)
    vid_ram_gpu_dout_o,                                  // Video-RAM GPU data input
    vid_ram_gpu_dout_rdy_nxt_o,                          // Video-RAM GPU data output ready during next cycle

   // Refresh-backend (round-robin with GPU interface)
    vid_ram_refr_addr_i,                                 // Video-RAM Refresh address
    vid_ram_refr_din_i,                                  // Video-RAM Refresh data
    vid_ram_refr_wen_i,                                  // Video-RAM Refresh write strobe (active low)
    vid_ram_refr_cen_i,                                  // Video-RAM Refresh enable (active low)
    vid_ram_refr_dout_o,                                 // Video-RAM Refresh data output
    vid_ram_refr_dout_rdy_nxt_o,                         // Video-RAM Refresh data output ready during next cycle

   // Video Memory interface
    vid_ram_addr_o,                                      // Video-RAM address
    vid_ram_din_o,                                       // Video-RAM data
    vid_ram_wen_o,                                       // Video-RAM write strobe (active low)
    vid_ram_cen_o,                                       // Video-RAM chip enable (active low)
    vid_ram_dout_i                                       // Video-RAM data input

   //------------------------------------------------------------
);

// CLOCK/RESET
//=============
input                mclk;                               // Main system clock
input                puc_rst;                            // Main system reset

// LUT MEMORY
//=============

// SW interface, fixed highest priority
input  [`LRAM_MSB:0] lut_ram_sw_addr_i;                  // LUT-RAM Software address
input         [15:0] lut_ram_sw_din_i;                   // LUT-RAM Software data
input                lut_ram_sw_wen_i;                   // LUT-RAM Software write strobe (active low)
input                lut_ram_sw_cen_i;                   // LUT-RAM Software chip enable (active low)
output        [15:0] lut_ram_sw_dout_o;                  // LUT-RAM Software data input

// Refresh-backend, fixed lowest priority
input  [`LRAM_MSB:0] lut_ram_refr_addr_i;                // LUT-RAM Refresh address
input         [15:0] lut_ram_refr_din_i;                 // LUT-RAM Refresh data
input                lut_ram_refr_wen_i;                 // LUT-RAM Refresh write strobe (active low)
input                lut_ram_refr_cen_i;                 // LUT-RAM Refresh enable (active low)
output        [15:0] lut_ram_refr_dout_o;                // LUT-RAM Refresh data output
output               lut_ram_refr_dout_rdy_nxt_o;        // LUT-RAM Refresh data output ready during next cycle

// LUT Memory interface
output [`LRAM_MSB:0] lut_ram_addr_o;                     // LUT-RAM address
output        [15:0] lut_ram_din_o;                      // LUT-RAM data
output               lut_ram_wen_o;                      // LUT-RAM write strobe (active low)
output               lut_ram_cen_o;                      // LUT-RAM chip enable (active low)
input         [15:0] lut_ram_dout_i;                     // LUT-RAM data input

// VIDEO MEMORY
//==============

// SW interface, fixed highest priority
input  [`VRAM_MSB:0] vid_ram_sw_addr_i;                  // Video-RAM Software address
input         [15:0] vid_ram_sw_din_i;                   // Video-RAM Software data
input                vid_ram_sw_wen_i;                   // Video-RAM Software write strobe (active low)
input                vid_ram_sw_cen_i;                   // Video-RAM Software chip enable (active low)
output        [15:0] vid_ram_sw_dout_o;                  // Video-RAM Software data input

// GPU interface (round-robin with refresh-backend)
input  [`VRAM_MSB:0] vid_ram_gpu_addr_i;                 // Video-RAM GPU address
input         [15:0] vid_ram_gpu_din_i;                  // Video-RAM GPU data
input                vid_ram_gpu_wen_i;                  // Video-RAM GPU write strobe (active low)
input                vid_ram_gpu_cen_i;                  // Video-RAM GPU chip enable (active low)
output        [15:0] vid_ram_gpu_dout_o;                 // Video-RAM GPU data input
output               vid_ram_gpu_dout_rdy_nxt_o;         // Video-RAM GPU data output ready during next cycle

// Refresh-backend (round-robin with GPU interface)
input  [`VRAM_MSB:0] vid_ram_refr_addr_i;                // Video-RAM Refresh address
input         [15:0] vid_ram_refr_din_i;                 // Video-RAM Refresh data
input                vid_ram_refr_wen_i;                 // Video-RAM Refresh write strobe (active low)
input                vid_ram_refr_cen_i;                 // Video-RAM Refresh enable (active low)
output        [15:0] vid_ram_refr_dout_o;                // Video-RAM Refresh data output
output               vid_ram_refr_dout_rdy_nxt_o;        // Video-RAM Refresh data output ready during next cycle

// Video Memory interface
output [`VRAM_MSB:0] vid_ram_addr_o;                     // Video-RAM address
output        [15:0] vid_ram_din_o;                      // Video-RAM data
output               vid_ram_wen_o;                      // Video-RAM write strobe (active low)
output               vid_ram_cen_o;                      // Video-RAM chip enable (active low)
input         [15:0] vid_ram_dout_i;                     // Video-RAM data input


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

reg     gpu_is_last_owner;


//=============================================================================
// 2) LUT MEMORY ARBITER
//=============================================================================

// Arbitration signals
wire    sw_lram_access_granted       = ~lut_ram_sw_cen_i;
wire    refr_lram_access_granted     = ~sw_lram_access_granted & ~lut_ram_refr_cen_i;

// LUT RAM signal muxing
assign  lut_ram_sw_dout_o            =  lut_ram_dout_i;

assign  lut_ram_refr_dout_o          =  lut_ram_dout_i;
assign  lut_ram_refr_dout_rdy_nxt_o  =  refr_lram_access_granted;

assign  lut_ram_addr_o               = ({`LRAM_AWIDTH{ sw_lram_access_granted  }} & lut_ram_sw_addr_i  ) |
                                       ({`LRAM_AWIDTH{ refr_lram_access_granted}} & lut_ram_refr_addr_i) ;

assign  lut_ram_din_o                = ({          16{ sw_lram_access_granted  }} & lut_ram_sw_din_i   ) |
                                       ({          16{ refr_lram_access_granted}} & lut_ram_refr_din_i ) ;

assign  lut_ram_wen_o                = (              ~sw_lram_access_granted     | lut_ram_sw_wen_i   ) &
                                       (              ~refr_lram_access_granted   | lut_ram_refr_wen_i ) ;

assign  lut_ram_cen_o                =  lut_ram_sw_cen_i & lut_ram_refr_cen_i;


//=============================================================================
// 3) VIDEO MEMORY ARBITER
//=============================================================================


// Arbitration signals
wire sw_vram_access_granted   = ~vid_ram_sw_cen_i;
wire gpu_vram_access_granted  = ~sw_vram_access_granted &                                           // No SW access
                                ((~vid_ram_gpu_cen_i &  vid_ram_refr_cen_i)                       | // GPU requests alone
                                 (~vid_ram_gpu_cen_i & ~vid_ram_refr_cen_i & ~gpu_is_last_owner)) ; // GPU & REFR both requests (arbitration required)

wire refr_vram_access_granted = ~sw_vram_access_granted &                                           // No SW access
                                (( vid_ram_gpu_cen_i & ~vid_ram_refr_cen_i)                       | // GPU requests alone
                                 (~vid_ram_gpu_cen_i & ~vid_ram_refr_cen_i &  gpu_is_last_owner)) ; // GPU & REFR both requests (arbitration required)

// Detect who was the last to own the RAM between the GPU and Refresh interface
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                       gpu_is_last_owner <=  1'b0;
  else if (gpu_vram_access_granted ) gpu_is_last_owner <=  1'b1;
  else if (refr_vram_access_granted) gpu_is_last_owner <=  1'b0;

// Video RAM signal muxing
assign  vid_ram_sw_dout_o            = vid_ram_dout_i;

assign  vid_ram_gpu_dout_o           = vid_ram_dout_i;
assign  vid_ram_gpu_dout_rdy_nxt_o   = gpu_vram_access_granted;

assign  vid_ram_refr_dout_o          = vid_ram_dout_i;
assign  vid_ram_refr_dout_rdy_nxt_o  = refr_vram_access_granted;

assign  vid_ram_addr_o               = ({`VRAM_AWIDTH{ sw_vram_access_granted  }} & vid_ram_sw_addr_i  ) |
                                       ({`VRAM_AWIDTH{ gpu_vram_access_granted }} & vid_ram_gpu_addr_i ) |
                                       ({`VRAM_AWIDTH{ refr_vram_access_granted}} & vid_ram_refr_addr_i) ;

assign  vid_ram_din_o                = ({          16{ sw_vram_access_granted  }} & vid_ram_sw_din_i   ) |
                                       ({          16{ gpu_vram_access_granted }} & vid_ram_gpu_din_i  ) |
                                       ({          16{ refr_vram_access_granted}} & vid_ram_refr_din_i ) ;

assign  vid_ram_wen_o                = (              ~sw_vram_access_granted     | vid_ram_sw_wen_i   ) &
                                       (              ~gpu_vram_access_granted    | vid_ram_gpu_wen_i  ) &
                                       (              ~refr_vram_access_granted   | vid_ram_refr_wen_i ) ;

assign  vid_ram_cen_o                = vid_ram_sw_cen_i & vid_ram_gpu_cen_i & vid_ram_refr_cen_i;


endmodule // ogfx_ram_arbiter

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
