module system
  (
    processing_system7_0_MIO,
    processing_system7_0_PS_SRSTB,
    processing_system7_0_PS_CLK,
    processing_system7_0_PS_PORB,
    processing_system7_0_DDR_Clk,
    processing_system7_0_DDR_Clk_n,
    processing_system7_0_DDR_CKE,
    processing_system7_0_DDR_CS_n,
    processing_system7_0_DDR_RAS_n,
    processing_system7_0_DDR_CAS_n,
    processing_system7_0_DDR_WEB,
    processing_system7_0_DDR_BankAddr,
    processing_system7_0_DDR_Addr,
    processing_system7_0_DDR_ODT,
    processing_system7_0_DDR_DRSTB,
    processing_system7_0_DDR_DQ,
    processing_system7_0_DDR_DM,
    processing_system7_0_DDR_DQS,
    processing_system7_0_DDR_DQS_n,
    processing_system7_0_DDR_VRN,
    processing_system7_0_DDR_VRP,
    xillybus_bus_clk,
    xillybus_bus_rst_n,
    xillybus_S_AXI_AWADDR,
    xillybus_S_AXI_AWVALID,
    xillybus_S_AXI_WDATA,
    xillybus_S_AXI_WSTRB,
    xillybus_S_AXI_WVALID,
    xillybus_S_AXI_BREADY,
    xillybus_S_AXI_ARADDR,
    xillybus_S_AXI_ARVALID,
    xillybus_S_AXI_RREADY,
    xillybus_S_AXI_ARREADY,
    xillybus_S_AXI_RDATA,
    xillybus_S_AXI_RRESP,
    xillybus_S_AXI_RVALID,
    xillybus_S_AXI_WREADY,
    xillybus_S_AXI_BRESP,
    xillybus_S_AXI_BVALID,
    xillybus_S_AXI_AWREADY,
    xillybus_M_AXI_ARREADY,
    xillybus_M_AXI_ARVALID,
    xillybus_M_AXI_ARADDR,
    xillybus_M_AXI_ARLEN,
    xillybus_M_AXI_ARSIZE,
    xillybus_M_AXI_ARBURST,
    xillybus_M_AXI_ARPROT,
    xillybus_M_AXI_ARCACHE,
    xillybus_M_AXI_RREADY,
    xillybus_M_AXI_RVALID,
    xillybus_M_AXI_RDATA,
    xillybus_M_AXI_RRESP,
    xillybus_M_AXI_RLAST,
    xillybus_M_AXI_AWREADY,
    xillybus_M_AXI_AWVALID,
    xillybus_M_AXI_AWADDR,
    xillybus_M_AXI_AWLEN,
    xillybus_M_AXI_AWSIZE,
    xillybus_M_AXI_AWBURST,
    xillybus_M_AXI_AWPROT,
    xillybus_M_AXI_AWCACHE,
    xillybus_M_AXI_WREADY,
    xillybus_M_AXI_WVALID,
    xillybus_M_AXI_WDATA,
    xillybus_M_AXI_WSTRB,
    xillybus_M_AXI_WLAST,
    xillybus_M_AXI_BREADY,
    xillybus_M_AXI_BVALID,
    xillybus_M_AXI_BRESP,
    xillybus_host_interrupt,
    xillyvga_0_clk_in,
    xillyvga_0_vga_hsync,
    xillyvga_0_vga_vsync,
    xillyvga_0_vga_de,
    xillyvga_0_vga_red,
    xillyvga_0_vga_green,
    xillyvga_0_vga_blue,
    xillyvga_0_vga_clk,
    processing_system7_0_GPIO,
    processing_system7_0_USB0_VBUS_PWRFAULT,
    xillybus_lite_0_user_clk_pin,
    xillybus_lite_0_user_wren_pin,
    xillybus_lite_0_user_wstrb_pin,
    xillybus_lite_0_user_rden_pin,
    xillybus_lite_0_user_rd_data_pin,
    xillybus_lite_0_user_wr_data_pin,
    xillybus_lite_0_user_addr_pin,
    xillybus_lite_0_user_irq_pin
  );
  inout [53:0] processing_system7_0_MIO;
  input processing_system7_0_PS_SRSTB;
  input processing_system7_0_PS_CLK;
  input processing_system7_0_PS_PORB;
  inout processing_system7_0_DDR_Clk;
  inout processing_system7_0_DDR_Clk_n;
  inout processing_system7_0_DDR_CKE;
  inout processing_system7_0_DDR_CS_n;
  inout processing_system7_0_DDR_RAS_n;
  inout processing_system7_0_DDR_CAS_n;
  output processing_system7_0_DDR_WEB;
  inout [2:0] processing_system7_0_DDR_BankAddr;
  inout [14:0] processing_system7_0_DDR_Addr;
  inout processing_system7_0_DDR_ODT;
  inout processing_system7_0_DDR_DRSTB;
  inout [31:0] processing_system7_0_DDR_DQ;
  inout [3:0] processing_system7_0_DDR_DM;
  inout [3:0] processing_system7_0_DDR_DQS;
  inout [3:0] processing_system7_0_DDR_DQS_n;
  inout processing_system7_0_DDR_VRN;
  inout processing_system7_0_DDR_VRP;
  output xillybus_bus_clk;
  output xillybus_bus_rst_n;
  output [31:0] xillybus_S_AXI_AWADDR;
  output xillybus_S_AXI_AWVALID;
  output [31:0] xillybus_S_AXI_WDATA;
  output [3:0] xillybus_S_AXI_WSTRB;
  output xillybus_S_AXI_WVALID;
  output xillybus_S_AXI_BREADY;
  output [31:0] xillybus_S_AXI_ARADDR;
  output xillybus_S_AXI_ARVALID;
  output xillybus_S_AXI_RREADY;
  input xillybus_S_AXI_ARREADY;
  input [31:0] xillybus_S_AXI_RDATA;
  input [1:0] xillybus_S_AXI_RRESP;
  input xillybus_S_AXI_RVALID;
  input xillybus_S_AXI_WREADY;
  input [1:0] xillybus_S_AXI_BRESP;
  input xillybus_S_AXI_BVALID;
  input xillybus_S_AXI_AWREADY;
  output xillybus_M_AXI_ARREADY;
  input xillybus_M_AXI_ARVALID;
  input [31:0] xillybus_M_AXI_ARADDR;
  input [3:0] xillybus_M_AXI_ARLEN;
  input [2:0] xillybus_M_AXI_ARSIZE;
  input [1:0] xillybus_M_AXI_ARBURST;
  input [2:0] xillybus_M_AXI_ARPROT;
  input [3:0] xillybus_M_AXI_ARCACHE;
  input xillybus_M_AXI_RREADY;
  output xillybus_M_AXI_RVALID;
  output [63:0] xillybus_M_AXI_RDATA;
  output [1:0] xillybus_M_AXI_RRESP;
  output xillybus_M_AXI_RLAST;
  output xillybus_M_AXI_AWREADY;
  input xillybus_M_AXI_AWVALID;
  input [31:0] xillybus_M_AXI_AWADDR;
  input [3:0] xillybus_M_AXI_AWLEN;
  input [2:0] xillybus_M_AXI_AWSIZE;
  input [1:0] xillybus_M_AXI_AWBURST;
  input [2:0] xillybus_M_AXI_AWPROT;
  input [3:0] xillybus_M_AXI_AWCACHE;
  output xillybus_M_AXI_WREADY;
  input xillybus_M_AXI_WVALID;
  input [63:0] xillybus_M_AXI_WDATA;
  input [7:0] xillybus_M_AXI_WSTRB;
  input xillybus_M_AXI_WLAST;
  input xillybus_M_AXI_BREADY;
  output xillybus_M_AXI_BVALID;
  output [1:0] xillybus_M_AXI_BRESP;
  input xillybus_host_interrupt;
  input xillyvga_0_clk_in;
  output xillyvga_0_vga_hsync;
  output xillyvga_0_vga_vsync;
  output xillyvga_0_vga_de;
  output [7:0] xillyvga_0_vga_red;
  output [7:0] xillyvga_0_vga_green;
  output [7:0] xillyvga_0_vga_blue;
  output xillyvga_0_vga_clk;
  inout [55:0] processing_system7_0_GPIO;
  input processing_system7_0_USB0_VBUS_PWRFAULT;
  output xillybus_lite_0_user_clk_pin;
  output xillybus_lite_0_user_wren_pin;
  output [3:0] xillybus_lite_0_user_wstrb_pin;
  output xillybus_lite_0_user_rden_pin;
  input [31:0] xillybus_lite_0_user_rd_data_pin;
  output [31:0] xillybus_lite_0_user_wr_data_pin;
  output [31:0] xillybus_lite_0_user_addr_pin;
  input xillybus_lite_0_user_irq_pin;
endmodule

