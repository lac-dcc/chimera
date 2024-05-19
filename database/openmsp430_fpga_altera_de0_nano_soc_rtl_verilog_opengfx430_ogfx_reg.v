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
// *File Name: ogfx_reg.v
//
// *Module Description:
//                      Registers for oMSP programming.
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

module  ogfx_reg (

// OUTPUTs
    irq_gfx_o,                                 // Graphic Controller interrupt

    gpu_data_o,                                // GPU data
    gpu_data_avail_o,                          // GPU data available
    gpu_enable_o,                              // GPU enable

    lt24_reset_n_o,                            // LT24 Reset (Active Low)
    lt24_on_o,                                 // LT24 on/off
    lt24_cfg_clk_o,                            // LT24 Interface clock configuration
    lt24_cfg_refr_o,                           // LT24 Interface refresh configuration
    lt24_cfg_refr_sync_en_o,                   // LT24 Interface refresh sync enable configuration
    lt24_cfg_refr_sync_val_o,                  // LT24 Interface refresh sync value configuration
    lt24_cmd_refr_o,                           // LT24 Interface refresh command
    lt24_cmd_val_o,                            // LT24 Generic command value
    lt24_cmd_has_param_o,                      // LT24 Generic command has parameters
    lt24_cmd_param_o,                          // LT24 Generic command parameter value
    lt24_cmd_param_rdy_o,                      // LT24 Generic command trigger
    lt24_cmd_dfill_o,                          // LT24 Data fill value
    lt24_cmd_dfill_wr_o,                       // LT24 Data fill trigger

    display_width_o,                           // Display width
    display_height_o,                          // Display height
    display_size_o,                            // Display size (number of pixels)
    display_y_swap_o,                          // Display configuration: swap Y axis (horizontal symmetry)
    display_x_swap_o,                          // Display configuration: swap X axis (vertical symmetry)
    display_cl_swap_o,                         // Display configuration: swap column/lines
    gfx_mode_o,                                // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    per_dout_o,                                // Peripheral data output

    refresh_frame_addr_o,                      // Refresh frame base address

    hw_lut_palette_sel_o,                      // Hardware LUT palette configuration
    hw_lut_bgcolor_o,                          // Hardware LUT background-color selection
    hw_lut_fgcolor_o,                          // Hardware LUT foreground-color selection
    sw_lut_enable_o,                           // Refresh LUT-RAM enable
    sw_lut_bank_select_o,                      // Refresh LUT-RAM bank selection

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_addr_o,                            // LUT-RAM address
    lut_ram_din_o,                             // LUT-RAM data
    lut_ram_wen_o,                             // LUT-RAM write strobe (active low)
    lut_ram_cen_o,                             // LUT-RAM chip enable (active low)
`endif

    vid_ram_addr_o,                            // Video-RAM address
    vid_ram_din_o,                             // Video-RAM data
    vid_ram_wen_o,                             // Video-RAM write strobe (active low)
    vid_ram_cen_o,                             // Video-RAM chip enable (active low)

// INPUTs
    dbg_freeze_i,                              // Freeze address auto-incr on read
    gpu_cmd_done_evt_i,                        // GPU command done event
    gpu_cmd_error_evt_i,                       // GPU command error event
    gpu_dma_busy_i,                            // GPU DMA execution on going
    gpu_get_data_i,                            // GPU get next data
    lt24_status_i,                             // LT24 FSM Status
    lt24_start_evt_i,                          // LT24 FSM is starting
    lt24_done_evt_i,                           // LT24 FSM is done
    mclk,                                      // Main system clock
    per_addr_i,                                // Peripheral address
    per_din_i,                                 // Peripheral data input
    per_en_i,                                  // Peripheral enable (high active)
    per_we_i,                                  // Peripheral write enable (high active)
    puc_rst,                                   // Main system reset
`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_dout_i,                            // LUT-RAM data input
`endif
    vid_ram_dout_i                             // Video-RAM data input
);

// PARAMETERs
//============

parameter     [14:0] BASE_ADDR = 15'h0200;     // Register base address
                                               //  - 7 LSBs must stay cleared: 0x0080, 0x0100,
                                               //                              0x0180, 0x0200,
                                               //                              0x0280, ...
// OUTPUTs
//============
output               irq_gfx_o;                // Graphic Controller interrupt

output        [15:0] gpu_data_o;               // GPU data
output               gpu_data_avail_o;         // GPU data available
output               gpu_enable_o;             // GPU enable

output               lt24_reset_n_o;           // LT24 Reset (Active Low)
output               lt24_on_o;                // LT24 on/off
output         [2:0] lt24_cfg_clk_o;           // LT24 Interface clock configuration
output        [11:0] lt24_cfg_refr_o;          // LT24 Interface refresh configuration
output               lt24_cfg_refr_sync_en_o;  // LT24 Interface refresh sync configuration
output         [9:0] lt24_cfg_refr_sync_val_o; // LT24 Interface refresh sync value configuration
output               lt24_cmd_refr_o;          // LT24 Interface refresh command
output         [7:0] lt24_cmd_val_o;           // LT24 Generic command value
output               lt24_cmd_has_param_o;     // LT24 Generic command has parameters
output        [15:0] lt24_cmd_param_o;         // LT24 Generic command parameter value
output               lt24_cmd_param_rdy_o;     // LT24 Generic command trigger
output        [15:0] lt24_cmd_dfill_o;         // LT24 Data fill value
output               lt24_cmd_dfill_wr_o;      // LT24 Data fill trigger

output [`LPIX_MSB:0] display_width_o;          // Display width
output [`LPIX_MSB:0] display_height_o;         // Display height
output [`SPIX_MSB:0] display_size_o;           // Display size (number of pixels)
output               display_y_swap_o;         // Display configuration: swap Y axis (horizontal symmetry)
output               display_x_swap_o;         // Display configuration: swap X axis (vertical symmetry)
output               display_cl_swap_o;        // Display configuration: swap column/lines
output         [2:0] gfx_mode_o;               // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

output        [15:0] per_dout_o;               // Peripheral data output

