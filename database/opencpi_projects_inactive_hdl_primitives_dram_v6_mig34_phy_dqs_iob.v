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
// \   \   \/     Version: 3.4
//  \   \         Application: MIG
//  /   /         Filename: phy_dqs_iob.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created:Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Instantiates I/O-related logic for DQS. Contains logic for both write
//  and read (phase detection) paths.
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_dqs_iob.v,v 1.3 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.3 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_dqs_iob.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_dqs_iob #
  (
   parameter TCQ              = 100,    // clk->out delay (sim only)
   parameter DRAM_TYPE        = "DDR3", // Memory I/F type: "DDR3", "DDR2"
   parameter REFCLK_FREQ      = 300.0,  // IODELAY Reference Clock freq (MHz)
   parameter IBUF_LPWR_MODE   = "OFF",  // Input buffer low power mode
   parameter IODELAY_HP_MODE  = "ON",   // IODELAY High Performance Mode
   parameter IODELAY_GRP      = "IODELAY_MIG"  // May be assigned unique name
                                               // when mult IP cores in design
   )
  (
   input        clk_mem,      // memory-rate clock
   input        clk,          // internal (logic) clock
   input        clk_cpt,      // read capture clock
   input        clk_rsync,    // resynchronization (read) clock
   input        rst,          // reset sync'ed to CLK
   input        rst_rsync,    // reset sync'ed to RSYNC
   // IODELAY I/F
   input [4:0]  dlyval,       // IODELAY (DQS) parallel load value
   // Write datapath I/F
   input [3:0]  dqs_oe_n,     // DQS output enable
   input [3:0]  dqs_rst,      // D4 input of OSERDES: 1- for normal, 0- for WL
   // Read datapath I/F
   input [1:0]  rd_bitslip_cnt,
   input [1:0]  rd_clkdly_cnt,
   output       rd_dqs_rise0, // DQS captured in clk_cpt domain
   output       rd_dqs_fall0, // used by Phase Detector. Monitor DQS
   output       rd_dqs_rise1,
   output       rd_dqs_fall1,
   // DDR3 bus signals
   inout        ddr_dqs_p,
   inout        ddr_dqs_n,
   // Debug Port
   output [4:0] dqs_tap_cnt   
   );

  // Set performance mode for IODELAY (power vs. performance tradeoff)
  localparam HIGH_PERFORMANCE_MODE
             = (IODELAY_HP_MODE == "OFF") ? "FALSE" :
             ((IODELAY_HP_MODE == "ON")  ? "TRUE" : "ILLEGAL");
  // Enable low power mode for input buffer
  localparam IBUF_LOW_PWR
             = (IBUF_LPWR_MODE == "OFF") ? "FALSE" :
             ((IBUF_LPWR_MODE == "ON")  ? "TRUE" : "ILLEGAL");

  wire          dqs_ibuf_n;
  wire          dqs_ibuf_p;
  wire          dqs_n_iodelay;
  wire          dqs_n_tfb;
  wire          dqs_n_tq;
  wire          dqs_p_iodelay;
  wire          dqs_p_oq;
  wire          dqs_p_tfb;
  wire          dqs_p_tq;
  wire          iserdes_clk;
  wire          iserdes_clkb;
  wire [5:0]    iserdes_q;
  wire [3:0]    rddata;

  //***************************************************************************
  // Strobe Bidirectional I/O
  //***************************************************************************

  IOBUFDS_DIFF_OUT #
    (
     .IBUF_LOW_PWR (IBUF_LOW_PWR)    
     )       
    u_iobuf_dqs
      (
       .O   (dqs_ibuf_p),
       .OB  (dqs_ibuf_n),
       .IO  (ddr_dqs_p),
       .IOB (ddr_dqs_n),
       .I   (dqs_p_iodelay),
       .TM  (dqs_p_tq),
       .TS  (dqs_n_tq)
       );

  //***************************************************************************
  // Programmable Delay element - the "P"-side is used for both input and
  // output paths. The N-side is used for tri-state control of N-side I/O
  // buffer and can possibly be used as as an input (complement of P-side)
  // for the read phase detector
  //***************************************************************************
      
  (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
    (
     .CINVCTRL_SEL          ("FALSE"),
     .DELAY_SRC             ("IO"),
     .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
     .IDELAY_TYPE           ("VAR_LOADABLE"),
     .ODELAY_TYPE           ("VAR_LOADABLE"),
     .IDELAY_VALUE          (0),
     .ODELAY_VALUE          (0),
     .REFCLK_FREQUENCY      (REFCLK_FREQ)
     )
    u_iodelay_dqs_p
      (
       .DATAOUT     (dqs_p_iodelay),
       .C           (clk_rsync),
       .CE          (1'b0),
       .DATAIN      (),
       .IDATAIN     (dqs_ibuf_p),
       .INC         (1'b0),
       .ODATAIN     (dqs_p_oq),
       .RST         (1'b1),
       .T           (dqs_p_tfb),
       .CNTVALUEIN  (dlyval),
       .CNTVALUEOUT (dqs_tap_cnt),
       .CLKIN       (),
       .CINVCTRL    (1'b0)
       );
  
  //***************************************************************************
  // Write Path
  //***************************************************************************

  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),
     .INIT_OQ        (1'b0),
     .INIT_TQ        (1'b1),
     .INTERFACE_TYPE ("DEFAULT"),
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
    u_oserdes_dqs_p
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (dqs_p_oq),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (dqs_p_tq),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),
       .CLKPERFDELAY (),
       .D1           (dqs_rst[0]),
       .D2           (dqs_rst[1]),
       .D3           (dqs_rst[2]),
       .D4           (dqs_rst[3]),
       .D5           (),
       .D6           (),
       .OCE          (1'b1),
       .ODV          (1'b0),
       .SHIFTIN1     (),
       .SHIFTIN2     (),
       .RST          (rst),
       .T1           (dqs_oe_n[0]),
       .T2           (dqs_oe_n[1]),
       .T3           (dqs_oe_n[2]),
       .T4           (dqs_oe_n[3]),
       .TFB          (dqs_p_tfb),
       .TCE          (1'b1),
       .WC           (1'b0)
       );

  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),
     .INIT_OQ        (1'b1),
     .INIT_TQ        (1'b1),
     .INTERFACE_TYPE ("DEFAULT"),     
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
    u_oserdes_dqs_n
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (dqs_n_tq),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),
       .CLKPERFDELAY (),
       .D1           (1'b0), 
       .D2           (1'b0), 
       .D3           (1'b0), 
       .D4           (1'b0),
       .D5           (),
       .D6           (),
       .OCE          (1'b1),
       .ODV          (1'b0),
       .SHIFTIN1     (),
       .SHIFTIN2     (),
       .RST          (rst),
       .T1           (dqs_oe_n[0]),
       .T2           (dqs_oe_n[1]),
       .T3           (dqs_oe_n[2]),
       .T4           (dqs_oe_n[3]),
       .TFB          (dqs_n_tfb),
       .TCE          (1'b1),
       .WC           (1'b0)       
       );

  //***************************************************************************
  // Read Path
  //***************************************************************************

  // Assign equally to avoid delta-delay issues in simulation
  assign  iserdes_clk  =  clk_cpt;
  assign  iserdes_clkb = ~clk_cpt;

  ISERDESE1 #
    (
     .DATA_RATE         ("DDR"),
     .DATA_WIDTH        (4),
     .DYN_CLKDIV_INV_EN ("FALSE"),
     .DYN_CLK_INV_EN    ("FALSE"),
     .INIT_Q1           (1'b0),
     .INIT_Q2           (1'b0),
     .INIT_Q3           (1'b0),
     .INIT_Q4           (1'b0),
     .INTERFACE_TYPE    ("MEMORY_DDR3"),
     .NUM_CE            (2),
     .IOBDELAY          ("IFD"),
     .OFB_USED          ("FALSE"),
     .SERDES_MODE       ("MASTER"),
     .SRVAL_Q1          (1'b0),
     .SRVAL_Q2          (1'b0),
     .SRVAL_Q3          (1'b0),
     .SRVAL_Q4          (1'b0)
     )
    u_iserdes_dqs_p
      (
       .O            (),
       .Q1           (iserdes_q[0]),
       .Q2           (iserdes_q[1]),
       .Q3           (iserdes_q[2]),
       .Q4           (iserdes_q[3]),
       .Q5           (iserdes_q[4]),
       .Q6           (iserdes_q[5]),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .BITSLIP      (1'b0),
       .CE1          (1'b1),
       .CE2          (1'b1),
       .CLK          (iserdes_clk),
       .CLKB         (iserdes_clkb),
       .CLKDIV       (clk_rsync),
       .D            (),
       .DDLY         (dqs_p_iodelay),
       .DYNCLKDIVSEL (1'b0),
       .DYNCLKSEL    (1'b0),
       .OCLK         (clk_mem),    // Not used, but connect to avoid DRC
       .OFB          (1'b0),
       .RST          (rst_rsync),
       .SHIFTIN1     (1'b0),
       .SHIFTIN2     (1'b0)
       );

  //*****************************************************************
  // Read bitslip logic
  //*****************************************************************

  rd_bitslip #
    (
     .TCQ (TCQ)
     )
    u_rd_bitslip_early
      (
       .clk         (clk_rsync),
       .bitslip_cnt (rd_bitslip_cnt),
       .clkdly_cnt  (rd_clkdly_cnt),
       .din         (iserdes_q),
       .qout        (rddata)
       );

  assign  rd_dqs_rise0 = rddata[3];
  assign  rd_dqs_fall0 = rddata[2];
  assign  rd_dqs_rise1 = rddata[1];
  assign  rd_dqs_fall1 = rddata[0];

endmodule
