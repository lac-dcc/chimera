`timescale 1ns / 10ps

module xillybus(GPIO_LED, quiesce, MIO, PS_SRSTB, PS_CLK, PS_PORB, DDR_Clk,
  DDR_Clk_n, DDR_CKE, DDR_CS_n, DDR_RAS_n, DDR_CAS_n, DDR_WEB, DDR_BankAddr,
  DDR_Addr, DDR_ODT, DDR_DRSTB, DDR_DQ, DDR_DM, DDR_DQS, DDR_DQS_n, DDR_VRN,
  DDR_VRP, bus_clk, PS_GPIO, otg_oc, clk_100, vga4_red, vga4_green, vga4_blue,
  vga_hsync, vga_vsync, user_clk, user_wren, user_wstrb, user_rden,
  user_rd_data, user_wr_data, user_addr, user_irq, user_r_smb_rden,
  user_r_smb_data, user_r_smb_empty, user_r_smb_eof, user_r_smb_open,
  user_w_smb_wren, user_w_smb_data, user_w_smb_full, user_w_smb_open,
  user_r_audio_rden, user_r_audio_data, user_r_audio_empty, user_r_audio_eof,
  user_r_audio_open, user_w_audio_wren, user_w_audio_data, user_w_audio_full,
  user_w_audio_open, user_r_read_32_rden, user_r_read_32_data,
  user_r_read_32_empty, user_r_read_32_eof, user_r_read_32_open,
  user_w_write_32_wren, user_w_write_32_data, user_w_write_32_full,
  user_w_write_32_open, user_r_read_8_rden, user_r_read_8_data,
  user_r_read_8_empty, user_r_read_8_eof, user_r_read_8_open,
  user_w_write_8_wren, user_w_write_8_data, user_w_write_8_full,
  user_w_write_8_open, user_r_mem_8_rden, user_r_mem_8_data,
  user_r_mem_8_empty, user_r_mem_8_eof, user_r_mem_8_open, user_w_mem_8_wren,
  user_w_mem_8_data, user_w_mem_8_full, user_w_mem_8_open, user_mem_8_addr,
  user_mem_8_addr_update);

  input  PS_SRSTB;
  input  PS_CLK;
  input  PS_PORB;
  input  otg_oc;
  input  clk_100;
  input [31:0] user_rd_data;
  input  user_irq;
  input [7:0] user_r_smb_data;
  input  user_r_smb_empty;
  input  user_r_smb_eof;
  input  user_w_smb_full;
  input [31:0] user_r_audio_data;
  input  user_r_audio_empty;
  input  user_r_audio_eof;
  input  user_w_audio_full;
  input [31:0] user_r_read_32_data;
  input  user_r_read_32_empty;
  input  user_r_read_32_eof;
  input  user_w_write_32_full;
  input [7:0] user_r_read_8_data;
  input  user_r_read_8_empty;
  input  user_r_read_8_eof;
  input  user_w_write_8_full;
  input [7:0] user_r_mem_8_data;
  input  user_r_mem_8_empty;
  input  user_r_mem_8_eof;
  input  user_w_mem_8_full;
  output [3:0] GPIO_LED;
  output  quiesce;
  output  DDR_WEB;
  output  bus_clk;
  output [3:0] vga4_red;
  output [3:0] vga4_green;
  output [3:0] vga4_blue;
  output  vga_hsync;
  output  vga_vsync;
  output  user_clk;
  output  user_wren;
  output [3:0] user_wstrb;
  output  user_rden;
  output [31:0] user_wr_data;
  output [31:0] user_addr;
  output  user_r_smb_rden;
  output  user_r_smb_open;
  output  user_w_smb_wren;
  output [7:0] user_w_smb_data;
  output  user_w_smb_open;
  output  user_r_audio_rden;
  output  user_r_audio_open;
  output  user_w_audio_wren;
  output [31:0] user_w_audio_data;
  output  user_w_audio_open;
  output  user_r_read_32_rden;
  output  user_r_read_32_open;
  output  user_w_write_32_wren;
  output [31:0] user_w_write_32_data;
  output  user_w_write_32_open;
  output  user_r_read_8_rden;
  output  user_r_read_8_open;
  output  user_w_write_8_wren;
  output [7:0] user_w_write_8_data;
  output  user_w_write_8_open;
  output  user_r_mem_8_rden;
  output  user_r_mem_8_open;
  output  user_w_mem_8_wren;
  output [7:0] user_w_mem_8_data;
  output  user_w_mem_8_open;
  output [4:0] user_mem_8_addr;
  output  user_mem_8_addr_update;
  inout [53:0] MIO;
  inout  DDR_Clk;
  inout  DDR_Clk_n;
  inout  DDR_CKE;
  inout  DDR_CS_n;
  inout  DDR_RAS_n;
  inout  DDR_CAS_n;
  inout [2:0] DDR_BankAddr;
  inout [14:0] DDR_Addr;
  inout  DDR_ODT;
  inout  DDR_DRSTB;
  inout [31:0] DDR_DQ;
  inout [3:0] DDR_DM;
  inout [3:0] DDR_DQS;
  inout [3:0] DDR_DQS_n;
  inout  DDR_VRN;
  inout  DDR_VRP;
  inout [55:0] PS_GPIO;
  wire  bus_rst_n;
  wire [31:0] S_AXI_AWADDR;
  wire  S_AXI_AWVALID;
  wire [31:0] S_AXI_WDATA;
  wire [3:0] S_AXI_WSTRB;
  wire  S_AXI_WVALID;
  wire  S_AXI_BREADY;
  wire [31:0] S_AXI_ARADDR;
  wire  S_AXI_ARVALID;
  wire  S_AXI_RREADY;
  wire  S_AXI_ARREADY;
  wire [31:0] S_AXI_RDATA;
  wire [1:0] S_AXI_RRESP;
  wire  S_AXI_RVALID;
  wire  S_AXI_WREADY;
  wire [1:0] S_AXI_BRESP;
  wire  S_AXI_BVALID;
  wire  S_AXI_AWREADY;
  wire  M_AXI_ACP_ARREADY;
  wire  M_AXI_ACP_ARVALID;
  wire [31:0] M_AXI_ACP_ARADDR;
  wire [3:0] M_AXI_ACP_ARLEN;
  wire [2:0] M_AXI_ACP_ARSIZE;
  wire [1:0] M_AXI_ACP_ARBURST;
  wire [2:0] M_AXI_ACP_ARPROT;
  wire [3:0] M_AXI_ACP_ARCACHE;
  wire  M_AXI_ACP_RREADY;
  wire  M_AXI_ACP_RVALID;
  wire [63:0] M_AXI_ACP_RDATA;
  wire [1:0] M_AXI_ACP_RRESP;
  wire  M_AXI_ACP_RLAST;
  wire  M_AXI_ACP_AWREADY;
  wire  M_AXI_ACP_AWVALID;
  wire [31:0] M_AXI_ACP_AWADDR;
  wire [3:0] M_AXI_ACP_AWLEN;
  wire [2:0] M_AXI_ACP_AWSIZE;
  wire [1:0] M_AXI_ACP_AWBURST;
  wire [2:0] M_AXI_ACP_AWPROT;
  wire [3:0] M_AXI_ACP_AWCACHE;
  wire  M_AXI_ACP_WREADY;
  wire  M_AXI_ACP_WVALID;
  wire [63:0] M_AXI_ACP_WDATA;
  wire [7:0] M_AXI_ACP_WSTRB;
  wire  M_AXI_ACP_WLAST;
  wire  M_AXI_ACP_BREADY;
  wire  M_AXI_ACP_BVALID;
  wire [1:0] M_AXI_ACP_BRESP;
  wire  host_interrupt;
  wire [7:0] xillyvga_0_vga_red;
  wire [7:0] xillyvga_0_vga_green;
  wire [7:0] xillyvga_0_vga_blue;
  wire  vga_hsync_w;
  wire  vga_vsync_w;
  wire  USB0_VBUS_PWRFAULT;

   // This perl snippet turns the input/output ports to wires, so only
   // those that really connect something become real ports (input/output
   // keywords are used to create global variables)

     assign USB0_VBUS_PWRFAULT = !otg_oc;

     // synthesis attribute IOB of vga_iob_ff is "TRUE"

     FDCE vga_iob_ff [13:0]
     (
      .Q( { vga4_red, vga4_green, vga4_blue, vga_hsync, vga_vsync} ),
      .D( { xillyvga_0_vga_red[7:4],
	    xillyvga_0_vga_green[7:4],
	    xillyvga_0_vga_blue[7:4],
	    vga_hsync_w, vga_vsync_w } ),
      .C(vga_clk), .CE(1'b1), .CLR(1'b0)
      );

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .processing_system7_0_MIO ( MIO ),
      .processing_system7_0_PS_SRSTB ( PS_SRSTB ),
      .processing_system7_0_PS_CLK ( PS_CLK ),
      .processing_system7_0_PS_PORB ( PS_PORB ),
      .processing_system7_0_DDR_Clk ( DDR_Clk ),
      .processing_system7_0_DDR_Clk_n ( DDR_Clk_n ),
      .processing_system7_0_DDR_CKE ( DDR_CKE ),
      .processing_system7_0_DDR_CS_n ( DDR_CS_n ),
      .processing_system7_0_DDR_RAS_n ( DDR_RAS_n ),
      .processing_system7_0_DDR_CAS_n ( DDR_CAS_n ),
      .processing_system7_0_DDR_WEB ( DDR_WEB ),
      .processing_system7_0_DDR_BankAddr ( DDR_BankAddr ),
      .processing_system7_0_DDR_Addr ( DDR_Addr ),
      .processing_system7_0_DDR_ODT ( DDR_ODT ),
      .processing_system7_0_DDR_DRSTB ( DDR_DRSTB ),
      .processing_system7_0_DDR_DQ ( DDR_DQ ),
      .processing_system7_0_DDR_DM ( DDR_DM ),
      .processing_system7_0_DDR_DQS ( DDR_DQS ),
      .processing_system7_0_DDR_DQS_n ( DDR_DQS_n ),
      .processing_system7_0_DDR_VRN ( DDR_VRN ),
      .processing_system7_0_DDR_VRP ( DDR_VRP ),
      .processing_system7_0_GPIO ( PS_GPIO ),
      .processing_system7_0_USB0_VBUS_PWRFAULT ( USB0_VBUS_PWRFAULT ),

      .xillybus_bus_clk ( bus_clk ),
      .xillybus_bus_rst_n ( bus_rst_n ),
      .xillybus_S_AXI_AWADDR ( S_AXI_AWADDR ),
      .xillybus_S_AXI_AWVALID ( S_AXI_AWVALID ),
      .xillybus_S_AXI_WDATA ( S_AXI_WDATA ),
      .xillybus_S_AXI_WSTRB ( S_AXI_WSTRB ),
      .xillybus_S_AXI_WVALID ( S_AXI_WVALID ),
      .xillybus_S_AXI_BREADY ( S_AXI_BREADY ),
      .xillybus_S_AXI_ARADDR ( S_AXI_ARADDR ),
      .xillybus_S_AXI_ARVALID ( S_AXI_ARVALID ),
      .xillybus_S_AXI_RREADY ( S_AXI_RREADY ),
      .xillybus_S_AXI_ARREADY ( S_AXI_ARREADY ),
      .xillybus_S_AXI_RDATA ( S_AXI_RDATA ),
      .xillybus_S_AXI_RRESP ( S_AXI_RRESP ),
      .xillybus_S_AXI_RVALID ( S_AXI_RVALID ),
      .xillybus_S_AXI_WREADY ( S_AXI_WREADY ),
      .xillybus_S_AXI_BRESP ( S_AXI_BRESP ),
      .xillybus_S_AXI_BVALID ( S_AXI_BVALID ),
      .xillybus_S_AXI_AWREADY ( S_AXI_AWREADY ),
      .xillybus_M_AXI_ARREADY ( M_AXI_ACP_ARREADY ),
      .xillybus_M_AXI_ARVALID ( M_AXI_ACP_ARVALID ),
      .xillybus_M_AXI_ARADDR ( M_AXI_ACP_ARADDR ),
      .xillybus_M_AXI_ARLEN ( M_AXI_ACP_ARLEN ),
      .xillybus_M_AXI_ARSIZE ( M_AXI_ACP_ARSIZE ),
      .xillybus_M_AXI_ARBURST ( M_AXI_ACP_ARBURST ),
      .xillybus_M_AXI_ARPROT ( M_AXI_ACP_ARPROT ),
      .xillybus_M_AXI_ARCACHE ( M_AXI_ACP_ARCACHE ),
      .xillybus_M_AXI_RREADY ( M_AXI_ACP_RREADY ),
      .xillybus_M_AXI_RVALID ( M_AXI_ACP_RVALID ),
      .xillybus_M_AXI_RDATA ( M_AXI_ACP_RDATA ),
      .xillybus_M_AXI_RRESP ( M_AXI_ACP_RRESP ),
      .xillybus_M_AXI_RLAST ( M_AXI_ACP_RLAST ),
      .xillybus_M_AXI_AWREADY ( M_AXI_ACP_AWREADY ),
      .xillybus_M_AXI_AWVALID ( M_AXI_ACP_AWVALID ),
      .xillybus_M_AXI_AWADDR ( M_AXI_ACP_AWADDR ),
      .xillybus_M_AXI_AWLEN ( M_AXI_ACP_AWLEN ),
      .xillybus_M_AXI_AWSIZE ( M_AXI_ACP_AWSIZE ),
      .xillybus_M_AXI_AWBURST ( M_AXI_ACP_AWBURST ),
      .xillybus_M_AXI_AWPROT ( M_AXI_ACP_AWPROT ),
      .xillybus_M_AXI_AWCACHE ( M_AXI_ACP_AWCACHE ),
      .xillybus_M_AXI_WREADY ( M_AXI_ACP_WREADY ),
      .xillybus_M_AXI_WVALID ( M_AXI_ACP_WVALID ),
      .xillybus_M_AXI_WDATA ( M_AXI_ACP_WDATA ),
      .xillybus_M_AXI_WSTRB ( M_AXI_ACP_WSTRB ),
      .xillybus_M_AXI_WLAST ( M_AXI_ACP_WLAST ),
      .xillybus_M_AXI_BREADY ( M_AXI_ACP_BREADY ),
      .xillybus_M_AXI_BVALID ( M_AXI_ACP_BVALID ),
      .xillybus_M_AXI_BRESP ( M_AXI_ACP_BRESP ),
      .xillybus_host_interrupt ( host_interrupt ),
      .xillyvga_0_clk_in ( clk_100 ),
      .xillyvga_0_vga_hsync ( vga_hsync_w ),
      .xillyvga_0_vga_vsync ( vga_vsync_w ),
      .xillyvga_0_vga_de ( ), // For use with DVI
      .xillyvga_0_vga_red ( xillyvga_0_vga_red ),
      .xillyvga_0_vga_green ( xillyvga_0_vga_green ),
      .xillyvga_0_vga_blue ( xillyvga_0_vga_blue ),
      .xillyvga_0_vga_clk(vga_clk),
      .xillybus_lite_0_user_clk_pin ( user_clk ),
      .xillybus_lite_0_user_wren_pin ( user_wren ),
      .xillybus_lite_0_user_wstrb_pin ( user_wstrb ),
      .xillybus_lite_0_user_rden_pin ( user_rden ),
      .xillybus_lite_0_user_rd_data_pin ( user_rd_data ),
      .xillybus_lite_0_user_wr_data_pin ( user_wr_data ),
      .xillybus_lite_0_user_addr_pin ( user_addr ),
      .xillybus_lite_0_user_irq_pin ( user_irq )
    );

  xillybus_core  xillybus_core_ins(.user_r_mem_8_rden_w(user_r_mem_8_rden),
    .user_r_mem_8_data_w(user_r_mem_8_data), .user_r_mem_8_empty_w(user_r_mem_8_empty),
    .user_r_mem_8_eof_w(user_r_mem_8_eof), .user_r_mem_8_open_w(user_r_mem_8_open),
    .user_w_mem_8_wren_w(user_w_mem_8_wren), .user_w_mem_8_data_w(user_w_mem_8_data),
    .user_w_mem_8_full_w(user_w_mem_8_full), .user_w_mem_8_open_w(user_w_mem_8_open),
    .user_mem_8_addr_w(user_mem_8_addr), .user_mem_8_addr_update_w(user_mem_8_addr_update),
    .GPIO_LED_w(GPIO_LED), .bus_clk_w(bus_clk), .bus_rst_n_w(bus_rst_n),
    .S_AXI_AWADDR_w(S_AXI_AWADDR), .S_AXI_AWVALID_w(S_AXI_AWVALID),
    .S_AXI_WDATA_w(S_AXI_WDATA), .quiesce_w(quiesce),
    .S_AXI_WSTRB_w(S_AXI_WSTRB), .S_AXI_WVALID_w(S_AXI_WVALID),
    .S_AXI_BREADY_w(S_AXI_BREADY), .S_AXI_ARADDR_w(S_AXI_ARADDR),
    .S_AXI_ARVALID_w(S_AXI_ARVALID), .S_AXI_RREADY_w(S_AXI_RREADY),
    .S_AXI_ARREADY_w(S_AXI_ARREADY), .S_AXI_RDATA_w(S_AXI_RDATA),
    .S_AXI_RRESP_w(S_AXI_RRESP), .S_AXI_RVALID_w(S_AXI_RVALID),
    .S_AXI_WREADY_w(S_AXI_WREADY), .S_AXI_BRESP_w(S_AXI_BRESP),
    .S_AXI_BVALID_w(S_AXI_BVALID), .S_AXI_AWREADY_w(S_AXI_AWREADY),
    .M_AXI_ACP_ARREADY_w(M_AXI_ACP_ARREADY), .M_AXI_ACP_ARVALID_w(M_AXI_ACP_ARVALID),
    .M_AXI_ACP_ARADDR_w(M_AXI_ACP_ARADDR), .M_AXI_ACP_ARLEN_w(M_AXI_ACP_ARLEN),
    .M_AXI_ACP_ARSIZE_w(M_AXI_ACP_ARSIZE), .M_AXI_ACP_ARBURST_w(M_AXI_ACP_ARBURST),
    .M_AXI_ACP_ARPROT_w(M_AXI_ACP_ARPROT), .M_AXI_ACP_ARCACHE_w(M_AXI_ACP_ARCACHE),
    .M_AXI_ACP_RREADY_w(M_AXI_ACP_RREADY), .M_AXI_ACP_RVALID_w(M_AXI_ACP_RVALID),
    .M_AXI_ACP_RDATA_w(M_AXI_ACP_RDATA), .user_r_smb_rden_w(user_r_smb_rden),
    .user_r_smb_data_w(user_r_smb_data), .user_r_smb_empty_w(user_r_smb_empty),
    .user_r_smb_eof_w(user_r_smb_eof), .M_AXI_ACP_RRESP_w(M_AXI_ACP_RRESP),
    .user_r_smb_open_w(user_r_smb_open), .M_AXI_ACP_RLAST_w(M_AXI_ACP_RLAST),
    .M_AXI_ACP_AWREADY_w(M_AXI_ACP_AWREADY), .M_AXI_ACP_AWVALID_w(M_AXI_ACP_AWVALID),
    .M_AXI_ACP_AWADDR_w(M_AXI_ACP_AWADDR), .M_AXI_ACP_AWLEN_w(M_AXI_ACP_AWLEN),
    .M_AXI_ACP_AWSIZE_w(M_AXI_ACP_AWSIZE), .user_w_smb_wren_w(user_w_smb_wren),
    .user_w_smb_data_w(user_w_smb_data), .user_w_smb_full_w(user_w_smb_full),
    .user_w_smb_open_w(user_w_smb_open), .M_AXI_ACP_AWBURST_w(M_AXI_ACP_AWBURST),
    .M_AXI_ACP_AWPROT_w(M_AXI_ACP_AWPROT), .M_AXI_ACP_AWCACHE_w(M_AXI_ACP_AWCACHE),
    .M_AXI_ACP_WREADY_w(M_AXI_ACP_WREADY), .user_r_audio_rden_w(user_r_audio_rden),
    .user_r_audio_data_w(user_r_audio_data), .user_r_audio_empty_w(user_r_audio_empty),
    .user_r_audio_eof_w(user_r_audio_eof), .M_AXI_ACP_WVALID_w(M_AXI_ACP_WVALID),
    .user_r_audio_open_w(user_r_audio_open), .M_AXI_ACP_WDATA_w(M_AXI_ACP_WDATA),
    .M_AXI_ACP_WSTRB_w(M_AXI_ACP_WSTRB), .M_AXI_ACP_WLAST_w(M_AXI_ACP_WLAST),
    .M_AXI_ACP_BREADY_w(M_AXI_ACP_BREADY), .M_AXI_ACP_BVALID_w(M_AXI_ACP_BVALID),
    .M_AXI_ACP_BRESP_w(M_AXI_ACP_BRESP), .user_w_audio_wren_w(user_w_audio_wren),
    .user_w_audio_data_w(user_w_audio_data), .user_w_audio_full_w(user_w_audio_full),
    .host_interrupt_w(host_interrupt), .user_w_audio_open_w(user_w_audio_open),
    .user_r_read_32_rden_w(user_r_read_32_rden), .user_r_read_32_data_w(user_r_read_32_data),
    .user_r_read_32_empty_w(user_r_read_32_empty),
    .user_r_read_32_eof_w(user_r_read_32_eof), .user_r_read_32_open_w(user_r_read_32_open),
    .user_w_write_32_wren_w(user_w_write_32_wren),
    .user_w_write_32_data_w(user_w_write_32_data),
    .user_w_write_32_full_w(user_w_write_32_full),
    .user_w_write_32_open_w(user_w_write_32_open),
    .user_r_read_8_rden_w(user_r_read_8_rden), .user_r_read_8_data_w(user_r_read_8_data),
    .user_r_read_8_empty_w(user_r_read_8_empty), .user_r_read_8_eof_w(user_r_read_8_eof),
    .user_r_read_8_open_w(user_r_read_8_open), .user_w_write_8_wren_w(user_w_write_8_wren),
    .user_w_write_8_data_w(user_w_write_8_data), .user_w_write_8_full_w(user_w_write_8_full),
    .user_w_write_8_open_w(user_w_write_8_open));

endmodule
