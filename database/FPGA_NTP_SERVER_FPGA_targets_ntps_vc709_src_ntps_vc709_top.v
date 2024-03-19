//======================================================================
//
// ntps_vc709_top.v
// -----------
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

`timescale 1 ps / 1 ps

`default_nettype none

module ntps_vc709_top
  (
   input  wire       SYS_CLK_N,
   input  wire       SYS_CLK_P,

   // PCIe interface
   input  wire       pci_express_x1_rxn,
   input  wire       pci_express_x1_rxp,
   output wire       pci_express_x1_txn,
   output wire       pci_express_x1_txp,
   input  wire       pcie_perstn,
   input  wire       pcie_refclk_clk_n,
   input  wire       pcie_refclk_clk_p,

   // 10MHz/PPS interfaces
   input  wire       PPS_INA_N,
   input  wire       PPS_INA_P,
   input  wire       PPS_INB_N,
   input  wire       PPS_INB_P,
   input  wire       TEN_MHZ_INA_N,
   input  wire       TEN_MHZ_INA_P,
   input  wire       TEN_MHZ_INB_N,
   input  wire       TEN_MHZ_INB_P,
   output wire       TEN_MHZ_OUTA,
   output wire       TEN_MHZ_OUTB,
   output wire       PPS_OUTA,
   output wire       PPS_OUTB,

   // I2C interface - mostly used to set up the Si5324 clock generator
   inout  wire       i2c_scl,
   inout  wire       i2c_sda,
   inout  wire       i2c_mux_rst_n,
   output wire       si5324_rst_n,

   // SFP ports
   input wire        xphy_refclk_n,
   input wire        xphy_refclk_p,

   input  wire [3:0] xphy_rxn,
   input  wire [3:0] xphy_rxp,
   output wire [3:0] xphy_txn,
   output wire [3:0] xphy_txp,

   input  wire [3:0] sfp_module_detect_n,
   input  wire [3:0] sfp_signal_lost,
   output wire [3:0] sfp_tx_disable,
   input  wire [3:0] sfp_tx_fault);

  //----------------------------------------------------------------

  localparam NUM_PATHS = 4;
  localparam PHY_PATHS = 4;
  localparam NUM_SLAVES = NUM_PATHS + 4;

  localparam INT_BOOTLOADER_EN = 1'b0;

  //////////////////////////////////////////////////////////////////////
  // PCIe to GPIO(I2C)/UART bridge
  // 
  // A simple block design which adds a couple of GPIO registers and
  // a UART to the host.

  // AXI clock and reset from the block design
  wire axi_aclk;
  wire axi_aresetn;

  // GPIO pins from the block design
  wire [31:0] gpio_tri_i;
  wire [31:0] gpio_tri_o;
  wire [31:0] gpio_tri_t;

  // UART from the block design
  wire uart_rxd;
  wire uart_txd;

  design_1 design_1_i
    (.pci_express_x1_rxn	(pci_express_x1_rxn),
     .pci_express_x1_rxp	(pci_express_x1_rxp),
     .pci_express_x1_txn	(pci_express_x1_txn),
     .pci_express_x1_txp	(pci_express_x1_txp),
     .pcie_perstn		(pcie_perstn),
     .pcie_refclk_clk_n		(pcie_refclk_clk_n),
     .pcie_refclk_clk_p		(pcie_refclk_clk_p),

     .axi_aclk			(axi_aclk),
     .axi_aresetn		(axi_aresetn),

     .gpio_rtl_tri_i		(gpio_tri_i),
     .gpio_rtl_tri_o		(gpio_tri_o),
     .gpio_rtl_tri_t		(gpio_tri_t),
     .rs232_uart_rxd		(uart_rxd),
     .rs232_uart_txd		(uart_txd)
     );

  // Create an I2C bus with SCL/SDA from host GPIOs 
  wire host_scl_i;
  wire host_scl_o;
  wire host_sda_i;
  wire host_sda_o;

  assign host_scl_o = gpio_tri_t[0] ? 1 : gpio_tri_o[0];
  assign host_sda_o = gpio_tri_t[1] ? 1 : gpio_tri_o[1];
  assign gpio_tri_i[0] = host_scl_i;
  assign gpio_tri_i[1] = host_sda_i;

  // Control the RISC-V CPU reset via a GPIO on the host
  wire cpu_resetn  = !gpio_tri_o[31] && axi_aresetn;

  //////////////////////////////////////////////////////////////////////
  // Internal I2C bus
  //
  // Connects host and cpu I2C ports using an internal bus
  
  // I2C slave pins
  wire cpu_scl_i;
  wire cpu_scl_o;
  wire cpu_sda_i;
  wire cpu_sda_o;
  
  // Connect all TWI devices on an internal bus
  wire internal_scl = host_scl_o & cpu_scl_o;
  wire internal_sda = host_sda_o & cpu_sda_o;
  assign host_scl_i = internal_scl;
  assign host_sda_i = internal_sda;
  assign cpu_scl_i = internal_scl;
  assign cpu_sda_i = internal_sda;

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
     .rstn_i			(cpu_resetn),
    
     // GPIO
     .gpio_i(cpu_gpio_i), // parallel input
     .gpio_o(cpu_gpio_o), // parallel output

     // primary UART0
     .uart0_txd_o(uart_rxd), // UART0 send data
     .uart0_rxd_i(uart_txd),  // UART0 receive data

     // TWI bus
     .twi_scl_i(cpu_scl_i),
     .twi_sda_i(cpu_sda_i),
     .twi_scl_o(cpu_scl_o),
     .twi_sda_o(cpu_sda_o),

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
     .rstn_i		(!cpu_resetn),

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
    .aresetn       (cpu_resetn),

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

  // Input buffers for sysclk
  wire sys_clk;
  IBUFDS sys_clk_ds_buf
    (.I(SYS_CLK_P),
     .IB(SYS_CLK_N),
     .O(sys_clk));

  // Input buffers for NTP clock A
  wire ten_mhz_ina;
  IBUFDS ten_mhz_ina_ds_buf
    (.I(TEN_MHZ_INA_P),
     .IB(TEN_MHZ_INA_N),
     .O(ten_mhz_ina));

  wire pps_ina;
  IBUFDS pps_ina_ds_buf
    (.I(PPS_INA_P),
     .IB(PPS_INA_N),
     .O(pps_ina));

  // Input buffers for NTP clock B
  wire ten_mhz_inb;
  IBUFDS ten_mhz_inb_ds_buf
    (.I(TEN_MHZ_INB_P),
     .IB(TEN_MHZ_INB_N),
     .O(ten_mhz_inb));

  wire pps_inb;
  IBUFDS pps_inb_ds_buf
    (.I(PPS_INB_P),
     .IB(PPS_INB_N),
     .O(pps_inb));

  //----------------------------------------------------------------

  wire reset = 0;

  // clock generators, clock control
  wire clk50;

  ntps_clocks clocks
    (.reset         (reset),
     .sys_clk       (sys_clk),
     .clk50         (clk50),
     .i2c_clk       (i2c_scl),
     .i2c_data      (i2c_sda),
     .i2c_mux_rst_n (i2c_mux_rst_n),
     .si5324_rst_n  (si5324_rst_n),
     .PPS_OUT       (),
     .TEN_MHZ_OUT   ());

  //----------------------------------------------------------------
  // Ethernet PHYs.
  //----------------------------------------------------------------

  wire clk156;
  wire areset_clk156;

  wire [32*PHY_PATHS-1 : 0] gen_config;
  wire [ 5*PHY_PATHS-1 : 0] xphy_status;

  wire [64*PHY_PATHS-1 : 0] xgmii_txd;
  wire [ 8*PHY_PATHS-1 : 0] xgmii_txc;
  wire [64*PHY_PATHS-1 : 0] xgmii_rxd;
  wire [ 8*PHY_PATHS-1 : 0] xgmii_rxc;

  //----------------------------------------------------------------
  // Ethernet PHYs.
  //----------------------------------------------------------------
  ntps_phys phys
    (.reset                 (reset),
     .clk156                (clk156),
     .areset_clk156         (areset_clk156),

     .mdc                   (),
     .mdio_in               (),
     .mdio_out              (),

     .xphy_refclk_n         (xphy_refclk_n),
     .xphy_refclk_p         (xphy_refclk_p),

     .xphy_config_0         (gen_config[0*32+29+:3]),
     .xphy_config_1         (gen_config[1*32+29+:3]),
     .xphy_config_2         (gen_config[2*32+29+:3]),
     .xphy_config_3         (gen_config[3*32+29+:3]),

     .xphy_status_0         (xphy_status[0*5+:5]),
     .xphy_status_1         (xphy_status[1*5+:5]),
     .xphy_status_2         (xphy_status[2*5+:5]),
     .xphy_status_3         (xphy_status[3*5+:5]),

     .sfp_module_detect_n_0 (sfp_module_detect_n[0]),
     .sfp_signal_lost_0     (sfp_signal_lost[0]),
     .sfp_tx_fault_0        (sfp_tx_fault[0]),
     .sfp_tx_disable_0      (sfp_tx_disable[0]),
     .xphy_rxp_0            (xphy_rxp[0]),
     .xphy_rxn_0            (xphy_rxn[0]),
     .xphy_txp_0            (xphy_txp[0]),
     .xphy_txn_0            (xphy_txn[0]),
     .xgmii_txd_0           (xgmii_txd[0*64+:64]),
     .xgmii_txc_0           (xgmii_txc[0*8+:8]),
     .xgmii_rxd_0           (xgmii_rxd[0*64+:64]),
     .xgmii_rxc_0           (xgmii_rxc[0*8+:8]),

     .sfp_module_detect_n_1 (sfp_module_detect_n[1]),
     .sfp_signal_lost_1     (sfp_signal_lost[1]),
     .sfp_tx_fault_1        (sfp_tx_fault[1]),
     .sfp_tx_disable_1      (sfp_tx_disable[1]),
     .xphy_rxp_1            (xphy_rxp[1]),
     .xphy_rxn_1            (xphy_rxn[1]),
     .xphy_txp_1            (xphy_txp[1]),
     .xphy_txn_1            (xphy_txn[1]),
     .xgmii_txd_1           (xgmii_txd[1*64+:64]),
     .xgmii_txc_1           (xgmii_txc[1*8+:8]),
     .xgmii_rxd_1           (xgmii_rxd[1*64+:64]),
     .xgmii_rxc_1           (xgmii_rxc[1*8+:8]),

     .sfp_module_detect_n_2 (sfp_module_detect_n[2]),
     .sfp_signal_lost_2     (sfp_signal_lost[2]),
     .sfp_tx_fault_2        (sfp_tx_fault[2]),
     .sfp_tx_disable_2      (sfp_tx_disable[2]),
     .xphy_rxp_2            (xphy_rxp[2]),
     .xphy_rxn_2            (xphy_rxn[2]),
     .xphy_txp_2            (xphy_txp[2]),
     .xphy_txn_2            (xphy_txn[2]),
     .xgmii_txd_2           (xgmii_txd[2*64+:64]),
     .xgmii_txc_2           (xgmii_txc[2*8+:8]),
     .xgmii_rxd_2           (xgmii_rxd[2*64+:64]),
     .xgmii_rxc_2           (xgmii_rxc[2*8+:8]),

     .sfp_module_detect_n_3 (sfp_module_detect_n[3]),
     .sfp_signal_lost_3     (sfp_signal_lost[3]),
     .sfp_tx_fault_3        (sfp_tx_fault[3]),
     .sfp_tx_disable_3      (sfp_tx_disable[3]),
     .xphy_rxp_3            (xphy_rxp[3]),
     .xphy_rxn_3            (xphy_rxn[3]),
     .xphy_txp_3            (xphy_txp[3]),
     .xphy_txn_3            (xphy_txn[3]),
     .xgmii_txd_3           (xgmii_txd[3*64+:64]),
     .xgmii_txc_3           (xgmii_txc[3*8+:8]),
     .xgmii_rxd_3           (xgmii_rxd[3*64+:64]),
     .xgmii_rxc_3           (xgmii_rxc[3*8+:8]));

  ntps_interfaces
    #(
      .NUM_PATHS(NUM_PATHS),
      .NUM_SLAVES(NUM_SLAVES)
      )
  ntps_interfaces_0
    (
     .refclk                (clk50),
     .reset                 (reset),

     .clk156                (clk156),
     .areset_clk156         (areset_clk156),

     .axi_aclk              (axi_aclk),
     .axi_aresetn           (cpu_resetn),
     .axil_awaddr           (axil_awaddr),
     .axil_awvalid          (axil_awvalid),
     .axil_awready          (axil_awready),
     .axil_wdata            (axil_wdata),
     .axil_wstrb            (axil_wstrb),
     .axil_wvalid           (axil_wvalid),
     .axil_wready           (axil_wready),
     .axil_bresp            (axil_bresp),
     .axil_bvalid           (axil_bvalid),
     .axil_bready           (axil_bready),
     .axil_araddr           (axil_araddr),
     .axil_arvalid          (axil_arvalid),
     .axil_arready          (axil_arready),
     .axil_rdata            (axil_rdata),
     .axil_rresp            (axil_rresp),
     .axil_rvalid           (axil_rvalid),
     .axil_rready           (axil_rready),

     // 10Gbit ports
     .xgmii_txd             (xgmii_txd),
     .xgmii_txc             (xgmii_txc),
     .xgmii_rxd             (xgmii_rxd),
     .xgmii_rxc             (xgmii_rxc),
     .gen_config            (gen_config),
     .xphy_status           (xphy_status),

     // NTP clocks
     .PPS_INA               (pps_ina),
     .PPS_OUTA              (PPS_OUTA),
     .TEN_MHZ_INA           (ten_mhz_ina),
     .TEN_MHZ_OUTA          (TEN_MHZ_OUTA),
     .NTP_LED1A             (),
     .NTP_LED2A             (),
     .PLL_LOCKEDA           (),

     .PPS_INB               (pps_inb),
     .PPS_OUTB              (PPS_OUTB),
     .TEN_MHZ_INB           (ten_mhz_inb),
     .TEN_MHZ_OUTB          (TEN_MHZ_OUTB),
     .NTP_LED1B             (),
     .NTP_LED2B             (),
     .PLL_LOCKEDB           ());
   
endmodule

`default_nettype wire
