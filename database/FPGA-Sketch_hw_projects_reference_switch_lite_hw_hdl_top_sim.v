// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

//-
// Copyright (c) 2015 Noa Zilberman, Georgina Kalogeridou
// Copyright (c) 2021 Yuta Tokusashi
// All rights reserved.
//
// This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme,
// and by the University of Cambridge Computer Laboratory under EPSRC EARL Project
// EP/P025374/1 alongside support from Xilinx Inc.
//
//  File:
//        top_sim.v
//
//  Module:
//        top
//
//  Author: Noa Zilberman, Georgina Kalogeridou
//
//  Description:
//        reference nic top module
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//

`timescale 1ps / 100 fs

 module top_sim # (
  parameter          C_DATA_WIDTH                        = 512,         // RX/TX interface data width
  parameter          C_TUSER_WIDTH                       = 128,         // RX/TX interface data width  
  parameter          C_NF_DATA_WIDTH                     = 1024,         // RX/TX interface data width
  parameter          KEEP_WIDTH                          = C_DATA_WIDTH / 32
 ) (

//PCI Express
  input  [15:0]  pcie_rxn,
  input  [15:0]  pcie_rxp,
  output [15:0]  pcie_txn,
  output [15:0]  pcie_txp,
  //Network Interface
  input  [3:0]   qsfp0_rxp,
  input  [3:0]   qsfp0_rxn,
  output [3:0]   qsfp0_txp,
  output [3:0]   qsfp0_txn,

  input  [3:0]   qsfp1_rxp,
  input  [3:0]   qsfp1_rxn,
  output [3:0]   qsfp1_txp,
  output [3:0]   qsfp1_txn,

  // PCIe Clock
  input          pci_clk_p,
  input          pci_clk_n,

  //200MHz Clock
  input          fpga_sysclk_p,
  input          fpga_sysclk_n,

  // 156.25 MHz clock in
  input          qsfp_refclk_p,
  input          qsfp_refclk_n,

  input          sys_reset_n
);

  //----------------------------------------------------------------------------------------------------------------//
  //    System(SYS) Interface                                                                                       //
  //----------------------------------------------------------------------------------------------------------------//

  wire                                       sys_clk;
  wire                                       clk_200_i;
  wire                                       clk_200;
  wire                                       sys_rst_n_c;

    //-----------------------------------------------------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------------------------------------------//
  // axis interface                                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//

  wire[C_NF_DATA_WIDTH-1:0]      axis_i_0_tdata , axis_o_0_tdata;
  wire                        axis_i_0_tvalid, axis_o_0_tvalid;
  wire                        axis_i_0_tlast , axis_o_0_tlast;
  wire[C_TUSER_WIDTH-1:0]     axis_i_0_tuser , axis_o_0_tuser;
  wire[C_NF_DATA_WIDTH/8-1:0]    axis_i_0_tkeep , axis_o_0_tkeep;
  wire                        axis_i_0_tready, axis_o_0_tready;

  wire[C_NF_DATA_WIDTH-1:0]      axis_i_1_tdata , axis_o_1_tdata;
  wire                        axis_i_1_tvalid, axis_o_1_tvalid;
  wire                        axis_i_1_tlast , axis_o_1_tlast;
  wire[C_TUSER_WIDTH-1:0]     axis_i_1_tuser , axis_o_1_tuser;
  wire[C_NF_DATA_WIDTH/8-1:0]    axis_i_1_tkeep , axis_o_1_tkeep;
  wire                        axis_i_1_tready, axis_o_1_tready;

  wire[C_NF_DATA_WIDTH-1:0]      axis_dma_i_tdata , axis_dma_o_tdata;
  wire                        axis_dma_i_tvalid, axis_dma_o_tvalid;
  wire                        axis_dma_i_tlast , axis_dma_o_tlast;
  wire[C_TUSER_WIDTH-1:0]     axis_dma_i_tuser , axis_dma_o_tuser;
  wire[C_NF_DATA_WIDTH/8-1:0]    axis_dma_i_tkeep , axis_dma_o_tkeep;
  wire                        axis_dma_i_tready, axis_dma_o_tready;

  wire[C_DATA_WIDTH-1:0]      p_axis_i_0_tdata , p_axis_o_0_tdata;
  wire                        p_axis_i_0_tvalid, p_axis_o_0_tvalid;
  wire                        p_axis_i_0_tlast , p_axis_o_0_tlast;
  wire[C_TUSER_WIDTH-1:0]     p_axis_i_0_tuser , p_axis_o_0_tuser;
  wire[C_DATA_WIDTH/8-1:0]    p_axis_i_0_tkeep , p_axis_o_0_tkeep;
  wire                        p_axis_i_0_tready, p_axis_o_0_tready;

  wire[C_DATA_WIDTH-1:0]      p_axis_i_1_tdata , p_axis_o_1_tdata;
  wire                        p_axis_i_1_tvalid, p_axis_o_1_tvalid;
  wire                        p_axis_i_1_tlast , p_axis_o_1_tlast;
  wire[C_TUSER_WIDTH-1:0]     p_axis_i_1_tuser , p_axis_o_1_tuser;
  wire[C_DATA_WIDTH/8-1:0]    p_axis_i_1_tkeep , p_axis_o_1_tkeep;
  wire                        p_axis_i_1_tready, p_axis_o_1_tready;

  wire[C_DATA_WIDTH-1:0]      p_axis_dma_i_tdata , p_axis_dma_o_tdata;
  wire                        p_axis_dma_i_tvalid, p_axis_dma_o_tvalid;
  wire                        p_axis_dma_i_tlast , p_axis_dma_o_tlast;
  wire[C_TUSER_WIDTH-1:0]     p_axis_dma_i_tuser , p_axis_dma_o_tuser;
  wire[C_DATA_WIDTH/8-1:0]    p_axis_dma_i_tkeep , p_axis_dma_o_tkeep;
  wire                        p_axis_dma_i_tready, p_axis_dma_o_tready;
 //----------------------------------------------------------------------------------------------------------------//
 // AXI Lite interface                                                                                                 //
 //----------------------------------------------------------------------------------------------------------------//
  wire [31:0]   M0_AXI_araddr , M1_AXI_araddr , M2_AXI_araddr;
  wire [2:0]    M0_AXI_arprot , M1_AXI_arprot , M2_AXI_arprot;
  wire          M0_AXI_arready, M1_AXI_arready, M2_AXI_arready;
  wire          M0_AXI_arvalid, M1_AXI_arvalid, M2_AXI_arvalid;
  wire [31:0]   M0_AXI_awaddr , M1_AXI_awaddr , M2_AXI_awaddr;
  wire [2:0]    M0_AXI_awprot , M1_AXI_awprot , M2_AXI_awprot;
  wire          M0_AXI_awready, M1_AXI_awready, M2_AXI_awready;
  wire          M0_AXI_awvalid, M1_AXI_awvalid, M2_AXI_awvalid;
  wire          M0_AXI_bready , M1_AXI_bready , M2_AXI_bready;
  wire [1:0]    M0_AXI_bresp  , M1_AXI_bresp  , M2_AXI_bresp;
  wire          M0_AXI_bvalid , M1_AXI_bvalid , M2_AXI_bvalid;
  wire [31:0]   M0_AXI_rdata  , M1_AXI_rdata  , M2_AXI_rdata;
  wire          M0_AXI_rready , M1_AXI_rready , M2_AXI_rready;
  wire [1:0]    M0_AXI_rresp  , M1_AXI_rresp  , M2_AXI_rresp;
  wire          M0_AXI_rvalid , M1_AXI_rvalid , M2_AXI_rvalid;
  wire [31:0]   M0_AXI_wdata  , M1_AXI_wdata  , M2_AXI_wdata;
  wire          M0_AXI_wready , M1_AXI_wready , M2_AXI_wready;
  wire [3:0]    M0_AXI_wstrb  , M1_AXI_wstrb  , M2_AXI_wstrb;
  wire          M0_AXI_wvalid , M1_AXI_wvalid , M2_AXI_wvalid;
  
  wire [31:0]   M3_AXI_araddr , M4_AXI_araddr , M5_AXI_araddr;
  wire [2:0]    M3_AXI_arprot , M4_AXI_arprot , M5_AXI_arprot;
  wire          M3_AXI_arready, M4_AXI_arready, M5_AXI_arready;
  wire          M3_AXI_arvalid, M4_AXI_arvalid, M5_AXI_arvalid;
  wire [31:0]   M3_AXI_awaddr , M4_AXI_awaddr , M5_AXI_awaddr;
  wire [2:0]    M3_AXI_awprot , M4_AXI_awprot , M5_AXI_awprot;
  wire          M3_AXI_awready, M4_AXI_awready, M5_AXI_awready;
  wire          M3_AXI_awvalid, M4_AXI_awvalid, M5_AXI_awvalid;
  wire          M3_AXI_bready , M4_AXI_bready , M5_AXI_bready;
  wire [1:0]    M3_AXI_bresp  , M4_AXI_bresp  , M5_AXI_bresp;
  wire          M3_AXI_bvalid , M4_AXI_bvalid , M5_AXI_bvalid;
  wire [31:0]   M3_AXI_rdata  , M4_AXI_rdata  , M5_AXI_rdata;
  wire          M3_AXI_rready , M4_AXI_rready , M5_AXI_rready;
  wire [1:0]    M3_AXI_rresp  , M4_AXI_rresp  , M5_AXI_rresp;
  wire          M3_AXI_rvalid , M4_AXI_rvalid , M5_AXI_rvalid;
  wire [31:0]   M3_AXI_wdata  , M4_AXI_wdata  , M5_AXI_wdata;
  wire          M3_AXI_wready , M4_AXI_wready , M5_AXI_wready;
  wire [3:0]    M3_AXI_wstrb  , M4_AXI_wstrb  , M5_AXI_wstrb;
  wire          M3_AXI_wvalid , M4_AXI_wvalid , M5_AXI_wvalid;

  wire [31:0]   S00_AXI_araddr;
  wire [2:0]    S00_AXI_arprot /*= 3'b010*/;
  wire          S00_AXI_arready;
  wire          S00_AXI_arvalid;
  wire [31:0]   S00_AXI_awaddr;
  wire [2:0]    S00_AXI_awprot /*= 3'b010*/;
  wire          S00_AXI_awready;
  wire          S00_AXI_awvalid;
  wire          S00_AXI_bready;
  wire [1:0]    S00_AXI_bresp;
  wire          S00_AXI_bvalid;
  wire [31:0]   S00_AXI_rdata;
  wire          S00_AXI_rready;
  wire [1:0]    S00_AXI_rresp;
  wire          S00_AXI_rvalid;
  wire [31:0]   S00_AXI_wdata;
  wire          S00_AXI_wready;
  wire [3:0]    S00_AXI_wstrb;
  wire          S00_AXI_wvalid;

  // Network Interfaces
  wire axi_aresetn;
  wire axi_clk;
  wire [10:0] counter0,counter1,counter2,counter3,counter4;
  wire activity_stim4, activity_stim3, activity_stim2, activity_stim1, activity_stim0;
  wire activity_rec4, activity_rec3, activity_rec2, activity_rec1, activity_rec0;
  wire barrier_req0, barrier_req1, barrier_req2, barrier_req3, barrier_req4;
  wire barrier_proceed;
  wire activity_trans_sim;
  wire activity_trans_log;
  wire barrier_req_trans;

  //---------------------------------------------------------------------
  // Misc 
  //---------------------------------------------------------------------
	IBUF   sys_reset_n_ibuf (  .O(sys_rst_n_c),   .I(sys_reset_n));
  
	reg [15:0] sys_clk_count;
	always @(posedge ~sys_clk)        
		sys_clk_count  <= sys_clk_count + 1'b1;

	IBUFDS_GTE2 #(
		.CLKCM_CFG("TRUE"),   // Refer to Transceiver User Guide
		.CLKRCV_TRST("TRUE"), // Refer to Transceiver User Guide
		.CLKSWING_CFG(2'b11)  // Refer to Transceiver User Guide
	) IBUFDS_GTE2_inst (
		.O     (sys_clk),         // 1-bit output: Refer to Transceiver User Guide
		.ODIV2 (),            // 1-bit output: Refer to Transceiver User Guide
		.CEB   (1'b0),          // 1-bit input: Refer to Transceiver User Guide
		.I     (pci_clk_p),        // 1-bit input: Refer to Transceiver User Guide
		.IB    (pci_clk_n)        // 1-bit input: Refer to Transceiver User Guide
	);  


	IBUFDS_GTE2 #(
		.CLKCM_CFG("TRUE"),   // Refer to Transceiver User Guide
		.CLKRCV_TRST("TRUE"), // Refer to Transceiver User Guide
		.CLKSWING_CFG(2'b11)  // Refer to Transceiver User Guide
	) IBUFDS_GTE2_core_inst (
		.O     (clk_200),         // 1-bit output: Refer to Transceiver User Guide
		.ODIV2 (),            // 1-bit output: Refer to Transceiver User Guide
		.CEB   (1'b0),          // 1-bit input: Refer to Transceiver User Guide
		.I     (fpga_sysclk_p),        // 1-bit input: Refer to Transceiver User Guide
		.IB    (fpga_sysclk_n)        // 1-bit input: Refer to Transceiver User Guide
	);  

	// drive AXI-lite from sys_clk & sys_rst
	assign axi_clk     = sys_clk;
	assign axi_aresetn = sys_rst_n_c;

//-----------------------------------------------------------------------------------------------//
// Network modules                                                                               //
//-----------------------------------------------------------------------------------------------//

	nf_datapath 
	#(
		// Master AXI Stream Data Width
		.C_M_AXIS_DATA_WIDTH (C_NF_DATA_WIDTH),
		.C_S_AXIS_DATA_WIDTH (C_NF_DATA_WIDTH),
		.C_M_AXIS_TUSER_WIDTH (128),
		.C_S_AXIS_TUSER_WIDTH (128),
		.NUM_QUEUES (5)
	)
	nf_datapath_0 
	(
		.axis_aclk                      (clk_200),
		.axis_resetn                    (sys_rst_n_c),
		.axi_aclk                       (axi_clk),
		.axi_resetn                     (axi_aresetn),
		    
		// Slave Stream Ports (interface from Rx queues)
		.s_axis_0_tdata                 (axis_i_0_tdata),
		.s_axis_0_tkeep                 (axis_i_0_tkeep),
		.s_axis_0_tuser                 (axis_i_0_tuser),
		.s_axis_0_tvalid                (axis_i_0_tvalid),
		.s_axis_0_tready                (axis_i_0_tready),
		.s_axis_0_tlast                 (axis_i_0_tlast),
		.s_axis_1_tdata                 (axis_i_1_tdata),
		.s_axis_1_tkeep                 (axis_i_1_tkeep),
		.s_axis_1_tuser                 (axis_i_1_tuser),
		.s_axis_1_tvalid                (axis_i_1_tvalid),
		.s_axis_1_tready                (axis_i_1_tready),
		.s_axis_1_tlast                 (axis_i_1_tlast),
		.s_axis_2_tdata                 (axis_dma_i_tdata),
		.s_axis_2_tkeep                 (axis_dma_i_tkeep),
		.s_axis_2_tuser                 (axis_dma_i_tuser),
		.s_axis_2_tvalid                (axis_dma_i_tvalid),
		.s_axis_2_tready                (axis_dma_i_tready),
		.s_axis_2_tlast                 (axis_dma_i_tlast),
		
		
		// Master Stream Ports (interface to TX queues)
		.m_axis_0_tdata                 (axis_o_0_tdata),
		.m_axis_0_tkeep                 (axis_o_0_tkeep),
		.m_axis_0_tuser                 (axis_o_0_tuser),
		.m_axis_0_tvalid                (axis_o_0_tvalid),
		.m_axis_0_tready                (axis_o_0_tready),
		.m_axis_0_tlast                 (axis_o_0_tlast),
		.m_axis_1_tdata                 (axis_o_1_tdata),
		.m_axis_1_tkeep                 (axis_o_1_tkeep),
		.m_axis_1_tuser                 (axis_o_1_tuser),
		.m_axis_1_tvalid                (axis_o_1_tvalid),
		.m_axis_1_tready                (axis_o_1_tready),
		.m_axis_1_tlast                 (axis_o_1_tlast),
		.m_axis_2_tdata                 (axis_dma_o_tdata),
		.m_axis_2_tkeep                 (axis_dma_o_tkeep),
		.m_axis_2_tuser                 (axis_dma_o_tuser),
		.m_axis_2_tvalid                (axis_dma_o_tvalid),
		.m_axis_2_tready                (axis_dma_o_tready),
		.m_axis_2_tlast                 (axis_dma_o_tlast),

		//AXI-Lite interface  
		.S0_AXI_AWADDR                  (M0_AXI_awaddr),
		.S0_AXI_AWVALID                 (M0_AXI_awvalid),
		.S0_AXI_WDATA                   (M0_AXI_wdata),
		.S0_AXI_WSTRB                   (M0_AXI_wstrb),
		.S0_AXI_WVALID                  (M0_AXI_wvalid),
		.S0_AXI_BREADY                  (M0_AXI_bready),
		.S0_AXI_ARADDR                  (M0_AXI_araddr),
		.S0_AXI_ARVALID                 (M0_AXI_arvalid),
		.S0_AXI_RREADY                  (M0_AXI_rready),
		.S0_AXI_ARREADY                 (M0_AXI_arready),
		.S0_AXI_RDATA                   (M0_AXI_rdata),
		.S0_AXI_RRESP                   (M0_AXI_rresp),
		.S0_AXI_RVALID                  (M0_AXI_rvalid),
		.S0_AXI_WREADY                  (M0_AXI_wready),
		.S0_AXI_BRESP                   (M0_AXI_bresp),
		.S0_AXI_BVALID                  (M0_AXI_bvalid),
		.S0_AXI_AWREADY                 (M0_AXI_awready),
		
		.S1_AXI_AWADDR                  (M1_AXI_awaddr),
		.S1_AXI_AWVALID                 (M1_AXI_awvalid),
		.S1_AXI_WDATA                   (M1_AXI_wdata),
		.S1_AXI_WSTRB                   (M1_AXI_wstrb),
		.S1_AXI_WVALID                  (M1_AXI_wvalid),
		.S1_AXI_BREADY                  (M1_AXI_bready),
		.S1_AXI_ARADDR                  (M1_AXI_araddr),
		.S1_AXI_ARVALID                 (M1_AXI_arvalid),
		.S1_AXI_RREADY                  (M1_AXI_rready),
		.S1_AXI_ARREADY                 (M1_AXI_arready),
		.S1_AXI_RDATA                   (M1_AXI_rdata),
		.S1_AXI_RRESP                   (M1_AXI_rresp),
		.S1_AXI_RVALID                  (M1_AXI_rvalid),
		.S1_AXI_WREADY                  (M1_AXI_wready),
		.S1_AXI_BRESP                   (M1_AXI_bresp),
		.S1_AXI_BVALID                  (M1_AXI_bvalid),
		.S1_AXI_AWREADY                 (M1_AXI_awready),
		
		.S2_AXI_AWADDR                  (M2_AXI_awaddr),
		.S2_AXI_AWVALID                 (M2_AXI_awvalid),
		.S2_AXI_WDATA                   (M2_AXI_wdata),
		.S2_AXI_WSTRB                   (M2_AXI_wstrb),
		.S2_AXI_WVALID                  (M2_AXI_wvalid),
		.S2_AXI_BREADY                  (M2_AXI_bready),
		.S2_AXI_ARADDR                  (M2_AXI_araddr),
		.S2_AXI_ARVALID                 (M2_AXI_arvalid),
		.S2_AXI_RREADY                  (M2_AXI_rready),
		.S2_AXI_ARREADY                 (M2_AXI_arready),
		.S2_AXI_RDATA                   (M2_AXI_rdata),
		.S2_AXI_RRESP                   (M2_AXI_rresp),
		.S2_AXI_RVALID                  (M2_AXI_rvalid),
		.S2_AXI_WREADY                  (M2_AXI_wready),
		.S2_AXI_BRESP                   (M2_AXI_bresp),
		.S2_AXI_BVALID                  (M2_AXI_bvalid),
		.S2_AXI_AWREADY                 (M2_AXI_awready)
	);

	axis_sim_stim_ip0 axis_sim_stim_0 (
		.ACLK            (clk_200),
		.ARESETN         (sys_rst_n_c),

		//axi streaming data interface
		.M_AXIS_TDATA    (p_axis_i_0_tdata),
		.M_AXIS_TKEEP    (p_axis_i_0_tkeep),
		.M_AXIS_TUSER    (p_axis_i_0_tuser),
		.M_AXIS_TVALID   (p_axis_i_0_tvalid),
		.M_AXIS_TREADY   (1'b1),
		.M_AXIS_TLAST    (p_axis_i_0_tlast),

		.counter         (counter0),
		.activity_stim   (activity_stim0),
		.barrier_req     (barrier_req0),
		.barrier_proceed (barrier_proceed)
	);

	axis_sim_stim_ip1 axis_sim_stim_1 (
		.ACLK            (clk_200),
		.ARESETN         (sys_rst_n_c),
		
		//axi streaming data interface
		.M_AXIS_TDATA    (p_axis_i_1_tdata),
		.M_AXIS_TKEEP    (p_axis_i_1_tkeep),
		.M_AXIS_TUSER    (p_axis_i_1_tuser),
		.M_AXIS_TVALID   (p_axis_i_1_tvalid),
		.M_AXIS_TREADY   (1'b1),
		.M_AXIS_TLAST    (p_axis_i_1_tlast),

		.counter         (counter1),
		.activity_stim   (activity_stim1),
		.barrier_req     (barrier_req1),
		.barrier_proceed (barrier_proceed)
	);

	axis_sim_stim_ip2 axis_sim_stim_2 (
		.ACLK            (clk_200),
		.ARESETN         (sys_rst_n_c),
		
		//axi streaming data interface
		.M_AXIS_TDATA    (p_axis_dma_i_tdata),
		.M_AXIS_TKEEP    (p_axis_dma_i_tkeep),
		.M_AXIS_TUSER    (p_axis_dma_i_tuser),
		.M_AXIS_TVALID   (p_axis_dma_i_tvalid),
		.M_AXIS_TREADY   (1'b1),
		.M_AXIS_TLAST    (p_axis_dma_i_tlast),

		.counter         (counter4),
		.activity_stim   (activity_stim4),
		.barrier_req     (barrier_req4),
		.barrier_proceed (barrier_proceed)
	);

	axis_sim_record_ip0 axis_sim_record_0 (
		.axi_aclk (clk_200),
		// Slave Stream Ports (interface to data path)
		.s_axis_tdata (p_axis_o_0_tdata),
		.s_axis_tkeep (p_axis_o_0_tkeep),
		.s_axis_tuser (p_axis_o_0_tuser),
		.s_axis_tvalid(p_axis_o_0_tvalid),
		.s_axis_tready(p_axis_o_0_tready),
		.s_axis_tlast (p_axis_o_0_tlast),
	
		.counter (counter0),
		.activity_rec(activity_rec0)
	);

	axis_sim_record_ip1 axis_sim_record_1 (
		.axi_aclk (clk_200),
		// Slave Stream Ports (interface to data path)
		.s_axis_tdata (p_axis_o_1_tdata),
		.s_axis_tkeep (p_axis_o_1_tkeep),
		.s_axis_tuser (p_axis_o_1_tuser),
		.s_axis_tvalid(p_axis_o_1_tvalid),
		.s_axis_tready(p_axis_o_1_tready),
		.s_axis_tlast (p_axis_o_1_tlast),
	
		.counter (counter1),
		.activity_rec(activity_rec1)
	);

	axis_sim_record_ip2 axis_sim_record_2 (
		.axi_aclk (clk_200),
		// Slave Stream Ports (interface to data path)
		.s_axis_tdata (p_axis_dma_o_tdata),
		.s_axis_tkeep (p_axis_dma_o_tkeep),
		.s_axis_tuser (p_axis_dma_o_tuser),
		.s_axis_tvalid(p_axis_dma_o_tvalid),
		.s_axis_tready(p_axis_dma_o_tready),
		.s_axis_tlast (p_axis_dma_o_tlast),
	
		.counter (counter4),
		.activity_rec(activity_rec4)
	);

	nf_mac_attachment_dma_ip u_nf_attachment_dma (
		// 10GE block clk & rst
		.clk156                (clk_200),
		.areset_clk156         (!sys_rst_n_c),
		// RX MAC 64b@clk156 (no backpressure) -> rx_queue 64b@axis_clk
		.m_axis_mac_tdata      (p_axis_dma_i_tdata),
		.m_axis_mac_tkeep      (p_axis_dma_i_tkeep),
		.m_axis_mac_tvalid     (p_axis_dma_i_tvalid),
		.m_axis_mac_tuser_err  (1'b1),   // valid frame
		.m_axis_mac_tuser      (p_axis_dma_i_tuser),
		.m_axis_mac_tlast      (p_axis_dma_i_tlast),
		// tx_queue 64b@axis_clk -> mac 64b@clk156
		.s_axis_mac_tdata      (p_axis_dma_o_tdata),
		.s_axis_mac_tkeep      (p_axis_dma_o_tkeep),
		.s_axis_mac_tvalid     (p_axis_dma_o_tvalid),
		.s_axis_mac_tuser_err  (),       //underrun
		.s_axis_mac_tuser      (p_axis_dma_o_tuser),
		.s_axis_mac_tlast      (p_axis_dma_o_tlast),
		.s_axis_mac_tready     (p_axis_dma_o_tready),
		
		// TX/RX DATA channels
		.interface_number      (8'd0),
		
		// NFPLUS pipeline clk & rst
		.axis_aclk             (clk_200),
		.axis_aresetn          (sys_rst_n_c),
		// input from ref pipeline 256b -> MAC
		.s_axis_pipe_tdata     (axis_dma_o_tdata),
		.s_axis_pipe_tkeep     (axis_dma_o_tkeep),
		.s_axis_pipe_tlast     (axis_dma_o_tlast),
		.s_axis_pipe_tuser     (axis_dma_o_tuser),
		.s_axis_pipe_tvalid    (axis_dma_o_tvalid),
		.s_axis_pipe_tready    (axis_dma_o_tready),
		// output to ref pipeline 256b -> DMA
		.m_axis_pipe_tdata     (axis_dma_i_tdata),
		.m_axis_pipe_tkeep     (axis_dma_i_tkeep),
		.m_axis_pipe_tlast     (axis_dma_i_tlast),
		.m_axis_pipe_tuser     (axis_dma_i_tuser),
		.m_axis_pipe_tvalid    (axis_dma_i_tvalid),
		.m_axis_pipe_tready    (axis_dma_i_tready)
	);

	nf_mac_attachment_ip u_nf_attachment_0 (
		// 10GE block clk & rst 
		.clk156                (clk_200),  
		.areset_clk156         (!sys_rst_n_c), 
		// RX MAC 64b@clk156 (no backpressure) -> rx_queue 64b@axis_clk
		.m_axis_mac_tdata      (p_axis_i_0_tdata),
		.m_axis_mac_tkeep      (p_axis_i_0_tkeep),
		.m_axis_mac_tvalid     (p_axis_i_0_tvalid),
		.m_axis_mac_tuser_err  (1'b1),       // valid frame
		.m_axis_mac_tuser      (p_axis_i_0_tuser),
		.m_axis_mac_tlast      (p_axis_i_0_tlast),
		// tx_queue 64b@axis_clk -> mac 64b@clk156
		.s_axis_mac_tdata      (p_axis_o_0_tdata),
		.s_axis_mac_tkeep      (p_axis_o_0_tkeep),
		.s_axis_mac_tvalid     (p_axis_o_0_tvalid),
		.s_axis_mac_tuser_err  (),      //underrun
		.s_axis_mac_tuser      (p_axis_o_0_tuser),
		.s_axis_mac_tlast      (p_axis_o_0_tlast),
		.s_axis_mac_tready     (p_axis_o_0_tready),
		
		// TX/RX DATA channels  
		.interface_number      (8'b0000_0001),
		
		// NFPLUS pipeline clk & rst 
		.axis_aclk             (clk_200),
		.axis_aresetn          (sys_rst_n_c),
		// input from ref pipeline 256b -> MAC
		.s_axis_pipe_tdata     (axis_o_0_tdata),
		.s_axis_pipe_tkeep     (axis_o_0_tkeep),
		.s_axis_pipe_tlast     (axis_o_0_tlast),
		.s_axis_pipe_tuser     (axis_o_0_tuser),
		.s_axis_pipe_tvalid    (axis_o_0_tvalid),
		.s_axis_pipe_tready    (axis_o_0_tready),
		// output to ref pipeline 256b -> DMA
		.m_axis_pipe_tdata     (axis_i_0_tdata),
		.m_axis_pipe_tkeep     (axis_i_0_tkeep),
		.m_axis_pipe_tlast     (axis_i_0_tlast),
		.m_axis_pipe_tuser     (axis_i_0_tuser),
		.m_axis_pipe_tvalid    (axis_i_0_tvalid),
		.m_axis_pipe_tready    (axis_i_0_tready)
	);

	nf_mac_attachment_ip u_nf_attachment_1 (
		// 10GE block clk & rst
		.clk156                (clk_200),  
		.areset_clk156         (!sys_rst_n_c), 
		// RX MAC 64b@clk156 (no backpressure) -> rx_queue 64b@axis_clk
		.m_axis_mac_tdata      (p_axis_i_1_tdata),
		.m_axis_mac_tkeep      (p_axis_i_1_tkeep),
		.m_axis_mac_tvalid     (p_axis_i_1_tvalid),
		.m_axis_mac_tuser_err  (1'b1),       // valid frame
		.m_axis_mac_tuser      (p_axis_i_1_tuser),
		.m_axis_mac_tlast      (p_axis_i_1_tlast),
		// tx_queue 64b@axis_clk -> mac 64b@clk156
		.s_axis_mac_tdata      (p_axis_o_1_tdata),
		.s_axis_mac_tkeep      (p_axis_o_1_tkeep),
		.s_axis_mac_tvalid     (p_axis_o_1_tvalid),
		.s_axis_mac_tuser_err  (p_axis_o_1_tuser),      //underrun
		.s_axis_mac_tuser      (p_axis_o_1_tuser),
		.s_axis_mac_tlast      (p_axis_o_1_tlast),
		.s_axis_mac_tready     (p_axis_o_1_tready),
		
		// TX/RX DATA channels  
		.interface_number      (8'b0000_0100),
		
		// NFPLUS pipeline clk & rst 
		.axis_aclk             (clk_200),
		.axis_aresetn          (sys_rst_n_c),
		// input from ref pipeline 256b -> MAC
		.s_axis_pipe_tdata     (axis_o_1_tdata),
		.s_axis_pipe_tkeep     (axis_o_1_tkeep),
		.s_axis_pipe_tlast     (axis_o_1_tlast),
		.s_axis_pipe_tuser     (axis_o_1_tuser),
		.s_axis_pipe_tvalid    (axis_o_1_tvalid),
		.s_axis_pipe_tready    (axis_o_1_tready),
		// output to ref pipeline 256b -> DMA
		.m_axis_pipe_tdata     (axis_i_1_tdata),
		.m_axis_pipe_tkeep     (axis_i_1_tkeep),
		.m_axis_pipe_tlast     (axis_i_1_tlast),
		.m_axis_pipe_tuser     (axis_i_1_tuser),
		.m_axis_pipe_tvalid    (axis_i_1_tvalid),
		.m_axis_pipe_tready    (axis_i_1_tready)
	);

	axi_crossbar_0 u_interconnect(
		.aclk          (axi_clk),
		.aresetn       (axi_aresetn),
		.s_axi_awaddr  (S00_AXI_awaddr),
		.s_axi_awprot  (3'b010),
		.s_axi_awvalid (S00_AXI_awvalid),
		.s_axi_awready (S00_AXI_awready),
		.s_axi_wdata   (S00_AXI_wdata  ),
		.s_axi_wstrb   (4'hf),
		.s_axi_wvalid  (S00_AXI_wvalid ),
		.s_axi_wready  (S00_AXI_wready ),
		.s_axi_bresp   (S00_AXI_bresp  ),
		.s_axi_bvalid  (S00_AXI_bvalid ),
		.s_axi_bready  (S00_AXI_bready ),
		.s_axi_araddr  (S00_AXI_araddr[31:0]),
		.s_axi_arprot  (3'b010),
		.s_axi_arvalid (S00_AXI_arvalid ),
		.s_axi_arready (S00_AXI_arready ),
		.s_axi_rdata   (S00_AXI_rdata   ),
		.s_axi_rresp   (S00_AXI_rresp   ),
		.s_axi_rvalid  (S00_AXI_rvalid  ),
		.s_axi_rready  (S00_AXI_rready  ),
		.m_axi_awaddr  ({M2_AXI_awaddr[31:0] ,M1_AXI_awaddr[31:0] ,M0_AXI_awaddr[31:0] }),
		.m_axi_awprot  (),
		.m_axi_awvalid ({M2_AXI_awvalid,M1_AXI_awvalid,M0_AXI_awvalid}),
		.m_axi_awready ({M2_AXI_awready,M1_AXI_awready,M0_AXI_awready}),
		.m_axi_wdata   ({M2_AXI_wdata  ,M1_AXI_wdata  ,M0_AXI_wdata  }),
		.m_axi_wstrb   ({M2_AXI_wstrb  ,M1_AXI_wstrb  ,M0_AXI_wstrb  }),
		.m_axi_wvalid  ({M2_AXI_wvalid ,M1_AXI_wvalid ,M0_AXI_wvalid }),
		.m_axi_wready  ({M2_AXI_wready ,M1_AXI_wready ,M0_AXI_wready }),
		.m_axi_bresp   ({M2_AXI_bresp  ,M1_AXI_bresp  ,M0_AXI_bresp  }),
		.m_axi_bvalid  ({M2_AXI_bvalid ,M1_AXI_bvalid ,M0_AXI_bvalid }),
		.m_axi_bready  ({M2_AXI_bready ,M1_AXI_bready ,M0_AXI_bready }),
		.m_axi_araddr  ({M2_AXI_araddr ,M1_AXI_araddr ,M0_AXI_araddr }),
		.m_axi_arprot  (),
		.m_axi_arvalid ({M2_AXI_arvalid,M1_AXI_arvalid,M0_AXI_arvalid}),
		.m_axi_arready ({M2_AXI_arready,M1_AXI_arready,M0_AXI_arready}),
		.m_axi_rdata   ({M2_AXI_rdata  ,M1_AXI_rdata  ,M0_AXI_rdata  }),
		.m_axi_rresp   ({M2_AXI_rresp  ,M1_AXI_rresp  ,M0_AXI_rresp  }),
		.m_axi_rvalid  ({M2_AXI_rvalid ,M1_AXI_rvalid ,M0_AXI_rvalid }),
		.m_axi_rready  ({M2_AXI_rready ,M1_AXI_rready ,M0_AXI_rready }) 
	);


	axi_sim_transactor_ip axi_sim_transactor_i (
		.axi_aclk      (axi_clk),
		.axi_resetn    (axi_aresetn),
		//AXI Write address channel
		.M_AXI_AWADDR  (S00_AXI_awaddr),
		.M_AXI_AWVALID (S00_AXI_awvalid),
		.M_AXI_AWREADY (S00_AXI_awready),
		// AXI Write data channel
		.M_AXI_WDATA   (S00_AXI_wdata),
		.M_AXI_WSTRB   (S00_AXI_wstrb),
		.M_AXI_WVALID  (S00_AXI_wvalid),
		.M_AXI_WREADY  (S00_AXI_wready),
		//AXI Write response channel
		.M_AXI_BRESP   (S00_AXI_bresp),
		.M_AXI_BVALID  (S00_AXI_bvalid),
		.M_AXI_BREADY  (S00_AXI_bready),
		//AXI Read address channel
		.M_AXI_ARADDR  (S00_AXI_araddr),
		.M_AXI_ARVALID (S00_AXI_arvalid),
		.M_AXI_ARREADY (S00_AXI_arready),
		//AXI Read data & response channel
		.M_AXI_RDATA   (S00_AXI_rdata),
		.M_AXI_RRESP   (S00_AXI_rresp),
		.M_AXI_RVALID  (S00_AXI_rvalid),
		.M_AXI_RREADY  (S00_AXI_rready),
	
		.activity_trans_sim (activity_trans_sim),
		.activity_trans_log (activity_trans_log),
		.barrier_req_trans (barrier_req_trans),
		.barrier_proceed (barrier_proceed)
	);

	barrier_ip barrier_i (
		.activity_stim ({activity_stim4, activity_stim3, activity_stim2, activity_stim1, activity_stim0}), 
		.activity_rec ({activity_rec4, activity_rec3, activity_rec2, activity_rec1, activity_rec0}),
		.activity_trans_sim (activity_trans_sim),
		.activity_trans_log (activity_trans_log),
		.barrier_req ({barrier_req4, barrier_req3, barrier_req2, barrier_req1, barrier_req0}), 
		.barrier_req_trans (barrier_req_trans),
		.barrier_proceed (barrier_proceed)
	);

endmodule

