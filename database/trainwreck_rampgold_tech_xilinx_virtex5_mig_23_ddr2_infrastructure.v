//*****************************************************************************
// DISCLAIMER OF LIABILITY
//
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you a
// license to use this text/file solely for design, simulation,
// implementation and creation of design files limited
// to Xilinx devices or technologies. Use with non-Xilinx
// devices or technologies is expressly prohibited and
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information
// "as-is" solely for use in developing programs and
// solutions for Xilinx devices, with no obligation on the
// part of Xilinx to provide support. By providing this design,
// code, or information as one possible implementation of
// this feature, application or standard, Xilinx is making no
// representation that this implementation is free from any
// claims of infringement. You are responsible for
// obtaining any rights you may require for your implementation.
// Xilinx expressly disclaims any warranty whatsoever with
// respect to the adequacy of the implementation, including
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied
// warranties of merchantability or fitness for a particular
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications is
// expressly prohibited.
//
// Any modifications that are made to the Source Code are
// done at the users sole risk and will be unsupported.
//
// Copyright (c) 2006-2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part
// of this text at all times.
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 2.3
//  \   \         Application: MIG
//  /   /         Filename: ddr2_infrastructure.v
// /___/   /\     Date Last Modified: $Date: 2008/07/29 15:24:03 $
// \   \  /  \    Date Created: Wed Aug 16 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   Clock generation/distribution and reset synchronization
//Reference:
//Revision History:
//   Rev 1.1 - Parameter CLK_TYPE added and logic for  DIFFERENTIAL and 
//             SINGLE_ENDED added. PK. 20/6/08
//*****************************************************************************

