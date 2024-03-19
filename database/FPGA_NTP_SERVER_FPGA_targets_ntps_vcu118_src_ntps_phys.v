//======================================================================
//
// npts_phys.v
// -----------
// This module contains the implementation of Ethernet PHYs. This
// version is heavily based on ther verilog-ethernet VCU118 10G
// example by Alex Forencich.
//
//
// Author: Joachim Strombergson
//
// Copyright 2020-2021 Netnod Internet Exchange i Sverige AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module ntps_phys (
                  input wire           reset,
                  input  wire          clk_125mhz,
                  output wire          areset_clk156,
                  output wire          clk156,

                  // i2c for board management
                  inout  wire          i2c_scl,
                  inout  wire          i2c_sda,

                  // Blinkenlights.
                  output wire [7:0]    led,

                  input wire  [2 : 0]  xphy_config_0,
                  input wire  [2 : 0]  xphy_config_1,
                  input wire  [2 : 0]  xphy_config_2,
                  input wire  [2 : 0]  xphy_config_3,

                 // External ports for QSFP interface 1.
                  output wire          qsfp1_tx1_p,
                  output wire          qsfp1_tx1_n,
                  input  wire          qsfp1_rx1_p,
                  input  wire          qsfp1_rx1_n,
                  output wire          qsfp1_tx2_p,
                  output wire          qsfp1_tx2_n,
                  input  wire          qsfp1_rx2_p,
                  input  wire          qsfp1_rx2_n,
                  output wire          qsfp1_tx3_p,
                  output wire          qsfp1_tx3_n,
                  input  wire          qsfp1_rx3_p,
                  input  wire          qsfp1_rx3_n,
                  output wire          qsfp1_tx4_p,
                  output wire          qsfp1_tx4_n,
                  input  wire          qsfp1_rx4_p,
                  input  wire          qsfp1_rx4_n,
                  input  wire          qsfp1_mgt_refclk_0_p,
                  input  wire          qsfp1_mgt_refclk_0_n,
                  output wire          qsfp1_modsell,
                  output wire          qsfp1_resetl,
                  input  wire          qsfp1_modprsl,
                  input  wire          qsfp1_intl,
                  output wire          qsfp1_lpmode,

                  // XGMII ports for QSFP interface 1.
                  input  wire [63 : 0] qsfp1_xgmii_txd_1,
                  input  wire [7  : 0] qsfp1_xgmii_txc_1,
                  output wire [63 : 0] qsfp1_xgmii_rxd_1,
                  output wire [7  : 0] qsfp1_xgmii_rxc_1,
                  input  wire [63 : 0] qsfp1_xgmii_txd_2,
                  input  wire [7  : 0] qsfp1_xgmii_txc_2,
                  output wire [63 : 0] qsfp1_xgmii_rxd_2,
                  output wire [7  : 0] qsfp1_xgmii_rxc_2,
                  input  wire [63 : 0] qsfp1_xgmii_txd_3,
                  input  wire [7  : 0] qsfp1_xgmii_txc_3,
                  output wire [63 : 0] qsfp1_xgmii_rxd_3,
                  output wire [7  : 0] qsfp1_xgmii_rxc_3,
                  input  wire [63 : 0] qsfp1_xgmii_txd_4,
                  input  wire [7  : 0] qsfp1_xgmii_txc_4,
                  output wire [63 : 0] qsfp1_xgmii_rxd_4,
                  output wire [7  : 0] qsfp1_xgmii_rxc_4

                  );

assign qsfp1_modsell = 1'b0;
  assign qsfp1_resetl  = 1; // xphy_config_0[0]; // & xphy_config_1[0] & xphy_config_2[0] & xphy_config_3[0];
assign qsfp1_lpmode  = 1'b0;

wire [3:0] rx_core_clk;
wire [3:0] rxrecclkout;
wire [3:0] tx_mii_clk;
wire [3:0] rx_clk_out;
wire [3:0] user_rx_reset;
wire [3:0] user_tx_reset;

