/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// pcie_hip_s4gx_gen2_x4_128_wrapper - a hand-written Verilog wrapper that instances the core and some convieniences
// Copyright (c) 2011 Atomic Rules LLC - ALL RIGHTS RESERVED

// derrived from the (level:2) _plus level of the megafunction example,
// add/including elements from the (level:1) and (level:0) megafunction example

module pcie_hip_s4gx_gen2_x4_128_wrapper (
  input  wire         sys0_clk,             // System 200 MHz sys0_clk
  input  wire         sys0_rstn,            // System Active-Low sys0 Reset

  input  wire         pcie_clk,             // PCIe 100 MHz reference
  input  wire         pcie_rstn,            // PCIe Active-Low Reset 
  input  wire [3:0]   pcie_rx_in,           // PCIe RX SERDES
  output wire [3:0]   pcie_tx_out,          // PCIe TX SERDES

  output wire         ava_core_clk_out,     // Avalon 125 MHz clock out
  output wire         ava_srstn,            // Avalon Active-Low Reset
  output wire         ava_alive,            // Avalon Alive
  output wire         ava_lnk_up,           // Avalon Link-Up
  output wire [31:0]  ava_debug,            // 32b of Debug Info

  output wire [3:0]   tl_cfg_add,           // Altera Multiplexed Configuration...
  output wire [31:0]  tl_cfg_ctl,
  output wire         tl_cfg_ctl_wr,
  output wire [52:0]  tl_cfg_sts,           // Altera Status...
  output wire         tl_cfg_sts_wr,

  input  wire         rx_st_mask0,          // Avalon RX signalling...
  input  wire         rx_st_ready0,         // downstream traffic
  output wire         rx_st_valid0,
  output wire [7:0]   rx_st_bardec0,
  output wire [15:0]  rx_st_be0,
  output wire [127:0] rx_st_data0,
  output wire         rx_st_sop0,
  output wire         rx_st_eop0,
  output wire         rx_st_empty0,
  output wire         rx_st_err0,

  input  wire [127:0] tx_st_data0,          // Avalon TX signalling...
  input  wire         tx_st_sop0,           // upstream traffic
  input  wire         tx_st_eop0,
  input  wire         tx_st_empty0,
  input  wire         tx_st_valid0,
  input  wire         tx_st_err0,
  output wire         tx_st_ready0,
  output wire [35:0]  tx_cred0,
  output wire         tx_fifo_empty0
);

                                              // 32b of Debug Info
assign ava_debug = { 11'h000,                 // 31:21
                     any_rstn_rr,             // 20 
                     local_rstn,              // 19
                     pcie_rstn,               // 18
                     pll_powerdown,           // 16
                     npor_serdes_pll_locked,  // 16
                     rc_pll_locked,           // 15
                     busy_altgxb_reconfig,    // 14
                     ltssm,                   // 13:9
                     test_out };              // 8:0