`timescale 1ns/1ps

module ddr2_infrastructure #
  (
   // Following parameters are for 72-bit RDIMM design (for ML561 Reference
   // board design). Actual values may be different. Actual parameters values
   // are passed from design top module ddr2_sdram module. Please refer to
   // the ddr2_sdram module for actual values.
   parameter CLK_PERIOD    = 3000,
   parameter CLK_TYPE      = "DIFFERENTIAL",
   parameter DLL_FREQ_MODE = "HIGH",
   parameter RST_ACT_LOW  = 1
   )
  (
   input  sys_clk_p,
   input  sys_clk_n,
   input  sys_clk,
   input  clk200_p,
   input  clk200_n,
   input  idly_clk_200,
   output clk0,
   output clk90,
   output clk200,
   output clkdiv0,
   input  sys_rst_n,
   input  idelay_ctrl_rdy,
   output rst0,
   output rst90,
   output rst200,
   output rstdiv0
   );

  // # of clock cycles to delay deassertion of reset. Needs to be a fairly
  // high number not so much for metastability protection, but to give time
  // for reset (i.e. stable clock cycles) to propagate through all state
  // machines and to all control signals (i.e. not all control signals have
  // resets, instead they rely on base state logic being reset, and the effect
  // of that reset propagating through the logic). Need this because we may not
  // be getting stable clock cycles while reset asserted (i.e. since reset
  // depends on DCM lock status)
  localparam RST_SYNC_NUM = 25;
  localparam CLK_PERIOD_NS = CLK_PERIOD / 1000.0;

  wire                       clk0_bufg;
  wire                       clk90_bufg;
  wire                       clk200_bufg;
  wire                       clk200_ibufg;
  wire                       clkdiv0_bufg;
  wire                       dcm_clk0;
  wire                       dcm_clk90;
  wire                       dcm_clkdiv0;
  wire                       dcm_lock;
  reg [RST_SYNC_NUM-1:0]     rst0_sync_r    /* synthesis syn_maxfan = 10 */;
  reg [RST_SYNC_NUM-1:0]     rst200_sync_r  /* synthesis syn_maxfan = 10 */;
  reg [RST_SYNC_NUM-1:0]     rst90_sync_r   /* synthesis syn_maxfan = 10 */;
  reg [(RST_SYNC_NUM/2)-1:0] rstdiv0_sync_r /* synthesis syn_maxfan = 10 */;
  wire                       rst_tmp;
  wire                       sys_clk_ibufg;
  wire                       sys_rst;

  assign sys_rst = RST_ACT_LOW ? ~sys_rst_n: sys_rst_n;

  assign clk0    = clk0_bufg;
  assign clk90   = clk90_bufg;
  assign clk200  = clk200_bufg;
  assign clkdiv0 = clkdiv0_bufg;

  generate
  if(CLK_TYPE == "DIFFERENTIAL") begin : DIFF_ENDED_CLKS_INST
    //***************************************************************************
    // Differential input clock input buffers
    //***************************************************************************

    IBUFGDS_LVPECL_25 SYS_CLK_INST
      (
       .I  (sys_clk_p),
       .IB (sys_clk_n),
       .O  (sys_clk_ibufg)
       );

    IBUFGDS_LVPECL_25 IDLY_CLK_INST
      (
       .I  (clk200_p),
       .IB (clk200_n),
       .O  (clk200_ibufg)
       );

  end else if(CLK_TYPE == "SINGLE_ENDED") begin : SINGLE_ENDED_CLKS_INST
    //**************************************************************************
    // Single ended input clock input buffers
    //**************************************************************************

    IBUFG SYS_CLK_INST
      (
       .I  (sys_clk),
       .O  (sys_clk_ibufg)
       );

    IBUFG IDLY_CLK_INST
      (
       .I  (idly_clk_200),
       .O  (clk200_ibufg)
       );

  end
  endgenerate

  BUFG CLK_200_BUFG
    (
     .O (clk200_bufg),
     .I (clk200_ibufg)
     );

  //***************************************************************************
  // Global clock generation and distribution
  //***************************************************************************

  DCM_BASE #
    (
     .CLKIN_PERIOD          (CLK_PERIOD_NS),
     .CLKDV_DIVIDE          (2.0),
     .DLL_FREQUENCY_MODE    (DLL_FREQ_MODE),
     .DUTY_CYCLE_CORRECTION ("TRUE"),
     .FACTORY_JF            (16'hF0F0)
     )
    u_dcm_base
      (
       .CLK0      (dcm_clk0),
       .CLK180    (),
       .CLK270    (),
       .CLK2X     (),
       .CLK2X180  (),
       .CLK90     (dcm_clk90),
       .CLKDV     (dcm_clkdiv0),
       .CLKFX     (),
       .CLKFX180  (),
       .LOCKED    (dcm_lock),
       .CLKFB     (clk0_bufg),
       .CLKIN     (sys_clk_ibufg),
       .RST       (sys_rst)
       );

  BUFG U_BUFG_CLK0
    (
     .O (clk0_bufg),
     .I (dcm_clk0)
     );

  BUFG U_BUFG_CLK90
    (
     .O (clk90_bufg),
     .I (dcm_clk90)
     );

   BUFG U_BUFG_CLKDIV0
    (
     .O (clkdiv0_bufg),
     .I (dcm_clkdiv0)
     );


  //***************************************************************************
  // Reset synchronization
  // NOTES:
  //   1. shut down the whole operation if the DCM hasn't yet locked (and by
  //      inference, this means that external SYS_RST_IN has been asserted -
  //      DCM deasserts DCM_LOCK as soon as SYS_RST_IN asserted)
  //   2. In the case of all resets except rst200, also assert reset if the
  //      IDELAY master controller is not yet ready
  //   3. asynchronously assert reset. This was we can assert reset even if
  //      there is no clock (needed for things like 3-stating output buffers).
  //      reset deassertion is synchronous.
  //***************************************************************************

  assign rst_tmp = sys_rst | ~dcm_lock | ~idelay_ctrl_rdy;

  // synthesis attribute max_fanout of rst0_sync_r is 10
  always @(posedge clk0_bufg or posedge rst_tmp)
    if (rst_tmp)
      rst0_sync_r <= {RST_SYNC_NUM{1'b1}};
    else
      // logical left shift by one (pads with 0)
      rst0_sync_r <= rst0_sync_r << 1;

  // synthesis attribute max_fanout of rstdiv0_sync_r is 10
  always @(posedge clkdiv0_bufg or posedge rst_tmp)
    if (rst_tmp)
      rstdiv0_sync_r <= {(RST_SYNC_NUM/2){1'b1}};
    else
      // logical left shift by one (pads with 0)
      rstdiv0_sync_r <= rstdiv0_sync_r << 1;

  // synthesis attribute max_fanout of rst90_sync_r is 10
  always @(posedge clk90_bufg or posedge rst_tmp)
    if (rst_tmp)
      rst90_sync_r <= {RST_SYNC_NUM{1'b1}};
    else
      rst90_sync_r <= rst90_sync_r << 1;

  // make sure CLK200 doesn't depend on IDELAY_CTRL_RDY, else chicken n' egg
   // synthesis attribute max_fanout of rst200_sync_r is 10
  always @(posedge clk200_bufg or negedge dcm_lock)
    if (!dcm_lock)
      rst200_sync_r <= {RST_SYNC_NUM{1'b1}};
    else
      rst200_sync_r <= rst200_sync_r << 1;


  assign rst0    = rst0_sync_r[RST_SYNC_NUM-1];
  assign rst90   = rst90_sync_r[RST_SYNC_NUM-1];
  assign rst200  = rst200_sync_r[RST_SYNC_NUM-1];
  assign rstdiv0 = rstdiv0_sync_r[(RST_SYNC_NUM/2)-1];

endmodule
