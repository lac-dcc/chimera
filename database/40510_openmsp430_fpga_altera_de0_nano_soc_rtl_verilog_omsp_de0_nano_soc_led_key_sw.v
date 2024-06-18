// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2001 Authors
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
// *File Name: omsp_de0_nano_soc_led_key_sw.v
//
// *Module Description:
//                      Custom peripheral for the DE0 Nano SoC board
//                      for driving LEDs and reading SWITCHES and KEYs (i.e. buttons)
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$
// $LastChangedBy$
// $LastChangedDate$
//----------------------------------------------------------------------------

module  omsp_de0_nano_soc_led_key_sw (

// OUTPUTs
    irq_key,                        // Key/Button interrupt
    irq_sw,                         // Switch interrupt
    led,                            // LED output control
    per_dout,                       // Peripheral data output

// INPUTs
    mclk,                           // Main system clock
    key,                            // key/button inputs
    sw,                             // switches inputs
    per_addr,                       // Peripheral address
    per_din,                        // Peripheral data input
    per_en,                         // Peripheral enable (high active)
    per_we,                         // Peripheral write enable (high active)
    puc_rst                         // Main system reset
);

// OUTPUTs
//=========
output             irq_key;         // Key/Button interrupt
output             irq_sw;          // Switch interrupt
output       [7:0] led;             // LED output control
output      [15:0] per_dout;        // Peripheral data output

// INPUTs
//=========
input              mclk;            // Main system clock
input        [1:0] key;             // key/button inputs
input        [3:0] sw;              // switches inputs
input       [13:0] per_addr;        // Peripheral address
input       [15:0] per_din;         // Peripheral data input
input              per_en;          // Peripheral enable (high active)
input        [1:0] per_we;          // Peripheral write enable (high active)
input              puc_rst;         // Main system reset


//=============================================================================
// 1)  PARAMETER DECLARATION
//=============================================================================

// Register base address (must be aligned to decoder bit width)
parameter       [14:0] BASE_ADDR         = 15'h0090;

// Decoder bit width (defines how many bits are considered for address decoding)
parameter              DEC_WD            =  3;

// Register addresses offset
parameter [DEC_WD-1:0] LED_CTRL          =  'h0,
                       KEY_SW_VAL        =  'h1,
                       KEY_SW_IRQ_EN     =  'h2,
                       KEY_SW_IRQ_EDGE   =  'h3,
                       KEY_SW_IRQ_VAL    =  'h4;


