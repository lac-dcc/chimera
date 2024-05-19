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
// *File Name: ogfx_backend_frame_fifo.v
//
// *Module Description:
//                      Mini-cache memory for frame memory access.
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

module  ogfx_backend_frame_fifo (

// OUTPUTs
    frame_data_o,                               // Frame data
    frame_data_ready_o,                         // Frame data ready

    vid_ram_addr_o,                             // Video-RAM address
    vid_ram_cen_o,                              // Video-RAM enable (active low)

// INPUTs
    mclk,                                       // Main system clock
    puc_rst,                                    // Main system reset

    display_width_i,                            // Display width
    display_height_i,                           // Display height
    display_size_i,                             // Display size (number of pixels)
    display_y_swap_i,                           // Display configuration: swap Y axis (horizontal symmetry)
    display_x_swap_i,                           // Display configuration: swap X axis (vertical symmetry)
    display_cl_swap_i,                          // Display configuration: swap column/lines

    frame_data_request_i,                       // Request for next frame data

    gfx_mode_i,                                 // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

    vid_ram_dout_i,                             // Video-RAM data output
    vid_ram_dout_rdy_nxt_i,                     // Video-RAM data output ready during next cycle

    refresh_active_i,                           // Display refresh on going
    refresh_frame_base_addr_i                   // Refresh frame base address
);

// OUTPUTs
//=========
output       [15:0] frame_data_o;               // Frame data
output              frame_data_ready_o;         // Frame data ready

output[`VRAM_MSB:0] vid_ram_addr_o;             // Video-RAM address
output              vid_ram_cen_o;              // Video-RAM enable (active low)

// INPUTs
//=========
input               mclk;                       // Main system clock
input               puc_rst;                    // Main system reset

input [`LPIX_MSB:0] display_width_i;            // Display width
input [`LPIX_MSB:0] display_height_i;           // Display height
input [`SPIX_MSB:0] display_size_i;             // Display size (number of pixels)
input               display_y_swap_i;           // Display configuration: swap Y axis (horizontal symmetry)
input               display_x_swap_i;           // Display configuration: swap X axis (vertical symmetry)
input               display_cl_swap_i;          // Display configuration: swap column/lines

input               frame_data_request_i;       // Request for next frame data

input         [2:0] gfx_mode_i;                 // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

input        [15:0] vid_ram_dout_i;             // Video-RAM data output
input               vid_ram_dout_rdy_nxt_i;     // Video-RAM data output ready during next cycle

input               refresh_active_i;           // Display refresh on going
input [`APIX_MSB:0] refresh_frame_base_addr_i;  // Refresh frame base address


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// Some parameter(s)
parameter   FIFO_EMPTY        =  2'h0,
            FIFO_FULL         =  2'h3;

// Video modes decoding
wire        gfx_mode_1_bpp    =  (gfx_mode_i == 3'b000);
wire        gfx_mode_2_bpp    =  (gfx_mode_i == 3'b001);
wire        gfx_mode_4_bpp    =  (gfx_mode_i == 3'b010);
wire        gfx_mode_8_bpp    =  (gfx_mode_i == 3'b011);
wire        gfx_mode_16_bpp   = ~(gfx_mode_8_bpp | gfx_mode_4_bpp |
                                  gfx_mode_2_bpp | gfx_mode_1_bpp);

// Others
reg   [1:0] fifo_counter;
wire  [1:0] fifo_counter_nxt;
wire        fifo_data_ready;
wire        read_from_fifo;
reg         vid_ram_data_mux_ready;
reg         vid_ram_dout_ready;
wire [15:0] vid_ram_dout_processed;


//============================================================================
// 1) FRAME ADDRESS GENERATION
//============================================================================

//--------------------------------
// FIFO data request
//--------------------------------
// The FIFO requests for new data whenever it is not full (or not about to get full)

reg   fifo_data_request;
wire  fifo_data_request_nxt = refresh_active_i                  &
                               (fifo_counter_nxt !=  FIFO_FULL) &                      // FIFO is full
                             ~((fifo_counter_nxt == (FIFO_FULL-1)) & fifo_data_ready); // FIFO is about to be full

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)  fifo_data_request  <= 1'h0;
  else          fifo_data_request  <= fifo_data_request_nxt;

//--------------------------------
// Video RAM Address generation
//--------------------------------
reg    [`APIX_MSB:0] vid_ram_pixel_addr;
reg    [`APIX_MSB:0] vid_ram_line_addr;
reg    [`LPIX_MSB:0] vid_ram_column_count;

