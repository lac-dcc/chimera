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
// *File Name: ogfx_gpu_reg.v
//
// *Module Description:
//                      Configuration registers of the Graphic-Processing unit
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

module  ogfx_gpu_reg (

// OUTPUTs
    cfg_dst_px_addr_o,                            // Destination pixel address configuration
    cfg_dst_cl_swp_o,                             // Destination Column/Line-Swap configuration
    cfg_dst_x_swp_o,                              // Destination X-Swap configuration
    cfg_dst_y_swp_o,                              // Destination Y-Swap configuration
    cfg_fill_color_o,                             // Fill color (for rectangle fill operation)
    cfg_pix_op_sel_o,                             // Pixel operation to be performed during the copy
    cfg_rec_width_o,                              // Rectangle width configuration
    cfg_rec_height_o,                             // Rectangle height configuration
    cfg_src_px_addr_o,                            // Source pixel address configuration
    cfg_src_cl_swp_o,                             // Source Column/Line-Swap configuration
    cfg_src_x_swp_o,                              // Source X-Swap configuration
    cfg_src_y_swp_o,                              // Source Y-Swap configuration
    cfg_transparent_color_o,                      // Transparent color (for rectangle transparent copy operation)

    gpu_cmd_done_evt_o,                           // GPU command done event
    gpu_cmd_error_evt_o,                          // GPU command error event
    gpu_get_data_o,                               // GPU get next data

    exec_fill_o,                                  // Rectangle fill on going
    exec_copy_o,                                  // Rectangle copy on going
    exec_copy_trans_o,                            // Rectangle transparent copy on going
    trig_exec_o,                                  // Trigger rectangle execution

// INPUTs
    mclk,                                         // Main system clock
    puc_rst,                                      // Main system reset

    gpu_data_i,                                   // GPU data
    gpu_data_avail_i,                             // GPU data available
    gfx_mode_i,                                   // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)
    gpu_enable_i,                                 // GPU enable

    gpu_exec_done_i                               // GPU execution done
);

// OUTPUTs
//=========
output [`APIX_MSB:0] cfg_dst_px_addr_o;           // Destination pixel address configuration
output               cfg_dst_cl_swp_o;            // Destination Column/Line-Swap configuration
output               cfg_dst_x_swp_o;             // Destination X-Swap configuration
output               cfg_dst_y_swp_o;             // Destination Y-Swap configuration
output        [15:0] cfg_fill_color_o;            // Fill color (for rectangle fill operation)
output         [3:0] cfg_pix_op_sel_o;            // Pixel operation to be performed during the copy
output [`LPIX_MSB:0] cfg_rec_width_o;             // Rectangle width configuration
output [`LPIX_MSB:0] cfg_rec_height_o;            // Rectangle height configuration
output [`APIX_MSB:0] cfg_src_px_addr_o;           // Source pixel address configuration
output               cfg_src_cl_swp_o;            // Source Column/Line-Swap configuration
output               cfg_src_x_swp_o;             // Source X-Swap configuration
output               cfg_src_y_swp_o;             // Source Y-Swap configuration
output        [15:0] cfg_transparent_color_o;     // Transparent color (for rectangle transparent copy operation)

output               gpu_cmd_done_evt_o;          // GPU command done event
output               gpu_cmd_error_evt_o;         // GPU command error event
output               gpu_get_data_o;              // GPU get next data

output               exec_fill_o;                 // Rectangle fill on going
output               exec_copy_o;                 // Rectangle copy on going
output               exec_copy_trans_o;           // Rectangle transparent copy on going
output               trig_exec_o;                 // Trigger rectangle execution

// INPUTs
//=========
input                mclk;                        // Main system clock
input                puc_rst;                     // Main system reset

input         [15:0] gpu_data_i;                  // GPU data
input                gpu_data_avail_i;            // GPU data available
input          [2:0] gfx_mode_i;                  // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)
input                gpu_enable_i;                // GPU enable

input                gpu_exec_done_i;             // GPU execution done

