//======================================================================
//
// npts_interfaces.v
// -----------------
// This module contains the external interfaces used in the
// ntps FPGA design.
//
//
// Author: Joachim Strombergson
//
// Copyright 2020-2022 Netnod AB
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

module ntps_interfaces
  #(
    parameter NUM_PATHS = 1,
    parameter NUM_SLAVES = 8
    )
   (
    input wire            refclk,
    input wire            reset,

    input wire            clk156,
    input wire            areset_clk156,

    input wire [31:0] phy_debug,

    // AXI interface
    input wire         axi_aresetn,
    input wire         axi_aclk,
    input  wire [NUM_SLAVES*32-1:0]   axil_awaddr,
    input  wire [NUM_SLAVES*3-1:0]    axil_awprot,
    input  wire [NUM_SLAVES-1:0]      axil_awvalid,
    output wire [NUM_SLAVES-1:0]      axil_awready,
    input  wire [NUM_SLAVES*32-1:0]   axil_wdata,
    input  wire [NUM_SLAVES*4-1:0]    axil_wstrb,
    input  wire [NUM_SLAVES-1:0]      axil_wvalid,
    output wire [NUM_SLAVES-1:0]      axil_wready,
    output wire [NUM_SLAVES*2-1:0]    axil_bresp,
    output wire [NUM_SLAVES-1:0]      axil_bvalid,
    input  wire [NUM_SLAVES-1:0]      axil_bready,
    input  wire [NUM_SLAVES*32-1:0]   axil_araddr,
    input  wire [NUM_SLAVES*3-1:0]    axil_arprot,
    input  wire [NUM_SLAVES-1:0]      axil_arvalid,
    output wire [NUM_SLAVES-1:0]      axil_arready,
    output wire [NUM_SLAVES*32-1:0]   axil_rdata,
    output wire [NUM_SLAVES*2-1:0]    axil_rresp,
    output wire [NUM_SLAVES-1:0]      axil_rvalid,
    input  wire [NUM_SLAVES-1:0]      axil_rready,

    input wire            user_link_up,

    // 10Gbit ports
    output wire [32*NUM_PATHS-1 : 0] gen_config,
    input  wire [ 5*NUM_PATHS-1 : 0] xphy_status,

    output wire [64*NUM_PATHS-1 : 0] xgmii_txd,
    output wire [ 8*NUM_PATHS-1 : 0] xgmii_txc,
    input  wire [64*NUM_PATHS-1 : 0] xgmii_rxd,
    input  wire [ 8*NUM_PATHS-1 : 0] xgmii_rxc,

    // NTP clocks.
    input wire            PPS_INA,
    output wire           PPS_OUTA,
    input wire            TEN_MHZ_INA,
    output wire           TEN_MHZ_OUTA,
    output wire           NTP_LED1A,
    output wire           NTP_LED2A,
    output wire           PLL_LOCKEDA,

    input wire            PPS_INB,
    output wire           PPS_OUTB,
    input wire            TEN_MHZ_INB,
    output wire           TEN_MHZ_OUTB,
    output wire           NTP_LED1B,
    output wire           NTP_LED2B,
    output wire           PLL_LOCKEDB
   );


  //----------------------------------------------------------------
  // Local parameters.
  //----------------------------------------------------------------
  localparam AXI_NTPA    = 0;
  localparam AXI_NTPB    = 1;
  localparam AXI_ETHLITE = 2;
  localparam AXI_PVT     = 3;
  localparam AXI_NP0     = 4;
  localparam AXI_NP1     = 5;
  localparam AXI_NP2     = 6;
  localparam AXI_NP3     = 7;

  genvar ii;

  //----------------------------------------------------------------
  // Internal wires.
  //----------------------------------------------------------------

  // Time from clock input A
  wire [63 : 0]    ntp_time_a;
  wire             ntp_time_upd_a;
  wire             ntp_sync_ok_a;

  // Time from clock input B
  wire [63 : 0]    ntp_time_b;
  wire             ntp_time_upd_b;
  wire             ntp_sync_ok_b;

  // Time used for timestamping
  wire [63 : 0]    ntp_time;
  wire             ntp_sync_ok;

  // API extension bus
  wire [ 2*NUM_PATHS-1 : 0] api_ext_command;
  wire [32*NUM_PATHS-1 : 0] api_ext_address;
  wire [32*NUM_PATHS-1 : 0] api_ext_write_data;
  wire [ 2*NUM_PATHS-1 : 0] api_ext_status;
  wire [32*NUM_PATHS-1 : 0] api_ext_read_data;


  //----------------------------------------------------------------
  // NTP clocks.
  //----------------------------------------------------------------
  ntp_clock_top ntp_clock_topA (
    .reset        (reset),
    .TEN_MHZ_IN   (TEN_MHZ_INA),
    .TEN_MHZ_OUT  (TEN_MHZ_OUTA),
    .PPS_IN       (PPS_INA),
    .PPS_OUT      (PPS_OUTA),
    .axi_aclk     (axi_aclk),
    .axi_aresetn  (axi_aresetn),
    .axi_araddr   (axil_araddr [(AXI_NTPA * 32) +: 5]),
    .axi_arprot   (axil_arprot [(AXI_NTPA * 3) +: 3]),
    .axi_arready  (axil_arready[(AXI_NTPA * 1) +: 1]),
    .axi_arvalid  (axil_arvalid[(AXI_NTPA * 1) +: 1]),
    .axi_awaddr   (axil_awaddr [(AXI_NTPA * 32) +: 5]),
    .axi_awprot   (axil_awprot [(AXI_NTPA * 3) +: 3]),
    .axi_awready  (axil_awready[(AXI_NTPA * 1) +: 1]),
    .axi_awvalid  (axil_awvalid[(AXI_NTPA * 1) +: 1]),
    .axi_bready   (axil_bready [(AXI_NTPA * 1) +: 1]),
    .axi_bresp    (axil_bresp  [(AXI_NTPA * 2) +: 2]),
    .axi_bvalid   (axil_bvalid [(AXI_NTPA * 1) +: 1]),
    .axi_rdata    (axil_rdata  [(AXI_NTPA * 32) +: 32]),
    .axi_rready   (axil_rready [(AXI_NTPA * 1) +: 1]),
    .axi_rresp    (axil_rresp  [(AXI_NTPA * 2) +: 2]),
    .axi_rvalid   (axil_rvalid [(AXI_NTPA * 1) +: 1]),
    .axi_wdata    (axil_wdata  [(AXI_NTPA * 32) +: 32]),
    .axi_wready   (axil_wready [(AXI_NTPA * 1) +: 1]),
    .axi_wstrb    (axil_wstrb  [(AXI_NTPA * 32/8) +: 32/8]),
    .axi_wvalid   (axil_wvalid [(AXI_NTPA * 1) +: 1]),
    .NTP_TIME     (ntp_time_a),
    .NTP_TIME_UPD (ntp_time_upd_a),
    .PLL_locked   (PLL_LOCKEDA),
    .LED1         (NTP_LED1A),
    .LED2         (NTP_LED2A),
    .LED3         (),
    .LED4         (),
    .LED5         (),
    .LED6         (),
    .LED7         (),
    .LED8         (),
    .SYNC_OK      (ntp_sync_ok_a),
    .test         ()
    );


  ntp_clock_top ntp_clock_topB (
    .reset        (reset),
    .TEN_MHZ_IN   (TEN_MHZ_INB),
    .TEN_MHZ_OUT  (TEN_MHZ_OUTB),
    .PPS_IN       (PPS_INB),
    .PPS_OUT      (PPS_OUTB),
    .axi_aclk     (axi_aclk),
    .axi_aresetn  (axi_aresetn),
    .axi_araddr   (axil_araddr [(AXI_NTPB * 32) +: 5]),
    .axi_arprot   (axil_arprot [(AXI_NTPB * 3) +: 3]),
    .axi_arready  (axil_arready[(AXI_NTPB * 1) +: 1]),
    .axi_arvalid  (axil_arvalid[(AXI_NTPB * 1) +: 1]),
    .axi_awaddr   (axil_awaddr [(AXI_NTPB * 32) +: 5]),
    .axi_awprot   (axil_awprot [(AXI_NTPB * 3) +: 3]),
    .axi_awready  (axil_awready[(AXI_NTPB * 1) +: 1]),
    .axi_awvalid  (axil_awvalid[(AXI_NTPB * 1) +: 1]),
    .axi_bready   (axil_bready [(AXI_NTPB * 1) +: 1]),
    .axi_bresp    (axil_bresp  [(AXI_NTPB * 2) +: 2]),
    .axi_bvalid   (axil_bvalid [(AXI_NTPB * 1) +: 1]),
    .axi_rdata    (axil_rdata  [(AXI_NTPB * 32) +: 32]),
    .axi_rready   (axil_rready [(AXI_NTPB * 1) +: 1]),
    .axi_rresp    (axil_rresp  [(AXI_NTPB * 2) +: 2]),
    .axi_rvalid   (axil_rvalid [(AXI_NTPB * 1) +: 1]),
    .axi_wdata    (axil_wdata  [(AXI_NTPB * 32) +: 32]),
    .axi_wready   (axil_wready [(AXI_NTPB * 1) +: 1]),
    .axi_wstrb    (axil_wstrb  [(AXI_NTPB * 32/8) +: 32/8]),
    .axi_wvalid   (axil_wvalid [(AXI_NTPB * 1) +: 1]),
    .NTP_TIME     (ntp_time_b),
    .NTP_TIME_UPD (ntp_time_upd_b),
    .PLL_locked   (PLL_LOCKEDB),
    .LED1         (NTP_LED1B),
    .LED2         (NTP_LED2B),
    .LED3         (),
    .LED4         (),
    .LED5         (),
    .LED6         (),
    .LED7         (),
    .LED8         (),
    .SYNC_OK      (ntp_sync_ok_b),
    .test         ()
    );


  //----------------------------------------------------------------
  // Common NTP clock select. Controlled by Port 0 config.
  //----------------------------------------------------------------
  ntp_clock_select ntp_clock_select_inst (
    .select         (gen_config[24]),
    .ntp_time_a     (ntp_time_a),
    .ntp_time_upd_a (ntp_time_upd_a),
    .ntp_time_b     (ntp_time_b),
    .ntp_time_upd_b (ntp_time_upd_b),
    .ntp_sync_ok_a  (ntp_sync_ok_a),
    .ntp_sync_ok_b  (ntp_sync_ok_b),
    .ntp_time       (ntp_time),
    .ntp_sync_ok    (ntp_sync_ok),
    .clk156         (clk156),

    .reset          (reset)
    );


  //----------------------------------------------------------------
  // Ethernet lite module for MDIO control only.
  //----------------------------------------------------------------
  ntps_top_axi_ethernetlite_0_0 mdio_axi_ethernetlite_inst (
    .phy_col       (1'b0),
    .phy_crs       (1'b0),
    .phy_dv        (1'b0),
    .phy_mdc       (),
    .phy_mdio_i    (),
    .phy_mdio_o    (),
    .phy_rx_clk    (1'b0),
    .phy_rx_data   (4'b0),
    .phy_rx_er     (1'b0),
    .phy_tx_clk    (1'b0),
    .phy_rst_n     (),
    .phy_tx_en     (),
    .phy_tx_data   (),
    .phy_mdio_t    (),
    .ip2intc_irpt  (),
    .s_axi_aclk    (axi_aclk),
    .s_axi_aresetn (axi_aresetn),
    .s_axi_araddr  (axil_araddr [(AXI_ETHLITE * 32) +: 13]),
    .s_axi_arready (axil_arready[(AXI_ETHLITE * 1) +: 1]),
    .s_axi_arvalid (axil_arvalid[(AXI_ETHLITE * 1) +: 1]),
    .s_axi_awaddr  (axil_awaddr [(AXI_ETHLITE * 32) +: 13]),
    .s_axi_awready (axil_awready[(AXI_ETHLITE * 1) +: 1]),
    .s_axi_awvalid (axil_awvalid[(AXI_ETHLITE * 1) +: 1]),
    .s_axi_bready  (axil_bready [(AXI_ETHLITE * 1) +: 1]),
    .s_axi_bresp   (axil_bresp  [(AXI_ETHLITE * 2) +: 2]),
    .s_axi_bvalid  (axil_bvalid [(AXI_ETHLITE * 1) +: 1]),
    .s_axi_rdata   (axil_rdata  [(AXI_ETHLITE * 32) +: 32]),
    .s_axi_rready  (axil_rready [(AXI_ETHLITE * 1) +: 1]),
    .s_axi_rresp   (axil_rresp  [(AXI_ETHLITE * 2) +: 2]),
    .s_axi_rvalid  (axil_rvalid [(AXI_ETHLITE * 1) +: 1]),
    .s_axi_wdata   (axil_wdata  [(AXI_ETHLITE * 32) +: 32]),
    .s_axi_wready  (axil_wready [(AXI_ETHLITE * 1) +: 1]),
    .s_axi_wstrb   (axil_wstrb  [(AXI_ETHLITE * 32/8) +: 32/8]),
    .s_axi_wvalid  (axil_wvalid [(AXI_ETHLITE * 1) +: 1])
  );

  //----------------------------------------------------------------
  // pvtmon
  // Status registers for board power and temperature.
  // Also includes registers for build info to ID the FPGA design.
  //----------------------------------------------------------------
  pvtmon_top pvtmon_top_0 (
    .clk50          (refclk),
    .rst            (reset),

    .pcie_link_up   (user_link_up),
    .pmbus_clk      (),
    .pmbus_data     (),
    .pmbus_control  (),
    .pmbus_alert    (),

    .s_axi_clk      (axi_aclk),
    .s_axi_aresetn  (axi_aresetn),
    .s_axi_araddr   (axil_araddr [(AXI_PVT * 32) +: 7]),
    .s_axi_arready  (axil_arready[(AXI_PVT * 1) +: 1]),
    .s_axi_arvalid  (axil_arvalid[(AXI_PVT * 1) +: 1]),
    .s_axi_awaddr   (axil_awaddr [(AXI_PVT * 32) +: 7]),
    .s_axi_awready  (axil_awready[(AXI_PVT * 1) +: 1]),
    .s_axi_awvalid  (axil_awvalid[(AXI_PVT * 1) +: 1]),
    .s_axi_bready   (axil_bready [(AXI_PVT * 1) +: 1]),
    .s_axi_bresp    (axil_bresp  [(AXI_PVT * 2) +: 2]),
    .s_axi_bvalid   (axil_bvalid [(AXI_PVT * 1) +: 1]),
    .s_axi_rdata    (axil_rdata  [(AXI_PVT * 32) +: 32]),
    .s_axi_rready   (axil_rready [(AXI_PVT * 1) +: 1]),
    .s_axi_rresp    (axil_rresp  [(AXI_PVT * 2) +: 2]),
    .s_axi_rvalid   (axil_rvalid [(AXI_PVT * 1) +: 1]),
    .s_axi_wdata    (axil_wdata  [(AXI_PVT * 32) +: 32]),
    .s_axi_wready   (axil_wready [(AXI_PVT * 1) +: 1]),
    .s_axi_wstrb    (axil_wstrb  [(AXI_PVT * 32/8) +: 32/8]),
    .s_axi_wvalid   (axil_wvalid [(AXI_PVT * 1) +: 1])
    );


  //----------------------------------------------------------------
  // network_path_axi_slaves
  //----------------------------------------------------------------
  generate
    for (ii = 0; ii < NUM_PATHS; ii = ii + 1) begin : generate_network_path_axi_slave
      network_path_axi_slave network_path_axi_slave (
	.pp_clk         (clk156),
	.gen_config     (gen_config[32*ii +: 32]),
	.ntp_config     (),
	.ntp_root_delay (),
	.ntp_root_disp  (),
	.ntp_ref_id     (),
	.ntp_ref_ts     (),
	.ntp_rx_ofs     (),
	.ntp_tx_ofs     (),
	.pp_status      (32'h0),
	.xphy_status    ({3'h0, xphy_status[5*ii +: 5]}),
	.ntp_sync_ok    (ntp_sync_ok),

	// Ports for API extension.
	.api_ext_command    (api_ext_command   [ 2*ii +:  2]),
	.api_ext_address    (api_ext_address   [32*ii +: 32]),
	.api_ext_write_data (api_ext_write_data[32*ii +: 32]),
	.api_ext_status     (api_ext_status    [ 2*ii +:  2]),
	.api_ext_read_data  (api_ext_read_data [32*ii +: 32]),

	.S_AXI_ACLK    (axi_aclk),
	.S_AXI_ARESETN (axi_aresetn),
	.S_AXI_AWADDR  (axil_awaddr [((AXI_NP0+ii) * 32) +: 9]),
	.S_AXI_AWVALID (axil_awvalid[((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_AWREADY (axil_awready[((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_WDATA   (axil_wdata  [((AXI_NP0+ii) * 32) +: 32]),
	.S_AXI_WSTRB   (axil_wstrb  [((AXI_NP0+ii) * 32/8) +: 32/8]),
	.S_AXI_WVALID  (axil_wvalid [((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_WREADY  (axil_wready [((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_BRESP   (axil_bresp  [((AXI_NP0+ii) * 2) +: 2]),
	.S_AXI_BVALID  (axil_bvalid [((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_BREADY  (axil_bready [((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_ARADDR  (axil_araddr [((AXI_NP0+ii) * 32) +: 9]),
	.S_AXI_ARVALID (axil_arvalid[((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_ARREADY (axil_arready[((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_RDATA   (axil_rdata  [((AXI_NP0+ii) * 32) +: 32]),
	.S_AXI_RRESP   (axil_rresp  [((AXI_NP0+ii) * 2) +: 2]),
	.S_AXI_RVALID  (axil_rvalid [((AXI_NP0+ii) * 1) +: 1]),
	.S_AXI_RREADY  (axil_rready [((AXI_NP0+ii) * 1) +: 1])
      );
    end
  endgenerate

  //----------------------------------------------------------------
  // network_path_shared_0.
  //----------------------------------------------------------------
   if (1)
  network_path_shared
  #(
    .ENGINES_NTS(2),
    .ENGINES_MINI(2),
    .INSTANTIATE_ROSC(1)
    )
  network_path_inst_0
   (
    .api_ext_command    (api_ext_command   [ 2*0 +:  2]),
    .api_ext_address    (api_ext_address   [32*0 +: 32]),
    .api_ext_write_data (api_ext_write_data[32*0 +: 32]),
    .api_ext_status     (api_ext_status    [ 2*0 +:  2]),
    .api_ext_read_data  (api_ext_read_data [32*0 +: 32]),

    .ntp_time           (ntp_time),

    .xgmii_rxd          (xgmii_rxd[64*0 +: 64]),
    .xgmii_rxc          (xgmii_rxc[ 8*0 +:  8]),
    .xgmii_txd          (xgmii_txd[64*0 +: 64]),
    .xgmii_txc          (xgmii_txc[ 8*0 +:  8]),

    .clk156             (clk156),
    .areset_clk156      (areset_clk156),

    .sys_reset          (reset)
  );

  //----------------------------------------------------------------
  // network_path_n
  //----------------------------------------------------------------
  generate
    for (ii = 1; ii < NUM_PATHS; ii = ii + 1) begin : generate_network_path_n
      if (0)
      network_path_shared
       #(
         .ENGINES_NTS(2),
         .ENGINES_MINI(2),
         .INSTANTIATE_ROSC(0)
         )
      network_path_inst_n
         (
	  .api_ext_command    (api_ext_command   [ 2*ii +:  2]),
	  .api_ext_address    (api_ext_address   [32*ii +: 32]),
	  .api_ext_write_data (api_ext_write_data[32*ii +: 32]),
	  .api_ext_status     (api_ext_status    [ 2*ii +:  2]),
	  .api_ext_read_data  (api_ext_read_data [32*ii +: 32]),

	  .ntp_time           (ntp_time),

	  .xgmii_rxd          (xgmii_rxd[64*ii +: 64]),
	  .xgmii_rxc          (xgmii_rxc[ 8*ii +:  8]),
	  .xgmii_txd          (xgmii_txd[64*ii +: 64]),
	  .xgmii_txc          (xgmii_txc[ 8*ii +:  8]),

	  .clk156             (clk156),
	  .areset_clk156      (areset_clk156),

	  .sys_reset          (reset)
          );
      else begin
	assign xgmii_txd[64*ii +: 64] = 64'h0707070707070707;
	assign xgmii_txc[ 8*ii +:  8] = 8'hff;
      end
    end
  endgenerate

endmodule // ntps_interfaces

`default_nettype wire

//======================================================================
// EOF ntps_interfaces.v
//======================================================================
