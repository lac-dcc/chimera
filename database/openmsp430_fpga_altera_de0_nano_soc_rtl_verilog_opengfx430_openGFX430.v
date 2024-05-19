// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2016 Authors
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
// *File Name: openGFX430.v
//
// *Module Description:
//                      This is a basic video controller for the openMSP430.
//
//                      It is currently supporting the LT24 LCD Board but
//                      can be extended to anything.
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

module  openGFX430 (

// OUTPUTs
    irq_gfx_o,                             // Graphic Controller interrupt

    lt24_cs_n_o,                           // LT24 Chip select (Active low)
    lt24_rd_n_o,                           // LT24 Read strobe (Active low)
    lt24_wr_n_o,                           // LT24 Write strobe (Active low)
    lt24_rs_o,                             // LT24 Command/Param selection (Cmd=0/Param=1)
    lt24_d_o,                              // LT24 Data output
    lt24_d_en_o,                           // LT24 Data output enable
    lt24_reset_n_o,                        // LT24 Reset (Active Low)
    lt24_on_o,                             // LT24 on/off

    per_dout_o,                            // Peripheral data output

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_addr_o,                        // LUT-RAM address
    lut_ram_wen_o,                         // LUT-RAM write enable (active low)
    lut_ram_cen_o,                         // LUT-RAM enable (active low)
    lut_ram_din_o,                         // LUT-RAM data input
`endif

    vid_ram_addr_o,                        // Video-RAM address
    vid_ram_wen_o,                         // Video-RAM write enable (active low)
    vid_ram_cen_o,                         // Video-RAM enable (active low)
    vid_ram_din_o,                         // Video-RAM data input

// INPUTs
    dbg_freeze_i,                          // Freeze address auto-incr on read
    mclk,                                  // Main system clock
    per_addr_i,                            // Peripheral address
    per_din_i,                             // Peripheral data input
    per_en_i,                              // Peripheral enable (high active)
    per_we_i,                              // Peripheral write enable (high active)
    puc_rst,                               // Main system reset

    lt24_d_i,                              // LT24 Data input

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_dout_i,                        // LUT-RAM data output
`endif
    vid_ram_dout_i                         // Video-RAM data output
);

// PARAMETERs
//============

parameter     [14:0] BASE_ADDR = 15'h0200; // Register base address
                                           //  - 7 LSBs must stay cleared: 0x0080, 0x0100,
                                           //                              0x0180, 0x0200,
                                           //                              0x0280, ...
// OUTPUTs
//=========
output               irq_gfx_o;            // Graphic Controller interrupt

output               lt24_cs_n_o;          // LT24 Chip select (Active low)
output               lt24_rd_n_o;          // LT24 Read strobe (Active low)
output               lt24_wr_n_o;          // LT24 Write strobe (Active low)
output               lt24_rs_o;            // LT24 Command/Param selection (Cmd=0/Param=1)
output        [15:0] lt24_d_o;             // LT24 Data output
output               lt24_d_en_o;          // LT24 Data output enable
output               lt24_reset_n_o;       // LT24 Reset (Active Low)
output               lt24_on_o;            // LT24 on/off

output        [15:0] per_dout_o;           // Peripheral data output

`ifdef WITH_PROGRAMMABLE_LUT
output [`LRAM_MSB:0] lut_ram_addr_o;       // LUT-RAM address
output               lut_ram_wen_o;        // LUT-RAM write enable (active low)
output               lut_ram_cen_o;        // LUT-RAM enable (active low)
output        [15:0] lut_ram_din_o;        // LUT-RAM data input
`endif

output [`VRAM_MSB:0] vid_ram_addr_o;       // Video-RAM address
output               vid_ram_wen_o;        // Video-RAM write enable (active low)
output               vid_ram_cen_o;        // Video-RAM enable (active low)
output        [15:0] vid_ram_din_o;        // Video-RAM data input

// INPUTs
//=========
input                dbg_freeze_i;         // Freeze address auto-incr on read
input                mclk;                 // Main system clock
input         [13:0] per_addr_i;           // Peripheral address
input         [15:0] per_din_i;            // Peripheral data input
input                per_en_i;             // Peripheral enable (high active)
input          [1:0] per_we_i;             // Peripheral write enable (high active)
input                puc_rst;              // Main system reset

input         [15:0] lt24_d_i;             // LT24 Data input

