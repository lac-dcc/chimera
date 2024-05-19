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
// *File Name: ogfx_backend_lut_fifo.v
//
// *Module Description:
//                      Mini-cache memory for the LUT memory accesses.
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

module  ogfx_backend_lut_fifo (

// OUTPUTs
    frame_data_request_o,                        // Request for next frame data

    refresh_data_o,                              // Display Refresh data
    refresh_data_ready_o,                        // Display Refresh data ready

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_addr_o,                              // LUT-RAM address
    lut_ram_cen_o,                               // LUT-RAM enable (active low)
`endif

// INPUTs
    mclk,                                        // Main system clock
    puc_rst,                                     // Main system reset

    frame_data_i,                                // Frame data
    frame_data_ready_i,                          // Frame data ready

    gfx_mode_i,                                  // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

`ifdef WITH_PROGRAMMABLE_LUT
    lut_ram_dout_i,                              // LUT-RAM data output
    lut_ram_dout_rdy_nxt_i,                      // LUT-RAM data output ready during next cycle
`endif

    refresh_active_i,                            // Display refresh on going
    refresh_data_request_i,                      // Request for next refresh data

    hw_lut_palette_sel_i,                        // Hardware LUT palette configuration
    hw_lut_bgcolor_i,                            // Hardware LUT background-color selection
    hw_lut_fgcolor_i,                            // Hardware LUT foreground-color selection
    sw_lut_enable_i,                             // Refresh LUT-RAM enable
    sw_lut_bank_select_i                         // Refresh LUT-RAM bank selection
);

// OUTPUTs
//=========
output               frame_data_request_o;       // Request for next frame data

output        [15:0] refresh_data_o;             // Display Refresh data
output               refresh_data_ready_o;       // Display Refresh data ready

`ifdef WITH_PROGRAMMABLE_LUT
output [`LRAM_MSB:0] lut_ram_addr_o;             // LUT-RAM address
output               lut_ram_cen_o;              // LUT-RAM enable (active low)
`endif

// INPUTs
//=========
input                mclk;                       // Main system clock
input                puc_rst;                    // Main system reset

input         [15:0] frame_data_i;               // Frame data
input                frame_data_ready_i;         // Frame data ready

input          [2:0] gfx_mode_i;                 // Video mode (1xx:16bpp / 011:8bpp / 010:4bpp / 001:2bpp / 000:1bpp)

`ifdef WITH_PROGRAMMABLE_LUT
input         [15:0] lut_ram_dout_i;             // LUT-RAM data output
input                lut_ram_dout_rdy_nxt_i;     // LUT-RAM data output ready during next cycle
`endif

input                refresh_active_i;           // Display refresh on going
input                refresh_data_request_i;     // Request for next refresh data

input          [2:0] hw_lut_palette_sel_i;       // Hardware LUT palette configuration
input          [3:0] hw_lut_bgcolor_i;           // Hardware LUT background-color selection
input          [3:0] hw_lut_fgcolor_i;           // Hardware LUT foreground-color selection
input                sw_lut_enable_i;            // Refresh LUT-RAM enable
input                sw_lut_bank_select_i;       // Refresh LUT-RAM bank selection


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// State machine registers
reg    [1:0] lut_state;
reg    [1:0] lut_state_nxt;

// State definition
parameter    STATE_IDLE        =   0,
             STATE_FRAME_DATA  =   1,
             STATE_LUT_DATA    =   2,
             STATE_HOLD        =   3;

// Some parameter(s)
parameter    FIFO_EMPTY        =  3'h0,
             FIFO_FULL         =  3'h5;

// Video modes decoding
wire         gfx_mode_1_bpp    =  (gfx_mode_i == 3'b000);
wire         gfx_mode_2_bpp    =  (gfx_mode_i == 3'b001);
wire         gfx_mode_4_bpp    =  (gfx_mode_i == 3'b010);
wire         gfx_mode_8_bpp    =  (gfx_mode_i == 3'b011);
wire         gfx_mode_16_bpp   = ~(gfx_mode_8_bpp | gfx_mode_4_bpp |
                                   gfx_mode_2_bpp | gfx_mode_1_bpp);

// Others
reg    [2:0] fifo_counter;
wire   [2:0] fifo_counter_nxt;


//============================================================================
// 2) HARD CODED LOOKUP TABLE
//============================================================================

// 16 full CGA color selection
parameter [3:0] CGA_BLACK         = 4'h0,
                CGA_BLUE          = 4'h1,
                CGA_GREEN         = 4'h2,
                CGA_CYAN          = 4'h3,
                CGA_RED           = 4'h4,
                CGA_MAGENTA       = 4'h5,
                CGA_BROWN         = 4'h6,
                CGA_LIGHT_GRAY    = 4'h7,
                CGA_GRAY          = 4'h8,
                CGA_LIGHT_BLUE    = 4'h9,
                CGA_LIGHT_GREEN   = 4'hA,
                CGA_LIGHT_CYAN    = 4'hB,
                CGA_LIGHT_RED     = 4'hC,
                CGA_LIGHT_MAGENTA = 4'hD,
                CGA_YELLOW        = 4'hE,
                CGA_WHITE         = 4'hF;

// Decode CGA 4 color mode (2bpp)
wire         cga_palette0_hi   = (hw_lut_palette_sel_i==3'h0);
wire         cga_palette0_lo   = (hw_lut_palette_sel_i==3'h1);
wire         cga_palette1_hi   = (hw_lut_palette_sel_i==3'h2);
wire         cga_palette1_lo   = (hw_lut_palette_sel_i==3'h3);
wire         cga_palette2_hi   = (hw_lut_palette_sel_i==3'h4);
wire         cga_palette2_lo   = (hw_lut_palette_sel_i==3'h5) | (hw_lut_palette_sel_i==3'h6) | (hw_lut_palette_sel_i==3'h7);

// LUT color decoding
                                 // 1 BPP
wire   [3:0] lut_hw_sel_1bpp   = ({4{gfx_mode_1_bpp                   & (frame_data_i[0]  ==1'b0 )}} & hw_lut_bgcolor_i ) |  // 1 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_1_bpp                   & (frame_data_i[0]  ==1'b1 )}} & hw_lut_fgcolor_i ) ;  //         White        (default fgcolor)

                                 // 2 BPP (Palette #0, low-intensity)
wire   [3:0] lut_hw_sel_2bpp   = ({4{gfx_mode_2_bpp & cga_palette0_lo & (frame_data_i[1:0]==2'b00)}} & hw_lut_bgcolor_i ) |  // 2 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_2_bpp & cga_palette0_lo & (frame_data_i[1:0]==2'b01)}} & CGA_GREEN        ) |  //         Green
                                 ({4{gfx_mode_2_bpp & cga_palette0_lo & (frame_data_i[1:0]==2'b10)}} & CGA_RED          ) |  //         Red
                                 ({4{gfx_mode_2_bpp & cga_palette0_lo & (frame_data_i[1:0]==2'b11)}} & CGA_BROWN        ) |  //         Brown

                                 // 2 BPP (Palette #0, high-intensity)
                                 ({4{gfx_mode_2_bpp & cga_palette0_hi & (frame_data_i[1:0]==2'b00)}} & hw_lut_bgcolor_i ) |  // 2 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_2_bpp & cga_palette0_hi & (frame_data_i[1:0]==2'b01)}} & CGA_LIGHT_GREEN  ) |  //         Light-Green
                                 ({4{gfx_mode_2_bpp & cga_palette0_hi & (frame_data_i[1:0]==2'b10)}} & CGA_LIGHT_RED    ) |  //         Light-Red
                                 ({4{gfx_mode_2_bpp & cga_palette0_hi & (frame_data_i[1:0]==2'b11)}} & CGA_YELLOW       ) |  //         Yellow

                                 // 2 BPP (Palette #1, low-intensity)
                                 ({4{gfx_mode_2_bpp & cga_palette1_lo & (frame_data_i[1:0]==2'b00)}} & hw_lut_bgcolor_i ) |  // 2 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_2_bpp & cga_palette1_lo & (frame_data_i[1:0]==2'b01)}} & CGA_CYAN         ) |  //         Cyan
                                 ({4{gfx_mode_2_bpp & cga_palette1_lo & (frame_data_i[1:0]==2'b10)}} & CGA_MAGENTA      ) |  //         Magenta
                                 ({4{gfx_mode_2_bpp & cga_palette1_lo & (frame_data_i[1:0]==2'b11)}} & CGA_LIGHT_GRAY   ) |  //         Light-Gray

                                 // 2 BPP (Palette #1, high-intensity)
                                 ({4{gfx_mode_2_bpp & cga_palette1_hi & (frame_data_i[1:0]==2'b00)}} & hw_lut_bgcolor_i ) |  // 2 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_2_bpp & cga_palette1_hi & (frame_data_i[1:0]==2'b01)}} & CGA_LIGHT_CYAN   ) |  //         Light-Cyan
                                 ({4{gfx_mode_2_bpp & cga_palette1_hi & (frame_data_i[1:0]==2'b10)}} & CGA_LIGHT_MAGENTA) |  //         Light-Magenta
                                 ({4{gfx_mode_2_bpp & cga_palette1_hi & (frame_data_i[1:0]==2'b11)}} & CGA_WHITE        ) |  //         White

                                 // 2 BPP (Palette #2, low-intensity)
                                 ({4{gfx_mode_2_bpp & cga_palette2_lo & (frame_data_i[1:0]==2'b00)}} & hw_lut_bgcolor_i ) |  // 2 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_2_bpp & cga_palette2_lo & (frame_data_i[1:0]==2'b01)}} & CGA_CYAN         ) |  //         Cyan
                                 ({4{gfx_mode_2_bpp & cga_palette2_lo & (frame_data_i[1:0]==2'b10)}} & CGA_RED          ) |  //         Red
                                 ({4{gfx_mode_2_bpp & cga_palette2_lo & (frame_data_i[1:0]==2'b11)}} & CGA_LIGHT_GRAY   ) |  //         Light-Gray

                                 // 2 BPP (Palette #2, high-intensity)
                                 ({4{gfx_mode_2_bpp & cga_palette2_hi & (frame_data_i[1:0]==2'b00)}} & hw_lut_bgcolor_i ) |  // 2 bpp:  Black        (default bgcolor)
                                 ({4{gfx_mode_2_bpp & cga_palette2_hi & (frame_data_i[1:0]==2'b01)}} & CGA_LIGHT_CYAN   ) |  //         Light-Cyan
                                 ({4{gfx_mode_2_bpp & cga_palette2_hi & (frame_data_i[1:0]==2'b10)}} & CGA_LIGHT_RED    ) |  //         Light-Red
                                 ({4{gfx_mode_2_bpp & cga_palette2_hi & (frame_data_i[1:0]==2'b11)}} & CGA_WHITE        ) ;  //         White

                                 // 4 BPP (full CGA 16-color palette)
wire   [3:0] lut_hw_sel_4bpp   = ({4{gfx_mode_4_bpp}}                 &  frame_data_i[3:0]);

wire   [3:0] lut_hw_color_sel  =  lut_hw_sel_4bpp | lut_hw_sel_2bpp | lut_hw_sel_1bpp;

// Color encoding for 1-bit / 2-bit and 4-bit modes
reg   [15:0] lut_hw_data_1_2_4_bpp;
always @(lut_hw_color_sel)
  case(lut_hw_color_sel)
    CGA_BLACK         :  lut_hw_data_1_2_4_bpp  =  {5'b00000, 6'b000000, 5'b00000};     // Black
    CGA_BLUE          :  lut_hw_data_1_2_4_bpp  =  {5'b00000, 6'b000000, 5'b10101};     // Blue
    CGA_GREEN         :  lut_hw_data_1_2_4_bpp  =  {5'b00000, 6'b101011, 5'b00000};     // Green
    CGA_CYAN          :  lut_hw_data_1_2_4_bpp  =  {5'b00000, 6'b101011, 5'b10101};     // Cyan
    CGA_RED           :  lut_hw_data_1_2_4_bpp  =  {5'b10101, 6'b000000, 5'b00000};     // Red
    CGA_MAGENTA       :  lut_hw_data_1_2_4_bpp  =  {5'b10101, 6'b000000, 5'b10101};     // Magenta
    CGA_BROWN         :  lut_hw_data_1_2_4_bpp  =  {5'b10101, 6'b010101, 5'b00000};     // Brown
    CGA_LIGHT_GRAY    :  lut_hw_data_1_2_4_bpp  =  {5'b10101, 6'b101011, 5'b10101};     // Light Gray
    CGA_GRAY          :  lut_hw_data_1_2_4_bpp  =  {5'b01011, 6'b010101, 5'b01011};     // Gray
    CGA_LIGHT_BLUE    :  lut_hw_data_1_2_4_bpp  =  {5'b01011, 6'b010101, 5'b11111};     // Light Blue
    CGA_LIGHT_GREEN   :  lut_hw_data_1_2_4_bpp  =  {5'b01011, 6'b111111, 5'b01011};     // Light Green
    CGA_LIGHT_CYAN    :  lut_hw_data_1_2_4_bpp  =  {5'b01011, 6'b111111, 5'b11111};     // Light Cyan
    CGA_LIGHT_RED     :  lut_hw_data_1_2_4_bpp  =  {5'b11111, 6'b010101, 5'b01011};     // Light Red
    CGA_LIGHT_MAGENTA :  lut_hw_data_1_2_4_bpp  =  {5'b11111, 6'b010101, 5'b11111};     // Light Magenta
    CGA_YELLOW        :  lut_hw_data_1_2_4_bpp  =  {5'b11111, 6'b111111, 5'b01011};     // Yellow
    CGA_WHITE         :  lut_hw_data_1_2_4_bpp  =  {5'b11111, 6'b111111, 5'b11111};     // White
    // pragma coverage off
    default           :  lut_hw_data_1_2_4_bpp  =  16'h0000;
    // pragma coverage on
  endcase

// 8-bit truecolor RGB mapping (3-bit red / 3-bit green / 2-bit blue)
wire  [15:0] lut_hw_data_8_bpp = {frame_data_i[7],frame_data_i[6],frame_data_i[5],frame_data_i[5],frame_data_i[5],                 // 8 bpp:  R = D<7,6,5,5,5>
                                  frame_data_i[4],frame_data_i[3],frame_data_i[2],frame_data_i[2],frame_data_i[2],frame_data_i[2], //         G = D<4,3,2,2,2,2>
                                  frame_data_i[1],frame_data_i[0],frame_data_i[0],frame_data_i[0],frame_data_i[0]};                //         B = D<1,0,0,0,0>

wire  [15:0] lut_hw_data       = (lut_hw_data_1_2_4_bpp & {16{gfx_mode_1_bpp | gfx_mode_2_bpp | gfx_mode_4_bpp}}) |
                                 (lut_hw_data_8_bpp     & {16{gfx_mode_8_bpp}});

wire         lut_hw_enabled    = ~gfx_mode_16_bpp   & ~sw_lut_enable_i;
wire         lut_sw_enabled    = ~gfx_mode_16_bpp   &  sw_lut_enable_i;


//============================================================================
// 3) STATE MACHINE
//============================================================================

//--------------------------------
// States Transitions
//--------------------------------
always @(lut_state or refresh_active_i or frame_data_ready_i     or
`ifdef WITH_PROGRAMMABLE_LUT
                      lut_sw_enabled   or lut_ram_dout_rdy_nxt_i or
`endif
                      fifo_counter_nxt)
    case(lut_state)

      STATE_IDLE           :  lut_state_nxt = ~refresh_active_i             ? STATE_IDLE       : STATE_FRAME_DATA ;

      STATE_FRAME_DATA     :  lut_state_nxt = ~refresh_active_i             ? STATE_IDLE       :
                                              ~frame_data_ready_i           ? STATE_FRAME_DATA :
`ifdef WITH_PROGRAMMABLE_LUT
                                               lut_sw_enabled               ? STATE_LUT_DATA   :
`endif
                                                                                                 STATE_HOLD       ;

`ifdef WITH_PROGRAMMABLE_LUT
      STATE_LUT_DATA       :  lut_state_nxt = ~refresh_active_i             ? STATE_IDLE       :
                                               lut_ram_dout_rdy_nxt_i       ? STATE_HOLD       : STATE_LUT_DATA   ;
`endif

      STATE_HOLD           :  lut_state_nxt = ~refresh_active_i             ? STATE_IDLE       :
                                              (fifo_counter_nxt!=FIFO_FULL) ? STATE_FRAME_DATA : STATE_HOLD       ;

    // pragma coverage off
      default              :  lut_state_nxt =  STATE_IDLE;
    // pragma coverage on
    endcase

//--------------------------------
// State machine
//--------------------------------
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lut_state  <= STATE_IDLE;
  else         lut_state  <= lut_state_nxt;


// Request for the next frame data
assign frame_data_request_o = (lut_state == STATE_FRAME_DATA);


//============================================================================
// 4) LUT MEMORY INTERFACE
//============================================================================

//--------------------------------
// Enable
//--------------------------------
`ifdef WITH_PROGRAMMABLE_LUT
   assign lut_ram_cen_o  = ~(lut_state == STATE_LUT_DATA);
`endif

//--------------------------------
// Address
//--------------------------------
// Mask with chip enable to save power

`ifdef WITH_PROGRAMMABLE_LUT
  `ifdef WITH_EXTRA_LUT_BANK
    // Allow LUT bank switching only when the refresh is not on going
    reg refresh_lut_bank_select_sync;
    always @(posedge mclk or posedge puc_rst)
      if (puc_rst)                refresh_lut_bank_select_sync  <=  1'b0;
      else if (~refresh_active_i) refresh_lut_bank_select_sync  <=  sw_lut_bank_select_i;

    assign lut_ram_addr_o = {refresh_lut_bank_select_sync, frame_data_i[7:0]} & {9{~lut_ram_cen_o}};
  `else
    assign lut_ram_addr_o = frame_data_i[7:0] & {8{~lut_ram_cen_o}};
  `endif
`endif

//--------------------------------
// Data Ready
//--------------------------------
// When filling the FIFO, the data is available on the bus
// one cycle after the rdy_nxt signal
reg            lut_ram_dout_ready;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lut_ram_dout_ready  <=  1'b0;
`ifdef WITH_PROGRAMMABLE_LUT
  else         lut_ram_dout_ready  <=  lut_sw_enabled ? lut_ram_dout_rdy_nxt_i :
                                                        (frame_data_ready_i & (lut_state == STATE_FRAME_DATA));
`else
  else         lut_ram_dout_ready  <=  (frame_data_ready_i & (lut_state == STATE_FRAME_DATA));
`endif


//============================================================================
// 5) FIFO COUNTER
//============================================================================

// Control signals
wire      fifo_push =  lut_ram_dout_ready     & (fifo_counter != FIFO_FULL);
wire      fifo_pop  =  refresh_data_request_i & (fifo_counter != FIFO_EMPTY);

// Fifo counter
assign fifo_counter_nxt = ~refresh_active_i      ?  FIFO_EMPTY          : // Initialize
                          (fifo_push & fifo_pop) ?  fifo_counter        : // Keep value (pop & push at the same time)
                           fifo_push             ?  fifo_counter + 3'h1 : // Push
                           fifo_pop              ?  fifo_counter - 3'h1 : // Pop
                                                    fifo_counter;         // Hold

always @(posedge mclk or posedge puc_rst)
  if (puc_rst) fifo_counter <= FIFO_EMPTY;
  else         fifo_counter <= fifo_counter_nxt;


//============================================================================
// 6) FIFO MEMORY & RD/WR POINTERS
//============================================================================

// Write pointer
reg [2:0] wr_ptr;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    wr_ptr  <=  3'h0;
  else if (~refresh_active_i)     wr_ptr  <=  3'h0;
  else if (fifo_push)
    begin
       if (wr_ptr==(FIFO_FULL-1)) wr_ptr  <=  3'h0;
       else                       wr_ptr  <=  wr_ptr + 3'h1;
    end

// Memory
reg [15:0] fifo_mem [0:4];
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       fifo_mem[0]      <=  16'h0000;
       fifo_mem[1]      <=  16'h0000;
       fifo_mem[2]      <=  16'h0000;
       fifo_mem[3]      <=  16'h0000;
       fifo_mem[4]      <=  16'h0000;
    end
  else if (fifo_push)
    begin
       fifo_mem[wr_ptr] <=  lut_hw_enabled ? lut_hw_data    :
`ifdef WITH_PROGRAMMABLE_LUT
                            lut_sw_enabled ? lut_ram_dout_i :
`endif
                                             frame_data_i;
    end

// Read pointer
reg [2:0] rd_ptr;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    rd_ptr  <=  3'h0;
  else if (~refresh_active_i)     rd_ptr  <=  3'h0;
  else if (fifo_pop)
    begin
       if (rd_ptr==(FIFO_FULL-1)) rd_ptr  <=  3'h0;
       else                       rd_ptr  <=  rd_ptr + 3'h1;
    end

//============================================================================
// 7) REFRESH_DATA
//============================================================================

// Refresh Data is ready
reg        refresh_data_ready_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                refresh_data_ready_o <=  1'h0;
  else if (~refresh_active_i) refresh_data_ready_o <=  1'h0;
  else                        refresh_data_ready_o <=  fifo_pop;

// Refresh Data
reg [15:0] refresh_data_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                refresh_data_o <= 16'h0000;
  else if (fifo_pop)          refresh_data_o <= fifo_mem[rd_ptr];


endmodule // ogfx_backend_lut_fifo

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
