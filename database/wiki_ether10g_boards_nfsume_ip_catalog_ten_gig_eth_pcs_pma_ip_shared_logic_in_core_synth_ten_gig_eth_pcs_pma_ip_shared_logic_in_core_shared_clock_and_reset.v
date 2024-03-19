//-----------------------------------------------------------------------------
// Title      : Shared clocking and resets
// Project    : 10GBASE-R
//-----------------------------------------------------------------------------
// File       : ten_gig_eth_pcs_pma_ip_shared_logic_in_core_shared_clock_and_reset.v
//-----------------------------------------------------------------------------
// Description: This file contains the
// 10GBASE-R clocking and reset logic which can be shared between multiple cores
//-----------------------------------------------------------------------------
// (c) Copyright 2009 - 2014 Xilinx, Inc. All rights reserved.
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

`timescale 1ps / 1ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module  ten_gig_eth_pcs_pma_ip_shared_logic_in_core_shared_clock_and_reset
    (
     input  areset,
     input  refclk_p,
     input  refclk_n,
     output refclk,
     input  txoutclk,
     output coreclk,
     input  qplllock,
     output wire areset_coreclk,
     output gttxreset,
     output gtrxreset,
     output reg txuserrdy = 1'b0,
     output txusrclk,
     output txusrclk2,
     output qpllreset,
     output reset_counter_done
    );

  wire coreclk_buf;
  wire qplllock_txusrclk2;
  reg [8:0] reset_counter = 9'h000;
  assign reset_counter_done = reset_counter[8];
  reg [3:0] reset_pulse = 4'b1110;
  wire gttxreset_txusrclk2;

  wire refclk_p_buffed;
  wire refclk_n_buffed;

  IBUF refclk_p_buf
  (.I(refclk_p),
   .O(refclk_p_buffed));

  IBUF refclk_n_buf
  (.I(refclk_n),
   .O(refclk_n_buffed));
  IBUFDS_GTE2 ibufds_inst
  (
      .O     (refclk),
      .ODIV2 (),
      .CEB   (1'b0),
      .I     (refclk_p_buffed),
      .IB    (refclk_n_buffed)
  );

  BUFG txoutclk_bufg_i
  (
      .I (txoutclk),
      .O (txusrclk)
  );

  BUFG coreclk_bufg_inst
  (
      .I                              (refclk),
      .O                              (coreclk)
  );


  assign txusrclk2 = txusrclk;

  // Asynch reset synchronizers...

  ten_gig_eth_pcs_pma_ip_shared_logic_in_core_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b1))
  areset_coreclk_sync_i
    (
     .clk(coreclk),
     .rst(areset),
     .data_in(1'b0),
     .data_out(areset_coreclk)
    );


  ten_gig_eth_pcs_pma_ip_shared_logic_in_core_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b0))
  qplllock_txusrclk2_sync_i
    (
     .clk(txusrclk2),
     .rst(!qplllock),
     .data_in(1'b1),
     .data_out(qplllock_txusrclk2)
    );


  // Hold off the GT resets until 500ns after configuration.
  // 256 ticks at the minimum possible 2.56ns period (390MHz) will be >> 500 ns.

  always @(posedge coreclk)
  begin
    if (!reset_counter[8])
      reset_counter   <=   reset_counter + 1'b1;
    else
      reset_counter   <=   reset_counter;
  end

  always @(posedge coreclk)
  begin
    if (areset_coreclk == 1'b1)
      reset_pulse   <=   4'b1110;
    else if(reset_counter[8])
      reset_pulse   <=   {1'b0, reset_pulse[3:1]};
  end

  assign   qpllreset  =     reset_pulse[0];
  assign   gttxreset  =     reset_pulse[0];
  assign   gtrxreset  =     reset_pulse[0];

  ten_gig_eth_pcs_pma_ip_shared_logic_in_core_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b1))
  gttxreset_txusrclk2_sync_i
    (
     .clk(txusrclk2),
     .rst(gttxreset),
     .data_in(1'b0),
     .data_out(gttxreset_txusrclk2)
    );

  always @(posedge txusrclk2 or posedge gttxreset_txusrclk2)
  begin
     if(gttxreset_txusrclk2)
       txuserrdy <= 1'b0;
     else
       txuserrdy <= qplllock_txusrclk2;
  end


endmodule



