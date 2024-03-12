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
// *File Name: ogfx_gpu.v
//
// *Module Description:
//                      Graphic-Processing unit of the graphic controller.
//                      This block can perform the following hardware
//                      accelerations:
//
//                          -
//                          -
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

module  ogfx_gpu (

// OUTPUTs
    gpu_cmd_done_evt_o,                           // GPU command done event
    gpu_cmd_error_evt_o,                          // GPU command error event
    gpu_dma_busy_o,                               // GPU DMA execution on going
    gpu_get_data_o,                               // GPU get next data

    vid_ram_addr_o,                               // Video-RAM address
    vid_ram_din_o,                                // Video-RAM data
    vid_ram_wen_o,                                // Video-RAM write strobe (active low)
    vid_ram_cen_o,                                // Video-RAM chip enable (active low)

// INPUTs
    mclk,                                         // Main system clock
    puc_rst,                                      // Main system reset

    display_width_i,                              // Display width

    gfx_mode_i,                                   // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    gpu_data_i,                                   // GPU data
    gpu_data_avail_i,                             // GPU data available
    gpu_enable_i,                                 // GPU enable

    vid_ram_dout_i,                               // Video-RAM data input
    vid_ram_dout_rdy_nxt_i                        // Video-RAM data output ready during next cycle
);

// OUTPUTs
//=========
output               gpu_cmd_done_evt_o;          // GPU command done event
output               gpu_cmd_error_evt_o;         // GPU command error event
output               gpu_dma_busy_o;              // GPU DMA execution on going
output               gpu_get_data_o;              // GPU get next data

output [`VRAM_MSB:0] vid_ram_addr_o;              // Video-RAM address
output        [15:0] vid_ram_din_o;               // Video-RAM data
output               vid_ram_wen_o;               // Video-RAM write strobe (active low)
output               vid_ram_cen_o;               // Video-RAM chip enable (active low)

// INPUTs
//=========
input                mclk;                        // Main system clock
input                puc_rst;                     // Main system reset

input  [`LPIX_MSB:0] display_width_i;             // Display width

input          [2:0] gfx_mode_i;                  // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

input         [15:0] gpu_data_i;                  // GPU data
input                gpu_data_avail_i;            // GPU data available
input                gpu_enable_i;                // GPU enable

input         [15:0] vid_ram_dout_i;              // Video-RAM data input
input                vid_ram_dout_rdy_nxt_i;      // Video-RAM data output ready during next cycle


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

wire                 exec_fill;
wire                 exec_copy;
wire                 exec_copy_trans;
wire                 trig_exec;

wire   [`APIX_MSB:0] cfg_dst_px_addr;
wire                 cfg_dst_cl_swp;
wire                 cfg_dst_x_swp;
wire                 cfg_dst_y_swp;
wire          [15:0] cfg_fill_color;
wire           [3:0] cfg_pix_op_sel;
wire   [`LPIX_MSB:0] cfg_rec_width;
wire   [`LPIX_MSB:0] cfg_rec_height;
wire   [`APIX_MSB:0] cfg_src_px_addr;
wire                 cfg_src_cl_swp;
wire                 cfg_src_x_swp;
wire                 cfg_src_y_swp;
wire          [15:0] cfg_transparent_color;

wire                 gpu_exec_done;


//=============================================================================
// 2)  GPU CONGIGURATION & CONTROL REGISTERS
//=============================================================================

