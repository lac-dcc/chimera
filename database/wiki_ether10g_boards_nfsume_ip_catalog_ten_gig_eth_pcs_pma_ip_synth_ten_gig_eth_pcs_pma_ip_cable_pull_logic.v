//-----------------------------------------------------------------------------
// Title      : Cable Pull handling logic
// Project    : 10GBASE-R
//-----------------------------------------------------------------------------
// File       : ten_gig_eth_pcs_pma_ip_cable_pull_logic.v
//-----------------------------------------------------------------------------
// Description: This file contains the logic to detect Cable-Pull and Cable-
//              Reattachment
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
module ten_gig_eth_pcs_pma_ip_cable_pull_logic
  (
  input           coreclk,
  input           rxusrclk2,
  input           areset_rxusrclk2,
  input           pma_resetout_rising_rxusrclk2,
  input           gt0_rxresetdone_i_reg_rxusrclk2,
  input           gearboxslip,
  input [3:0]     rx_sample_in,
  output reg      cable_pull_reset_rising_reg = 1'b0,
  output reg      cable_unpull_reset_rising_reg = 1'b0,
  output          cable_is_pulled);

  // Aid the detection of a cable/board being pulled

  // Watchdog values for detecting cable pull and reattach
  localparam [19:0] CABLE_PULL_WATCHDOG_RESET = 20'h20000; // 128K cycles = 64K words
  localparam [19:0] CABLE_UNPULL_WATCHDOG_RESET = 20'h20000;

  // Ignore the rx_sample_in immediately after a gearboxslip, to avoid possibly seeing X's in simulation
  localparam [3:0] GEARBOXSLIP_IGNORE_COUNT = 4'hF;
  reg [3:0] gearboxslipignorecount = 4'hF;
  reg gearboxslipignore = 1'b0;

  reg [3:0] rx_sample = 4'b0000; // Used to monitor RX data for a cable pull
  reg [3:0] rx_sample_prev = 4'b0000; // Used to monitor RX data for a cable pull
  reg [19:0] cable_pull_watchdog = CABLE_PULL_WATCHDOG_RESET; 
  reg [1:0] cable_pull_watchdog_event = 2'b00; // Count events which suggest no cable pull
  reg cable_pull_reset = 1'b0;  // This is set when the watchdog above gets to 0.
  wire cable_pull_reset_reg;  // This is set when the watchdog above gets to 0.
  reg cable_pull_reset_reg_reg = 1'b0;
  reg cable_pull_reset_rising = 1'b0;
  wire cable_pull_reset_rising_rxusrclk2;

  // Aid the detection of a cable/board being plugged back in
  reg cable_unpull_enable = 1'b0;
  reg [19:0] cable_unpull_watchdog = CABLE_UNPULL_WATCHDOG_RESET;
  reg [10:0] cable_unpull_watchdog_event = 11'b0;
  reg cable_unpull_reset = 1'b0;
  wire cable_unpull_reset_reg;
  reg cable_unpull_reset_reg_reg = 1'b0;
  reg cable_unpull_reset_rising = 1'b0;
  wire cable_unpull_reset_rising_rxusrclk2;

  // Need to ignore the rx_sample_in data for several cycles after a gearboxslip is
  // requested since in simulation, Xs can appear on the GT RXDATA pins, which if 
  // sampled, propagate through the design.
  always @(posedge rxusrclk2)
  begin
      if(gearboxslip) // start ignoring
      begin
        gearboxslipignorecount <= GEARBOXSLIP_IGNORE_COUNT;
        gearboxslipignore <= 1'b1;
      end
      else if(gearboxslipignorecount == 4'h0) // done with ignoring
        gearboxslipignore <= 1'b0;
      else // Keep counting
        gearboxslipignorecount <= gearboxslipignorecount - 1;
  end 

  // Create a watchdog which samples 4 bits from the gt_rxd vector and checks that it does
  // vary from a 1010 or 0101 or 0000 pattern. If not then there may well have been a cable pull
  // and the gt rx side needs to be reset.
  always @(posedge rxusrclk2)
  begin
    if(cable_pull_reset_rising_rxusrclk2)
    begin
      cable_pull_watchdog_event <= 2'b00;
      cable_pull_watchdog <= CABLE_PULL_WATCHDOG_RESET; // reset the watchdog
      cable_pull_reset <= 1'b0;
      rx_sample <= 4'b0;
      rx_sample_prev <= 4'b0;
    end
    else
    begin
      // Sample 4 bits of the gt_rxd vector
      if(!gearboxslipignore)
      begin
        rx_sample <= rx_sample_in;
        rx_sample_prev <= rx_sample;
      end

      if(!cable_pull_reset && !cable_is_pulled && gt0_rxresetdone_i_reg_rxusrclk2)
      begin
        // If those 4 bits do not look like the cable-pull behaviour, increment the event counter
        if(!(rx_sample == 4'b1010) && !(rx_sample == 4'b0101) && !(rx_sample == 4'b0000) && !(rx_sample == rx_sample_prev))  // increment the event counter
          cable_pull_watchdog_event <= cable_pull_watchdog_event + 1;
        else // we are seeing what may be a cable pull
          cable_pull_watchdog_event <= 2'b00;


        if(cable_pull_watchdog_event == 2'b10) // Two consecutive events which look like the cable is attached
        begin
          cable_pull_watchdog <= CABLE_PULL_WATCHDOG_RESET; // reset the watchdog
          cable_pull_watchdog_event <= 2'b00;
        end
        else
          cable_pull_watchdog <= cable_pull_watchdog - 1;


        if(~|cable_pull_watchdog)
          cable_pull_reset <= 1'b1; // Hit GTRXRESET!
        else
          cable_pull_reset <= 1'b0;
      end
    end
  end

  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  cable_pull_reset_sync_i
    (
     .clk(coreclk),
     .data_in(cable_pull_reset),
     .data_out(cable_pull_reset_reg)
    );

  always @(posedge coreclk)
  begin
    cable_pull_reset_reg_reg <= cable_pull_reset_reg;
    cable_pull_reset_rising <= cable_pull_reset_reg && !cable_pull_reset_reg_reg;
    cable_pull_reset_rising_reg <= cable_pull_reset_rising;
  end

  always @(posedge rxusrclk2)
  begin
    if(areset_rxusrclk2 || pma_resetout_rising_rxusrclk2)
      cable_unpull_enable <= 1'b0;
    else if(cable_pull_reset) // Cable pull has been detected - enable cable unpull counter
      cable_unpull_enable <= 1'b1;
    else if(cable_unpull_reset) // Cable has been detected as being plugged in again
      cable_unpull_enable <= 1'b0;
    else
      cable_unpull_enable <= cable_unpull_enable;
  end

  // Look for data on the line which does NOT look like the cable is still pulled
  // a set of 1024 non-1010 or 0101 or 0000 samples within 64k words suggests that the cable is in.
  always @(posedge rxusrclk2)
  begin
    if(cable_unpull_reset_rising_rxusrclk2)
    begin
      cable_unpull_reset <= 1'b0;
      cable_unpull_watchdog_event <= 11'b0; // reset the event counter
      cable_unpull_watchdog <= CABLE_UNPULL_WATCHDOG_RESET; // reset the watchdog window
    end
    else
    begin
      if(!cable_unpull_reset && cable_is_pulled && gt0_rxresetdone_i_reg_rxusrclk2)
      begin
        // If those 4 bits do not look like the cable-pull behaviour, increment the event counter
        if(!(rx_sample == 4'b1010) && !(rx_sample == 4'b0101) && !(rx_sample == 4'b0000) && !(rx_sample == rx_sample_prev))  // increment the event counter
          cable_unpull_watchdog_event <= cable_unpull_watchdog_event + 1;


        if(cable_unpull_watchdog_event[10] == 1'b1) // Detected 1k 'valid' rx data words within 64k words
        begin
          cable_unpull_reset <= 1'b1; // Hit GTRXRESET again!
          cable_unpull_watchdog <= CABLE_UNPULL_WATCHDOG_RESET; // reset the watchdog window
        end
        else
          cable_unpull_watchdog <= cable_unpull_watchdog - 1;

        if(~|cable_unpull_watchdog)
        begin
          cable_unpull_watchdog <= CABLE_UNPULL_WATCHDOG_RESET; // reset the watchdog window
          cable_unpull_watchdog_event <= 11'b0; // reset the event counter
        end
      end
    end
  end

  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  cable_unpull_reset_sync_i
    (
     .clk(coreclk),
     .data_in(cable_unpull_reset),
     .data_out(cable_unpull_reset_reg)
    );

  always @(posedge coreclk)
  begin
    cable_unpull_reset_reg_reg <= cable_unpull_reset_reg;
    cable_unpull_reset_rising <= cable_unpull_reset_reg && !cable_unpull_reset_reg_reg;
    cable_unpull_reset_rising_reg <= cable_unpull_reset_rising;
  end

  // Create the local cable_is_pulled signal
  assign cable_is_pulled = cable_unpull_enable;

  ten_gig_eth_pcs_pma_ip_ff_synchronizer_rst 
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b1)) 
  cable_pull_reset_rising_rxusrclk2_sync_i
    (
     .clk(rxusrclk2),
     .rst(cable_pull_reset_rising),
     .data_in(1'b0),
     .data_out(cable_pull_reset_rising_rxusrclk2)
    );
            
  ten_gig_eth_pcs_pma_ip_ff_synchronizer_rst 
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b1)) 
  cable_unpull_reset_rising_rxusrclk2_sync_i
    (
     .clk(rxusrclk2),
     .rst(cable_unpull_reset_rising),
     .data_in(1'b0),
     .data_out(cable_unpull_reset_rising_rxusrclk2)
    );
            
endmodule