//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// Video modes decoding
wire                 gfx_mode_1_bpp    =  (gfx_mode_i == 3'b000);
wire                 gfx_mode_2_bpp    =  (gfx_mode_i == 3'b001);
wire                 gfx_mode_4_bpp    =  (gfx_mode_i == 3'b010);
wire                 gfx_mode_8_bpp    =  (gfx_mode_i == 3'b011);
wire                 gfx_mode_16_bpp   = ~(gfx_mode_8_bpp | gfx_mode_4_bpp | gfx_mode_2_bpp | gfx_mode_1_bpp);

// Remaining wires/registers
reg                  exec_fill_o;
reg                  exec_copy_o;
reg                  exec_copy_trans_o;

reg            [1:0] src_offset_sel;
reg                  src_x_swp;
reg                  src_y_swp;
reg                  src_cl_swp;
reg            [3:0] pix_op_sel;
reg            [1:0] dst_offset_sel;
reg                  dst_x_swp;
reg                  dst_y_swp;
reg                  dst_cl_swp;

reg            [3:0] reg_access;
wire           [3:0] reg_access_nxt;

reg           [15:0] fill_color;
reg    [`LPIX_MSB:0] rec_width;
reg    [`LPIX_MSB:0] rec_height;
wire   [`APIX_MSB:0] src_px_addr;
wire   [`APIX_MSB:0] src_px_addr_align;
wire   [`APIX_MSB:0] dst_px_addr;
wire   [`APIX_MSB:0] dst_px_addr_align;
wire   [`APIX_MSB:0] of0_addr;
wire   [`APIX_MSB:0] of1_addr;
wire   [`APIX_MSB:0] of2_addr;
wire   [`APIX_MSB:0] of3_addr;
reg           [15:0] transparent_color;

wire   [`APIX_MSB:0] src_offset_addr;
wire   [`APIX_MSB:0] dst_offset_addr;


//=============================================================================
// 2)  GPU COMMAND STATE MACHINE
//=============================================================================
//
// EXEC_FILL        - Execute rectangle fill command
//                    {2'b00, reserved<4:0>,                                     pxop[3:0], dst_offset[1:0], dst_X-Swp, dst_Y-Swp, dst_CL-Swp}
//                    {fill_color[15:0]}
//
// EXEC_COPY        - Execute rectangle copy command
//                    {2'b01, src_offset[1:0], src_X-Swp, src_Y-Swp, src_CL-Swp, pxop[3:0], dst_offset[1:0], dst_X-Swp, dst_Y-Swp, dst_CL-Swp}
//
// EXEC_COPY_TRANS  - Execute rectangle copy with transparency command
//                    {2'b10, src_offset[1:0], src_X-Swp, src_Y-Swp, src_CL-Swp, pxop[3:0], dst_offset[1:0], dst_X-Swp, dst_Y-Swp, dst_CL-Swp}
//
// REC_WIDTH        - Set rectangle width
//                    {4'b1100, width[11:0]}
//
// REC_HEIGHT       - Set rectangle height
//                    {4'b1101, height[11:0]}
//
// SRC_PX_ADDR      - Set source address
//                    {4'b1111, 2'b10, 10'b0000000000}
//                    {addr[15:0]                    }
//                    {addr[31:16]                   }
//
// DST_PX_ADDR      - Set destination address
//                    {4'b1111, 2'b10, 10'b0000000001}
//                    {addr[15:0]                    }
//                    {addr[31:16]                   }
//
// OF0_ADDR         - Set address offset 0
//                    {4'b1111, 2'b10, 10'b0000010000}
//                    {addr[15:0]                    }
//                    {addr[31:16]                   }
//
// OF1_ADDR         - Set address offset 1
//                    {4'b1111, 2'b10, 10'b0000010001}
//                    {addr[15:0]                    }
//                    {addr[31:16]                   }
//
// OF2_ADDR         - Set address offset 2
//                    {4'b1111, 2'b10, 10'b0000010010}
//                    {addr[15:0]                    }
//                    {addr[31:16]                   }
//
// OF3_ADDR         - Set address offset 3
//                    {4'b1111, 2'b10, 10'b0000010011}
//                    {addr[15:0]                    }
//                    {addr[31:16]                   }
//
// SET_FILL         - Set fill color
//                    {4'b1111, 2'b01, 10'b0000100000}
//                    {fill_color[15:0]              }
//
// SET_TRANSPARENT  - Set transparent color
//                    {4'b1111, 2'b01, 10'b0000100001}
//                    {transparent_color[15:0]       }
//
//-----------------------------------------------------------------------------

// State definition
parameter  CMD_WAIT         =  4'h0;
parameter  CMD_READ         =  4'h1;
parameter  DATA1B_WAIT      =  4'h2;
parameter  DATA1B_READ      =  4'h3;
parameter  DATA2B1_WAIT     =  4'h4;
parameter  DATA2B1_READ     =  4'h5;
parameter  DATA2B2_WAIT     =  4'h6;
parameter  DATA2B2_READ     =  4'h7;
parameter  EXEC_START       =  4'h8;
parameter  EXEC             =  4'h9;
parameter  ERROR            =  4'hA;

// State machine
reg  [3:0] gpu_state;
reg  [3:0] gpu_state_nxt;

// Arcs control
wire       cmd_available    =  gpu_data_avail_i;

wire       cmd_not_valid    = ((gpu_data_i[15:14]!= `OP_EXEC_FILL      ) &
                               (gpu_data_i[15:14]!= `OP_EXEC_COPY      ) &
                               (gpu_data_i[15:14]!= `OP_EXEC_COPY_TRANS) &
                               (gpu_data_i[15:12]!= `OP_REC_WIDTH      ) &
                               (gpu_data_i[15:12]!= `OP_REC_HEIGHT     ) &
                               (gpu_data_i[15:0] != `OP_SRC_PX_ADDR    ) &
                               (gpu_data_i[15:0] != `OP_DST_PX_ADDR    ) &
                               (gpu_data_i[15:0] != `OP_OF0_ADDR       ) &
                               (gpu_data_i[15:0] != `OP_OF1_ADDR       ) &
                               (gpu_data_i[15:0] != `OP_OF2_ADDR       ) &
                               (gpu_data_i[15:0] != `OP_OF3_ADDR       ) &
                               (gpu_data_i[15:0] != `OP_SET_FILL       ) &
                               (gpu_data_i[15:0] != `OP_SET_TRANSPARENT));

wire       cmd_has_1b_data  =  (gpu_data_i[15:14]== `OP_EXEC_FILL      ) |
                               (gpu_data_i[15:0] == `OP_SET_FILL       ) |
                               (gpu_data_i[15:0] == `OP_SET_TRANSPARENT);

wire       cmd_has_2b_data  =  (gpu_data_i[15:0] == `OP_SRC_PX_ADDR    ) |
                               (gpu_data_i[15:0] == `OP_DST_PX_ADDR    ) |
                               (gpu_data_i[15:0] == `OP_OF0_ADDR       ) |
                               (gpu_data_i[15:0] == `OP_OF1_ADDR       ) |
                               (gpu_data_i[15:0] == `OP_OF2_ADDR       ) |
                               (gpu_data_i[15:0] == `OP_OF3_ADDR       );

wire       cmd_has_exec     =  exec_fill_o | exec_copy_o | exec_copy_trans_o;

wire       data_available   =  gpu_data_avail_i;


// State transition
always @(gpu_state or cmd_available or cmd_not_valid or cmd_has_1b_data or cmd_has_2b_data or cmd_has_exec or data_available or gpu_exec_done_i)
  case (gpu_state)
    CMD_WAIT     : gpu_state_nxt =  cmd_available   ? CMD_READ     : CMD_WAIT     ;
    CMD_READ     : gpu_state_nxt =  cmd_not_valid   ? ERROR        :
                                    cmd_has_1b_data ? DATA1B_WAIT  :
                                    cmd_has_2b_data ? DATA2B1_WAIT :
                                    cmd_has_exec    ? EXEC_START   : CMD_WAIT     ;

    DATA1B_WAIT  : gpu_state_nxt =  data_available  ? DATA1B_READ  : DATA1B_WAIT  ;
    DATA1B_READ  : gpu_state_nxt =  cmd_has_exec    ? EXEC_START   : CMD_WAIT     ;

    DATA2B1_WAIT : gpu_state_nxt =  data_available  ? DATA2B1_READ : DATA2B1_WAIT ;
    DATA2B1_READ : gpu_state_nxt =                    DATA2B2_WAIT                ;

    DATA2B2_WAIT : gpu_state_nxt =  data_available  ? DATA2B2_READ : DATA2B2_WAIT ;
    DATA2B2_READ : gpu_state_nxt =  cmd_has_exec    ? EXEC_START   : CMD_WAIT     ;

    EXEC_START   : gpu_state_nxt =  gpu_exec_done_i ? CMD_WAIT     : EXEC         ;
    EXEC         : gpu_state_nxt =  gpu_exec_done_i ? CMD_WAIT     : EXEC         ;
    ERROR        : gpu_state_nxt =                    ERROR                       ;
  // pragma coverage off
    default      : gpu_state_nxt =                    CMD_WAIT                    ;
  // pragma coverage on
  endcase


// State machine
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)            gpu_state <= CMD_WAIT;
  else if (~gpu_enable_i) gpu_state <= CMD_WAIT;
  else                    gpu_state <= gpu_state_nxt;


// Event generation, fifo data request
assign  gpu_cmd_done_evt_o  = (gpu_state!=ERROR) & (gpu_state!=CMD_WAIT) & (gpu_state_nxt==CMD_WAIT);
assign  gpu_cmd_error_evt_o = (gpu_state==ERROR);
assign  gpu_get_data_o      = (gpu_state==CMD_READ) | (gpu_state==DATA1B_READ) | (gpu_state==DATA2B1_READ) | (gpu_state==DATA2B2_READ);

// Execution triggers
assign  trig_exec_o         = (exec_fill_o      |
                               exec_copy_o      |
                               exec_copy_trans_o) & (gpu_state==EXEC_START);


//=============================================================================
// 3)  CONFIGURATION REGISTERS
//=============================================================================

// Detect execution commands
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                                    exec_fill_o       <= 1'b0;
  else if ((gpu_state==CMD_WAIT) & cmd_available) exec_fill_o       <= (gpu_data_i[15:14]==`OP_EXEC_FILL);
  else if ((gpu_state_nxt==CMD_WAIT)            ) exec_fill_o       <= 1'b0;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                                    exec_copy_o       <= 1'b0;
  else if ((gpu_state==CMD_WAIT) & cmd_available) exec_copy_o       <= (gpu_data_i[15:14]==`OP_EXEC_COPY);
  else if ((gpu_state_nxt==CMD_WAIT)            ) exec_copy_o       <= 1'b0;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                                    exec_copy_trans_o <= 1'b0;
  else if ((gpu_state==CMD_WAIT) & cmd_available) exec_copy_trans_o <= (gpu_data_i[15:14]==`OP_EXEC_COPY_TRANS);
  else if ((gpu_state_nxt==CMD_WAIT)            ) exec_copy_trans_o <= 1'b0;

// Detect register accesses
parameter REG_EXEC_FILL       = 4'h1;
parameter REG_REC_WIDTH       = 4'h2;
parameter REG_REC_HEIGHT      = 4'h3;
parameter REG_SRC_PX_ADDR     = 4'h4;
parameter REG_DST_PX_ADDR     = 4'h5;
parameter REG_OF0_ADDR        = 4'h6;
parameter REG_OF1_ADDR        = 4'h7;
parameter REG_OF2_ADDR        = 4'h8;
parameter REG_OF3_ADDR        = 4'h9;
parameter REG_SET_FILL        = 4'hA;
parameter REG_SET_TRANSPARENT = 4'hB;

assign    reg_access_nxt      = ({4{gpu_data_i[15:14]== `OP_EXEC_FILL      }} & REG_EXEC_FILL      ) |
                                ({4{gpu_data_i[15:12]== `OP_REC_WIDTH      }} & REG_REC_WIDTH      ) |
                                ({4{gpu_data_i[15:12]== `OP_REC_HEIGHT     }} & REG_REC_HEIGHT     ) |
                                ({4{gpu_data_i[15:0] == `OP_SRC_PX_ADDR    }} & REG_SRC_PX_ADDR    ) |
                                ({4{gpu_data_i[15:0] == `OP_DST_PX_ADDR    }} & REG_DST_PX_ADDR    ) |
                                ({4{gpu_data_i[15:0] == `OP_OF0_ADDR       }} & REG_OF0_ADDR       ) |
                                ({4{gpu_data_i[15:0] == `OP_OF1_ADDR       }} & REG_OF1_ADDR       ) |
                                ({4{gpu_data_i[15:0] == `OP_OF2_ADDR       }} & REG_OF2_ADDR       ) |
                                ({4{gpu_data_i[15:0] == `OP_OF3_ADDR       }} & REG_OF3_ADDR       ) |
                                ({4{gpu_data_i[15:0] == `OP_SET_FILL       }} & REG_SET_FILL       ) |
                                ({4{gpu_data_i[15:0] == `OP_SET_TRANSPARENT}} & REG_SET_TRANSPARENT) ;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                      reg_access <= 4'h0;
  else if (gpu_state==CMD_READ)     reg_access <= reg_access_nxt;
  else if (gpu_state_nxt==CMD_WAIT) reg_access <= 4'h0;


//=============================================================================
// 4)  CONFIGURATION REGISTERS
//=============================================================================

//------------------------------------------------
// EXECUTION CONFIG Register
//------------------------------------------------

wire  exec_all_cfg_wr = (exec_fill_o | exec_copy_o | exec_copy_trans_o) & (gpu_state==CMD_READ);
wire  exec_src_cfg_wr = (              exec_copy_o | exec_copy_trans_o) & (gpu_state==CMD_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       src_offset_sel <= 2'b00;
       src_x_swp      <= 1'b0;
       src_y_swp      <= 1'b0;
       src_cl_swp     <= 1'b0;
    end
  else if (exec_src_cfg_wr)
    begin
       src_offset_sel <= gpu_data_i[13:12];
       src_x_swp      <= gpu_data_i[11];
       src_y_swp      <= gpu_data_i[10];
       src_cl_swp     <= gpu_data_i[9];
    end

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       pix_op_sel     <= 4'b0000;
       dst_offset_sel <= 2'b00;
       dst_x_swp      <= 1'b0;
       dst_y_swp      <= 1'b0;
       dst_cl_swp     <= 1'b0;
    end
  else if (exec_all_cfg_wr)
    begin
       pix_op_sel     <= gpu_data_i[8:5];
       dst_offset_sel <= gpu_data_i[4:3];
       dst_x_swp      <= gpu_data_i[2];
       dst_y_swp      <= gpu_data_i[1];
       dst_cl_swp     <= gpu_data_i[0];
    end

assign cfg_src_x_swp_o  = src_x_swp;
assign cfg_src_y_swp_o  = src_y_swp;
assign cfg_src_cl_swp_o = src_cl_swp;
assign cfg_pix_op_sel_o = pix_op_sel;
assign cfg_dst_x_swp_o  = dst_x_swp;
assign cfg_dst_y_swp_o  = dst_y_swp;
assign cfg_dst_cl_swp_o = dst_cl_swp;

//------------------------------------------------
// FILL_COLOR Register
//------------------------------------------------

wire  fill_color_wr = ((reg_access==REG_EXEC_FILL) |
                       (reg_access==REG_SET_FILL ) ) & (gpu_state==DATA1B_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)            fill_color <=  16'h0000;
  else if (fill_color_wr) fill_color <=  gpu_data_i;

assign cfg_fill_color_o = fill_color;

//------------------------------------------------
// REC_WIDTH Register
//------------------------------------------------

wire               rec_width_wr = (reg_access_nxt==REG_REC_WIDTH) & (gpu_state==CMD_READ);

wire [`LPIX_MSB:0] rec_w_h_nxt  = (|gpu_data_i[`LPIX_MSB:0]) ? gpu_data_i[`LPIX_MSB:0] :
                                                               {{`LPIX_MSB{1'b0}}, 1'b1};


always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)           rec_width <=  {{`LPIX_MSB{1'b0}}, 1'b1};
  else if (rec_width_wr) rec_width <=  rec_w_h_nxt;

assign cfg_rec_width_o = rec_width;

//------------------------------------------------
// REC_HEIGHT Register
//------------------------------------------------

wire  rec_height_wr = (reg_access_nxt==REG_REC_HEIGHT) & (gpu_state==CMD_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)            rec_height <=  {{`LPIX_MSB{1'b0}}, 1'b1};
  else if (rec_height_wr) rec_height <=  rec_w_h_nxt;

assign cfg_rec_height_o = rec_height;

//------------------------------------------------
// SRC_PX_ADDR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] src_px_addr_hi;

wire                 src_px_addr_hi_wr = (reg_access==REG_SRC_PX_ADDR) & (gpu_state==DATA2B2_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                src_px_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (src_px_addr_hi_wr) src_px_addr_hi <=  gpu_data_i[`APIX_HI_MSB:0];
`endif

//------------------------------------------------
// SRC_PX_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] src_px_addr_lo;

wire                 src_px_addr_lo_wr = (reg_access==REG_SRC_PX_ADDR) & (gpu_state==DATA2B1_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                src_px_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (src_px_addr_lo_wr) src_px_addr_lo <=  gpu_data_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      src_px_addr  = {src_px_addr_hi[`APIX_HI_MSB:0], src_px_addr_lo};
`else
assign      src_px_addr  = {src_px_addr_lo[`APIX_LO_MSB:0]};
`endif

assign src_px_addr_align = src_px_addr + src_offset_addr;
assign cfg_src_px_addr_o = {`APIX_MSB+1{gfx_mode_1_bpp }} & {src_px_addr_align[`APIX_MSB:0]           } |
                           {`APIX_MSB+1{gfx_mode_2_bpp }} & {src_px_addr_align[`APIX_MSB-1:0], 1'b0   } |
                           {`APIX_MSB+1{gfx_mode_4_bpp }} & {src_px_addr_align[`APIX_MSB-2:0], 2'b00  } |
                           {`APIX_MSB+1{gfx_mode_8_bpp }} & {src_px_addr_align[`APIX_MSB-3:0], 3'b000 } |
                           {`APIX_MSB+1{gfx_mode_16_bpp}} & {src_px_addr_align[`APIX_MSB-4:0], 4'b0000} ;

//------------------------------------------------
// DST_PX_ADDR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] dst_px_addr_hi;

wire                 dst_px_addr_hi_wr = (reg_access==REG_DST_PX_ADDR) & (gpu_state==DATA2B2_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                dst_px_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (dst_px_addr_hi_wr) dst_px_addr_hi <=  gpu_data_i[`APIX_HI_MSB:0];
`endif

//------------------------------------------------
// DST_PX_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] dst_px_addr_lo;

wire                 dst_px_addr_lo_wr = (reg_access==REG_DST_PX_ADDR) & (gpu_state==DATA2B1_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                dst_px_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (dst_px_addr_lo_wr) dst_px_addr_lo <=  gpu_data_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      dst_px_addr  = {dst_px_addr_hi[`APIX_HI_MSB:0], dst_px_addr_lo};
`else
assign      dst_px_addr  = {dst_px_addr_lo[`APIX_LO_MSB:0]};
`endif

assign dst_px_addr_align = dst_px_addr + dst_offset_addr;
assign cfg_dst_px_addr_o = {`APIX_MSB+1{gfx_mode_1_bpp }} & {dst_px_addr_align[`APIX_MSB:0]           } |
                           {`APIX_MSB+1{gfx_mode_2_bpp }} & {dst_px_addr_align[`APIX_MSB-1:0], 1'b0   } |
                           {`APIX_MSB+1{gfx_mode_4_bpp }} & {dst_px_addr_align[`APIX_MSB-2:0], 2'b00  } |
                           {`APIX_MSB+1{gfx_mode_8_bpp }} & {dst_px_addr_align[`APIX_MSB-3:0], 3'b000 } |
                           {`APIX_MSB+1{gfx_mode_16_bpp}} & {dst_px_addr_align[`APIX_MSB-4:0], 4'b0000} ;

//------------------------------------------------
// OF0_ADDR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] of0_addr_hi;

wire                 of0_addr_hi_wr = (reg_access==REG_OF0_ADDR) & (gpu_state==DATA2B2_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of0_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (of0_addr_hi_wr) of0_addr_hi <=  gpu_data_i[`APIX_HI_MSB:0];
`endif

//------------------------------------------------
// OF0_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] of0_addr_lo;

wire                 of0_addr_lo_wr = (reg_access==REG_OF0_ADDR) & (gpu_state==DATA2B1_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of0_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (of0_addr_lo_wr) of0_addr_lo <=  gpu_data_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      of0_addr  = {of0_addr_hi[`APIX_HI_MSB:0], of0_addr_lo};
`else
assign      of0_addr  = {of0_addr_lo[`APIX_LO_MSB:0]};
`endif

//------------------------------------------------
// OF1_ADDR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] of1_addr_hi;

wire                 of1_addr_hi_wr = (reg_access==REG_OF1_ADDR) & (gpu_state==DATA2B2_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of1_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (of1_addr_hi_wr) of1_addr_hi <=  gpu_data_i[`APIX_HI_MSB:0];
`endif

//------------------------------------------------
// OF1_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] of1_addr_lo;

wire                 of1_addr_lo_wr = (reg_access==REG_OF1_ADDR) & (gpu_state==DATA2B1_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of1_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (of1_addr_lo_wr) of1_addr_lo <=  gpu_data_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      of1_addr  = {of1_addr_hi[`APIX_HI_MSB:0], of1_addr_lo};
`else
assign      of1_addr  = {of1_addr_lo[`APIX_LO_MSB:0]};
`endif

//------------------------------------------------
// OF2_ADDR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] of2_addr_hi;

wire                 of2_addr_hi_wr = (reg_access==REG_OF2_ADDR) & (gpu_state==DATA2B2_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of2_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (of2_addr_hi_wr) of2_addr_hi <=  gpu_data_i[`APIX_HI_MSB:0];
`endif

//------------------------------------------------
// OF2_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] of2_addr_lo;

wire                 of2_addr_lo_wr = (reg_access==REG_OF2_ADDR) & (gpu_state==DATA2B1_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of2_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (of2_addr_lo_wr) of2_addr_lo <=  gpu_data_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      of2_addr  = {of2_addr_hi[`APIX_HI_MSB:0], of2_addr_lo};
`else
assign      of2_addr  = {of2_addr_lo[`APIX_LO_MSB:0]};
`endif

//------------------------------------------------
// OF3_ADDR_HI Register
//------------------------------------------------
`ifdef VRAM_BIGGER_4_KW
reg [`APIX_HI_MSB:0] of3_addr_hi;

wire                 of3_addr_hi_wr = (reg_access==REG_OF3_ADDR) & (gpu_state==DATA2B2_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of3_addr_hi <=  {`APIX_HI_MSB+1{1'b0}};
  else if (of3_addr_hi_wr) of3_addr_hi <=  gpu_data_i[`APIX_HI_MSB:0];
`endif

//------------------------------------------------
// OF3_ADDR_LO Register
//------------------------------------------------
reg [`APIX_LO_MSB:0] of3_addr_lo;

wire                 of3_addr_lo_wr = (reg_access==REG_OF3_ADDR) & (gpu_state==DATA2B1_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)             of3_addr_lo <=  {`APIX_LO_MSB+1{1'b0}};
  else if (of3_addr_lo_wr) of3_addr_lo <=  gpu_data_i[`APIX_LO_MSB:0];

`ifdef VRAM_BIGGER_4_KW
assign      of3_addr  = {of3_addr_hi[`APIX_HI_MSB:0], of3_addr_lo};
`else
assign      of3_addr  = {of3_addr_lo[`APIX_LO_MSB:0]};
`endif

// Offset address selection
assign src_offset_addr    = (src_offset_sel==2'h0) ? of0_addr :
                            (src_offset_sel==2'h1) ? of1_addr :
                            (src_offset_sel==2'h2) ? of2_addr : of3_addr;

assign dst_offset_addr    = (dst_offset_sel==2'h0) ? of0_addr :
                            (dst_offset_sel==2'h1) ? of1_addr :
                            (dst_offset_sel==2'h2) ? of2_addr : of3_addr;


//------------------------------------------------
// TRANSPARENT_COLOR Register
//------------------------------------------------

wire  transparent_color_wr = (reg_access==REG_SET_TRANSPARENT) & (gpu_state==DATA1B_READ);

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                   transparent_color <=  16'h0000;
  else if (transparent_color_wr) transparent_color <=  gpu_data_i;

assign cfg_transparent_color_o = transparent_color;

endmodule // ogfx_gpu_reg

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
