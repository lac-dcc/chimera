//-----------------------------------------------------------------------------
// Title      : Block level
// Project    : 10GBASE-R
//-----------------------------------------------------------------------------
// File       : ten_gig_eth_pcs_pma_ip_block.v
//-----------------------------------------------------------------------------
// Description: This file is a wrapper for the 10GBASE-R core. It contains the
// 10GBASE-R core, the transceiver and some transceiver-related logic.
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
module ten_gig_eth_pcs_pma_ip_block
  (
  input           dclk,
  input           coreclk,
  input           txusrclk,
  input           txusrclk2,
  output          rxrecclk_out,
  output          txoutclk,
  input           areset,
  input           areset_coreclk,
  input           txuserrdy,
  input           gttxreset,
  input           gtrxreset,
  input           sim_speedup_control,
  input           qplllock,
  input           qplloutclk,
  input           qplloutrefclk,
  input           reset_counter_done,
  input  [63:0]   xgmii_txd,
  input  [7:0]    xgmii_txc,
  output [63:0]   xgmii_rxd,
  output [7:0]    xgmii_rxc,
  output          txp,
  output          txn,
  input           rxp,
  input           rxn,
  input           mdc,
  input           mdio_in,
  output          mdio_out,
  output          mdio_tri,
  input  [4 : 0]  prtad,
  output [7 : 0]  core_status,
  output          tx_resetdone,
  output          rx_resetdone,
  input           signal_detect,
  input           tx_fault,
  output          drp_req,
  input           drp_gnt,
  output          drp_den_o,
  output          drp_dwe_o,
  output [15 : 0] drp_daddr_o,
  output [15 : 0] drp_di_o,
  output          drp_drdy_o,
  output [15 : 0] drp_drpdo_o,
  input           drp_den_i,
  input           drp_dwe_i,
  input  [15 : 0] drp_daddr_i,
  input  [15 : 0] drp_di_i,
  input           drp_drdy_i,
  input  [15 : 0] drp_drpdo_i,
  input [2:0]     pma_pmd_type,
  output          tx_disable);

// for debug
//  wire [447:0] status_vector_i;

  wire [31:0]     gt_txd;
  wire [7:0]      gt_txc;

  wire [31:0]     gt_rxd;
  wire [7:0]      gt_rxc;

  reg [31:0]     gt_rxd_d1;
  reg [7:0]      gt_rxc_d1;
  wire gt0_rxgearboxslip_i;

  wire [2:0] gt0_loopback_i;
  wire gt0_clear_rx_prbs_err_count_i;

  wire rxoutclk;
  wire rxusrclk;
  wire rxusrclk2;
  wire gt0_gtrxreset_i;
  wire gt0_gttxreset_i;
  wire gt0_txpcsreset_i;
  wire gt0_rxpcsreset_i;

  wire rx_prbs31_en;
  wire tx_prbs31_en;

  reg pma_resetout_reg = 1'b0;
  wire pma_resetout_rising;
  reg pcs_resetout_reg = 1'b0;
  wire pcs_resetout_rising;


  wire pma_resetout;
  wire pcs_resetout;

  wire dclk_reset;

  wire [7:0] core_status_i;

  // Aid the detection of a cable/board being pulled
  wire cable_pull_reset_rising_reg;
  wire cable_is_pulled;

  // Aid the detection of a cable/board being plugged back in
  wire cable_unpull_reset_rising_reg;

  wire gt_latclk = 1'b0;
  wire gt0_eyescanreset = 0;
  wire gt0_eyescantrigger = 0;
  wire gt0_rxcdrhold = 0;
  wire gt0_txprbsforceerr = 0;
  wire gt0_txpolarity = 0;
  wire gt0_rxpolarity = 0;
  wire [2:0] gt0_rxrate = 0;
  wire [4:0] gt0_txprecursor = 0;
  wire [4:0] gt0_txpostcursor = 0;
  wire [3:0] gt0_txdiffctrl = 4'b1110;
  wire gt0_eyescandataerror;
  wire [1:0] gt0_txbufstatus;
  wire [2:0] gt0_rxbufstatus;
  wire gt0_txpmareset = 0;
  wire gt0_rxpmareset = 0;
  wire gt0_rxdfelpmreset = 0;
  wire gt0_rxlpmen = 0;
  wire gt0_rxprbserr;
  wire [14:0] gt0_dmonitorout;

  wire gt0_rxuserrdy_i;

  wire gt_progdiv_reset;
  reg signal_detect_comb = 1'b1;
  wire signal_detect_rxusrclk2;
  wire signal_detect_coreclk;

  // 750ms is equivalent to 117188000 cycles of coreclk (6.4ns per cycle)
  // 117188000 in hex = x6FC25A0
  localparam [28:0] MASTER_WATCHDOG_TIMER_RESET = 29'b00110111111000010010110100000;

  reg [28:0] master_watchdog = MASTER_WATCHDOG_TIMER_RESET;
  reg master_watchdog_barking = 1'b0;
  wire core_in_testmode;

  wire qplllock_int = qplllock;

  reg gt0_txresetdone_reg     = 1'b0;
  reg gt0_txresetdone_reg1    = 1'b0;