`ifdef WITH_PROGRAMMABLE_LUT
input         [15:0] lut_ram_dout_i;       // LUT-RAM data output
`endif
input         [15:0] vid_ram_dout_i;       // Video-RAM data output


//=============================================================================
// 1)  WIRE & PARAMETER DECLARATION
//=============================================================================

wire         [2:0] lt24_cfg_clk;
wire        [11:0] lt24_cfg_refr;
wire               lt24_cfg_refr_sync_en;
wire         [9:0] lt24_cfg_refr_sync_val;
wire               lt24_cmd_refr;
wire         [7:0] lt24_cmd_val;
wire               lt24_cmd_has_param;
wire        [15:0] lt24_cmd_param;
wire               lt24_cmd_param_rdy;
wire        [15:0] lt24_cmd_dfill;
wire               lt24_cmd_dfill_wr;

wire [`LPIX_MSB:0] display_width;
wire [`LPIX_MSB:0] display_height;
wire [`SPIX_MSB:0] display_size;
wire               display_y_swap;
wire               display_x_swap;
wire               display_cl_swap;
wire         [2:0] gfx_mode;

wire         [4:0] lt24_status;
wire               lt24_done_evt;
wire               lt24_start_evt;

`ifdef WITH_PROGRAMMABLE_LUT
wire [`LRAM_MSB:0] lut_ram_sw_addr;
wire        [15:0] lut_ram_sw_din;
wire               lut_ram_sw_wen;
wire               lut_ram_sw_cen;
wire        [15:0] lut_ram_sw_dout;
wire [`LRAM_MSB:0] lut_ram_refr_addr;
wire               lut_ram_refr_cen;
wire        [15:0] lut_ram_refr_dout;
wire               lut_ram_refr_dout_rdy_nxt;
`endif
wire [`VRAM_MSB:0] vid_ram_sw_addr;
wire        [15:0] vid_ram_sw_din;
wire               vid_ram_sw_wen;
wire               vid_ram_sw_cen;
wire        [15:0] vid_ram_sw_dout;
wire [`VRAM_MSB:0] vid_ram_gpu_addr;
wire        [15:0] vid_ram_gpu_din;
wire               vid_ram_gpu_wen;
wire               vid_ram_gpu_cen;
wire        [15:0] vid_ram_gpu_dout;
wire               vid_ram_gpu_dout_rdy_nxt;
wire [`VRAM_MSB:0] vid_ram_refr_addr;
wire               vid_ram_refr_cen;
wire        [15:0] vid_ram_refr_dout;
wire               vid_ram_refr_dout_rdy_nxt;