wire gt_refclk_out;

assign clk156 = tx_mii_clk[0];

sync_reset #(
    .N(4)
)
sync_reset_156mhz_inst (
    .clk(clk156),
    .rst(user_tx_reset[0]),
    .out(areset_clk156)
);

assign rx_core_clk = {4{clk156}};

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
xxv_ethernet_0 xxv_ethernet_0_inst (
  .gt_txp_out({qsfp1_tx1_p,qsfp1_tx2_p,qsfp1_tx3_p,qsfp1_tx4_p}),                                    // output wire [3 : 0] gt_txp_out
  .gt_txn_out({qsfp1_tx1_n,qsfp1_tx2_n,qsfp1_tx3_n,qsfp1_tx4_n}),                                    // output wire [3 : 0] gt_txn_out
  .gt_rxp_in({qsfp1_rx1_p,qsfp1_rx2_p,qsfp1_rx3_p,qsfp1_rx4_p}),                                      // input wire [3 : 0] gt_rxp_in
  .gt_rxn_in({qsfp1_rx1_n,qsfp1_rx2_n,qsfp1_rx3_n,qsfp1_rx4_n}),                                      // input wire [3 : 0] gt_rxn_in

  .rx_core_clk_0(rx_core_clk[0]),                              // input wire rx_core_clk_0
  .rx_core_clk_1(rx_core_clk[1]),                              // input wire rx_core_clk_1
  .rx_core_clk_2(rx_core_clk[2]),                              // input wire rx_core_clk_2
  .rx_core_clk_3(rx_core_clk[3]),                              // input wire rx_core_clk_3

  .txoutclksel_in_0(3'b101),                        // input wire [2 : 0] txoutclksel_in_0
  .rxoutclksel_in_0(3'b101),                        // input wire [2 : 0] rxoutclksel_in_0
  .txoutclksel_in_1(3'b101),                        // input wire [2 : 0] txoutclksel_in_1
  .rxoutclksel_in_1(3'b101),                        // input wire [2 : 0] rxoutclksel_in_1
  .txoutclksel_in_2(3'b101),                        // input wire [2 : 0] txoutclksel_in_2
  .rxoutclksel_in_2(3'b101),                        // input wire [2 : 0] rxoutclksel_in_2
  .txoutclksel_in_3(3'b101),                        // input wire [2 : 0] txoutclksel_in_3
  .rxoutclksel_in_3(3'b101),                        // input wire [2 : 0] rxoutclksel_in_3

  .gtwiz_reset_tx_datapath_0(1'b0),      // input wire gtwiz_reset_tx_datapath_0
  .gtwiz_reset_tx_datapath_1(1'b0),      // input wire gtwiz_reset_tx_datapath_1
  .gtwiz_reset_tx_datapath_2(1'b0),      // input wire gtwiz_reset_tx_datapath_2
  .gtwiz_reset_tx_datapath_3(1'b0),      // input wire gtwiz_reset_tx_datapath_3
  .gtwiz_reset_rx_datapath_0(1'b0),      // input wire gtwiz_reset_rx_datapath_0
  .gtwiz_reset_rx_datapath_1(1'b0),      // input wire gtwiz_reset_rx_datapath_1
  .gtwiz_reset_rx_datapath_2(1'b0),      // input wire gtwiz_reset_rx_datapath_2
  .gtwiz_reset_rx_datapath_3(1'b0),      // input wire gtwiz_reset_rx_datapath_3

  .rxrecclkout_0(rxrecclkout[0]),                              // output wire rxrecclkout_0
  .rxrecclkout_1(rxrecclkout[1]),                              // output wire rxrecclkout_1
  .rxrecclkout_2(rxrecclkout[2]),                              // output wire rxrecclkout_2
  .rxrecclkout_3(rxrecclkout[3]),                              // output wire rxrecclkout_3

  .sys_reset(reset),                                      // input wire sys_reset
  .dclk(clk_125mhz),                                                // input wire dclk

  .tx_mii_clk_0(tx_mii_clk[0]),                                // output wire tx_mii_clk_0
  .tx_mii_clk_1(tx_mii_clk[1]),                                // output wire tx_mii_clk_1
  .tx_mii_clk_2(tx_mii_clk[2]),                                // output wire tx_mii_clk_2
  .tx_mii_clk_3(tx_mii_clk[3]),                                // output wire tx_mii_clk_3
  .rx_clk_out_0(rx_clk_out[0]),                                // output wire rx_clk_out_0
  .rx_clk_out_1(rx_clk_out[1]),                                // output wire rx_clk_out_1
  .rx_clk_out_2(rx_clk_out[2]),                                // output wire rx_clk_out_2
  .rx_clk_out_3(rx_clk_out[3]),                                // output wire rx_clk_out_3

  .gt_refclk_p(qsfp1_mgt_refclk_0_p),                                  // input wire gt_refclk_p
  .gt_refclk_n(qsfp1_mgt_refclk_0_n),                                  // input wire gt_refclk_n
  .gt_refclk_out(gt_refclk_out),                              // output wire gt_refclk_out

  .gtpowergood_out_0(),                      // output wire gtpowergood_out_0
  .gtpowergood_out_1(),                      // output wire gtpowergood_out_1
  .gtpowergood_out_2(),                      // output wire gtpowergood_out_2
  .gtpowergood_out_3(),                      // output wire gtpowergood_out_3

  .rx_reset_0(reset),                                                    // input wire rx_reset_0
  .rx_reset_1(reset),                                                    // input wire rx_reset_1
  .rx_reset_2(reset),                                                    // input wire rx_reset_2
  .rx_reset_3(reset),                                                    // input wire rx_reset_3

  .user_rx_reset_0(user_rx_reset[0]),                                          // output wire user_rx_reset_0
  .user_rx_reset_1(user_rx_reset[1]),                                          // output wire user_rx_reset_1
  .user_rx_reset_2(user_rx_reset[2]),                                          // output wire user_rx_reset_2
  .user_rx_reset_3(user_rx_reset[3]),                                          // output wire user_rx_reset_3

  .rx_mii_d_0(qsfp1_xgmii_rxd_1),                                                    // output wire [63 : 0] rx_mii_d_0
  .rx_mii_d_1(qsfp1_xgmii_rxd_2),                                                    // output wire [63 : 0] rx_mii_d_1
  .rx_mii_d_2(qsfp1_xgmii_rxd_3),                                                    // output wire [63 : 0] rx_mii_d_2
  .rx_mii_d_3(qsfp1_xgmii_rxd_4),                                                    // output wire [63 : 0] rx_mii_d_3
  .rx_mii_c_0(qsfp1_xgmii_rxc_1),                                                    // output wire [7 : 0] rx_mii_c_0
  .rx_mii_c_1(qsfp1_xgmii_rxc_2),                                                    // output wire [7 : 0] rx_mii_c_1
  .rx_mii_c_2(qsfp1_xgmii_rxc_3),                                                    // output wire [7 : 0] rx_mii_c_2
  .rx_mii_c_3(qsfp1_xgmii_rxc_4),                                                    // output wire [7 : 0] rx_mii_c_3

  .ctl_rx_test_pattern_0(1'b0),                              // input wire ctl_rx_test_pattern_0
  .ctl_rx_test_pattern_1(1'b0),                              // input wire ctl_rx_test_pattern_1
  .ctl_rx_test_pattern_2(1'b0),                              // input wire ctl_rx_test_pattern_2
  .ctl_rx_test_pattern_3(1'b0),                              // input wire ctl_rx_test_pattern_3

  .ctl_rx_data_pattern_select_0(1'b0),                // input wire ctl_rx_data_pattern_select_0
  .ctl_rx_data_pattern_select_1(1'b0),                // input wire ctl_rx_data_pattern_select_1
  .ctl_rx_data_pattern_select_2(1'b0),                // input wire ctl_rx_data_pattern_select_2
  .ctl_rx_data_pattern_select_3(1'b0),                // input wire ctl_rx_data_pattern_select_3
  .ctl_rx_test_pattern_enable_0(1'b0),                // input wire ctl_rx_test_pattern_enable_0
  .ctl_rx_test_pattern_enable_1(1'b0),                // input wire ctl_rx_test_pattern_enable_1
  .ctl_rx_test_pattern_enable_2(1'b0),                // input wire ctl_rx_test_pattern_enable_2
  .ctl_rx_test_pattern_enable_3(1'b0),                // input wire ctl_rx_test_pattern_enable_3

  .ctl_rx_prbs31_test_pattern_enable_0(1'b0),  // input wire ctl_rx_prbs31_test_pattern_enable_0
  .ctl_rx_prbs31_test_pattern_enable_1(1'b0),  // input wire ctl_rx_prbs31_test_pattern_enable_1
  .ctl_rx_prbs31_test_pattern_enable_2(1'b0),  // input wire ctl_rx_prbs31_test_pattern_enable_2
  .ctl_rx_prbs31_test_pattern_enable_3(1'b0),  // input wire ctl_rx_prbs31_test_pattern_enable_3

  .stat_rx_framing_err_0(),                              // output wire stat_rx_framing_err_0
  .stat_rx_framing_err_1(),                              // output wire stat_rx_framing_err_1
  .stat_rx_framing_err_2(),                              // output wire stat_rx_framing_err_2
  .stat_rx_framing_err_3(),                              // output wire stat_rx_framing_err_3

  .stat_rx_framing_err_valid_0(),                  // output wire stat_rx_framing_err_valid_0
  .stat_rx_framing_err_valid_1(),                  // output wire stat_rx_framing_err_valid_1
  .stat_rx_framing_err_valid_2(),                  // output wire stat_rx_framing_err_valid_2
  .stat_rx_framing_err_valid_3(),                  // output wire stat_rx_framing_err_valid_3

  .stat_rx_local_fault_0(),                              // output wire stat_rx_local_fault_0
  .stat_rx_local_fault_1(),                              // output wire stat_rx_local_fault_1
  .stat_rx_local_fault_2(),                              // output wire stat_rx_local_fault_2
  .stat_rx_local_fault_3(),                              // output wire stat_rx_local_fault_3

  .stat_rx_block_lock_0(),                                // output wire stat_rx_block_lock_0
  .stat_rx_block_lock_1(),                                // output wire stat_rx_block_lock_1
  .stat_rx_block_lock_2(),                                // output wire stat_rx_block_lock_2
  .stat_rx_block_lock_3(),                                // output wire stat_rx_block_lock_3

  .stat_rx_valid_ctrl_code_0(),                      // output wire stat_rx_valid_ctrl_code_0
  .stat_rx_valid_ctrl_code_1(),                      // output wire stat_rx_valid_ctrl_code_1
  .stat_rx_valid_ctrl_code_2(),                      // output wire stat_rx_valid_ctrl_code_2
  .stat_rx_valid_ctrl_code_3(),                      // output wire stat_rx_valid_ctrl_code_3

  .stat_rx_status_0(),                                        // output wire stat_rx_status_0
  .stat_rx_status_1(),                                        // output wire stat_rx_status_1
  .stat_rx_status_2(),                                        // output wire stat_rx_status_2
  .stat_rx_status_3(),                                        // output wire stat_rx_status_3

  .stat_rx_hi_ber_0(),                                        // output wire stat_rx_hi_ber_0
  .stat_rx_hi_ber_1(),                                        // output wire stat_rx_hi_ber_1
  .stat_rx_hi_ber_2(),                                        // output wire stat_rx_hi_ber_2
  .stat_rx_hi_ber_3(),                                        // output wire stat_rx_hi_ber_3

  .stat_rx_bad_code_0(),                                    // output wire stat_rx_bad_code_0
  .stat_rx_bad_code_1(),                                    // output wire stat_rx_bad_code_1
  .stat_rx_bad_code_2(),                                    // output wire stat_rx_bad_code_2
  .stat_rx_bad_code_3(),                                    // output wire stat_rx_bad_code_3

  .stat_rx_bad_code_valid_0(),                        // output wire stat_rx_bad_code_valid_0
  .stat_rx_bad_code_valid_1(),                        // output wire stat_rx_bad_code_valid_1
  .stat_rx_bad_code_valid_2(),                        // output wire stat_rx_bad_code_valid_2
  .stat_rx_bad_code_valid_3(),                        // output wire stat_rx_bad_code_valid_3

  .stat_rx_error_0(),                                          // output wire [7 : 0] stat_rx_error_0
  .stat_rx_error_1(),                                          // output wire [7 : 0] stat_rx_error_1
  .stat_rx_error_2(),                                          // output wire [7 : 0] stat_rx_error_2
  .stat_rx_error_3(),                                          // output wire [7 : 0] stat_rx_error_3

  .stat_rx_error_valid_0(),                              // output wire stat_rx_error_valid_0
  .stat_rx_error_valid_1(),                              // output wire stat_rx_error_valid_1
  .stat_rx_error_valid_2(),                              // output wire stat_rx_error_valid_2
  .stat_rx_error_valid_3(),                              // output wire stat_rx_error_valid_3

  .stat_rx_fifo_error_0(),                                // output wire stat_rx_fifo_error_0
  .stat_rx_fifo_error_1(),                                // output wire stat_rx_fifo_error_1
  .stat_rx_fifo_error_2(),                                // output wire stat_rx_fifo_error_2
  .stat_rx_fifo_error_3(),                                // output wire stat_rx_fifo_error_3

  .tx_reset_0(reset),                                                    // input wire tx_reset_0
  .tx_reset_1(reset),                                                    // input wire tx_reset_1
  .tx_reset_2(reset),                                                    // input wire tx_reset_2
  .tx_reset_3(reset),                                                    // input wire tx_reset_3

  .user_tx_reset_0(user_tx_reset[0]),                                          // output wire user_tx_reset_0
  .user_tx_reset_1(user_tx_reset[1]),                                          // output wire user_tx_reset_1
  .user_tx_reset_2(user_tx_reset[2]),                                          // output wire user_tx_reset_2
  .user_tx_reset_3(user_tx_reset[3]),                                          // output wire user_tx_reset_3

  .tx_mii_d_0(qsfp1_xgmii_txd_1),                                                    // input wire [63 : 0] tx_mii_d_0
  .tx_mii_d_1(qsfp1_xgmii_txd_2),                                                    // input wire [63 : 0] tx_mii_d_1
  .tx_mii_d_2(qsfp1_xgmii_txd_3),                                                    // input wire [63 : 0] tx_mii_d_2
  .tx_mii_d_3(qsfp1_xgmii_txd_4),                                                    // input wire [63 : 0] tx_mii_d_3
  .tx_mii_c_0(qsfp1_xgmii_txc_1),                                                    // input wire [7 : 0] tx_mii_c_0
  .tx_mii_c_1(qsfp1_xgmii_txc_2),                                                    // input wire [7 : 0] tx_mii_c_1
  .tx_mii_c_2(qsfp1_xgmii_txc_3),                                                    // input wire [7 : 0] tx_mii_c_2
  .tx_mii_c_3(qsfp1_xgmii_txc_4),                                                    // input wire [7 : 0] tx_mii_c_3

  .stat_tx_local_fault_0(),                              // output wire stat_tx_local_fault_0
  .stat_tx_local_fault_1(),                              // output wire stat_tx_local_fault_1
  .stat_tx_local_fault_2(),                              // output wire stat_tx_local_fault_2
  .stat_tx_local_fault_3(),                              // output wire stat_tx_local_fault_3

  .ctl_tx_test_pattern_0(1'b0),                              // input wire ctl_tx_test_pattern_0
  .ctl_tx_test_pattern_1(1'b0),                              // input wire ctl_tx_test_pattern_1
  .ctl_tx_test_pattern_2(1'b0),                              // input wire ctl_tx_test_pattern_2
  .ctl_tx_test_pattern_3(1'b0),                              // input wire ctl_tx_test_pattern_3
  .ctl_tx_test_pattern_enable_0(~xphy_config_0[0]),                // input wire ctl_tx_test_pattern_enable_0
  .ctl_tx_test_pattern_enable_1(~xphy_config_1[0]),                // input wire ctl_tx_test_pattern_enable_1
  .ctl_tx_test_pattern_enable_2(~xphy_config_2[0]),                // input wire ctl_tx_test_pattern_enable_2
  .ctl_tx_test_pattern_enable_3(~xphy_config_3[0]),                // input wire ctl_tx_test_pattern_enable_3
  .ctl_tx_test_pattern_select_0(1'b0),                // input wire ctl_tx_test_pattern_select_0
  .ctl_tx_test_pattern_select_1(1'b0),                // input wire ctl_tx_test_pattern_select_1
  .ctl_tx_test_pattern_select_2(1'b0),                // input wire ctl_tx_test_pattern_select_2
  .ctl_tx_test_pattern_select_3(1'b0),                // input wire ctl_tx_test_pattern_select_3
  .ctl_tx_data_pattern_select_0(1'b0),                // input wire ctl_tx_data_pattern_select_0
  .ctl_tx_data_pattern_select_1(1'b0),                // input wire ctl_tx_data_pattern_select_1
  .ctl_tx_data_pattern_select_2(1'b0),                // input wire ctl_tx_data_pattern_select_2
  .ctl_tx_data_pattern_select_3(1'b0),                // input wire ctl_tx_data_pattern_select_3
  .ctl_tx_test_pattern_seed_a_0(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_a_0
  .ctl_tx_test_pattern_seed_a_1(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_a_1
  .ctl_tx_test_pattern_seed_a_2(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_a_2
  .ctl_tx_test_pattern_seed_a_3(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_a_3
  .ctl_tx_test_pattern_seed_b_0(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_b_0
  .ctl_tx_test_pattern_seed_b_1(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_b_1
  .ctl_tx_test_pattern_seed_b_2(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_b_2
  .ctl_tx_test_pattern_seed_b_3(58'b0),                // input wire [57 : 0] ctl_tx_test_pattern_seed_b_3

  .ctl_tx_prbs31_test_pattern_enable_0(1'b0),  // input wire ctl_tx_prbs31_test_pattern_enable_0
  .ctl_tx_prbs31_test_pattern_enable_1(1'b0),  // input wire ctl_tx_prbs31_test_pattern_enable_1
  .ctl_tx_prbs31_test_pattern_enable_2(1'b0),  // input wire ctl_tx_prbs31_test_pattern_enable_2
  .ctl_tx_prbs31_test_pattern_enable_3(1'b0),  // input wire ctl_tx_prbs31_test_pattern_enable_3

  .gt_loopback_in_0(3'b0),                                        // input wire [2 : 0] gt_loopback_in_0
  .gt_loopback_in_1(3'b0),                                        // input wire [2 : 0] gt_loopback_in_1
  .gt_loopback_in_2(3'b0),                                        // input wire [2 : 0] gt_loopback_in_2
  .gt_loopback_in_3(3'b0)                                        // input wire [2 : 0] gt_loopback_in_3
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

endmodule // ntps_phys

`default_nettype wire

//======================================================================
// EOF ntps_phys.v
//======================================================================
