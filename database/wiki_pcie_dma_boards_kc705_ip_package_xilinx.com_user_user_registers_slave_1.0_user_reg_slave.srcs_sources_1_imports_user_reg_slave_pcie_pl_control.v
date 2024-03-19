//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
//
// This disclaimer is not a license and does not grant any rights to the
// materials distributed herewith. Except as otherwise provided in a valid
// license issued to you by Xilinx, and to the maximum extent permitted by
// applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
// FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
// IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
// MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
// and (2) Xilinx shall not be liable (whether in contract or tort, including
// negligence, or under any other theory of liability) for any loss or damage
// of any kind or nature related to, arising under or in connection with these
// materials, including for any direct, or any indirect, special, incidental,
// or consequential loss or damage (including loss of data, profits, goodwill,
// or any type of loss or damage suffered as a result of any action brought by
// a third party) even if such damage or loss was reasonably foreseeable or
// Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
//
// Xilinx products are not designed or intended to be fail-safe, or for use in
// any application requiring fail-safe performance, such as life-support or
// safety devices or systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any other
// applications that could lead to death, personal injury, or severe property
// or environmental damage (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and liability of any use of
// Xilinx products in Critical Applications, subject only to applicable laws
// and regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
// AT ALL TIMES.

// ----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// MODULE 
//-----------------------------------------------------------------------------

module pcie_pl_control (
  input   [5:0]       pl_ltssm_state,
  input   [2:0]       pl_initial_link_width,
  input               pl_link_upcfg_capable,
  input               pl_link_gen2_capable,
  input               pl_link_partner_gen2_supported,
  input   [2:0]       cfg_pcie_link_state,
  input   [1:0]       pl_lane_reversal_mode,
//  input               hw_auton_width_disable,

  input   [1:0]       target_link_width,
  input               valid_width_change_req,
  output reg          width_change_done = 1'b0,
  output reg          width_change_error = 1'b0,
  input               target_link_speed,
  input               valid_speed_change_req,
  output reg          speed_change_done = 1'b0,
  output reg          speed_change_error = 1'b0,
  
  input               pl_sel_lnk_rate,
  input   [1:0]       pl_sel_lnk_width,

  output              pl_directed_link_speed,
  output  [1:0]       pl_directed_link_width,
  output  [1:0]       pl_directed_link_change,
  output              pl_directed_link_auton,

  input               user_reset,
  input               user_clk  

);

  //-LTSSM States to be checked against for success of link width and speed
  //change operation
  localparam  REC_IDLE  = 6'h20;
  localparam  CFG_IDLE  = 6'h15;

  reg         change_link_width = 1'b0;
  reg         change_link_speed = 1'b0;
  
  reg [1:0]   change_width =2 'd0;
  reg         change_speed = 1'b0;
  reg         speed_req = 1'b0;
  reg         width_req = 1'b0;

  reg         tgt_speed = 1'b0;
  reg [1:0]   tgt_width = 2'd0;      

  reg [5:0]   pl_ltssm_state_r  = 6'd0;
  reg [1:0]   pl_sel_lnk_width_r  = 2'b00;
  reg         pl_lnk_upcfg_capable_r  = 1'b0;
  reg [2:0]   pl_initial_link_width_r = 3'd0;
//  reg [1:0]   cfg_pmcsr_powerstate_r = 2'd0;
  reg         pl_sel_lnk_rate_r = 1'b0;
  reg         pl_link_gen2_capable_r  = 1'b0;
  reg         pl_link_partner_gen2_supported_r  = 1'b0;

  wire        invalid_width;

    //- Register PCIe block outputs to ease timing
  always @(posedge user_clk)
  begin
    pl_ltssm_state_r  <= pl_ltssm_state;
    pl_sel_lnk_width_r  <= pl_sel_lnk_width;
    pl_lnk_upcfg_capable_r  <= pl_link_upcfg_capable;
    pl_initial_link_width_r  <= pl_initial_link_width;
//    cfg_pmcsr_powerstate_r  <= cfg_pmcsr_powerstate;
    pl_sel_lnk_rate_r <= pl_sel_lnk_rate;
    pl_link_gen2_capable_r  <= pl_link_gen2_capable;
    pl_link_partner_gen2_supported_r  <= pl_link_partner_gen2_supported;
  end


  /*
   *  The directed width change request is considered invalid when
        - target width is equal to the current width
        - link is upconfigure capable ut requested width > initial width
        - link is not upconfigure capable and requested width is greater
        than current width
   */

  assign invalid_width = (target_link_width == pl_sel_lnk_width_r) |
  (pl_lnk_upcfg_capable_r & (target_link_width > (pl_initial_link_width_r-1'b1))) |
  (!pl_lnk_upcfg_capable_r & (target_link_width > pl_sel_lnk_width_r));

    //- internal request latching for speed change
  always @(posedge user_clk) 
    if (user_reset | (speed_req & change_link_speed))
    begin
      speed_req <= 1'b0;
      tgt_speed <= 1'b0;
    end
    else if (valid_speed_change_req & (target_link_speed != pl_sel_lnk_rate_r))
    begin
      speed_req <= 1'b1;
      tgt_speed <= target_link_speed;  
    end

    //- Speed change logic
  always @(posedge user_clk)
    if (user_reset)
    begin
      change_speed  <= 1'b0;
      change_link_speed <= 1'b0;
    end
    else if (pl_ltssm_state == REC_IDLE)
    begin
      change_speed  <= 1'b0;
      change_link_speed <= 1'b0;
    end
    else if (speed_req)
    begin
      change_speed  <= tgt_speed;
      change_link_speed <= speed_req;
    end
  
    //- latch the width request internally
  always @(posedge user_clk)
    if (user_reset | (width_req & change_link_width))
    begin
      width_req <= 1'b0;
      tgt_width <= 2'b00;
    end
    else if (valid_width_change_req & ~invalid_width)
    begin
      width_req <= 1'b1;
      tgt_width <= target_link_width;
    end
  
  //- Width change logic
  always @(posedge user_clk)
    if (user_reset)
    begin
      change_width  <= 2'b00;
      change_link_width <= 1'b0;
    end
    else if (pl_ltssm_state == CFG_IDLE)
    begin
      change_width  <= 2'b00;
      change_link_width <= 1'b0;
    end
    else if (width_req)
    begin
      change_width  <= tgt_width;
      change_link_width <= 1'b1;
    end
  
  //- Drive the PCIe block inputs
  assign pl_directed_link_auton = 1'b1;
  assign pl_directed_link_width = change_width;
  assign pl_directed_link_speed = change_speed;
  assign pl_directed_link_change = {change_link_speed, change_link_width};

  //- build outputs to indicate successful completion
  always @(posedge user_clk)
  begin
    if (change_link_width & (pl_ltssm_state == CFG_IDLE))
      width_change_done <= 1'b1;
    else
      width_change_done <= 1'b0;

    if (change_link_speed & (pl_ltssm_state == REC_IDLE))
      speed_change_done <= 1'b1;
    else
      speed_change_done <= 1'b0;
  end
 
  //- build output to indicate error
  always @(posedge user_clk)
  begin
    if (valid_width_change_req & invalid_width)
      width_change_error  <= 1'b1;
    else
      width_change_error  <= 1'b0;

    if (valid_speed_change_req & (target_link_speed == pl_sel_lnk_rate))
      speed_change_error  <= 1'b1;
    else  
      speed_change_error  <= 1'b0;
  end
 
endmodule
