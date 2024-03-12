//*****************************************************************************
// (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 3.7
//  \   \         Application: MIG
//  /   /         Filename: infrastructure.v
// /___/   /\     Date Last Modified: $Date: 2010/10/29 15:22:39 $
// \   \  /  \    Date Created:Tue Jun 30 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   Clock generation/distribution and reset synchronization
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: infrastructure.v,v 1.2 2010/10/29 15:22:39 pboya Exp $
**$Date: 2010/10/29 15:22:39 $
**$Author: pboya $
**$Revision: 1.2 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/O/mig_v3_7/data/dlib/virtex6/ddr3_sdram/verilog/rtl/ip_top/infrastructure.v,v $
******************************************************************************/

`timescale 1ps/1ps


module infrastructure #
  (
   parameter TCQ                = 100,   // clk->out delay (sim only)
   parameter CLK_PERIOD         = 3000,  // Internal (fabric) clk period
   parameter nCK_PER_CLK        = 2,     // External (memory) clock period =
                                         // CLK_PERIOD/nCK_PER_CLK
   parameter INPUT_CLK_TYPE     = "DIFFERENTIAL", // input clock type
                                         // "DIFFERENTIAL","SINGLE_ENDED"
   parameter MMCM_ADV_BANDWIDTH = "OPTIMIZED", // MMCM programming algorithm
   parameter CLKFBOUT_MULT_F    = 2,     // write PLL VCO multiplier
   parameter DIVCLK_DIVIDE      = 1,     // write PLL VCO divisor
   parameter CLKOUT_DIVIDE      = 2,     // VCO output divisor for fast
                                         // (memory) clocks
   parameter RST_ACT_LOW        = 1
   )
  (
   // Clock inputs
   input  mmcm_clk,          // System clock diff input
   // System reset input
   input  sys_rst,            // core reset from user application
   // MMCM/IDELAYCTRL Lock status
   input  iodelay_ctrl_rdy,   // IDELAYCTRL lock status
   // Clock outputs
   output clk_mem,            // 2x logic clock
   output clk,                // 1x logic clock
   output clk_rd_base,        // 2x base read clock
   // Reset outputs
   output rstdiv0,            // Reset CLK and CLKDIV logic (incl I/O),
   // Phase Shift Interface
   input  PSEN,               // For enabling fine-phase shift
   input  PSINCDEC,           // = 1 increment phase shift, = 0
   output PSDONE
   );

  // # of clock cycles to delay deassertion of reset. Needs to be a fairly
  // high number not so much for metastability protection, but to give time
  // for reset (i.e. stable clock cycles) to propagate through all state
  // machines and to all control signals (i.e. not all control signals have
  // resets, instead they rely on base state logic being reset, and the effect
  // of that reset propagating through the logic). Need this because we may not
  // be getting stable clock cycles while reset asserted (i.e. since reset
  // depends on DCM lock status)
  // COMMENTED, RC, 01/13/09 - causes pack error in MAP w/ larger #
  localparam RST_SYNC_NUM = 15;
  //  localparam RST_SYNC_NUM = 25;
  // Round up for clk reset delay to ensure that CLKDIV reset deassertion
  // occurs at same time or after CLK reset deassertion (still need to
  // consider route delay - add one or two extra cycles to be sure!)
  localparam RST_DIV_SYNC_NUM = (RST_SYNC_NUM+1)/2;

  localparam real CLKIN1_PERIOD
             = (CLKFBOUT_MULT_F * CLK_PERIOD)/
             (DIVCLK_DIVIDE * CLKOUT_DIVIDE * nCK_PER_CLK * 1000.0);  // in ns

  localparam integer VCO_PERIOD
             = (DIVCLK_DIVIDE * CLK_PERIOD)/(CLKFBOUT_MULT_F * nCK_PER_CLK);

  localparam CLKOUT0_DIVIDE_F = CLKOUT_DIVIDE;
  localparam CLKOUT1_DIVIDE   = CLKOUT_DIVIDE * nCK_PER_CLK;
  localparam CLKOUT2_DIVIDE   = CLKOUT_DIVIDE;

  localparam CLKOUT0_PERIOD = VCO_PERIOD * CLKOUT0_DIVIDE_F;
  localparam CLKOUT1_PERIOD = VCO_PERIOD * CLKOUT1_DIVIDE;
  localparam CLKOUT2_PERIOD = VCO_PERIOD * CLKOUT2_DIVIDE;

  //synthesis translate_off
  initial begin
    $display("############# Write Clocks MMCM_ADV Parameters #############\n");
    $display("nCK_PER_CLK      = %7d",   nCK_PER_CLK     );
    $display("CLK_PERIOD       = %7d",   CLK_PERIOD      );
    $display("CLKIN1_PERIOD    = %7.3f", CLKIN1_PERIOD   );
    $display("DIVCLK_DIVIDE    = %7d",   DIVCLK_DIVIDE   );
    $display("CLKFBOUT_MULT_F  = %7d",   CLKFBOUT_MULT_F );
    $display("VCO_PERIOD       = %7d",   VCO_PERIOD      );
    $display("CLKOUT0_DIVIDE_F = %7d",   CLKOUT0_DIVIDE_F);
    $display("CLKOUT1_DIVIDE   = %7d",   CLKOUT1_DIVIDE  );
    $display("CLKOUT2_DIVIDE   = %7d",   CLKOUT2_DIVIDE  );
    $display("CLKOUT0_PERIOD   = %7d",   CLKOUT0_PERIOD  );
    $display("CLKOUT1_PERIOD   = %7d",   CLKOUT1_PERIOD  );
    $display("CLKOUT2_PERIOD   = %7d",   CLKOUT2_PERIOD  );
    $display("############################################################\n");
  end
  //synthesis translate_on

  wire                       clk_bufg;
  wire                       clk_mem_bufg;
  wire                       clk_mem_pll;
  wire                       clk_pll;
  wire                       clkfbout_pll;
  wire                       pll_lock
                             /* synthesis syn_maxfan = 10 */;
  reg [RST_DIV_SYNC_NUM-1:0] rstdiv0_sync_r
                             /* synthesis syn_maxfan = 10 */;
  wire                       rst_tmp;
  wire                       sys_rst_act_hi;

  assign sys_rst_act_hi = RST_ACT_LOW ? ~sys_rst: sys_rst;

  //***************************************************************************
  // Assign global clocks:
  //   1. clk_mem : Full rate (used only for IOB)
  //   2. clk     : Half rate (used for majority of internal logic)
  //***************************************************************************

  assign clk_mem = clk_mem_bufg;
  assign clk     = clk_bufg;

  //***************************************************************************
  // Global base clock generation and distribution
  //***************************************************************************

  //*****************************************************************
  // NOTES ON CALCULTING PROPER VCO FREQUENCY
  //  1. VCO frequency =
  //     1/((DIVCLK_DIVIDE * CLK_PERIOD)/(CLKFBOUT_MULT_F * nCK_PER_CLK))
  //  2. VCO frequency must be in the range [800MHz, 1.2MHz] for -1 part.
  //     The lower limit of 800MHz is greater than the lower supported
  //     frequency of 400MHz according to the datasheet because the MMCM
  //     jitter performance improves significantly when the VCO is operatin
  //     above 800MHz. For speed grades faster than -1, the max VCO frequency
  //     will be highe, and the multiply and divide factors can be adjusted
  //     according (in general to run the VCO as fast as possible).
  //*****************************************************************

  MMCM_ADV #
    (
     .BANDWIDTH             (MMCM_ADV_BANDWIDTH),
     .CLOCK_HOLD            ("FALSE"),
     .COMPENSATION          ("INTERNAL"),
     .REF_JITTER1           (0.005),
     .REF_JITTER2           (0.005),
     .STARTUP_WAIT          ("FALSE"),
     .CLKIN1_PERIOD         (CLKIN1_PERIOD),
     .CLKIN2_PERIOD         (10.000),
     .CLKFBOUT_MULT_F       (CLKFBOUT_MULT_F),
     .DIVCLK_DIVIDE         (DIVCLK_DIVIDE),
     .CLKFBOUT_PHASE        (0.000),
     .CLKFBOUT_USE_FINE_PS  ("FALSE"),
     .CLKOUT0_DIVIDE_F      (CLKOUT0_DIVIDE_F),
     .CLKOUT0_DUTY_CYCLE    (0.500),
     .CLKOUT0_PHASE         (0.000),
     .CLKOUT0_USE_FINE_PS   ("FALSE"),
     .CLKOUT1_DIVIDE        (CLKOUT1_DIVIDE),
     .CLKOUT1_DUTY_CYCLE    (0.500),
     .CLKOUT1_PHASE         (0.000),
     .CLKOUT1_USE_FINE_PS   ("FALSE"),
     .CLKOUT2_DIVIDE        (CLKOUT2_DIVIDE),
     .CLKOUT2_DUTY_CYCLE    (0.500),
     .CLKOUT2_PHASE         (0.000),
     .CLKOUT2_USE_FINE_PS   ("TRUE"),
     .CLKOUT3_DIVIDE        (1),
     .CLKOUT3_DUTY_CYCLE    (0.500),
     .CLKOUT3_PHASE         (0.000),
     .CLKOUT3_USE_FINE_PS   ("FALSE"),
     .CLKOUT4_CASCADE       ("FALSE"),
     .CLKOUT4_DIVIDE        (1),
     .CLKOUT4_DUTY_CYCLE    (0.500),
     .CLKOUT4_PHASE         (0.000),
     .CLKOUT4_USE_FINE_PS   ("FALSE"),
     .CLKOUT5_DIVIDE        (1),
     .CLKOUT5_DUTY_CYCLE    (0.500),
     .CLKOUT5_PHASE         (0.000),
     .CLKOUT5_USE_FINE_PS   ("FALSE"),
     .CLKOUT6_DIVIDE        (1),
     .CLKOUT6_DUTY_CYCLE    (0.500),
     .CLKOUT6_PHASE         (0.000),
     .CLKOUT6_USE_FINE_PS   ("FALSE")
     )
    u_mmcm_adv
      (
       .CLKFBOUT     (clkfbout_pll),
       .CLKFBOUTB    (),
       .CLKFBSTOPPED (),
       .CLKINSTOPPED (),
       .CLKOUT0      (clk_mem_pll),
       .CLKOUT0B     (),
       .CLKOUT1      (clk_pll),
       .CLKOUT1B     (),
       .CLKOUT2      (clk_rd_base),
       .CLKOUT2B     (),
       .CLKOUT3      (),
       .CLKOUT3B     (),
       .CLKOUT4      (),
       .CLKOUT5      (),
       .CLKOUT6      (),
       .DO           (),
       .DRDY         (),
       .LOCKED       (pll_lock),
       .PSDONE       (PSDONE),
       .CLKFBIN      (clkfbout_pll),
       .CLKIN1       (mmcm_clk),
       .CLKIN2       (1'b0),
       .CLKINSEL     (1'b1),
       .DADDR        (7'b0000000),
       .DCLK         (1'b0),
       .DEN          (1'b0),
       .DI           (16'h0000),
       .DWE          (1'b0),
       .PSCLK        (clk_bufg),
       .PSEN         (PSEN),
       .PSINCDEC     (PSINCDEC),
       .PWRDWN       (1'b0),
       .RST          (sys_rst_act_hi)
       );

  BUFG u_bufg_clk0
    (
     .O (clk_mem_bufg),
     .I (clk_mem_pll)
     );

  BUFG u_bufg_clkdiv0
    (
     .O (clk_bufg),
     .I (clk_pll)
     );

  //***************************************************************************
  // RESET SYNCHRONIZATION DESCRIPTION:
  //  Various resets are generated to ensure that:
  //   1. All resets are synchronously deasserted with respect to the clock
  //      domain they are interfacing to. There are several different clock
  //      domains - each one will receive a synchronized reset.
  //   2. The reset deassertion order starts with deassertion of SYS_RST,
  //      followed by deassertion of resets for various parts of the design
  //      (see "RESET ORDER" below) based on the lock status of MMCMs.
  // RESET ORDER:
  //   1. User deasserts SYS_RST
  //   2. Reset MMCM and IDELAYCTRL
  //   3. Wait for MMCM and IDELAYCTRL to lock
  //   4. Release reset for all I/O primitives and internal logic
  // OTHER NOTES:
  //   1. Asynchronously assert reset. This way we can assert reset even if
  //      there is no clock (needed for things like 3-stating output buffers
  //      to prevent initial bus contention). Reset deassertion is synchronous.
  //***************************************************************************

  //*****************************************************************
  // CLKDIV logic reset
  //*****************************************************************

  // Wait for MMCM and IDELAYCTRL to lock before releasing reset
  assign rst_tmp = sys_rst_act_hi | ~pll_lock | ~iodelay_ctrl_rdy;

  always @(posedge clk_bufg or posedge rst_tmp)
    if (rst_tmp)
      rstdiv0_sync_r <= #TCQ {RST_DIV_SYNC_NUM{1'b1}};
    else
      rstdiv0_sync_r <= #TCQ rstdiv0_sync_r << 1;

  assign rstdiv0 = rstdiv0_sync_r[RST_DIV_SYNC_NUM-1];

endmodule
