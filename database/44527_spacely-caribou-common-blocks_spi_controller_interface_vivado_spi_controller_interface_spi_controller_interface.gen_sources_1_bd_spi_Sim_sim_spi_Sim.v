// This program was cloned from: https://github.com/SpacelyProject/spacely-caribou-common-blocks
// License: Apache License 2.0

//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
//Date        : Thu Apr 25 15:18:14 2024
//Host        : metal.fnal.gov running 64-bit unknown
//Command     : generate_target spi_Sim.bd
//Design      : spi_Sim
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "spi_Sim,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=spi_Sim,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "spi_Sim.hwdef" *) 
module spi_Sim
   (clock,
    cs_b,
    pico,
    poci,
    reset,
    spi_clk);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLOCK, ASSOCIATED_RESET reset, CLK_DOMAIN spi_Sim_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clock;
  output cs_b;
  output pico;
  input poci;
  input reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SPI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SPI_CLK, CLK_DOMAIN spi_Sim_spi_controller_inter_0_0_spi_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output spi_clk;

  wire [10:0]axi_vip_0_M_AXI_ARADDR;
  wire [2:0]axi_vip_0_M_AXI_ARPROT;
  wire axi_vip_0_M_AXI_ARREADY;
  wire axi_vip_0_M_AXI_ARVALID;
  wire [10:0]axi_vip_0_M_AXI_AWADDR;
  wire [2:0]axi_vip_0_M_AXI_AWPROT;
  wire axi_vip_0_M_AXI_AWREADY;
  wire axi_vip_0_M_AXI_AWVALID;
  wire axi_vip_0_M_AXI_BREADY;
  wire [1:0]axi_vip_0_M_AXI_BRESP;
  wire axi_vip_0_M_AXI_BVALID;
  wire [31:0]axi_vip_0_M_AXI_RDATA;
  wire axi_vip_0_M_AXI_RREADY;
  wire [1:0]axi_vip_0_M_AXI_RRESP;
  wire axi_vip_0_M_AXI_RVALID;
  wire [31:0]axi_vip_0_M_AXI_WDATA;
  wire axi_vip_0_M_AXI_WREADY;
  wire [3:0]axi_vip_0_M_AXI_WSTRB;
  wire axi_vip_0_M_AXI_WVALID;
  wire clock_1;
  wire poci_1;
  wire reset_1;
  wire spi_controller_inter_0_cs_b;
  wire spi_controller_inter_0_pico;
  wire spi_controller_inter_0_spi_clk;

  assign clock_1 = clock;
  assign cs_b = spi_controller_inter_0_cs_b;
  assign pico = spi_controller_inter_0_pico;
  assign poci_1 = poci;
  assign reset_1 = reset;
  assign spi_clk = spi_controller_inter_0_spi_clk;
  spi_Sim_axi_vip_0_0 axi_vip_0
       (.aclk(clock_1),
        .aresetn(reset_1),
        .m_axi_araddr(axi_vip_0_M_AXI_ARADDR),
        .m_axi_arprot(axi_vip_0_M_AXI_ARPROT),
        .m_axi_arready(axi_vip_0_M_AXI_ARREADY),
        .m_axi_arvalid(axi_vip_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_vip_0_M_AXI_AWADDR),
        .m_axi_awprot(axi_vip_0_M_AXI_AWPROT),
        .m_axi_awready(axi_vip_0_M_AXI_AWREADY),
        .m_axi_awvalid(axi_vip_0_M_AXI_AWVALID),
        .m_axi_bready(axi_vip_0_M_AXI_BREADY),
        .m_axi_bresp(axi_vip_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_vip_0_M_AXI_BVALID),
        .m_axi_rdata(axi_vip_0_M_AXI_RDATA),
        .m_axi_rready(axi_vip_0_M_AXI_RREADY),
        .m_axi_rresp(axi_vip_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_vip_0_M_AXI_RVALID),
        .m_axi_wdata(axi_vip_0_M_AXI_WDATA),
        .m_axi_wready(axi_vip_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_vip_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_vip_0_M_AXI_WVALID));
  spi_Sim_spi_controller_inter_0_0 spi_controller_inter_0
       (.S_AXI_ACLK(clock_1),
        .S_AXI_ARADDR(axi_vip_0_M_AXI_ARADDR),
        .S_AXI_ARESETN(reset_1),
        .S_AXI_ARPROT(axi_vip_0_M_AXI_ARPROT),
        .S_AXI_ARREADY(axi_vip_0_M_AXI_ARREADY),
        .S_AXI_ARVALID(axi_vip_0_M_AXI_ARVALID),
        .S_AXI_AWADDR(axi_vip_0_M_AXI_AWADDR),
        .S_AXI_AWPROT(axi_vip_0_M_AXI_AWPROT),
        .S_AXI_AWREADY(axi_vip_0_M_AXI_AWREADY),
        .S_AXI_AWVALID(axi_vip_0_M_AXI_AWVALID),
        .S_AXI_BREADY(axi_vip_0_M_AXI_BREADY),
        .S_AXI_BRESP(axi_vip_0_M_AXI_BRESP),
        .S_AXI_BVALID(axi_vip_0_M_AXI_BVALID),
        .S_AXI_RDATA(axi_vip_0_M_AXI_RDATA),
        .S_AXI_RREADY(axi_vip_0_M_AXI_RREADY),
        .S_AXI_RRESP(axi_vip_0_M_AXI_RRESP),
        .S_AXI_RVALID(axi_vip_0_M_AXI_RVALID),
        .S_AXI_WDATA(axi_vip_0_M_AXI_WDATA),
        .S_AXI_WREADY(axi_vip_0_M_AXI_WREADY),
        .S_AXI_WSTRB(axi_vip_0_M_AXI_WSTRB),
        .S_AXI_WVALID(axi_vip_0_M_AXI_WVALID),
        .cs_b(spi_controller_inter_0_cs_b),
        .pico(spi_controller_inter_0_pico),
        .poci(poci_1),
        .spi_clk(spi_controller_inter_0_spi_clk));
endmodule