wire               refresh_active;
wire        [15:0] refresh_data;
wire               refresh_data_ready;
wire               refresh_data_request;
wire [`APIX_MSB:0] refresh_frame_addr;
wire         [2:0] hw_lut_palette_sel;
wire         [3:0] hw_lut_bgcolor;
wire         [3:0] hw_lut_fgcolor;
wire               sw_lut_enable;
wire               sw_lut_bank_select;

wire               gpu_cmd_done_evt;
wire               gpu_cmd_error_evt;
wire               gpu_dma_busy;
wire               gpu_get_data;
wire        [15:0] gpu_data;
wire               gpu_data_avail;
wire               gpu_enable;


//============================================================================
// 2)  REGISTERS
//============================================================================

ogfx_reg  #(.BASE_ADDR(BASE_ADDR)) ogfx_reg_inst (

// OUTPUTs
    .irq_gfx_o                     ( irq_gfx_o                ),       // Graphic Controller interrupt

    .gpu_data_o                    ( gpu_data                 ),       // GPU data
    .gpu_data_avail_o              ( gpu_data_avail           ),       // GPU data available
    .gpu_enable_o                  ( gpu_enable               ),       // GPU enable

    .lt24_reset_n_o                ( lt24_reset_n_o           ),       // LT24 Reset (Active Low)
    .lt24_on_o                     ( lt24_on_o                ),       // LT24 on/off
    .lt24_cfg_clk_o                ( lt24_cfg_clk             ),       // LT24 Interface clock configuration
    .lt24_cfg_refr_o               ( lt24_cfg_refr            ),       // LT24 Interface refresh configuration
    .lt24_cfg_refr_sync_en_o       ( lt24_cfg_refr_sync_en    ),       // LT24 Interface refresh sync enable configuration
    .lt24_cfg_refr_sync_val_o      ( lt24_cfg_refr_sync_val   ),       // LT24 Interface refresh sync value configuration
    .lt24_cmd_refr_o               ( lt24_cmd_refr            ),       // LT24 Interface refresh command
    .lt24_cmd_val_o                ( lt24_cmd_val             ),       // LT24 Generic command value
    .lt24_cmd_has_param_o          ( lt24_cmd_has_param       ),       // LT24 Generic command has parameters
    .lt24_cmd_param_o              ( lt24_cmd_param           ),       // LT24 Generic command parameter value
    .lt24_cmd_param_rdy_o          ( lt24_cmd_param_rdy       ),       // LT24 Generic command trigger
    .lt24_cmd_dfill_o              ( lt24_cmd_dfill           ),       // LT24 Data fill value
    .lt24_cmd_dfill_wr_o           ( lt24_cmd_dfill_wr        ),       // LT24 Data fill trigger

    .display_width_o               ( display_width            ),       // Display width
    .display_height_o              ( display_height           ),       // Display height
    .display_size_o                ( display_size             ),       // Display size (number of pixels)
    .display_y_swap_o              ( display_y_swap           ),       // Display configuration: swap Y axis (horizontal symmetry)
    .display_x_swap_o              ( display_x_swap           ),       // Display configuration: swap X axis (vertical symmetry)
    .display_cl_swap_o             ( display_cl_swap          ),       // Display configuration: swap column/lines

    .gfx_mode_o                    ( gfx_mode                 ),       // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    .per_dout_o                    ( per_dout_o               ),       // Peripheral data output

    .refresh_frame_addr_o          ( refresh_frame_addr       ),       // Refresh frame base address

    .hw_lut_palette_sel_o          ( hw_lut_palette_sel       ),       // Hardware LUT palette configuration
    .hw_lut_bgcolor_o              ( hw_lut_bgcolor           ),       // Hardware LUT background-color selection
    .hw_lut_fgcolor_o              ( hw_lut_fgcolor           ),       // Hardware LUT foreground-color selection
    .sw_lut_enable_o               ( sw_lut_enable            ),       // Refresh LUT-RAM enable
    .sw_lut_bank_select_o          ( sw_lut_bank_select       ),       // Refresh LUT-RAM bank selection

`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_addr_o                ( lut_ram_sw_addr          ),       // LUT-RAM address
    .lut_ram_din_o                 ( lut_ram_sw_din           ),       // LUT-RAM data
    .lut_ram_wen_o                 ( lut_ram_sw_wen           ),       // LUT-RAM write strobe (active low)
    .lut_ram_cen_o                 ( lut_ram_sw_cen           ),       // LUT-RAM chip enable (active low)
`endif

    .vid_ram_addr_o                ( vid_ram_sw_addr          ),       // Video-RAM address
    .vid_ram_din_o                 ( vid_ram_sw_din           ),       // Video-RAM data
    .vid_ram_wen_o                 ( vid_ram_sw_wen           ),       // Video-RAM write strobe (active low)
    .vid_ram_cen_o                 ( vid_ram_sw_cen           ),       // Video-RAM chip enable (active low)

// INPUTs
    .dbg_freeze_i                  ( dbg_freeze_i             ),       // Freeze address auto-incr on read
    .gpu_cmd_done_evt_i            ( gpu_cmd_done_evt         ),       // GPU command done event
    .gpu_cmd_error_evt_i           ( gpu_cmd_error_evt        ),       // GPU command error event
    .gpu_dma_busy_i                ( gpu_dma_busy             ),       // GPU DMA execution on going
    .gpu_get_data_i                ( gpu_get_data             ),       // GPU get next data
    .lt24_status_i                 ( lt24_status              ),       // LT24 FSM Status
    .lt24_start_evt_i              ( lt24_start_evt           ),       // LT24 FSM start event
    .lt24_done_evt_i               ( lt24_done_evt            ),       // LT24 FSM done event
    .mclk                          ( mclk                     ),       // Main system clock
    .per_addr_i                    ( per_addr_i               ),       // Peripheral address
    .per_din_i                     ( per_din_i                ),       // Peripheral data input
    .per_en_i                      ( per_en_i                 ),       // Peripheral enable (high active)
    .per_we_i                      ( per_we_i                 ),       // Peripheral write enable (high active)
    .puc_rst                       ( puc_rst                  ),       // Main system reset

`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_dout_i                ( lut_ram_sw_dout          ),       // LUT-RAM data input
`endif
    .vid_ram_dout_i                ( vid_ram_sw_dout          )        // Video-RAM data input
);


//============================================================================
// 3)  GPU
//============================================================================

ogfx_gpu  ogfx_gpu_inst (

// OUTPUTs
    .gpu_cmd_done_evt_o            ( gpu_cmd_done_evt         ),       // GPU command done event
    .gpu_cmd_error_evt_o           ( gpu_cmd_error_evt        ),       // GPU command error event
    .gpu_dma_busy_o                ( gpu_dma_busy             ),       // GPU DMA execution on going
    .gpu_get_data_o                ( gpu_get_data             ),       // GPU get next data

    .vid_ram_addr_o                ( vid_ram_gpu_addr         ),       // Video-RAM address
    .vid_ram_din_o                 ( vid_ram_gpu_din          ),       // Video-RAM data
    .vid_ram_wen_o                 ( vid_ram_gpu_wen          ),       // Video-RAM write strobe (active low)
    .vid_ram_cen_o                 ( vid_ram_gpu_cen          ),       // Video-RAM chip enable (active low)

// INPUTs
    .mclk                          ( mclk                     ),       // Main system clock
    .puc_rst                       ( puc_rst                  ),       // Main system reset

    .display_width_i               ( display_width            ),       // Display width

    .gfx_mode_i                    ( gfx_mode                 ),       // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    .gpu_data_i                    ( gpu_data                 ),       // GPU data
    .gpu_data_avail_i              ( gpu_data_avail           ),       // GPU data available
    .gpu_enable_i                  ( gpu_enable               ),       // GPU enable

    .vid_ram_dout_i                ( vid_ram_gpu_dout         ),       // Video-RAM data input
    .vid_ram_dout_rdy_nxt_i        ( vid_ram_gpu_dout_rdy_nxt )        // Video-RAM data output ready during next cycle
);


//============================================================================
// 4) LT24 INTERFACE
//============================================================================

ogfx_if_lt24  ogfx_if_lt24_inst (

// OUTPUTs
    .event_fsm_done_o              ( lt24_done_evt          ),    // LT24 FSM done event
    .event_fsm_start_o             ( lt24_start_evt         ),    // LT24 FSM start event

    .lt24_cs_n_o                   ( lt24_cs_n_o            ),    // LT24 Chip select (Active low)
    .lt24_d_o                      ( lt24_d_o               ),    // LT24 Data output
    .lt24_d_en_o                   ( lt24_d_en_o            ),    // LT24 Data output enable
    .lt24_rd_n_o                   ( lt24_rd_n_o            ),    // LT24 Read strobe (Active low)
    .lt24_rs_o                     ( lt24_rs_o              ),    // LT24 Command/Param selection (Cmd=0/Param=1)
    .lt24_wr_n_o                   ( lt24_wr_n_o            ),    // LT24 Write strobe (Active low)

    .refresh_active_o              ( refresh_active         ),    // Display refresh on going
    .refresh_data_request_o        ( refresh_data_request   ),    // Display refresh new data request

    .status_o                      ( lt24_status            ),    // LT24 FSM Status

// INPUTs
    .mclk                          ( mclk                   ),    // Main system clock
    .puc_rst                       ( puc_rst                ),    // Main system reset

    .cfg_lt24_clk_div_i            ( lt24_cfg_clk           ),    // Clock Divider configuration for LT24 interface
    .cfg_lt24_display_size_i       ( display_size           ),    // Display size (number of pixels)
    .cfg_lt24_refresh_i            ( lt24_cfg_refr          ),    // Refresh rate configuration for LT24 interface
    .cfg_lt24_refresh_sync_en_i    ( lt24_cfg_refr_sync_en  ),    // Refresh sync enable configuration for LT24 interface
    .cfg_lt24_refresh_sync_val_i   ( lt24_cfg_refr_sync_val ),    // Refresh sync value configuration for LT24 interface

    .cmd_dfill_i                   ( lt24_cmd_dfill         ),    // Display data fill
    .cmd_dfill_trig_i              ( lt24_cmd_dfill_wr      ),    // Trigger a full display data fill

    .cmd_generic_cmd_val_i         ( lt24_cmd_val           ),    // Generic command value
    .cmd_generic_has_param_i       ( lt24_cmd_has_param     ),    // Generic command to be sent has parameter(s)
    .cmd_generic_param_val_i       ( lt24_cmd_param         ),    // Generic command parameter value
    .cmd_generic_trig_i            ( lt24_cmd_param_rdy     ),    // Trigger generic command transmit (or new parameter available)

    .cmd_refresh_i                 ( lt24_cmd_refr          ),    // Display refresh command

    .lt24_d_i                      ( lt24_d_i               ),    // LT24 Data input

    .refresh_data_i                ( refresh_data           ),    // Display refresh data
    .refresh_data_ready_i          ( refresh_data_ready     )     // Display refresh new data is ready
);

//============================================================================
// 5) VIDEO BACKEND
//============================================================================

// Video Backend
ogfx_backend  ogfx_backend_inst (

// OUTPUTs
    .refresh_data_o                ( refresh_data               ),    // Display refresh data
    .refresh_data_ready_o          ( refresh_data_ready         ),    // Display refresh new data is ready

    .vid_ram_addr_o                ( vid_ram_refr_addr          ),    // Video-RAM address
    .vid_ram_cen_o                 ( vid_ram_refr_cen           ),    // Video-RAM enable (active low)

`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_addr_o                ( lut_ram_refr_addr          ),    // LUT-RAM address
    .lut_ram_cen_o                 ( lut_ram_refr_cen           ),    // LUT-RAM enable (active low)
`endif

// INPUTs
    .mclk                          ( mclk                       ),    // Main system clock
    .puc_rst                       ( puc_rst                    ),    // Main system reset

    .display_width_i               ( display_width              ),    // Display width
    .display_height_i              ( display_height             ),    // Display height
    .display_size_i                ( display_size               ),    // Display size (number of pixels)
    .display_y_swap_i              ( display_y_swap             ),    // Display configuration: swap Y axis (horizontal symmetry)
    .display_x_swap_i              ( display_x_swap             ),    // Display configuration: swap X axis (vertical symmetry)
    .display_cl_swap_i             ( display_cl_swap            ),    // Display configuration: swap column/lines

    .gfx_mode_i                    ( gfx_mode                   ),    // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_dout_i                ( lut_ram_refr_dout          ),    // LUT-RAM data output
    .lut_ram_dout_rdy_nxt_i        ( lut_ram_refr_dout_rdy_nxt  ),    // LUT-RAM data output ready during next cycle
`endif

    .vid_ram_dout_i                ( vid_ram_refr_dout          ),    // Video-RAM data output
    .vid_ram_dout_rdy_nxt_i        ( vid_ram_refr_dout_rdy_nxt  ),    // Video-RAM data output ready during next cycle

    .refresh_active_i              ( refresh_active             ),    // Display refresh on going
    .refresh_data_request_i        ( refresh_data_request       ),    // Display refresh new data request
    .refresh_frame_base_addr_i     ( refresh_frame_addr         ),    // Refresh frame base address

    .hw_lut_palette_sel_i          ( hw_lut_palette_sel         ),    // Hardware LUT palette configuration
    .hw_lut_bgcolor_i              ( hw_lut_bgcolor             ),    // Hardware LUT background-color selection
    .hw_lut_fgcolor_i              ( hw_lut_fgcolor             ),    // Hardware LUT foreground-color selection
    .sw_lut_enable_i               ( sw_lut_enable              ),    // Refresh LUT-RAM enable
    .sw_lut_bank_select_i          ( sw_lut_bank_select         )     // Refresh LUT-RAM bank selection
);

