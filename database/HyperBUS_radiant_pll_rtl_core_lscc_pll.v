// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
//   Copyright (c) 2017 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
// -----------------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement. 
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02 
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS         
// Project               : 
// File                  : lscc_pll.v
// Title                 : 
// Dependencies          : 1. PLL_B primitive
// Description           : iCE40UP Phase-Locked Loop.
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0.0.
// Author(s)             : 
// Mod. Date             : 04.20.2017
// Changes Made          : Initial release.
// =============================================================================

`ifndef LSCC_PLL
`define LSCC_PLL
module lscc_pll #
// -----------------------------------------------------------------------------
// Module Parameters
// -----------------------------------------------------------------------------
(
parameter                    DIVR                           = "1",
parameter                    DIVF                           = "1",
parameter                    DIVQ                           = "1",
parameter                    FEEDBACK_PATH                  = "SIMPLE",
parameter                    FILTER_RANGE                   = "0",
parameter                    DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED",
parameter                    FDA_FEEDBACK                   = "0",
parameter                    DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED",
parameter                    FDA_RELATIVE                   = "0",
parameter                    SHIFTREG_DIV_MODE              = "0",
parameter                    PLLOUT_SELECT_PORTA            = "SHIFTREG_0deg",
parameter                    PLLOUT_SELECT_PORTB            = "SHIFTREG_0deg",
parameter                    EXTERNAL_DIVIDE_FACTOR         = "NONE",
parameter                    ENABLE_ICEGATE_PORTA           = "0",
parameter                    ENABLE_ICEGATE_PORTB           = "0",
parameter                    FREQUENCY_PIN_REFERENCECLK     = "10.0"
)
// -----------------------------------------------------------------------------
// Input/Output Ports
// -----------------------------------------------------------------------------
(
input                        ref_clk_i,
input                        rst_n_i,
input                        feedback_i,
input [7:0]                  dynamic_delay_i,
input                        bypass_i,
input                        latch_i,

output wire                  lock_o,
output wire                  outcore_o,
output wire                  outglobal_o,
output wire                  outcoreb_o,
output wire                  outglobalb_o,

input                        sclk_i,
input                        sdi_i,
output wire                  sdo_o
);

// -----------------------------------------------------------------------------
// Wire Declarations
// -----------------------------------------------------------------------------
wire [7:0]                   dynamic_delay_w;
wire                         feedback_w;
wire                         intfbout_w;

// -----------------------------------------------------------------------------
// Generate Assign Statements
// -----------------------------------------------------------------------------
generate
  if (EXTERNAL_DIVIDE_FACTOR != "NONE") begin
    assign feedback_w = feedback_i;
  end
  else begin
    assign feedback_w = intfbout_w;	
  end
endgenerate

generate
  if (DELAY_ADJUSTMENT_MODE_FEEDBACK == "FIXED") begin
    assign dynamic_delay_w[3:0] = 4'b0;
  end
  else begin
    assign dynamic_delay_w[3:0] = dynamic_delay_i[3:0];	
  end
  if (DELAY_ADJUSTMENT_MODE_RELATIVE == "FIXED") begin
    assign dynamic_delay_w[7:4] = 4'b0;
  end
  else begin
    assign dynamic_delay_w[7:4] = dynamic_delay_i[7:4];	
  end
endgenerate

// -----------------------------------------------------------------------------
// PLL Primitive Instantiation
// ----------------------------------------------------------------------------- 
PLL_B # (
  .DIVR                           (DIVR),
  .DIVF                           (DIVF),
  .DIVQ                           (DIVQ),
  .FEEDBACK_PATH                  (FEEDBACK_PATH),
  .FILTER_RANGE                   (FILTER_RANGE),
  .DELAY_ADJUSTMENT_MODE_FEEDBACK (DELAY_ADJUSTMENT_MODE_FEEDBACK),
  .FDA_FEEDBACK                   (FDA_FEEDBACK),
  .DELAY_ADJUSTMENT_MODE_RELATIVE (DELAY_ADJUSTMENT_MODE_RELATIVE),
  .FDA_RELATIVE                   (FDA_RELATIVE),
  .SHIFTREG_DIV_MODE              (SHIFTREG_DIV_MODE),
  .PLLOUT_SELECT_PORTA            (PLLOUT_SELECT_PORTA),
  .PLLOUT_SELECT_PORTB            (PLLOUT_SELECT_PORTB),
  .EXTERNAL_DIVIDE_FACTOR         (EXTERNAL_DIVIDE_FACTOR),
  .ENABLE_ICEGATE_PORTA           (ENABLE_ICEGATE_PORTA),
  .ENABLE_ICEGATE_PORTB           (ENABLE_ICEGATE_PORTB),
  .FREQUENCY_PIN_REFERENCECLK     (FREQUENCY_PIN_REFERENCECLK)
)
u_PLL_B (
  .REFERENCECLK                   (ref_clk_i), 
  .RESET_N                        (rst_n_i),
  .FEEDBACK                       (feedback_w),
  .DYNAMICDELAY7                  (dynamic_delay_w[7]),
  .DYNAMICDELAY6                  (dynamic_delay_w[6]),
  .DYNAMICDELAY5                  (dynamic_delay_w[5]),
  .DYNAMICDELAY4                  (dynamic_delay_w[4]),
  .DYNAMICDELAY3                  (dynamic_delay_w[3]),
  .DYNAMICDELAY2                  (dynamic_delay_w[2]),
  .DYNAMICDELAY1                  (dynamic_delay_w[1]),
  .DYNAMICDELAY0                  (dynamic_delay_w[0]),
  .INTFBOUT                       (intfbout_w),
  .BYPASS                         (bypass_i),
  .LATCH                          (latch_i),
  .OUTCORE                        (outcore_o), 
  .OUTGLOBAL                      (outglobal_o),
  .OUTCOREB                       (outcoreb_o),
  .OUTGLOBALB                     (outglobalb_o),
  .LOCK                           (lock_o),
  .SCLK                           (sclk_i),
  .SDI                            (sdi_i),
  .SDO                            (sdo_o)
);

endmodule
//=============================================================================
// lscc_pll.v
//=============================================================================
`endif