output [`APIX_MSB:0] refresh_frame_addr_o;     // Refresh frame base address

output         [2:0] hw_lut_palette_sel_o;     // Hardware LUT palette configuration
output         [3:0] hw_lut_bgcolor_o;         // Hardware LUT background-color selection
output         [3:0] hw_lut_fgcolor_o;         // Hardware LUT foreground-color selection
output               sw_lut_enable_o;          // Refresh LUT-RAM enable
output               sw_lut_bank_select_o;     // Refresh LUT-RAM bank selection

`ifdef WITH_PROGRAMMABLE_LUT
output [`LRAM_MSB:0] lut_ram_addr_o;           // LUT-RAM address
output        [15:0] lut_ram_din_o;            // LUT-RAM data
output               lut_ram_wen_o;            // LUT-RAM write strobe (active low)
output               lut_ram_cen_o;            // LUT-RAM chip enable (active low)
`endif

output [`VRAM_MSB:0] vid_ram_addr_o;           // Video-RAM address
output        [15:0] vid_ram_din_o;            // Video-RAM data
output               vid_ram_wen_o;            // Video-RAM write strobe (active low)
output               vid_ram_cen_o;            // Video-RAM chip enable (active low)

// INPUTs
//============
input                dbg_freeze_i;             // Freeze address auto-incr on read
input                gpu_cmd_done_evt_i;       // GPU command done event
input                gpu_cmd_error_evt_i;      // GPU command error event
input                gpu_dma_busy_i;           // GPU DMA execution on going
input                gpu_get_data_i;           // GPU get next data
input          [4:0] lt24_status_i;            // LT24 FSM Status
input                lt24_start_evt_i;         // LT24 FSM is starting
input                lt24_done_evt_i;          // LT24 FSM is done
input                mclk;                     // Main system clock
input         [13:0] per_addr_i;               // Peripheral address
input         [15:0] per_din_i;                // Peripheral data input
input                per_en_i;                 // Peripheral enable (high active)
input          [1:0] per_we_i;                 // Peripheral write enable (high active)
input                puc_rst;                  // Main system reset
`ifdef WITH_PROGRAMMABLE_LUT
input         [15:0] lut_ram_dout_i;           // LUT-RAM data input
`endif
input         [15:0] vid_ram_dout_i;           // Video-RAM data input


//=============================================================================
// 1)  PARAMETER DECLARATION
//=============================================================================

// Decoder bit width (defines how many bits are considered for address decoding)
parameter              DEC_WD              =  7;

// Register addresses offset
parameter [DEC_WD-1:0] GFX_CTRL            = 'h00,  // General control/status/irq
                       GFX_STATUS          = 'h08,
                       GFX_IRQ             = 'h0A,

                       DISPLAY_WIDTH       = 'h10,  // Display configuration
                       DISPLAY_HEIGHT      = 'h12,
                       DISPLAY_SIZE_LO     = 'h14,
                       DISPLAY_SIZE_HI     = 'h16,
                       DISPLAY_CFG         = 'h18,
                       DISPLAY_REFR_CNT    = 'h1A,

                       LT24_CFG            = 'h20,  // LT24 configuration and Generic command sending
                       LT24_REFRESH        = 'h22,
                       LT24_REFRESH_SYNC   = 'h24,
                       LT24_CMD            = 'h26,
                       LT24_CMD_PARAM      = 'h28,
                       LT24_CMD_DFILL      = 'h2A,
                       LT24_STATUS         = 'h2C,

                       LUT_CFG             = 'h30,  // LUT Configuration & Memory Access Gate
                       LUT_RAM_ADDR        = 'h32,
                       LUT_RAM_DATA        = 'h34,

                       FRAME_SELECT        = 'h3E,  // Frame pointers and selection
                       FRAME0_PTR_LO       = 'h40,
                       FRAME0_PTR_HI       = 'h42,
                       FRAME1_PTR_LO       = 'h44,
                       FRAME1_PTR_HI       = 'h46,
                       FRAME2_PTR_LO       = 'h48,
                       FRAME2_PTR_HI       = 'h4A,
                       FRAME3_PTR_LO       = 'h4C,
                       FRAME3_PTR_HI       = 'h4E,

                       VID_RAM0_CFG        = 'h50,  // First Video Memory Access Gate
                       VID_RAM0_WIDTH      = 'h52,
                       VID_RAM0_ADDR_LO    = 'h54,
                       VID_RAM0_ADDR_HI    = 'h56,
                       VID_RAM0_DATA       = 'h58,

                       VID_RAM1_CFG        = 'h60,  // Second Video Memory Access Gate
                       VID_RAM1_WIDTH      = 'h62,
                       VID_RAM1_ADDR_LO    = 'h64,
                       VID_RAM1_ADDR_HI    = 'h66,
                       VID_RAM1_DATA       = 'h68,

                       GPU_CMD_LO          = 'h70,  // Graphic Processing Unit
                       GPU_CMD_HI          = 'h72,
                       GPU_STAT            = 'h74;


// Register one-hot decoder utilities
parameter              DEC_SZ              =  (1 << DEC_WD);
parameter [DEC_SZ-1:0] BASE_REG            =  {{DEC_SZ-1{1'b0}}, 1'b1};

// Register one-hot decoder
parameter [DEC_SZ-1:0] GFX_CTRL_D          = (BASE_REG << GFX_CTRL          ),
                       GFX_STATUS_D        = (BASE_REG << GFX_STATUS        ),
                       GFX_IRQ_D           = (BASE_REG << GFX_IRQ           ),

                       DISPLAY_WIDTH_D     = (BASE_REG << DISPLAY_WIDTH     ),
                       DISPLAY_HEIGHT_D    = (BASE_REG << DISPLAY_HEIGHT    ),
                       DISPLAY_SIZE_LO_D   = (BASE_REG << DISPLAY_SIZE_LO   ),
                       DISPLAY_SIZE_HI_D   = (BASE_REG << DISPLAY_SIZE_HI   ),
                       DISPLAY_CFG_D       = (BASE_REG << DISPLAY_CFG       ),
                       DISPLAY_REFR_CNT_D  = (BASE_REG << DISPLAY_REFR_CNT  ),

                       LT24_CFG_D          = (BASE_REG << LT24_CFG          ),
                       LT24_REFRESH_D      = (BASE_REG << LT24_REFRESH      ),
                       LT24_REFRESH_SYNC_D = (BASE_REG << LT24_REFRESH_SYNC ),
                       LT24_CMD_D          = (BASE_REG << LT24_CMD          ),
                       LT24_CMD_PARAM_D    = (BASE_REG << LT24_CMD_PARAM    ),
                       LT24_CMD_DFILL_D    = (BASE_REG << LT24_CMD_DFILL    ),
                       LT24_STATUS_D       = (BASE_REG << LT24_STATUS       ),

                       LUT_CFG_D           = (BASE_REG << LUT_CFG           ),
                       LUT_RAM_ADDR_D      = (BASE_REG << LUT_RAM_ADDR      ),
                       LUT_RAM_DATA_D      = (BASE_REG << LUT_RAM_DATA      ),

                       FRAME_SELECT_D      = (BASE_REG << FRAME_SELECT      ),
                       FRAME0_PTR_LO_D     = (BASE_REG << FRAME0_PTR_LO     ),
                       FRAME0_PTR_HI_D     = (BASE_REG << FRAME0_PTR_HI     ),
                       FRAME1_PTR_LO_D     = (BASE_REG << FRAME1_PTR_LO     ),
                       FRAME1_PTR_HI_D     = (BASE_REG << FRAME1_PTR_HI     ),
                       FRAME2_PTR_LO_D     = (BASE_REG << FRAME2_PTR_LO     ),
                       FRAME2_PTR_HI_D     = (BASE_REG << FRAME2_PTR_HI     ),
                       FRAME3_PTR_LO_D     = (BASE_REG << FRAME3_PTR_LO     ),
                       FRAME3_PTR_HI_D     = (BASE_REG << FRAME3_PTR_HI     ),

                       VID_RAM0_CFG_D      = (BASE_REG << VID_RAM0_CFG      ),
                       VID_RAM0_WIDTH_D    = (BASE_REG << VID_RAM0_WIDTH    ),
                       VID_RAM0_ADDR_LO_D  = (BASE_REG << VID_RAM0_ADDR_LO  ),
                       VID_RAM0_ADDR_HI_D  = (BASE_REG << VID_RAM0_ADDR_HI  ),
                       VID_RAM0_DATA_D     = (BASE_REG << VID_RAM0_DATA     ),

                       VID_RAM1_CFG_D      = (BASE_REG << VID_RAM1_CFG      ),
                       VID_RAM1_WIDTH_D    = (BASE_REG << VID_RAM1_WIDTH    ),
                       VID_RAM1_ADDR_LO_D  = (BASE_REG << VID_RAM1_ADDR_LO  ),
                       VID_RAM1_ADDR_HI_D  = (BASE_REG << VID_RAM1_ADDR_HI  ),
                       VID_RAM1_DATA_D     = (BASE_REG << VID_RAM1_DATA     ),

                       GPU_CMD_LO_D        = (BASE_REG << GPU_CMD_LO        ),
                       GPU_CMD_HI_D        = (BASE_REG << GPU_CMD_HI        ),
                       GPU_STAT_D          = (BASE_REG << GPU_STAT          );


//============================================================================
// 2)  REGISTER DECODER
//============================================================================

// Local register selection
wire               reg_sel   =  per_en_i & (per_addr_i[13:DEC_WD-1]==BASE_ADDR[14:DEC_WD]);

// Register local address
wire  [DEC_WD-1:0] reg_addr  =  {per_addr_i[DEC_WD-2:0], 1'b0};

// Register address decode
wire  [DEC_SZ-1:0] reg_dec   =  (GFX_CTRL_D          &  {DEC_SZ{(reg_addr == GFX_CTRL          )}})  |
                                (GFX_STATUS_D        &  {DEC_SZ{(reg_addr == GFX_STATUS        )}})  |
                                (GFX_IRQ_D           &  {DEC_SZ{(reg_addr == GFX_IRQ           )}})  |

                                (DISPLAY_WIDTH_D     &  {DEC_SZ{(reg_addr == DISPLAY_WIDTH     )}})  |
                                (DISPLAY_HEIGHT_D    &  {DEC_SZ{(reg_addr == DISPLAY_HEIGHT    )}})  |
                                (DISPLAY_SIZE_LO_D   &  {DEC_SZ{(reg_addr == DISPLAY_SIZE_LO   )}})  |
                                (DISPLAY_SIZE_HI_D   &  {DEC_SZ{(reg_addr == DISPLAY_SIZE_HI   )}})  |
                                (DISPLAY_CFG_D       &  {DEC_SZ{(reg_addr == DISPLAY_CFG       )}})  |
                                (DISPLAY_REFR_CNT_D  &  {DEC_SZ{(reg_addr == DISPLAY_REFR_CNT  )}})  |

                                (LT24_CFG_D          &  {DEC_SZ{(reg_addr == LT24_CFG          )}})  |
                                (LT24_REFRESH_D      &  {DEC_SZ{(reg_addr == LT24_REFRESH      )}})  |
                                (LT24_REFRESH_SYNC_D &  {DEC_SZ{(reg_addr == LT24_REFRESH_SYNC )}})  |
                                (LT24_CMD_D          &  {DEC_SZ{(reg_addr == LT24_CMD          )}})  |
                                (LT24_CMD_PARAM_D    &  {DEC_SZ{(reg_addr == LT24_CMD_PARAM    )}})  |
                                (LT24_CMD_DFILL_D    &  {DEC_SZ{(reg_addr == LT24_CMD_DFILL    )}})  |
                                (LT24_STATUS_D       &  {DEC_SZ{(reg_addr == LT24_STATUS       )}})  |

                                (LUT_CFG_D           &  {DEC_SZ{(reg_addr == LUT_CFG           )}})  |
                                (LUT_RAM_ADDR_D      &  {DEC_SZ{(reg_addr == LUT_RAM_ADDR      )}})  |
                                (LUT_RAM_DATA_D      &  {DEC_SZ{(reg_addr == LUT_RAM_DATA      )}})  |

                                (FRAME_SELECT_D      &  {DEC_SZ{(reg_addr == FRAME_SELECT      )}})  |
                                (FRAME0_PTR_LO_D     &  {DEC_SZ{(reg_addr == FRAME0_PTR_LO     )}})  |
                                (FRAME0_PTR_HI_D     &  {DEC_SZ{(reg_addr == FRAME0_PTR_HI     )}})  |
                                (FRAME1_PTR_LO_D     &  {DEC_SZ{(reg_addr == FRAME1_PTR_LO     )}})  |
                                (FRAME1_PTR_HI_D     &  {DEC_SZ{(reg_addr == FRAME1_PTR_HI     )}})  |
                                (FRAME2_PTR_LO_D     &  {DEC_SZ{(reg_addr == FRAME2_PTR_LO     )}})  |
                                (FRAME2_PTR_HI_D     &  {DEC_SZ{(reg_addr == FRAME2_PTR_HI     )}})  |
                                (FRAME3_PTR_LO_D     &  {DEC_SZ{(reg_addr == FRAME3_PTR_LO     )}})  |
                                (FRAME3_PTR_HI_D     &  {DEC_SZ{(reg_addr == FRAME3_PTR_HI     )}})  |

                                (VID_RAM0_CFG_D      &  {DEC_SZ{(reg_addr == VID_RAM0_CFG      )}})  |
                                (VID_RAM0_WIDTH_D    &  {DEC_SZ{(reg_addr == VID_RAM0_WIDTH    )}})  |
                                (VID_RAM0_ADDR_LO_D  &  {DEC_SZ{(reg_addr == VID_RAM0_ADDR_LO  )}})  |
                                (VID_RAM0_ADDR_HI_D  &  {DEC_SZ{(reg_addr == VID_RAM0_ADDR_HI  )}})  |
                                (VID_RAM0_DATA_D     &  {DEC_SZ{(reg_addr == VID_RAM0_DATA     )}})  |

                                (VID_RAM1_CFG_D      &  {DEC_SZ{(reg_addr == VID_RAM1_CFG      )}})  |
                                (VID_RAM1_WIDTH_D    &  {DEC_SZ{(reg_addr == VID_RAM1_WIDTH    )}})  |
                                (VID_RAM1_ADDR_LO_D  &  {DEC_SZ{(reg_addr == VID_RAM1_ADDR_LO  )}})  |
                                (VID_RAM1_ADDR_HI_D  &  {DEC_SZ{(reg_addr == VID_RAM1_ADDR_HI  )}})  |
                                (VID_RAM1_DATA_D     &  {DEC_SZ{(reg_addr == VID_RAM1_DATA     )}})  |

                                (GPU_CMD_LO_D        &  {DEC_SZ{(reg_addr == GPU_CMD_LO        )}})  |
                                (GPU_CMD_HI_D        &  {DEC_SZ{(reg_addr == GPU_CMD_HI        )}})  |
                                (GPU_STAT_D          &  {DEC_SZ{(reg_addr == GPU_STAT          )}});

// Read/Write probes
wire               reg_write =  |per_we_i & reg_sel;
wire               reg_read  = ~|per_we_i & reg_sel;

// Read/Write vectors
wire  [DEC_SZ-1:0] reg_wr    = reg_dec & {DEC_SZ{reg_write}};
wire  [DEC_SZ-1:0] reg_rd    = reg_dec & {DEC_SZ{reg_read}};

// Other wire declarations
wire [`APIX_MSB:0] frame0_ptr;
`ifdef WITH_FRAME1_POINTER
wire [`APIX_MSB:0] frame1_ptr;
`endif
`ifdef WITH_FRAME2_POINTER
wire [`APIX_MSB:0] frame2_ptr;
`endif
`ifdef WITH_FRAME3_POINTER
wire [`APIX_MSB:0] frame3_ptr;
`endif
wire [`APIX_MSB:0] vid_ram0_base_addr;
wire [`APIX_MSB:0] vid_ram1_base_addr;
wire               refr_cnt_done_evt;
wire               gpu_fifo_done_evt;
wire               gpu_fifo_ovfl_evt;


//============================================================================
// 3) REGISTERS
//============================================================================

//------------------------------------------------
// GFX_CTRL Register
//------------------------------------------------
reg  [15:0] gfx_ctrl;

wire        gfx_ctrl_wr = reg_wr[GFX_CTRL];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)          gfx_ctrl <=  16'h0000;
  else if (gfx_ctrl_wr) gfx_ctrl <=  per_din_i;

// Bitfield assignments
wire        gfx_irq_refr_done_en     =  gfx_ctrl[0];
wire        gfx_irq_refr_start_en    =  gfx_ctrl[1];
wire        gfx_irq_refr_cnt_done_en =  gfx_ctrl[2];
wire        gfx_irq_gpu_fifo_done_en =  gfx_ctrl[4];
wire        gfx_irq_gpu_fifo_ovfl_en =  gfx_ctrl[5];
wire        gfx_irq_gpu_cmd_done_en  =  gfx_ctrl[6];
wire        gfx_irq_gpu_cmd_error_en =  gfx_ctrl[7];
assign      gfx_mode_o               =  gfx_ctrl[10:8]; // 1xx: 16 bits-per-pixel
                                                        // 011:  8 bits-per-pixel
                                                        // 010:  4 bits-per-pixel
                                                        // 001:  2 bits-per-pixel
                                                        // 000:  1 bits-per-pixel
wire        gpu_enable_o             =  gfx_ctrl[12];

// Video modes decoding
wire        gfx_mode_1_bpp           =  (gfx_mode_o == 3'b000);
wire        gfx_mode_2_bpp           =  (gfx_mode_o == 3'b001);
wire        gfx_mode_4_bpp           =  (gfx_mode_o == 3'b010);
wire        gfx_mode_8_bpp           =  (gfx_mode_o == 3'b011);
wire        gfx_mode_16_bpp          = ~(gfx_mode_8_bpp | gfx_mode_4_bpp | gfx_mode_2_bpp | gfx_mode_1_bpp);

//------------------------------------------------
// GFX_STATUS Register
//------------------------------------------------
wire  [15:0] gfx_status;
wire         gpu_busy;

assign       gfx_status[0]    = lt24_status_i[2]; // Screen Refresh is busy
assign       gfx_status[3:1]  = 3'b000;
assign       gfx_status[4]    = gpu_data_avail_o;
assign       gfx_status[5]    = 1'b0;
assign       gfx_status[6]    = gpu_busy;
assign       gfx_status[7]    = 1'b0;
assign       gfx_status[15:8] = 15'h0000;

//------------------------------------------------
// GFX_IRQ Register
//------------------------------------------------
wire [15:0] gfx_irq;

// Clear IRQ when 1 is written. Set IRQ when FSM is done
wire        gfx_irq_refr_done_clr     = per_din_i[0] & reg_wr[GFX_IRQ];
wire        gfx_irq_refr_done_set     = lt24_done_evt_i;

wire        gfx_irq_refr_start_clr    = per_din_i[1] & reg_wr[GFX_IRQ];
wire        gfx_irq_refr_start_set    = lt24_start_evt_i;

wire        gfx_irq_refr_cnt_done_clr = per_din_i[2] & reg_wr[GFX_IRQ];
wire        gfx_irq_refr_cnt_done_set = refr_cnt_done_evt;

wire        gfx_irq_gpu_fifo_done_clr = per_din_i[4] & reg_wr[GFX_IRQ];
wire        gfx_irq_gpu_fifo_done_set = gpu_fifo_done_evt;

wire        gfx_irq_gpu_fifo_ovfl_clr = per_din_i[5] & reg_wr[GFX_IRQ];
wire        gfx_irq_gpu_fifo_ovfl_set = gpu_fifo_ovfl_evt;

wire        gfx_irq_gpu_cmd_done_clr  = per_din_i[6] & reg_wr[GFX_IRQ];
wire        gfx_irq_gpu_cmd_done_set  = gpu_cmd_done_evt_i;

wire        gfx_irq_gpu_cmd_error_clr = per_din_i[7] & reg_wr[GFX_IRQ];
wire        gfx_irq_gpu_cmd_error_set = gpu_cmd_error_evt_i;

reg         gfx_irq_refr_done;
reg         gfx_irq_refr_start;
reg         gfx_irq_refr_cnt_done;
reg         gfx_irq_gpu_fifo_done;
reg         gfx_irq_gpu_fifo_ovfl;
reg         gfx_irq_gpu_cmd_done;
reg         gfx_irq_gpu_cmd_error;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       gfx_irq_refr_done     <=  1'b0;
       gfx_irq_refr_start    <=  1'b0;
       gfx_irq_refr_cnt_done <=  1'b0;
       gfx_irq_gpu_fifo_done <=  1'b0;
       gfx_irq_gpu_fifo_ovfl <=  1'b0;
       gfx_irq_gpu_cmd_done  <=  1'b0;
       gfx_irq_gpu_cmd_error <=  1'b0;
    end
  else
    begin
       gfx_irq_refr_done     <=  (gfx_irq_refr_done_set     | (~gfx_irq_refr_done_clr     & gfx_irq_refr_done    )); // IRQ set has priority over clear
       gfx_irq_refr_start    <=  (gfx_irq_refr_start_set    | (~gfx_irq_refr_start_clr    & gfx_irq_refr_start   )); // IRQ set has priority over clear
       gfx_irq_refr_cnt_done <=  (gfx_irq_refr_cnt_done_set | (~gfx_irq_refr_cnt_done_clr & gfx_irq_refr_cnt_done)); // IRQ set has priority over clear
       gfx_irq_gpu_fifo_done <=  (gfx_irq_gpu_fifo_done_set | (~gfx_irq_gpu_fifo_done_clr & gfx_irq_gpu_fifo_done)); // IRQ set has priority over clear
       gfx_irq_gpu_fifo_ovfl <=  (gfx_irq_gpu_fifo_ovfl_set | (~gfx_irq_gpu_fifo_ovfl_clr & gfx_irq_gpu_fifo_ovfl)); // IRQ set has priority over clear
       gfx_irq_gpu_cmd_done  <=  (gfx_irq_gpu_cmd_done_set  | (~gfx_irq_gpu_cmd_done_clr  & gfx_irq_gpu_cmd_done )); // IRQ set has priority over clear
       gfx_irq_gpu_cmd_error <=  (gfx_irq_gpu_cmd_error_set | (~gfx_irq_gpu_cmd_error_clr & gfx_irq_gpu_cmd_error)); // IRQ set has priority over clear
    end

assign  gfx_irq   = {8'h00,
                     gfx_irq_gpu_cmd_error, gfx_irq_gpu_cmd_done, gfx_irq_gpu_fifo_ovfl, gfx_irq_gpu_fifo_done,
                     2'h0, gfx_irq_refr_start, gfx_irq_refr_done};

assign  irq_gfx_o = (gfx_irq_refr_done     & gfx_irq_refr_done_en)     |
                    (gfx_irq_refr_start    & gfx_irq_refr_start_en)    |
                    (gfx_irq_refr_cnt_done & gfx_irq_refr_cnt_done_en) |
                    (gfx_irq_gpu_cmd_error & gfx_irq_gpu_cmd_error_en) |
                    (gfx_irq_gpu_cmd_done  & gfx_irq_gpu_cmd_done_en)  |
                    (gfx_irq_gpu_fifo_ovfl & gfx_irq_gpu_fifo_ovfl_en) |
                    (gfx_irq_gpu_fifo_done & gfx_irq_gpu_fifo_done_en);  // Graphic Controller interrupt

//------------------------------------------------
// DISPLAY_WIDTH Register
//------------------------------------------------
reg  [`LPIX_MSB:0] display_width_o;