(* dont_touch = "yes" *) 
  reg gt0_rxresetdone_reg     = 1'b0;
(* dont_touch = "yes" *) 
  reg gt0_rxresetdone_reg_dup = 1'b0;
  reg gt0_rxresetdone_reg1    = 1'b0;




  wire gtrxreset_coreclk;
  wire qplllock_coreclk;
  wire qplllock_txusrclk2;
  wire qplllock_rxusrclk2;

  wire coreclk_reset_tx;
  wire txreset_txusrclk2;
  wire rxreset_rxusrclk2;
  wire areset_rxusrclk2;
  wire areset_txusrclk2;
  wire pma_resetout_rising_rxusrclk2;
  wire resetdone;




  assign rxrecclk_out = rxusrclk2;


  // Local clocking/reset block
  ten_gig_eth_pcs_pma_ip_local_clock_and_reset ten_gig_eth_pcs_pma_ip_local_clock_reset_block
    (
     .areset(areset),
     .coreclk(coreclk),
     .dclk(dclk),
     .txusrclk2(txusrclk2),
     .rxoutclk(rxoutclk),
     .signal_detect(signal_detect),
     .sim_speedup_control(sim_speedup_control),
     .tx_resetdone(tx_resetdone),
     .rx_resetdone(rx_resetdone),
     .pma_resetout_rising(pma_resetout_rising),
     .qplllock_rxusrclk2(qplllock_rxusrclk2),
     .gtrxreset(gt0_gtrxreset_i),
     .coreclk_reset_tx(coreclk_reset_tx),
     .txreset_txusrclk2(txreset_txusrclk2),
     .rxreset_rxusrclk2(rxreset_rxusrclk2),
     .dclk_reset(dclk_reset),
     .areset_rxusrclk2(areset_rxusrclk2),
     .pma_resetout_rising_rxusrclk2(pma_resetout_rising_rxusrclk2),
     .rxuserrdy(gt0_rxuserrdy_i),
     .rxusrclk(rxusrclk),
     .rxusrclk2(rxusrclk2)
    );

  ten_gig_eth_pcs_pma_v6_0_3 #(
      .C_HAS_MDIO                  (1'b1),
      .C_HAS_FEC                   (1'b0),
      .C_HAS_AN                    (1'b0),
      .C_IS_KR                     (1'b0),
      .C_GTTYPE                    (1),
      .C_GTIF_WIDTH                (32),
      .C_NO_EBUFF                  (1'b0),
      .C_IS_32BIT                  (1'b0),
      .C_DP_WIDTH                  (64),
      .C_SPEED10_25                (10),
      .C_REFCLKRATE                (156),
      .C_1588                      (0))
      ten_gig_eth_pcs_pma_ip_core (
      .reset(coreclk_reset_tx),
      .areset_coreclk(areset_coreclk),
      .txreset_txusrclk2(txreset_txusrclk2),
      .rxreset_rxusrclk2(rxreset_rxusrclk2),
      .areset_rxusrclk2(areset_rxusrclk2),
      .dclk_reset(dclk_reset),
      .pma_resetout(pma_resetout),
      .pcs_resetout(pcs_resetout),
      .coreclk(coreclk),
      .txusrclk2(txusrclk2),
      .rxusrclk2(rxusrclk2),
      .dclk(dclk),
      .fr_clk(coreclk),
      .sim_speedup_control(sim_speedup_control),
      .xgmii_txd(xgmii_txd),
      .xgmii_txc(xgmii_txc),
      .xgmii_rxd(xgmii_rxd),
      .xgmii_rxc(xgmii_rxc),
      .mdc(mdc),
      .mdio_in(mdio_in),
      .mdio_out(mdio_out),
      .mdio_tri(mdio_tri),
      .prtad(prtad),
      .configuration_vector(536'b0),
      .status_vector(),
      .core_status(core_status_i),
      .pma_pmd_type(pma_pmd_type),
      .gt_latclk                   (1'b0),
      .txphy_async_gb_latency      (),
      .lfreset                     (1'b0),
      .systemtimer_s_field         (48'b0),
      .systemtimer_ns_field        (32'b0),
      .correction_timer            (64'b0),
      .rxphy_s_field               (),
      .rxphy_ns_field              (),
      .rxphy_correction_timer      (),
      .gt_rxstartofseq             (1'b0),
      .drp_req(drp_req),
      .drp_gnt(drp_gnt),
      .drp_den(drp_den_o),
      .drp_dwe(drp_dwe_o),
      .drp_daddr(drp_daddr_o),
      .drp_di(drp_di_o),
      .drp_drdy(drp_drdy_i),
      .drp_drpdo(drp_drpdo_i),
      .resetdone(resetdone),
      .gt_txd(gt_txd),
      .gt_txc(gt_txc),
      .gt_rxd(gt_rxd_d1),
      .gt_rxc(gt_rxc_d1),
      .gt_slip(gt0_rxgearboxslip_i),
      .signal_detect(signal_detect_comb),
      .tx_fault(tx_fault),
      .tx_disable(tx_disable),
      .tx_prbs31_en(tx_prbs31_en),
      .rx_prbs31_en(rx_prbs31_en),
      .core_in_testmode(core_in_testmode),
      .clear_rx_prbs_err_count(gt0_clear_rx_prbs_err_count_i),
      .loopback_ctrl(gt0_loopback_i),
      .is_eval(),
      .gt_progdiv_reset(),
      .an_enable(1'b0),
      .coeff_minus_1(),
      .coeff_plus_1(),
      .coeff_zero(),
      .txdiffctrl(),
      .training_enable(1'b0),
      .training_addr(21'b0),
      .training_rnw(1'b0),
      .training_wrdata(16'b0),
      .training_ipif_cs(1'b0),
      .training_drp_cs(1'b0),
      .training_rddata(),
      .training_rdack(),
      .training_wrack());

  wire gt0_txresetdone_i;
  wire gt0_rxresetdone_i;


  assign gt_progdiv_reset = 1'b0;

  ten_gig_eth_pcs_pma_ip_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b1))
  gtrxreset_coreclk_sync_i
    (
     .clk(coreclk),
     .rst(gtrxreset),
     .data_in(1'b0),
     .data_out(gtrxreset_coreclk)
    );

  ten_gig_eth_pcs_pma_ip_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b0))
  qplllock_coreclk_sync_i
    (
     .clk(coreclk),
     .rst(!qplllock_int),
     .data_in(1'b1),
     .data_out(qplllock_coreclk)
    );

  ten_gig_eth_pcs_pma_ip_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b0))
  qplllock_txusrclk2_sync_i
    (
     .clk(txusrclk2),
     .rst(!qplllock_int),
     .data_in(1'b1),
     .data_out(qplllock_txusrclk2)
    );

  ten_gig_eth_pcs_pma_ip_ff_synchronizer_rst
    #(
      .C_NUM_SYNC_REGS(5),
      .C_RVAL(1'b0))
  qplllock_rxusrclk2_sync_i
    (
     .clk(rxusrclk2),
     .rst(!qplllock_int),
     .data_in(1'b1),
     .data_out(qplllock_rxusrclk2)
    );

  always @(posedge txusrclk2)
  begin
    gt0_txresetdone_reg  <= gt0_txresetdone_i && qplllock_txusrclk2;
//To resolve CDC-11 Critical Fan-out from launch flop to destination clock 
    gt0_txresetdone_reg1 <= gt0_txresetdone_reg;
  end
  
  always @(posedge rxusrclk2)
  begin
    gt0_rxresetdone_reg     <= gt0_rxresetdone_i && qplllock_rxusrclk2;
//To resolve CDC-11 Critical Fan-out from launch flop to destination clock 
    gt0_rxresetdone_reg_dup <= gt0_rxresetdone_i && qplllock_rxusrclk2;
    gt0_rxresetdone_reg1    <= gt0_rxresetdone_reg;
  end


  wire gt0_txresetdone_i_reg;
  wire gt0_rxresetdone_i_reg;

  wire gt0_rxresetdone_i_reg_rxusrclk2;

  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  gt0_txresetdone_i_sync_i
    (
     .clk(coreclk),
     .data_in(gt0_txresetdone_reg1),
     .data_out(gt0_txresetdone_i_reg)
    );

  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  gt0_rxresetdone_i_sync_i
    (
     .clk(coreclk),
     .data_in(gt0_rxresetdone_reg1),
     .data_out(gt0_rxresetdone_i_reg)
    );

  assign resetdone = gt0_txresetdone_i_reg && gt0_rxresetdone_i_reg;
  assign tx_resetdone = gt0_txresetdone_i_reg;
  assign rx_resetdone = gt0_rxresetdone_i_reg;

  wire [1:0] gt0_txheader_i;
  wire [6:0] gt0_txsequence_i;

  reg gt0_rxbufreset_i = 1'b0;
  wire [2:0] gt0_rxbufstatus_i;


  wire [31:0] gt0_txdata_i;

  assign gt0_txdata_i[0 ] = gt_txd[31];
  assign gt0_txdata_i[1 ] = gt_txd[30];
  assign gt0_txdata_i[2 ] = gt_txd[29];
  assign gt0_txdata_i[3 ] = gt_txd[28];
  assign gt0_txdata_i[4 ] = gt_txd[27];
  assign gt0_txdata_i[5 ] = gt_txd[26];
  assign gt0_txdata_i[6 ] = gt_txd[25];
  assign gt0_txdata_i[7 ] = gt_txd[24];
  assign gt0_txdata_i[8 ] = gt_txd[23];
  assign gt0_txdata_i[9 ] = gt_txd[22];
  assign gt0_txdata_i[10] = gt_txd[21];
  assign gt0_txdata_i[11] = gt_txd[20];
  assign gt0_txdata_i[12] = gt_txd[19];
  assign gt0_txdata_i[13] = gt_txd[18];
  assign gt0_txdata_i[14] = gt_txd[17];
  assign gt0_txdata_i[15] = gt_txd[16];
  assign gt0_txdata_i[16] = gt_txd[15];
  assign gt0_txdata_i[17] = gt_txd[14];
  assign gt0_txdata_i[18] = gt_txd[13];
  assign gt0_txdata_i[19] = gt_txd[12];
  assign gt0_txdata_i[20] = gt_txd[11];
  assign gt0_txdata_i[21] = gt_txd[10];
  assign gt0_txdata_i[22] = gt_txd[9 ];
  assign gt0_txdata_i[23] = gt_txd[8 ];
  assign gt0_txdata_i[24] = gt_txd[7 ];
  assign gt0_txdata_i[25] = gt_txd[6 ];
  assign gt0_txdata_i[26] = gt_txd[5 ];
  assign gt0_txdata_i[27] = gt_txd[4 ];
  assign gt0_txdata_i[28] = gt_txd[3 ];
  assign gt0_txdata_i[29] = gt_txd[2 ];
  assign gt0_txdata_i[30] = gt_txd[1 ];
  assign gt0_txdata_i[31] = gt_txd[0 ];
  assign gt0_txheader_i[0] = gt_txc[1];
  assign gt0_txheader_i[1] = gt_txc[0];
  assign gt0_txsequence_i = {1'b0, gt_txc[7:2]};

  wire [31:0] gt0_rxdata_i;
  wire [1:0] gt0_rxheader_i;
  wire gt0_rxheadervalid_i;
  wire gt0_rxdatavalid_i;
  wire gt0_rxstartofseq_i;

  assign gt_rxd[0 ] = gt0_rxdata_i[31];
  assign gt_rxd[1 ] = gt0_rxdata_i[30];
  assign gt_rxd[2 ] = gt0_rxdata_i[29];
  assign gt_rxd[3 ] = gt0_rxdata_i[28];
  assign gt_rxd[4 ] = gt0_rxdata_i[27];
  assign gt_rxd[5 ] = gt0_rxdata_i[26];
  assign gt_rxd[6 ] = gt0_rxdata_i[25];
  assign gt_rxd[7 ] = gt0_rxdata_i[24];
  assign gt_rxd[8 ] = gt0_rxdata_i[23];
  assign gt_rxd[9 ] = gt0_rxdata_i[22];
  assign gt_rxd[10] = gt0_rxdata_i[21];
  assign gt_rxd[11] = gt0_rxdata_i[20];
  assign gt_rxd[12] = gt0_rxdata_i[19];
  assign gt_rxd[13] = gt0_rxdata_i[18];
  assign gt_rxd[14] = gt0_rxdata_i[17];
  assign gt_rxd[15] = gt0_rxdata_i[16];
  assign gt_rxd[16] = gt0_rxdata_i[15];
  assign gt_rxd[17] = gt0_rxdata_i[14];
  assign gt_rxd[18] = gt0_rxdata_i[13];
  assign gt_rxd[19] = gt0_rxdata_i[12];
  assign gt_rxd[20] = gt0_rxdata_i[11];
  assign gt_rxd[21] = gt0_rxdata_i[10];
  assign gt_rxd[22] = gt0_rxdata_i[9 ];
  assign gt_rxd[23] = gt0_rxdata_i[8 ];
  assign gt_rxd[24] = gt0_rxdata_i[7 ];
  assign gt_rxd[25] = gt0_rxdata_i[6 ];
  assign gt_rxd[26] = gt0_rxdata_i[5 ];
  assign gt_rxd[27] = gt0_rxdata_i[4 ];
  assign gt_rxd[28] = gt0_rxdata_i[3 ];
  assign gt_rxd[29] = gt0_rxdata_i[2 ];
  assign gt_rxd[30] = gt0_rxdata_i[1 ];
  assign gt_rxd[31] = gt0_rxdata_i[0 ];
  assign gt_rxc = {4'b0000, gt0_rxheadervalid_i,gt0_rxdatavalid_i, gt0_rxheader_i[0], gt0_rxheader_i[1]};

  always @(posedge rxusrclk2) begin
    gt_rxc_d1 <= gt_rxc;
    gt_rxd_d1 <= gt_rxd;
  end

  // The route from the GT to the fabric for this signal may be longer than the clock period
  // so add a synchronizer
  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  gt0_rxresetdone_i_reg_rxusrclk2_sync_i
    (
     .clk(rxusrclk2),
     .data_in(gt0_rxresetdone_reg_dup),
     .data_out(gt0_rxresetdone_i_reg_rxusrclk2)
    );

  // Create a watchdog which samples 4 bits from the gt_rxd vector and checks that it does
  // vary from a 1010 or 0101 or 0000 pattern. If not then there may well have been a cable pull
  // and the gt rx side needs to be reset.
  ten_gig_eth_pcs_pma_ip_cable_pull_logic cable_pull_logic_i
  (
    .coreclk(coreclk),
    .rxusrclk2(rxusrclk2),
    .areset_rxusrclk2(areset_rxusrclk2),
    .pma_resetout_rising_rxusrclk2(pma_resetout_rising_rxusrclk2),
    .gt0_rxresetdone_i_reg_rxusrclk2(gt0_rxresetdone_i_reg_rxusrclk2),
    .gearboxslip(gt0_rxgearboxslip_i),
    .rx_sample_in(gt_rxd[7:4]),
    .cable_pull_reset_rising_reg(cable_pull_reset_rising_reg),
    .cable_unpull_reset_rising_reg(cable_unpull_reset_rising_reg),
    .cable_is_pulled(cable_is_pulled));

  // Sync the sig_det signal to the rxusrclk2 domain
  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  signal_detect_rxusrclk2_sync_i
    (
     .clk(rxusrclk2),
     .data_in(signal_detect),
     .data_out(signal_detect_rxusrclk2)
    );

  // Create the signal_detect signal as an AND of the external signal and (not) the local cable_is_pulled
  always @(posedge rxusrclk2)
  begin
    signal_detect_comb <= signal_detect_rxusrclk2 && !cable_is_pulled;
  end

  assign core_status = core_status_i;



  always @(posedge coreclk)
  begin
    if(areset_coreclk)
      pma_resetout_reg <= 1'b0;
    else
      pma_resetout_reg <= pma_resetout;
  end

  assign pma_resetout_rising = pma_resetout && !pma_resetout_reg;

  always @(posedge coreclk)
  begin
    if(areset_coreclk)
      pcs_resetout_reg <= 1'b0;
    else
      pcs_resetout_reg <= pcs_resetout;
  end

  assign pcs_resetout_rising = pcs_resetout && !pcs_resetout_reg;


  // Sync the sig_det signal to the coreclk domain
  ten_gig_eth_pcs_pma_ip_ff_synchronizer
    #(
      .C_NUM_SYNC_REGS(5))
  signal_detect_coreclk_sync_i
    (
     .clk(coreclk),
     .data_in(signal_detect),
     .data_out(signal_detect_coreclk)
    );

  // Create a master reset watchdog which toggles GTRXRESET after 750ms of not getting to PCS Block Lock
  always @(posedge coreclk)
  begin
    if(resetdone == 1'b0 || core_status_i[0] == 1'b1 || core_in_testmode == 1'b1)
      master_watchdog <= MASTER_WATCHDOG_TIMER_RESET;
    else
      master_watchdog <= master_watchdog - 1;
  end

  always @(master_watchdog)
  begin
    if (master_watchdog == 0)
      master_watchdog_barking = 1'b1;
    else
      master_watchdog_barking = 1'b0;
  end

  // Incorporate the pma_resetout_rising and cable_pull/unpull_reset_rising bits generated in code below.
  assign  gt0_gtrxreset_i = (gtrxreset_coreclk || !qplllock_coreclk || pma_resetout_rising || !signal_detect_coreclk || master_watchdog_barking ||
                             cable_pull_reset_rising_reg || cable_unpull_reset_rising_reg) && reset_counter_done;
  assign  gt0_gttxreset_i = (gttxreset || !qplllock_coreclk || pma_resetout_rising) && reset_counter_done;

  assign  gt0_rxpcsreset_i = pcs_resetout_rising;
  assign  gt0_txpcsreset_i = pcs_resetout_rising;

  // reset the GT RX Buffer when over/underflowing
  always @(posedge rxusrclk2)
  begin
    if(gt0_rxbufstatus_i[2] == 1'b1 && gt0_rxresetdone_i_reg_rxusrclk2)
      gt0_rxbufreset_i <= 1'b1;
    else
      gt0_rxbufreset_i <= 1'b0;
  end


    ten_gig_eth_pcs_pma_ip_gtwizard_gth_10gbaser_multi_GT #
    (
        // Simulation attributes
        .EXAMPLE_SIMULATION       (0),
        .WRAPPER_SIM_GTRESET_SPEEDUP   ("TRUE")
    )
    gt0_gtwizard_10gbaser_multi_gt_i
    (
        //-------------------------------- Channel ---------------------------------
        .gt0_qplloutclk_in                  (qplloutclk),
        .gt0_qplloutrefclk_in               (qplloutrefclk),
        //-------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
        .gt0_drpaddr_in                     (drp_daddr_i[8:0]),
        .gt0_drpclk_in                      (dclk),
        .gt0_drpdi_in                       (drp_di_i),
        .gt0_drpdo_out                      (drp_drpdo_o),
        .gt0_drpen_in                       (drp_den_i),
        .gt0_drprdy_out                     (drp_drdy_o),
        .gt0_drpwe_in                       (drp_dwe_i),
        //---------------------- Loopback and Powerdown Ports ----------------------
        .gt0_loopback_in                    (gt0_loopback_i),
        //----------------------------- Receive Ports ------------------------------
        .gt0_rxuserrdy_in                   (gt0_rxuserrdy_i),
 //------------ Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
        .gt0_rxdatavalid_out                (gt0_rxdatavalid_i),
        .gt0_rxgearboxslip_in               (gt0_rxgearboxslip_i),
        .gt0_rxheader_out                   (gt0_rxheader_i),
        .gt0_rxheadervalid_out              (gt0_rxheadervalid_i),
        //--------------------- Receive Ports - PRBS Detection ---------------------
        .gt0_rxprbscntreset_in              (gt0_clear_rx_prbs_err_count_i),
        .gt0_rxprbserr_out                  (gt0_rxprbserr),
        .gt0_rxprbssel_in                   ({rx_prbs31_en,2'b00}),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .gt0_gtrxreset_in                   (gt0_gtrxreset_i),
        .gt0_rxdata_out                     (gt0_rxdata_i),
        .gt0_rxdfeagchold_in                (1'b0),
        .gt0_rxoutclk_out                   (rxoutclk),
        .gt0_rxpcsreset_in                  (gt0_rxpcsreset_i),
        .gt0_rxpmareset_in                  (gt0_rxpmareset),
        .gt0_rxpmaresetdone_out             (),
        .gt0_rxusrclk_in                    (rxusrclk),
        .gt0_rxusrclk2_in                   (rxusrclk2),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .gt0_gthrxn_in                      (rxn),
        .gt0_gthrxp_in                      (rxp),
        //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        .gt0_rxbufreset_in                  (gt0_rxbufreset_i),
        .gt0_rxbufstatus_out                (gt0_rxbufstatus_i),
        //------------------- Receive Ports - RX Equalizer Ports -------------------
        .gt0_rxdfelpmreset_in               (gt0_rxdfelpmreset),
        //---------------------- Receive Ports - RX Equalizer ----------------------
        .gt0_rxlpmen_in                     (gt0_rxlpmen),
        //---------------------- Receive Ports - RX PLL Ports ----------------------
        .gt0_rxresetdone_out                (gt0_rxresetdone_i),
        //----------------------------- Transmit Ports -----------------------------
        .gt0_txuserrdy_in                   (txuserrdy),
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        .gt0_txheader_in                    (gt0_txheader_i),
        .gt0_txsequence_in                  (gt0_txsequence_i),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .gt0_gttxreset_in                   (gt0_gttxreset_i),
        .gt0_txdata_in                      (gt0_txdata_i),
        .gt0_txoutclk_out                   (txoutclk),
        .gt0_txoutclkfabric_out             (),
        .gt0_txoutclkpcs_out                (),
        .gt0_txpcsreset_in                  (gt0_txpcsreset_i),
        .gt0_txpmareset_in                  (gt0_txpmareset),
        .gt0_txusrclk_in                    (txusrclk),
        .gt0_txusrclk2_in                   (txusrclk2),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .gt0_gthtxn_out                     (txn),
        .gt0_gthtxp_out                     (txp),
        .gt0_txinhibit_in                   (tx_disable),
        .gt0_txprecursor_in                 (gt0_txprecursor),
        .gt0_txpostcursor_in                (gt0_txpostcursor),
        .gt0_txmaincursor_in                (7'b0),
        .gt0_txdiffctrl_in                  (gt0_txdiffctrl),
        //--------------------- Transmit Ports - TX PLL Ports ----------------------
        .gt0_txresetdone_out                (gt0_txresetdone_i),
        //------------------- Transceiver Debug Ports ------------------------------
        .gt0_eyescanreset_in                (gt0_eyescanreset),
        .gt0_eyescantrigger_in              (gt0_eyescantrigger),
        .gt0_rxcdrhold_in                   (gt0_rxcdrhold),
        .gt0_txprbsforceerr_in              (gt0_txprbsforceerr),
        .gt0_txpolarity_in                  (gt0_txpolarity),
        .gt0_rxpolarity_in                  (gt0_rxpolarity),
        .gt0_rxrate_in                      (gt0_rxrate),
        .gt0_eyescandataerror_out           (gt0_eyescandataerror),
        .gt0_txbufstatus_out                (gt0_txbufstatus),
        .gt0_dmonitorout_out                (gt0_dmonitorout),
        //------------------- Transmit Ports - TX PRBS Generator -------------------
        .gt0_txprbssel_in                   ({tx_prbs31_en,2'b00})

    );


// For debug
//assign status_vector[436:0] = status_vector_i[436:0];
//assign status_vector[437] = gt_progdiv_reset;
//assign status_vector[438] = reset_rx_bufg_gt;
//assign status_vector[439] = reset_tx_bufg_gt;
//assign status_vector[440] = tx_resetdone;
//assign status_vector[441] = rx_resetdone;
//assign status_vector[442] = master_watchdog_barking;
//assign status_vector[443] = cable_pull_reset_rising_reg;
//assign status_vector[444] = cable_unpull_reset_rising_reg;
//assign status_vector[445] = rxprogdivresetdone_rising;
//assign status_vector[446] = gtrxreset_in;
//assign status_vector[447] = gttxreset_in;


endmodule