// Register one-hot decoder utilities
parameter              DEC_SZ            =  2**DEC_WD;
parameter [DEC_SZ-1:0] BASE_REG          =  {{DEC_SZ-1{1'b0}}, 1'b1};

// Register one-hot decoder
parameter [DEC_SZ-1:0] LED_CTRL_D        = (BASE_REG << LED_CTRL       ),
                       KEY_SW_VAL_D      = (BASE_REG << KEY_SW_VAL     ),
                       KEY_SW_IRQ_EN_D   = (BASE_REG << KEY_SW_IRQ_EN  ),
                       KEY_SW_IRQ_EDGE_D = (BASE_REG << KEY_SW_IRQ_EDGE),
                       KEY_SW_IRQ_VAL_D  = (BASE_REG << KEY_SW_IRQ_VAL );

//============================================================================
// 2)  REGISTER DECODER
//============================================================================

// Local register selection
wire              reg_sel      =  per_en & (per_addr[13:DEC_WD-1]==BASE_ADDR[14:DEC_WD]);

// Register local address
wire [DEC_WD-1:0] reg_addr     =  {1'b0, per_addr[DEC_WD-2:0]};

// Register address decode
wire [DEC_SZ-1:0] reg_dec      = (LED_CTRL_D        &  {DEC_SZ{(reg_addr==(LED_CTRL        >>1))}}) |
                                 (KEY_SW_VAL_D      &  {DEC_SZ{(reg_addr==(KEY_SW_VAL      >>1))}}) |
                                 (KEY_SW_IRQ_EN_D   &  {DEC_SZ{(reg_addr==(KEY_SW_IRQ_EN   >>1))}}) |
                                 (KEY_SW_IRQ_EDGE_D &  {DEC_SZ{(reg_addr==(KEY_SW_IRQ_EDGE >>1))}}) |
                                 (KEY_SW_IRQ_VAL_D  &  {DEC_SZ{(reg_addr==(KEY_SW_IRQ_VAL  >>1))}});

// Read/Write probes
wire              reg_lo_write =  per_we[0] & reg_sel;
wire              reg_hi_write =  per_we[1] & reg_sel;
wire              reg_read     = ~|per_we   & reg_sel;

// Read/Write vectors
wire [DEC_SZ-1:0] reg_hi_wr    = reg_dec & {DEC_SZ{reg_hi_write}};
wire [DEC_SZ-1:0] reg_lo_wr    = reg_dec & {DEC_SZ{reg_lo_write}};
wire [DEC_SZ-1:0] reg_rd       = reg_dec & {DEC_SZ{reg_read}};


//============================================================================
// 3) REGISTERS
//============================================================================

// LED Control Register
//----------------------
reg  [7:0] led_ctrl;

wire       led_ctrl_wr  = LED_CTRL[0] ? reg_hi_wr[LED_CTRL] : reg_lo_wr[LED_CTRL];
wire [7:0] led_ctrl_nxt = LED_CTRL[0] ? per_din[15:8]       : per_din[7:0];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)          led_ctrl <=  8'h00;
  else if (led_ctrl_wr) led_ctrl <=  led_ctrl_nxt;

assign led = led_ctrl;

// KEY_SW_VAL Register
//---------------------

// Synchronize and debounce the input signals
wire [1:0] key_deb;
wire [3:0] sw_deb;
sync_debouncer_10ms sync_debouncer_10ms_key1 (.signal_debounced(key_deb[1]), .clk_50mhz(mclk), .rst(puc_rst), .signal_async(key[1]));
sync_debouncer_10ms sync_debouncer_10ms_key0 (.signal_debounced(key_deb[0]), .clk_50mhz(mclk), .rst(puc_rst), .signal_async(key[0]));
sync_debouncer_10ms sync_debouncer_10ms_sw3  (.signal_debounced(sw_deb[3]),  .clk_50mhz(mclk), .rst(puc_rst), .signal_async(sw[3]));
sync_debouncer_10ms sync_debouncer_10ms_sw2  (.signal_debounced(sw_deb[2]),  .clk_50mhz(mclk), .rst(puc_rst), .signal_async(sw[2]));
sync_debouncer_10ms sync_debouncer_10ms_sw1  (.signal_debounced(sw_deb[1]),  .clk_50mhz(mclk), .rst(puc_rst), .signal_async(sw[1]));
sync_debouncer_10ms sync_debouncer_10ms_sw0  (.signal_debounced(sw_deb[0]),  .clk_50mhz(mclk), .rst(puc_rst), .signal_async(sw[0]));

wire [7:0] key_sw_val = {1'b0,      1'b0,      key_deb[1], key_deb[0],
                         sw_deb[3], sw_deb[2], sw_deb[1],  sw_deb[0] };


// KEY_SW_IRQ_EN Register
//----------------------
reg  [7:0] key_sw_irq_en;

wire       key_sw_irq_en_wr  = KEY_SW_IRQ_EN[0] ? reg_hi_wr[KEY_SW_IRQ_EN] : reg_lo_wr[KEY_SW_IRQ_EN];
wire [7:0] key_sw_irq_en_nxt = KEY_SW_IRQ_EN[0] ? per_din[15:8]            : per_din[7:0];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)               key_sw_irq_en <=  8'h00;
  else if (key_sw_irq_en_wr) key_sw_irq_en <=  key_sw_irq_en_nxt & 8'h3F;


// KEY_SW_IRQ_EDGE Register
//--------------------------
reg  [7:0] key_sw_irq_edge;

wire       key_sw_irq_edge_wr  = KEY_SW_IRQ_EDGE[0] ? reg_hi_wr[KEY_SW_IRQ_EDGE] : reg_lo_wr[KEY_SW_IRQ_EDGE];
wire [7:0] key_sw_irq_edge_nxt = KEY_SW_IRQ_EDGE[0] ? per_din[15:8]              : per_din[7:0];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)                 key_sw_irq_edge <=  8'h00;
  else if (key_sw_irq_edge_wr) key_sw_irq_edge <=  key_sw_irq_edge_nxt & 8'h3F;