// Detect when the fifo is done reading the current pixel data
wire                 vid_ram_pixel_done = fifo_data_request & fifo_data_ready;

// Detect when the current line refresh is done
wire   [`LPIX_MSB:0] line_length        = display_cl_swap_i ? display_height_i : display_width_i;
wire                 vid_ram_line_done  = vid_ram_pixel_done & (vid_ram_column_count==(line_length-{{`LPIX_MSB{1'b0}}, 1'b1}));

// Zero extension for LINT cleanup
wire [`VRAM_MSB*3:0] display_size_norm  =  {{`VRAM_MSB*3-`SPIX_MSB{1'b0}}, display_size_i};
wire [`VRAM_MSB*3:0] display_width_norm =  {{`VRAM_MSB*3-`LPIX_MSB{1'b0}}, display_width_i};

// Based on the display configuration (i.e. X-Swap / Y-Swap / CL-Swap)
// the screen is not going to be refreshed in the same way.
// The screen refresh is the performed according to the following
// pseudo-code procedure:
//
// for (l_idx=0; l_idx<HEIGHT; l_idx++)
//    for (c_idx=0; c_idx<WIDTH; c_idx++)
//        addr = FIRST +    0    + WIDTH*l_idx + c_idx // Normal
//        addr = FIRST + WIDTH-1 + WIDTH*l_idx - c_idx // X-Swap
//        addr = LAST  - WIDTH+1 - WIDTH*l_idx + c_idx // Y-Swap
//        addr = LAST  -    0    - WIDTH*l_idx - c_idx // X/Y-Swap
//

wire [`APIX_MSB:0] next_base_addr     =  ~refresh_active_i  ? refresh_frame_base_addr_i :
                                          vid_ram_line_done ? vid_ram_line_addr         :
                                                              vid_ram_pixel_addr        ;

wire [`APIX_MSB:0] next_addr          =   next_base_addr
                                        + (display_size_norm[`APIX_MSB:0]  & {`APIX_MSB+1{refresh_active_i ?  1'b0                                                          : display_y_swap_i}})
                                        + (display_width_norm[`APIX_MSB:0] & {`APIX_MSB+1{refresh_active_i ? (~display_y_swap_i &  (display_cl_swap_i ^ vid_ram_line_done)) : display_x_swap_i}})
                                        - (display_width_norm[`APIX_MSB:0] & {`APIX_MSB+1{refresh_active_i ? ( display_y_swap_i &  (display_cl_swap_i ^ vid_ram_line_done)) : display_y_swap_i}})
                                        + ({{`APIX_MSB{1'b0}}, 1'b1}       & {`APIX_MSB+1{refresh_active_i ? (~display_x_swap_i & ~(display_cl_swap_i ^ vid_ram_line_done)) : 1'b0            }})
                                        - ({{`APIX_MSB{1'b0}}, 1'b1}       & {`APIX_MSB+1{refresh_active_i ? ( display_x_swap_i & ~(display_cl_swap_i ^ vid_ram_line_done)) : display_x_swap_i}});

wire               update_line_addr   =  ~refresh_active_i | vid_ram_line_done;
wire               update_pixel_addr  =   update_line_addr | vid_ram_pixel_done;

// Start RAM address of currentely refreshed line
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)               vid_ram_line_addr  <=  {`APIX_MSB+1{1'b0}};
  else if (update_line_addr) vid_ram_line_addr  <=  next_addr;

// Current RAM address of the currentely refreshed pixel
wire [`APIX_MSB:0] vid_ram_pixel_addr_nxt = update_pixel_addr ? next_addr : vid_ram_pixel_addr;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_pixel_addr  <=  {`APIX_MSB+1{1'b0}};
  else         vid_ram_pixel_addr  <=  vid_ram_pixel_addr_nxt;

// Count the pixel number in the current line
// (used to detec the end of a line)
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                 vid_ram_column_count  <=  {`LPIX_MSB+1{1'b0}};
  else if (~refresh_active_i)  vid_ram_column_count  <=  {`LPIX_MSB+1{1'b0}};
  else if (vid_ram_line_done)  vid_ram_column_count  <=  {`LPIX_MSB+1{1'b0}};
  else if (vid_ram_pixel_done) vid_ram_column_count  <=  vid_ram_column_count + {{`LPIX_MSB{1'b0}}, 1'b1};

// Depending on the color mode, format the address for doing the RAM accesses.
assign              vid_ram_addr_o   = ({`VRAM_MSB+1{gfx_mode_1_bpp }} & vid_ram_pixel_addr[`VRAM_MSB+4:4]) |
                                       ({`VRAM_MSB+1{gfx_mode_2_bpp }} & vid_ram_pixel_addr[`VRAM_MSB+3:3]) |
                                       ({`VRAM_MSB+1{gfx_mode_4_bpp }} & vid_ram_pixel_addr[`VRAM_MSB+2:2]) |
                                       ({`VRAM_MSB+1{gfx_mode_8_bpp }} & vid_ram_pixel_addr[`VRAM_MSB+1:1]) |
                                       ({`VRAM_MSB+1{gfx_mode_16_bpp}} & vid_ram_pixel_addr[`VRAM_MSB+0:0]) ;

// Compute the next RAM address to detect when a new address is generated
wire [`VRAM_MSB:0] vid_ram_addr_nxt = ({`VRAM_MSB+1{gfx_mode_1_bpp }} & vid_ram_pixel_addr_nxt[`VRAM_MSB+4:4]) |
                                      ({`VRAM_MSB+1{gfx_mode_2_bpp }} & vid_ram_pixel_addr_nxt[`VRAM_MSB+3:3]) |
                                      ({`VRAM_MSB+1{gfx_mode_4_bpp }} & vid_ram_pixel_addr_nxt[`VRAM_MSB+2:2]) |
                                      ({`VRAM_MSB+1{gfx_mode_8_bpp }} & vid_ram_pixel_addr_nxt[`VRAM_MSB+1:1]) |
                                      ({`VRAM_MSB+1{gfx_mode_16_bpp}} & vid_ram_pixel_addr_nxt[`VRAM_MSB+0:0]) ;

// Detect when a new word needs to be fetched from the memory
// (i.e. detect when the RAM address is updated)
reg  vid_ram_addr_update;
wire vid_ram_addr_update_nxt = (vid_ram_addr_o != vid_ram_addr_nxt);
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                 vid_ram_addr_update  <=  1'h0;
  else if (~refresh_active_i)  vid_ram_addr_update  <=  1'h1;
  else if (vid_ram_pixel_done) vid_ram_addr_update  <=  vid_ram_addr_update_nxt;


// Disable RAM access if there is no need to fetch a new word
assign vid_ram_cen_o   = vid_ram_addr_update ? ~fifo_data_request     : 1'b1;

// If the next FIFO data doesn't come from the RAM, then it is ready as
// soon as it is requested
assign fifo_data_ready = vid_ram_addr_update ? vid_ram_dout_rdy_nxt_i : fifo_data_request;


//============================================================================
// 2) FRAME DATA-PRE-PROCESSING (PRIOR BEING PUSHED INTO FIFO)
//============================================================================

//--------------------------------
// Data buffer
//--------------------------------
// For the LUT modes, it is not necessary to access the RAM for
// every pixel. In that case, the FIFO is filled with the values
// coming from the buffer.
// (i.e. we only take data directly from the RAM when it is just read)
reg [15:0] vid_ram_dout_buf;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                 vid_ram_dout_buf <=  16'h0000;
  else if (vid_ram_dout_ready) vid_ram_dout_buf <=  vid_ram_dout_i;

wire [15:0] vid_ram_dout_mux = vid_ram_dout_ready ? vid_ram_dout_i : vid_ram_dout_buf;

//--------------------------------
// Data formating
//--------------------------------
// Depending on the mode, the address LSBs are used to select which bits
// of the current data word need to be put in the FIFO
wire [3:0] vid_ram_data_sel_nxt    = ({4{gfx_mode_1_bpp}} & {vid_ram_pixel_addr[3:0]         }) |
                                     ({4{gfx_mode_2_bpp}} & {vid_ram_pixel_addr[2:0], 1'b0   }) |
                                     ({4{gfx_mode_4_bpp}} & {vid_ram_pixel_addr[1:0], 2'b00  }) |
                                     ({4{gfx_mode_8_bpp}} & {vid_ram_pixel_addr[0],   3'b000 }) ;

reg  [3:0] vid_ram_data_sel;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                 vid_ram_data_sel <=  4'h0;
  else if (vid_ram_pixel_done) vid_ram_data_sel <=  vid_ram_data_sel_nxt;


wire [15:0] vid_ram_dout_shifted   = (vid_ram_dout_mux >> vid_ram_data_sel);

// Format data output for LUT processing
// (8 bit LSBs are used to address the LUT memory, MSBs are ignored)
assign      vid_ram_dout_processed = ({16{gfx_mode_1_bpp }} & {8'h00, 7'b0000000, vid_ram_dout_shifted[0]  }) |
                                     ({16{gfx_mode_2_bpp }} & {8'h00, 6'b000000 , vid_ram_dout_shifted[1:0]}) |
                                     ({16{gfx_mode_4_bpp }} & {8'h00, 4'b0000   , vid_ram_dout_shifted[3:0]}) |
                                     ({16{gfx_mode_8_bpp }} & {8'h00,             vid_ram_dout_shifted[7:0]}) |
                                     ({16{gfx_mode_16_bpp}} & {       vid_ram_dout_shifted[15:0]           }) ;

//--------------------------------
// Data Ready
//--------------------------------
// Data is available on the bus one cycle after the rdy_nxt signals
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_data_mux_ready  <=  1'b0;
  else         vid_ram_data_mux_ready  <=  fifo_data_ready;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst) vid_ram_dout_ready      <=  1'b0;
  else         vid_ram_dout_ready      <=  vid_ram_dout_rdy_nxt_i;


//============================================================================
// 3) FIFO COUNTER
//============================================================================

// Declaration
// Control signals
wire      fifo_push =  vid_ram_data_mux_ready & (fifo_counter != FIFO_FULL);
wire      fifo_pop  =  read_from_fifo         & (fifo_counter != FIFO_EMPTY);

// Fifo counter
assign fifo_counter_nxt = ~refresh_active_i      ?  FIFO_EMPTY          : // Initialize
                          (fifo_push & fifo_pop) ?  fifo_counter        : // Keep value (pop & push at the same time)
                           fifo_push             ?  fifo_counter + 2'h1 : // Push
                           fifo_pop              ?  fifo_counter - 2'h1 : // Pop
                                                    fifo_counter;         // Hold

always @(posedge mclk or posedge puc_rst)
  if (puc_rst) fifo_counter <= FIFO_EMPTY;
  else         fifo_counter <= fifo_counter_nxt;


//============================================================================
// 4) FIFO MEMORY & RD/WR POINTERS
//============================================================================

// Write pointer
reg [1:0] wr_ptr;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    wr_ptr  <=  2'h0;
  else if (~refresh_active_i)     wr_ptr  <=  2'h0;
  else if (fifo_push)
    begin
       if (wr_ptr==(FIFO_FULL-1)) wr_ptr  <=  2'h0;
       else                       wr_ptr  <=  wr_ptr + 2'h1;
    end

// Memory
reg [15:0] fifo_mem [0:2];
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       fifo_mem[0]      <=  16'h0000;
       fifo_mem[1]      <=  16'h0000;
       fifo_mem[2]      <=  16'h0000;
    end
  else if (fifo_push)
    begin
       fifo_mem[wr_ptr] <=  vid_ram_dout_processed;
    end

// Read pointer
reg [1:0] rd_ptr;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    rd_ptr  <=  2'h0;
  else if (~refresh_active_i)     rd_ptr  <=  2'h0;
  else if (fifo_pop)
    begin
       if (rd_ptr==(FIFO_FULL-1)) rd_ptr  <=  2'h0;
       else                       rd_ptr  <=  rd_ptr + 2'h1;
    end


//============================================================================
// 5) FRAME DATA FROM FIFO
//============================================================================

// RAW Data is valid
reg  frame_data_init;
wire frame_data_init_nxt = ~refresh_active_i ? 1'h0 :
                            fifo_pop         ? 1'b1 : frame_data_init;

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)       frame_data_init <= 1'h0;
  else               frame_data_init <= frame_data_init_nxt;

// RAW Data from the frame buffer
reg [15:0] frame_data_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)       frame_data_o    <= 16'h0000;
  else if (fifo_pop) frame_data_o    <= fifo_mem[rd_ptr];

// Data is ready
assign    frame_data_ready_o       = frame_data_init_nxt & (fifo_counter != FIFO_EMPTY);

// Read from FIFO command
assign    read_from_fifo = ~refresh_active_i |
                           ~frame_data_init  |
                            ((fifo_counter != FIFO_EMPTY) & frame_data_request_i);


endmodule // ogfx_backend_frame_fifo

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
