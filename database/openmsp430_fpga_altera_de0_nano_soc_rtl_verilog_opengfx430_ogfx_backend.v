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
// *File Name: ogfx_backend.v
//
// *Module Description:
//                      Backend module of the graphic controller.
//                      The purpose of this block is to:
//
//                          - fetch the data from the specified frame buffer
//                          - convert data depending on selected video mode
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

module  ogfx_backend (

// OUTPUTs
    refresh_data_o,                               // Display refresh data
    refresh_data_ready_o,                         // Display refresh new data is ready

    vid_ram_addr_o,                               // Video-RAM refresh address
    vid_ram_cen_o,                                // Video-RAM refresh enable (active low)

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_addr_o,                               // LUT-RAM refresh address
    lut_ram_cen_o,                                // LUT-RAM refresh enable (active low)
`endif

// INPUTs
    mclk,                                         // Main system clock
    puc_rst,                                      // Main system reset

    display_width_i,                              // Display width
    display_height_i,                             // Display height
    display_size_i,                               // Display size (number of pixels)
    display_y_swap_i,                             // Display configuration: swap Y axis (horizontal symmetry)
    display_x_swap_i,                             // Display configuration: swap X axis (vertical symmetry)
    display_cl_swap_i,                            // Display configuration: swap column/lines

    gfx_mode_i,                                   // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_dout_i,                               // LUT-RAM data output
    lut_ram_dout_rdy_nxt_i,                       // LUT-RAM data output ready during next cycle
`endif

    vid_ram_dout_i,                               // Video-RAM data output
    vid_ram_dout_rdy_nxt_i,                       // Video-RAM data output ready during next cycle

    refresh_active_i,                             // Display refresh on going
    refresh_data_request_i,                       // Display refresh new data request
    refresh_frame_base_addr_i,                    // Refresh frame base address

    hw_lut_palette_sel_i,                         // Hardware LUT palette configuration
    hw_lut_bgcolor_i,                             // Hardware LUT background-color selection
    hw_lut_fgcolor_i,                             // Hardware LUT foreground-color selection
    sw_lut_enable_i,                              // Refresh LUT-RAM enable
    sw_lut_bank_select_i                          // Refresh LUT-RAM bank selection
);

// OUTPUTs
//=========
output        [15:0] refresh_data_o;              // Display refresh data
output               refresh_data_ready_o;        // Display refresh new data is ready