ogfx_gpu_reg ogfx_gpu_reg_inst (

// OUTPUTs
    .gpu_cmd_done_evt_o      (gpu_cmd_done_evt_o    ),     // GPU command done event
    .gpu_cmd_error_evt_o     (gpu_cmd_error_evt_o   ),     // GPU command error event
    .gpu_get_data_o          (gpu_get_data_o        ),     // GPU get next data

    .exec_fill_o             (exec_fill             ),     // Rectangle fill on going
    .exec_copy_o             (exec_copy             ),     // Rectangle copy on going
    .exec_copy_trans_o       (exec_copy_trans       ),     // Rectangle transparent copy on going
    .trig_exec_o             (trig_exec             ),     // Trigger rectangle execution

    .cfg_dst_px_addr_o       (cfg_dst_px_addr       ),     // Destination pixel address configuration
    .cfg_dst_cl_swp_o        (cfg_dst_cl_swp        ),     // Destination Column/Line-Swap configuration
    .cfg_dst_x_swp_o         (cfg_dst_x_swp         ),     // Destination X-Swap configuration
    .cfg_dst_y_swp_o         (cfg_dst_y_swp         ),     // Destination Y-Swap configuration
    .cfg_fill_color_o        (cfg_fill_color        ),     // Fill color (for rectangle fill operation)
    .cfg_pix_op_sel_o        (cfg_pix_op_sel        ),     // Pixel operation to be performed during the copy
    .cfg_rec_width_o         (cfg_rec_width         ),     // Rectangle width configuration
    .cfg_rec_height_o        (cfg_rec_height        ),     // Rectangle height configuration
    .cfg_src_px_addr_o       (cfg_src_px_addr       ),     // Source pixel address configuration
    .cfg_src_cl_swp_o        (cfg_src_cl_swp        ),     // Source Column/Line-Swap configuration
    .cfg_src_x_swp_o         (cfg_src_x_swp         ),     // Source X-Swap configuration
    .cfg_src_y_swp_o         (cfg_src_y_swp         ),     // Source Y-Swap configuration
    .cfg_transparent_color_o (cfg_transparent_color ),     // Transparent color (for rectangle transparent copy operation)


// INPUTs
    .mclk                    (mclk                  ),     // Main system clock
    .puc_rst                 (puc_rst               ),     // Main system reset

    .gpu_data_i              (gpu_data_i            ),     // GPU data
    .gpu_data_avail_i        (gpu_data_avail_i      ),     // GPU data available
    .gfx_mode_i              (gfx_mode_i            ),     // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)
    .gpu_enable_i            (gpu_enable_i          ),     // GPU enable

    .gpu_exec_done_i         (gpu_exec_done         )      // GPU execution done
);

//=============================================================================
// 3)  2D-DMA
//=============================================================================

ogfx_gpu_dma ogfx_gpu_dma_inst (

// OUTPUTs
    .gpu_exec_done_o         (gpu_exec_done         ),     // GPU execution done
    .gpu_dma_busy_o          (gpu_dma_busy_o        ),     // GPU DMA execution on going

    .vid_ram_addr_o          (vid_ram_addr_o        ),     // Video-RAM address
    .vid_ram_din_o           (vid_ram_din_o         ),     // Video-RAM data
    .vid_ram_wen_o           (vid_ram_wen_o         ),     // Video-RAM write strobe (active low)
    .vid_ram_cen_o           (vid_ram_cen_o         ),     // Video-RAM chip enable (active low)

// INPUTs
    .mclk                    (mclk                  ),     // Main system clock
    .puc_rst                 (puc_rst               ),     // Main system reset

    .cfg_dst_px_addr_i       (cfg_dst_px_addr       ),     // Destination pixel address configuration
    .cfg_dst_cl_swp_i        (cfg_dst_cl_swp        ),     // Destination Column/Line-Swap configuration
    .cfg_dst_x_swp_i         (cfg_dst_x_swp         ),     // Destination X-Swap configuration
    .cfg_dst_y_swp_i         (cfg_dst_y_swp         ),     // Destination Y-Swap configuration
    .cfg_fill_color_i        (cfg_fill_color        ),     // Fill color (for rectangle fill operation)
    .cfg_pix_op_sel_i        (cfg_pix_op_sel        ),     // Pixel operation to be performed during the copy
    .cfg_rec_width_i         (cfg_rec_width         ),     // Rectangle width configuration
    .cfg_rec_height_i        (cfg_rec_height        ),     // Rectangle height configuration
    .cfg_src_px_addr_i       (cfg_src_px_addr       ),     // Source pixel address configuration
    .cfg_src_cl_swp_i        (cfg_src_cl_swp        ),     // Source Column/Line-Swap configuration
    .cfg_src_x_swp_i         (cfg_src_x_swp         ),     // Source X-Swap configuration
    .cfg_src_y_swp_i         (cfg_src_y_swp         ),     // Source Y-Swap configuration
    .cfg_transparent_color_i (cfg_transparent_color ),     // Transparent color (for rectangle transparent copy operation)

    .display_width_i         (display_width_i       ),     // Display width

    .gfx_mode_i              (gfx_mode_i            ),     // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    .gpu_enable_i            (gpu_enable_i          ),     // GPU enable

    .exec_fill_i             (exec_fill             ),     // Rectangle fill on going
    .exec_copy_i             (exec_copy             ),     // Rectangle copy on going
    .exec_copy_trans_i       (exec_copy_trans       ),     // Rectangle transparent copy on going
    .trig_exec_i             (trig_exec             ),     // Trigger rectangle execution

    .vid_ram_dout_i          (vid_ram_dout_i        ),     // Video-RAM data input
    .vid_ram_dout_rdy_nxt_i  (vid_ram_dout_rdy_nxt_i)      // Video-RAM data output ready during next cycle
);

endmodule // ogfx_gpu

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
