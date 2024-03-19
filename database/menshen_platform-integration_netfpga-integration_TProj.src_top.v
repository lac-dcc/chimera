//-
// Copyright (c) 2015 Noa Zilberman
// All rights reserved.
//
// This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
//  File:
//        top.v
//
//  Module:
//        top
//
//  Author: Noa Zilberman
//
//  Description:
//        reference switch top module
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
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

`timescale 1ps / 1ps

 module top # (  
  parameter          C_DATA_WIDTH                        = 256,         // RX/TX interface data width
  parameter          C_TUSER_WIDTH                       = 128         // RX/TX interface data width    
) (

//PCI Express
  input  [7:0]pcie_7x_mgt_rxn,
  input  [7:0]pcie_7x_mgt_rxp,
  output [7:0]pcie_7x_mgt_txn,
  output [7:0]pcie_7x_mgt_txp,
//10G Interface

  input  sfp0_rx_p,
  input  sfp0_rx_n,
  output sfp0_tx_p,
  output sfp0_tx_n,
  input  sfp0_tx_fault,  
  input  sfp0_tx_abs,   
  output sfp0_tx_disable,
  
  input sfp1_rx_p,
  input sfp1_rx_n,
  output sfp1_tx_p,
  output sfp1_tx_n,
  input  sfp1_tx_fault,  
  input  sfp1_tx_abs,   
  output sfp1_tx_disable,  
  
     
  input sfp2_rx_p,
  input sfp2_rx_n,
  output sfp2_tx_p,
  output sfp2_tx_n,
  input  sfp2_tx_fault,  
  input  sfp2_tx_abs,   
  output sfp2_tx_disable,
  
      
  input sfp3_rx_p,
  input sfp3_rx_n,
  output sfp3_tx_p,
  output sfp3_tx_n,
  input  sfp3_tx_fault,  
  input  sfp3_tx_abs,   
  output sfp3_tx_disable,  
  
  // 100MHz PCIe Clock
  input       sys_clkp,
  input       sys_clkn,
  
  //  200MHz FPGA Clock
  input       fpga_sysclk_p,
  input       fpga_sysclk_n,
  
  
  
  // 156.25MHz Si5324 clock 
  input                          xphy_refclk_p,
  input                          xphy_refclk_n,
 
 
 //debug features 
  output [1:0]         leds,   
  
  output sfp0_tx_led,
  output sfp1_tx_led,
  output sfp2_tx_led,
  output sfp3_tx_led,
           
  output sfp0_rx_led,
  output sfp1_rx_led,
  output sfp2_rx_led,
  output sfp3_rx_led,

  //-SI5324 I2C programming interface 
  inout i2c_clk,
  inout i2c_data,
  output [1:0] i2c_reset,

  //UART interface
  input  uart_rxd,
  output uart_txd,    

  input  sys_reset_n 
);


  
  //----------------------------------------------------------------------------------------------------------------//
  //    System(SYS) Interface                                                                                       //
  //----------------------------------------------------------------------------------------------------------------//

  wire                                       sys_clk;
  wire                                       clk_200;
  wire                                       sys_rst_n_c;
  wire                                       clk_200_locked;

    //-----------------------------------------------------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------------------------------------------//
  // axis interface                                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//

  wire[C_DATA_WIDTH-1:0]      axis_i_0_tdata;
  wire            axis_i_0_tvalid;
  wire            axis_i_0_tlast;
  wire[C_TUSER_WIDTH-1:0]     axis_i_0_tuser;
 wire[(C_DATA_WIDTH/8)-1:0]       axis_i_0_tkeep;
 wire            axis_i_0_tready;

 wire[C_DATA_WIDTH-1:0]      axis_o_0_tdata;
wire            axis_o_0_tvalid;
 wire            axis_o_0_tlast;
 wire [C_TUSER_WIDTH-1:0]         axis_o_0_tuser;
 wire[(C_DATA_WIDTH/8)-1:0]       axis_o_0_tkeep;
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
  wire [255:0]   axis_dma_i_tuser ;
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
  wire [11:0]   M00_AXI_araddr;
  wire [2:0]    M00_AXI_arprot;
  wire [0:0]    M00_AXI_arready;
  wire [0:0]    M00_AXI_arvalid;
  wire [11:0]   M00_AXI_awaddr;
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
  
  wire [11:0]   M01_AXI_araddr;
  wire [2:0]    M01_AXI_arprot;
  wire [0:0]    M01_AXI_arready;
  wire [0:0]    M01_AXI_arvalid;
  wire [11:0]   M01_AXI_awaddr;
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

  wire [11:0]   M02_AXI_araddr;
  wire [2:0]    M02_AXI_arprot;
  wire [0:0]    M02_AXI_arready;
  wire [0:0]    M02_AXI_arvalid;
  wire [11:0]   M02_AXI_awaddr;
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
  
  wire [11:0]   M03_AXI_araddr;
  wire [2:0]    M03_AXI_arprot;
  wire [0:0]    M03_AXI_arready;
  wire [0:0]    M03_AXI_arvalid;
  wire [11:0]   M03_AXI_awaddr;
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
  
  wire [11:0]   M04_AXI_araddr;
  wire [2:0]    M04_AXI_arprot;
  wire [0:0]    M04_AXI_arready;
  wire [0:0]    M04_AXI_arvalid;
  wire [11:0]   M04_AXI_awaddr;
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
  
  wire [11:0]   M05_AXI_araddr;
  wire [2:0]    M05_AXI_arprot;
  wire [0:0]    M05_AXI_arready;
  wire [0:0]    M05_AXI_arvalid;
  wire [11:0]   M05_AXI_awaddr;
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
  
  wire [11:0]   M06_AXI_araddr;
  wire [2:0]    M06_AXI_arprot;
  wire [0:0]    M06_AXI_arready;
  wire [0:0]    M06_AXI_arvalid;
  wire [11:0]   M06_AXI_awaddr;
  wire [2:0]    M06_AXI_awprot;
  wire [0:0]    M06_AXI_awready;
  wire [0:0]    M06_AXI_awvalid;
  wire [0:0]    M06_AXI_bready;
  wire [1:0]    M06_AXI_bresp;
  wire [0:0]    M06_AXI_bvalid;
  wire [31:0]   M06_AXI_rdata;
  wire [0:0]    M06_AXI_rready;
  wire [1:0]    M06_AXI_rresp;
  wire [0:0]    M06_AXI_rvalid;
  wire [31:0]   M06_AXI_wdata;
  wire [0:0]    M06_AXI_wready;
  wire [3:0]    M06_AXI_wstrb;
  wire [0:0]    M06_AXI_wvalid;
  

  wire [11:0]   M07_AXI_araddr;
  wire [2:0]    M07_AXI_arprot;
  wire [0:0]    M07_AXI_arready;
  wire [0:0]    M07_AXI_arvalid;
  wire [11:0]   M07_AXI_awaddr;
  wire [2:0]    M07_AXI_awprot;
  wire [0:0]    M07_AXI_awready;
  wire [0:0]    M07_AXI_awvalid;
  wire [0:0]    M07_AXI_bready;
  wire [1:0]    M07_AXI_bresp;
  wire [0:0]    M07_AXI_bvalid;
  wire [31:0]   M07_AXI_rdata;
  wire [0:0]    M07_AXI_rready;
  wire [1:0]    M07_AXI_rresp;
  wire [0:0]    M07_AXI_rvalid;
  wire [31:0]   M07_AXI_wdata;
  wire [0:0]    M07_AXI_wready;
  wire [3:0]    M07_AXI_wstrb;
  wire [0:0]    M07_AXI_wvalid;

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
  wire sfp0_resetdone;
  wire sfp0_txclk322;

  wire port1_ready;
  wire block1_lock; 
  wire sfp1_tx_resetdone;
  wire sfp1_rx_resetdone;
  wire sfp1_txclk322;

  wire port2_ready;
  wire block2_lock; 
  wire sfp2_tx_resetdone;
  wire sfp2_rx_resetdone;
  wire sfp2_txclk322;

  wire port3_ready;
  wire block3_lock; 
  wire sfp3_tx_resetdone;
  wire sfp3_rx_resetdone;
  wire sfp3_txclk322;
 
  wire i2c_scl_o;
  wire i2c_scl_i;
  wire i2c_scl_t;
  wire i2c_sda_o;
  wire i2c_sda_i;
  wire i2c_sda_t;
  
  wire axi_clk;
  wire axi_aresetn;
  wire sys_reset;
  
 (* ASYNC_REG = "TRUE" *) reg [3:0] core200_reset_sync_n;
  wire axis_resetn;
  wire axi_datapath_resetn;
  wire peripheral_reset;
  

  // Assign interface numbers to ports
  // Odd bits are ports and even bits are DMA
  localparam IF_SFP0 = 8'b00000001;
  localparam IF_SFP1 = 8'b00000100;
  localparam IF_SFP2 = 8'b00010000;
  localparam IF_SFP3 = 8'b01000000;
  
  ///////////////////////////// DEBUG ONLY ///////////////////////////
  // system clk heartbeat 
  reg [27:0]                                 sfp_clk156_count;
  reg [27:0]                                 sfp_clk100_count;  
  reg [1:0]                                  led;
  
  
  
//---------------------------------------------------------------------
// Misc 
//---------------------------------------------------------------------
  
// Debug LEDs  
// 156MHz clk heartbeat ~ every second
OBUF led_0_obuf (
    .O                       (leds[0]), 
    .I                       (led[0])
   );

// 100MHz clk heartbeat ~ every 1.5 seconds  
OBUF led_1_obuf (
    .O                       (leds[1]), 
    .I                       (led[1])
   );

////////////////////////////////////////
// clock generation and buffers  
IBUF sys_reset_n_ibuf(  
   .O                        (sys_rst_n_c),   
   .I                        (sys_reset_n)
  );

IBUFDS_GTE2 #(
    .CLKCM_CFG               ("TRUE"),   
    .CLKRCV_TRST             ("TRUE"), 
    .CLKSWING_CFG            (2'b11)            // Refer to Transceiver User Guide
) IBUFDS_GTE2_inst (
    .O                       (sys_clk),         // 1-bit output: Refer to Transceiver User Guide
    .ODIV2                   (),                // 1-bit output: Refer to Transceiver User Guide
    .CEB                     (1'b0),            // 1-bit input: Refer to Transceiver User Guide
    .I                       (sys_clkp),        // 1-bit input: Refer to Transceiver User Guide
    .IB                      (sys_clkn)         // 1-bit input: Refer to Transceiver User Guide
  );  
  
IOBUF i2c_scl_iobuf (
    .I                       (i2c_scl_o),
    .IO                      (i2c_clk),
    .O                       (i2c_scl_i),
    .T                       (i2c_scl_t)
  );
          
IOBUF i2c_sda_iobuf (
    .I                       (i2c_sda_o),
    .IO                      (i2c_data),
    .O                       (i2c_sda_i),
    .T                       (i2c_sda_t)
  );      
  
axi_clocking axi_clocking_i (
    .clk_in_p               (fpga_sysclk_p),
    .clk_in_n               (fpga_sysclk_n),
    .clk_200                (clk_200),       // generates 200MHz clk
    .locked                 (clk_200_locked),
    .resetn                 (sys_rst_n_c)
  );
  
// axi_clk - 100MHz - assign through buffer
BUFG axi_lite_bufg0 (
  .I                        (sys_clk),
  .O                        (axi_clk)
);   
  

////////////////////////////////////////  
// main resets
proc_sys_reset_ip proc_sys_reset_i (
  .slowest_sync_clk(clk_200),          // input wire slowest_sync_clk
  .ext_reset_in(sys_rst_n_c),                  // input wire ext_reset_in
  .aux_reset_in(1'b1),                  // input wire aux_reset_in
  .mb_debug_sys_rst(1'b0),          // input wire mb_debug_sys_rst
  .dcm_locked(clk_200_locked),                      // input wire dcm_locked
  .mb_reset(),                          // output wire mb_reset
  .bus_struct_reset(),          // output wire [0 : 0] bus_struct_reset
  .peripheral_reset(peripheral_reset),          // output wire [0 : 3] peripheral_reset
  .interconnect_aresetn(),  // output wire [0 : 0] interconnect_aresetn
  .peripheral_aresetn(axis_resetn)      // output wire [0 : 7] peripheral_aresetn
);


assign sys_reset    = !sys_rst_n_c;
//assign axi_aresetn  = sys_rst_n_c;

always @ (posedge clk_200) begin
    if (!sys_rst_n_c)  
        core200_reset_sync_n <= 4'h0; 
    else
        core200_reset_sync_n <= #1 {core200_reset_sync_n[2:0],sys_rst_n_c};
end

  
assign axi_aresetn  = axis_resetn;
assign axi_datapath_resetn = axis_resetn;
    
  


//-----------------------------------------------------------------------------------------------//
// Network modules                                                                               //
//-----------------------------------------------------------------------------------------------//

nf_datapath 
#(
    // Master AXI Stream Data Width
    .C_M_AXIS_DATA_WIDTH (C_DATA_WIDTH),
    .C_S_AXIS_DATA_WIDTH (C_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH (12),
    .C_M_AXIS_TUSER_WIDTH (128),
    .C_S_AXIS_TUSER_WIDTH (128),
    .NUM_QUEUES (5)
)
nf_datapath_0 
(
    .axis_aclk                        (clk_200),
    .axis_resetn                      (axis_resetn),
    .axi_aclk                        (clk_200),
    .axi_resetn                      (axi_datapath_resetn),
    
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
    .s_axis_4_tuser                 (axis_dma_i_tuser[127:0] ), 
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

  
// PCIe to {AXI_Lite, AXIS} bridge
control_sub control_sub_i
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

           .M06_AXI_araddr  (M06_AXI_araddr ),
           .M06_AXI_arprot  (M06_AXI_arprot ),
           .M06_AXI_arready (M06_AXI_arready),
           .M06_AXI_arvalid (M06_AXI_arvalid),
           .M06_AXI_awaddr  (M06_AXI_awaddr ),
           .M06_AXI_awprot  (M06_AXI_awprot ),
           .M06_AXI_awready (M06_AXI_awready),
           .M06_AXI_awvalid (M06_AXI_awvalid),
           .M06_AXI_bready  (M06_AXI_bready ),
           .M06_AXI_bresp   (M06_AXI_bresp  ),
           .M06_AXI_bvalid  (M06_AXI_bvalid ),
           .M06_AXI_rdata   (M06_AXI_rdata  ),
           .M06_AXI_rready  (M06_AXI_rready ),
           .M06_AXI_rresp   (M06_AXI_rresp  ),
           .M06_AXI_rvalid  (M06_AXI_rvalid ),
           .M06_AXI_wdata   (M06_AXI_wdata  ),
           .M06_AXI_wready  (M06_AXI_wready ),
           .M06_AXI_wstrb   (M06_AXI_wstrb  ),
           .M06_AXI_wvalid  (M06_AXI_wvalid ),  

           .M07_AXI_araddr  (M07_AXI_araddr ),
           .M07_AXI_arprot  (M07_AXI_arprot ),
           .M07_AXI_arready (M07_AXI_arready),
           .M07_AXI_arvalid (M07_AXI_arvalid),
           .M07_AXI_awaddr  (M07_AXI_awaddr ),
           .M07_AXI_awprot  (M07_AXI_awprot ),
           .M07_AXI_awready (M07_AXI_awready),
           .M07_AXI_awvalid (M07_AXI_awvalid),
           .M07_AXI_bready  (M07_AXI_bready ),
           .M07_AXI_bresp   (M07_AXI_bresp  ),
           .M07_AXI_bvalid  (M07_AXI_bvalid ),
           .M07_AXI_rdata   (M07_AXI_rdata  ),
           .M07_AXI_rready  (M07_AXI_rready ),
           .M07_AXI_rresp   (M07_AXI_rresp  ),
           .M07_AXI_rvalid  (M07_AXI_rvalid ),
           .M07_AXI_wdata   (M07_AXI_wdata  ),
           .M07_AXI_wready  (M07_AXI_wready ),
           .M07_AXI_wstrb   (M07_AXI_wstrb  ),
           .M07_AXI_wvalid  (M07_AXI_wvalid ),  
 
           //I2C and UART to microblaze
           .iic_fpga_scl_i(i2c_scl_i),
           .iic_fpga_scl_o(i2c_scl_o),
           .iic_fpga_scl_t(i2c_scl_t),
           .iic_fpga_sda_i(i2c_sda_i),
           .iic_fpga_sda_o(i2c_sda_o),
           .iic_fpga_sda_t(i2c_sda_t),
           .iic_reset     (i2c_reset),
           .uart_txd      (uart_txd),
           .uart_rxd      (uart_rxd),
                     
           // axi-lite clk&rst
           // NOTE: (INPUTS now)
           .axi_lite_aclk   (axi_clk),
           .axi_lite_aresetn (axi_aresetn),
          
           // axis clk & rst
           // ref pipe clk
           .axis_datapath_aclk   (clk_200),
           .axis_datapath_aresetn (axis_resetn),
      
           // axis dma tx data
           .m_axis_dma_tx_tdata  (axis_dma_i_tdata),
           .m_axis_dma_tx_tkeep  (axis_dma_i_tkeep),
           .m_axis_dma_tx_tlast  (axis_dma_i_tlast),
           .m_axis_dma_tx_tready (axis_dma_i_tready),
           .m_axis_dma_tx_tuser  (axis_dma_i_tuser),
           .m_axis_dma_tx_tvalid (axis_dma_i_tvalid),

           // axis dma rx data
           .s_axis_dma_rx_tdata  (axis_dma_o_tdata),
           .s_axis_dma_rx_tkeep  (axis_dma_o_tkeep),
           .s_axis_dma_rx_tlast  (axis_dma_o_tlast),
           .s_axis_dma_rx_tready (axis_dma_o_tready),
           .s_axis_dma_rx_tuser  ({128'h0,axis_dma_o_tuser}),
           .s_axis_dma_rx_tvalid (axis_dma_o_tvalid),
         
           // pcie clk, rst, mgt
           .pcie_7x_mgt_rxn (pcie_7x_mgt_rxn),
           .pcie_7x_mgt_rxp (pcie_7x_mgt_rxp),
           .pcie_7x_mgt_txn (pcie_7x_mgt_txn),
           .pcie_7x_mgt_txp (pcie_7x_mgt_txp),
           .sys_clk         (sys_clk),
           .sys_reset       (sys_reset)
        );
        
 

//SFP Port 0

nf_10g_interface_shared_ip nf_10g_interface_0
       (
        
        //Clocks and resets
        .core_clk                    (clk_200      ),
        .refclk_n                    (xphy_refclk_n),
        .refclk_p                    (xphy_refclk_p),
        .rst                         (peripheral_reset    ), 
        .core_resetn                 (axis_resetn), 

        
        //Shared logic 
        .clk156_out                  (sfp_clk156            ),
        .gtrxreset_out               (sfp_gtrxreset         ),
        .gttxreset_out               (sfp_gttxreset         ),
        .qplllock_out                (sfp_qplllock          ),
        .qplloutclk_out              (sfp_qplloutclk        ),
        .qplloutrefclk_out           (sfp_qplloutrefclk     ),
        .txuserrdy_out               (sfp_txuserrdy         ),
        .txusrclk_out                (sfp_txusrclk          ),
        .txusrclk2_out               (sfp_txusrclk2         ),
        .areset_clk156_out           (sfp_areset_clk156     ),
        .reset_counter_done_out      (sfp_reset_counter_done),

        
        //SFP Controls and indications
        .resetdone                   (sfp0_resetdone        ), 
        .tx_fault                    (sfp0_tx_fault         ),    
        .tx_abs                      (sfp0_tx_abs           ), 
        .tx_disable                  (sfp0_tx_disable       ),          

        //AXI Interface
        .m_axis_tdata                (axis_i_0_tdata        ),
        .m_axis_tkeep                (axis_i_0_tkeep        ),
        .m_axis_tuser                (axis_i_0_tuser        ), 
        .m_axis_tvalid               (axis_i_0_tvalid       ),
        .m_axis_tready               (axis_i_0_tready       ),
        .m_axis_tlast                (axis_i_0_tlast        ),
                                     
        .s_axis_tdata                (axis_o_0_tdata        ),
        .s_axis_tkeep                (axis_o_0_tkeep        ),
        .s_axis_tuser                (axis_o_0_tuser        ),
        .s_axis_tvalid               (axis_o_0_tvalid       ),
        .s_axis_tready               (axis_o_0_tready       ),
        .s_axis_tlast                (axis_o_0_tlast        ),
        
        .S_AXI_ACLK           (clk_200     ),
        .S_AXI_ARESETN        (axi_datapath_resetn),
        .S_AXI_AWADDR               (M04_AXI_awaddr),        
        .S_AXI_AWVALID              (M04_AXI_awvalid),       
        .S_AXI_WDATA                (M04_AXI_wdata),         
        .S_AXI_WSTRB                (M04_AXI_wstrb),         
        .S_AXI_WVALID               (M04_AXI_wvalid),        
        .S_AXI_BREADY               (M04_AXI_bready),        
        .S_AXI_ARADDR               (M04_AXI_araddr),        
        .S_AXI_ARVALID              (M04_AXI_arvalid),       
        .S_AXI_RREADY               (M04_AXI_rready),        
        .S_AXI_ARREADY              (M04_AXI_arready),       
        .S_AXI_RDATA                (M04_AXI_rdata),         
        .S_AXI_RRESP                (M04_AXI_rresp),         
        .S_AXI_RVALID               (M04_AXI_rvalid),        
        .S_AXI_WREADY               (M04_AXI_wready),        
        .S_AXI_BRESP                (M04_AXI_bresp),         
        .S_AXI_BVALID               (M04_AXI_bvalid),        
        .S_AXI_AWREADY              (M04_AXI_awready),       
          
        //Serial I/O from/to transceiver
        .rxn                         (sfp0_rx_n             ),
        .rxp                         (sfp0_rx_p             ),
        .txn                         (sfp0_tx_n             ),
        .txp                         (sfp0_tx_p             ),
        
        //Interface number
        .interface_number            (IF_SFP0                )        

  );
  
  assign sfp0_tx_led = sfp0_resetdone ;
  assign sfp0_rx_led = sfp0_resetdone ;

//SFP Port 1

nf_10g_interface_ip nf_10g_interface_1
       (
       //Clocks and resets
       .core_clk                      (clk_200),
       .core_resetn                   (axis_resetn), 
       
       //Shared logic 
        .clk156                       (sfp_clk156        ),       
        .qplllock                     (sfp_qplllock      ),
        .qplloutclk                   (sfp_qplloutclk    ),
        .qplloutrefclk                (sfp_qplloutrefclk ),
        .txuserrdy                    (sfp_txuserrdy     ),
        .txusrclk                     (sfp_txusrclk      ),
        .txusrclk2                    (sfp_txusrclk2     ),
        .areset_clk156                (sfp_areset_clk156 ), 
        .reset_counter_done           (sfp_reset_counter_done),  
      
       //SFP Controls and indications
        .tx_abs                       (sfp1_tx_abs       ),
        .tx_disable                   (sfp1_tx_disable   ),
        .tx_fault                     (sfp1_tx_fault     ),
        .tx_resetdone                 (sfp1_tx_resetdone ),
        .rx_resetdone                 (sfp1_rx_resetdone ),        
        .gtrxreset                    (sfp_gtrxreset     ),
        .gttxreset                    (sfp_gttxreset     ), 
              
      
        //AXI Interface    
        .m_axis_tdata         (axis_i_1_tdata ),
        .m_axis_tkeep         (axis_i_1_tkeep ),
        .m_axis_tuser         (axis_i_1_tuser ),
        .m_axis_tvalid        (axis_i_1_tvalid),
        .m_axis_tready        (axis_i_1_tready),
        .m_axis_tlast         (axis_i_1_tlast ),
                                                
        .s_axis_tdata         (axis_o_1_tdata ),
        .s_axis_tkeep         (axis_o_1_tkeep ),
        .s_axis_tuser         (axis_o_1_tuser ),
        .s_axis_tvalid        (axis_o_1_tvalid),
        .s_axis_tready        (axis_o_1_tready),
        .s_axis_tlast         (axis_o_1_tlast ),
        
        .S_AXI_ACLK           (clk_200     ),
        .S_AXI_ARESETN        (axi_datapath_resetn),
        .S_AXI_AWADDR         (M05_AXI_awaddr),        
        .S_AXI_AWVALID        (M05_AXI_awvalid),       
        .S_AXI_WDATA          (M05_AXI_wdata),         
        .S_AXI_WSTRB          (M05_AXI_wstrb),         
        .S_AXI_WVALID         (M05_AXI_wvalid),        
        .S_AXI_BREADY         (M05_AXI_bready),        
        .S_AXI_ARADDR         (M05_AXI_araddr),        
        .S_AXI_ARVALID        (M05_AXI_arvalid),       
        .S_AXI_RREADY         (M05_AXI_rready),        
        .S_AXI_ARREADY        (M05_AXI_arready),       
        .S_AXI_RDATA          (M05_AXI_rdata),         
        .S_AXI_RRESP          (M05_AXI_rresp),         
        .S_AXI_RVALID         (M05_AXI_rvalid),        
        .S_AXI_WREADY         (M05_AXI_wready),        
        .S_AXI_BRESP          (M05_AXI_bresp),         
        .S_AXI_BVALID         (M05_AXI_bvalid),        
        .S_AXI_AWREADY        (M05_AXI_awready),           
        
        //Serial I/O from/to transceiver  
        .txp              (sfp1_tx_p),
        .txn              (sfp1_tx_n),               
        .rxp              (sfp1_rx_p),
        .rxn              (sfp1_rx_n),
        
                        
        //Interface number
        .interface_number (IF_SFP1)                       
        );

  assign sfp1_tx_led = sfp1_tx_resetdone ;
  assign sfp1_rx_led = sfp1_rx_resetdone ;
  
//SFP Port 2

nf_10g_interface_ip nf_10g_interface_2
       (
       //Clocks and resets
       .core_clk                      (clk_200),
       .core_resetn                   (axis_resetn),  
       
       //Shared logic 
        .clk156                       (sfp_clk156        ),       
        .qplllock                     (sfp_qplllock      ),
        .qplloutclk                   (sfp_qplloutclk    ),
        .qplloutrefclk                (sfp_qplloutrefclk ),
        .txuserrdy                    (sfp_txuserrdy     ),
        .txusrclk                     (sfp_txusrclk      ),
        .txusrclk2                    (sfp_txusrclk2     ),
        .areset_clk156                (sfp_areset_clk156 ), 
        .reset_counter_done           (sfp_reset_counter_done),  
        .gtrxreset                    (sfp_gtrxreset     ),
        .gttxreset                    (sfp_gttxreset     ),        
      
       //SFP Controls and indications
        .tx_abs                       (sfp2_tx_abs       ),
        .tx_disable                   (sfp2_tx_disable   ),
        .tx_fault                     (sfp2_tx_fault     ),
        .tx_resetdone                 (sfp2_tx_resetdone ),
        .rx_resetdone                 (sfp2_rx_resetdone ),        
 
              
      
        //AXI Interface    
        .m_axis_tdata         (axis_i_2_tdata ),
        .m_axis_tkeep         (axis_i_2_tkeep ),
        .m_axis_tuser         (axis_i_2_tuser ),
        .m_axis_tvalid        (axis_i_2_tvalid),
        .m_axis_tready        (axis_i_2_tready),
        .m_axis_tlast         (axis_i_2_tlast ),
                                                
        .s_axis_tdata         (axis_o_2_tdata ),
        .s_axis_tkeep         (axis_o_2_tkeep ),
        .s_axis_tuser         (axis_o_2_tuser ),
        .s_axis_tvalid        (axis_o_2_tvalid),
        .s_axis_tready        (axis_o_2_tready),
        .s_axis_tlast         (axis_o_2_tlast ),
        
        .S_AXI_ACLK           (clk_200     ),
        .S_AXI_ARESETN        (axi_datapath_resetn),
        .S_AXI_AWADDR         (M06_AXI_awaddr),        
        .S_AXI_AWVALID        (M06_AXI_awvalid),       
        .S_AXI_WDATA          (M06_AXI_wdata),         
        .S_AXI_WSTRB          (M06_AXI_wstrb),         
        .S_AXI_WVALID         (M06_AXI_wvalid),        
        .S_AXI_BREADY         (M06_AXI_bready),        
        .S_AXI_ARADDR         (M06_AXI_araddr),        
        .S_AXI_ARVALID        (M06_AXI_arvalid),       
        .S_AXI_RREADY         (M06_AXI_rready),        
        .S_AXI_ARREADY        (M06_AXI_arready),       
        .S_AXI_RDATA          (M06_AXI_rdata),         
        .S_AXI_RRESP          (M06_AXI_rresp),         
        .S_AXI_RVALID         (M06_AXI_rvalid),        
        .S_AXI_WREADY         (M06_AXI_wready),        
        .S_AXI_BRESP          (M06_AXI_bresp),         
        .S_AXI_BVALID         (M06_AXI_bvalid),        
        .S_AXI_AWREADY        (M06_AXI_awready),           
        
        //Serial I/O from/to transceiver  
        .txp              (sfp2_tx_p),
        .txn              (sfp2_tx_n),               
        .rxp              (sfp2_rx_p),
        .rxn              (sfp2_rx_n),
        
                        
        //Interface number
        .interface_number (IF_SFP2)                       
        );

  assign sfp2_tx_led = sfp2_tx_resetdone ;
  assign sfp2_rx_led = sfp2_rx_resetdone ;
  
  
//SFP Port 3

nf_10g_interface_ip nf_10g_interface_3
       (
       //Clocks and resets
       .core_clk                      (clk_200),
       .core_resetn                   (axis_resetn),  
       
       //Shared logic 
        .clk156                       (sfp_clk156        ),       
        .qplllock                     (sfp_qplllock      ),
        .qplloutclk                   (sfp_qplloutclk    ),
        .qplloutrefclk                (sfp_qplloutrefclk ),
        .txuserrdy                    (sfp_txuserrdy     ),
        .txusrclk                     (sfp_txusrclk      ),
        .txusrclk2                    (sfp_txusrclk2     ),
        .areset_clk156                (sfp_areset_clk156 ), 
        .reset_counter_done           (sfp_reset_counter_done),  
        .gtrxreset                    (sfp_gtrxreset     ),
        .gttxreset                    (sfp_gttxreset     ),        
      
       //SFP Controls and indications
        .tx_abs                       (sfp3_tx_abs       ),
        .tx_disable                   (sfp3_tx_disable   ),
        .tx_fault                     (sfp3_tx_fault     ),
        .tx_resetdone                 (sfp3_tx_resetdone ),
        .rx_resetdone                 (sfp3_rx_resetdone ),        
 
              
      
        //AXI Interface    
        .m_axis_tdata         (axis_i_3_tdata ),
        .m_axis_tkeep         (axis_i_3_tkeep ),
        .m_axis_tuser         (axis_i_3_tuser ),
        .m_axis_tvalid        (axis_i_3_tvalid),
        .m_axis_tready        (axis_i_3_tready),
        .m_axis_tlast         (axis_i_3_tlast ),
                                                
        .s_axis_tdata         (axis_o_3_tdata ),
        .s_axis_tkeep         (axis_o_3_tkeep ),
        .s_axis_tuser         (axis_o_3_tuser ),
        .s_axis_tvalid        (axis_o_3_tvalid),
        .s_axis_tready        (axis_o_3_tready),
        .s_axis_tlast         (axis_o_3_tlast ),
        
        .S_AXI_ACLK           (clk_200     ),
        .S_AXI_ARESETN        (axi_datapath_resetn),
        .S_AXI_AWADDR         (M07_AXI_awaddr),        
        .S_AXI_AWVALID        (M07_AXI_awvalid),       
        .S_AXI_WDATA          (M07_AXI_wdata),         
        .S_AXI_WSTRB          (M07_AXI_wstrb),         
        .S_AXI_WVALID         (M07_AXI_wvalid),        
        .S_AXI_BREADY         (M07_AXI_bready),        
        .S_AXI_ARADDR         (M07_AXI_araddr),        
        .S_AXI_ARVALID        (M07_AXI_arvalid),       
        .S_AXI_RREADY         (M07_AXI_rready),        
        .S_AXI_ARREADY        (M07_AXI_arready),       
        .S_AXI_RDATA          (M07_AXI_rdata),         
        .S_AXI_RRESP          (M07_AXI_rresp),         
        .S_AXI_RVALID         (M07_AXI_rvalid),        
        .S_AXI_WREADY         (M07_AXI_wready),        
        .S_AXI_BRESP          (M07_AXI_bresp),         
        .S_AXI_BVALID         (M07_AXI_bvalid),        
        .S_AXI_AWREADY        (M07_AXI_awready),           
        
        //Serial I/O from/to transceiver  
        .txp              (sfp3_tx_p),
        .txn              (sfp3_tx_n),               
        .rxp              (sfp3_rx_p),
        .rxn              (sfp3_rx_n),
        
                        
        //Interface number
        .interface_number (IF_SFP3)                       
        );

  assign sfp3_tx_led = sfp3_tx_resetdone ;
  assign sfp3_rx_led = sfp3_rx_resetdone ;

//Identifier Block
identifier_ip identifier (
  .s_aclk       (clk_200),                
  .s_aresetn    (axi_datapath_resetn),          
  .s_axi_awaddr (M00_AXI_awaddr),    
  .s_axi_awvalid(M00_AXI_awvalid),  
  .s_axi_awready(M00_AXI_awready),  
  .s_axi_wdata  (M00_AXI_wdata),      
  .s_axi_wstrb  (M00_AXI_wstrb),      
  .s_axi_wvalid (M00_AXI_wvalid),    
  .s_axi_wready (M00_AXI_wready),    
  .s_axi_bresp  (M00_AXI_bresp),      
  .s_axi_bvalid (M00_AXI_bvalid),    
  .s_axi_bready (M00_AXI_bready),    
  .s_axi_araddr (M00_AXI_araddr ),   
  .s_axi_arvalid(M00_AXI_arvalid),  
  .s_axi_arready(M00_AXI_arready),  
  .s_axi_rdata  (M00_AXI_rdata),      
  .s_axi_rresp  (M00_AXI_rresp),      
  .s_axi_rvalid (M00_AXI_rvalid),    
  .s_axi_rready (M00_AXI_rready)    
);

 


//////////////////////// DEBUG ONLY ////////////////////////////////
// 100MHz PCIe clk heartbeat ~ every 1.5 seconds
always @ (posedge axi_clk) begin
       sfp_clk100_count <= sfp_clk100_count + 1'b1;
       if (!sfp_clk100_count) begin
            led[1] <= ~led[1];
       end  
end
  
// 156MHz sfp clock heartbeat ~ every second
always @ (posedge sfp_clk156) begin
       sfp_clk156_count <= sfp_clk156_count + 1'b1;
       if (!sfp_clk156_count) begin
            led[0] <= ~led[0];
       end  
end

endmodule
