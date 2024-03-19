////////////////////////////////////////////////////////////////////////
// cpu_vc709_top.v
//
// Test implementation of a RISC-V (NEORV32) cpu which has an I2C
// slave and a AXI Lite (AXIL) master with a test device on it.

`timescale 1 ps / 1 ps

`default_nettype none

module cpu_vc709_top
  (
   // PCIe interface
   input  wire       pci_express_x1_rxn,
   input  wire       pci_express_x1_rxp,
   output wire       pci_express_x1_txn,
   output wire       pci_express_x1_txp,
   input  wire       pcie_perstn,
   input  wire       pcie_refclk_clk_n,
   input  wire       pcie_refclk_clk_p
   );

  localparam INT_BOOTLOADER_EN = 1'b1;

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
  
endmodule
`default_nettype wire