wire               display_width_wr = reg_wr[DISPLAY_WIDTH];
wire [`LPIX_MSB:0] display_w_h_nxt  = (|per_din_i[`LPIX_MSB:0]) ? per_din_i[`LPIX_MSB:0] :
                                                                  {{`LPIX_MSB{1'b0}}, 1'b1};

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)               display_width_o <=  {{`LPIX_MSB{1'b0}}, 1'b1};
  else if (display_width_wr) display_width_o <=  display_w_h_nxt;

wire [16:0] display_width_tmp = {{16-`LPIX_MSB{1'b0}}, display_width_o};
wire [15:0] display_width_rd  = display_width_tmp[15:0];

//------------------------------------------------
// DISPLAY_HEIGHT Register
//------------------------------------------------
reg  [`LPIX_MSB:0] display_height_o;

wire               display_height_wr = reg_wr[DISPLAY_HEIGHT];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                display_height_o <=  {{`LPIX_MSB{1'b0}}, 1'b1};
  else if (display_height_wr) display_height_o <=  display_w_h_nxt;

wire [16:0] display_height_tmp = {{16-`LPIX_MSB{1'b0}}, display_height_o};
wire [15:0] display_height_rd  = display_height_tmp[15:0];

//------------------------------------------------
// DISPLAY_SIZE_HI Register
//------------------------------------------------
`ifdef WITH_DISPLAY_SIZE_HI
reg  [`SPIX_HI_MSB:0] display_size_hi;

wire                  display_size_hi_wr = reg_wr[DISPLAY_SIZE_HI];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                 display_size_hi <=  {`SPIX_HI_MSB+1{1'h0}};
  else if (display_size_hi_wr) display_size_hi <=  per_din_i[`SPIX_HI_MSB:0];

wire  [16:0] display_size_hi_tmp = {{16-`SPIX_HI_MSB{1'h0}}, display_size_hi};
wire  [15:0] display_size_hi_rd  = display_size_hi_tmp[15:0];
`endif

//------------------------------------------------
// DISPLAY_SIZE_LO Register
//------------------------------------------------
reg  [`SPIX_LO_MSB:0] display_size_lo;

wire                  display_size_lo_wr = reg_wr[DISPLAY_SIZE_LO];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                 display_size_lo <=  {{`SPIX_LO_MSB{1'h0}}, 1'b1};
  else if (display_size_lo_wr) display_size_lo <=  per_din_i[`SPIX_LO_MSB:0];

wire  [16:0] display_size_lo_tmp = {{16-`SPIX_LO_MSB{1'h0}}, display_size_lo};
wire  [15:0] display_size_lo_rd  = display_size_lo_tmp[15:0];

`ifdef WITH_DISPLAY_SIZE_HI
assign display_size_o = {display_size_hi, display_size_lo};
`else
assign display_size_o =  display_size_lo;
`endif

//------------------------------------------------
// DISPLAY_CFG Register
//------------------------------------------------
reg   display_x_swap_o;
reg   display_y_swap_o;
reg   display_cl_swap_o;

wire  display_cfg_wr = reg_wr[DISPLAY_CFG];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       display_cl_swap_o <=  1'b0;
       display_y_swap_o  <=  1'b0;
       display_x_swap_o  <=  1'b0;
    end
  else if (display_cfg_wr)
    begin
       display_cl_swap_o <=  per_din_i[0];
       display_y_swap_o  <=  per_din_i[1];
       display_x_swap_o  <=  per_din_i[2];
    end

wire [15:0] display_cfg = {13'h0000,
                           display_x_swap_o,
                           display_y_swap_o,
                           display_cl_swap_o};

//------------------------------------------------
// DISPLAY_REFR_CNT Register
//------------------------------------------------
reg  [15:0] display_refr_cnt;

wire        display_refr_cnt_wr  = reg_wr[DISPLAY_REFR_CNT];
wire        display_refr_cnt_dec = gfx_irq_refr_done_set & (display_refr_cnt != 16'h0000);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   display_refr_cnt <=  16'h0000;
  else if (display_refr_cnt_wr)  display_refr_cnt <=  per_din_i;
  else if (display_refr_cnt_dec) display_refr_cnt <=  display_refr_cnt + 16'hFFFF; // -1

assign      refr_cnt_done_evt = (display_refr_cnt==16'h0001) & display_refr_cnt_dec;

//------------------------------------------------
// LT24_CFG Register
//------------------------------------------------
reg  [15:0] lt24_cfg;

wire        lt24_cfg_wr = reg_wr[LT24_CFG];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)          lt24_cfg <=  16'h0000;
  else if (lt24_cfg_wr) lt24_cfg <=  per_din_i;

// Bitfield assignments
assign     lt24_cfg_clk_o  =  lt24_cfg[6:4];
assign     lt24_reset_n_o  = ~lt24_cfg[1];
assign     lt24_on_o       =  lt24_cfg[0];

//------------------------------------------------
// LT24_REFRESH Register
//------------------------------------------------
reg        lt24_cmd_refr_o;
reg [11:0] lt24_cfg_refr_o;

wire      lt24_refresh_wr   = reg_wr[LT24_REFRESH];
wire      lt24_cmd_refr_clr = lt24_done_evt_i & lt24_status_i[2] & (lt24_cfg_refr_o==12'h000); // Auto-clear in manual refresh mode when done

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                lt24_cmd_refr_o      <=  1'h0;
  else if (lt24_refresh_wr)   lt24_cmd_refr_o      <=  per_din_i[0];
  else if (lt24_cmd_refr_clr) lt24_cmd_refr_o      <=  1'h0;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                lt24_cfg_refr_o      <=  12'h000;
  else if (lt24_refresh_wr)   lt24_cfg_refr_o      <=  per_din_i[15:4];

wire [15:0] lt24_refresh = {lt24_cfg_refr_o, 3'h0, lt24_cmd_refr_o};

//------------------------------------------------
// LT24_REFRESH_SYNC Register
//------------------------------------------------
reg        lt24_cfg_refr_sync_en_o;
reg  [9:0] lt24_cfg_refr_sync_val_o;

wire       lt24_refresh_sync_wr   = reg_wr[LT24_REFRESH_SYNC];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   lt24_cfg_refr_sync_en_o  <=  1'h0;
  else if (lt24_refresh_sync_wr) lt24_cfg_refr_sync_en_o  <=  per_din_i[15];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   lt24_cfg_refr_sync_val_o <=  10'h000;
  else if (lt24_refresh_sync_wr) lt24_cfg_refr_sync_val_o <=  per_din_i[9:0];

wire [15:0] lt24_refresh_sync = {lt24_cfg_refr_sync_en_o, 5'h00, lt24_cfg_refr_sync_val_o};


//------------------------------------------------
// LT24_CMD Register
//------------------------------------------------
reg  [15:0] lt24_cmd;

wire        lt24_cmd_wr = reg_wr[LT24_CMD];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)          lt24_cmd <=  16'h0000;
  else if (lt24_cmd_wr) lt24_cmd <=  per_din_i;

assign     lt24_cmd_val_o       = lt24_cmd[7:0];
assign     lt24_cmd_has_param_o = lt24_cmd[8];

//------------------------------------------------
// LT24_CMD_PARAM Register
//------------------------------------------------
reg  [15:0] lt24_cmd_param_o;

wire        lt24_cmd_param_wr = reg_wr[LT24_CMD_PARAM];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                lt24_cmd_param_o <=  16'h0000;
  else if (lt24_cmd_param_wr) lt24_cmd_param_o <=  per_din_i;

reg lt24_cmd_param_rdy_o;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) lt24_cmd_param_rdy_o <=  1'b0;
  else         lt24_cmd_param_rdy_o <=  lt24_cmd_param_wr;

//------------------------------------------------
// LT24_CMD_DFILL Register
//------------------------------------------------
reg  [15:0] lt24_cmd_dfill_o;

assign      lt24_cmd_dfill_wr_o = reg_wr[LT24_CMD_DFILL];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                  lt24_cmd_dfill_o <=  16'h0000;
  else if (lt24_cmd_dfill_wr_o) lt24_cmd_dfill_o <=  per_din_i;

//------------------------------------------------
// LT24_STATUS Register
//------------------------------------------------
wire  [15:0] lt24_status;

assign       lt24_status[0]    = lt24_status_i[0]; // FSM_BUSY
assign       lt24_status[1]    = lt24_status_i[1]; // WAIT_PARAM
assign       lt24_status[2]    = lt24_status_i[2]; // REFRESH_BUSY
assign       lt24_status[3]    = lt24_status_i[3]; // WAIT_FOR_SCANLINE
assign       lt24_status[4]    = lt24_status_i[4]; // DATA_FILL_BUSY
assign       lt24_status[15:5] = 11'h000;

//------------------------------------------------
// LUT_CFG Register
//------------------------------------------------

wire       lut_cfg_wr = reg_wr[LUT_CFG];

`ifdef WITH_PROGRAMMABLE_LUT
  reg      sw_lut_enable_o;
  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)         sw_lut_enable_o      <=  1'b0;
    else if (lut_cfg_wr) sw_lut_enable_o      <=  per_din_i[0]; // Enable software color LUT

  reg      sw_lut_ram_rmw_mode;
  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)         sw_lut_ram_rmw_mode  <=  1'b0;
    else if (lut_cfg_wr) sw_lut_ram_rmw_mode  <=  per_din_i[1];

  `ifdef WITH_EXTRA_LUT_BANK
  reg      sw_lut_bank_select_o;
  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)         sw_lut_bank_select_o <=  1'b0;
    else if (lut_cfg_wr) sw_lut_bank_select_o <=  per_din_i[2];
  `else
  assign   sw_lut_bank_select_o  =  1'b0;
  `endif
`else
  assign   sw_lut_bank_select_o  =  1'b0;
  assign   sw_lut_enable_o       =  1'b0;
  wire     sw_lut_ram_rmw_mode   =  1'b0;
`endif

reg  [2:0] hw_lut_palette_sel_o;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)           hw_lut_palette_sel_o <=  3'h0;
  else if (lut_cfg_wr)   hw_lut_palette_sel_o <=  per_din_i[6:4];

reg  [3:0] hw_lut_bgcolor_o;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)           hw_lut_bgcolor_o     <=  4'h0;
  else if (lut_cfg_wr)   hw_lut_bgcolor_o     <=  per_din_i[11:8];

reg  [3:0] hw_lut_fgcolor_o;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)           hw_lut_fgcolor_o     <=  4'hf;
  else if (lut_cfg_wr)   hw_lut_fgcolor_o     <=  per_din_i[15:12];

wire [15:0] lut_cfg_rd  = {hw_lut_fgcolor_o,    hw_lut_bgcolor_o,
                           1'b0,                hw_lut_palette_sel_o,
                           1'b0,                sw_lut_bank_select_o,
                           sw_lut_ram_rmw_mode, sw_lut_enable_o};

//------------------------------------------------
// LUT_RAM_ADDR Register
//------------------------------------------------
`ifdef WITH_PROGRAMMABLE_LUT

reg  [7:0] lut_ram_addr;
wire [8:0] lut_ram_addr_inc;
wire       lut_ram_addr_inc_wr;

wire       lut_ram_addr_wr = reg_wr[LUT_RAM_ADDR];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                  lut_ram_addr    <=  8'h00;
  else if (lut_ram_addr_wr)     lut_ram_addr    <=  per_din_i[7:0];
  else if (lut_ram_addr_inc_wr) lut_ram_addr    <=  lut_ram_addr_inc[7:0];

`ifdef WITH_EXTRA_LUT_BANK
reg        lut_bank_select;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                  lut_bank_select <=  1'b0;
  else if (lut_ram_addr_wr)     lut_bank_select <=  per_din_i[8];
  else if (lut_ram_addr_inc_wr) lut_bank_select <=  lut_ram_addr_inc[8];
`else
wire        lut_bank_select  =  1'b0;
`endif

assign      lut_ram_addr_inc =        {lut_bank_select, lut_ram_addr} + 9'h001;
wire [15:0] lut_ram_addr_rd  = {7'h00, lut_bank_select, lut_ram_addr};

`ifdef WITH_EXTRA_LUT_BANK
assign      lut_ram_addr_o   = {lut_bank_select, lut_ram_addr};
`else
assign      lut_ram_addr_o   =                   lut_ram_addr;
`endif

`else
wire [15:0] lut_ram_addr_rd  =  16'h0000;
`endif

//------------------------------------------------
// LUT_RAM_DATA Register
//------------------------------------------------
`ifdef WITH_PROGRAMMABLE_LUT

// Update the LUT_RAM_DATA register with regular register write access
wire        lut_ram_data_wr  = reg_wr[LUT_RAM_DATA];
wire        lut_ram_data_rd  = reg_rd[LUT_RAM_DATA];
reg         lut_ram_dout_rdy;

// LUT-RAM data Register
reg  [15:0] lut_ram_data;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)               lut_ram_data <=  16'h0000;
  else if (lut_ram_data_wr)  lut_ram_data <=  per_din_i;
  else if (lut_ram_dout_rdy) lut_ram_data <=  lut_ram_dout_i;

// Increment the address after a write or read access to the LUT_RAM_DATA register
// - one clock cycle after a write access
// - with the read access (if not in read-modify-write mode)
assign lut_ram_addr_inc_wr = lut_ram_data_wr | (lut_ram_data_rd & ~dbg_freeze_i & ~sw_lut_ram_rmw_mode);

// Apply peripheral data bus % write strobe during VID_RAMx_DATA write access
assign lut_ram_din_o       =    per_din_i & {16{lut_ram_data_wr}};
assign lut_ram_wen_o       = ~(|per_we_i  &     lut_ram_data_wr);

// Trigger a LUT-RAM read access immediately after:
//   - a LUT-RAM_ADDR register write access
//   - a LUT-RAM_DATA register read access
reg lut_ram_addr_wr_dly;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) lut_ram_addr_wr_dly <= 1'b0;
  else         lut_ram_addr_wr_dly <= lut_ram_addr_wr;

reg  lut_ram_data_rd_dly;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) lut_ram_data_rd_dly    <= 1'b0;
  else         lut_ram_data_rd_dly    <= lut_ram_data_rd;

// Chip enable.
// Note: we perform a data read access:
//       - one cycle after a VID_RAM_DATA register read access (so that the address has been incremented)
//       - one cycle after a VID_RAM_ADDR register write
assign lut_ram_cen_o = ~(lut_ram_addr_wr_dly | lut_ram_data_rd_dly | // Read access
                         lut_ram_data_wr);                           // Write access

// Update the VRAM_DATA register one cycle after each memory access
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) lut_ram_dout_rdy <= 1'b0;
  else         lut_ram_dout_rdy <= ~lut_ram_cen_o;

`else
wire [15:0] lut_ram_data  = 16'h0000;
`endif

//------------------------------------------------
// FRAME_SELECT Register
//------------------------------------------------

wire  frame_select_wr = reg_wr[FRAME_SELECT];

`ifdef WITH_FRAME1_POINTER
  `ifdef WITH_FRAME2_POINTER
  reg  [1:0] refresh_frame_select;
  reg  [1:0] vid_ram0_frame_select;
  reg  [1:0] vid_ram1_frame_select;

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)
      begin
         refresh_frame_select  <= 2'h0;
         vid_ram0_frame_select <= 2'h0;
         vid_ram1_frame_select <= 2'h0;
      end
    else if (frame_select_wr)
      begin
         refresh_frame_select  <= per_din_i[1:0];
         vid_ram0_frame_select <= per_din_i[9:8];
         vid_ram1_frame_select <= per_din_i[13:12];
      end

  wire [15:0] frame_select = {2'h0, vid_ram1_frame_select, 2'h0, vid_ram0_frame_select, 6'h00, refresh_frame_select};
  `else
  reg        refresh_frame_select;
  reg        vid_ram0_frame_select;
  reg        vid_ram1_frame_select;

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)
      begin
         refresh_frame_select  <= 1'h0;
         vid_ram0_frame_select <= 1'h0;
         vid_ram1_frame_select <= 1'h0;
      end
    else if (frame_select_wr)
      begin
         refresh_frame_select  <= per_din_i[0];
         vid_ram0_frame_select <= per_din_i[8];
         vid_ram1_frame_select <= per_din_i[12];
      end

  wire [15:0] frame_select = {3'h0, vid_ram1_frame_select, 3'h0, vid_ram0_frame_select, 7'h00, refresh_frame_select};
  `endif
`else
  wire [15:0] frame_select = 16'h0000;
`endif

// Frame pointer selections
`ifdef WITH_FRAME1_POINTER
assign refresh_frame_addr_o  = (refresh_frame_select==0)  ? frame0_ptr :
                           `ifdef WITH_FRAME2_POINTER
                               (refresh_frame_select==1)  ? frame1_ptr :
                             `ifdef WITH_FRAME3_POINTER
                               (refresh_frame_select==2)  ? frame2_ptr :
                                                            frame3_ptr ;
                             `else
                                                            frame2_ptr ;
                             `endif
                           `else
                                                            frame1_ptr ;
                           `endif

assign vid_ram0_base_addr    = (vid_ram0_frame_select==0) ? frame0_ptr :
                           `ifdef WITH_FRAME2_POINTER
                               (vid_ram0_frame_select==1) ? frame1_ptr :
                             `ifdef WITH_FRAME3_POINTER
                               (vid_ram0_frame_select==2) ? frame2_ptr :
                                                            frame3_ptr ;
                             `else
                                                            frame2_ptr ;
                             `endif
                           `else
                                                            frame1_ptr ;
                           `endif

assign vid_ram1_base_addr    = (vid_ram1_frame_select==0) ? frame0_ptr :
                           `ifdef WITH_FRAME2_POINTER
                               (vid_ram1_frame_select==1) ? frame1_ptr :
                             `ifdef WITH_FRAME3_POINTER
                               (vid_ram1_frame_select==2) ? frame2_ptr :
                                                            frame3_ptr ;
                             `else
                                                            frame2_ptr ;
                             `endif
                           `else
                                                            frame1_ptr ;
                           `endif

`else
assign refresh_frame_addr_o  = frame0_ptr;
assign vid_ram0_base_addr    = frame0_ptr;
assign vid_ram1_base_addr    = frame0_ptr;
`endif

//------------------------------------------------
// FRAME0_PTR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] frame0_ptr_hi;

wire                 frame0_ptr_hi_wr = reg_wr[FRAME0_PTR_HI];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)               frame0_ptr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (frame0_ptr_hi_wr) frame0_ptr_hi <=  per_din_i[`APIX_HI_MSB:0];

wire [16:0] frame0_ptr_hi_tmp = {{16-`APIX_HI_MSB{1'b0}}, frame0_ptr_hi};
wire [15:0] frame0_ptr_hi_rd  = frame0_ptr_hi_tmp[15:0];
`endif

//------------------------------------------------
// FRAME0_PTR_LO Register
//------------------------------------------------
reg  [`APIX_LO_MSB:0] frame0_ptr_lo;

wire                  frame0_ptr_lo_wr = reg_wr[FRAME0_PTR_LO];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)               frame0_ptr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (frame0_ptr_lo_wr) frame0_ptr_lo <=  per_din_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      frame0_ptr        = {frame0_ptr_hi[`APIX_HI_MSB:0], frame0_ptr_lo};
wire [15:0] frame0_ptr_lo_rd  = frame0_ptr_lo;
`else
assign      frame0_ptr        = {frame0_ptr_lo[`APIX_LO_MSB:0]};
wire [16:0] frame0_ptr_lo_tmp = {{16-`APIX_LO_MSB{1'b0}}, frame0_ptr_lo};
wire [15:0] frame0_ptr_lo_rd  = frame0_ptr_lo_tmp[15:0];
`endif

//------------------------------------------------
// FRAME1_PTR_HI Register
//------------------------------------------------
`ifdef WITH_FRAME1_POINTER
  `ifdef VRAM_BIGGER_4_KW
  reg [`APIX_HI_MSB:0] frame1_ptr_hi;

  wire                 frame1_ptr_hi_wr = reg_wr[FRAME1_PTR_HI];

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)               frame1_ptr_hi <=  {`APIX_HI_MSB+1{1'b0}};
    else if (frame1_ptr_hi_wr) frame1_ptr_hi <=  per_din_i[`APIX_HI_MSB:0];

  wire [16:0] frame1_ptr_hi_tmp = {{16-`APIX_HI_MSB{1'b0}}, frame1_ptr_hi};
  wire [15:0] frame1_ptr_hi_rd  = frame1_ptr_hi_tmp[15:0];
  `endif
`endif

//------------------------------------------------
// FRAME1_PTR_LO Register
//------------------------------------------------
`ifdef WITH_FRAME1_POINTER
  reg  [`APIX_LO_MSB:0] frame1_ptr_lo;

  wire                  frame1_ptr_lo_wr = reg_wr[FRAME1_PTR_LO];

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)               frame1_ptr_lo <=  {`APIX_LO_MSB+1{1'b0}};
    else if (frame1_ptr_lo_wr) frame1_ptr_lo <=  per_din_i[`APIX_LO_MSB:0];

  `ifdef VRAM_BIGGER_4_KW
  assign      frame1_ptr        = {frame1_ptr_hi[`APIX_HI_MSB:0], frame1_ptr_lo};
  wire [15:0] frame1_ptr_lo_rd  = frame1_ptr_lo;
  `else
  assign      frame1_ptr        = {frame1_ptr_lo[`APIX_LO_MSB:0]};
  wire [16:0] frame1_ptr_lo_tmp = {{16-`APIX_LO_MSB{1'b0}}, frame1_ptr_lo};
  wire [15:0] frame1_ptr_lo_rd  = frame1_ptr_lo_tmp[15:0];
  `endif
`endif

//------------------------------------------------
// FRAME2_PTR_HI Register
//------------------------------------------------
`ifdef WITH_FRAME2_POINTER
  `ifdef VRAM_BIGGER_4_KW
  reg [`APIX_HI_MSB:0] frame2_ptr_hi;

  wire                 frame2_ptr_hi_wr = reg_wr[FRAME2_PTR_HI];

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)               frame2_ptr_hi <=  {`APIX_HI_MSB+1{1'b0}};
    else if (frame2_ptr_hi_wr) frame2_ptr_hi <=  per_din_i[`APIX_HI_MSB:0];

  wire [16:0] frame2_ptr_hi_tmp = {{16-`APIX_HI_MSB{1'b0}}, frame2_ptr_hi};
  wire [15:0] frame2_ptr_hi_rd  = frame2_ptr_hi_tmp[15:0];
  `endif
`endif

//------------------------------------------------
// FRAME2_PTR_LO Register
//------------------------------------------------
`ifdef WITH_FRAME2_POINTER
  reg  [`APIX_LO_MSB:0] frame2_ptr_lo;

  wire                  frame2_ptr_lo_wr = reg_wr[FRAME2_PTR_LO];

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)               frame2_ptr_lo <=  {`APIX_LO_MSB+1{1'b0}};
    else if (frame2_ptr_lo_wr) frame2_ptr_lo <=  per_din_i[`APIX_LO_MSB:0];

  `ifdef VRAM_BIGGER_4_KW
  assign      frame2_ptr        = {frame2_ptr_hi[`APIX_HI_MSB:0], frame2_ptr_lo};
  wire [15:0] frame2_ptr_lo_rd  = frame2_ptr_lo;
  `else
  assign      frame2_ptr        = {frame2_ptr_lo[`APIX_LO_MSB:0]};
  wire [16:0] frame2_ptr_lo_tmp = {{16-`APIX_LO_MSB{1'b0}}, frame2_ptr_lo};
  wire [15:0] frame2_ptr_lo_rd  = frame2_ptr_lo_tmp[15:0];
  `endif
`endif

//------------------------------------------------
// FRAME3_PTR_HI Register
//------------------------------------------------
`ifdef WITH_FRAME3_POINTER
  `ifdef VRAM_BIGGER_4_KW
  reg [`APIX_HI_MSB:0] frame3_ptr_hi;

  wire                 frame3_ptr_hi_wr = reg_wr[FRAME3_PTR_HI];

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)               frame3_ptr_hi <=  {`APIX_HI_MSB+1{1'b0}};
    else if (frame3_ptr_hi_wr) frame3_ptr_hi <=  per_din_i[`APIX_HI_MSB:0];

  wire [16:0] frame3_ptr_hi_tmp = {{16-`APIX_HI_MSB{1'b0}},frame3_ptr_hi};
  wire [15:0] frame3_ptr_hi_rd  = frame3_ptr_hi_tmp[15:0];
  `endif
`endif

//------------------------------------------------
// FRAME3_PTR_LO Register
//------------------------------------------------
`ifdef WITH_FRAME3_POINTER
  reg  [`APIX_LO_MSB:0] frame3_ptr_lo;

  wire                  frame3_ptr_lo_wr = reg_wr[FRAME3_PTR_LO];

  always @ (posedge mclk or posedge puc_rst)
    if (puc_rst)               frame3_ptr_lo <=  {`APIX_LO_MSB+1{1'b0}};
    else if (frame3_ptr_lo_wr) frame3_ptr_lo <=  per_din_i[`APIX_LO_MSB:0];

  `ifdef VRAM_BIGGER_4_KW
  assign      frame3_ptr        = {frame3_ptr_hi[`APIX_HI_MSB:0], frame3_ptr_lo};
  wire [15:0] frame3_ptr_lo_rd  = frame3_ptr_lo;
  `else
  assign      frame3_ptr        = {frame3_ptr_lo[`APIX_LO_MSB:0]};
  wire [16:0] frame3_ptr_lo_tmp = {{16-`APIX_LO_MSB{1'b0}}, frame3_ptr_lo};
  wire [15:0] frame3_ptr_lo_rd  = frame3_ptr_lo_tmp[15:0];
  `endif
`endif

//------------------------------------------------
// VID_RAM0 Interface
//------------------------------------------------
wire        [15:0] vid_ram0_cfg;
wire        [15:0] vid_ram0_width;
`ifdef VRAM_BIGGER_4_KW
wire        [15:0] vid_ram0_addr_hi;
`endif
wire        [15:0] vid_ram0_addr_lo;
wire        [15:0] vid_ram0_data;

wire               vid_ram0_we;
wire               vid_ram0_ce;
wire        [15:0] vid_ram0_din;
wire [`APIX_MSB:0] vid_ram0_addr_nxt;
wire               vid_ram0_access;

ogfx_reg_vram_if ogfx_reg_vram0_if_inst (

// OUTPUTs
    .vid_ram_cfg_o           ( vid_ram0_cfg             ),   // VID_RAM0_CFG     Register
    .vid_ram_width_o         ( vid_ram0_width           ),   // VID_RAM0_WIDTH   Register
`ifdef VRAM_BIGGER_4_KW
    .vid_ram_addr_hi_o       ( vid_ram0_addr_hi         ),   // VID_RAM0_ADDR_HI Register
`endif
    .vid_ram_addr_lo_o       ( vid_ram0_addr_lo         ),   // VID_RAM0_ADDR_LO Register
    .vid_ram_data_o          ( vid_ram0_data            ),   // VID_RAM0_DATA    Register

    .vid_ram_we_o            ( vid_ram0_we              ),   // Video-RAM Write strobe
    .vid_ram_ce_o            ( vid_ram0_ce              ),   // Video-RAM Chip enable
    .vid_ram_din_o           ( vid_ram0_din             ),   // Video-RAM Data input
    .vid_ram_addr_nxt_o      ( vid_ram0_addr_nxt        ),   // Video-RAM Next address
    .vid_ram_access_o        ( vid_ram0_access          ),   // Video-RAM Access

// INPUTs
    .mclk                    ( mclk                     ),   // Main system clock
    .puc_rst                 ( puc_rst                  ),   // Main system reset

    .vid_ram_cfg_wr_i        ( reg_wr[VID_RAM0_CFG]     ),   // VID_RAM0_CFG     Write strobe
    .vid_ram_width_wr_i      ( reg_wr[VID_RAM0_WIDTH]   ),   // VID_RAM0_WIDTH   Write strobe
    .vid_ram_addr_hi_wr_i    ( reg_wr[VID_RAM0_ADDR_HI] ),   // VID_RAM0_ADDR_HI Write strobe
    .vid_ram_addr_lo_wr_i    ( reg_wr[VID_RAM0_ADDR_LO] ),   // VID_RAM0_ADDR_LO Write strobe
    .vid_ram_data_wr_i       ( reg_wr[VID_RAM0_DATA]    ),   // VID_RAM0_DATA    Write strobe
    .vid_ram_data_rd_i       ( reg_rd[VID_RAM0_DATA]    ),   // VID_RAM0_DATA    Read  strobe

    .dbg_freeze_i            ( dbg_freeze_i             ),   // Freeze auto-increment on read when CPU stopped
    .display_width_i         ( display_width_o          ),   // Display width
    .gfx_mode_1_bpp_i        ( gfx_mode_1_bpp           ),   // Graphic mode  1 bpp resolution
    .gfx_mode_2_bpp_i        ( gfx_mode_2_bpp           ),   // Graphic mode  2 bpp resolution
    .gfx_mode_4_bpp_i        ( gfx_mode_4_bpp           ),   // Graphic mode  4 bpp resolution
    .gfx_mode_8_bpp_i        ( gfx_mode_8_bpp           ),   // Graphic mode  8 bpp resolution
    .gfx_mode_16_bpp_i       ( gfx_mode_16_bpp          ),   // Graphic mode 16 bpp resolution

    .per_din_i               ( per_din_i                ),   // Peripheral data input
    .vid_ram_base_addr_i     ( vid_ram0_base_addr       ),   // Video-RAM base address
    .vid_ram_dout_i          ( vid_ram_dout_i           )    // Video-RAM data input
);

//------------------------------------------------
// VID_RAM1 Interface
//------------------------------------------------
wire        [15:0] vid_ram1_cfg;
wire        [15:0] vid_ram1_width;
`ifdef VRAM_BIGGER_4_KW
wire        [15:0] vid_ram1_addr_hi;
`endif
wire        [15:0] vid_ram1_addr_lo;
wire        [15:0] vid_ram1_data;

wire               vid_ram1_we;
wire               vid_ram1_ce;
wire        [15:0] vid_ram1_din;
wire [`APIX_MSB:0] vid_ram1_addr_nxt;
wire               vid_ram1_access;

ogfx_reg_vram_if ogfx_reg_vram1_if_inst (

// OUTPUTs
    .vid_ram_cfg_o           ( vid_ram1_cfg             ),   // VID_RAM1_CFG     Register
    .vid_ram_width_o         ( vid_ram1_width           ),   // VID_RAM1_WIDTH   Register
`ifdef VRAM_BIGGER_4_KW
    .vid_ram_addr_hi_o       ( vid_ram1_addr_hi         ),   // VID_RAM1_ADDR_HI Register
`endif
    .vid_ram_addr_lo_o       ( vid_ram1_addr_lo         ),   // VID_RAM1_ADDR_LO Register
    .vid_ram_data_o          ( vid_ram1_data            ),   // VID_RAM1_DATA    Register

    .vid_ram_we_o            ( vid_ram1_we              ),   // Video-RAM Write strobe
    .vid_ram_ce_o            ( vid_ram1_ce              ),   // Video-RAM Chip enable
    .vid_ram_din_o           ( vid_ram1_din             ),   // Video-RAM Data input
    .vid_ram_addr_nxt_o      ( vid_ram1_addr_nxt        ),   // Video-RAM Next address
    .vid_ram_access_o        ( vid_ram1_access          ),   // Video-RAM Access

// INPUTs
    .mclk                    ( mclk                     ),   // Main system clock
    .puc_rst                 ( puc_rst                  ),   // Main system reset

    .vid_ram_cfg_wr_i        ( reg_wr[VID_RAM1_CFG]     ),   // VID_RAM1_CFG     Write strobe
    .vid_ram_width_wr_i      ( reg_wr[VID_RAM1_WIDTH]   ),   // VID_RAM1_WIDTH   Write strobe
    .vid_ram_addr_hi_wr_i    ( reg_wr[VID_RAM1_ADDR_HI] ),   // VID_RAM1_ADDR_HI Write strobe
    .vid_ram_addr_lo_wr_i    ( reg_wr[VID_RAM1_ADDR_LO] ),   // VID_RAM1_ADDR_LO Write strobe
    .vid_ram_data_wr_i       ( reg_wr[VID_RAM1_DATA]    ),   // VID_RAM1_DATA    Write strobe
    .vid_ram_data_rd_i       ( reg_rd[VID_RAM1_DATA]    ),   // VID_RAM1_DATA    Read  strobe

    .dbg_freeze_i            ( dbg_freeze_i             ),   // Freeze auto-increment on read when CPU stopped
    .display_width_i         ( display_width_o          ),   // Display width
    .gfx_mode_1_bpp_i        ( gfx_mode_1_bpp           ),   // Graphic mode  1 bpp resolution
    .gfx_mode_2_bpp_i        ( gfx_mode_2_bpp           ),   // Graphic mode  2 bpp resolution
    .gfx_mode_4_bpp_i        ( gfx_mode_4_bpp           ),   // Graphic mode  4 bpp resolution
    .gfx_mode_8_bpp_i        ( gfx_mode_8_bpp           ),   // Graphic mode  8 bpp resolution
    .gfx_mode_16_bpp_i       ( gfx_mode_16_bpp          ),   // Graphic mode 16 bpp resolution

    .per_din_i               ( per_din_i                ),   // Peripheral data input
    .vid_ram_base_addr_i     ( vid_ram1_base_addr       ),   // Video-RAM base address
    .vid_ram_dout_i          ( vid_ram_dout_i           )    // Video-RAM data input
);

//------------------------------------------------
// GPU Interface (GPU_CMD/GPU_STAT) Registers
//------------------------------------------------

wire [3:0] gpu_stat_fifo_cnt;
wire [3:0] gpu_stat_fifo_cnt_empty;
wire       gpu_stat_fifo_empty;
wire       gpu_stat_fifo_full;
wire       gpu_stat_fifo_full_less_2;
wire       gpu_stat_fifo_full_less_3;

ogfx_reg_fifo ogfx_reg_fifo_gpu_inst (

// OUTPUTs
    .fifo_cnt_o              ( gpu_stat_fifo_cnt        ),   // Fifo counter
    .fifo_data_o             ( gpu_data_o               ),   // Read data output
    .fifo_done_evt_o         ( gpu_fifo_done_evt        ),   // Fifo has been emptied
    .fifo_empty_o            ( gpu_stat_fifo_empty      ),   // Fifo is currentely empty
    .fifo_empty_cnt_o        ( gpu_stat_fifo_cnt_empty  ),   // Fifo empty words counter
    .fifo_full_o             ( gpu_stat_fifo_full       ),   // Fifo is currentely full
    .fifo_ovfl_evt_o         ( gpu_fifo_ovfl_evt        ),   // Fifo overflow event

// INPUTs
    .mclk                    ( mclk                     ),   // Main system clock
    .puc_rst                 ( puc_rst                  ),   // Main system reset

    .fifo_data_i             ( per_din_i                ),   // Read data input
    .fifo_enable_i           ( gpu_enable_o             ),   // Enable fifo (flushed when disabled)
    .fifo_pop_i              ( gpu_get_data_i           ),   // Pop data from the fifo
    .fifo_push_i             ( reg_wr[GPU_CMD_LO] |
                               reg_wr[GPU_CMD_HI]       )    // Push new data to the fifo
);

assign      gpu_data_avail_o = ~gpu_stat_fifo_empty;

assign      gpu_busy         = ~gpu_stat_fifo_empty | gpu_dma_busy_i;

wire [15:0] gpu_stat         = {gpu_busy, 2'b00, gpu_dma_busy_i,
                                2'b00   , gpu_stat_fifo_full, gpu_stat_fifo_empty,
                                gpu_stat_fifo_cnt, gpu_stat_fifo_cnt_empty};


//============================================================================
// 4) DATA OUTPUT GENERATION
//============================================================================

// Data output mux
wire [15:0] gfx_ctrl_read          = gfx_ctrl             & {16{reg_rd[GFX_CTRL          ]}};
wire [15:0] gfx_status_read        = gfx_status           & {16{reg_rd[GFX_STATUS        ]}};
wire [15:0] gfx_irq_read           = gfx_irq              & {16{reg_rd[GFX_IRQ           ]}};

wire [15:0] display_width_read     = display_width_rd     & {16{reg_rd[DISPLAY_WIDTH     ]}};
wire [15:0] display_height_read    = display_height_rd    & {16{reg_rd[DISPLAY_HEIGHT    ]}};
wire [15:0] display_size_lo_read   = display_size_lo_rd   & {16{reg_rd[DISPLAY_SIZE_LO   ]}};
`ifdef WITH_DISPLAY_SIZE_HI
wire [15:0] display_size_hi_read   = display_size_hi_rd   & {16{reg_rd[DISPLAY_SIZE_HI   ]}};
`endif
wire [15:0] display_cfg_read       = display_cfg          & {16{reg_rd[DISPLAY_CFG       ]}};
wire [15:0] display_refr_cnt_read  = display_refr_cnt     & {16{reg_rd[DISPLAY_REFR_CNT  ]}};

wire [15:0] lt24_cfg_read          = lt24_cfg             & {16{reg_rd[LT24_CFG          ]}};
wire [15:0] lt24_refresh_read      = lt24_refresh         & {16{reg_rd[LT24_REFRESH      ]}};
wire [15:0] lt24_refresh_sync_read = lt24_refresh_sync    & {16{reg_rd[LT24_REFRESH_SYNC ]}};
wire [15:0] lt24_cmd_read          = lt24_cmd             & {16{reg_rd[LT24_CMD          ]}};
wire [15:0] lt24_cmd_param_read    = lt24_cmd_param_o     & {16{reg_rd[LT24_CMD_PARAM    ]}};
wire [15:0] lt24_cmd_dfill_read    = lt24_cmd_dfill_o     & {16{reg_rd[LT24_CMD_DFILL    ]}};
wire [15:0] lt24_status_read       = lt24_status          & {16{reg_rd[LT24_STATUS       ]}};

wire [15:0] lut_cfg_read           = lut_cfg_rd           & {16{reg_rd[LUT_CFG           ]}};
wire [15:0] lut_ram_addr_read      = lut_ram_addr_rd      & {16{reg_rd[LUT_RAM_ADDR      ]}};
wire [15:0] lut_ram_data_read      = lut_ram_data         & {16{reg_rd[LUT_RAM_DATA      ]}};

wire [15:0] frame_select_read      = frame_select         & {16{reg_rd[FRAME_SELECT      ]}};
wire [15:0] frame0_ptr_lo_read     = frame0_ptr_lo_rd     & {16{reg_rd[FRAME0_PTR_LO     ]}};
`ifdef VRAM_BIGGER_4_KW
wire [15:0] frame0_ptr_hi_read     = frame0_ptr_hi_rd     & {16{reg_rd[FRAME0_PTR_HI     ]}};
`endif
`ifdef WITH_FRAME1_POINTER
  wire [15:0] frame1_ptr_lo_read   = frame1_ptr_lo_rd     & {16{reg_rd[FRAME1_PTR_LO     ]}};
  `ifdef VRAM_BIGGER_4_KW
  wire [15:0] frame1_ptr_hi_read   = frame1_ptr_hi_rd     & {16{reg_rd[FRAME1_PTR_HI     ]}};
  `endif
`endif
`ifdef WITH_FRAME2_POINTER
  wire [15:0] frame2_ptr_lo_read   = frame2_ptr_lo_rd     & {16{reg_rd[FRAME2_PTR_LO     ]}};
  `ifdef VRAM_BIGGER_4_KW
  wire [15:0] frame2_ptr_hi_read   = frame2_ptr_hi_rd     & {16{reg_rd[FRAME2_PTR_HI     ]}};
  `endif
`endif
`ifdef WITH_FRAME3_POINTER
  wire [15:0] frame3_ptr_lo_read   = frame3_ptr_lo_rd     & {16{reg_rd[FRAME3_PTR_LO     ]}};
  `ifdef VRAM_BIGGER_4_KW
  wire [15:0] frame3_ptr_hi_read   = frame3_ptr_hi_rd     & {16{reg_rd[FRAME3_PTR_HI     ]}};
  `endif
`endif
wire [15:0] vid_ram0_cfg_read      = vid_ram0_cfg         & {16{reg_rd[VID_RAM0_CFG      ]}};
wire [15:0] vid_ram0_width_read    = vid_ram0_width       & {16{reg_rd[VID_RAM0_WIDTH    ]}};
wire [15:0] vid_ram0_addr_lo_read  = vid_ram0_addr_lo     & {16{reg_rd[VID_RAM0_ADDR_LO  ]}};
`ifdef VRAM_BIGGER_4_KW
wire [15:0] vid_ram0_addr_hi_read  = vid_ram0_addr_hi     & {16{reg_rd[VID_RAM0_ADDR_HI  ]}};
`endif
wire [15:0] vid_ram0_data_read     = vid_ram0_data        & {16{reg_rd[VID_RAM0_DATA     ]}};

wire [15:0] vid_ram1_cfg_read      = vid_ram1_cfg         & {16{reg_rd[VID_RAM1_CFG      ]}};
wire [15:0] vid_ram1_width_read    = vid_ram1_width       & {16{reg_rd[VID_RAM1_WIDTH    ]}};
wire [15:0] vid_ram1_addr_lo_read  = vid_ram1_addr_lo     & {16{reg_rd[VID_RAM1_ADDR_LO  ]}};
`ifdef VRAM_BIGGER_4_KW
wire [15:0] vid_ram1_addr_hi_read  = vid_ram1_addr_hi     & {16{reg_rd[VID_RAM1_ADDR_HI  ]}};
`endif
wire [15:0] vid_ram1_data_read     = vid_ram1_data        & {16{reg_rd[VID_RAM1_DATA     ]}};
wire [15:0] gpu_cmd_lo_read        = 16'h0000             & {16{reg_rd[GPU_CMD_LO        ]}};
wire [15:0] gpu_cmd_hi_read        = 16'h0000             & {16{reg_rd[GPU_CMD_HI        ]}};
wire [15:0] gpu_stat_read          = gpu_stat             & {16{reg_rd[GPU_STAT          ]}};


wire [15:0] per_dout_o             = gfx_ctrl_read          |
                                     gfx_status_read        |
                                     gfx_irq_read           |

                                     display_width_read     |
                                     display_height_read    |
                                     display_size_lo_read   |
                                  `ifdef WITH_DISPLAY_SIZE_HI
                                     display_size_hi_read   |
                                  `endif
                                     display_cfg_read       |
                                     display_refr_cnt_read  |

                                     lt24_cfg_read          |
                                     lt24_refresh_read      |
                                     lt24_refresh_sync_read |
                                     lt24_cmd_read          |
                                     lt24_cmd_param_read    |
                                     lt24_cmd_dfill_read    |
                                     lt24_status_read       |

                                     lut_cfg_read           |
                                     lut_ram_addr_read      |
                                     lut_ram_data_read      |

                                     frame_select_read      |
                                     frame0_ptr_lo_read     |
                                  `ifdef VRAM_BIGGER_4_KW
                                     frame0_ptr_hi_read     |
                                  `endif
                                `ifdef WITH_FRAME1_POINTER
                                     frame1_ptr_lo_read     |
                                  `ifdef VRAM_BIGGER_4_KW
                                     frame1_ptr_hi_read     |
                                  `endif
                                `endif
                                `ifdef WITH_FRAME2_POINTER
                                     frame2_ptr_lo_read     |
                                  `ifdef VRAM_BIGGER_4_KW
                                     frame2_ptr_hi_read     |
                                  `endif
                                `endif
                                `ifdef WITH_FRAME3_POINTER
                                     frame3_ptr_lo_read     |
                                  `ifdef VRAM_BIGGER_4_KW
                                     frame3_ptr_hi_read     |
                                  `endif
                                `endif
                                     vid_ram0_cfg_read      |
                                     vid_ram0_width_read    |
                                     vid_ram0_addr_lo_read  |
                                  `ifdef VRAM_BIGGER_4_KW
                                     vid_ram0_addr_hi_read  |
                                  `endif
                                     vid_ram0_data_read     |

                                     vid_ram1_cfg_read      |
                                     vid_ram1_width_read    |
                                     vid_ram1_addr_lo_read  |
                                  `ifdef VRAM_BIGGER_4_KW
                                     vid_ram1_addr_hi_read  |
                                  `endif
                                     vid_ram1_data_read     |
                                     gpu_cmd_lo_read        |
                                     gpu_cmd_hi_read        |
                                     gpu_stat_read;


//============================================================================
// 5) VIDEO MEMORY INTERFACE
//============================================================================

// Write access strobe
assign             vid_ram_wen_o      = ~(vid_ram0_we       | vid_ram1_we      );

// Chip enable.
assign             vid_ram_cen_o      = ~(vid_ram0_ce       | vid_ram1_ce      );

// Data to be written
assign             vid_ram_din_o      =  (vid_ram0_din      | vid_ram1_din     );

// Detect memory accesses for ADDR update
wire               vid_ram_access     =  (vid_ram0_access   | vid_ram1_access  );

// Next Address
wire [`APIX_MSB:0] vid_ram_addr_nxt   =  (vid_ram0_addr_nxt | vid_ram1_addr_nxt);

// Align according to graphic mode
wire [`VRAM_MSB:0] vid_ram_addr_align = ({`VRAM_AWIDTH{gfx_mode_1_bpp }} & vid_ram_addr_nxt[`APIX_MSB-0:4]) |
                                        ({`VRAM_AWIDTH{gfx_mode_2_bpp }} & vid_ram_addr_nxt[`APIX_MSB-1:3]) |
                                        ({`VRAM_AWIDTH{gfx_mode_4_bpp }} & vid_ram_addr_nxt[`APIX_MSB-2:2]) |
                                        ({`VRAM_AWIDTH{gfx_mode_8_bpp }} & vid_ram_addr_nxt[`APIX_MSB-3:1]) |
                                        ({`VRAM_AWIDTH{gfx_mode_16_bpp}} & vid_ram_addr_nxt[`APIX_MSB-4:0]) ;

// Generate Video RAM address
reg [`VRAM_MSB:0] vid_ram_addr_o;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             vid_ram_addr_o <= {`VRAM_AWIDTH{1'b0}};
  else if (vid_ram_access) vid_ram_addr_o <= vid_ram_addr_align;


endmodule // ogfx_reg

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