// (level:0) wire declarations...
  reg              L0_led;
  reg     [ 24: 0] alive_cnt;
  reg              alive_led;
  wire             any_rstn;
  reg              any_rstn_r   /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
  reg              any_rstn_rr  /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
  wire             local_rstn = sys0_rstn;

  wire refclk        = pcie_clk;
  assign pcie_tx_out = {tx_out3, tx_out2, tx_out1, tx_out0};
  wire rx_in0        = pcie_rx_in[0];
  wire rx_in1        = pcie_rx_in[1];
  wire rx_in2        = pcie_rx_in[2];
  wire rx_in3        = pcie_rx_in[3];
  wire core_clk_out;
  wire pld_clk            = core_clk_out; //TODO: Check that pld_clk can be the 125 MHz output clock
  assign ava_core_clk_out = core_clk_out;
  assign ava_alive   = alive_led;
  assign ava_lnk_up  = L0_led;
  //assign test_in     = 40'h0000000000;  // All zeros provdes the "default behavior"
  assign test_in     = 40'h00_0000_00A8;  // b7="safe_mode", b5=hip, b3=what altera does
  //assign test_in     = 40'h00000000A8;  // Undocumented change suggested by Altera "CW" 2011-06-03
  wire pclk_in       = clk500_out;      // For Gen2, drive pclk_in with clk500_out

  wire             phystatus_ext;
  wire             req_compliance_soft_ctrl;
  wire    [  7: 0] rxdata0_ext;
  wire    [  7: 0] rxdata1_ext;
  wire    [  7: 0] rxdata2_ext;
  wire    [  7: 0] rxdata3_ext;
  wire             rxdatak0_ext;
  wire             rxdatak1_ext;
  wire             rxdatak2_ext;
  wire             rxdatak3_ext;
  wire             rxelecidle0_ext;
  wire             rxelecidle1_ext;
  wire             rxelecidle2_ext;
  wire             rxelecidle3_ext;
  wire             rxpolarity0_ext;
  wire             rxpolarity1_ext;
  wire             rxpolarity2_ext;
  wire             rxpolarity3_ext;
  wire    [  2: 0] rxstatus0_ext;
  wire    [  2: 0] rxstatus1_ext;
  wire    [  2: 0] rxstatus2_ext;
  wire    [  2: 0] rxstatus3_ext;
  wire             rxvalid0_ext;
  wire             rxvalid1_ext;
  wire             rxvalid2_ext;
  wire             rxvalid3_ext;
  wire             safe_mode;
  wire             set_compliance_mode;
  wire    [ 39: 0] test_in;
  wire    [  8: 0] test_out_icm;
  wire             tx_out0;
  wire             tx_out1;
  wire             tx_out2;
  wire             tx_out3;
  wire             txcompl0_ext;
  wire             txcompl1_ext;
  wire             txcompl2_ext;
  wire             txcompl3_ext;
  wire    [  7: 0] txdata0_ext;
  wire    [  7: 0] txdata1_ext;
  wire    [  7: 0] txdata2_ext;
  wire    [  7: 0] txdata3_ext;
  wire             txdatak0_ext;
  wire             txdatak1_ext;
  wire             txdatak2_ext;
  wire             txdatak3_ext;
  wire             txdetectrx_ext;
  wire             txelecidle0_ext;
  wire             txelecidle1_ext;
  wire             txelecidle2_ext;
  wire             txelecidle3_ext;

// (level:1) wire declarations...
  wire    [  6: 0] cpl_err = 7'b0000000;
  wire             cpl_pending = 1'b0;
  wire             cpl_pending_icm;
  wire             fixedclk_serdes;
  wire    [ 11: 0] lmi_addr = 12'h000;
  wire    [ 31: 0] lmi_din  = 32'h0000_0000;
  wire             lmi_rden = 1'b0;
  wire             lmi_wren = 1'b0;
  wire             lmi_ack;
  wire    [ 31: 0] lmi_dout;
  wire    [  4: 0] open_aer_msi_num;
  wire    [  7: 0] open_msi_stream_data0;
  wire             open_msi_stream_valid0;
  wire    [  9: 0] open_pm_data;
  wire             open_rx_st_err0;
  wire    [  4: 0] pex_msi_num = 5'b00000;
  wire    [  4: 0] pex_msi_num_icm;
  wire             reconfig_clk;
  wire             reconfig_clk_locked;
  wire             rx_mask0;
  wire             rx_stream_ready0;
  wire             rx_stream_valid0;
  wire    [  8: 0] test_out_int;
  wire    [ 35: 0] tx_stream_cred0;
  wire    [ 74: 0] tx_stream_data0  = 0;
  wire    [ 74: 0] tx_stream_data0_1 = 0;
  wire             tx_stream_ready0;
  wire             tx_stream_valid0;
  wire             pm_auxpwr = 1'b0;
  wire [9:0]       pm_data   = 9'b000000000;
  wire             pm_event  = 1'b0;
  wire             pme_to_cr = 1'b0;

