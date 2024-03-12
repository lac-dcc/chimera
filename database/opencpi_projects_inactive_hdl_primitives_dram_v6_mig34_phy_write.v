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
//  /   /         Filename: phy_write.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   Handles delaying various write control signals appropriately depending
//   on CAS latency, additive latency, etc. Also splits the data and mask in
//   rise and fall buses.
//Reference:
//Revision History:
// Revision 1.22 Karthip merged DDR2 changes 11/11/2008
//*****************************************************************************

/******************************************************************************
**$Id: phy_write.v,v 1.11 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.11 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_write.v,v $
******************************************************************************/

`timescale 1ps/1ps


module phy_write #
  (
   parameter TCQ              = 100,
   parameter WRLVL            = "ON",
   parameter DRAM_TYPE        = "DDR3",
   parameter DQ_WIDTH         = 64,
   parameter DQS_WIDTH        = 8,
   parameter nCWL             = 5,
   parameter REG_CTRL         = "OFF",
   parameter RANK_WIDTH       = 1,
   parameter CLKPERF_DLY_USED = "OFF"
   )
  (
   input                      clk,
   input                      rst,
   input                      mc_data_sel,
   // Write-leveling control
   input                      wrlvl_active,
   input                      wrlvl_done,
   input [DQS_WIDTH-1:0]      inv_dqs,
   input [2*DQS_WIDTH-1:0]    wr_calib_dly,
   // MC DFI Control/Address
   input [(4*DQ_WIDTH)-1:0]   dfi_wrdata,
   input [(4*DQ_WIDTH/8)-1:0] dfi_wrdata_mask,
   input                      dfi_wrdata_en,
   // MC sideband signal
   input                      mc_ioconfig_en, // Possible future use
   input [RANK_WIDTH:0]       mc_ioconfig,    // Possible future use
   // PHY DFI Control/Address
   input                      phy_wrdata_en,
   input [(4*DQ_WIDTH)-1:0]   phy_wrdata,
   //sideband signals
   input                      phy_ioconfig_en, // Possible future use
   input [0:0]                phy_ioconfig,    // Possible future use
   // Write-path control
   input                      out_oserdes_wc,
   output reg [DQS_WIDTH-1:0] dm_ce,
   output [4*DQS_WIDTH-1:0]   dq_oe_n,
   output [4*DQS_WIDTH-1:0]   dqs_oe_n,
   output reg [(DQS_WIDTH*4)-1:0] dqs_rst,
   output                     dq_wc,
   output                     dqs_wc,
   output [(DQ_WIDTH/8)-1:0]  mask_data_rise0,
   output [(DQ_WIDTH/8)-1:0]  mask_data_fall0,
   output [(DQ_WIDTH/8)-1:0]  mask_data_rise1,
   output [(DQ_WIDTH/8)-1:0]  mask_data_fall1,
   output reg                 wl_sm_start,
   output reg                 wr_lvl_start,
   output [DQ_WIDTH-1:0]      wr_data_rise0,
   output [DQ_WIDTH-1:0]      wr_data_fall0,
   output [DQ_WIDTH-1:0]      wr_data_rise1,
   output [DQ_WIDTH-1:0]      wr_data_fall1
   );

   localparam DQ_PER_DQS  = DQ_WIDTH/DQS_WIDTH;
   localparam RST_DLY_NUM = 8;


  reg [RST_DLY_NUM-1:0] rst_delayed;
  reg [DQS_WIDTH-1:0]   dm_ce_r;
  reg                   dq_wc_r;
  reg                   dqs_wc_r;
  reg                   dqs_wc_asrt;
  reg                   dqs_wc_deasrt;
  reg [DQS_WIDTH-1:0] 	dm_ce_0;
  reg [1:0]             dqs_asrt_cnt;
  reg [0:0]             mux_ioconfig_r;
  wire                  mux_wrdata_en;
  wire                  mux_ioconfig_en;
  wire [0:0]            mux_ioconfig; //bus to be expanded later
  wire[(4*DQ_WIDTH)-1:0]   mc_wrdata;
  wire[(4*DQ_WIDTH/8)-1:0] mc_wrdata_mask;
  reg [(4*DQ_WIDTH)-1:0]   phy_wrdata_r;
  reg [(4*DQ_WIDTH)-1:0]   dfi_wrdata_r;
  reg [(4*DQ_WIDTH/8)-1:0] dfi_wrdata_mask_r;
  reg [DQS_WIDTH-1:0] 	ocb_d1;
  reg [DQS_WIDTH-1:0] 	ocb_d2;
  reg [DQS_WIDTH-1:0] 	ocb_d3;
  reg [DQS_WIDTH-1:0] 	ocb_d4;
  reg [DQS_WIDTH-1:0] 	ocb_dq1;
  reg [DQS_WIDTH-1:0] 	ocb_dq2;
  reg [DQS_WIDTH-1:0] 	ocb_dq3;
  reg [DQS_WIDTH-1:0] 	ocb_dq4;
  reg                   wrdata_en_r1;
  reg                   wrdata_en_r2;
  reg                   wrdata_en_r3;
  reg                   wrdata_en_r4;
  reg                   wrdata_en_r5;
  reg                   wrdata_en_r6;
  reg                   wrdata_en_r7;
  reg                   wrlvl_active_r1;
  reg                   wrlvl_active_r2;
  reg                   wrlvl_done_r1;
  reg                   wrlvl_done_r2;
  reg                   wrlvl_done_r3;
  reg                   wr_level_dqs_asrt_r;
  reg [19:0]            wr_level_dqs_stg_r;
  reg                   mux_ioconfig_latch;
  reg                   mux_ioconfig_last_r;
  reg                   dfi_wrdata_en_r;
  reg                   phy_wrdata_en_r;




  //***************************************************************************
  // NOTE: As of 08/13/08, many signals in this module are not used. This is
  //  because of a last-minute change to the WC timing - it was based on
  //  IOCONFIG_STROBE, however IOCONFIG_STROBE will only occur when there is
  //  a change in either the bus direction, or rank accessed. It will not
  //  occur for succeeding writes to the same rank. Therefore, it cannot be
  //  used to drive WC (which must be pulsed once to "restart" the circular
  //  buffer once the bus has gone tri-state). For now, revert to using
  //  WRDATA_EN to determining when WC is pulsed.
  //***************************************************************************

  always @(posedge clk or posedge rst)
    if (rst)
      rst_delayed <= #TCQ{(RST_DLY_NUM){1'b1}};
    else
      // logical left shift by one (pads with 0)
      rst_delayed <= #TCQ rst_delayed << 1;


  //***************************************************************************
  // MUX control/data inputs from either external DFI master or PHY init
  //***************************************************************************
generate
if ((DRAM_TYPE == "DDR3") & (REG_CTRL == "ON")) begin: gen_wrdata_en_rdimm
  always @(posedge clk)begin
    phy_wrdata_r      <= #TCQ phy_wrdata;
    phy_wrdata_en_r   <= #TCQ phy_wrdata_en;
    dfi_wrdata_en_r   <= #TCQ dfi_wrdata_en;
    dfi_wrdata_r      <= #TCQ dfi_wrdata;
    dfi_wrdata_mask_r <= #TCQ dfi_wrdata_mask;
  end
  
  assign mux_wrdata_en = (~mc_data_sel && (nCWL == 9)) ? phy_wrdata_en_r :
                         (~mc_data_sel) ? phy_wrdata_en :
                         ((nCWL == 7) || (nCWL == 9)) ?
                         dfi_wrdata_en_r : dfi_wrdata_en;
end else begin: gen_wrdata_en_udimm
  assign mux_wrdata_en = (mc_data_sel) ? dfi_wrdata_en : phy_wrdata_en;
end
endgenerate


  assign mux_ioconfig_en = (mc_data_sel) ? mc_ioconfig_en : phy_ioconfig_en;
  assign mux_ioconfig    = (mc_data_sel) ? mc_ioconfig[RANK_WIDTH] : phy_ioconfig;

  //***************************************************************************
  // OCB WC pulse generation on a per byte basis
  //***************************************************************************

   // Store value of MUX_IOCONFIG when enable(latch) signal asserted
  always @(posedge clk)
    if (mux_ioconfig_en)
      mux_ioconfig_last_r <= #TCQ mux_ioconfig;

  // dfi_wrdata_en - data enable sent by MC
  // ignoring dfi_wrdata_en1: data sent on both channels 0 and 1 simultaneously
  // tphy_wrlat set to 0 'clk' cycle for CWL = 5,6,7,8
  // Valid dfi_wrdata* sent 1 'clk' cycle after dfi_wrdata_en* is asserted
  // WC for OCB (Output Circular Buffer) assertion for 1 clk cycle
  always @(mux_ioconfig_en or mux_ioconfig_last_r or mux_ioconfig) begin
    if (mux_ioconfig_en)
      mux_ioconfig_latch = mux_ioconfig;
    else
      mux_ioconfig_latch = mux_ioconfig_last_r;
  end


  always @(posedge clk) begin
    if (rst)
      wl_sm_start        <= #TCQ 1'b0;
    else
      wl_sm_start        <= #TCQ wr_level_dqs_asrt_r;
  end


  always @(posedge clk) begin
    if (rst | (mux_ioconfig_en & ~mux_ioconfig))
      mux_ioconfig_r     <= #TCQ 1'b0;
    else
      mux_ioconfig_r     <= #TCQ mux_ioconfig_latch;
  end


  always @(posedge clk)begin
    wrdata_en_r1      <= #TCQ mux_wrdata_en;
    wrdata_en_r2      <= #TCQ wrdata_en_r1;
    wrdata_en_r3      <= #TCQ wrdata_en_r2;
    wrdata_en_r4      <= #TCQ wrdata_en_r3;
    wrdata_en_r5      <= #TCQ wrdata_en_r4;
    wrdata_en_r6      <= #TCQ wrdata_en_r5;
    wrdata_en_r7      <= #TCQ wrdata_en_r6;
  end

  // One WC signal for all data bits
  // Combinatorial for CWL=5 and registered for CWL>5

  generate
  if((DRAM_TYPE == "DDR3") & (CLKPERF_DLY_USED == "ON"))begin: gen_wc_ddr3
    if (nCWL == 5) begin: gen_wc_ncwl5
      always @ (posedge clk)
        if (rst | (mux_ioconfig_en & ~mux_ioconfig) | wrlvl_active) begin
          dq_wc_r     <= #TCQ 1'b0;
        end else if (mux_ioconfig_latch) begin
          dq_wc_r     <= #TCQ ~dq_wc_r;
        end

      always @ (posedge clk)
        if (rst | (mux_ioconfig_en & ~mux_ioconfig & ~wrlvl_active_r1) | dqs_wc_deasrt) begin
          dqs_wc_r     <= #TCQ 1'b0;
        end else if (dqs_wc_asrt) begin
          dqs_wc_r     <= #TCQ 1'b1;
        end else if (mux_ioconfig_latch & ~wrlvl_active_r1) begin
          dqs_wc_r     <= #TCQ ~dqs_wc_r;
        end
    end else if ((nCWL == 7) | (nCWL == 6) | (nCWL == 8) | (nCWL == 9)) begin: gen_wc_ncwl7up
      always @ (posedge clk)
        if (rst | (mux_ioconfig_en & ~mux_ioconfig) | wrlvl_active) begin
          dq_wc_r     <= #TCQ 1'b0;
        end else if (mux_ioconfig_r) begin
          dq_wc_r     <= #TCQ ~dq_wc_r;
        end

      always @ (posedge clk)
        if (rst | (mux_ioconfig_en & ~mux_ioconfig & ~wrlvl_active_r1) | dqs_wc_deasrt) begin
          dqs_wc_r     <= #TCQ 1'b0;
        end else if (dqs_wc_asrt) begin
          dqs_wc_r     <= #TCQ 1'b1;
        end else if (mux_ioconfig_r & ~wrlvl_active_r1) begin
          dqs_wc_r     <= #TCQ ~dqs_wc_r;
        end
    end
  end else begin: gen_wc_ddr2
    always @ (out_oserdes_wc) begin
      dq_wc_r  = out_oserdes_wc;
      dqs_wc_r = out_oserdes_wc;
    end
  end
  endgenerate


// DQ_WC is pulsed with rising edge of MUX_WRDATA_EN
  assign dq_wc  = dq_wc_r;

  // DQS_WC has the same timing, except there is an additional term for
  // write leveling
  assign dqs_wc = dqs_wc_r;


  //***************************************************************************
  // DQS/DQ Output Enable Bitslip
  // Timing for output enable:
  //  - Enable for DQS: For burst of 8 (over 4 clock cycles), OE is asserted
  //    one cycle before first valid data (i.e. at same time as DQS write
  //    preamble), and deasserted immediately after the last postamble
  //***************************************************************************

  genvar dqs_i;
  generate
   if(DRAM_TYPE == "DDR3")begin: gen_ddr3_dqs_ocb
    if ((nCWL == 5) & (CLKPERF_DLY_USED == "ON")) begin: gen_ncwl5_odd
      // write command sent by MC on channel 1
      // D3,D4 inputs of the OCB used to send write command to DDR3
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_odd_loop
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1] | wrlvl_active_r1) begin
            ocb_d1[dqs_i]   <= #TCQ 1'b0;
            ocb_d2[dqs_i]   <= #TCQ 1'b0;
            ocb_d3[dqs_i]   <= #TCQ 1'b0;
            ocb_d4[dqs_i]   <= #TCQ 1'b0;
            ocb_dq1[dqs_i]  <= #TCQ 1'b1;
            ocb_dq2[dqs_i]  <= #TCQ 1'b1;
            ocb_dq3[dqs_i]  <= #TCQ 1'b1;
            ocb_dq4[dqs_i]  <= #TCQ 1'b1;
            dm_ce_0[dqs_i]  <= #TCQ 1'b0;
          end else begin
            dm_ce_0[dqs_i] <= #TCQ (mux_wrdata_en | wrdata_en_r1 |
                                     wrdata_en_r2);
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[2*dqs_i+1:2*dqs_i], inv_dqs[dqs_i]})
              // 0 clk_mem delay required as per write calibration
              3'b000: begin
                  ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	          ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	          ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	          ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	          ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	      end
	      // 1 clk_mem delay required as per write calibration
	      3'b010: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	      end
	      // 2 clk_mem delay required as per write calibration
	      3'b100: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	      end
	      // 3 clk_mem delay required as per write calibration
	      3'b110: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	      end
	      // 0 clk_mem delay required as per write calibration
              // DQS inverted during write leveling
	      3'b001: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
                ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
	      end
	      // 1 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b011: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					  wrdata_en_r3);
	      end
	      // 2 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b101: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	      end
	      // 3 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b111: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					 wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					 wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4);
	      end
	      // defaults to 0 clk_mem delay and no DQS inversion
	      default: begin
	          ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	          ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	          ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	          ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	          ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3);
	      end
            endcase
          end
        end
      end
    end else if (((nCWL == 5) | (nCWL == 7) | (nCWL == 9))
                 &(CLKPERF_DLY_USED == "OFF")) begin: gen_ncwl5_noWC
      // Extending tri-state signal at the end when CLKPERF_DELAYED is not used
      // In this use case the data path goes through the ODELAY whereas the 
      // tri-state path does not. Hence tri-state must be extended to
      // compensate for the ODELAY insertion delay and number of taps.
      // Tri-state signal is asserted for eight and a half clk_mem cycles.
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_odd_loop
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1] | wrlvl_active_r1) begin
            ocb_d1[dqs_i]   <= #TCQ 1'b0;
            ocb_d2[dqs_i]   <= #TCQ 1'b0;
            ocb_d3[dqs_i]   <= #TCQ 1'b0;
            ocb_d4[dqs_i]   <= #TCQ 1'b0;
            ocb_dq1[dqs_i]  <= #TCQ 1'b1;
            ocb_dq2[dqs_i]  <= #TCQ 1'b1;
            ocb_dq3[dqs_i]  <= #TCQ 1'b1;
            ocb_dq4[dqs_i]  <= #TCQ 1'b1;
            dm_ce_0[dqs_i]  <= #TCQ 1'b0;
          end else begin
            dm_ce_0[dqs_i] <= #TCQ (mux_wrdata_en | wrdata_en_r1 |
                                     wrdata_en_r2);
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[2*dqs_i+1:2*dqs_i], inv_dqs[dqs_i]})
              // 0 clk_mem delay required as per write calibration
              3'b000: begin
                  ocb_d1[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                   wrdata_en_r2 | wrdata_en_r3);
	          ocb_d2[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                   wrdata_en_r2 | wrdata_en_r3);
	          ocb_d3[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                   wrdata_en_r2 | wrdata_en_r3);
	          ocb_d4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                   wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq1[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                    wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq2[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                    wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq3[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                    wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                    wrdata_en_r2 | wrdata_en_r3);
	      end
	      // 1 clk_mem delay required as per write calibration
	      3'b010: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 2 clk_mem delay required as per write calibration
	      3'b100: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 3 clk_mem delay required as per write calibration
	      3'b110: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	      end
	      // 0 clk_mem delay required as per write calibration
              // DQS inverted during write leveling
	      3'b001: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
					 wrdata_en_r2 | wrdata_en_r3);
                ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
					 wrdata_en_r2 | wrdata_en_r3);
	      end
	      // 1 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b011: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 2 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b101: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
					 wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 3 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b111: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					 wrdata_en_r4 | wrdata_en_r5);
	      end
	      // defaults to 0 clk_mem delay and no DQS inversion
	      default: begin
	          ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                   wrdata_en_r3 | wrdata_en_r4);
	          ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                   wrdata_en_r3 | wrdata_en_r4);
	          ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                   wrdata_en_r3 | wrdata_en_r4);
	          ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                   wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3 | wrdata_en_r4);
	      end
            endcase
          end
        end
      end
    end else if (((nCWL == 7) | (nCWL == 9)) & (CLKPERF_DLY_USED == "ON")) begin: gen_ncwl7_odd
      // write command sent by MC on channel 1
      // D3,D4 inputs of the OCB used to send write command to DDR3
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_odd_loop
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1] | wrlvl_active_r1) begin
            ocb_d1[dqs_i]   <= #TCQ 1'b0;
            ocb_d2[dqs_i]   <= #TCQ 1'b0;
            ocb_d3[dqs_i]   <= #TCQ 1'b0;
            ocb_d4[dqs_i]   <= #TCQ 1'b0;
            ocb_dq1[dqs_i]  <= #TCQ 1'b1;
            ocb_dq2[dqs_i]  <= #TCQ 1'b1;
            ocb_dq3[dqs_i]  <= #TCQ 1'b1;
            ocb_dq4[dqs_i]  <= #TCQ 1'b1;
            dm_ce_0[dqs_i]  <= #TCQ 1'b0;
          end else begin
            dm_ce_0[dqs_i] <= #TCQ (mux_wrdata_en | wrdata_en_r1 |
                                     wrdata_en_r2);
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[2*dqs_i+1:2*dqs_i], inv_dqs[dqs_i]})
              // 0 clk_mem delay required as per write calibration
              3'b000: begin
                  ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                    wrdata_en_r5);
	          ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	          ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                    wrdata_en_r5);
	          ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	      end
	      // 1 clk_mem delay required as per write calibration
	      3'b010: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 2 clk_mem delay required as per write calibration
	      3'b100: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	      end
	      // 3 clk_mem delay required as per write calibration
	      3'b110: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	      end
	      // 0 clk_mem delay required as per write calibration
              // DQS inverted during write leveling
	      3'b001: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
                ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	      end
	      // 1 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b011: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
					  wrdata_en_r4);
	      end
	      // 2 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b101: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5);
	      end
	      // 3 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b111: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					 wrdata_en_r5);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5 |
	                                 wrdata_en_r6);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					 wrdata_en_r5);
	      end
	      // defaults to 0 clk_mem delay and no DQS inversion
	      default: begin
	          ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                    wrdata_en_r5);
	          ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	          ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                    wrdata_en_r5);
	          ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	          ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                    wrdata_en_r4);
	      end
            endcase
          end
        end
      end
    /*end else if ((nCWL == 9) & (CLKPERF_DLY_USED == "OFF")) begin: gen_ncwl9_noWC
      // Extending tri-state signal at the end when CLKPERF_DELAYED is not used
      // In this use case the data path goes through the ODELAY whereas the 
      // tri-state path does not. Hence tri-state must be extended to
      // compensate for the ODELAY insertion delay and number of taps.
      // Tri-state signal is asserted for eight and a half clk_mem cycles.
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_odd_loop
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1] | wrlvl_active_r1) begin
            ocb_d1[dqs_i]   <= #TCQ 1'b0;
            ocb_d2[dqs_i]   <= #TCQ 1'b0;
            ocb_d3[dqs_i]   <= #TCQ 1'b0;
            ocb_d4[dqs_i]   <= #TCQ 1'b0;
            ocb_dq1[dqs_i]  <= #TCQ 1'b1;
            ocb_dq2[dqs_i]  <= #TCQ 1'b1;
            ocb_dq3[dqs_i]  <= #TCQ 1'b1;
            ocb_dq4[dqs_i]  <= #TCQ 1'b1;
            dm_ce_0[dqs_i]  <= #TCQ 1'b0;
          end else begin
            dm_ce_0[dqs_i] <= #TCQ (mux_wrdata_en | wrdata_en_r1 |
                                     wrdata_en_r2);
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            // Write calibration currently supports only upto 2 clk_mem cycles
            case ({wr_calib_dly[2*dqs_i+1:2*dqs_i], inv_dqs[dqs_i]})
              // 0 clk_mem delay required as per write calibration
              3'b000: begin
                ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 1 clk_mem delay required as per write calibration
	      3'b010: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	      end
	      // 2 clk_mem delay required as per write calibration
	      3'b100: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	      end
	      // 3 clk_mem delay required as per write calibration
	      3'b110: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5 | wrdata_en_r6);
	      end
	      // 0 clk_mem delay required as per write calibration
              // DQS inverted during write leveling
	      3'b001: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 1 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b011: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3 | wrdata_en_r4);
	      end
	      // 2 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b101: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	      end
	      // 3 clk_mem delay required as per write calibration
	      // DQS inverted during write leveling
	      3'b111: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
		ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
					  wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4 | wrdata_en_r5);
	      end
	      // defaults to 0 clk_mem delay and no DQS inversion
	      default: begin
	          ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                   wrdata_en_r3 | wrdata_en_r4);
	          ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                   wrdata_en_r3 | wrdata_en_r4);
	          ocb_d3[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                   wrdata_en_r2 | wrdata_en_r3);
	          ocb_d4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                   wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                    wrdata_en_r3 | wrdata_en_r4);
	          ocb_dq3[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                    wrdata_en_r2 | wrdata_en_r3);
	          ocb_dq4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                    wrdata_en_r2 | wrdata_en_r3);
	      end
            endcase
          end
        end
      end*/
    end else if (((nCWL == 6) | (nCWL == 8))&(CLKPERF_DLY_USED == "ON")) begin: gen_ncwl_even
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_even_loop
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1] | wrlvl_active_r1) begin
            ocb_d1[dqs_i]   <= #TCQ 1'b0;
            ocb_d2[dqs_i]   <= #TCQ 1'b0;
            ocb_d3[dqs_i]   <= #TCQ 1'b0;
            ocb_d4[dqs_i]   <= #TCQ 1'b0;
            ocb_dq1[dqs_i]  <= #TCQ 1'b1;
            ocb_dq2[dqs_i]  <= #TCQ 1'b1;
            ocb_dq3[dqs_i]  <= #TCQ 1'b1;
            ocb_dq4[dqs_i]  <= #TCQ 1'b1;
            dm_ce_0[dqs_i]  <= #TCQ 1'b0;
          end else begin
            dm_ce_0[dqs_i] <= #TCQ (mux_wrdata_en | wrdata_en_r1 |
                                     wrdata_en_r2);
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            case ({wr_calib_dly[2*dqs_i+1:2*dqs_i], inv_dqs[dqs_i]})
              3'b000: begin
                  ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
                                           wrdata_en_r4);
                  ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                  ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                  ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                  ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
                                           wrdata_en_r4);
                  ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                  ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                  ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	      end
	      3'b010: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	      end
	      3'b100: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                  wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	      end
	      3'b110: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	      end
	      // DQS inverted during write leveling
	      3'b001: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                  wrdata_en_r3);
	      end
	      3'b011: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	      end
	      3'b101: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                  wrdata_en_r4);
	      end
	      3'b111: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4);
	      end
	      default: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
                                          wrdata_en_r4);
                ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
                                          wrdata_en_r4);
                ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
                ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3);
	      end
            endcase
          end
        end
      end // block: gen_ncwl_even
   end else if (((nCWL == 6) | (nCWL == 8))&(CLKPERF_DLY_USED == "OFF")) begin: gen_ncwl_noWC
      // Extending tri-state signal at the end when CLKPERF_DELAYED is not used
      // In this use case the data path goes through the ODELAY whereas the 
      // tri-state path does not. Hence tri-state must be extended to
      // compensate for the ODELAY insertion delay and number of taps.
      // Tri-state signal is asserted for eight and a half clk_mem cycles.
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_even_loop
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1] | wrlvl_active_r1) begin
            ocb_d1[dqs_i]   <= #TCQ 1'b0;
            ocb_d2[dqs_i]   <= #TCQ 1'b0;
            ocb_d3[dqs_i]   <= #TCQ 1'b0;
            ocb_d4[dqs_i]   <= #TCQ 1'b0;
            ocb_dq1[dqs_i]  <= #TCQ 1'b1;
            ocb_dq2[dqs_i]  <= #TCQ 1'b1;
            ocb_dq3[dqs_i]  <= #TCQ 1'b1;
            ocb_dq4[dqs_i]  <= #TCQ 1'b1;
            dm_ce_0[dqs_i]  <= #TCQ 1'b0;
          end else begin
            dm_ce_0[dqs_i] <= #TCQ (mux_wrdata_en | wrdata_en_r1 |
                                     wrdata_en_r2);
            // Shift bitslip logic by 1 or 2 clk_mem cycles
            case ({wr_calib_dly[2*dqs_i+1:2*dqs_i], inv_dqs[dqs_i]})
              3'b000: begin
                  ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
	      end
	      3'b010: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	      end
	      3'b100: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	      end
	      3'b110: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	      end
	      // DQS inverted during write leveling
	      3'b001: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                 wrdata_en_r2 | wrdata_en_r3);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(mux_wrdata_en | wrdata_en_r1 |
	                                 wrdata_en_r2 | wrdata_en_r3);
	      end
	      3'b011: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 | 
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	      end
	      3'b101: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
	                                 wrdata_en_r3 | wrdata_en_r4);
	      end
	      3'b111: begin
	        ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r3 | wrdata_en_r4 |
	                                 wrdata_en_r5 | wrdata_en_r6);
	        ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	        ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r2 | wrdata_en_r3 |
	                                 wrdata_en_r4 | wrdata_en_r5);
	      end
	      default: begin
	          ocb_d1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_d2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_d3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_d4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq1[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq2[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq3[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
                  ocb_dq4[dqs_i]  <= #TCQ ~(wrdata_en_r1 | wrdata_en_r2 |
                                           wrdata_en_r3 | wrdata_en_r4);
	      end
            endcase
          end
        end
      end // block: gen_ncwl_noWC
    end 
   end else begin: gen_ddr2_dqs_wc // block: gen_ddr3_dqs_ocb
      if ((nCWL == 2) ) begin: gen_ncwl_even
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_2
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1]) begin
            ocb_d1[dqs_i]  <= #TCQ 1'b0;
            ocb_d2[dqs_i]  <= #TCQ 1'b0;
            ocb_d3[dqs_i]  <= #TCQ 1'b0;
            ocb_d4[dqs_i]  <= #TCQ 1'b0;
            dm_ce_0[dqs_i] <= #TCQ 1'b0;
          end else begin
            ocb_d1[dqs_i]  <= #TCQ  ~(wrdata_en_r1 );
            ocb_d2[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | mux_wrdata_en);
            ocb_d3[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | mux_wrdata_en);
            ocb_d4[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | mux_wrdata_en);
            dm_ce_0[dqs_i] <= #TCQ (wrdata_en_r1 | wrdata_en_r2 |
                                     mux_wrdata_en);
          end
        end
      end
    end else if ((nCWL == 3)) begin: gen_ncwl_3
      // write command sent by MC on channel 1
      // D3,D4 inputs of the OCB used to send write command to DDR3
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_3
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1]) begin
            ocb_d1[dqs_i]  <= #TCQ 1'b0;
            ocb_d2[dqs_i]  <= #TCQ 1'b0;
            ocb_d3[dqs_i]  <= #TCQ 1'b0;
            ocb_d4[dqs_i]  <= #TCQ 1'b0;
            dm_ce_0[dqs_i] <= #TCQ 1'b0;
          end else begin
            ocb_d1[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            ocb_d2[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            ocb_d3[dqs_i]  <= #TCQ  ~(wrdata_en_r1);
            ocb_d4[dqs_i]  <= #TCQ  ~(mux_wrdata_en | wrdata_en_r1);
            dm_ce_0[dqs_i] <= #TCQ (wrdata_en_r1 | wrdata_en_r2 |
                                     wrdata_en_r3);
          end
        end
     end // block: ncwl_odd_loop
   end else if ((nCWL == 4) ) begin: gen_ncwl_4
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_4
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1]) begin
            ocb_d1[dqs_i]  <= #TCQ 1'b0;
            ocb_d2[dqs_i]  <= #TCQ 1'b0;
            ocb_d3[dqs_i]  <= #TCQ 1'b0;
            ocb_d4[dqs_i]  <= #TCQ 1'b0;
            dm_ce_0[dqs_i] <= #TCQ 1'b0;
          end else begin
            ocb_d1[dqs_i]  <= #TCQ  ~(wrdata_en_r2);
            ocb_d2[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            ocb_d3[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            ocb_d4[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            dm_ce_0[dqs_i] <= #TCQ (wrdata_en_r1 | wrdata_en_r2 |
                                     wrdata_en_r3);
          end
        end
      end
    end else if (nCWL == 5) begin: gen_ncwl_5
      // write command sent by MC on channel 1
      // D3,D4 inputs of the OCB used to send write command to DDR3
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_5
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1]) begin
            ocb_d1[dqs_i]  <= #TCQ 1'b0;
            ocb_d2[dqs_i]  <= #TCQ 1'b0;
            ocb_d3[dqs_i]  <= #TCQ 1'b0;
            ocb_d4[dqs_i]  <= #TCQ 1'b0;
            dm_ce_0[dqs_i] <= #TCQ 1'b0;
          end else begin
            ocb_d1[dqs_i]  <= #TCQ  ~(wrdata_en_r2 | wrdata_en_r3);
            ocb_d2[dqs_i]  <= #TCQ  ~(wrdata_en_r2 | wrdata_en_r3);
            ocb_d3[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            ocb_d4[dqs_i]  <= #TCQ  ~(wrdata_en_r1 | wrdata_en_r2);
            dm_ce_0[dqs_i] <= #TCQ (wrdata_en_r1 | wrdata_en_r2 |
                                     wrdata_en_r3);
          end
        end
      end       
    end else if ((nCWL == 6) ) begin: gen_ncwl_6
      for(dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i +1) begin: ncwl_6
        always @ (posedge clk) begin
          if (rst_delayed[RST_DLY_NUM-1]) begin
            ocb_d1[dqs_i]  <= #TCQ 1'b0;
            ocb_d2[dqs_i]  <= #TCQ 1'b0;
            ocb_d3[dqs_i]  <= #TCQ 1'b0;
            ocb_d4[dqs_i]  <= #TCQ 1'b0;
            dm_ce_0[dqs_i] <= #TCQ 1'b0;
          end else begin
            ocb_d1[dqs_i]  <= #TCQ  ~(wrdata_en_r2 | wrdata_en_r3);
            ocb_d2[dqs_i]  <= #TCQ  ~(wrdata_en_r2 | wrdata_en_r3);
            ocb_d3[dqs_i]  <= #TCQ  ~(wrdata_en_r2 | wrdata_en_r3);
            ocb_d4[dqs_i]  <= #TCQ  ~(wrdata_en_r2 | wrdata_en_r3);
            dm_ce_0[dqs_i] <= #TCQ (wrdata_en_r1 | wrdata_en_r2 |
                                     wrdata_en_r3);
          end
        end
      end
    end       
   end // block: gen_ddr2_dqs_wc
  endgenerate


  always @(posedge clk) begin
    wrlvl_active_r1 <= #TCQ wrlvl_active;
    wrlvl_active_r2 <= #TCQ wrlvl_active_r1;
    wrlvl_done_r1   <= #TCQ wrlvl_done;
    wrlvl_done_r2   <= #TCQ wrlvl_done_r1;
    wrlvl_done_r3   <= #TCQ wrlvl_done_r2;
  end

  // Staging dm_ce based on CWL.
  // For lower CWL in DDR2 FF stages are removed to
  // send the DM out on correct time.
  generate
    if(DRAM_TYPE  == "DDR3")begin: DDR3_DM
      always @(dm_ce_0) begin
        dm_ce = dm_ce_0;
      end
    end else if (DRAM_TYPE  == "DDR2")begin: DDR2_DM
       if(nCWL >= 5) begin
          always @(posedge clk) begin
             dm_ce_r <= #TCQ dm_ce_0;
             dm_ce <= #TCQ dm_ce_r;
          end
       end else if ((nCWL == 4)|| (nCWL == 3))begin
          always @(posedge clk) begin
             dm_ce <= #TCQ dm_ce_0;
          end
       end else if (nCWL == 2)begin
          always @(dm_ce_0) begin
             dm_ce = dm_ce_0;
          end
       end
    end
 endgenerate


  // NOTE: Restructure/retime later to improve timing
  genvar dqs_cnt_i;
  generate
    if(DRAM_TYPE  == "DDR3")begin: DDR3_TRISTATE
      for(dqs_cnt_i = 0; dqs_cnt_i < DQS_WIDTH; dqs_cnt_i = dqs_cnt_i +1) begin: gen_oe
        assign dqs_oe_n[(dqs_cnt_i*4) + 0] = ocb_d1[dqs_cnt_i];
        assign dqs_oe_n[(dqs_cnt_i*4) + 1] = ocb_d2[dqs_cnt_i];
        assign dqs_oe_n[(dqs_cnt_i*4) + 2] = ocb_d3[dqs_cnt_i];
        assign dqs_oe_n[(dqs_cnt_i*4) + 3] = ocb_d4[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 0]  = ocb_dq1[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 1]  = ocb_dq2[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 2]  = ocb_dq3[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 3]  = ocb_dq4[dqs_cnt_i];
      end
    end else if (DRAM_TYPE  == "DDR2")begin: DDR2_TRISTATE
      for(dqs_cnt_i = 0; dqs_cnt_i < DQS_WIDTH; dqs_cnt_i = dqs_cnt_i +1) begin: gen_oe
        assign dqs_oe_n[(dqs_cnt_i*4) + 0] = ocb_d1[dqs_cnt_i];
        assign dqs_oe_n[(dqs_cnt_i*4) + 1] = ocb_d2[dqs_cnt_i];
        assign dqs_oe_n[(dqs_cnt_i*4) + 2] = ocb_d3[dqs_cnt_i];
        assign dqs_oe_n[(dqs_cnt_i*4) + 3] = ocb_d4[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 0]  = ocb_d1[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 1]  = ocb_d2[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 2]  = ocb_d3[dqs_cnt_i];
        assign dq_oe_n[(dqs_cnt_i*4) + 3]  = ocb_d4[dqs_cnt_i];
      end
    end
  endgenerate

// signal used to assert DQS for write leveling.
// the DQS will be asserted once every 16 clock cycles.

  always @(posedge clk)begin
     if(rst) begin
       wr_level_dqs_asrt_r <= #TCQ 1'd0;
       dqs_wc_asrt         <= #TCQ 1'd0;
       dqs_wc_deasrt       <= #TCQ 1'd0;
     end else begin
       wr_level_dqs_asrt_r <= #TCQ (wr_level_dqs_stg_r[19]
				     & wrlvl_active_r1);
       dqs_wc_asrt         <= #TCQ (wr_level_dqs_stg_r[15]
				     & wrlvl_active_r1);
       dqs_wc_deasrt       <= #TCQ (wr_level_dqs_stg_r[16]
				     & wrlvl_active_r1);
     end
  end

  always @ (posedge clk) begin
     if (rst)
       dqs_asrt_cnt <= #TCQ 2'd0;
     else if (wr_level_dqs_asrt_r && dqs_asrt_cnt != 2'd3)
       dqs_asrt_cnt <= #TCQ (dqs_asrt_cnt + 1);
  end

  always @ (posedge clk) begin
     if (rst || ~wrlvl_active)
       wr_lvl_start <= #TCQ 1'd0;
     else if (dqs_asrt_cnt == 2'd3)
       wr_lvl_start <= #TCQ 1'd1;
  end

// shift register that is used to assert the DQS once every
// 16 clock cycles during write leveling.
  always @(posedge clk) begin
     if(rst)
       wr_level_dqs_stg_r <= #TCQ 20'b1000_0000_0000_0000_0000;
     else
       wr_level_dqs_stg_r <=#TCQ {wr_level_dqs_stg_r[18:0], wr_level_dqs_stg_r[19]};
  end


  genvar dqs_r_i;
  generate
   for (dqs_r_i = 0; dqs_r_i < DQS_WIDTH; dqs_r_i = dqs_r_i +1) begin: gen_dqs_r_i
      if(DRAM_TYPE == "DDR3")begin: gen_ddr3_dqs
        always @ (posedge clk) begin
          if (rst) begin
            dqs_rst[(dqs_r_i*4)+0] <= #TCQ 1'b0;
            dqs_rst[(dqs_r_i*4)+1] <= #TCQ 1'b0;
            dqs_rst[(dqs_r_i*4)+2] <= #TCQ 1'b0;
            dqs_rst[(dqs_r_i*4)+3] <= #TCQ 1'b0;
          end else if (inv_dqs[dqs_r_i]) begin
            dqs_rst[(dqs_r_i*4)+0] <= #TCQ ((wr_level_dqs_stg_r[19] & wrlvl_active_r1)
                                         | ~wrlvl_active_r1);
            dqs_rst[(dqs_r_i*4)+1] <= #TCQ 1'b0;
            dqs_rst[(dqs_r_i*4)+2] <= #TCQ ((wr_level_dqs_stg_r[19] & wrlvl_active_r1)
                                         | ~wrlvl_active_r1);
            dqs_rst[(dqs_r_i*4)+3] <= #TCQ 1'b0;
          end else if (~inv_dqs[dqs_r_i]) begin
            dqs_rst[(dqs_r_i*4)+0] <= #TCQ 1'b0;
            dqs_rst[(dqs_r_i*4)+1] <= #TCQ ((wr_level_dqs_stg_r[19] & wrlvl_active_r1)
                                         | ~wrlvl_active_r1);
            dqs_rst[(dqs_r_i*4)+2] <= #TCQ 1'b0;
            dqs_rst[(dqs_r_i*4)+3] <= #TCQ ((wr_level_dqs_stg_r[19] & wrlvl_active_r1)
                                           | ~wrlvl_active_r1);
          end
        end
      end else begin: gen_ddr2_dqs
         always @ (wr_level_dqs_asrt_r or wrlvl_active_r2) begin
           dqs_rst[(dqs_r_i*4)+0] =  1'b0;
           dqs_rst[(dqs_r_i*4)+1] =  (wr_level_dqs_asrt_r | ~wrlvl_active_r2);
           dqs_rst[(dqs_r_i*4)+2] =  1'b0;
           dqs_rst[(dqs_r_i*4)+3] =  ~wrlvl_active_r2;
         end
      end
    end
   endgenerate





  //***************************************************************************
  // Format write data/mask: Data is in format: {fall, rise}
  //***************************************************************************

generate
if ((DRAM_TYPE == "DDR3") & (REG_CTRL == "ON")) begin: gen_wrdata_mask_rdimm
  assign wr_data_rise0 = (~mc_data_sel && (nCWL == 9)) ? 
                         phy_wrdata_r[DQ_WIDTH-1:0] :
                         (~mc_data_sel) ? phy_wrdata[DQ_WIDTH-1:0] :
                         ((nCWL == 7) || (nCWL == 9)) ?
                         dfi_wrdata_r[DQ_WIDTH-1:0]: 
                         dfi_wrdata[DQ_WIDTH-1:0];
  assign wr_data_fall0 = (~mc_data_sel && (nCWL == 9)) ?
                         phy_wrdata_r[(2*DQ_WIDTH)-1:DQ_WIDTH] :
                         (~mc_data_sel) ? phy_wrdata[(2*DQ_WIDTH)-1:DQ_WIDTH] :
                         ((nCWL == 7) || (nCWL == 9)) ?
                         dfi_wrdata_r[(2*DQ_WIDTH)-1:DQ_WIDTH] :
                         dfi_wrdata[(2*DQ_WIDTH)-1:DQ_WIDTH];
  assign wr_data_rise1 = (~mc_data_sel && (nCWL == 9)) ?
                         phy_wrdata_r[(3*DQ_WIDTH)-1:2*DQ_WIDTH] :
                         (~mc_data_sel) ? 
                         phy_wrdata[(3*DQ_WIDTH)-1:2*DQ_WIDTH] :
                         ((nCWL == 7) || (nCWL == 9)) ?
                         dfi_wrdata_r[(3*DQ_WIDTH)-1:2*DQ_WIDTH] :
                         dfi_wrdata[(3*DQ_WIDTH)-1:2*DQ_WIDTH];
  assign wr_data_fall1 = (~mc_data_sel && (nCWL == 9)) ?
                         phy_wrdata_r[(4*DQ_WIDTH)-1:3*DQ_WIDTH] :
                         (~mc_data_sel) ?
                         phy_wrdata[(4*DQ_WIDTH)-1:3*DQ_WIDTH] :
                         ((nCWL == 7) || (nCWL == 9)) ?
                         dfi_wrdata_r[(4*DQ_WIDTH)-1:3*DQ_WIDTH] :
                         dfi_wrdata[(4*DQ_WIDTH)-1:3*DQ_WIDTH];

  assign mask_data_rise0 = (~mc_data_sel) ? 'b0 :
                           ((REG_CTRL == "ON") && ((nCWL == 7)||(nCWL == 9))) ?
                           dfi_wrdata_mask_r[(DQ_WIDTH/8)-1:0] :
                           dfi_wrdata_mask[(DQ_WIDTH/8)-1:0];
  assign mask_data_fall0 = (~mc_data_sel) ? 'b0 :
                           ((REG_CTRL == "ON") && ((nCWL == 7)||(nCWL == 9))) ?
                           dfi_wrdata_mask_r[2*(DQ_WIDTH/8)-1:(DQ_WIDTH/8)] :
                           dfi_wrdata_mask[2*(DQ_WIDTH/8)-1:(DQ_WIDTH/8)];
  assign mask_data_rise1 = (~mc_data_sel) ? 'b0 :
                           ((REG_CTRL == "ON") && ((nCWL == 7)||(nCWL == 9))) ?
                           dfi_wrdata_mask_r[3*(DQ_WIDTH/8)-1:2*(DQ_WIDTH/8)] :
                           dfi_wrdata_mask[3*(DQ_WIDTH/8)-1:2*(DQ_WIDTH/8)];
  assign mask_data_fall1 = (~mc_data_sel) ? 'b0 :
                           ((REG_CTRL == "ON") && ((nCWL == 7)||(nCWL == 9))) ?
                           dfi_wrdata_mask_r[4*(DQ_WIDTH/8)-1:3*(DQ_WIDTH/8)] :
                           dfi_wrdata_mask[4*(DQ_WIDTH/8)-1:3*(DQ_WIDTH/8)];
end else begin: gen_wrdata_mask_udimm
  assign wr_data_rise0 = (mc_data_sel) ? 
                         dfi_wrdata[DQ_WIDTH-1:0] : 
                         phy_wrdata[DQ_WIDTH-1:0];
  assign wr_data_fall0 = (mc_data_sel) ? 
                         dfi_wrdata[(2*DQ_WIDTH)-1:DQ_WIDTH] :
                         phy_wrdata[(2*DQ_WIDTH)-1:DQ_WIDTH];
  assign wr_data_rise1 = (mc_data_sel) ? 
                         dfi_wrdata[(3*DQ_WIDTH)-1:2*DQ_WIDTH] :
                         phy_wrdata[(3*DQ_WIDTH)-1:2*DQ_WIDTH];
  assign wr_data_fall1 = (mc_data_sel) ? 
                         dfi_wrdata[(4*DQ_WIDTH)-1:3*DQ_WIDTH] :
                         phy_wrdata[(4*DQ_WIDTH)-1:3*DQ_WIDTH];

  assign mask_data_rise0 = (mc_data_sel) ?
                           dfi_wrdata_mask[(DQ_WIDTH/8)-1:0] :
                           'b0;
  assign mask_data_fall0 = (mc_data_sel) ?
                           dfi_wrdata_mask[2*(DQ_WIDTH/8)-1:(DQ_WIDTH/8)] :
                           'b0;
  assign mask_data_rise1 = (mc_data_sel) ?
                           dfi_wrdata_mask[3*(DQ_WIDTH/8)-1:2*(DQ_WIDTH/8)] :
                           'b0;
  assign mask_data_fall1 = (mc_data_sel) ?
                           dfi_wrdata_mask[4*(DQ_WIDTH/8)-1:3*(DQ_WIDTH/8)] :
                           'b0;
end
endgenerate

endmodule
