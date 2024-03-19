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
//  /   /         Filename: ddr2_phy_dqs_iob.v
// /___/   /\     Date Last Modified: $Date: 2008/07/22 15:41:06 $
// \   \  /  \    Date Created: Wed Aug 16 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   This module places the data strobes in the IOBs.
//Reference:
//Revision History:
//*****************************************************************************

`timescale 1ns/1ps

module ddr2_phy_dqs_iob #
  (
   parameter DDR_TYPE              = 1,
   parameter HIGH_PERFORMANCE_MODE = "TRUE"
   )
  (
   input        clk0,
   input        clkdiv0,
   input        rst0,
   input        dlyinc_dqs,
   input        dlyce_dqs,
   input        dlyrst_dqs,
   input        dlyinc_gate,
   input        dlyce_gate,
   input        dlyrst_gate,
   input        dqs_oe_n,
   input        dqs_rst_n,
   input        en_dqs,
   inout        ddr_dqs,
   inout        ddr_dqs_n,
   output       dq_ce,
   output       delayed_dqs
   );

  wire                     clk180;
  wire                     dqs_bufio;

  wire                     dqs_ibuf;
  wire                     dqs_idelay;
  wire                     dqs_oe_n_delay;
  wire                     dqs_oe_n_r;
  wire                     dqs_rst_n_delay;
  reg                      dqs_rst_n_r /* synthesis syn_preserve = 1*/;
  wire                     dqs_out;
  wire                     en_dqs_sync /* synthesis syn_keep = 1 */;

  // for simulation only. Synthesis should ignore this delay
  localparam    DQS_NET_DELAY = 0.8;

  assign        clk180 = ~clk0;

  // add delta delay to inputs clocked by clk180 to avoid delta-delay
  // simulation issues
  assign dqs_rst_n_delay = dqs_rst_n;
  assign dqs_oe_n_delay  = dqs_oe_n;

  //***************************************************************************
  // DQS input-side resources:
  //  - IODELAY (pad -> IDELAY)
  //  - BUFIO (IDELAY -> BUFIO)
  //***************************************************************************

  // Route DQS from PAD to IDELAY
  IODELAY #
    (
     .DELAY_SRC("I"),
     .IDELAY_TYPE("VARIABLE"),
     .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
     .IDELAY_VALUE(0),
     .ODELAY_VALUE(0)
     )
    u_idelay_dqs
      (
       .DATAOUT (dqs_idelay),
       .C       (clkdiv0),
       .CE      (dlyce_dqs),
       .DATAIN  (),
       .IDATAIN (dqs_ibuf),
       .INC     (dlyinc_dqs),
       .ODATAIN (),
       .RST     (dlyrst_dqs),
       .T       ()
       );

  // From IDELAY to BUFIO
  BUFIO u_bufio_dqs
    (
     .I  (dqs_idelay),
     .O  (dqs_bufio)
     );

  // To model additional delay of DQS BUFIO + gating network
  // for behavioral simulation. Make sure to select a delay number smaller
  // than half clock cycle (otherwise output will not track input changes
  // because of inertial delay). Duplicate to avoid delta delay issues.
  assign #(DQS_NET_DELAY) i_delayed_dqs = dqs_bufio;
  assign #(DQS_NET_DELAY) delayed_dqs   = dqs_bufio;

  //***************************************************************************
  // DQS gate circuit (not supported for all controllers)
  //***************************************************************************

  // Gate routing:
  //   en_dqs -> IDELAY -> en_dqs_sync -> IDDR.S -> dq_ce ->
  //   capture IDDR.CE

  // Delay CE control so that it's in phase with delayed DQS
  IODELAY #
    (
     .DELAY_SRC             ("DATAIN"),
     .IDELAY_TYPE           ("VARIABLE"),
     .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
     .IDELAY_VALUE          (0),
     .ODELAY_VALUE          (0)
     )
    u_iodelay_dq_ce
      (
       .DATAOUT (en_dqs_sync),
       .C       (clkdiv0),
       .CE      (dlyce_gate),
       .DATAIN  (en_dqs),
       .IDATAIN (),
       .INC     (dlyinc_gate),
       .ODATAIN (),
       .RST     (dlyrst_gate),
       .T       ()
       );

  // Generate sync'ed CE to DQ IDDR's using an IDDR clocked by DQS
  // We could also instantiate a negative-edge SDR flop here
  IDDR #
    (
     .DDR_CLK_EDGE ("OPPOSITE_EDGE"),
     .INIT_Q1      (1'b0),
     .INIT_Q2      (1'b0),
     .SRTYPE       ("ASYNC")
     )
    u_iddr_dq_ce
      (
       .Q1 (),
       .Q2 (dq_ce),           // output on falling edge
       .C  (i_delayed_dqs),
       .CE (1'b1),
       .D  (en_dqs_sync),
       .R  (1'b0),
       .S  (en_dqs_sync)
       );

  //***************************************************************************
  // DQS output-side resources
  //***************************************************************************

  // synthesis attribute keep of dqs_rst_n_r is "true"
  always @(posedge clk180)
    dqs_rst_n_r <= dqs_rst_n_delay;

  ODDR #
    (
     .SRTYPE("SYNC"),
     .DDR_CLK_EDGE("OPPOSITE_EDGE")
     )
    u_oddr_dqs
      (
       .Q  (dqs_out),
       .C  (clk180),
       .CE (1'b1),
       .D1 (dqs_rst_n_r),      // keep output deasserted for write preamble
       .D2 (1'b0),
       .R  (1'b0),
       .S  (1'b0)
       );

  (* IOB = "TRUE" *) FDP u_tri_state_dqs
    (
     .D   (dqs_oe_n_delay),
     .Q   (dqs_oe_n_r),
     .C   (clk180),
     .PRE (rst0)
     ) /* synthesis syn_useioff = 1 */;

  //***************************************************************************

  // use either single-ended (for DDR1) or differential (for DDR2) DQS input

  generate
    if (DDR_TYPE > 0) begin: gen_dqs_iob_ddr2
      IOBUFDS u_iobuf_dqs
        (
         .O   (dqs_ibuf),
         .IO  (ddr_dqs),
         .IOB (ddr_dqs_n),
         .I   (dqs_out),
         .T   (dqs_oe_n_r)
         );
    end else begin: gen_dqs_iob_ddr1
      IOBUF u_iobuf_dqs
        (
         .O   (dqs_ibuf),
         .IO  (ddr_dqs),
         .I   (dqs_out),
         .T   (dqs_oe_n_r)
         );
    end
  endgenerate

endmodule