// (level:2) wire declarations...
  wire             app_int_ack;
  wire             app_int_sts = 1'b0;
  wire    [4:0]    app_msi_num = 5'b00000;
  wire             app_msi_req = 1'b0;
  wire    [2:0]    app_msi_tc  = 3'b000;
  wire             app_msi_ack;
  wire             busy_altgxb_reconfig;
  wire             clk250_out;
  wire             clk500_out;
  wire             crst;
  wire             data_valid;
  wire             dlup_exit;
  wire    [  4: 0] gnd_hpg_ctrler;
  wire             gxb_powerdown;
  wire             hotrst_exit;
  wire             hotrst_exit_altr;
  wire             l2_exit;
  wire    [  3: 0] lane_act;
  wire    [  4: 0] ltssm;
  wire             npor;
  wire             npor_serdes_pll_locked;
  wire             offset_cancellation_reset;
  wire             open_rx_fifo_empty0;
  wire             open_rx_fifo_full0;
  wire             open_tx_fifo_full0;
  wire    [  3: 0] open_tx_fifo_rdptr0;
  wire    [  3: 0] open_tx_fifo_wrptr0;
  wire             otb0;
  wire             otb1;
  wire             pll_powerdown;
  wire             pme_to_sr;
  wire    [  1: 0] powerdown_ext;
  wire             rate_ext;
  wire             rc_pll_locked;
  wire    [ 33: 0] reconfig_fromgxb;
  wire    [  3: 0] reconfig_togxb;
  wire    [  3: 0] rx_eqctrl_out;
  wire    [  2: 0] rx_eqdcgain_out;
  wire             srst;
  wire    [  8: 0] test_out;
  wire    [  4: 0] tx_preemp_0t_out;
  wire    [  4: 0] tx_preemp_1t_out;
  wire    [  4: 0] tx_preemp_2t_out;
  wire    [  2: 0] tx_vodctrl_out;


  // (level:0) assignments...
  assign any_rstn  = pcie_rstn & local_rstn;

  // (level:0) codes...
  always @(posedge core_clk_out or negedge any_rstn)
    begin
    if (any_rstn == 0) begin
        any_rstn_r  <= 0;
        any_rstn_rr <= 0;
    end else begin
        any_rstn_r  <= 1;
        any_rstn_rr <= any_rstn_r;
        if (any_rstn_rr==0) begin
          alive_cnt <= 0;
          alive_led <= 0;
          L0_led    <= 0;
        end else begin
          alive_cnt <= alive_cnt +1;
          alive_led <= alive_cnt[24];
          L0_led    <= (test_out_icm[4 : 0] == 5'b01111);
        end
    end
  end

  // (level:1) assignments...
  assign otb0 = 1'b0;
  assign otb1 = 1'b1;
  assign test_out_icm = test_out_int;
  assign test_out_int = test_out;

  // These next three modules have been copied into the local dir and may be edited

  // (level:1) codes...
  pll1 reconfig_pll (   
      .c0     (reconfig_clk),        //  50 MHz
      .c1     (fixedclk_serdes),     // 125 MHz
      .inclk0 (sys0_clk),            // 200 MHz in
      .locked (reconfig_clk_locked)
    );

  // (level:2) assignments...
  wire pipe_mode = 1'b0;
  assign otb0 = 1'b0;
  assign otb1 = 1'b1;
  assign offset_cancellation_reset = ~reconfig_clk_locked;
  assign reconfig_fromgxb[33 : 17] = 0;
  assign gnd_hpg_ctrler = 0;
  assign gxb_powerdown = ~npor;
  assign hotrst_exit_altr = hotrst_exit;
  assign pll_powerdown = ~npor;
  assign npor_serdes_pll_locked = pcie_rstn & local_rstn & rc_pll_locked;
  assign npor = pcie_rstn & local_rstn;

  // This next core has been copied into the local dir and may be edited
  pcie_hip_s4gx_gen2_x4_128_rs_hip rs_hip (
    .dlup_exit   (dlup_exit),
    .hotrst_exit (hotrst_exit_altr),
    .l2_exit     (l2_exit),
    .ltssm       (ltssm),
    .npor        (npor_serdes_pll_locked),
    .pld_clk     (pld_clk),
    .test_sim    (test_in[0]),
    .app_rstn    (ava_srstn),    // out: Avalon application reset (active-low)
    .crst        (crst),         // out: config reset to hard core...
    .srst        (srst)          // out: sync   reset to hard core...
  );

  // This next cores is from the core's pci_express_compiler-library...
  // support IP from _plus (level:2)...
  altpcie_reconfig_4sgx reconfig (
    .busy             (busy_altgxb_reconfig),
    .data_valid       (data_valid),
    .logical_channel_address (3'b000),
    .offset_cancellation_reset (offset_cancellation_reset),
    .read             (1'b0),
    .reconfig_clk     (reconfig_clk),
    .reconfig_fromgxb (reconfig_fromgxb),
    .reconfig_togxb   (reconfig_togxb),
    .rx_eqctrl        (4'b0000),
    .rx_eqctrl_out    (rx_eqctrl_out),
    .rx_eqdcgain      (3'b000),
    .rx_eqdcgain_out  (rx_eqdcgain_out),
    .tx_preemp_0t     (5'b00000),
    .tx_preemp_0t_out (tx_preemp_0t_out),
    .tx_preemp_1t     (5'b00000),
    .tx_preemp_1t_out (tx_preemp_1t_out),
    .tx_preemp_2t     (5'b00000),
    .tx_preemp_2t_out (tx_preemp_2t_out),
    .tx_vodctrl       (3'b000),
    .tx_vodctrl_out   (tx_vodctrl_out),
    .write_all        (1'b0)
  );

  // Instantiation of the unedited (level:3) core...
  pcie_hip_s4gx_gen2_x4_128 epmap (
      .app_int_ack (app_int_ack), .app_int_sts (app_int_sts), .app_msi_ack (app_msi_ack), .app_msi_num (app_msi_num), .app_msi_req (app_msi_req), .app_msi_tc (app_msi_tc),
      .busy_altgxb_reconfig (busy_altgxb_reconfig), .cal_blk_clk (reconfig_clk), .clk250_out (clk250_out), .clk500_out (clk500_out), .core_clk_out (core_clk_out), .cpl_err (cpl_err),
      .cpl_pending (cpl_pending), .crst (crst), .dlup_exit (dlup_exit), .fixedclk_serdes (fixedclk_serdes), .gxb_powerdown (gxb_powerdown), .hotrst_exit (hotrst_exit),
      .hpg_ctrler (gnd_hpg_ctrler), .l2_exit (l2_exit), .lane_act (lane_act), .lmi_ack (lmi_ack), .lmi_addr (lmi_addr), .lmi_din (lmi_din),
      .lmi_dout (lmi_dout), .lmi_rden (lmi_rden), .lmi_wren (lmi_wren), .ltssm (ltssm), .npor (npor), .pclk_in (pclk_in),
      .pex_msi_num (pex_msi_num), .phystatus_ext (phystatus_ext), .pipe_mode (pipe_mode), .pld_clk (pld_clk), .pll_powerdown (pll_powerdown), .pm_auxpwr (pm_auxpwr),
      .pm_data (pm_data), .pm_event (pm_event), .pme_to_cr (pme_to_cr), .pme_to_sr (pme_to_sr), .powerdown_ext (powerdown_ext), .rate_ext (rate_ext),
      .rc_pll_locked (rc_pll_locked), .reconfig_clk (reconfig_clk), .reconfig_fromgxb (reconfig_fromgxb[16 : 0]), .reconfig_togxb (reconfig_togxb), .refclk (refclk), .rx_fifo_empty0 (open_rx_fifo_empty0),
      .rx_fifo_full0 (open_rx_fifo_full0), .rx_in0 (rx_in0), .rx_in1 (rx_in1), .rx_in2 (rx_in2), .rx_in3 (rx_in3), .rx_st_bardec0 (rx_st_bardec0),
      .rx_st_be0 (rx_st_be0), .rx_st_data0 (rx_st_data0), .rx_st_empty0 (rx_st_empty0), .rx_st_eop0 (rx_st_eop0), .rx_st_err0 (rx_st_err0), .rx_st_mask0 (rx_st_mask0),
      .rx_st_ready0 (rx_st_ready0), .rx_st_sop0 (rx_st_sop0), .rx_st_valid0 (rx_st_valid0), .rxdata0_ext (rxdata0_ext), .rxdata1_ext (rxdata1_ext), .rxdata2_ext (rxdata2_ext),
      .rxdata3_ext (rxdata3_ext), .rxdatak0_ext (rxdatak0_ext), .rxdatak1_ext (rxdatak1_ext), .rxdatak2_ext (rxdatak2_ext), .rxdatak3_ext (rxdatak3_ext), .rxelecidle0_ext (rxelecidle0_ext),
      .rxelecidle1_ext (rxelecidle1_ext), .rxelecidle2_ext (rxelecidle2_ext), .rxelecidle3_ext (rxelecidle3_ext), .rxpolarity0_ext (rxpolarity0_ext), .rxpolarity1_ext (rxpolarity1_ext), .rxpolarity2_ext (rxpolarity2_ext),
      .rxpolarity3_ext (rxpolarity3_ext), .rxstatus0_ext (rxstatus0_ext), .rxstatus1_ext (rxstatus1_ext), .rxstatus2_ext (rxstatus2_ext), .rxstatus3_ext (rxstatus3_ext), .rxvalid0_ext (rxvalid0_ext),
      .rxvalid1_ext (rxvalid1_ext), .rxvalid2_ext (rxvalid2_ext), .rxvalid3_ext (rxvalid3_ext), .srst (srst), .test_in (test_in), .test_out (test_out),
      .tl_cfg_add (tl_cfg_add), .tl_cfg_ctl (tl_cfg_ctl), .tl_cfg_ctl_wr (tl_cfg_ctl_wr), .tl_cfg_sts (tl_cfg_sts), .tl_cfg_sts_wr (tl_cfg_sts_wr), .tx_cred0 (tx_cred0),
      .tx_fifo_empty0 (tx_fifo_empty0), .tx_fifo_full0 (open_tx_fifo_full0), .tx_fifo_rdptr0 (open_tx_fifo_rdptr0), .tx_fifo_wrptr0 (open_tx_fifo_wrptr0), .tx_out0 (tx_out0), .tx_out1 (tx_out1),
      .tx_out2 (tx_out2), .tx_out3 (tx_out3), .tx_st_data0 (tx_st_data0), .tx_st_empty0 (tx_st_empty0), .tx_st_eop0 (tx_st_eop0), .tx_st_err0 (tx_st_err0),
      .tx_st_ready0 (tx_st_ready0), .tx_st_sop0 (tx_st_sop0), .tx_st_valid0 (tx_st_valid0), .txcompl0_ext (txcompl0_ext), .txcompl1_ext (txcompl1_ext), .txcompl2_ext (txcompl2_ext),
      .txcompl3_ext (txcompl3_ext), .txdata0_ext (txdata0_ext), .txdata1_ext (txdata1_ext), .txdata2_ext (txdata2_ext), .txdata3_ext (txdata3_ext), .txdatak0_ext (txdatak0_ext),
      .txdatak1_ext (txdatak1_ext), .txdatak2_ext (txdatak2_ext), .txdatak3_ext (txdatak3_ext), .txdetectrx_ext (txdetectrx_ext), .txelecidle0_ext (txelecidle0_ext), .txelecidle1_ext (txelecidle1_ext),
      .txelecidle2_ext (txelecidle2_ext), .txelecidle3_ext (txelecidle3_ext)
    );

endmodule
