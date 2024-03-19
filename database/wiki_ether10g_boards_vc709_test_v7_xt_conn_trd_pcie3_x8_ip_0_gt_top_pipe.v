//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
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
//-----------------------------------------------------------------------------
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : pcie3_7x_v2_0_gt_top_pipe.v
// Version    : 3.0

`timescale 1ps / 1ps

module v7_xt_conn_trd_pcie3_x8_ip_0_gt_top_pipe #
(
  parameter               TCQ                        = 100,
  parameter               PL_LINK_CAP_MAX_LINK_WIDTH = 8,      // 1 - x1 , 2 - x2 , 4 - x4 , 8 - x8
  parameter               PL_LINK_CAP_MAX_LINK_SPEED = 3,      // 1 - Gen 1 , 2 - Gen 2 , 3 - Gen 3
  parameter               REF_CLK_FREQ               = 0,      // 0 - 100 MHz , 1 - 125 MHz , 2 - 250 MHz
  //  USER_CLK[1/2]_FREQ        : 0 = Disable user clock
  //                                : 1 =  31.25 MHz
  //                                : 2 =  62.50 MHz (default)
  //                                : 3 = 125.00 MHz
  //                                : 4 = 250.00 MHz
  //                                : 5 = 500.00 MHz
  parameter  integer      USER_CLK_FREQ             = 5,
  parameter  integer      USER_CLK2_FREQ            = 4,
  parameter               PL_SIM_FAST_LINK_TRAINING = "FALSE", // Simulation Speedup
  parameter               PCIE_EXT_CLK              = "FALSE", // Use External Clocking
  parameter               PCIE_TXBUF_EN             = "FALSE",
  parameter               PCIE_GT_DEVICE            = "GTH",
  parameter               PCIE_CHAN_BOND            = 0,       // 0 - One Hot, 1 - Daisy Chain, 2 - Binary Tree
  parameter               PCIE_CHAN_BOND_EN         = "FALSE", // Disable Channel bond as Integrated Block perform CB
  parameter               PCIE_USE_MODE             = "1.1",
  parameter               PCIE_LPM_DFE              = "LPM",
  parameter               PCIE_LINK_SPEED           = 3

) (

  //-----------------------------------------------------------------------------------------------------------------//
  // Pipe Per-Link Signals
  input   wire                                       pipe_tx_rcvr_det,
  input   wire                                       pipe_tx_reset,
  input   wire                               [1:0]   pipe_tx_rate,
  input   wire                                       pipe_tx_deemph,
  input   wire                               [2:0]   pipe_tx_margin,
  input   wire                                       pipe_tx_swing,
  output  wire                               [5:0]   pipe_txeq_fs,
  output  wire                               [5:0]   pipe_txeq_lf,
  input   wire                               [7:0]   pipe_rxslide,
  output  reg                                [7:0]   pipe_rxsync_done,
  input   wire                               [5:0]   cfg_ltssm_state,

  // Pipe Per-Lane Signals - Lane 0
  output  wire                               [1:0]   pipe_rx0_char_is_k,
  output  wire                              [31:0]   pipe_rx0_data,
  output  wire                                       pipe_rx0_valid,
  output  wire                                       pipe_rx0_chanisaligned,
  output  wire                               [2:0]   pipe_rx0_status,
  output  wire                                       pipe_rx0_phy_status,
  output  wire                                       pipe_rx0_elec_idle,
  input   wire                                       pipe_rx0_polarity,
  input   wire                                       pipe_tx0_compliance,
  input   wire                               [1:0]   pipe_tx0_char_is_k,
  input   wire                              [31:0]   pipe_tx0_data,
  input   wire                                       pipe_tx0_elec_idle,
  input   wire                               [1:0]   pipe_tx0_powerdown,
  input   wire                               [1:0]   pipe_tx0_eqcontrol,
  input   wire                               [3:0]   pipe_tx0_eqpreset,
  input   wire                               [5:0]   pipe_tx0_eqdeemph,
  output  reg                                        pipe_tx0_eqdone,
  output  wire                              [17:0]   pipe_tx0_eqcoeff,
  input   wire                               [1:0]   pipe_rx0_eqcontrol,
  input   wire                               [2:0]   pipe_rx0_eqpreset,
  input   wire                               [5:0]   pipe_rx0_eq_lffs,
  input   wire                               [3:0]   pipe_rx0_eq_txpreset,
  output  wire                              [17:0]   pipe_rx0_eq_new_txcoeff,
  output  wire                                       pipe_rx0_eq_lffs_sel,
  output  wire                                       pipe_rx0_eq_adapt_done,
  output  reg                                        pipe_rx0_eqdone,

  // Pipe Per-Lane Signals - Lane 1
  output  wire                               [1:0]   pipe_rx1_char_is_k,
  output  wire                              [31:0]   pipe_rx1_data,
  output  wire                                       pipe_rx1_valid,
  output  wire                                       pipe_rx1_chanisaligned,
  output  wire                               [2:0]   pipe_rx1_status,
  output  wire                                       pipe_rx1_phy_status,
  output  wire                                       pipe_rx1_elec_idle,
  input   wire                                       pipe_rx1_polarity,
  input   wire                                       pipe_tx1_compliance,
  input   wire                               [1:0]   pipe_tx1_char_is_k,
  input   wire                              [31:0]   pipe_tx1_data,
  input   wire                                       pipe_tx1_elec_idle,
  input   wire                               [1:0]   pipe_tx1_powerdown,
  input   wire                               [1:0]   pipe_tx1_eqcontrol,
  input   wire                               [3:0]   pipe_tx1_eqpreset,
  input   wire                               [5:0]   pipe_tx1_eqdeemph,
  output  reg                                        pipe_tx1_eqdone,
  output  wire                              [17:0]   pipe_tx1_eqcoeff,
  input   wire                               [1:0]   pipe_rx1_eqcontrol,
  input   wire                               [2:0]   pipe_rx1_eqpreset,
  input   wire                               [5:0]   pipe_rx1_eq_lffs,
  input   wire                               [3:0]   pipe_rx1_eq_txpreset,
  output  wire                              [17:0]   pipe_rx1_eq_new_txcoeff,
  output  wire                                       pipe_rx1_eq_lffs_sel,
  output  wire                                       pipe_rx1_eq_adapt_done,
  output  reg                                        pipe_rx1_eqdone,

  // Pipe Per-Lane Signals - Lane 2
  output  wire                               [1:0]   pipe_rx2_char_is_k,
  output  wire                              [31:0]   pipe_rx2_data,
  output  wire                                       pipe_rx2_valid,
  output  wire                                       pipe_rx2_chanisaligned,
  output  wire                               [2:0]   pipe_rx2_status,
  output  wire                                       pipe_rx2_phy_status,
  output  wire                                       pipe_rx2_elec_idle,
  input   wire                                       pipe_rx2_polarity,
  input   wire                                       pipe_tx2_compliance,
  input   wire                               [1:0]   pipe_tx2_char_is_k,
  input   wire                              [31:0]   pipe_tx2_data,
  input   wire                                       pipe_tx2_elec_idle,
  input   wire                               [1:0]   pipe_tx2_powerdown,
  input   wire                               [1:0]   pipe_tx2_eqcontrol,
  input   wire                               [3:0]   pipe_tx2_eqpreset,
  input   wire                               [5:0]   pipe_tx2_eqdeemph,
  output  reg                                        pipe_tx2_eqdone,
  output  wire                              [17:0]   pipe_tx2_eqcoeff,
  input   wire                               [1:0]   pipe_rx2_eqcontrol,
  input   wire                               [2:0]   pipe_rx2_eqpreset,
  input   wire                               [5:0]   pipe_rx2_eq_lffs,
  input   wire                               [3:0]   pipe_rx2_eq_txpreset,
  output  wire                              [17:0]   pipe_rx2_eq_new_txcoeff,
  output  wire                                       pipe_rx2_eq_lffs_sel,
  output  wire                                       pipe_rx2_eq_adapt_done,
  output  reg                                        pipe_rx2_eqdone,

  // Pipe Per-Lane Signals - Lane 3
  output  wire                               [1:0]   pipe_rx3_char_is_k,
  output  wire                              [31:0]   pipe_rx3_data,
  output  wire                                       pipe_rx3_valid,
  output  wire                                       pipe_rx3_chanisaligned,
  output  wire                               [2:0]   pipe_rx3_status,
  output  wire                                       pipe_rx3_phy_status,
  output  wire                                       pipe_rx3_elec_idle,
  input   wire                                       pipe_rx3_polarity,
  input   wire                                       pipe_tx3_compliance,
  input   wire                               [1:0]   pipe_tx3_char_is_k,
  input   wire                              [31:0]   pipe_tx3_data,
  input   wire                                       pipe_tx3_elec_idle,
  input   wire                               [1:0]   pipe_tx3_powerdown,
  input   wire                               [1:0]   pipe_tx3_eqcontrol,
  input   wire                               [3:0]   pipe_tx3_eqpreset,
  input   wire                               [5:0]   pipe_tx3_eqdeemph,
  output  reg                                        pipe_tx3_eqdone,
  output  wire                              [17:0]   pipe_tx3_eqcoeff,
  input   wire                               [1:0]   pipe_rx3_eqcontrol,
  input   wire                               [2:0]   pipe_rx3_eqpreset,
  input   wire                               [5:0]   pipe_rx3_eq_lffs,
  input   wire                               [3:0]   pipe_rx3_eq_txpreset,
  output  wire                              [17:0]   pipe_rx3_eq_new_txcoeff,
  output  wire                                       pipe_rx3_eq_lffs_sel,
  output  wire                                       pipe_rx3_eq_adapt_done,
  output  reg                                        pipe_rx3_eqdone,

  // Pipe Per-Lane Signals - Lane 4
  output  wire                               [1:0]   pipe_rx4_char_is_k,
  output  wire                              [31:0]   pipe_rx4_data,
  output  wire                                       pipe_rx4_valid,
  output  wire                                       pipe_rx4_chanisaligned,
  output  wire                               [2:0]   pipe_rx4_status,
  output  wire                                       pipe_rx4_phy_status,
  output  wire                                       pipe_rx4_elec_idle,
  input   wire                                       pipe_rx4_polarity,
  input   wire                                       pipe_tx4_compliance,
  input   wire                               [1:0]   pipe_tx4_char_is_k,
  input   wire                              [31:0]   pipe_tx4_data,
  input   wire                                       pipe_tx4_elec_idle,
  input   wire                               [1:0]   pipe_tx4_powerdown,
  input   wire                               [1:0]   pipe_tx4_eqcontrol,
  input   wire                               [3:0]   pipe_tx4_eqpreset,
  input   wire                               [5:0]   pipe_tx4_eqdeemph,
  output  reg                                        pipe_tx4_eqdone,
  output  wire                              [17:0]   pipe_tx4_eqcoeff,
  input   wire                               [1:0]   pipe_rx4_eqcontrol,
  input   wire                               [2:0]   pipe_rx4_eqpreset,
  input   wire                               [5:0]   pipe_rx4_eq_lffs,
  input   wire                               [3:0]   pipe_rx4_eq_txpreset,
  output  wire                              [17:0]   pipe_rx4_eq_new_txcoeff,
  output  wire                                       pipe_rx4_eq_lffs_sel,
  output  wire                                       pipe_rx4_eq_adapt_done,
  output  reg                                        pipe_rx4_eqdone,

  // Pipe Per-Lane Signals - Lane 5
  output  wire                               [1:0]   pipe_rx5_char_is_k,
  output  wire                              [31:0]   pipe_rx5_data,
  output  wire                                       pipe_rx5_valid,
  output  wire                                       pipe_rx5_chanisaligned,
  output  wire                               [2:0]   pipe_rx5_status,
  output  wire                                       pipe_rx5_phy_status,
  output  wire                                       pipe_rx5_elec_idle,
  input   wire                                       pipe_rx5_polarity,
  input   wire                                       pipe_tx5_compliance,
  input   wire                               [1:0]   pipe_tx5_char_is_k,
  input   wire                              [31:0]   pipe_tx5_data,
  input   wire                                       pipe_tx5_elec_idle,
  input   wire                               [1:0]   pipe_tx5_powerdown,
  input   wire                               [1:0]   pipe_tx5_eqcontrol,
  input   wire                               [3:0]   pipe_tx5_eqpreset,
  input   wire                               [5:0]   pipe_tx5_eqdeemph,
  output  reg                                        pipe_tx5_eqdone,
  output  wire                              [17:0]   pipe_tx5_eqcoeff,
  input   wire                               [1:0]   pipe_rx5_eqcontrol,
  input   wire                               [2:0]   pipe_rx5_eqpreset,
  input   wire                               [5:0]   pipe_rx5_eq_lffs,
  input   wire                               [3:0]   pipe_rx5_eq_txpreset,
  output  wire                              [17:0]   pipe_rx5_eq_new_txcoeff,
  output  wire                                       pipe_rx5_eq_lffs_sel,
  output  wire                                       pipe_rx5_eq_adapt_done,
  output  reg                                        pipe_rx5_eqdone,

  // Pipe Per-Lane Signals - Lane 6
  output  wire                               [1:0]   pipe_rx6_char_is_k,
  output  wire                              [31:0]   pipe_rx6_data,
  output  wire                                       pipe_rx6_valid,
  output  wire                                       pipe_rx6_chanisaligned,
  output  wire                               [2:0]   pipe_rx6_status,
  output  wire                                       pipe_rx6_phy_status,
  output  wire                                       pipe_rx6_elec_idle,
  input   wire                                       pipe_rx6_polarity,
  input   wire                                       pipe_tx6_compliance,
  input   wire                               [1:0]   pipe_tx6_char_is_k,
  input   wire                              [31:0]   pipe_tx6_data,
  input   wire                                       pipe_tx6_elec_idle,
  input   wire                               [1:0]   pipe_tx6_powerdown,
  input   wire                               [1:0]   pipe_tx6_eqcontrol,
  input   wire                               [3:0]   pipe_tx6_eqpreset,
  input   wire                               [5:0]   pipe_tx6_eqdeemph,
  output  reg                                        pipe_tx6_eqdone,
  output  wire                              [17:0]   pipe_tx6_eqcoeff,
  input   wire                               [1:0]   pipe_rx6_eqcontrol,
  input   wire                               [2:0]   pipe_rx6_eqpreset,
  input   wire                               [5:0]   pipe_rx6_eq_lffs,
  input   wire                               [3:0]   pipe_rx6_eq_txpreset,
  output  wire                              [17:0]   pipe_rx6_eq_new_txcoeff,
  output  wire                                       pipe_rx6_eq_lffs_sel,
  output  wire                                       pipe_rx6_eq_adapt_done,
  output  reg                                        pipe_rx6_eqdone,

  // Pipe Per-Lane Signals - Lane 7
  output  wire                               [1:0]   pipe_rx7_char_is_k,
  output  wire                              [31:0]   pipe_rx7_data,
  output  wire                                       pipe_rx7_valid,
  output  wire                                       pipe_rx7_chanisaligned,
  output  wire                               [2:0]   pipe_rx7_status,
  output  wire                                       pipe_rx7_phy_status,
  output  wire                                       pipe_rx7_elec_idle,
  input   wire                                       pipe_rx7_polarity,
  input   wire                                       pipe_tx7_compliance,
  input   wire                               [1:0]   pipe_tx7_char_is_k,
  input   wire                              [31:0]   pipe_tx7_data,
  input   wire                                       pipe_tx7_elec_idle,
  input   wire                               [1:0]   pipe_tx7_powerdown,
  input   wire                               [1:0]   pipe_tx7_eqcontrol,
  input   wire                               [3:0]   pipe_tx7_eqpreset,
  input   wire                               [5:0]   pipe_tx7_eqdeemph,
  output  reg                                        pipe_tx7_eqdone,
  output  wire                              [17:0]   pipe_tx7_eqcoeff,
  input   wire                               [1:0]   pipe_rx7_eqcontrol,
  input   wire                               [2:0]   pipe_rx7_eqpreset,
  input   wire                               [5:0]   pipe_rx7_eq_lffs,
  input   wire                               [3:0]   pipe_rx7_eq_txpreset,
  output  wire                              [17:0]   pipe_rx7_eq_new_txcoeff,
  output  wire                                       pipe_rx7_eq_lffs_sel,
  output  wire                                       pipe_rx7_eq_adapt_done,
  output  reg                                        pipe_rx7_eqdone,

  // Manual PCIe Equalization Control
  input          [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]   pipe_rxeq_user_en,
  input       [(PL_LINK_CAP_MAX_LINK_WIDTH*18)-1:0]   pipe_rxeq_user_txcoeff,
  input          [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]   pipe_rxeq_user_mode,

  // PCI Express signals
  output  wire [ (PL_LINK_CAP_MAX_LINK_WIDTH-1):0]   pci_exp_txn,
  output  wire [ (PL_LINK_CAP_MAX_LINK_WIDTH-1):0]   pci_exp_txp,
  input   wire [ (PL_LINK_CAP_MAX_LINK_WIDTH-1):0]   pci_exp_rxn,
  input   wire [ (PL_LINK_CAP_MAX_LINK_WIDTH-1):0]   pci_exp_rxp,

  //---------- PIPE Clock & Reset Ports ------------------
  input   wire                                       sys_clk,                // Reference clock :pipe_sim
  input   wire                                       sys_rst_n,              // PCLK       | PCLK
  output  wire                                       rec_clk,                // Recovered Clock
  output  wire                                       pipe_pclk,              // Drives [TX/RX]USRCLK in Gen1/Gen2
  output  wire                                       core_clk,
  output  wire                                       user_clk,
  output  wire                                       phy_rdy,
  output  wire                                       mmcm_lock,

  // PCIe DRP (PCIe DRP) Interface
  input                                               drp_rdy,
  input                                    [15:0]     drp_do,

  output                                              drp_clk,
  output                                              drp_en,
  output                                              drp_we,
  output                                   [10:0]     drp_addr,
  output                                   [15:0]     drp_di,

  //---------- External Clock Ports ----------------------
  input                                              PIPE_PCLK_IN,           // PCLK       | PCLK
  input                                              PIPE_RXUSRCLK_IN,       // RXUSERCLK


  input  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]            PIPE_RXOUTCLK_IN,       // RX recovered clock
  input                                              PIPE_DCLK_IN,           // DCLK       | DCLK
  input                                              PIPE_USERCLK1_IN,       // Optional user clock
  input                                              PIPE_USERCLK2_IN,       // Optional user clock
  input                                              PIPE_OOBCLK_IN,         // OOB        | OOB
  input                                              PIPE_MMCM_LOCK_IN,      // Async      | Async
  output                                             PIPE_TXOUTCLK_OUT,      // PCLK       | PCLK
  output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]            PIPE_RXOUTCLK_OUT,      // RX recovered clock (for debug only)
  output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]            PIPE_PCLK_SEL_OUT,      // PCLK       | PCLK
  output                                             PIPE_GEN3_OUT           // PCLK       | PCLK

);


   integer i;

   assign pipe_txeq_lf = 6'd15;
   assign pipe_txeq_fs = 6'd40;

   // Connect clock outputs
   assign rec_clk    = PIPE_PCLK_IN; 
   assign pipe_pclk  = PIPE_PCLK_IN;
   assign core_clk   = PIPE_USERCLK1_IN;
   assign user_clk   = PIPE_USERCLK2_IN;
   assign mmcm_lock  = PIPE_MMCM_LOCK_IN;
   assign PIPE_PCLK_SEL_OUT = (pipe_tx_rate == 2'b10 || pipe_tx_rate == 2'b01) ? 8'b11111111 : 8'b00000000; 
   assign PIPE_GEN3_OUT     = (pipe_tx_rate == 2'b10 ) ? 1'b1 : 1'b0 ; 
   assign PIPE_TXOUTCLK_OUT = sys_clk;

   // Edge detect for pipe_tx_rcvr_det
   reg  pipe_tx_rcvr_det_reg0;
   reg  pipe_tx_rcvr_det_reg1;
   reg  pipe_tx_rcvr_det_reg2;
   wire pipe_tx_rcvr_det_posedge;
   always @ (posedge pipe_pclk  or negedge sys_rst_n) begin
      if (!sys_rst_n) begin
         pipe_tx_rcvr_det_reg0 <= 1'b0;
         pipe_tx_rcvr_det_reg1 <= 1'b0;
         pipe_tx_rcvr_det_reg2 <= 1'b0;
      end else begin
         pipe_tx_rcvr_det_reg0 <= pipe_tx_rcvr_det;
         pipe_tx_rcvr_det_reg1 <= pipe_tx_rcvr_det_reg0;
         pipe_tx_rcvr_det_reg2 <= pipe_tx_rcvr_det_reg1;
      end
   end
   assign pipe_tx_rcvr_det_posedge = ~pipe_tx_rcvr_det_reg2 && pipe_tx_rcvr_det_reg1;

   // Detect Speed Change
   reg pipe_tx_rate_reg0;
   reg det_speed_change;
   always @ (posedge pipe_pclk) begin
      pipe_tx_rate_reg0 <= pipe_tx_rate;
      if (pipe_tx_rate != pipe_tx_rate_reg0) begin
         det_speed_change <= 1'b1;
      end
      else begin
         det_speed_change <= 1'b0;
      end
   end
   
   //State Machine for generating pipe_rx[]_status & pipe_rx[]_phy_status
   reg [2:0] rcvr_det_state;
   reg [7:0] rcvr_det_counter;
   reg [2:0] pipe_rxn_status;
   reg       pipe_rxn_phy_status;
   localparam   DET_IDLE          = 3'b001;
   localparam   DET_STATE1        = 3'b010;
   localparam   DET_STATE2	       = 3'b011;
   localparam   SPEED_CHANGE      = 3'b100;
   always @(posedge pipe_pclk)
     begin if (!sys_rst_n) begin
       rcvr_det_state       <= DET_IDLE ;
       pipe_rxn_status      <= 3'd0;
       pipe_rxn_phy_status  <= 1'b0;
       rcvr_det_counter     <= 8'd0;
     end else case (rcvr_det_state)
     DET_IDLE :    begin
       if (pipe_tx_rcvr_det_posedge) begin
         rcvr_det_state       <= DET_STATE1;
         pipe_rxn_status      <= 3'd3;
         pipe_rxn_phy_status  <= 1'b1;
     		rcvr_det_counter     <= 8'd0;
       end else begin
         rcvr_det_state       <= DET_IDLE ;
        	pipe_rxn_status      <= 3'd0;
        	pipe_rxn_phy_status  <= 1'b0;
     	  rcvr_det_counter     <= 8'd0;
       end
     end
     DET_STATE1 :    begin
       if (rcvr_det_counter == 8'd159) begin
         rcvr_det_state       <= DET_STATE2;
         pipe_rxn_status      <= 3'd0;
         pipe_rxn_phy_status  <= 1'b1;
     		rcvr_det_counter     <= 8'd0;
       end else begin
         rcvr_det_state       <= DET_STATE1;
         pipe_rxn_status      <= 3'd0;
         pipe_rxn_phy_status  <= 1'b0;
     		rcvr_det_counter     <= rcvr_det_counter + 1'b1;
       end
     end
     DET_STATE2 :    begin
       if (det_speed_change == 1'b1) begin
         rcvr_det_state       <= SPEED_CHANGE;
         pipe_rxn_status      <= 3'd0;
         pipe_rxn_phy_status  <= 1'b0;
         rcvr_det_counter     <= 8'd0;
       end else begin
         rcvr_det_state       <= DET_STATE2 ;
         pipe_rxn_status      <= 3'd0;
         pipe_rxn_phy_status  <= 1'b0;
         rcvr_det_counter     <= 8'd0;
       end
     end
     SPEED_CHANGE :    begin
       if (rcvr_det_counter == 8'd159) begin
         rcvr_det_state       <= DET_IDLE;
         pipe_rxn_status      <= 3'd0;
         pipe_rxn_phy_status  <= 1'b1;
     		rcvr_det_counter     <= 8'd0;
         if (pipe_tx_rate == 2'b10) begin
           pipe_rxsync_done   <= 8'b11111111;
         end
       end else begin
     	  rcvr_det_state       <= SPEED_CHANGE ;
         pipe_rxn_status      <= 3'd0;
         pipe_rxn_phy_status  <= 1'b0;
     		rcvr_det_counter     <= rcvr_det_counter + 1'b1;
       end
     end
     default   :  begin
       rcvr_det_state       <= DET_IDLE ;
       pipe_rxn_status      <= 3'd0;
       pipe_rxn_phy_status  <= 1'b0;
       rcvr_det_counter     <= 8'd0;
     end
     endcase
   end
   
   // Edge detect for pipe_rxn_elec_idle
   reg pipe_rxn_elec_idle_reg0;
   reg pipe_rxn_elec_idle_reg1;
   reg pipe_rxn_elec_idle_reg2;
   wire pipe_rxn_elec_idle_posedge;
   wire pipe_rxn_elec_idle_negedge;
   always @ (posedge pipe_pclk  or negedge sys_rst_n) begin // pipe_pclk
     if (!sys_rst_n) begin
       pipe_rxn_elec_idle_reg0 <= 1'b0;
       pipe_rxn_elec_idle_reg1 <= 1'b0;
       pipe_rxn_elec_idle_reg2 <= 1'b0;
     end else begin
       pipe_rxn_elec_idle_reg0 <= pipe_rx0_elec_idle;
       pipe_rxn_elec_idle_reg1 <= pipe_rxn_elec_idle_reg0;
       pipe_rxn_elec_idle_reg2 <= pipe_rxn_elec_idle_reg1;
     end
   end
   assign pipe_rxn_elec_idle_posedge = ~pipe_rxn_elec_idle_reg2  &&  pipe_rxn_elec_idle_reg1;
   assign pipe_rxn_elec_idle_negedge =  pipe_rxn_elec_idle_reg2  && ~pipe_rxn_elec_idle_reg1;
   
   //generate pipe_rxn_valid
   reg pipe_rxn_valid;
   always @ (posedge pipe_pclk  or negedge sys_rst_n) begin // pipe_pclk
     if (!sys_rst_n || pipe_rxn_elec_idle_posedge ) begin
        pipe_rxn_valid <= 1'b0;
     end else if (pipe_rxn_elec_idle_negedge) begin
        pipe_rxn_valid <= 1'b1;
     end else begin
   	   pipe_rxn_valid <= pipe_rxn_valid;
     end
   end
   
   //EQ Constants
   assign pipe_tx_eqfs = 6'd40;
   assign pipe_tx_eqlf = 6'd15;
   
   //Assert phy_rdy_int after some arbitrary time after sys_rst_n
   reg           phy_rdy_int;
   reg    [1:0]  reg_phy_rdy;
   initial begin
      forever begin
         phy_rdy_int <= 1'b0;
         wait (sys_rst_n == 1'b1);
         for (i=0; i<1000; i=i+1) begin
            @(posedge pipe_pclk);
         end
         if (sys_rst_n == 1'b1) begin
            phy_rdy_int <= 1'b1;
         end
         wait (sys_rst_n == 1'b0);
      end
   end
   // Synchronize PHY Ready
   always @ (posedge user_clk or negedge phy_rdy_int) begin
   
     if (!phy_rdy_int)
       reg_phy_rdy[1:0] <= #TCQ 2'b11;
     else
       reg_phy_rdy[1:0] <= #TCQ {reg_phy_rdy[0], 1'b0};
   
   end
   assign  phy_rdy = !reg_phy_rdy[1];
   
   //pipe_rxn_char_is_k : connected hierarchically between RP and EP
   //pipe_rxn_data      : connected hierarchically between RP and EP
   //pipe_rxn_elec_idle : connected hierarchically between RP and EP
   
   // Concatenate/Deconcatenate busses to generate correct GT wrapper and PCIe Block connectivity
   assign pipe_rx0_phy_status = pipe_rxn_phy_status ;
   assign pipe_rx1_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 2 ) ? pipe_rxn_phy_status : 1'b0;
   assign pipe_rx2_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_phy_status : 1'b0;
   assign pipe_rx3_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_phy_status : 1'b0;
   assign pipe_rx4_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_phy_status : 1'b0;
   assign pipe_rx5_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_phy_status : 1'b0;
   assign pipe_rx6_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_phy_status : 1'b0;
   assign pipe_rx7_phy_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_phy_status : 1'b0;
   
   assign pipe_rx0_chanisaligned = pipe_rxn_valid;
   assign pipe_rx1_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 2 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx2_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx3_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx4_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx5_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx6_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx7_chanisaligned = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   
   assign pipe_rx0_status = pipe_rxn_status;
   assign pipe_rx1_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 2 ) ? pipe_rxn_status : 3'b0;
   assign pipe_rx2_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_status : 3'b0;
   assign pipe_rx3_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_status : 3'b0;
   assign pipe_rx4_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_status : 3'b0;
   assign pipe_rx5_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_status : 3'b0;
   assign pipe_rx6_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_status : 3'b0;
   assign pipe_rx7_status = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_status : 3'b0;
   
   assign pipe_rx0_valid = pipe_rxn_valid;
   assign pipe_rx1_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 2 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx2_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx3_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx4_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx5_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx6_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   assign pipe_rx7_valid = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? pipe_rxn_valid : 1'b0;
   
   assign pipe_tx0_eqcoeff = 18'd2;
   assign pipe_tx1_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 2 ) ? 18'd2 : 18'd0;
   assign pipe_tx2_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? 18'd2 : 18'd0;
   assign pipe_tx3_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 4 ) ? 18'd2 : 18'd0;
   assign pipe_tx4_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? 18'd2 : 18'd0;
   assign pipe_tx5_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? 18'd2 : 18'd0;
   assign pipe_tx6_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? 18'd2 : 18'd0;
   assign pipe_tx7_eqcoeff = (PL_LINK_CAP_MAX_LINK_WIDTH >= 8 ) ? 18'd2 : 18'd0;
   
   // Very simple model of pipe_txn_eqdone bits
   always @ (posedge pipe_pclk)
      if (pipe_tx0_eqcontrol != 0)
         pipe_tx0_eqdone <= 1'b1;
      else
         pipe_tx0_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx1_eqcontrol != 0)
         pipe_tx1_eqdone <= 1'b1;
      else
         pipe_tx1_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx2_eqcontrol != 0)
         pipe_tx2_eqdone <= 1'b1;
      else
         pipe_tx2_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx3_eqcontrol != 0)
         pipe_tx3_eqdone <= 1'b1;
      else
         pipe_tx3_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx4_eqcontrol != 0)
         pipe_tx4_eqdone <= 1'b1;
      else
         pipe_tx4_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx5_eqcontrol != 0)
         pipe_tx5_eqdone <= 1'b1;
      else
         pipe_tx5_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx6_eqcontrol != 0)
         pipe_tx6_eqdone <= 1'b1;
      else
         pipe_tx6_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_tx7_eqcontrol != 0)
         pipe_tx7_eqdone <= 1'b1;
      else
         pipe_tx7_eqdone <= 1'b0;
   
   // Very simple model of pipe_rxn_eqdone bits
   always @ (posedge pipe_pclk)
      if (pipe_rx0_eqcontrol != 0)
         pipe_rx0_eqdone <= 1'b1;
      else
         pipe_rx0_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx1_eqcontrol != 0)
         pipe_rx1_eqdone <= 1'b1;
      else
         pipe_rx1_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx2_eqcontrol != 0)
         pipe_rx2_eqdone <= 1'b1;
      else
         pipe_rx2_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx3_eqcontrol != 0)
         pipe_rx3_eqdone <= 1'b1;
      else
         pipe_rx3_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx4_eqcontrol != 0)
         pipe_rx4_eqdone <= 1'b1;
      else
         pipe_rx4_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx5_eqcontrol != 0)
         pipe_rx5_eqdone <= 1'b1;
      else
         pipe_rx5_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx6_eqcontrol != 0)
         pipe_rx6_eqdone <= 1'b1;
      else
         pipe_rx6_eqdone <= 1'b0;
   always @ (posedge pipe_pclk)
      if (pipe_rx7_eqcontrol != 0)
         pipe_rx7_eqdone <= 1'b1;
      else
         pipe_rx7_eqdone <= 1'b0;
   
   
   assign pipe_rx0_eq_new_txcoeff = 18'd0;
   assign pipe_rx1_eq_new_txcoeff = 18'd0;
   assign pipe_rx2_eq_new_txcoeff = 18'd0;
   assign pipe_rx3_eq_new_txcoeff = 18'd0;
   assign pipe_rx4_eq_new_txcoeff = 18'd0;
   assign pipe_rx5_eq_new_txcoeff = 18'd0;
   assign pipe_rx6_eq_new_txcoeff = 18'd0;
   assign pipe_rx7_eq_new_txcoeff = 18'd0;
   
   assign pipe_rx0_eq_lffs_sel = 1'b1;
   assign pipe_rx1_eq_lffs_sel = 1'b1;
   assign pipe_rx2_eq_lffs_sel = 1'b1;
   assign pipe_rx3_eq_lffs_sel = 1'b1;
   assign pipe_rx4_eq_lffs_sel = 1'b1;
   assign pipe_rx5_eq_lffs_sel = 1'b1;
   assign pipe_rx6_eq_lffs_sel = 1'b1;
   assign pipe_rx7_eq_lffs_sel = 1'b1;
   
   assign pipe_rx0_eq_adapt_done = 1'b0;
   assign pipe_rx1_eq_adapt_done = 1'b0;
   assign pipe_rx2_eq_adapt_done = 1'b0;
   assign pipe_rx3_eq_adapt_done = 1'b0;
   assign pipe_rx4_eq_adapt_done = 1'b0;
   assign pipe_rx5_eq_adapt_done = 1'b0;
   assign pipe_rx6_eq_adapt_done = 1'b0;
   assign pipe_rx7_eq_adapt_done = 1'b0;

endmodule


