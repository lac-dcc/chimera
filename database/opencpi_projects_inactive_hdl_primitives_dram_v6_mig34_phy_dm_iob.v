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
//  /   /         Filename: phy_dm_iob.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:33 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   This module places the data mask signals into the IOBs.
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_dm_iob.v,v 1.13 2010/02/26 08:58:33 pboya Exp $
**$Date: 2010/02/26 08:58:33 $
**$Author: pboya $
**$Revision: 1.13 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_dm_iob.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_dm_iob #
  (
   parameter TCQ          = 100,       // clk->out delay (sim only)
   parameter nCWL         = 5,         // CAS Write Latency
   parameter DRAM_TYPE    = "DDR3",    // Memory I/F type: "DDR3", "DDR2"
   parameter WRLVL        = "ON",      // "OFF" for "DDR3" component interface
   parameter REFCLK_FREQ  = 300.0,     // IODELAY Reference Clock freq (MHz)
   parameter IODELAY_HP_MODE = "ON",   // IODELAY High Performance Mode
   parameter IODELAY_GRP     = "IODELAY_MIG"  // May be assigned unique name
                                              // when mult IP cores in design
   )
  (
   input       clk_mem,
   input       clk,
   input       clk_rsync,
   input       rst,
   // IODELAY I/F
   input [4:0] dlyval,
   input       dm_ce,
   input       inv_dqs,
   input [1:0] wr_calib_dly,
   input       mask_data_rise0,
   input       mask_data_fall0,
   input       mask_data_rise1,
   input       mask_data_fall1,
   output      ddr_dm
   );

  // Set performance mode for IODELAY (power vs. performance tradeoff)
  localparam   HIGH_PERFORMANCE_MODE
               = (IODELAY_HP_MODE == "OFF") ? "FALSE" :
                 ((IODELAY_HP_MODE == "ON")  ? "TRUE" : "ILLEGAL");

  wire    dm_odelay;
  wire    dm_oq;
  reg     mask_data_fall0_r1;
  reg     mask_data_fall0_r2;
  reg     mask_data_fall0_r3;
  reg     mask_data_fall0_r4;
  reg     mask_data_fall1_r1;
  reg     mask_data_fall1_r2;
  reg     mask_data_fall1_r3;
  reg     mask_data_fall1_r4;
  reg     mask_data_rise0_r1;
  reg     mask_data_rise0_r2;
  reg     mask_data_rise0_r3;
  reg     mask_data_rise0_r4;
  reg     mask_data_rise1_r1;
  reg     mask_data_rise1_r2;
  reg     mask_data_rise1_r3;
  reg     mask_data_rise1_r4;
  reg     out_d1;
  reg     out_d2;
  reg     out_d3;
  reg     out_d4;

  //***************************************************************************
  // Data Mask Bitslip
  //***************************************************************************

  // dfi_wrdata_en0 - even clk cycles channel 0
  // dfi_wrdata_en1 - odd clk cycles channel 1
  // tphy_wrlat set to 0 clk cycle for CWL = 5,6,7,8
  // Valid dfi_wrdata* sent 1 clk cycle after dfi_wrdata_en* is asserted

  // mask_data_rise0 - first rising edge data mask (rise0)
  // mask_data_fall0 - first falling edge data mask (fall0)
  // mask_data_rise1 - second rising edge data mask (rise1)
  // mask_data_fall1 - second falling edge data mask (fall1)

  always @(posedge clk) begin
    if (DRAM_TYPE == "DDR3")begin
      mask_data_rise0_r1 <= #TCQ dm_ce & mask_data_rise0;
      mask_data_fall0_r1 <= #TCQ dm_ce & mask_data_fall0;
      mask_data_rise1_r1 <= #TCQ dm_ce & mask_data_rise1;
      mask_data_fall1_r1 <= #TCQ dm_ce & mask_data_fall1;
    end else begin
      mask_data_rise0_r1 <= #TCQ mask_data_rise0;
      mask_data_fall0_r1 <= #TCQ mask_data_fall0;
      mask_data_rise1_r1 <= #TCQ mask_data_rise1;
      mask_data_fall1_r1 <= #TCQ mask_data_fall1;
    end
    mask_data_rise0_r2 <= #TCQ mask_data_rise0_r1;
    mask_data_fall0_r2 <= #TCQ mask_data_fall0_r1;
    mask_data_rise1_r2 <= #TCQ mask_data_rise1_r1;
    mask_data_fall1_r2 <= #TCQ mask_data_fall1_r1;
    mask_data_rise0_r3 <= #TCQ mask_data_rise0_r2;
    mask_data_fall0_r3 <= #TCQ mask_data_fall0_r2;
    mask_data_rise1_r3 <= #TCQ mask_data_rise1_r2;
    mask_data_fall1_r3 <= #TCQ mask_data_fall1_r2;
    mask_data_rise0_r4 <= #TCQ mask_data_rise0_r3;
    mask_data_fall0_r4 <= #TCQ mask_data_fall0_r3;
    mask_data_rise1_r4 <= #TCQ mask_data_rise1_r3;
    mask_data_fall1_r4 <= #TCQ mask_data_fall1_r3;
  end

  // Different nCWL values: 5, 6, 7, 8, 9
  generate
    if (DRAM_TYPE == "DDR3")begin: gen_dm_ddr3_write_lat
      if ((nCWL == 5) | (nCWL == 7) | (nCWL == 9)) begin: gen_dm_ncwl5_odd
        always @(posedge clk) begin
          if (WRLVL == "OFF") begin
            out_d1 <= #TCQ mask_data_rise0_r1;
            out_d2 <= #TCQ mask_data_fall0_r1;
            out_d3 <= #TCQ mask_data_rise1_r1;
            out_d4 <= #TCQ mask_data_fall1_r1;
          end else begin
            // write command sent by MC on channel1
            // D3,D4 inputs of the OCB used to send write command to DDR3
            
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[1:0], inv_dqs})
              // 0 clk_mem delay required as per write calibration
              3'b000: begin
                out_d1 <= #TCQ mask_data_fall0_r1;
                out_d2 <= #TCQ mask_data_rise1_r1;
                out_d3 <= #TCQ mask_data_fall1_r1;
                out_d4 <= #TCQ mask_data_rise0;
              end
              // DQS inverted during write leveling
              3'b001: begin
                out_d1 <= #TCQ mask_data_rise0_r1;
                out_d2 <= #TCQ mask_data_fall0_r1;
                out_d3 <= #TCQ mask_data_rise1_r1;
                out_d4 <= #TCQ mask_data_fall1_r1;
              end
              // 1 clk_mem delay required as per write cal
              3'b010: begin
                out_d1 <= #TCQ mask_data_fall1_r2;
                out_d2 <= #TCQ mask_data_rise0_r1;
                out_d3 <= #TCQ mask_data_fall0_r1;
                out_d4 <= #TCQ mask_data_rise1_r1;
              end
              // DQS inverted during write leveling
              // 1 clk_mem delay required per write cal
              3'b011: begin
                out_d1 <= #TCQ mask_data_rise1_r2;
                out_d2 <= #TCQ mask_data_fall1_r2;
                out_d3 <= #TCQ mask_data_rise0_r1;
                out_d4 <= #TCQ mask_data_fall0_r1;
              end
              // 2 clk_mem delay required as per write cal
              3'b100: begin
                out_d1 <= #TCQ mask_data_fall0_r2;
                out_d2 <= #TCQ mask_data_rise1_r2;
                out_d3 <= #TCQ mask_data_fall1_r2;
                out_d4 <= #TCQ mask_data_rise0_r1;
              end
              // DQS inverted during write leveling
              // 2 clk_mem delay required as per write cal
              3'b101: begin
                out_d1 <= #TCQ mask_data_rise0_r2;
                out_d2 <= #TCQ mask_data_fall0_r2;
                out_d3 <= #TCQ mask_data_rise1_r2;
                out_d4 <= #TCQ mask_data_fall1_r2;
              end
              // 3 clk_mem delay required as per write cal
              3'b110: begin
                out_d1 <= #TCQ mask_data_fall1_r3;
                out_d2 <= #TCQ mask_data_rise0_r2;
                out_d3 <= #TCQ mask_data_fall0_r2;
                out_d4 <= #TCQ mask_data_rise1_r2;
              end
              // DQS inverted during write leveling
              // 3 clk_mem delay required as per write cal
              3'b111: begin
                out_d1 <= #TCQ mask_data_rise1_r3;
                out_d2 <= #TCQ mask_data_fall1_r3;
                out_d3 <= #TCQ mask_data_rise0_r2;
                out_d4 <= #TCQ mask_data_fall0_r2;
              end
              // defaults to 0 clk_mem delay
              default: begin
                out_d1 <= #TCQ mask_data_fall0_r1;
                out_d2 <= #TCQ mask_data_rise1_r1;
                out_d3 <= #TCQ mask_data_fall1_r1;
                out_d4 <= #TCQ mask_data_rise0;
              end
            endcase
          end
        end
      end else if ((nCWL == 6) | (nCWL == 8)) begin: gen_dm_ncwl_even
        always @(posedge clk) begin
          if (WRLVL == "OFF") begin
            out_d1 <= #TCQ mask_data_rise1_r2;
            out_d2 <= #TCQ mask_data_fall1_r2;
            out_d3 <= #TCQ mask_data_rise0_r1;
            out_d4 <= #TCQ mask_data_fall0_r1;
          end else begin
            // write command sent by MC on channel1
            // D3,D4 inputs of the OCB used to send write command to DDR3
            
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[1:0], inv_dqs})
              // 0 clk_mem delay required as per write calibration
              // could not test 0011 case
              3'b000: begin
                out_d1 <= #TCQ mask_data_fall1_r2;
                out_d2 <= #TCQ mask_data_rise0_r1;
                out_d3 <= #TCQ mask_data_fall0_r1;
                out_d4 <= #TCQ mask_data_rise1_r1;
              end
              // DQS inverted during write leveling
              3'b001: begin
                out_d1 <= #TCQ mask_data_rise1_r2;
                out_d2 <= #TCQ mask_data_fall1_r2;
                out_d3 <= #TCQ mask_data_rise0_r1;
                out_d4 <= #TCQ mask_data_fall0_r1;
              end
              // 1 clk_mem delay required as per write cal
              3'b010: begin
                out_d1 <= #TCQ mask_data_fall0_r2;
                out_d2 <= #TCQ mask_data_rise1_r2;
                out_d3 <= #TCQ mask_data_fall1_r2;
                out_d4 <= #TCQ mask_data_rise0_r1;
              end
              // DQS inverted during write leveling
              // 1 clk_mem delay required as per write cal
              3'b011: begin
                out_d1 <= #TCQ mask_data_rise0_r2;
                out_d2 <= #TCQ mask_data_fall0_r2;
                out_d3 <= #TCQ mask_data_rise1_r2;
                out_d4 <= #TCQ mask_data_fall1_r2;
              end
              // 2 clk_mem delay required as per write cal
              3'b100: begin
                out_d1 <= #TCQ mask_data_fall1_r3;
                out_d2 <= #TCQ mask_data_rise0_r2;
                out_d3 <= #TCQ mask_data_fall0_r2;
                out_d4 <= #TCQ mask_data_rise1_r2;
              end
              // DQS inverted during write leveling
              // 2 clk_mem delay required as per write cal
              3'b101: begin
                out_d1 <= #TCQ mask_data_rise1_r3;
                out_d2 <= #TCQ mask_data_fall1_r3;
                out_d3 <= #TCQ mask_data_rise0_r2;
                out_d4 <= #TCQ mask_data_fall0_r2;
              end
              // 3 clk_mem delay required as per write cal
              3'b110: begin
                out_d1 <= #TCQ mask_data_fall0_r3;
                out_d2 <= #TCQ mask_data_rise1_r3;
                out_d3 <= #TCQ mask_data_fall1_r3;
                out_d4 <= #TCQ mask_data_rise0_r2;
              end
              // DQS inverted during write leveling
              // 3 clk_mem delay required as per write cal
              3'b111: begin
                out_d1 <= #TCQ mask_data_rise0_r3;
                out_d2 <= #TCQ mask_data_fall0_r3;
                out_d3 <= #TCQ mask_data_rise1_r3;
                out_d4 <= #TCQ mask_data_fall1_r3;
              end
              // defaults to 0 clk_mem delay
              default: begin
                out_d1 <= #TCQ mask_data_fall1_r2;
                out_d2 <= #TCQ mask_data_rise0_r1;
                out_d3 <= #TCQ mask_data_fall0_r1;
                out_d4 <= #TCQ mask_data_rise1_r1;
              end
            endcase
          end
        end
      end
    end else if (DRAM_TYPE == "DDR2") begin: gen_dm_lat_ddr2
      if (nCWL == 2) begin: gen_ddr2_ncwl2
        always @(mask_data_rise1_r1 or mask_data_fall1_r1 or
                 mask_data_rise0 or mask_data_fall0) begin
          out_d1 =  mask_data_rise1_r1;
          out_d2 =  mask_data_fall1_r1;
          out_d3 =  mask_data_rise0;
          out_d4 =  mask_data_fall0;
        end
      end else if (nCWL == 3) begin: gen_ddr2_ncwl3
        always @(posedge clk) begin          
          out_d1 <= #TCQ mask_data_rise0;
          out_d2 <= #TCQ mask_data_fall0;
          out_d3 <= #TCQ mask_data_rise1;
          out_d4 <= #TCQ mask_data_fall1;
        end
      end else if (nCWL == 4) begin: gen_ddr2_ncwl4
        always @(posedge clk) begin
          out_d1 =  mask_data_rise1_r1;
          out_d2 =  mask_data_fall1_r1;
          out_d3 =  mask_data_rise0;
          out_d4 =  mask_data_fall0;
        end
      end else if (nCWL == 5) begin: gen_ddr2_ncwl5
        always @(posedge clk) begin
          out_d1 <= #TCQ mask_data_rise0_r1;
          out_d2 <= #TCQ mask_data_fall0_r1;
          out_d3 <= #TCQ mask_data_rise1_r1;
          out_d4 <= #TCQ mask_data_fall1_r1;
        end
      end else if (nCWL == 6) begin: gen_ddr2_ncwl6
        always @(posedge clk) begin
          out_d1 =  mask_data_rise1_r2;
          out_d2 =  mask_data_fall1_r2;
          out_d3 =  mask_data_rise0_r1;
          out_d4 =  mask_data_fall0_r1;
        end
     end
    end
  endgenerate

  //***************************************************************************

  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),
     .INIT_OQ        (1'b0),
     .INIT_TQ        (1'b0),
     .INTERFACE_TYPE ("DEFAULT"),
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
    u_oserdes_dm
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (dm_oq),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),       
       .CLKPERFDELAY (),
       .D1           (out_d1),
       .D2           (out_d2),
       .D3           (out_d3),
       .D4           (out_d4),
       .D5           (),
       .D6           (),
       .OCE          (1'b1),
       .ODV          (1'b0),
       .SHIFTIN1     (),
       .SHIFTIN2     (),
       .RST          (rst),
       .T1           (1'b0),
       .T2           (1'b0),
       .T3           (1'b0),
       .T4           (1'b0),
       .TFB          (),
       .TCE          (1'b1),
       .WC           (1'b0)       
       );

  // Output of OSERDES drives IODELAY (ODELAY)
  (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
    (
     .CINVCTRL_SEL          ("FALSE"),
     .DELAY_SRC             ("O"),
     .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
     .IDELAY_TYPE           ("FIXED"), 
     .IDELAY_VALUE          (0),       
     .ODELAY_TYPE           ("VAR_LOADABLE"),
     .ODELAY_VALUE          (0),
     .REFCLK_FREQUENCY      (REFCLK_FREQ),
     .SIGNAL_PATTERN        ("DATA")
     )
    u_odelay_dm
      (
       .DATAOUT     (dm_odelay),
       .C           (clk_rsync),
       .CE          (1'b0),
       .DATAIN      (),
       .IDATAIN     (),
       .INC         (1'b0),
       .ODATAIN     (dm_oq),
       .RST         (1'b1),
       .T           (),
       .CNTVALUEIN  (dlyval),
       .CNTVALUEOUT (),
       .CLKIN       (),
       .CINVCTRL    (1'b0)
       );

  // Output of ODELAY drives OBUF
  OBUF u_obuf_dm
    (
     .I (dm_odelay),
     .O (ddr_dm)
     );

endmodule