//============================================================================
// 6) ARBITER FOR VIDEO AND LUT MEMORIES
//============================================================================

ogfx_ram_arbiter  ogfx_ram_arbiter_inst (

    .mclk                          ( mclk                       ),    // Main system clock
    .puc_rst                       ( puc_rst                    ),    // Main system reset

   //------------------------------------------------------------

   // SW interface, fixed highest priority
    .lut_ram_sw_addr_i             ( lut_ram_sw_addr            ),    // LUT-RAM Software address
    .lut_ram_sw_din_i              ( lut_ram_sw_din             ),    // LUT-RAM Software data
    .lut_ram_sw_wen_i              ( lut_ram_sw_wen             ),    // LUT-RAM Software write strobe (active low)
    .lut_ram_sw_cen_i              ( lut_ram_sw_cen             ),    // LUT-RAM Software chip enable (active low)
    .lut_ram_sw_dout_o             ( lut_ram_sw_dout            ),    // LUT-RAM Software data input

   // Refresh-backend, fixed lowest priority
    .lut_ram_refr_addr_i           ( lut_ram_refr_addr          ),    // LUT-RAM Refresh address
    .lut_ram_refr_din_i            ( 16'h0000                   ),    // LUT-RAM Refresh data
    .lut_ram_refr_wen_i            ( 1'h1                       ),    // LUT-RAM Refresh write strobe (active low)
    .lut_ram_refr_cen_i            ( lut_ram_refr_cen           ),    // LUT-RAM Refresh enable (active low)
    .lut_ram_refr_dout_o           ( lut_ram_refr_dout          ),    // LUT-RAM Refresh data output
    .lut_ram_refr_dout_rdy_nxt_o   ( lut_ram_refr_dout_rdy_nxt  ),    // LUT-RAM Refresh data output ready during next cycle

   // LUT Memory interface
    .lut_ram_addr_o                ( lut_ram_addr_o             ),    // LUT-RAM address
    .lut_ram_din_o                 ( lut_ram_din_o              ),    // LUT-RAM data
    .lut_ram_wen_o                 ( lut_ram_wen_o              ),    // LUT-RAM write strobe (active low)
    .lut_ram_cen_o                 ( lut_ram_cen_o              ),    // LUT-RAM chip enable (active low)
    .lut_ram_dout_i                ( lut_ram_dout_i             ),    // LUT-RAM data input

   //------------------------------------------------------------

   // SW interface, fixed highest priority
    .vid_ram_sw_addr_i             ( vid_ram_sw_addr            ),    // Video-RAM Software address
    .vid_ram_sw_din_i              ( vid_ram_sw_din             ),    // Video-RAM Software data
    .vid_ram_sw_wen_i              ( vid_ram_sw_wen             ),    // Video-RAM Software write strobe (active low)
    .vid_ram_sw_cen_i              ( vid_ram_sw_cen             ),    // Video-RAM Software chip enable (active low)
    .vid_ram_sw_dout_o             ( vid_ram_sw_dout            ),    // Video-RAM Software data input

   // GPU interface (round-robin with refresh-backend)
    .vid_ram_gpu_addr_i            ( vid_ram_gpu_addr           ),    // Video-RAM GPU address
    .vid_ram_gpu_din_i             ( vid_ram_gpu_din            ),    // Video-RAM GPU data
    .vid_ram_gpu_wen_i             ( vid_ram_gpu_wen            ),    // Video-RAM GPU write strobe (active low)
    .vid_ram_gpu_cen_i             ( vid_ram_gpu_cen            ),    // Video-RAM GPU chip enable (active low)
    .vid_ram_gpu_dout_o            ( vid_ram_gpu_dout           ),    // Video-RAM GPU data input
    .vid_ram_gpu_dout_rdy_nxt_o    ( vid_ram_gpu_dout_rdy_nxt   ),    // Video-RAM GPU data output ready during next cycle

   // Refresh-backend (round-robin with GPU interface)
    .vid_ram_refr_addr_i           ( vid_ram_refr_addr          ),    // Video-RAM Refresh address
    .vid_ram_refr_din_i            ( 16'h0000                   ),    // Video-RAM Refresh data
    .vid_ram_refr_wen_i            ( 1'h1                       ),    // Video-RAM Refresh write strobe (active low)
    .vid_ram_refr_cen_i            ( vid_ram_refr_cen           ),    // Video-RAM Refresh enable (active low)
    .vid_ram_refr_dout_o           ( vid_ram_refr_dout          ),    // Video-RAM Refresh data output
    .vid_ram_refr_dout_rdy_nxt_o   ( vid_ram_refr_dout_rdy_nxt  ),    // Video-RAM Refresh data output ready during next cycle

   // Video Memory interface
    .vid_ram_addr_o                ( vid_ram_addr_o             ),    // Video-RAM address
    .vid_ram_din_o                 ( vid_ram_din_o              ),    // Video-RAM data
    .vid_ram_wen_o                 ( vid_ram_wen_o              ),    // Video-RAM write strobe (active low)
    .vid_ram_cen_o                 ( vid_ram_cen_o              ),    // Video-RAM chip enable (active low)
    .vid_ram_dout_i                ( vid_ram_dout_i             )     // Video-RAM data input

   //------------------------------------------------------------
);


endmodule // openGFX430

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