output [`VRAM_MSB:0] vid_ram_addr_o;              // Video-RAM refresh address
output               vid_ram_cen_o;               // Video-RAM refresh enable (active low)

`ifdef WITH_PROGRAMMABLE_LUT
output [`LRAM_MSB:0] lut_ram_addr_o;              // LUT-RAM refresh address
output               lut_ram_cen_o;               // LUT-RAM refresh enable (active low)
`endif

// INPUTs
//=========
input                mclk;                        // Main system clock
input                puc_rst;                     // Main system reset

input  [`LPIX_MSB:0] display_width_i;             // Display width
input  [`LPIX_MSB:0] display_height_i;            // Display height
input  [`SPIX_MSB:0] display_size_i;              // Display size (number of pixels)
input                display_y_swap_i;            // Display configuration: swap Y axis (horizontal symmetry)
input                display_x_swap_i;            // Display configuration: swap X axis (vertical symmetry)
input                display_cl_swap_i;           // Display configuration: swap column/lines

input          [2:0] gfx_mode_i;                  // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

`ifdef WITH_PROGRAMMABLE_LUT
input         [15:0] lut_ram_dout_i;              // LUT-RAM data output
input                lut_ram_dout_rdy_nxt_i;      // LUT-RAM data output ready during next cycle
`endif

input         [15:0] vid_ram_dout_i;              // Video-RAM data output
input                vid_ram_dout_rdy_nxt_i;      // Video-RAM data output ready during next cycle

input                refresh_active_i;            // Display refresh on going
input                refresh_data_request_i;      // Display refresh new data request
input  [`APIX_MSB:0] refresh_frame_base_addr_i;   // Refresh frame base address

input          [2:0] hw_lut_palette_sel_i;        // Hardware LUT palette configuration
input          [3:0] hw_lut_bgcolor_i;            // Hardware LUT background-color selection
input          [3:0] hw_lut_fgcolor_i;            // Hardware LUT foreground-color selection
input                sw_lut_enable_i;             // Refresh LUT-RAM enable
input                sw_lut_bank_select_i;        // Refresh LUT-RAM bank selection


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// Wires
wire  [15:0] frame_data;
wire         frame_data_ready;
wire         frame_data_request;


//============================================================================
// 2) FRAME MEMORY ACCESS
//============================================================================

ogfx_backend_frame_fifo  ogfx_backend_frame_fifo_inst (

// OUTPUTs
    .frame_data_o                  ( frame_data                ),  // Frame data
    .frame_data_ready_o            ( frame_data_ready          ),  // Frame data ready

    .vid_ram_addr_o                ( vid_ram_addr_o            ),  // Video-RAM address
    .vid_ram_cen_o                 ( vid_ram_cen_o             ),  // Video-RAM enable (active low)

// INPUTs
    .mclk                          ( mclk                      ),  // Main system clock
    .puc_rst                       ( puc_rst                   ),  // Main system reset

    .display_width_i               ( display_width_i           ),  // Display width
    .display_height_i              ( display_height_i          ),  // Display height
    .display_size_i                ( display_size_i            ),  // Display size (number of pixels)
    .display_y_swap_i              ( display_y_swap_i          ),  // Display configuration: swap Y axis (horizontal symmetry)
    .display_x_swap_i              ( display_x_swap_i          ),  // Display configuration: swap X axis (vertical symmetry)
    .display_cl_swap_i             ( display_cl_swap_i         ),  // Display configuration: swap column/lines

    .frame_data_request_i          ( frame_data_request        ),  // Request for next frame data

    .gfx_mode_i                    ( gfx_mode_i                ),  // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    .vid_ram_dout_i                ( vid_ram_dout_i            ),  // Video-RAM data output
    .vid_ram_dout_rdy_nxt_i        ( vid_ram_dout_rdy_nxt_i    ),  // Video-RAM data output ready during next cycle

    .refresh_active_i              ( refresh_active_i          ),  // Display refresh on going
    .refresh_frame_base_addr_i     ( refresh_frame_base_addr_i )   // Refresh frame base address
);


//============================================================================
// 3) LUT MEMORY ACCESS
//============================================================================

ogfx_backend_lut_fifo  ogfx_backend_lut_fifo_inst (

// OUTPUTs
    .frame_data_request_o          ( frame_data_request        ),  // Request for next frame data

    .refresh_data_o                ( refresh_data_o            ),  // Display Refresh data
    .refresh_data_ready_o          ( refresh_data_ready_o      ),  // Display Refresh data ready

`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_addr_o                ( lut_ram_addr_o            ),  // LUT-RAM address
    .lut_ram_cen_o                 ( lut_ram_cen_o             ),  // LUT-RAM enable (active low)
`endif

// INPUTs
    .mclk                          ( mclk                      ),  // Main system clock
    .puc_rst                       ( puc_rst                   ),  // Main system reset

    .frame_data_i                  ( frame_data                ),  // Frame data
    .frame_data_ready_i            ( frame_data_ready          ),  // Frame data ready

    .gfx_mode_i                    ( gfx_mode_i                ),  // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_dout_i                ( lut_ram_dout_i            ),  // LUT-RAM data output
    .lut_ram_dout_rdy_nxt_i        ( lut_ram_dout_rdy_nxt_i    ),  // LUT-RAM data output ready during next cycle
`endif

    .refresh_active_i              ( refresh_active_i          ),  // Display refresh on going
    .refresh_data_request_i        ( refresh_data_request_i    ),  // Request for next refresh data

    .hw_lut_palette_sel_i          ( hw_lut_palette_sel_i      ),  // Hardware LUT palette configuration
    .hw_lut_bgcolor_i              ( hw_lut_bgcolor_i          ),  // Hardware LUT background-color selection
    .hw_lut_fgcolor_i              ( hw_lut_fgcolor_i          ),  // Hardware LUT foreground-color selection
    .sw_lut_enable_i               ( sw_lut_enable_i           ),  // Refresh LUT-RAM enable
    .sw_lut_bank_select_i          ( sw_lut_bank_select_i      )   // Refresh LUT-RAM bank selection
);


endmodule // ogfx_backend

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
