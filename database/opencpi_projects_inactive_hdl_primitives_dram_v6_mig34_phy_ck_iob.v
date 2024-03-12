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
//  /   /         Filename: phy_ck_iob.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:33 $
// \   \  /  \    Date Created: Aug 03 2009 
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   Clock forwarding to memory
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_ck_iob.v,v 1.4 2010/02/26 08:58:33 pboya Exp $
**$Date: 2010/02/26 08:58:33 $
**$Author: pboya $
**$Revision: 1.4 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_ck_iob.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_ck_iob #
  (
   parameter TCQ          = 100,       // clk->out delay (sim only)
   parameter WRLVL        = "OFF",     // Enable write leveling
   parameter DRAM_TYPE    = "DDR3",    // Memory I/F type: "DDR3", "DDR2"
   parameter REFCLK_FREQ  = 300.0,     // IODELAY Reference Clock freq (MHz)
   parameter IODELAY_GRP  = "IODELAY_MIG"  // May be assigned unique name
                                           // when mult IP cores in design
   )
  (
   input  clk_mem,       // full rate core clock
   input  clk,           // half rate core clock
   input  rst,           // half rate core clk reset
   output ddr_ck_p,      // forwarded diff. clock to memory
   output ddr_ck_n       // forwarded diff. clock to memory
   );

  wire      ck_p_odelay;
  wire      ck_p_oq;
  wire      ck_p_out;

  //*****************************************************************
  // Note on generation of Control/Address signals - there are
  // several possible configurations that affect the configuration
  // of the OSERDES and possible ODELAY for each output (this will
  // also affect the CK/CK# outputs as well
  //   1. DDR3, write-leveling: This is the simplest case. Use
  //      OSERDES without the ODELAY. Initially clock/control/address
  //      will be offset coming out of FPGA from DQ/DQS, but DQ/DQS
  //      will be adjusted so that DQS-CK alignment is established
  //   2. DDR2 or DDR3 (no write-leveling): Both DQS and DQ will use 
  //      ODELAY to delay output of OSERDES. To match this, 
  //      CK/control/address must also delay their outputs using ODELAY 
  //      (with delay = 0)
  //*****************************************************************

  OBUFDS u_obuf_ck
    (
     .O  (ddr_ck_p),
     .OB (ddr_ck_n),
     .I  (ck_p_out)
     );
       
  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("BUF"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),
     .INIT_OQ        (1'b0),
     .INIT_TQ        (1'b0),
     .INTERFACE_TYPE ("DEFAULT"),
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (1)
     )
    u_oserdes_ck_p
      (
       .OCBEXTEND           (),
       .OFB                 (),
       .OQ                  (ck_p_oq),
       .SHIFTOUT1           (),
       .SHIFTOUT2           (),
       .TQ                  (),
       .CLK                 (clk_mem),
       .CLKDIV              (clk),
       .CLKPERF             (),
       .CLKPERFDELAY        (),
       .D1                  (1'b0),
       .D2                  (1'b1),
       .D3                  (1'b0),
       .D4                  (1'b1),
       .D5                  (),
       .D6                  (),
       .ODV                 (1'b0),
       .OCE                 (1'b1),
       .RST                 (rst),
       // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
       // (for all other OSERDES used in design, these are no-connects):
       // ensures that CK/CK# outputs are not X at start of simulation
       // Certain DDR2 memory models may require that CK/CK# be valid
       // throughout simulation
       .SHIFTIN1            (1'b0),   
       .SHIFTIN2            (1'b0),
       .T1                  (1'b0),
       .T2                  (1'b0),
       .T3                  (1'b0),
       .T4                  (1'b0),
       .TFB                 (),
       .TCE                 (1'b1),
       .WC                  (1'b0)
       );

  generate
    if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_ck_wrlvl

      //*******************************************************
      // CASE1: DDR3, write-leveling
      //*******************************************************

      assign ck_p_out = ck_p_oq;

    end else begin: gen_ck_nowrlvl

      //*******************************************************
      // CASE2: No write leveling (DDR2 or DDR3)
      //*******************************************************      

      assign ck_p_out = ck_p_odelay;
      
      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE ("TRUE"),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("FIXED"),
         .ODELAY_VALUE          (0),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("CLOCK")
         )
        u_iodelay_ck_p
          (
           .DATAOUT     (ck_p_odelay),
           .C           (1'b0),
           .CE          (1'b0),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (1'b0),
           .ODATAIN     (ck_p_oq),
           .RST         (1'b0),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );
    end
  endgenerate

endmodule
