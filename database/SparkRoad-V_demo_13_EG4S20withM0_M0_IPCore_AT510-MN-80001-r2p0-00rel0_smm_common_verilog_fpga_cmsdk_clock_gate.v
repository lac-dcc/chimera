//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Behavioral model of clock gating cell
//-----------------------------------------------------------------------------

module cmsdk_clock_gate #(
  // ---------------------------------------------------------------------------
  // Parameters
  // ---------------------------------------------------------------------------
  parameter CLKGATE_PRESENT = 0)
 (
  // ---------------------------------------------------------------------------
  // Port Definitions
  // ---------------------------------------------------------------------------

  input  wire CLK,
  input  wire CLKENABLE,
  input  wire DISABLEG,

  output wire GATEDCLK);

  //----------------------------------------------------------------------------
  // Overview
  //----------------------------------------------------------------------------
  //
  // The mcu_clock_gate block is used to abstract the high level clock gating
  // function used for the primary clocks in the macrocell.
  //
  // A functional clock enable <CLKENABLE> is combined with
  // a scanenable/global disable signal to provide the gating term. This is
  // then latched prior to gating with the main clock CLK.
  //
  // A clock gating cell can be instantiated manually by removing the RTL
  // equivalent section and instantiating the appropriate cell.

  // ---------------------------------------------------------------------------
  // Signal Declarations
  // ---------------------------------------------------------------------------
  wire   i_clk;
  wire   clk_en;
  reg    clk_en_t2;
  wire   i_gated_clk;
  wire   mst_clk_en;
  wire   mst_disable;

  //----------------------------------------------------------------------------
  // Clock gate removal - do not alter this section
  //----------------------------------------------------------------------------
  assign GATEDCLK     = (CLKGATE_PRESENT != 0) ? i_gated_clk : 1'b0;
  assign mst_clk_en   = (CLKGATE_PRESENT != 0) ? CLKENABLE : 1'b0;
  assign mst_disable  = (CLKGATE_PRESENT != 0) ? DISABLEG  : 1'b0;
  assign i_clk        = (CLKGATE_PRESENT != 0) ? CLK       : 1'b0;

  //----------------------------------------------------------------------------
  // Beginning of main code
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // RTL equivalent - remove this section if you wish to use a real cell
  //----------------------------------------------------------------------------
  assign clk_en = mst_clk_en | mst_disable;

  always @(i_clk or clk_en)
    if (i_clk == 1'b0)
      clk_en_t2 <= clk_en;

  assign i_gated_clk = i_clk & clk_en_t2;

  //----------------------------------------------------------------------------
  // Instantiated clock gating cell - instantiate appropriate cell here if
  // replacing RTL equivalent section
  //----------------------------------------------------------------------------
  // For example:
  //  TLATNTSCAX12 ICGCell (.ECK (i_gated_clk), .E (mst_clk_en), .SE (mst_disable), .CK (iCLK));

endmodule
