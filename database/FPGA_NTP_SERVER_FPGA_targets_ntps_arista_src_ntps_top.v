//======================================================================
//
// ntps_top.v
// ----------
// Top level module for the NTP, NTS FPGA design.
//
// Author: Rolf Andersson (rolf@mechanicalmen.se)
// Author: Christer Weinigel <wingel@netnod.se>
//
// Copyright 2016-2022 Netnod AB
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

module ntps_top
   (
    input wire			     refclk_25,
    input wire                       refclk_25_rst,

    input wire			     refclk_50,
    input wire                       refclk_50_rst,

    output wire internal_pps,
    output wire beat_send,
    output wire beat_recv,

    /* I2C interface */

    input  wire  scl_in,
    output wire  scl_low_n,
    input  wire  sda_in,
    output wire  sda_low_n,

    /* PPS interface */
    input  wire                      ten_mhz_ina,
    input  wire                      pps_ina,

    input  wire                      ten_mhz_inb,
    input  wire                      pps_inb,

    /*
     * Ethernet: QSFP28
     */
    input  wire       qsfp1_mgt_refclk_0_p,
    input  wire       qsfp1_mgt_refclk_0_n,

    output wire       qsfp1_tx1_p,
    output wire       qsfp1_tx1_n,
    input  wire       qsfp1_rx1_p,
    input  wire       qsfp1_rx1_n,
    output wire       qsfp1_tx2_p,
    output wire       qsfp1_tx2_n,
    input  wire       qsfp1_rx2_p,
    input  wire       qsfp1_rx2_n,
    output wire       qsfp1_tx3_p,
    output wire       qsfp1_tx3_n,
    input  wire       qsfp1_rx3_p,
    input  wire       qsfp1_rx3_n,
    output wire       qsfp1_tx4_p,
    output wire       qsfp1_tx4_n,
    input  wire       qsfp1_rx4_p,
    input  wire       qsfp1_rx4_n);

  localparam NUM_PATHS = 4;
  localparam NUM_SLAVES = NUM_PATHS + 4;

  localparam INT_BOOTLOADER_EN = 1'b0;

  //----------------------------------------------------------------
  // AXI clock
  //----------------------------------------------------------------

  wire axi_aclk = refclk_25;
  wire axi_aresetn = !refclk_25_rst;

  //////////////////////////////////////////////////////////////////////
  // RISC-V (NEORV32) CPU

  // CPU GPIO pins
  wire [7:0] cpu_gpio_i;
  wire [7:0] cpu_gpio_o;

  // CPU Wishboe bus
  wire			wb_reset;
  wire			wb_cyc;
  wire			wb_stb;
  wire			wb_we;
  wire [32-1:0]		wb_addr;
  wire [32-1:0]		wb_data_w;
  wire [32/8-1:0]	wb_sel;
  wire			wb_stall;
  wire			wb_ack;
  wire [32-1:0]		wb_data_r;
  wire			wb_err;

  neorv32_wrapper #
    (
     .CLOCK_FREQUENCY(125000000),
     .MEM_EXT_PIPE_MODE(1'b0),
     .INT_BOOTLOADER_EN(INT_BOOTLOADER_EN)
     )
  neorv32_wrapper_inst
    (
     .clk_i			(axi_aclk),
     .rstn_i			(axi_aresetn),
    
     // GPIO
     .gpio_i(cpu_gpio_i), // parallel input
     .gpio_o(cpu_gpio_o), // parallel output

     // primary UART0
     .uart0_txd_o(), // UART0 send data
     .uart0_rxd_i(1'b1),  // UART0 receive data

     // TWI bus
     .twi_scl_i(scl_in),
     .twi_sda_i(sda_in),
     .twi_scl_o(scl_low_n),
     .twi_sda_o(sda_low_n),

     // Wishbone bus
     .wb_cyc_o			(wb_cyc),
     .wb_stb_o			(wb_stb),
     .wb_we_o			(wb_we),
     .wb_adr_o			(wb_addr),
     .wb_dat_o			(wb_data_w),
     .wb_sel_o			(wb_sel),
     .wb_ack_i			(wb_ack),
     .wb_dat_i			(wb_data_r),
     .wb_err_i			(wb_err)
     );

  //////////////////////////////////////////////////////////////////////
  // Wishbone to AXI Lite bridge

  // AXI bus
  // Write Address Channel
  wire [31:0] 	top_axi_awaddr;
  wire [2:0] 	top_axi_awprot;
  wire 		top_axi_awvalid;
  wire 		top_axi_awready;
  // Write Data Channel
  wire [31:0] 	top_axi_wdata;
  wire [3:0] 	top_axi_wstrb;
  wire 		top_axi_wvalid;
  wire 		top_axi_wready;
  // Write Response Channel
  wire [1:0] 	top_axi_bresp;
  wire 		top_axi_bvalid;
  wire 		top_axi_bready;
  // Read Address Channel
  wire [31:0] 	top_axi_araddr;
  wire [2:0] 	top_axi_arprot;
  wire 		top_axi_arvalid;
  wire 		top_axi_arready;
  // Read Data Channel
  wire [31:0] 	top_axi_rdata;
  wire [1:0] 	top_axi_rresp;
  wire 		top_axi_rvalid;
  wire 		top_axi_rready;

  wb_axil_bridge #
    (
     .AW(32),
     .C_AXI_ADDR_WIDTH(32)
     )
  wb_axil_bridge_inst
    (
     .clk_i		(axi_aclk),
     .rstn_i		(!axi_aresetn),

     // Wishbone bus
     .wb_cyc_i		(wb_cyc),
     .wb_stb_i		(wb_stb),
     .wb_we_i		(wb_we),
     .wb_adr_i		(wb_addr),
     .wb_dat_i		(wb_data_w),
     .wb_sel_i		(wb_sel),
     .wb_ack_o		(wb_ack),
     .wb_dat_o		(wb_data_r),
     .wb_err_o		(wb_err),

     // AXI bus
     .m_axi_awaddr      (top_axi_awaddr),
     .m_axi_awprot      (top_axi_awprot),
     .m_axi_awvalid     (top_axi_awvalid),
     .m_axi_awready     (top_axi_awready),

     .m_axi_wdata       (top_axi_wdata),
     .m_axi_wstrb       (top_axi_wstrb),
     .m_axi_wvalid      (top_axi_wvalid),
     .m_axi_wready      (top_axi_wready),

     .m_axi_bresp       (top_axi_bresp),
     .m_axi_bvalid      (top_axi_bvalid),
     .m_axi_bready      (top_axi_bready),

     .m_axi_araddr      (top_axi_araddr),
     .m_axi_arprot      (top_axi_arprot),
     .m_axi_arvalid     (top_axi_arvalid),
     .m_axi_arready     (top_axi_arready),

     .m_axi_rdata       (top_axi_rdata),
     .m_axi_rresp       (top_axi_rresp),
     .m_axi_rvalid      (top_axi_rvalid),
     .m_axi_rready      (top_axi_rready)

     );
  
  //----------------------------------------------------------------
  // AXI Lite bus
  //----------------------------------------------------------------

  wire [NUM_SLAVES*32-1:0]   axil_awaddr;
  wire [NUM_SLAVES*3-1:0]    axil_awprot;
  wire [NUM_SLAVES-1:0]      axil_awvalid;
  wire [NUM_SLAVES-1:0]      axil_awready;
  wire [NUM_SLAVES*32-1:0]   axil_wdata;
  wire [NUM_SLAVES*32/8-1:0] axil_wstrb;
  wire [NUM_SLAVES-1:0]      axil_wvalid;
  wire [NUM_SLAVES-1:0]      axil_wready;
  wire [NUM_SLAVES*2-1:0]    axil_bresp;
  wire [NUM_SLAVES-1:0]      axil_bvalid;
  wire [NUM_SLAVES-1:0]      axil_bready;
  wire [NUM_SLAVES*32-1:0]   axil_araddr;
  wire [NUM_SLAVES*3-1:0]    axil_arprot;
  wire [NUM_SLAVES-1:0]      axil_arvalid;
  wire [NUM_SLAVES-1:0]      axil_arready;
  wire [NUM_SLAVES*32-1:0]   axil_rdata;
  wire [NUM_SLAVES*2-1:0]    axil_rresp;
  wire [NUM_SLAVES-1:0]      axil_rvalid;
  wire [NUM_SLAVES-1:0]      axil_rready;

  ntps_top_xbar_0 xbar (
    .aclk          (axi_aclk),
    .aresetn       (axi_aresetn),

    .s_axi_araddr  (top_axi_araddr),
    .s_axi_arprot  (top_axi_arprot),
    .s_axi_arready (top_axi_arready),
    .s_axi_arvalid (top_axi_arvalid),
    .s_axi_awaddr  (top_axi_awaddr),
    .s_axi_awprot  (top_axi_awprot),
    .s_axi_awready (top_axi_awready),
    .s_axi_awvalid (top_axi_awvalid),
    .s_axi_bready  (top_axi_bready),
    .s_axi_bresp   (top_axi_bresp),
    .s_axi_bvalid  (top_axi_bvalid),
    .s_axi_rdata   (top_axi_rdata),
    .s_axi_rready  (top_axi_rready),
    .s_axi_rresp   (top_axi_rresp),
    .s_axi_rvalid  (top_axi_rvalid),
    .s_axi_wdata   (top_axi_wdata),
    .s_axi_wready  (top_axi_wready),
    .s_axi_wstrb   (top_axi_wstrb),
    .s_axi_wvalid  (top_axi_wvalid),

    .m_axi_awaddr  (axil_awaddr),
    .m_axi_awprot  (axil_awprot),
    .m_axi_awvalid (axil_awvalid),
    .m_axi_awready (axil_awready),
    .m_axi_wdata   (axil_wdata),
    .m_axi_wstrb   (axil_wstrb),
    .m_axi_wvalid  (axil_wvalid),
    .m_axi_wready  (axil_wready),
    .m_axi_bresp   (axil_bresp),
    .m_axi_bvalid  (axil_bvalid),
    .m_axi_bready  (axil_bready),
    .m_axi_araddr  (axil_araddr),
    .m_axi_arprot  (axil_arprot),
    .m_axi_arvalid (axil_arvalid),
    .m_axi_arready (axil_arready),
    .m_axi_rdata   (axil_rdata),
    .m_axi_rresp   (axil_rresp),
    .m_axi_rvalid  (axil_rvalid),
    .m_axi_rready  (axil_rready)
  );

  //----------------------------------------------------------------
  // Ethernet PHYs.
  //----------------------------------------------------------------

  wire clk156;
  wire areset_clk156;

  wire [32*NUM_PATHS-1 : 0] gen_config;
  wire [ 5*NUM_PATHS-1 : 0] xphy_status;

  wire [64*NUM_PATHS-1 : 0] xgmii_txd;
  wire [ 8*NUM_PATHS-1 : 0] xgmii_txc;
  wire [64*NUM_PATHS-1 : 0] xgmii_rxd;
  wire [ 8*NUM_PATHS-1 : 0] xgmii_rxc;

  ntps_phys phys
   (
    .refclk                (refclk_25),
    .refclk_rst            (refclk_25_rst),

    .clk156                (clk156),
    .areset_clk156         (areset_clk156),

    .xphy_config_0         (gen_config[0*32+29+:3]),
    .xphy_config_1         (gen_config[1*32+29+:3]),
    .xphy_config_2         (gen_config[2*32+29+:3]),
    .xphy_config_3         (gen_config[3*32+29+:3]),

    .xphy_status_0         (xphy_status[0*5+:5]),
    .xphy_status_1         (xphy_status[1*5+:5]),
    .xphy_status_2         (xphy_status[2*5+:5]),
    .xphy_status_3         (xphy_status[3*5+:5]),

    .qsfp1_mgt_refclk_0_p  (qsfp1_mgt_refclk_0_p),
    .qsfp1_mgt_refclk_0_n  (qsfp1_mgt_refclk_0_n),

    // External ports for QSFP interface 1.
    .qsfp1_tx1_p(qsfp1_tx1_p),
    .qsfp1_tx1_n(qsfp1_tx1_n),
    .qsfp1_rx1_p(qsfp1_rx1_p),
    .qsfp1_rx1_n(qsfp1_rx1_n),
    .qsfp1_tx2_p(qsfp1_tx2_p),
    .qsfp1_tx2_n(qsfp1_tx2_n),
    .qsfp1_rx2_p(qsfp1_rx2_p),
    .qsfp1_rx2_n(qsfp1_rx2_n),
    .qsfp1_tx3_p(qsfp1_tx3_p),
    .qsfp1_tx3_n(qsfp1_tx3_n),
    .qsfp1_rx3_p(qsfp1_rx3_p),
    .qsfp1_rx3_n(qsfp1_rx3_n),
    .qsfp1_tx4_p(qsfp1_tx4_p),
    .qsfp1_tx4_n(qsfp1_tx4_n),
    .qsfp1_rx4_p(qsfp1_rx4_p),
    .qsfp1_rx4_n(qsfp1_rx4_n),

    // XGMII ports for QSFP interface 1.
    .qsfp1_xgmii_txd_1(xgmii_txd[0*64 +: 64]),
    .qsfp1_xgmii_txc_1(xgmii_txc[0* 8 +:  8]),
    .qsfp1_xgmii_rxd_1(xgmii_rxd[0*64 +: 64]),
    .qsfp1_xgmii_rxc_1(xgmii_rxc[0* 8 +:  8]),
    .qsfp1_xgmii_txd_2(xgmii_txd[1*64 +: 64]),
    .qsfp1_xgmii_txc_2(xgmii_txc[1* 8 +:  8]),
    .qsfp1_xgmii_rxd_2(xgmii_rxd[1*64 +: 64]),
    .qsfp1_xgmii_rxc_2(xgmii_rxc[1* 8 +:  8]),
    .qsfp1_xgmii_txd_3(xgmii_txd[2*64 +: 64]),
    .qsfp1_xgmii_txc_3(xgmii_txc[2* 8 +:  8]),
    .qsfp1_xgmii_rxd_3(xgmii_rxd[2*64 +: 64]),
    .qsfp1_xgmii_rxc_3(xgmii_rxc[2* 8 +:  8]),
    .qsfp1_xgmii_txd_4(xgmii_txd[3*64 +: 64]),
    .qsfp1_xgmii_txc_4(xgmii_txc[3* 8 +:  8]),
    .qsfp1_xgmii_rxd_4(xgmii_rxd[3*64 +: 64]),
    .qsfp1_xgmii_rxc_4(xgmii_rxc[3* 8 +:  8]));


  //----------------------------------------------------------------
  // ntps_interfaces.
  // All external/physical interfaces including pci-axi bridge
  // and NTP clocks.
  //----------------------------------------------------------------
  ntps_interfaces
  #(
    .NUM_PATHS(NUM_PATHS),
    .NUM_SLAVES(NUM_SLAVES)
    )
  ntps_interfaces_0
   (
    .refclk                (axi_aclk),
    .refclk_rst            (!axi_aresetn),

    .clk156                (clk156),
    .areset_clk156         (areset_clk156),

    .internal_pps          (internal_pps),
    .beat_send             (beat_send),
    .beat_recv             (beat_recv),

    // AXI interface
    .axi_aresetn          (axi_aresetn),
    .axi_aclk             (axi_aclk),
    .axil_awaddr          (axil_awaddr),
    .axil_awprot          (axil_awprot),
    .axil_awvalid         (axil_awvalid),
    .axil_awready         (axil_awready),
    .axil_wdata           (axil_wdata),
    .axil_wstrb           (axil_wstrb),
    .axil_wvalid          (axil_wvalid),
    .axil_wready          (axil_wready),
    .axil_bresp           (axil_bresp),
    .axil_bvalid          (axil_bvalid),
    .axil_bready          (axil_bready),
    .axil_araddr          (axil_araddr),
    .axil_arprot          (axil_arprot),
    .axil_arvalid         (axil_arvalid),
    .axil_arready         (axil_arready),
    .axil_rdata           (axil_rdata),
    .axil_rresp           (axil_rresp),
    .axil_rvalid          (axil_rvalid),
    .axil_rready          (axil_rready),

    .user_link_up          (0),

    // 10Gbit ports
    .xgmii_txd             (xgmii_txd),
    .xgmii_txc             (xgmii_txc),
    .xgmii_rxd             (xgmii_rxd),
    .xgmii_rxc             (xgmii_rxc),
    .gen_config            (gen_config),
    .xphy_status           (xphy_status),

    // NTP clocks
    .PPS_INA               (pps_ina),
    .PPS_OUTA              (),
    .TEN_MHZ_INA           (ten_mhz_ina),
    .TEN_MHZ_OUTA          (),
    .NTP_LED1A             (),
    .NTP_LED2A             (),
    .PLL_LOCKEDA           (),

    .PPS_INB               (pps_inb),
    .PPS_OUTB              (),
    .TEN_MHZ_INB           (ten_mhz_inb),
    .TEN_MHZ_OUTB          (),
    .NTP_LED1B             (),
    .NTP_LED2B             (),
    .PLL_LOCKEDB           ());

endmodule

`default_nettype wire

//======================================================================
// EOF ntps_top.v
//======================================================================