// KEY_SW_IRQ_VAL Register
//-------------------------
reg  [7:0] key_sw_irq_val;

wire       key_sw_irq_val_wr  = KEY_SW_IRQ_VAL[0] ? reg_hi_wr[KEY_SW_IRQ_VAL] : reg_lo_wr[KEY_SW_IRQ_VAL];
wire [7:0] key_sw_irq_val_nxt = KEY_SW_IRQ_VAL[0] ? per_din[15:8]              : per_din[7:0];

wire [5:0] key_sw_irq_clr     = key_sw_irq_val_nxt[5:0] & {6{key_sw_irq_val_wr}}; // Clear IRQ flag when 1 is writen
wire [5:0] key_sw_irq_set;

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) key_sw_irq_val <=  8'h00;
  else         key_sw_irq_val <= {2'b00, (key_sw_irq_set | (~key_sw_irq_clr & key_sw_irq_val[5:0]))}; // IRQ set has priority over clear

assign  irq_key = |key_sw_irq_val[5:4];
assign  irq_sw  = |key_sw_irq_val[3:0];

//============================================================================
// 4) DATA OUTPUT GENERATION
//============================================================================

// Data output mux
wire [15:0] led_ctrl_rd        = (led_ctrl        & {8{reg_rd[LED_CTRL]}})        << (8 & {4{LED_CTRL[0]}});
wire [15:0] key_sw_val_rd      = (key_sw_val      & {8{reg_rd[KEY_SW_VAL]}})      << (8 & {4{KEY_SW_VAL[0]}});
wire [15:0] key_sw_irq_en_rd   = (key_sw_irq_en   & {8{reg_rd[KEY_SW_IRQ_EN]}})   << (8 & {4{KEY_SW_IRQ_EN[0]}});
wire [15:0] key_sw_irq_edge_rd = (key_sw_irq_edge & {8{reg_rd[KEY_SW_IRQ_EDGE]}}) << (8 & {4{KEY_SW_IRQ_EDGE[0]}});
wire [15:0] key_sw_irq_val_rd  = (key_sw_irq_val  & {8{reg_rd[KEY_SW_IRQ_VAL]}})  << (8 & {4{KEY_SW_IRQ_VAL[0]}});

wire [15:0] per_dout           =  led_ctrl_rd        |
                                  key_sw_val_rd      |
                                  key_sw_irq_en_rd   |
                                  key_sw_irq_edge_rd |
                                  key_sw_irq_val_rd;


//============================================================================
// 5) IRQ GENERATION
//============================================================================

// Delay debounced signal for edge detection
reg  [5:0] key_sw_deb_dly;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) key_sw_deb_dly <=  6'h00;
  else         key_sw_deb_dly <=  key_sw_val[5:0];

wire [5:0] key_sw_posedge = ~key_sw_val[5:0] &  key_sw_deb_dly;
wire [5:0] key_sw_negedge =  key_sw_val[5:0] & ~key_sw_deb_dly;
wire [5:0] key_sw_edge    = (key_sw_posedge  &  key_sw_irq_edge[5:0]) |
                            (key_sw_negedge  & ~key_sw_irq_edge[5:0]);

assign key_sw_irq_set =  key_sw_irq_en[5:0] & key_sw_edge;


endmodule // omsp_de0_nano_soc_led_key_sw
