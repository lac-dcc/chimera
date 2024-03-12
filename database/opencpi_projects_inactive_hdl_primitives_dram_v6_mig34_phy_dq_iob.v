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
//  /   /         Filename: phy_dq_iob.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Instantiates I/O-related logic for DQ. Contains logic for both write
//  and read paths.
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_dq_iob.v,v 1.13 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.13 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_dq_iob.v,v $
******************************************************************************/

`timescale 1ps/1ps


module phy_dq_iob #
  (
   parameter TCQ              = 100,    // clk->out delay (sim only)
   parameter nCWL             = 5,      // Write CAS latency (in clk cyc)
   parameter DRAM_TYPE        = "DDR3", // Memory I/F type: "DDR3", "DDR2"
   parameter WRLVL            = "ON",   // "OFF" for "DDR3" component interface
   parameter REFCLK_FREQ      = 300.0,  // IODELAY Reference Clock freq (MHz)
   parameter IBUF_LPWR_MODE   = "OFF",  // Input buffer low power mode
   parameter IODELAY_HP_MODE  = "ON",   // IODELAY High Performance Mode
   parameter IODELAY_GRP      = "IODELAY_MIG"  // May be assigned unique name
                                               // when mult IP cores in design
   )
  (
   input        clk_mem,
   input        clk,
   input        rst,
   input        clk_cpt,
   input        clk_rsync,
   input        rst_rsync,
   // IODELAY I/F
   input [4:0]  dlyval,
   // Write datapath I/F
   input        inv_dqs,
   input [1:0]  wr_calib_dly,
   input [3:0]  dq_oe_n,
   input        wr_data_rise0,
   input        wr_data_fall0,
   input        wr_data_rise1,
   input        wr_data_fall1,
   // Read datapath I/F
   input [1:0]  rd_bitslip_cnt,
   input [1:0]  rd_clkdly_cnt,
   output       rd_data_rise0,
   output       rd_data_fall0,
   output       rd_data_rise1,
   output       rd_data_fall1,
   // DDR3 bus signals
   inout        ddr_dq,
   // Debug Port
   output [4:0] dq_tap_cnt    
   );

  // Set performance mode for IODELAY (power vs. performance tradeoff)
  localparam HIGH_PERFORMANCE_MODE
             = (IODELAY_HP_MODE == "OFF") ? "FALSE" :
             ((IODELAY_HP_MODE == "ON")  ? "TRUE" : "ILLEGAL");
  // Enable low power mode for input buffer
  localparam IBUF_LOW_PWR
             = (IBUF_LPWR_MODE == "OFF") ? "FALSE" :
             ((IBUF_LPWR_MODE == "ON")  ? "TRUE" : "ILLEGAL");
  
  wire       dq_in;
  wire       dq_iodelay;
  wire       dq_oe_n_r;
  wire       dq_oq;
  wire       iodelay_dout;
  wire       iserdes_clk;
  wire       iserdes_clkb;
  wire [5:0] iserdes_q;
  reg        ocb_d1;
  reg        ocb_d2;
  reg        ocb_d3;
  reg        ocb_d4;
  wire       ocb_tfb; // Must be connected to T input of IODELAY
                      // TFB turns IODELAY to ODELAY enabling
                      // CLKPERFDELAY required to lock out TQ
  wire [3:0] rddata;
  reg        tri_en1_r1;
  reg        tri_en2_r1;
  reg        tri_en3_r1;
  reg        tri_en4_r1;
  reg        wr_data_fall0_r1;
  reg        wr_data_fall0_r2;
  reg        wr_data_fall0_r3;
  reg        wr_data_fall0_r4;
  reg        wr_data_fall1_r1;
  reg        wr_data_fall1_r2;
  reg        wr_data_fall1_r3;
  reg        wr_data_fall1_r4;
  reg        wr_data_rise0_r1;
  reg        wr_data_rise0_r2;
  reg        wr_data_rise0_r3;
  reg        wr_data_rise0_r4;
  reg        wr_data_rise1_r1;
  reg        wr_data_rise1_r2;
  reg        wr_data_rise1_r3;
  reg        wr_data_rise1_r4;

  //***************************************************************************
  // Bidirectional I/O
  //***************************************************************************

  IOBUF #
    (
     .IBUF_LOW_PWR (IBUF_LOW_PWR)
     )
    u_iobuf_dq
      (
       .I  (dq_iodelay),       
       .T  (dq_oe_n_r),
       .IO (ddr_dq),
       .O  (dq_in)
       );

  //***************************************************************************
  // Programmable Delay element - used for both input and output paths
  //***************************************************************************

  (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
    (
     .CINVCTRL_SEL          ("FALSE"),
     .DELAY_SRC             ("IO"),
     .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
     .IDELAY_TYPE           ("VAR_LOADABLE"),
     .IDELAY_VALUE          (0),
     .ODELAY_TYPE           ("VAR_LOADABLE"),
     .ODELAY_VALUE          (0),
     .REFCLK_FREQUENCY      (REFCLK_FREQ),
     .SIGNAL_PATTERN        ("DATA")
     )
    u_iodelay_dq
      (
       .DATAOUT     (dq_iodelay),
       .C           (clk_rsync),
       .CE          (1'b0),
       .DATAIN      (),
       .IDATAIN     (dq_in),
       .INC         (1'b0),
       .ODATAIN     (dq_oq),
       .RST         (1'b1),
       .T           (ocb_tfb),
       .CNTVALUEIN  (dlyval),
       .CNTVALUEOUT (dq_tap_cnt),
       .CLKIN       (),
       .CINVCTRL    (1'b0)
       );

  //***************************************************************************
  // Write Path
  //***************************************************************************

  //*****************************************************************
  // Write Bitslip
  //*****************************************************************

  // dfi_wrdata_en0 - even clk cycles channel 0
  // dfi_wrdata_en1 - odd clk cycles channel 1
  // tphy_wrlat set to 0 clk cycle for CWL = 5,6,7,8
  // Valid dfi_wrdata* sent 1 clk cycle after dfi_wrdata_en* is asserted
  // WC for OCB (Output Circular Buffer) assertion for 1 clk cycle
  // WC aligned with dfi_wrdata_en*

  // first rising edge data (rise0)
  // first falling edge data (fall0)
  // second rising edge data (rise1)
  // second falling edge data (fall1)
  always @(posedge clk) begin
    wr_data_rise0_r1 <= #TCQ wr_data_rise0;
    wr_data_fall0_r1 <= #TCQ wr_data_fall0;
    wr_data_rise1_r1 <= #TCQ wr_data_rise1;
    wr_data_fall1_r1 <= #TCQ wr_data_fall1;
    wr_data_rise0_r2 <= #TCQ wr_data_rise0_r1;
    wr_data_fall0_r2 <= #TCQ wr_data_fall0_r1;
    wr_data_rise1_r2 <= #TCQ wr_data_rise1_r1;
    wr_data_fall1_r2 <= #TCQ wr_data_fall1_r1;
    wr_data_rise0_r3 <= #TCQ wr_data_rise0_r2;
    wr_data_fall0_r3 <= #TCQ wr_data_fall0_r2;
    wr_data_rise1_r3 <= #TCQ wr_data_rise1_r2;
    wr_data_fall1_r3 <= #TCQ wr_data_fall1_r2;
    wr_data_rise0_r4 <= #TCQ wr_data_rise0_r3;
    wr_data_fall0_r4 <= #TCQ wr_data_fall0_r3;
    wr_data_rise1_r4 <= #TCQ wr_data_rise1_r3;
    wr_data_fall1_r4 <= #TCQ wr_data_fall1_r3;
  end

  // Different nCWL values: 5, 6, 7, 8, 9
  generate
    if (DRAM_TYPE == "DDR3")begin: gen_ddr3_write_lat
      if ((nCWL == 5) | (nCWL == 7) | (nCWL == 9)) begin: gen_ncwl_odd
        always @(posedge clk) begin
          if (WRLVL == "OFF") begin
            ocb_d1 <= #TCQ wr_data_rise0_r1;
            ocb_d2 <= #TCQ wr_data_fall0_r1;
            ocb_d3 <= #TCQ wr_data_rise1_r1;
            ocb_d4 <= #TCQ wr_data_fall1_r1;
          end else begin
            // write command sent by MC on channel1
            // D3,D4 inputs of the OCB used to send write command to DDR3
            
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[1:0], inv_dqs})
              // 0 clk_mem delay required as per write calibration
              3'b000: begin
                ocb_d1 <= #TCQ wr_data_fall0_r1;
                ocb_d2 <= #TCQ wr_data_rise1_r1;
                ocb_d3 <= #TCQ wr_data_fall1_r1;
                ocb_d4 <= #TCQ wr_data_rise0;
              end
              // DQS inverted during write leveling
              3'b001: begin
                ocb_d1 <= #TCQ wr_data_rise0_r1;
                ocb_d2 <= #TCQ wr_data_fall0_r1;
                ocb_d3 <= #TCQ wr_data_rise1_r1;
                ocb_d4 <= #TCQ wr_data_fall1_r1;
              end
              // 1 clk_mem delay required as per write cal
              3'b010: begin
                ocb_d1 <= #TCQ wr_data_fall1_r2;
                ocb_d2 <= #TCQ wr_data_rise0_r1;
                ocb_d3 <= #TCQ wr_data_fall0_r1;
                ocb_d4 <= #TCQ wr_data_rise1_r1;
              end
              // DQS inverted during write leveling
              // 1 clk_mem delay required per write cal
              3'b011: begin
                ocb_d1 <= #TCQ wr_data_rise1_r2;
                ocb_d2 <= #TCQ wr_data_fall1_r2;
                ocb_d3 <= #TCQ wr_data_rise0_r1;
                ocb_d4 <= #TCQ wr_data_fall0_r1;
              end
              // 2 clk_mem delay required as per write cal
              3'b100: begin
                ocb_d1 <= #TCQ wr_data_fall0_r2;
                ocb_d2 <= #TCQ wr_data_rise1_r2;
                ocb_d3 <= #TCQ wr_data_fall1_r2;
                ocb_d4 <= #TCQ wr_data_rise0_r1;
              end
              // DQS inverted during write leveling
              // 2 clk_mem delay required as per write cal
              3'b101: begin
                ocb_d1 <= #TCQ wr_data_rise0_r2;
                ocb_d2 <= #TCQ wr_data_fall0_r2;
                ocb_d3 <= #TCQ wr_data_rise1_r2;
                ocb_d4 <= #TCQ wr_data_fall1_r2;
              end
              // 3 clk_mem delay required as per write cal
              3'b110: begin
                ocb_d1 <= #TCQ wr_data_fall1_r3;
                ocb_d2 <= #TCQ wr_data_rise0_r2;
                ocb_d3 <= #TCQ wr_data_fall0_r2;
                ocb_d4 <= #TCQ wr_data_rise1_r2;
              end
              // DQS inverted during write leveling
              // 3 clk_mem delay required as per write cal
              3'b111: begin
                ocb_d1 <= #TCQ wr_data_rise1_r3;
                ocb_d2 <= #TCQ wr_data_fall1_r3;
                ocb_d3 <= #TCQ wr_data_rise0_r2;
                ocb_d4 <= #TCQ wr_data_fall0_r2;
              end
              // defaults to 0 clk_mem delay
              default: begin
                ocb_d1 <= #TCQ wr_data_fall0_r1;
                ocb_d2 <= #TCQ wr_data_rise1_r1;
                ocb_d3 <= #TCQ wr_data_fall1_r1;
                ocb_d4 <= #TCQ wr_data_rise0;
              end
            endcase
          end
        end
      end else if ((nCWL == 6) | (nCWL == 8)) begin: gen_ncwl_even
        always @(posedge clk) begin
          if (WRLVL == "OFF") begin
            ocb_d1 <= #TCQ wr_data_rise1_r2;
            ocb_d2 <= #TCQ wr_data_fall1_r2;
            ocb_d3 <= #TCQ wr_data_rise0_r1;
            ocb_d4 <= #TCQ wr_data_fall0_r1;
          end else begin
            // write command sent by MC on channel1
            // D3,D4 inputs of the OCB used to send write command to DDR3
            
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[1:0], inv_dqs})
              // 0 clk_mem delay required as per write calibration
              // could not test 0011 case
              3'b000: begin
                ocb_d1 <= #TCQ wr_data_fall1_r2;
                ocb_d2 <= #TCQ wr_data_rise0_r1;
                ocb_d3 <= #TCQ wr_data_fall0_r1;
                ocb_d4 <= #TCQ wr_data_rise1_r1;
              end
              // DQS inverted during write leveling
              3'b001: begin
                ocb_d1 <= #TCQ wr_data_rise1_r2;
                ocb_d2 <= #TCQ wr_data_fall1_r2;
                ocb_d3 <= #TCQ wr_data_rise0_r1;
                ocb_d4 <= #TCQ wr_data_fall0_r1;
              end
              // 1 clk_mem delay required as per write cal
              3'b010: begin
                ocb_d1 <= #TCQ wr_data_fall0_r2;
                ocb_d2 <= #TCQ wr_data_rise1_r2;
                ocb_d3 <= #TCQ wr_data_fall1_r2;
                ocb_d4 <= #TCQ wr_data_rise0_r1;
              end
              // DQS inverted during write leveling
              // 1 clk_mem delay required as per write cal
              3'b011: begin
                ocb_d1 <= #TCQ wr_data_rise0_r2;
                ocb_d2 <= #TCQ wr_data_fall0_r2;
                ocb_d3 <= #TCQ wr_data_rise1_r2;
                ocb_d4 <= #TCQ wr_data_fall1_r2;
              end
              // 2 clk_mem delay required as per write cal
              3'b100: begin
                ocb_d1 <= #TCQ wr_data_fall1_r3;
                ocb_d2 <= #TCQ wr_data_rise0_r2;
                ocb_d3 <= #TCQ wr_data_fall0_r2;
                ocb_d4 <= #TCQ wr_data_rise1_r2;
              end
              // DQS inverted during write leveling
              // 2 clk_mem delay required as per write cal
              3'b101: begin
                ocb_d1 <= #TCQ wr_data_rise1_r3;
                ocb_d2 <= #TCQ wr_data_fall1_r3;
                ocb_d3 <= #TCQ wr_data_rise0_r2;
                ocb_d4 <= #TCQ wr_data_fall0_r2;
              end
              // 3 clk_mem delay required as per write cal
              3'b110: begin
                ocb_d1 <= #TCQ wr_data_fall0_r3;
                ocb_d2 <= #TCQ wr_data_rise1_r3;
                ocb_d3 <= #TCQ wr_data_fall1_r3;
                ocb_d4 <= #TCQ wr_data_rise0_r2;
              end
              // DQS inverted during write leveling
              // 3 clk_mem delay required as per write cal
              3'b111: begin
                ocb_d1 <= #TCQ wr_data_rise0_r3;
                ocb_d2 <= #TCQ wr_data_fall0_r3;
                ocb_d3 <= #TCQ wr_data_rise1_r3;
                ocb_d4 <= #TCQ wr_data_fall1_r3;
              end
              // defaults to 0 clk_mem delay
              default: begin
                ocb_d1 <= #TCQ wr_data_fall1_r2;
                ocb_d2 <= #TCQ wr_data_rise0_r1;
                ocb_d3 <= #TCQ wr_data_fall0_r1;
                ocb_d4 <= #TCQ wr_data_rise1_r1;
              end
            endcase
          end
        end
      end
    end else begin: ddr2_write_lat
      if (nCWL == 2) begin: gen_ddr2_ncwl2
        always @(wr_data_rise1_r1 or wr_data_fall1_r1 or
                 wr_data_rise0 or wr_data_fall0) begin
          ocb_d1 =  wr_data_rise1_r1;
          ocb_d2 =  wr_data_fall1_r1;
          ocb_d3 =  wr_data_rise0;
          ocb_d4 =  wr_data_fall0;
        end // always @ (posedge clk)
      end else if (nCWL == 3) begin: gen_ddr2_ncwl3
        always @(posedge clk) begin
          ocb_d1 <= #TCQ wr_data_rise0;
          ocb_d2 <= #TCQ wr_data_fall0;
          ocb_d3 <= #TCQ wr_data_rise1;
          ocb_d4 <= #TCQ wr_data_fall1;          
        end
      end else if (nCWL == 4) begin: gen_ddr2_ncwl4
        always @(posedge clk) begin
          ocb_d1 =  wr_data_rise1_r1;
          ocb_d2 =  wr_data_fall1_r1;
          ocb_d3 =  wr_data_rise0;
          ocb_d4 =  wr_data_fall0;
        end
      end else if (nCWL == 5) begin: gen_ddr2_ncwl5
        always @(posedge clk) begin
          ocb_d1 <= #TCQ wr_data_rise0_r1;
          ocb_d2 <= #TCQ wr_data_fall0_r1;
          ocb_d3 <= #TCQ wr_data_rise1_r1;
          ocb_d4 <= #TCQ wr_data_fall1_r1;   
        end
      end else if (nCWL == 6) begin: gen_ddr2_ncwl6
        always @(posedge clk) begin
          ocb_d1 =  wr_data_rise1_r2;
          ocb_d2 =  wr_data_fall1_r2;
          ocb_d3 =  wr_data_rise0_r1;
          ocb_d4 =  wr_data_fall0_r1;
        end
      end       
    end
  endgenerate

  //***************************************************************************
  // on a write, rising edge of DQS corresponds to rising edge of clk_mem
  // We also know:
  //  1. DQS driven 1/2 clk_mem cycle after corresponding DQ edge
  //  2. first rising DQS edge driven on falling edge of clk_mem
  //  3. DQ to be delayed 1/4 clk_mem cycle using ODELAY taps
  //  4. therefore, rising data driven on rising edge of clk_mem
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
    u_oserdes_dq
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (dq_oq),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (dq_oe_n_r),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),
       .CLKPERFDELAY (),
       .D1           (ocb_d1),
       .D2           (ocb_d2),
       .D3           (ocb_d3),
       .D4           (ocb_d4),
       .D5           (),
       .D6           (),
       .OCE          (1'b1),
       .ODV          (1'b0),
       .SHIFTIN1     (),
       .SHIFTIN2     (),
       .RST          (rst),
       .T1           (dq_oe_n[0]),
       .T2           (dq_oe_n[1]),
       .T3           (dq_oe_n[2]),
       .T4           (dq_oe_n[3]),
       .TFB          (ocb_tfb),
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
    u_iserdes_dq
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
       .DDLY         (dq_iodelay),
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
    .TCQ(TCQ)
  )
  u_rd_bitslip
    (
     .clk         (clk_rsync),
     .bitslip_cnt (rd_bitslip_cnt),
     .clkdly_cnt  (rd_clkdly_cnt),
     .din         (iserdes_q),
     .qout        (rddata)
     );

  assign  rd_data_rise0 = rddata[3];
  assign  rd_data_fall0 = rddata[2];
  assign  rd_data_rise1 = rddata[1];
  assign  rd_data_fall1 = rddata[0];

endmodule
