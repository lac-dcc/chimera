//-
// Copyright (c) 2015 University of Cambridge
// Copyright (c) 2015 Noa Zilberman, Georgina Kalogeridou
// All rights reserved.
//
// This software was developed by the University of Cambridge Computer Laboratory 
// under EPSRC INTERNET Project EP/H040536/1, National Science Foundation under Grant No. CNS-0855268,
// and Defense Advanced Research Projects Agency (DARPA) and Air Force Research Laboratory (AFRL), 
// under contract FA8750-11-C-0249.
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
// Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//

`timescale 1ps / 100 fs

 module top_sim # (
  parameter          PL_SIM_FAST_LINK_TRAINING           = "FALSE",      // Simulation Speedup
  parameter          C_DATA_WIDTH                        = 256,         // RX/TX interface data width
  parameter          C_TUSER_WIDTH                       = 128,         // RX/TX interface data width  
  parameter          KEEP_WIDTH                          = C_DATA_WIDTH / 32,
  parameter  integer USER_CLK2_FREQ                 = 4,
  parameter          REF_CLK_FREQ                   = 0,           // 0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz
  parameter          AXISTEN_IF_RQ_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_CC_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_CQ_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_RC_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_ENABLE_CLIENT_TAG   = 0,
  parameter          AXISTEN_IF_RQ_PARITY_CHECK     = 0,
  parameter          AXISTEN_IF_CC_PARITY_CHECK     = 0,
  parameter          AXISTEN_IF_MC_RX_STRADDLE      = 0,
  parameter          AXISTEN_IF_ENABLE_RX_MSG_INTFC = 0,
  parameter   [17:0] AXISTEN_IF_ENABLE_MSG_ROUTE    = 18'h2FFFF
) (

//PCI Express
  input  [7:0]pcie_7x_mgt_rxn,
  input  [7:0]pcie_7x_mgt_rxp,
  output [7:0]pcie_7x_mgt_txn,
  output [7:0]pcie_7x_mgt_txp,
//10G Interface

  
  
// PCIe Clock
  input       sys_clkp,
  input       sys_clkn,
  
  //200MHz Clock
  input       fpga_sysclk_p,
  input       fpga_sysclk_n,
  
  
  
  // 156.25 MHz clock in
  input                          xphy_refclk_p,
  input                          xphy_refclk_n,
 
 
 //debug features 
  output led_0,
  output led_1,

  //-SI5324 I2C programming interface 
  inout i2c_clk,
  inout i2c_data,
  output [1:0] i2c_reset,

  //UART interface
   input                                        uart_rxd,
   output                                       uart_txd,    

  input       sys_reset_n
 // (* DONT_TOUCH = "TRUE" *) input emcclk
);


  
  //----------------------------------------------------------------------------------------------------------------//
  //    System(SYS) Interface                                                                                       //
  //----------------------------------------------------------------------------------------------------------------//

  wire                                       sys_clk;
  wire                                       clk_200;
  wire                                       clk_1XX;
  wire                                       sys_rst_n_c;

    //-----------------------------------------------------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------------------------------------------//
  // axis interface                                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//

  wire[C_DATA_WIDTH-1:0]      axis_i_0_tdata;
  wire            axis_i_0_tvalid;
  wire            axis_i_0_tlast;
  wire[C_TUSER_WIDTH-1:0]     axis_i_0_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_i_0_tkeep;
  wire            axis_i_0_tready;

  wire[C_DATA_WIDTH-1:0]      axis_o_0_tdata;
  wire            axis_o_0_tvalid;
  wire            axis_o_0_tlast;
  wire [C_TUSER_WIDTH-1:0]         axis_o_0_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_o_0_tkeep;
  wire            axis_o_0_tready;

  wire[C_DATA_WIDTH-1:0]      axis_i_1_tdata;
  wire            axis_i_1_tvalid;
  wire            axis_i_1_tlast;
  wire[C_TUSER_WIDTH-1:0]            axis_i_1_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_i_1_tkeep;
  wire            axis_i_1_tready;

  wire[C_DATA_WIDTH-1:0]      axis_o_1_tdata;
  wire            axis_o_1_tvalid;
  wire            axis_o_1_tlast;
  wire [C_TUSER_WIDTH-1:0]           axis_o_1_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_o_1_tkeep;
  wire            axis_o_1_tready;

  wire[C_DATA_WIDTH-1:0]      axis_i_2_tdata;
  wire            axis_i_2_tvalid;
  wire            axis_i_2_tlast;
  wire[C_TUSER_WIDTH-1:0]            axis_i_2_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_i_2_tkeep;
  wire            axis_i_2_tready;

  wire[C_DATA_WIDTH-1:0]      axis_o_2_tdata;
  wire            axis_o_2_tvalid;
  wire            axis_o_2_tlast;
  wire [C_TUSER_WIDTH-1:0]         axis_o_2_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_o_2_tkeep;
  wire            axis_o_2_tready;

  wire[C_DATA_WIDTH-1:0]      axis_i_3_tdata;
  wire            axis_i_3_tvalid;
  wire            axis_i_3_tlast;
  wire[C_TUSER_WIDTH-1:0]            axis_i_3_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_i_3_tkeep;
  wire            axis_i_3_tready;

  wire[C_DATA_WIDTH-1:0]      axis_o_3_tdata;
  wire            axis_o_3_tvalid;
  wire            axis_o_3_tlast;
  wire [C_TUSER_WIDTH-1:0]         axis_o_3_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_o_3_tkeep;
  wire            axis_o_3_tready;

  // AXIS DMA interfaces
  wire [255:0]   axis_dma_i_tdata ;
  wire [31:0]    axis_dma_i_tkeep ;
  wire           axis_dma_i_tlast ;
  wire           axis_dma_i_tready;
  wire [127:0]   axis_dma_i_tuser ;
  wire           axis_dma_i_tvalid;
  
  wire [255:0]  axis_dma_o_tdata;
  wire [31:0]   axis_dma_o_tkeep;
  wire          axis_dma_o_tlast;
  wire          axis_dma_o_tready;
  wire [127:0]  axis_dma_o_tuser;
  wire          axis_dma_o_tvalid;
  
 //----------------------------------------------------------------------------------------------------------------//
 // AXI Lite interface                                                                                                 //
 //----------------------------------------------------------------------------------------------------------------//
  wire [31:0]   M00_AXI_araddr;
  wire [2:0]    M00_AXI_arprot;
  wire [0:0]    M00_AXI_arready;
  wire [0:0]    M00_AXI_arvalid;
  wire [31:0]   M00_AXI_awaddr;
  wire [2:0]    M00_AXI_awprot;
  wire [0:0]    M00_AXI_awready;
  wire [0:0]    M00_AXI_awvalid;
  wire [0:0]    M00_AXI_bready;
  wire [1:0]    M00_AXI_bresp;
  wire [0:0]    M00_AXI_bvalid;
  wire [31:0]   M00_AXI_rdata;
  wire [0:0]    M00_AXI_rready;
  wire [1:0]    M00_AXI_rresp;
  wire [0:0]    M00_AXI_rvalid;
  wire [31:0]   M00_AXI_wdata;
  wire [0:0]    M00_AXI_wready;
  wire [3:0]    M00_AXI_wstrb;
  wire [0:0]    M00_AXI_wvalid;
  
  wire [31:0]   M01_AXI_araddr;
  wire [2:0]    M01_AXI_arprot;
  wire [0:0]    M01_AXI_arready;
  wire [0:0]    M01_AXI_arvalid;
  wire [31:0]   M01_AXI_awaddr;
  wire [2:0]    M01_AXI_awprot;
  wire [0:0]    M01_AXI_awready;
  wire [0:0]    M01_AXI_awvalid;
  wire [0:0]    M01_AXI_bready;
  wire [1:0]    M01_AXI_bresp;
  wire [0:0]    M01_AXI_bvalid;
  wire [31:0]   M01_AXI_rdata;
  wire [0:0]    M01_AXI_rready;
  wire [1:0]    M01_AXI_rresp;
  wire [0:0]    M01_AXI_rvalid;
  wire [31:0]   M01_AXI_wdata;
  wire [0:0]    M01_AXI_wready;
  wire [3:0]    M01_AXI_wstrb;
  wire [0:0]    M01_AXI_wvalid;

  wire [31:0]   M02_AXI_araddr;
  wire [2:0]    M02_AXI_arprot;
  wire [0:0]    M02_AXI_arready;
  wire [0:0]    M02_AXI_arvalid;
  wire [31:0]   M02_AXI_awaddr;
  wire [2:0]    M02_AXI_awprot;
  wire [0:0]    M02_AXI_awready;
  wire [0:0]    M02_AXI_awvalid;
  wire [0:0]    M02_AXI_bready;
  wire [1:0]    M02_AXI_bresp;
  wire [0:0]    M02_AXI_bvalid;
  wire [31:0]   M02_AXI_rdata;
  wire [0:0]    M02_AXI_rready;
  wire [1:0]    M02_AXI_rresp;
  wire [0:0]    M02_AXI_rvalid;
  wire [31:0]   M02_AXI_wdata;
  wire [0:0]    M02_AXI_wready;
  wire [3:0]    M02_AXI_wstrb;
  wire [0:0]    M02_AXI_wvalid;
  
  wire [31:0]   M03_AXI_araddr;
  wire [2:0]    M03_AXI_arprot;
  wire [0:0]    M03_AXI_arready;
  wire [0:0]    M03_AXI_arvalid;
  wire [31:0]   M03_AXI_awaddr;
  wire [2:0]    M03_AXI_awprot;
  wire [0:0]    M03_AXI_awready;
  wire [0:0]    M03_AXI_awvalid;
  wire [0:0]    M03_AXI_bready;
  wire [1:0]    M03_AXI_bresp;
  wire [0:0]    M03_AXI_bvalid;
  wire [31:0]   M03_AXI_rdata;
  wire [0:0]    M03_AXI_rready;
  wire [1:0]    M03_AXI_rresp;
  wire [0:0]    M03_AXI_rvalid;
  wire [31:0]   M03_AXI_wdata;
  wire [0:0]    M03_AXI_wready;
  wire [3:0]    M03_AXI_wstrb;
  wire [0:0]    M03_AXI_wvalid;
  
  wire [31:0]   M04_AXI_araddr;
  wire [2:0]    M04_AXI_arprot;
  wire [0:0]    M04_AXI_arready;
  wire [0:0]    M04_AXI_arvalid;
  wire [31:0]   M04_AXI_awaddr;
  wire [2:0]    M04_AXI_awprot;
  wire [0:0]    M04_AXI_awready;
  wire [0:0]    M04_AXI_awvalid;
  wire [0:0]    M04_AXI_bready;
  wire [1:0]    M04_AXI_bresp;
  wire [0:0]    M04_AXI_bvalid;
  wire [31:0]   M04_AXI_rdata;
  wire [0:0]    M04_AXI_rready;
  wire [1:0]    M04_AXI_rresp;
  wire [0:0]    M04_AXI_rvalid;
  wire [31:0]   M04_AXI_wdata;
  wire [0:0]    M04_AXI_wready;
  wire [3:0]    M04_AXI_wstrb;
  wire [0:0]    M04_AXI_wvalid;


  wire [31:0]   M05_AXI_araddr;
  wire [2:0]    M05_AXI_arprot;
  wire [0:0]    M05_AXI_arready;
  wire [0:0]    M05_AXI_arvalid;
  wire [31:0]   M05_AXI_awaddr;
  wire [2:0]    M05_AXI_awprot;
  wire [0:0]    M05_AXI_awready;
  wire [0:0]    M05_AXI_awvalid;
  wire [0:0]    M05_AXI_bready;
  wire [1:0]    M05_AXI_bresp;
  wire [0:0]    M05_AXI_bvalid;
  wire [31:0]   M05_AXI_rdata;
  wire [0:0]    M05_AXI_rready;
  wire [1:0]    M05_AXI_rresp;
  wire [0:0]    M05_AXI_rvalid;
  wire [31:0]   M05_AXI_wdata;
  wire [0:0]    M05_AXI_wready;
  wire [3:0]    M05_AXI_wstrb;
  wire [0:0]    M05_AXI_wvalid;
  
  wire [31:0]   S00_AXI_araddr;
  wire [2:0]    S00_AXI_arprot;
  wire [0:0]    S00_AXI_arready;
  wire [0:0]    S00_AXI_arvalid;
  wire [31:0]   S00_AXI_awaddr;
  wire [2:0]    S00_AXI_awprot;
  wire [0:0]    S00_AXI_awready;
  wire [0:0]    S00_AXI_awvalid;
  wire [0:0]    S00_AXI_bready;
  wire [1:0]    S00_AXI_bresp;
  wire [0:0]    S00_AXI_bvalid;
  wire [31:0]   S00_AXI_rdata;
  wire [0:0]    S00_AXI_rready;
  wire [1:0]    S00_AXI_rresp;
  wire [0:0]    S00_AXI_rvalid;
  wire [31:0]   S00_AXI_wdata;
  wire [0:0]    S00_AXI_wready;
  wire [3:0]    S00_AXI_wstrb;
  wire [0:0]    S00_AXI_wvalid;
  
  
  
  wire [31:0]   S100_AXI_araddr;
  wire [2:0]    S100_AXI_arprot;
  wire [0:0]    S100_AXI_arready;
  wire [0:0]    S100_AXI_arvalid;
  wire [31:0]   S100_AXI_awaddr;
  wire [2:0]    S100_AXI_awprot;
  wire [0:0]    S100_AXI_awready;
  wire [0:0]    S100_AXI_awvalid;
  wire [0:0]    S100_AXI_bready;
  wire [1:0]    S100_AXI_bresp;
  wire [0:0]    S100_AXI_bvalid;
  wire [31:0]   S100_AXI_rdata;
  wire [0:0]    S100_AXI_rready;
  wire [1:0]    S100_AXI_rresp;
  wire [0:0]    S100_AXI_rvalid;
  wire [31:0]   S100_AXI_wdata;
  wire [0:0]    S100_AXI_wready;
  wire [3:0]    S100_AXI_wstrb;
  wire [0:0]    S100_AXI_wvalid;

// 10G Interfaces
//Port 0
  wire sfp_qplllock     ;
  wire sfp_qplloutrefclk;
  wire sfp_qplloutclk   ;
  wire sfp_clk156;
  wire sfp_areset_clk156;      
  wire sfp_gttxreset;          
  wire sfp_gtrxreset;          
  wire sfp_txuserrdy;          
  wire sfp_txusrclk;           
  wire sfp_txusrclk2;          
  wire sfp_reset_counter_done; 
  wire sfp_tx_axis_areset;     
  wire sfp_tx_axis_aresetn;    
  wire sfp_rx_axis_aresetn; 

  wire port0_ready;
  wire block0_lock; 
  wire sfp0_tx_disable;
  wire sfp0_resetdone;
  wire sfp0_txclk322;

  wire port1_ready;
  wire block1_lock; 
  wire sfp1_tx_disable;
  wire sfp1_resetdone;
  wire sfp1_txclk322;

  wire port2_ready;
  wire block2_lock; 
  wire sfp2_tx_disable;
  wire sfp2_resetdone;
  wire sfp2_txclk322;

  wire port3_ready;
  wire block3_lock; 
  wire sfp3_tx_disable;
  wire sfp3_resetdone;
  wire sfp3_txclk322;
  wire axi_aresetn;
  wire tx_dcm_locked;
  wire axi_clk;
  wire reset;
  wire [10:0] counter0,counter1,counter2,counter3,counter4;
  wire activity_stim4, activity_stim3, activity_stim2, activity_stim1, activity_stim0;
  wire activity_rec4, activity_rec3, activity_rec2, activity_rec1, activity_rec0;
  wire barrier_req0, barrier_req1, barrier_req2, barrier_req3, barrier_req4;
  wire barrier_proceed;
  wire activity_trans_sim;
  wire activity_trans_log;
  wire barrier_req_trans;


  wire  sfp0_rx_p;
  wire  sfp0_rx_n;
  wire  sfp0_tx_p;
  wire  sfp0_tx_n;
      
  wire  sfp0_tx_fault=0;
  wire  sfp1_tx_fault=0;  
  wire  sfp0_tx_abs=0;  
  wire  sfp1_tx_abs=0;
  
  localparam IF_SFP0 = 8'b00000001;
  localparam IF_SFP1 = 8'b00000100;
  

wire[C_DATA_WIDTH-1:0]      axis_i_nf_0_tdata;
wire            axis_i_nf_0_tvalid;
wire            axis_i_nf_0_tlast;
wire[C_TUSER_WIDTH-1:0]     axis_i_nf_0_tuser;
wire[C_DATA_WIDTH/8-1:0]       axis_i_nf_0_tkeep;
wire            axis_i_nf_0_tready;

wire[C_DATA_WIDTH-1:0]      axis_o_nf_0_tdata;
wire            axis_o_nf_0_tvalid;
wire            axis_o_nf_0_tlast;
wire[C_TUSER_WIDTH-1:0]     axis_o_nf_0_tuser;
wire[C_DATA_WIDTH/8-1:0]       axis_o_nf_0_tkeep;
wire            axis_o_nf_0_tready;
  
wire[C_DATA_WIDTH-1:0]      axis_i_nf_1_tdata;
wire            axis_i_nf_1_tvalid;
wire            axis_i_nf_1_tlast;
wire[C_TUSER_WIDTH-1:0]     axis_i_nf_1_tuser;
wire[C_DATA_WIDTH/8-1:0]       axis_i_nf_1_tkeep;
wire            axis_i_nf_1_tready;
    
wire[C_DATA_WIDTH-1:0]      axis_o_nf_1_tdata;
  wire            axis_o_nf_1_tvalid;
  wire            axis_o_nf_1_tlast;
  wire[C_TUSER_WIDTH-1:0]     axis_o_nf_1_tuser;
  wire[C_DATA_WIDTH/8-1:0]       axis_o_nf_1_tkeep;
  wire            axis_o_nf_1_tready;







  // --------------------------------------------------------------------
  //I2C Synthesizer Interface
  // 50mhz clk
  // --------------------------------------------------------------------
  wire          clk50;
  reg [1:0]     clk_divide = 2'b00;
  
  always @(posedge clk_200)
  clk_divide  <= clk_divide + 1'b1;

  //---------------------------------------------------------------------
  // Misc 
  //---------------------------------------------------------------------
  
  IBUF   sys_reset_n_ibuf (  .O(sys_rst_n_c),   .I(sys_reset_n));
  
  //Debug LEDs
  
  reg [15:0] sys_clk_count;
  
  always @(posedge ~sys_clk)        
  sys_clk_count  <= sys_clk_count + 1'b1;
  
  OBUF led_0_obuf (.O(led_0), .I(~sys_rst_n_c));
  OBUF led_1_obuf (.O(led_1), .I(sys_clk_count[15]));
 // OBUF led_2_obuf (.O(led_2), .I(clk_divide[1]));
  

    IBUFDS_GTE2 #(
     .CLKCM_CFG("TRUE"),   // Refer to Transceiver User Guide
     .CLKRCV_TRST("TRUE"), // Refer to Transceiver User Guide
     .CLKSWING_CFG(2'b11)  // Refer to Transceiver User Guide
  )
  IBUFDS_GTE2_inst (
     .O(sys_clk),         // 1-bit output: Refer to Transceiver User Guide
     .ODIV2(),            // 1-bit output: Refer to Transceiver User Guide
     .CEB(1'b0),          // 1-bit input: Refer to Transceiver User Guide
     .I(sys_clkp),        // 1-bit input: Refer to Transceiver User Guide
     .IB(sys_clkn)        // 1-bit input: Refer to Transceiver User Guide
  );  
  

  
axi_clocking axi_clocking_i (
      .clk_in_p               (fpga_sysclk_p),
      .clk_in_n               (fpga_sysclk_n),
      .clk_200                (clk_200)       // generates 200MHz clk
    );

  
  

assign reset = !sys_rst_n_c;

// drive AXI-lite from sys_clk & sys_rst
assign axi_clk     = sys_clk;
assign axi_aresetn = sys_rst_n_c;


//-----------------------------------------------------------------------------------------------//
// Network modules                                                                               //
//-----------------------------------------------------------------------------------------------//

nf_datapath
//nf_datapath_alessandro
#(
    // Master AXI Stream Data Width
    .C_M_AXIS_DATA_WIDTH (C_DATA_WIDTH),
    .C_S_AXIS_DATA_WIDTH (C_DATA_WIDTH),
    .C_M_AXIS_TUSER_WIDTH (128),
    .C_S_AXIS_TUSER_WIDTH (128),
    .NUM_QUEUES (5)
)
nf_datapath_0 
(
    .axis_aclk                        (clk_200),
    .axis_resetn                      (sys_rst_n_c),
   // .axi_aclk                        (axi_clk),
   // .axi_resetn                      (axi_aresetn),
   .axi_aclk(clk_200),
   .axi_resetn(sys_rst_n_c),
    
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
    .s_axis_2_tdata                 (axis_i_2_tdata),  
    .s_axis_2_tkeep                 (axis_i_2_tkeep),  
    .s_axis_2_tuser                 (axis_i_2_tuser),  
    .s_axis_2_tvalid                (axis_i_2_tvalid), 
    .s_axis_2_tready                (axis_i_2_tready), 
    .s_axis_2_tlast                 (axis_i_2_tlast),  
    .s_axis_3_tdata                 (axis_i_3_tdata),  
    .s_axis_3_tkeep                 (axis_i_3_tkeep),  
    .s_axis_3_tuser                 (axis_i_3_tuser),  
    .s_axis_3_tvalid                (axis_i_3_tvalid), 
    .s_axis_3_tready                (axis_i_3_tready), 
    .s_axis_3_tlast                 (axis_i_3_tlast),  
    .s_axis_4_tdata                 (axis_dma_i_tdata ), 
    .s_axis_4_tkeep                 (axis_dma_i_tkeep ), 
    .s_axis_4_tuser                 (axis_dma_i_tuser ), 
    .s_axis_4_tvalid                (axis_dma_i_tvalid), 
    .s_axis_4_tready                (axis_dma_i_tready ), 
    .s_axis_4_tlast                 (axis_dma_i_tlast),  


    // Master Stream Ports (interface to TX queues)
    .m_axis_0_tdata                (axis_o_0_tdata),
    .m_axis_0_tkeep                (axis_o_0_tkeep),
    .m_axis_0_tuser                (axis_o_0_tuser),
    .m_axis_0_tvalid               (axis_o_0_tvalid),
    .m_axis_0_tready               (axis_o_0_tready),
    .m_axis_0_tlast                (axis_o_0_tlast),
    .m_axis_1_tdata                (axis_o_1_tdata), 
    .m_axis_1_tkeep                (axis_o_1_tkeep), 
    .m_axis_1_tuser                (axis_o_1_tuser), 
    .m_axis_1_tvalid               (axis_o_1_tvalid),
    .m_axis_1_tready               (axis_o_1_tready),
    .m_axis_1_tlast                (axis_o_1_tlast), 
    .m_axis_2_tdata                (axis_o_2_tdata), 
    .m_axis_2_tkeep                (axis_o_2_tkeep), 
    .m_axis_2_tuser                (axis_o_2_tuser), 
    .m_axis_2_tvalid               (axis_o_2_tvalid),
    .m_axis_2_tready               (axis_o_2_tready),
    .m_axis_2_tlast                (axis_o_2_tlast), 
    .m_axis_3_tdata                (axis_o_3_tdata ), 
    .m_axis_3_tkeep                (axis_o_3_tkeep ), 
    .m_axis_3_tuser                (axis_o_3_tuser ), 
    .m_axis_3_tvalid               (axis_o_3_tvalid),
    .m_axis_3_tready               (axis_o_3_tready),
    .m_axis_3_tlast                (axis_o_3_tlast ), 
    .m_axis_4_tdata                (axis_dma_o_tdata ),
    .m_axis_4_tkeep                (axis_dma_o_tkeep ),
    .m_axis_4_tuser                (axis_dma_o_tuser ),
    .m_axis_4_tvalid               (axis_dma_o_tvalid),
    .m_axis_4_tready               (axis_dma_o_tready ),
    .m_axis_4_tlast                (axis_dma_o_tlast),
   
   //AXI-Lite interface  
 
    .S0_AXI_AWADDR                    (M01_AXI_awaddr),  
    .S0_AXI_AWVALID                   (M01_AXI_awvalid),
    .S0_AXI_WDATA                     (M01_AXI_wdata),  
    .S0_AXI_WSTRB                     (M01_AXI_wstrb),  
    .S0_AXI_WVALID                    (M01_AXI_wvalid), 
    .S0_AXI_BREADY                    (M01_AXI_bready), 
    .S0_AXI_ARADDR                    (M01_AXI_araddr), 
    .S0_AXI_ARVALID                   (M01_AXI_arvalid),
    .S0_AXI_RREADY                    (M01_AXI_rready), 
    .S0_AXI_ARREADY                   (M01_AXI_arready),
    .S0_AXI_RDATA                     (M01_AXI_rdata),  
    .S0_AXI_RRESP                     (M01_AXI_rresp),  
    .S0_AXI_RVALID                    (M01_AXI_rvalid), 
    .S0_AXI_WREADY                    (M01_AXI_wready), 
    .S0_AXI_BRESP                     (M01_AXI_bresp),  
    .S0_AXI_BVALID                    (M01_AXI_bvalid), 
    .S0_AXI_AWREADY                   (M01_AXI_awready),
     
     .S1_AXI_AWADDR                    (M02_AXI_awaddr), 
     .S1_AXI_AWVALID                   (M02_AXI_awvalid),
     .S1_AXI_WDATA                     (M02_AXI_wdata),  
     .S1_AXI_WSTRB                     (M02_AXI_wstrb),  
     .S1_AXI_WVALID                    (M02_AXI_wvalid), 
     .S1_AXI_BREADY                    (M02_AXI_bready), 
     .S1_AXI_ARADDR                    (M02_AXI_araddr), 
     .S1_AXI_ARVALID                   (M02_AXI_arvalid),
     .S1_AXI_RREADY                    (M02_AXI_rready), 
     .S1_AXI_ARREADY                   (M02_AXI_arready),
     .S1_AXI_RDATA                     (M02_AXI_rdata),  
     .S1_AXI_RRESP                     (M02_AXI_rresp),  
     .S1_AXI_RVALID                    (M02_AXI_rvalid), 
     .S1_AXI_WREADY                    (M02_AXI_wready), 
     .S1_AXI_BRESP                     (M02_AXI_bresp),  
     .S1_AXI_BVALID                    (M02_AXI_bvalid), 
     .S1_AXI_AWREADY                   (M02_AXI_awready),

     .S2_AXI_AWADDR                    (M03_AXI_awaddr), 
     .S2_AXI_AWVALID                   (M03_AXI_awvalid),
     .S2_AXI_WDATA                     (M03_AXI_wdata),  
     .S2_AXI_WSTRB                     (M03_AXI_wstrb),  
     .S2_AXI_WVALID                    (M03_AXI_wvalid), 
     .S2_AXI_BREADY                    (M03_AXI_bready), 
     .S2_AXI_ARADDR                    (M03_AXI_araddr), 
     .S2_AXI_ARVALID                   (M03_AXI_arvalid),
     .S2_AXI_RREADY                    (M03_AXI_rready), 
     .S2_AXI_ARREADY                   (M03_AXI_arready),
     .S2_AXI_RDATA                     (M03_AXI_rdata),  
     .S2_AXI_RRESP                     (M03_AXI_rresp),  
     .S2_AXI_RVALID                    (M03_AXI_rvalid), 
     .S2_AXI_WREADY                    (M03_AXI_wready), 
     .S2_AXI_BRESP                     (M03_AXI_bresp),  
     .S2_AXI_BVALID                    (M03_AXI_bvalid), 
     .S2_AXI_AWREADY                   (M03_AXI_awready)

    );
    
    
//Identifier Block
    identifier_ip identifier (
      .s_aclk       (axi_clk),                // input wire s_aclk
      .s_aresetn    (sys_rst_n_c),          // input wire s_aresetn
      .s_axi_awaddr (M00_AXI_awaddr ^ 32'h44000000),    // input wire [31 : 0] s_axi_awaddr
      .s_axi_awvalid(M00_AXI_awvalid),  // input wire s_axi_awvalid
      .s_axi_awready(M00_AXI_awready),  // output wire s_axi_awready
      .s_axi_wdata  (M00_AXI_wdata),      // input wire [31 : 0] s_axi_wdata
      .s_axi_wstrb  (M00_AXI_wstrb),      // input wire [3 : 0] s_axi_wstrb
      .s_axi_wvalid (M00_AXI_wvalid),    // input wire s_axi_wvalid
      .s_axi_wready (M00_AXI_wready),    // output wire s_axi_wready
      .s_axi_bresp  (M00_AXI_bresp),      // output wire [1 : 0] s_axi_bresp
      .s_axi_bvalid (M00_AXI_bvalid),    // output wire s_axi_bvalid
      .s_axi_bready (M00_AXI_bready),    // input wire s_axi_bready
      .s_axi_araddr (M00_AXI_araddr ^ 32'h44000000 ),    // input wire [31 : 0] s_axi_araddr
      .s_axi_arvalid(M00_AXI_arvalid),  // input wire s_axi_arvalid
      .s_axi_arready(M00_AXI_arready),  // output wire s_axi_arready
      .s_axi_rdata  (M00_AXI_rdata),      // output wire [31 : 0] s_axi_rdata
      .s_axi_rresp  (M00_AXI_rresp),      // output wire [1 : 0] s_axi_rresp
      .s_axi_rvalid (M00_AXI_rvalid),    // output wire s_axi_rvalid
      .s_axi_rready (M00_AXI_rready)    // input wire s_axi_rready
    );

  
// PCIe to {AXI_Lite, AXIS} bridge
        
 
	axis_sim_stim_ip0
	//#(.input_file("../../nf10_10g_interface_0_stim.axi")) 
	axis_sim_stim_0
	(
	.ACLK (clk_200),
        .ARESETN (sys_rst_n_c),

        //axi streaming data interface
        .M_AXIS_TDATA (axis_i_0_tdata),
        .M_AXIS_TKEEP (axis_i_0_tkeep),
        .M_AXIS_TUSER (axis_i_0_tuser),
        .M_AXIS_TVALID (axis_i_0_tvalid),
        .M_AXIS_TREADY (axis_i_0_tready),
        .M_AXIS_TLAST (axis_i_0_tlast),

	.counter (counter0),
	.activity_stim (activity_stim0),
        .barrier_req (barrier_req0),
        .barrier_proceed (barrier_proceed)
	);

	axis_sim_stim_ip1
	//#(.input_file("../../nf10_10g_interface_1_stim.axi")) 
	axis_sim_stim_1
	(
	.ACLK (clk_200),
        .ARESETN (sys_rst_n_c),

        //axi streaming data interface
        .M_AXIS_TDATA (axis_i_1_tdata),
        .M_AXIS_TKEEP (axis_i_1_tkeep),
        .M_AXIS_TUSER (axis_i_1_tuser),
        .M_AXIS_TVALID (axis_i_1_tvalid),
        .M_AXIS_TREADY (axis_i_1_tready),
        .M_AXIS_TLAST (axis_i_1_tlast),

	.counter (counter1),
	.activity_stim (activity_stim1),
        .barrier_req (barrier_req1),
        .barrier_proceed (barrier_proceed)
	);

	axis_sim_stim_ip2
	//#(.input_file("../../nf10_10g_interface_2_stim.axi")) 
	axis_sim_stim_2
	(
	.ACLK (clk_200),
        .ARESETN (sys_rst_n_c),

        //axi streaming data interface
        .M_AXIS_TDATA (axis_i_2_tdata),
        .M_AXIS_TKEEP (axis_i_2_tkeep),
        .M_AXIS_TUSER (axis_i_2_tuser),
        .M_AXIS_TVALID (axis_i_2_tvalid),
        .M_AXIS_TREADY (axis_i_2_tready),
        .M_AXIS_TLAST (axis_i_2_tlast),

	.counter (counter2),
	.activity_stim (activity_stim2),
        .barrier_req (barrier_req2),
        .barrier_proceed (barrier_proceed)
	);

	axis_sim_stim_ip3
	//#(.input_file("../../nf10_10g_interface_3_stim.axi")) 
	axis_sim_stim_3
	(
	.ACLK (clk_200),
        .ARESETN (sys_rst_n_c),

        //axi streaming data interface
        .M_AXIS_TDATA (axis_i_3_tdata),
        .M_AXIS_TKEEP (axis_i_3_tkeep),
        .M_AXIS_TUSER (axis_i_3_tuser),
        .M_AXIS_TVALID (axis_i_3_tvalid),
        .M_AXIS_TREADY (axis_i_3_tready),
        .M_AXIS_TLAST (axis_i_3_tlast),

	.counter (counter3),
	.activity_stim (activity_stim3),
        .barrier_req (barrier_req3),
        .barrier_proceed (barrier_proceed)
	);

	axis_sim_stim_ip4
	//#(.input_file("../../dma_0_stim.axi")) 
	axis_sim_stim_4
	(
	.ACLK (clk_200),
        .ARESETN (sys_rst_n_c),

        //axi streaming data interface
        .M_AXIS_TDATA (axis_dma_i_tdata),
        .M_AXIS_TKEEP (axis_dma_i_tkeep),
        .M_AXIS_TUSER (axis_dma_i_tuser),
        .M_AXIS_TVALID (axis_dma_i_tvalid),
        .M_AXIS_TREADY (axis_dma_i_tready),
        .M_AXIS_TLAST (axis_dma_i_tlast),

	.counter (counter4),
	.activity_stim (activity_stim4),
        .barrier_req (barrier_req4),
        .barrier_proceed (barrier_proceed)
	);

	axis_sim_record_ip0
	// #(.RANDOMIZE(6))
	axis_sim_record_0
	(
	.axi_aclk (clk_200),

    	// Slave Stream Ports (interface to data path)
    	.s_axis_tdata (axis_o_0_tdata),
    	.s_axis_tkeep (axis_o_0_tkeep),
    	.s_axis_tuser (axis_o_0_tuser),
    	.s_axis_tvalid (axis_o_0_tvalid),
    	.s_axis_tready (axis_o_0_tready),
    	.s_axis_tlast (axis_o_0_tlast),

    	.counter (counter0),
    	.activity_rec(activity_rec0)
	);

	axis_sim_record_ip1
	//#(.OUTPUT_FILE("../../nf10_10g_interface_1_log.axi"))
	axis_sim_record_1
	(
	.axi_aclk (clk_200),

    	// Slave Stream Ports (interface to data path)
    	.s_axis_tdata (axis_o_1_tdata),
    	.s_axis_tkeep (axis_o_1_tkeep),
    	.s_axis_tuser (axis_o_1_tuser),
    	.s_axis_tvalid (axis_o_1_tvalid),
    	.s_axis_tready (axis_o_1_tready),
    	.s_axis_tlast (axis_o_1_tlast),

    	.counter (counter1),
    	.activity_rec(activity_rec1)
	);

	axis_sim_record_ip2
	//#(.OUTPUT_FILE("../../nf10_10g_interface_2_log.axi"))
	axis_sim_record_2
	(
	.axi_aclk (clk_200),

    	// Slave Stream Ports (interface to data path)
    	.s_axis_tdata (axis_o_2_tdata),
    	.s_axis_tkeep (axis_o_2_tkeep),
    	.s_axis_tuser (axis_o_2_tuser),
    	.s_axis_tvalid (axis_o_2_tvalid),
    	.s_axis_tready (axis_o_2_tready),
    	.s_axis_tlast (axis_o_2_tlast),

    	.counter (counter2),
    	.activity_rec(activity_rec2)
	);

	axis_sim_record_ip3
	//#(.OUTPUT_FILE("../../nf10_10g_interface_3_log.axi"))
	axis_sim_record_3
	(
	.axi_aclk (clk_200),

    	// Slave Stream Ports (interface to data path)
    	.s_axis_tdata (axis_o_3_tdata),
    	.s_axis_tkeep (axis_o_3_tkeep),
    	.s_axis_tuser (axis_o_3_tuser),
    	.s_axis_tvalid (axis_o_3_tvalid),
    	.s_axis_tready (axis_o_3_tready),
    	.s_axis_tlast (axis_o_3_tlast),

    	.counter (counter3),
    	.activity_rec(activity_rec3)
	);

	axis_sim_record_ip4
	//#(.OUTPUT_FILE("../../dma_0_log.axi"))
	axis_sim_record_4
	(
	.axi_aclk (clk_200),

    	// Slave Stream Ports (interface to data path)
    	.s_axis_tdata (axis_dma_o_tdata),
    	.s_axis_tkeep (axis_dma_o_tkeep),
    	.s_axis_tuser (axis_dma_o_tuser),
    	.s_axis_tvalid (axis_dma_o_tvalid),
    	.s_axis_tready (axis_dma_o_tready),
    	.s_axis_tlast (axis_dma_o_tlast),

    	.counter (counter4),
    	.activity_rec(activity_rec4)
	);

	control_sub_sim control_sub
       	(
           .M00_AXI_araddr  (M00_AXI_araddr  ),
           .M00_AXI_arprot  (M00_AXI_arprot  ),
           .M00_AXI_arready (M00_AXI_arready ),
           .M00_AXI_arvalid (M00_AXI_arvalid ),
           .M00_AXI_awaddr  (M00_AXI_awaddr  ),
           .M00_AXI_awprot  (M00_AXI_awprot  ),
           .M00_AXI_awready (M00_AXI_awready ),
           .M00_AXI_awvalid (M00_AXI_awvalid ),
           .M00_AXI_bready  (M00_AXI_bready  ),
           .M00_AXI_bresp   (M00_AXI_bresp   ),
           .M00_AXI_bvalid  (M00_AXI_bvalid  ),
           .M00_AXI_rdata   (M00_AXI_rdata   ),
           .M00_AXI_rready  (M00_AXI_rready  ),
           .M00_AXI_rresp   (M00_AXI_rresp   ),
           .M00_AXI_rvalid  (M00_AXI_rvalid  ),
           .M00_AXI_wdata   (M00_AXI_wdata   ),
           .M00_AXI_wready  (M00_AXI_wready  ),
           .M00_AXI_wstrb   (M00_AXI_wstrb   ),
           .M00_AXI_wvalid  (M00_AXI_wvalid  ),
           
           .M01_AXI_araddr  (M01_AXI_araddr  ),
           .M01_AXI_arprot  (M01_AXI_arprot  ),
           .M01_AXI_arready (M01_AXI_arready ),
           .M01_AXI_arvalid (M01_AXI_arvalid ),
           .M01_AXI_awaddr  (M01_AXI_awaddr  ),
           .M01_AXI_awprot  (M01_AXI_awprot  ),
           .M01_AXI_awready (M01_AXI_awready ),
           .M01_AXI_awvalid (M01_AXI_awvalid ),
           .M01_AXI_bready  (M01_AXI_bready  ),
           .M01_AXI_bresp   (M01_AXI_bresp   ),
           .M01_AXI_bvalid  (M01_AXI_bvalid  ),
           .M01_AXI_rdata   (M01_AXI_rdata   ),
           .M01_AXI_rready  (M01_AXI_rready  ),
           .M01_AXI_rresp   (M01_AXI_rresp   ),
           .M01_AXI_rvalid  (M01_AXI_rvalid  ),
           .M01_AXI_wdata   (M01_AXI_wdata   ),
           .M01_AXI_wready  (M01_AXI_wready  ),
           .M01_AXI_wstrb   (M01_AXI_wstrb   ),
           .M01_AXI_wvalid  (M01_AXI_wvalid  ),           

           
           .M02_AXI_araddr  (M02_AXI_araddr  ),
           .M02_AXI_arprot  (M02_AXI_arprot  ),
           .M02_AXI_arready (M02_AXI_arready ),
           .M02_AXI_arvalid (M02_AXI_arvalid ),
           .M02_AXI_awaddr  (M02_AXI_awaddr  ),
           .M02_AXI_awprot  (M02_AXI_awprot  ),
           .M02_AXI_awready (M02_AXI_awready ),
           .M02_AXI_awvalid (M02_AXI_awvalid ),
           .M02_AXI_bready  (M02_AXI_bready  ),
           .M02_AXI_bresp   (M02_AXI_bresp   ),
           .M02_AXI_bvalid  (M02_AXI_bvalid  ),
           .M02_AXI_rdata   (M02_AXI_rdata   ),
           .M02_AXI_rready  (M02_AXI_rready  ),
           .M02_AXI_rresp   (M02_AXI_rresp   ),
           .M02_AXI_rvalid  (M02_AXI_rvalid  ),
           .M02_AXI_wdata   (M02_AXI_wdata   ),
           .M02_AXI_wready  (M02_AXI_wready  ),
           .M02_AXI_wstrb   (M02_AXI_wstrb   ),
           .M02_AXI_wvalid  (M02_AXI_wvalid  ),   

           .M03_AXI_araddr  (M03_AXI_araddr ),
           .M03_AXI_arprot  (M03_AXI_arprot ),
           .M03_AXI_arready (M03_AXI_arready),
           .M03_AXI_arvalid (M03_AXI_arvalid),
           .M03_AXI_awaddr  (M03_AXI_awaddr ),
           .M03_AXI_awprot  (M03_AXI_awprot ),
           .M03_AXI_awready (M03_AXI_awready),
           .M03_AXI_awvalid (M03_AXI_awvalid),
           .M03_AXI_bready  (M03_AXI_bready ),
           .M03_AXI_bresp   (M03_AXI_bresp  ),
           .M03_AXI_bvalid  (M03_AXI_bvalid ),
           .M03_AXI_rdata   (M03_AXI_rdata  ),
           .M03_AXI_rready  (M03_AXI_rready ),
           .M03_AXI_rresp   (M03_AXI_rresp  ),
           .M03_AXI_rvalid  (M03_AXI_rvalid ),
           .M03_AXI_wdata   (M03_AXI_wdata  ),
           .M03_AXI_wready  (M03_AXI_wready ),
           .M03_AXI_wstrb   (M03_AXI_wstrb  ),
           .M03_AXI_wvalid  (M03_AXI_wvalid ), 

           .M04_AXI_araddr  (M04_AXI_araddr ),
           .M04_AXI_arprot  (M04_AXI_arprot ),
           .M04_AXI_arready (M04_AXI_arready),
           .M04_AXI_arvalid (M04_AXI_arvalid),
           .M04_AXI_awaddr  (M04_AXI_awaddr ),
           .M04_AXI_awprot  (M04_AXI_awprot ),
           .M04_AXI_awready (M04_AXI_awready),
           .M04_AXI_awvalid (M04_AXI_awvalid),
           .M04_AXI_bready  (M04_AXI_bready ),
           .M04_AXI_bresp   (M04_AXI_bresp  ),
           .M04_AXI_bvalid  (M04_AXI_bvalid ),
           .M04_AXI_rdata   (M04_AXI_rdata  ),
           .M04_AXI_rready  (M04_AXI_rready ),
           .M04_AXI_rresp   (M04_AXI_rresp  ),
           .M04_AXI_rvalid  (M04_AXI_rvalid ),
           .M04_AXI_wdata   (M04_AXI_wdata  ),
           .M04_AXI_wready  (M04_AXI_wready ),
           .M04_AXI_wstrb   (M04_AXI_wstrb  ),
           .M04_AXI_wvalid  (M04_AXI_wvalid ),

           .M05_AXI_araddr  (M05_AXI_araddr ),
           .M05_AXI_arprot  (M05_AXI_arprot ),
           .M05_AXI_arready (M05_AXI_arready),
           .M05_AXI_arvalid (M05_AXI_arvalid),
           .M05_AXI_awaddr  (M05_AXI_awaddr ),
           .M05_AXI_awprot  (M05_AXI_awprot ),
           .M05_AXI_awready (M05_AXI_awready),
           .M05_AXI_awvalid (M05_AXI_awvalid),
           .M05_AXI_bready  (M05_AXI_bready ),
           .M05_AXI_bresp   (M05_AXI_bresp  ),
           .M05_AXI_bvalid  (M05_AXI_bvalid ),
           .M05_AXI_rdata   (M05_AXI_rdata  ),
           .M05_AXI_rready  (M05_AXI_rready ),
           .M05_AXI_rresp   (M05_AXI_rresp  ),
           .M05_AXI_rvalid  (M05_AXI_rvalid ),
           .M05_AXI_wdata   (M05_AXI_wdata  ),
           .M05_AXI_wready  (M05_AXI_wready ),
           .M05_AXI_wstrb   (M05_AXI_wstrb  ),
           .M05_AXI_wvalid  (M05_AXI_wvalid ),  

           .M06_AXI_araddr  (),
           .M06_AXI_arprot  (),
           .M06_AXI_arready (),
           .M06_AXI_arvalid (),
           .M06_AXI_awaddr  (),
           .M06_AXI_awprot  (),
           .M06_AXI_awready (),
           .M06_AXI_awvalid (),
           .M06_AXI_bready  (),
           .M06_AXI_bresp   (),
           .M06_AXI_bvalid  (),
           .M06_AXI_rdata   (),
           .M06_AXI_rready  (),
           .M06_AXI_rresp   (),
           .M06_AXI_rvalid  (),
           .M06_AXI_wdata   (),
           .M06_AXI_wready  (),
           .M06_AXI_wstrb   (),
           .M06_AXI_wvalid  (),  

           .M07_AXI_araddr  (),
           .M07_AXI_arprot  (),
           .M07_AXI_arready (),
           .M07_AXI_arvalid (),
           .M07_AXI_awaddr  (),
           .M07_AXI_awprot  (),
           .M07_AXI_awready (),
           .M07_AXI_awvalid (),
           .M07_AXI_bready  (),
           .M07_AXI_bresp   (),
           .M07_AXI_bvalid  (),
           .M07_AXI_rdata   (),
           .M07_AXI_rready  (),
           .M07_AXI_rresp   (),
           .M07_AXI_rvalid  (),
           .M07_AXI_wdata   (),
           .M07_AXI_wready  (),
           .M07_AXI_wstrb   (),
           .M07_AXI_wvalid  (),  
 
           // axi-lite clk&rst
           // NOTE: (INPUTS now)
           .axi_lite_aclk   (axi_clk),
           .axi_lite_areset (axi_aresetn),
           .core_clk                        (clk_200),
           .core_resetn                     (sys_rst_n_c),
          
          
           // axi_sim_transactor
           .S00_AXI_araddr  (S100_AXI_araddr), //in
           .S00_AXI_arprot  (3'b0), 
           .S00_AXI_arready (S100_AXI_arready), //out
           .S00_AXI_arvalid (S100_AXI_arvalid),//in 
           .S00_AXI_awaddr  (S100_AXI_awaddr), //in 
           .S00_AXI_awprot  (3'b0), 
           .S00_AXI_awready (S100_AXI_awready), //out
           .S00_AXI_awvalid (S100_AXI_awvalid), //in
           .S00_AXI_bready  (S100_AXI_bready),//in
           .S00_AXI_bresp   (S100_AXI_bresp),//out
           .S00_AXI_bvalid  (S100_AXI_bvalid),//out
           .S00_AXI_rdata   (S100_AXI_rdata),//out 
           .S00_AXI_rready  (S100_AXI_rready), //in
           .S00_AXI_rresp   (S100_AXI_rresp),//out
           .S00_AXI_rvalid  (S100_AXI_rvalid), //out
           .S00_AXI_wdata   (S100_AXI_wdata), //in
           .S00_AXI_wready  (S100_AXI_wready),//out
           .S00_AXI_wstrb   (S100_AXI_wstrb),//in
           .S00_AXI_wvalid  (S100_AXI_wvalid),//in
           //signal fixes                  
               .S00_AXI_arburst (2'b1), 
               .S00_AXI_arcache(), 
               .S00_AXI_arlen(8'h0), 
               .S00_AXI_arlock(1'b0), 
               .S00_AXI_arqos(4'h0), 
               .S00_AXI_awburst(2'b1), 
               .S00_AXI_arsize(3'h4), 
               .S00_AXI_awcache(4'h0), 
               .S00_AXI_awlen(8'h0), 
               .S00_AXI_awlock(1'b0), 
               .S00_AXI_awqos(4'h0), 
               .S00_AXI_awsize(3'h4), 
               .S00_AXI_rlast(), 
               .S00_AXI_wlast(1'b1) 
        );

	axi_sim_transactor_ip
	//#(.STIM_FILE("../../reg_stim.axi"),
	//  .EXPECT_FILE("../../reg_expect.axi"),
	//  .LOG_FILE("../../reg_stim.log"))
	axi_sim_transactor_i
	(
	.axi_aclk (axi_clk),
        .axi_resetn (sys_rst_n_c),                                     
        // AXI Lite interface
        //
        //AXI Write address channel
	    .M_AXI_AWADDR (S100_AXI_awaddr),
        .M_AXI_AWVALID (S100_AXI_awvalid),
        .M_AXI_AWREADY (S100_AXI_awready),
        // AXI Write data channel
        .M_AXI_WDATA (S100_AXI_wdata),
        .M_AXI_WSTRB (S100_AXI_wstrb),
        .M_AXI_WVALID (S100_AXI_wvalid),
        .M_AXI_WREADY (S100_AXI_wready),
        //AXI Write response channel
        .M_AXI_BRESP (S100_AXI_bresp),
        .M_AXI_BVALID (S100_AXI_bvalid),
        .M_AXI_BREADY (S100_AXI_bready),
        //AXI Read address channel
        .M_AXI_ARADDR (S100_AXI_araddr),
        .M_AXI_ARVALID (S100_AXI_arvalid),
        .M_AXI_ARREADY (S100_AXI_arready),
        //AXI Read data & response channel
        .M_AXI_RDATA (S100_AXI_rdata),
        .M_AXI_RRESP (S100_AXI_rresp),
        .M_AXI_RVALID (S100_AXI_rvalid),
        .M_AXI_RREADY (S100_AXI_rready),

	.activity_trans_sim (activity_trans_sim),
	.activity_trans_log (activity_trans_log),
	.barrier_req_trans (barrier_req_trans),
    .barrier_proceed (barrier_proceed)
	);

	barrier_ip barrier_i
	(
	.activity_stim ({activity_stim4, activity_stim3, activity_stim2, activity_stim1, activity_stim0}), 
   	.activity_rec ({activity_rec4, activity_rec3, activity_rec2, activity_rec1, activity_rec0}),
   	.activity_trans_sim (activity_trans_sim),
   	.activity_trans_log (activity_trans_log),
   	.barrier_req ({barrier_req4, barrier_req3, barrier_req2, barrier_req1, barrier_req0}), 
   	.barrier_req_trans (barrier_req_trans),
   	.barrier_proceed (barrier_proceed)
	);

endmodule

