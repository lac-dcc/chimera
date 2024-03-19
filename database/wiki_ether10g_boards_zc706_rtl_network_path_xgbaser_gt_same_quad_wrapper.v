//-----------------------------------------------------------------------------
// Title      :Block level wrapper                                             
//-----------------------------------------------------------------------------
// File       : xgbaser_gt_same_quad_wrapper.v                                         
//-----------------------------------------------------------------------------
// Description: This file is a wrapper for the 10GBASE-R core. It contains the 
// 10GBASE-R core, the transceivers and some transceiver logic.                
//-----------------------------------------------------------------------------
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

`define DLY #1

module xgbaser_gt_same_quad_wrapper 
  (
     input  areset,
     input  refclk_p,
     input  refclk_n,
     input  txclk322,
     input  gt0_tx_resetdone,
     input  gt1_tx_resetdone,

     output reg areset_refclk_bufh,
     output reg areset_clk156,
     output reg mmcm_locked_clk156,
     output reg gttxreset_txusrclk2,
     output gttxreset,
     output gtrxreset,
     output reg txuserrdy,
     output reset_counter_done,
     output txusrclk,
     output txusrclk2,
     output clk156,
     output dclk,
     output qpllreset,
     output qplllock,
     output qplloutclk, 
     output qplloutrefclk 

);

  wire clk156_buf;
  wire dclk_buf;
  wire clkfbout;
  wire mmcm_locked;
  reg areset_refclk_bufh_tmp;
  reg areset_clk156_tmp;
  reg qplllock_txusrclk2_tmp;
  reg mmcm_locked_clk156_tmp;
  reg [7:0] reset_counter = 8'h00;
  reg [3:0] reset_pulse;
  reg gttxreset_txusrclk2_tmp;
  reg qplllock_txusrclk2;
  wire refclk;
  wire qplllockdetclk;
  wire qpllrefclklost;
  wire refclk_bufh;
    
  ten_gig_eth_pcs_pma_ip_GT_Common_wrapper # (
      .WRAPPER_SIM_GTRESET_SPEEDUP("FALSE") ) //Does not affect hardware
  ten_gig_eth_pcs_pma_gt_common_block
    (
     .refclk(refclk),
     .qplllockdetclk(qplllockdetclk),
     .qpllreset(qpllreset),
     .qplllock(qplllock),
     .qpllrefclklost(qpllrefclklost),
     .qplloutclk(qplloutclk),
     .qplloutrefclk(qplloutrefclk)
    );

  assign reset_counter_done = reset_counter[7];

  IBUFDS_GTE2 ibufds_inst  
  (
      .O     (refclk),
      .ODIV2 (),
      .CEB   (1'b0),
      .I     (refclk_p),
      .IB    (refclk_n)
  );

  BUFG tx322clk_bufg_i
  (
      .I (txclk322),
      .O (txusrclk)
  );

  assign txusrclk2 = txusrclk;
    
  // MMCM to generate both clk156 and dclk
  MMCME2_BASE #
  (
    .BANDWIDTH            ("OPTIMIZED"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (6.500),	// for internal SFP+ module (156.25MHz)
    .CLKFBOUT_PHASE       (0.000),
    .CLKOUT0_DIVIDE_F     (6.500),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT1_DIVIDE       (13),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKIN1_PERIOD        (6.400),	// fo internal SFP+ module (156.25MHz)
    .REF_JITTER1          (0.010)

  )
  clkgen_i
  (
    .CLKFBIN(clkfbout),
    .CLKIN1(refclk_bufh),
    .PWRDWN(1'b0),
    .RST(!qplllock),
    .CLKFBOUT(clkfbout),
    .CLKOUT0(clk156_buf),
    .CLKOUT1(dclk_buf),
    .LOCKED(mmcm_locked),
    .CLKFBOUTB(),
    .CLKOUT0B(),
    .CLKOUT1B(),
    .CLKOUT2(),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6()
  );

  BUFHCE bufh_inst 
  (
      .CE                             (1'b1),
      .I                              (refclk),
      .O                              (refclk_bufh) 
  );

  BUFG clk156_bufg_inst 
  (
      .I                              (clk156_buf),
      .O                              (clk156) 
  );

  BUFG dclk_bufg_inst 
  (
      .I                              (dclk_buf),
      .O                              (dclk) 
  );  

  // Asynch reset synchronizers...
  //synthesis attribute async_reg of areset_refclk_bufh_tmp is "true";
  //synthesis attribute async_reg of areset_refclk_bufh is "true";
  always @(posedge areset or posedge refclk_bufh)
  begin
    if(areset)
    begin
      areset_refclk_bufh_tmp <= 1'b1;
      areset_refclk_bufh <= 1'b1;
    end
    else
    begin
      areset_refclk_bufh_tmp <= 1'b0;
      areset_refclk_bufh <= areset_refclk_bufh_tmp;
    end
  end  
   
  //synthesis attribute async_reg of areset_clk156_tmp is "true";
  //synthesis attribute async_reg of areset_clk156 is "true";
  always @(posedge areset or posedge clk156)
  begin
    if(areset)
    begin
      areset_clk156_tmp <= 1'b1;
      areset_clk156 <= 1'b1;
    end
    else
    begin
      areset_clk156_tmp <= 1'b0;
      areset_clk156 <= areset_clk156_tmp;
    end
  end  
   
  //synthesis attribute async_reg of qplllock_txusrclk2_tmp is "true";
  //synthesis attribute async_reg of qplllock_txusrclk2 is "true";
  always @(negedge qplllock or posedge txusrclk2)
  begin
    if(!qplllock)
    begin
      qplllock_txusrclk2_tmp <= 1'b0;
      qplllock_txusrclk2 <= 1'b0;
    end
    else
    begin
      qplllock_txusrclk2_tmp <= 1'b1;
      qplllock_txusrclk2 <= qplllock_txusrclk2_tmp;
    end
  end  
   
  //synthesis attribute async_reg of mmcm_locked_clk156_tmp is "true";
  //synthesis attribute async_reg of mmcm_locked_clk156 is "true";
  always @(negedge mmcm_locked or posedge clk156)
  begin
    if(!mmcm_locked)
    begin
      mmcm_locked_clk156_tmp <= 1'b0;
      mmcm_locked_clk156 <= 1'b0;
    end
    else
    begin
      mmcm_locked_clk156_tmp <= 1'b1;
      mmcm_locked_clk156 <= mmcm_locked_clk156_tmp;
    end
  end       
    
  // Hold off release the GT resets until 500ns after configuration.
  // 128 ticks at 6.4ns period will be >> 500 ns.

  always @(posedge refclk_bufh or posedge areset_refclk_bufh)
  begin
    if (areset_refclk_bufh == 1'b1)
      reset_counter <= 8'b0;
    else if (!reset_counter[7])
      reset_counter   <=   reset_counter + 1'b1;   
    else
      reset_counter   <=   reset_counter;
  end

  always @(posedge refclk_bufh)
  begin
    if(!reset_counter[7])
      reset_pulse   <=   4'b1110;
    else
      reset_pulse   <=   {1'b0, reset_pulse[3:1]};
  end

  assign   gttxreset  =     reset_pulse[0];
  assign   gtrxreset  =     reset_pulse[0];
  assign   qpllreset  =     reset_pulse[0];

  //synthesis attribute async_reg of gttxreset_txusrclk2_tmp is "true";
  //synthesis attribute async_reg of gttxreset_txusrclk2 is "true";
  always @(posedge gttxreset or posedge txusrclk2)
  begin
    if(gttxreset)
    begin
      gttxreset_txusrclk2_tmp <= 1'b1;
      gttxreset_txusrclk2 <= 1'b1;
    end
    else
    begin
      gttxreset_txusrclk2_tmp <= 1'b0;
      gttxreset_txusrclk2 <= gttxreset_txusrclk2_tmp;
    end
  end  
   
  always @(posedge txusrclk2 or posedge gttxreset_txusrclk2)
  begin
     if(gttxreset_txusrclk2)
       txuserrdy <= 1'b0;
     else
       txuserrdy <= qplllock_txusrclk2;
  end

endmodule
