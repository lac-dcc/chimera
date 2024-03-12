//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2013 10:45:37
// Design Name: 
// Module Name: toe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topmost_zooknukv_para (
    // 233MHz clock input
    input                          sys_clk_p,
    input                          sys_clk_n,
// 200MHz reference clock input
    input                          clk_ref_p,
    input                          clk_ref_n,

    //-SI5324 I2C programming interface
    inout                          i2c_clk,
    inout                          i2c_data,
    output                         i2c_mux_rst_n,
    output                         si5324_rst_n,
    // 156.25 MHz clock in
    input                          xphy_refclk_p,
    input                          xphy_refclk_n,
    
   output                         xphy0_txp,
  output                         xphy0_txn,
  input                          xphy0_rxp,
  input                          xphy0_rxn,
  
  input         button_north,
  input         button_east,
  input         button_west,
  
    output                         xphy1_txp,
    output                         xphy1_txn,
    input                          xphy1_rxp,
    input                          xphy1_rxn,
    
    output                         xphy2_txp,
    output                         xphy2_txn,
    input                          xphy2_rxp,
    input                          xphy2_rxn,
    
    output                         xphy3_txp,
    output                         xphy3_txn,
    input                          xphy3_rxp,
    input                          xphy3_rxn,
    
    output[3:0] sfp_tx_disable,
    
      // Connection to SODIMM-A
      output [15:0]                  c0_ddr3_addr,             
      output [2:0]                   c0_ddr3_ba,               
      output                         c0_ddr3_cas_n,            
      output                         c0_ddr3_ck_p,               
      output                         c0_ddr3_ck_n,             
      output                         c0_ddr3_cke,              
      output                         c0_ddr3_cs_n,             
      output [7:0]                   c0_ddr3_dm,               
      inout  [63:0]                  c0_ddr3_dq,               
      inout  [7:0]                   c0_ddr3_dqs_p,              
      inout  [7:0]                   c0_ddr3_dqs_n,            
      output                         c0_ddr3_odt,              
      output                         c0_ddr3_ras_n,            
      output                         c0_ddr3_reset_n,          
      output                         c0_ddr3_we_n,             
  
        // Connection to SODIMM-B
      output [15:0]                  c1_ddr3_addr,             
      output [2:0]                   c1_ddr3_ba,               
      output                         c1_ddr3_cas_n,            
      output                         c1_ddr3_ck_p,               
      output                         c1_ddr3_ck_n,             
      output                         c1_ddr3_cke,              
      output                         c1_ddr3_cs_n,             
      output [7:0]                   c1_ddr3_dm,               
      inout  [63:0]                  c1_ddr3_dq,               
      inout  [7:0]                   c1_ddr3_dqs_p,              
      inout  [7:0]                   c1_ddr3_dqs_n,            
      output                         c1_ddr3_odt,              
      output                         c1_ddr3_ras_n,            
      output                         c1_ddr3_reset_n,          
      output                         c1_ddr3_we_n,
      
      input                          sys_rst,
      
      // UART
      //input                          RxD,
      //output                         TxD,
      
      output  [7:0]                  led, 
      
      input [7:0]                    switch

    );
    
wire reset;
wire network_init;
reg button_east_reg;
reg[7:0] led_reg;
wire[7:0] led_out;
assign reset = button_east_reg;// | ~network_init);
//assign reset = ~init_calib_complete_r; //~reset156_25_n;

wire aresetn;
assign aresetn = network_init;
//assign aresetn = init_calib_complete_r; //reset156_25_n;
wire axi_clk;
wire clk_ref_200;

/*
 * Network Signals
 */
wire        AXI_M_Stream_TVALID;
wire        AXI_M_Stream_TREADY;
wire[63:0]  AXI_M_Stream_TDATA;
wire[7:0]   AXI_M_Stream_TKEEP;
wire        AXI_M_Stream_TLAST;

wire        AXI_S_Stream_TVALID;
wire        AXI_S_Stream_TREADY;
wire[63:0]  AXI_S_Stream_TDATA;
wire[7:0]   AXI_S_Stream_TKEEP;
wire        AXI_S_Stream_TLAST;


wire        AXI_M2_Stream_TVALID;
wire        AXI_M2_Stream_TREADY;
wire[63:0]  AXI_M2_Stream_TDATA;
wire[7:0]   AXI_M2_Stream_TKEEP;
wire        AXI_M2_Stream_TLAST;

wire        AXI_S2_Stream_TVALID;
wire        AXI_S2_Stream_TREADY;
wire[63:0]  AXI_S2_Stream_TDATA;
wire[7:0]   AXI_S2_Stream_TKEEP;
wire        AXI_S2_Stream_TLAST;
wire        AXI_S2_Stream_TUSER;

wire        AXI_M3_Stream_TVALID;
wire        AXI_M3_Stream_TREADY;
wire[63:0]  AXI_M3_Stream_TDATA;
wire[7:0]   AXI_M3_Stream_TKEEP;
wire        AXI_M3_Stream_TLAST;

wire        AXI_S3_Stream_TVALID;
wire        AXI_S3_Stream_TREADY;
wire[63:0]  AXI_S3_Stream_TDATA;
wire[7:0]   AXI_S3_Stream_TKEEP;
wire        AXI_S3_Stream_TLAST;
wire        AXI_S3_Stream_TUSER;

wire        AXI_M4_Stream_TVALID;
wire        AXI_M4_Stream_TREADY;
wire[63:0]  AXI_M4_Stream_TDATA;
wire[7:0]   AXI_M4_Stream_TKEEP;
wire        AXI_M4_Stream_TLAST;

wire        AXI_S4_Stream_TVALID;
wire        AXI_S4_Stream_TREADY;
wire[63:0]  AXI_S4_Stream_TDATA;
wire[7:0]   AXI_S4_Stream_TKEEP;
wire        AXI_S4_Stream_TLAST;



/*
 * RX Memory Signals
 */
// memory cmd streams
wire        axis_rxread_cmd_TVALID;
wire        axis_rxread_cmd_TREADY;
wire[71:0]  axis_rxread_cmd_TDATA;
wire        axis_rxwrite_cmd_TVALID;
wire        axis_rxwrite_cmd_TREADY;
wire[71:0]  axis_rxwrite_cmd_TDATA;
// memory sts streams
wire        axis_rxread_sts_TVALID;
wire        axis_rxread_sts_TREADY;
wire[7:0]   axis_rxread_sts_TDATA;
wire        axis_rxwrite_sts_TVALID;
wire        axis_rxwrite_sts_TREADY;
wire[31:0]  axis_rxwrite_sts_TDATA;
// memory data streams
wire        axis_rxread_data_TVALID;
wire        axis_rxread_data_TREADY;
wire[63:0]  axis_rxread_data_TDATA;
wire[7:0]   axis_rxread_data_TKEEP;
wire        axis_rxread_data_TLAST;

wire        axis_rxwrite_data_TVALID;
wire        axis_rxwrite_data_TREADY;
wire[63:0]  axis_rxwrite_data_TDATA;
wire[7:0]   axis_rxwrite_data_TKEEP;
wire        axis_rxwrite_data_TLAST;

/*
 * TX Memory Signals
 */
// memory cmd streams
wire        axis_txread_cmd_TVALID;
wire        axis_txread_cmd_TREADY;
wire[71:0]  axis_txread_cmd_TDATA;
wire        axis_txwrite_cmd_TVALID;
wire        axis_txwrite_cmd_TREADY;
wire[71:0]  axis_txwrite_cmd_TDATA;
// memory sts streams
wire        axis_txread_sts_TVALID;
wire        axis_txread_sts_TREADY;
wire[7:0]   axis_txread_sts_TDATA;
wire        axis_txwrite_sts_TVALID;
wire        axis_txwrite_sts_TREADY;
wire[63:0]  axis_txwrite_sts_TDATA;
// memory data streams
wire        axis_txread_data_TVALID;
wire        axis_txread_data_TREADY;
wire[63:0]  axis_txread_data_TDATA;
wire[7:0]   axis_txread_data_TKEEP;
wire        axis_txread_data_TLAST;

wire        axis_txwrite_data_TVALID;
wire        axis_txwrite_data_TREADY;
wire[63:0]  axis_txwrite_data_TDATA;
wire[7:0]   axis_txwrite_data_TKEEP;
wire        axis_txwrite_data_TLAST;

/*
 * Application Signals
 */
 // listen&close port
  // open&close connection
wire        axis_listen_port_TVALID;
wire        axis_listen_port_TREADY;
wire[15:0]  axis_listen_port_TDATA;
wire        axis_listen_port_status_TVALID;
wire        axis_listen_port_status_TREADY;
wire[7:0]   axis_listen_port_status_TDATA;
//wire        axis_close_port_TVALID;
//wire        axis_close_port_TREADY;
//wire[15:0]  axis_close_port_TDATA;
 // notifications and pkg fetching
wire        axis_notifications_TVALID;
wire        axis_notifications_TREADY;
wire[87:0]  axis_notifications_TDATA;
wire        axis_read_package_TVALID;
wire        axis_read_package_TREADY;
wire[31:0]  axis_read_package_TDATA;
// open&close connection
wire        axis_open_connection_TVALID;
wire        axis_open_connection_TREADY;
wire[47:0]  axis_open_connection_TDATA;
wire        axis_open_status_TVALID;
wire        axis_open_status_TREADY;
wire[23:0]  axis_open_status_TDATA;
wire        axis_close_connection_TVALID;
wire        axis_close_connection_TREADY;
wire[15:0]  axis_close_connection_TDATA;
// rx data
wire        axis_rx_metadata_TVALID;
wire        axis_rx_metadata_TREADY;
wire[15:0]  axis_rx_metadata_TDATA;
wire        axis_rx_data_TVALID;
wire        axis_rx_data_TREADY;
wire[63:0]  axis_rx_data_TDATA;
wire[7:0]   axis_rx_data_TKEEP;
wire        axis_rx_data_TLAST;
// tx data
wire        axis_tx_metadata_TVALID;
wire        axis_tx_metadata_TREADY;
wire[15:0]  axis_tx_metadata_TDATA;
wire        axis_tx_data_TVALID;
wire        axis_tx_data_TREADY;
wire[63:0]  axis_tx_data_TDATA;
wire[7:0]   axis_tx_data_TKEEP;
wire        axis_tx_data_TLAST;
wire        axis_tx_status_TVALID;
wire        axis_tx_status_TREADY;
wire[63:0]  axis_tx_status_TDATA;

/*
 * UDP APP Interface
 */
 // UDP port
 wire        axis_udp_open_port_tvalid;
 wire        axis_udp_open_port_tready;
 wire[15:0]  axis_udp_open_port_tdata;
 wire        axis_udp_open_port_status_tvalid;
 wire        axis_udp_open_port_status_tready;
 wire[7:0]   axis_udp_open_port_status_tdata; //actually only [0:0]
 
 // UDP RX
 wire        axis_udp_rx_data_tvalid;
 wire        axis_udp_rx_data_tready;
 wire[63:0]  axis_udp_rx_data_tdata;
 wire[7:0]   axis_udp_rx_data_tkeep;
 wire        axis_udp_rx_data_tlast;
 
 wire        axis_udp_rx_metadata_tvalid;
 wire        axis_udp_rx_metadata_tready;
 wire[95:0]  axis_udp_rx_metadata_tdata;
 
 // UDP TX
 wire        axis_udp_tx_data_tvalid;
 wire        axis_udp_tx_data_tready;
 wire[63:0]  axis_udp_tx_data_tdata;
 wire[7:0]   axis_udp_tx_data_tkeep;
 wire        axis_udp_tx_data_tlast;
 
 wire        axis_udp_tx_metadata_tvalid;
 wire        axis_udp_tx_metadata_tready;
 wire[95:0]  axis_udp_tx_metadata_tdata;
 
 wire        axis_udp_tx_length_tvalid;
 wire        axis_udp_tx_length_tready;
 wire[15:0]  axis_udp_tx_length_tdata;

reg runExperiment;
reg dualModeEn = 0;
reg[7:0] useConn = 8'h01;
reg[7:0] pkgWordCount = 8'h08;
reg[31:0] regIpAddress1 = 32'h00000000;
reg[15:0] numCons = 16'h0001;

wire[63:0] vio_cmd;
//assign vio_cmd[0] = 0;
//assign vio_cmd[1] = 1;
//assign vio_cmd[9:2] = 8'h01;
//assign vio_cmd[17:10] = 8'h20;
//assign vio_vcmv

always @(posedge axi_clk) begin
    button_east_reg <= button_east;
    led_reg <= led_out;
    runExperiment <= button_north | vio_cmd[0];
    dualModeEn <= vio_cmd[1];
    useConn <= vio_cmd[9:2];
    pkgWordCount <= vio_cmd[17:10];
    regIpAddress1 <= vio_cmd[49:18];
    //numCons <= vio_cmd[33:18];
end
assign led = led_reg;

/*
 * 10G Network Interface Module
 */
vc709_10g_interface n10g_interface_inst
(
.clk_ref_p(clk_ref_p),
.clk_ref_n(clk_ref_n),
.reset(reset),
.aresetn(aresetn),

.i2c_clk(i2c_clk),
.i2c_data(i2c_data),
.i2c_mux_rst_n(i2c_mux_rst_n),
.si5324_rst_n(si5324_rst_n),

.xphy_refclk_p(xphy_refclk_p),
.xphy_refclk_n(xphy_refclk_n),

.xphy0_txp(xphy0_txp),
.xphy0_txn(xphy0_txn),
.xphy0_rxp(xphy0_rxp),
.xphy0_rxn(xphy0_rxn),


.xphy1_txp(xphy1_txp),
.xphy1_txn(xphy1_txn),
.xphy1_rxp(xphy1_rxp),
.xphy1_rxn(xphy1_rxn),


.xphy2_txp(xphy2_txp),
.xphy2_txn(xphy2_txn),
.xphy2_rxp(xphy2_rxp),
.xphy2_rxn(xphy2_rxn),

.xphy3_txp(xphy3_txp),
.xphy3_txn(xphy3_txn),
.xphy3_rxp(xphy3_rxp),
.xphy3_rxn(xphy3_rxn),



//master
.axis_i_0_tdata(AXI_S_Stream_TDATA),
.axis_i_0_tvalid(AXI_S_Stream_TVALID),
.axis_i_0_tlast(AXI_S_Stream_TLAST),
.axis_i_0_tuser(),
.axis_i_0_tkeep(AXI_S_Stream_TKEEP),
.axis_i_0_tready(AXI_S_Stream_TREADY),
    
//slave
.axis_o_0_tdata(AXI_M_Stream_TDATA),
.axis_o_0_tvalid(AXI_M_Stream_TVALID),
.axis_o_0_tlast(AXI_M_Stream_TLAST),
.axis_o_0_tuser(0),
.axis_o_0_tkeep(AXI_M_Stream_TKEEP),
.axis_o_0_tready(AXI_M_Stream_TREADY),

/*
//master2
.axis_i_1_tdata(AXI_S2_Stream_TDATA),
.axis_i_1_tvalid(AXI_S2_Stream_TVALID),
.axis_i_1_tlast(AXI_S2_Stream_TLAST),
.axis_i_1_tuser(AXI_S2_Stream_TUSER),
.axis_i_1_tkeep(AXI_S2_Stream_TKEEP),
.axis_i_1_tready(AXI_S2_Stream_TREADY),
    
//slave2
.axis_o_1_tdata(AXI_M2_Stream_TDATA),
.axis_o_1_tvalid(AXI_M2_Stream_TVALID),
.axis_o_1_tlast(AXI_M2_Stream_TLAST),
.axis_o_1_tuser(0),
.axis_o_1_tkeep(AXI_M2_Stream_TKEEP),
.axis_o_1_tready(AXI_M2_Stream_TREADY),


//master3
.axis_i_2_tdata(AXI_S3_Stream_TDATA),
.axis_i_2_tvalid(AXI_S3_Stream_TVALID),
.axis_i_2_tlast(AXI_S3_Stream_TLAST),
.axis_i_2_tuser(AXI_S3_Stream_TUSER),
.axis_i_2_tkeep(AXI_S3_Stream_TKEEP),
.axis_i_2_tready(AXI_S3_Stream_TREADY),
    
//slave3
.axis_o_2_tdata(AXI_M3_Stream_TDATA),
.axis_o_2_tvalid(AXI_M3_Stream_TVALID),
.axis_o_2_tlast(AXI_M3_Stream_TLAST),
.axis_o_2_tuser(0),
.axis_o_2_tkeep(AXI_M3_Stream_TKEEP),
.axis_o_2_tready(AXI_M3_Stream_TREADY),
/*
//master4
.axis_i_3_tdata(AXI_S4_Stream_TDATA),
.axis_i_3_tvalid(AXI_S4_Stream_TVALID),
.axis_i_3_tlast(AXI_S4_Stream_TLAST),
.axis_i_3_tuser(),
.axis_i_3_tkeep(AXI_S4_Stream_TKEEP),
.axis_i_3_tready(AXI_S4_Stream_TREADY),
    
//slave4
.axis_o_3_tdata(AXI_M4_Stream_TDATA),
.axis_o_3_tvalid(AXI_M4_Stream_TVALID),
.axis_o_3_tlast(AXI_M4_Stream_TLAST),
.axis_o_3_tuser(0),
.axis_o_3_tkeep(AXI_M4_Stream_TKEEP),
.axis_o_3_tready(AXI_M4_Stream_TREADY),
  */  
.sfp_tx_disable(sfp_tx_disable),
.clk156_out(axi_clk),
.clk_ref_200_out(clk_ref_200),
.network_reset_done(network_init),
.led(led_out)

);

/*
 * TCP/IP Wrapper Module
 */
wire[31:0] ip_address;
wire[15:0] regSessionCount_V;
wire regSessionCount_V_vld;

wire [161:0] debug_out;


tcp_ip_wrapper #(
    .MAC_ADDRESS    (48'hE59D02350A00), //bytes reversed
    .IP_ADDRESS     (32'hD1D4010A), //reverse
    .IP_SUBNET_MASK     (32'h00FFFFFF), //reverse
    .IP_DEFAULT_GATEWAY     (32'h01D4010A), //reverse
    .DHCP_EN        (0)
)
tcp_ip_inst (
.aclk           (axi_clk),
//.reset           (reset),
.aresetn           (aresetn),
// network interface streams
.AXI_M_Stream_TVALID           (AXI_M_Stream_TVALID),
.AXI_M_Stream_TREADY           (AXI_M_Stream_TREADY),
.AXI_M_Stream_TDATA           (AXI_M_Stream_TDATA),
.AXI_M_Stream_TKEEP           (AXI_M_Stream_TKEEP),
.AXI_M_Stream_TLAST           (AXI_M_Stream_TLAST),

.AXI_S_Stream_TVALID           (AXI_S_Stream_TVALID),
.AXI_S_Stream_TREADY           (AXI_S_Stream_TREADY),
.AXI_S_Stream_TDATA           (AXI_S_Stream_TDATA),
.AXI_S_Stream_TKEEP           (AXI_S_Stream_TKEEP),
.AXI_S_Stream_TLAST           (AXI_S_Stream_TLAST),

// memory rx cmd streams
.m_axis_rxread_cmd_TVALID           (axis_rxread_cmd_TVALID),
.m_axis_rxread_cmd_TREADY           (axis_rxread_cmd_TREADY),
.m_axis_rxread_cmd_TDATA           (axis_rxread_cmd_TDATA),
.m_axis_rxwrite_cmd_TVALID           (axis_rxwrite_cmd_TVALID),
.m_axis_rxwrite_cmd_TREADY           (axis_rxwrite_cmd_TREADY),
.m_axis_rxwrite_cmd_TDATA           (axis_rxwrite_cmd_TDATA),
// memory rx status streams
.s_axis_rxread_sts_TVALID           (axis_rxread_sts_TVALID),
.s_axis_rxread_sts_TREADY           (axis_rxread_sts_TREADY),
.s_axis_rxread_sts_TDATA           (axis_rxread_sts_TDATA),
.s_axis_rxwrite_sts_TVALID           (axis_rxwrite_sts_TVALID),
.s_axis_rxwrite_sts_TREADY           (axis_rxwrite_sts_TREADY),
.s_axis_rxwrite_sts_TDATA           (axis_rxwrite_sts_TDATA),
// memory rx data streams
.s_axis_rxread_data_TVALID           (axis_rxread_data_TVALID),
.s_axis_rxread_data_TREADY           (axis_rxread_data_TREADY),
.s_axis_rxread_data_TDATA           (axis_rxread_data_TDATA),
.s_axis_rxread_data_TKEEP           (axis_rxread_data_TKEEP),
.s_axis_rxread_data_TLAST           (axis_rxread_data_TLAST),
.m_axis_rxwrite_data_TVALID           (axis_rxwrite_data_TVALID),
.m_axis_rxwrite_data_TREADY           (axis_rxwrite_data_TREADY),
.m_axis_rxwrite_data_TDATA           (axis_rxwrite_data_TDATA),
.m_axis_rxwrite_data_TKEEP           (axis_rxwrite_data_TKEEP),
.m_axis_rxwrite_data_TLAST           (axis_rxwrite_data_TLAST),

// memory tx cmd streams
.m_axis_txread_cmd_TVALID           (axis_txread_cmd_TVALID),
.m_axis_txread_cmd_TREADY           (axis_txread_cmd_TREADY),
.m_axis_txread_cmd_TDATA           (axis_txread_cmd_TDATA),
.m_axis_txwrite_cmd_TVALID           (axis_txwrite_cmd_TVALID),
.m_axis_txwrite_cmd_TREADY           (axis_txwrite_cmd_TREADY),
.m_axis_txwrite_cmd_TDATA           (axis_txwrite_cmd_TDATA),
// memory tx status streams
.s_axis_txread_sts_TVALID           (axis_txread_sts_TVALID),
.s_axis_txread_sts_TREADY           (axis_txread_sts_TREADY),
.s_axis_txread_sts_TDATA           (axis_txread_sts_TDATA),
.s_axis_txwrite_sts_TVALID           (axis_txwrite_sts_TVALID),
.s_axis_txwrite_sts_TREADY           (axis_txwrite_sts_TREADY),
.s_axis_txwrite_sts_TDATA           (axis_txwrite_sts_TDATA),
// memory tx data streams
.s_axis_txread_data_TVALID           (axis_txread_data_TVALID),
.s_axis_txread_data_TREADY           (axis_txread_data_TREADY),
.s_axis_txread_data_TDATA           (axis_txread_data_TDATA),
.s_axis_txread_data_TKEEP           (axis_txread_data_TKEEP),
.s_axis_txread_data_TLAST           (axis_txread_data_TLAST),
.m_axis_txwrite_data_TVALID           (axis_txwrite_data_TVALID),
.m_axis_txwrite_data_TREADY           (axis_txwrite_data_TREADY),
.m_axis_txwrite_data_TDATA           (axis_txwrite_data_TDATA),
.m_axis_txwrite_data_TKEEP           (axis_txwrite_data_TKEEP),
.m_axis_txwrite_data_TLAST           (axis_txwrite_data_TLAST),

//application interface streams
.m_axis_listen_port_status_TVALID       (axis_listen_port_status_TVALID),
.m_axis_listen_port_status_TREADY       (axis_listen_port_status_TREADY),
.m_axis_listen_port_status_TDATA        (axis_listen_port_status_TDATA),
.m_axis_notifications_TVALID            (axis_notifications_TVALID),
.m_axis_notifications_TREADY            (axis_notifications_TREADY),
.m_axis_notifications_TDATA             (axis_notifications_TDATA),
.m_axis_open_status_TVALID              (axis_open_status_TVALID),
.m_axis_open_status_TREADY              (axis_open_status_TREADY),
.m_axis_open_status_TDATA               (axis_open_status_TDATA),
.m_axis_rx_data_TVALID              (axis_rx_data_TVALID),
.m_axis_rx_data_TREADY              (axis_rx_data_TREADY), //axis_rx_data_TREADY
.m_axis_rx_data_TDATA               (axis_rx_data_TDATA),
.m_axis_rx_data_TKEEP               (axis_rx_data_TKEEP),
.m_axis_rx_data_TLAST               (axis_rx_data_TLAST),
.m_axis_rx_metadata_TVALID          (axis_rx_metadata_TVALID),
.m_axis_rx_metadata_TREADY          (axis_rx_metadata_TREADY),
.m_axis_rx_metadata_TDATA           (axis_rx_metadata_TDATA),
.m_axis_tx_status_TVALID            (axis_tx_status_TVALID),
.m_axis_tx_status_TREADY            (axis_tx_status_TREADY),
.m_axis_tx_status_TDATA             (axis_tx_status_TDATA),
.s_axis_listen_port_TVALID          (axis_listen_port_TVALID),
.s_axis_listen_port_TREADY          (axis_listen_port_TREADY),
.s_axis_listen_port_TDATA           (axis_listen_port_TDATA),
//.s_axis_close_port_TVALID           (axis_close_port_TVALID),
//.s_axis_close_port_TREADY           (axis_close_port_TREADY),
//.s_axis_close_port_TDATA            (axis_close_port_TDATA),
.s_axis_close_connection_TVALID           (axis_close_connection_TVALID),
.s_axis_close_connection_TREADY           (axis_close_connection_TREADY),
.s_axis_close_connection_TDATA           (axis_close_connection_TDATA),
.s_axis_open_connection_TVALID          (axis_open_connection_TVALID),
.s_axis_open_connection_TREADY          (axis_open_connection_TREADY),
.s_axis_open_connection_TDATA           (axis_open_connection_TDATA),
.s_axis_read_package_TVALID             (axis_read_package_TVALID),
.s_axis_read_package_TREADY             (axis_read_package_TREADY),
.s_axis_read_package_TDATA              (axis_read_package_TDATA),
.s_axis_tx_data_TVALID                  (axis_tx_data_TVALID),
.s_axis_tx_data_TREADY                  (axis_tx_data_TREADY),
.s_axis_tx_data_TDATA                   (axis_tx_data_TDATA),
.s_axis_tx_data_TKEEP                   (axis_tx_data_TKEEP),
.s_axis_tx_data_TLAST                   (axis_tx_data_TLAST),
.s_axis_tx_metadata_TVALID              (axis_tx_metadata_TVALID),
.s_axis_tx_metadata_TREADY              (axis_tx_metadata_TREADY),
.s_axis_tx_metadata_TDATA               (axis_tx_metadata_TDATA),
// UDP
/*
.s_axis_udp_open_port_tvalid(axis_udp_open_port_tvalid),
.s_axis_udp_open_port_tready(axis_udp_open_port_tready),
.s_axis_udp_open_port_tdata(axis_udp_open_port_tdata),
.m_axis_udp_open_port_status_tvalid(axis_udp_open_port_status_tvalid),
.m_axis_udp_open_port_status_tready(axis_udp_open_port_status_tready),
.m_axis_udp_open_port_status_tdata(axis_udp_open_port_status_tdata), //actually only [0:0]
    
    // UDP RX
.m_axis_udp_rx_data_tvalid(axis_udp_rx_data_tvalid),
.m_axis_udp_rx_data_tready(axis_udp_rx_data_tready),
.m_axis_udp_rx_data_tdata(axis_udp_rx_data_tdata),
.m_axis_udp_rx_data_tkeep(axis_udp_rx_data_tkeep),
.m_axis_udp_rx_data_tlast(axis_udp_rx_data_tlast),
    
.m_axis_udp_rx_metadata_tvalid(axis_udp_rx_metadata_tvalid),
.m_axis_udp_rx_metadata_tready(axis_udp_rx_metadata_tready),
.m_axis_udp_rx_metadata_tdata(axis_udp_rx_metadata_tdata),
    
    // UDP TX
.s_axis_udp_tx_data_tvalid(axis_udp_tx_data_tvalid),
.s_axis_udp_tx_data_tready(axis_udp_tx_data_tready),
.s_axis_udp_tx_data_tdata(axis_udp_tx_data_tdata),
.s_axis_udp_tx_data_tkeep(axis_udp_tx_data_tkeep),
.s_axis_udp_tx_data_tlast(axis_udp_tx_data_tlast),
    
.s_axis_udp_tx_metadata_tvalid(axis_udp_tx_metadata_tvalid),
.s_axis_udp_tx_metadata_tready(axis_udp_tx_metadata_tready),
.s_axis_udp_tx_metadata_tdata(axis_udp_tx_metadata_tdata),
    
.s_axis_udp_tx_length_tvalid(axis_udp_tx_length_tvalid),
.s_axis_udp_tx_length_tready(axis_udp_tx_length_tready),
.s_axis_udp_tx_length_tdata(axis_udp_tx_length_tdata),
*/
    
.ip_address_out(ip_address),
.regSessionCount_V(regSessionCount_V),
.regSessionCount_V_ap_vld(regSessionCount_V_vld),

.debug_out(debug_out),

.board_number(switch[3:0]),
.subnet_number(switch[5:4])

);

//FOR memcached
wire        axis_mc_rx_data_TVALID;
wire        axis_mc_rx_data_TREADY;
wire[191:0] axis_mc_rx_data_TDATA;
wire        axis_mc_tx_data_TVALID;
wire        axis_mc_tx_data_TREADY;
wire[191:0] axis_mc_tx_data_TDATA;
//UDP
wire        axis_mc_udp_rx_data_TVALID;
wire        axis_mc_udp_rx_data_TREADY;
wire[191:0] axis_mc_udp_rx_data_TDATA;
wire        axis_mc_udp_tx_data_TVALID;
wire        axis_mc_udp_tx_data_TREADY;
wire[191:0] axis_mc_udp_tx_data_TDATA;
//TCP
wire        axis_mc_tcp_rx_data_TVALID;
wire        axis_mc_tcp_rx_data_TREADY;
wire[63:0]  axis_mc_tcp_rx_data_TDATA;
wire[7:0]   axis_mc_tcp_rx_data_TKEEP;
wire        axis_mc_tcp_rx_data_TLAST;
wire        axis_mc_tcp_tx_data_TVALID;
wire        axis_mc_tcp_tx_data_TREADY;
wire[63:0]  axis_mc_tcp_tx_data_TDATA;
wire[7:0]   axis_mc_tcp_tx_data_TKEEP;
wire        axis_mc_tcp_tx_data_TLAST;

assign axis_mc_udp_rx_data_TREADY = 1'b1;
assign axis_mc_udp_tx_data_TVALID = 1'b0;
assign axis_mc_udp_tx_data_TDATA = 0;


/*
 * Application Module
 */
 
 
   wire [511:0] ht_dramRdData_data;
     wire          ht_dramRdData_empty;
     wire          ht_dramRdData_almost_empty;
    wire          ht_dramRdData_read;


    wire [63:0] ht_cmd_dramRdData_data;
    wire        ht_cmd_dramRdData_valid;
     wire        ht_cmd_dramRdData_stall;


    wire [511:0] ht_dramWrData_data;
    wire          ht_dramWrData_valid;
     wire          ht_dramWrData_stall;


    wire [63:0] ht_cmd_dramWrData_data;
    wire        ht_cmd_dramWrData_valid;
     wire        ht_cmd_dramWrData_stall;
     

     
   wire [511:0] upd_dramRdData_data;
   wire          upd_dramRdData_empty;
   wire          upd_dramRdData_almost_empty;
  wire          upd_dramRdData_read;

 
  wire [63:0] upd_cmd_dramRdData_data;
  wire        upd_cmd_dramRdData_valid;
   wire        upd_cmd_dramRdData_stall;

 
  wire [511:0] upd_dramWrData_data;
  wire          upd_dramWrData_valid;
   wire          upd_dramWrData_stall;

 
  wire [63:0] upd_cmd_dramWrData_data;
  wire        upd_cmd_dramWrData_valid;
   wire        upd_cmd_dramWrData_stall;    


  wire [63:0] ptr_rdcmd_data;
  wire         ptr_rdcmd_valid;
  wire         ptr_rdcmd_ready;

  wire [512-1:0]  ptr_rd_data;
  wire         ptr_rd_valid;
  wire         ptr_rd_ready; 

  wire [512-1:0] ptr_wr_data;
  wire         ptr_wr_valid;
  wire         ptr_wr_ready;

  wire [63:0] ptr_wrcmd_data;
  wire         ptr_wrcmd_valid;
  wire         ptr_wrcmd_ready;


  wire [63:0] bmap_rdcmd_data;
  wire         bmap_rdcmd_valid;
  wire         bmap_rdcmd_ready;

  wire [512-1:0]  bmap_rd_data;
  wire         bmap_rd_valid;
  wire         bmap_rd_ready; 

  wire [512-1:0] bmap_wr_data;
  wire         bmap_wr_valid;
  wire         bmap_wr_ready;

  wire [63:0] bmap_wrcmd_data;
  wire         bmap_wrcmd_valid;
  wire         bmap_wrcmd_ready;


assign AXI_M2_Stream_TKEEP = AXI_M2_Stream_TVALID==1 ? 8'b11111111 : 8'b00000000;
assign AXI_M3_Stream_TKEEP = 8'b11111111;
assign AXI_M4_Stream_TKEEP = 8'b11111111;



//DRAM MEM interface

//wire clk156_25;
wire reset233_n; //active low reset signal for 233MHz clock domain
wire reset156_25_n;
//wire clk233;
wire clk200, clk200_i;
wire c0_init_calib_complete;
wire c1_init_calib_complete;

//toe stream interface signals
wire           toeTX_s_axis_read_cmd_tvalid;
wire          toeTX_s_axis_read_cmd_tready;
wire[71:0]     toeTX_s_axis_read_cmd_tdata;
//read status
wire          toeTX_m_axis_read_sts_tvalid;
wire           toeTX_m_axis_read_sts_tready;
wire[7:0]     toeTX_m_axis_read_sts_tdata;
//read stream
wire[63:0]    toeTX_m_axis_read_tdata;
wire[7:0]     toeTX_m_axis_read_tkeep;
wire          toeTX_m_axis_read_tlast;
wire          toeTX_m_axis_read_tvalid;
wire           toeTX_m_axis_read_tready;

//write commands
wire           toeTX_s_axis_write_cmd_tvalid;
wire          toeTX_s_axis_write_cmd_tready;
wire[71:0]     toeTX_s_axis_write_cmd_tdata;
//write status
wire          toeTX_m_axis_write_sts_tvalid;
wire           toeTX_m_axis_write_sts_tready;
wire[31:0]     toeTX_m_axis_write_sts_tdata;
//write stream
wire[63:0]     toeTX_s_axis_write_tdata;
wire[7:0]      toeTX_s_axis_write_tkeep;
wire           toeTX_s_axis_write_tlast;
wire           toeTX_s_axis_write_tvalid;
wire          toeTX_s_axis_write_tready;

//upd stream interface signals
wire           upd_s_axis_read_cmd_tvalid;
wire          upd_s_axis_read_cmd_tready;
wire[71:0]     upd_s_axis_read_cmd_tdata;
//read status
wire          upd_m_axis_read_sts_tvalid;
wire           upd_m_axis_read_sts_tready;
wire[7:0]     upd_m_axis_read_sts_tdata;
//read stream
wire[511:0]    upd_m_axis_read_tdata;
wire[63:0]     upd_m_axis_read_tkeep;
wire          upd_m_axis_read_tlast;
wire          upd_m_axis_read_tvalid;
wire           upd_m_axis_read_tready;

//write commands
wire           upd_s_axis_write_cmd_tvalid;
wire          upd_s_axis_write_cmd_tready;
wire[71:0]     upd_s_axis_write_cmd_tdata;
//write status
wire          upd_m_axis_write_sts_tvalid;
wire           upd_m_axis_write_sts_tready;
wire[31:0]     upd_m_axis_write_sts_tdata;
//write stream
wire[511:0]     upd_s_axis_write_tdata;
wire[63:0]      upd_s_axis_write_tkeep;
wire           upd_s_axis_write_tlast;
wire           upd_s_axis_write_tvalid;
wire          upd_s_axis_write_tready;

wire[511:0]     upd_s_axis_write_tdata_x;
wire[63:0]      upd_s_axis_write_tkeep_x;
wire           upd_s_axis_write_tlast_x;
wire           upd_s_axis_write_tvalid_x;
wire          upd_s_axis_write_tready_x;


//muu_TopWrapper multiuser_kvs_top  (
zookeeper_tcp_top_parallel_nkv nkv_TopWrapper (
  .m_axis_open_connection_TVALID(axis_open_connection_TVALID),
  .m_axis_open_connection_TDATA(axis_open_connection_TDATA),
  .m_axis_open_connection_TREADY(axis_open_connection_TREADY),
  .m_axis_close_connection_TVALID(axis_close_connection_TVALID),
  .m_axis_close_connection_TDATA(axis_close_connection_TDATA),
  .m_axis_close_connection_TREADY(axis_close_connection_TREADY),
  .m_axis_listen_port_TVALID(axis_listen_port_TVALID),                // output wire m_axis_listen_port_TVALID
  .m_axis_listen_port_TREADY(axis_listen_port_TREADY),                // input wire m_axis_listen_port_TREADY
  .m_axis_listen_port_TDATA(axis_listen_port_TDATA),                  // output wire [15 : 0] m_axis_listen_port_TDATA
  .m_axis_read_package_TVALID(axis_read_package_TVALID),              // output wire m_axis_read_package_TVALID
  .m_axis_read_package_TREADY(axis_read_package_TREADY),              // input wire m_axis_read_package_TREADY
  .m_axis_read_package_TDATA(axis_read_package_TDATA),                // output wire [31 : 0] m_axis_read_package_TDATA
  .m_axis_tx_data_TVALID(axis_tx_data_TVALID),                        // output wire m_axis_tx_data_TVALID
  .m_axis_tx_data_TREADY(axis_tx_data_TREADY),                        // input wire m_axis_tx_data_TREADY
  .m_axis_tx_data_TDATA(axis_tx_data_TDATA),                          // output wire [63 : 0] m_axis_tx_data_TDATA
  .m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),                          // output wire [7 : 0] m_axis_tx_data_TKEEP
  .m_axis_tx_data_TLAST(axis_tx_data_TLAST),                          // output wire [0 : 0] m_axis_tx_data_TLAST
  .m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),                // output wire m_axis_tx_metadata_TVALID
  .m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),                // input wire m_axis_tx_metadata_TREADY
  .m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),                  // output wire [15 : 0] m_axis_tx_metadata_TDATA
  .s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),  // input wire s_axis_listen_port_status_TVALID
  .s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),  // output wire s_axis_listen_port_status_TREADY
  .s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),    // input wire [7 : 0] s_axis_listen_port_status_TDATA
  .s_axis_open_status_TVALID(axis_open_status_TVALID),
  .s_axis_open_status_TDATA(axis_open_status_TDATA),
  .s_axis_open_status_TREADY(axis_open_status_TREADY),
  .s_axis_notifications_TVALID(axis_notifications_TVALID),            // input wire s_axis_notifications_TVALID
  .s_axis_notifications_TREADY(axis_notifications_TREADY),            // output wire s_axis_notifications_TREADY
  .s_axis_notifications_TDATA(axis_notifications_TDATA),              // input wire [87 : 0] s_axis_notifications_TDATA
  .s_axis_rx_data_TVALID(axis_rx_data_TVALID),                        // input wire s_axis_rx_data_TVALID
  .s_axis_rx_data_TREADY(axis_rx_data_TREADY),                        // output wire s_axis_rx_data_TREADY
  .s_axis_rx_data_TDATA(axis_rx_data_TDATA),                          // input wire [63 : 0] s_axis_rx_data_TDATA
  .s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),                          // input wire [7 : 0] s_axis_rx_data_TKEEP
  .s_axis_rx_data_TLAST(axis_rx_data_TLAST),                          // input wire [0 : 0] s_axis_rx_data_TLAST
  .s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),                // input wire s_axis_rx_metadata_TVALID
  .s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),                // output wire s_axis_rx_metadata_TREADY
  .s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),                  // input wire [15 : 0] s_axis_rx_metadata_TDATA
  .s_axis_tx_status_TVALID(axis_tx_status_TVALID),                    // input wire s_axis_tx_status_TVALID
  .s_axis_tx_status_TREADY(axis_tx_status_TREADY),                    // output wire s_axis_tx_status_TREADY
  .s_axis_tx_status_TDATA(axis_tx_status_TDATA),                      // input wire [23 : 0] s_axis_tx_status_TDATA


  
  .ht_dramRdData_data(ht_dramRdData_data),
  .ht_dramRdData_empty(ht_dramRdData_empty),
  .ht_dramRdData_almost_empty(ht_dramRdData_almost_empty),
  .ht_dramRdData_read(ht_dramRdData_read),
  
  .ht_cmd_dramRdData_data(ht_cmd_dramRdData_data),
  .ht_cmd_dramRdData_valid(ht_cmd_dramRdData_valid),
  .ht_cmd_dramRdData_stall(ht_cmd_dramRdData_stall),

  .ht_dramWrData_data(ht_dramWrData_data),
  .ht_dramWrData_valid(ht_dramWrData_valid),
  .ht_dramWrData_stall(ht_dramWrData_stall),
  
  .ht_cmd_dramWrData_data(ht_cmd_dramWrData_data),
  .ht_cmd_dramWrData_valid(ht_cmd_dramWrData_valid),
  .ht_cmd_dramWrData_stall(ht_cmd_dramWrData_stall),  
  
  // Update DRAM Connection  
  .upd_dramRdData_data(upd_dramRdData_data),
  .upd_dramRdData_empty(upd_dramRdData_empty),
  .upd_dramRdData_almost_empty(upd_dramRdData_almost_empty),
  .upd_dramRdData_read(upd_dramRdData_read),
  
  .upd_cmd_dramRdData_data(upd_cmd_dramRdData_data),
  .upd_cmd_dramRdData_valid(upd_cmd_dramRdData_valid),
  .upd_cmd_dramRdData_stall(upd_cmd_dramRdData_stall),
  
  .upd_dramWrData_data(upd_dramWrData_data),
  .upd_dramWrData_valid(upd_dramWrData_valid),
  .upd_dramWrData_stall(upd_dramWrData_stall),

  .upd_cmd_dramWrData_data(upd_cmd_dramWrData_data),
  .upd_cmd_dramWrData_valid(upd_cmd_dramWrData_valid),
  .upd_cmd_dramWrData_stall(upd_cmd_dramWrData_stall),  

  .ptr_rdcmd_data(ptr_rdcmd_data),
  .ptr_rdcmd_valid(ptr_rdcmd_valid),
  .ptr_rdcmd_ready(ptr_rdcmd_ready),

  .ptr_rd_data(ptr_rd_data),
  .ptr_rd_valid(ptr_rd_valid),
  .ptr_rd_ready(ptr_rd_ready),  

  .ptr_wr_data(ptr_wr_data),
  .ptr_wr_valid(ptr_wr_valid),
  .ptr_wr_ready(ptr_wr_ready),

  .ptr_wrcmd_data(ptr_wrcmd_data),
  .ptr_wrcmd_valid(ptr_wrcmd_valid),
  .ptr_wrcmd_ready(ptr_wrcmd_ready),


  .bmap_rdcmd_data(bmap_rdcmd_data),
  .bmap_rdcmd_valid(bmap_rdcmd_valid),
  .bmap_rdcmd_ready(bmap_rdcmd_ready),

  .bmap_rd_data(bmap_rd_data),
  .bmap_rd_valid(bmap_rd_valid),
  .bmap_rd_ready(bmap_rd_ready),  

  .bmap_wr_data(bmap_wr_data),
  .bmap_wr_valid(bmap_wr_valid),
  .bmap_wr_ready(bmap_wr_ready),

  .bmap_wrcmd_data(bmap_wrcmd_data),
  .bmap_wrcmd_valid(bmap_wrcmd_valid),
  .bmap_wrcmd_ready(bmap_wrcmd_ready),

  /*
  .para0_in_tvalid(AXI_S2_Stream_TVALID),
  .para0_in_tready(AXI_S2_Stream_TREADY),
  .para0_in_tdata(AXI_S2_Stream_TDATA),
  .para0_in_tlast(AXI_S2_Stream_TLAST),
  
  .para0_out_tvalid(AXI_M2_Stream_TVALID),
  .para0_out_tready(AXI_M2_Stream_TREADY),
  .para0_out_tdata(AXI_M2_Stream_TDATA),
  .para0_out_tlast(AXI_M2_Stream_TLAST),
   
  .para1_in_tvalid(AXI_S3_Stream_TVALID),
  .para1_in_tready(AXI_S3_Stream_TREADY),
  .para1_in_tdata(AXI_S3_Stream_TDATA),
  .para1_in_tlast(AXI_S3_Stream_TLAST),
  
  .para1_out_tvalid(AXI_M3_Stream_TVALID),
  .para1_out_tready(AXI_M3_Stream_TREADY),
  .para1_out_tdata(AXI_M3_Stream_TDATA),
  .para1_out_tlast(AXI_M3_Stream_TLAST),


  .para2_in_tvalid(AXI_S4_Stream_TVALID),
  .para2_in_tready(AXI_S4_Stream_TREADY),
  .para2_in_tdata(AXI_S4_Stream_TDATA),
  .para2_in_tlast(AXI_S4_Stream_TLAST),
  
  .para2_out_tvalid(AXI_M4_Stream_TVALID),
  .para2_out_tready(AXI_M4_Stream_TREADY),
  .para2_out_tdata(AXI_M4_Stream_TDATA),
  .para2_out_tlast(AXI_M4_Stream_TLAST),
   */
   
  .hadretransmit({toeTX_m_axis_read_tdata[54:0],toeTX_m_axis_read_tkeep[7:0],toeTX_m_axis_read_tvalid}),
  //.toedebug({1'b0, AXI_S_Stream_TLAST, AXI_S_Stream_TREADY, AXI_S_Stream_TVALID, toeTX_s_axis_write_cmd_tdata[59:32], toeTX_s_axis_read_cmd_tdata[63:32], 1'b0,toeTX_s_axis_write_cmd_tvalid, toeTX_s_axis_read_cmd_tvalid,toeTX_s_axis_write_tvalid ,toeTX_s_axis_write_tdata[59:0],toeTX_s_axis_write_tkeep[7:0]}),
  .toedebug(debug_out),
  
  .aclk(axi_clk),                                                          // input wire aclk
  .aresetn(aresetn)                                                    // input wire aresetn
);




wire ddr3_calib_complete, init_calib_complete;
wire toeTX_compare_error, ht_compare_error, upd_compare_error;

//reg rst_n_r1, rst_n_r2, rst_n_r3;
//reg reset156_25_n_r1, reset156_25_n_r2, reset156_25_n_r3;

//registers for crossing clock domains (from 233MHz to 156.25MHz)
reg c0_init_calib_complete_r1, c0_init_calib_complete_r2;
reg c1_init_calib_complete_r1, c1_init_calib_complete_r2;


//- 212MHz differential clock for 1866Mbps DDR3 controller
   wire sys_clk_212_i;  
   
   IBUFGDS #(
     .DIFF_TERM    ("TRUE"),
     .IBUF_LOW_PWR ("FALSE")
   ) clk_212_ibufg (
     .I            (sys_clk_p),
     .IB           (sys_clk_n),
     .O            (sys_clk_212_i)
   );

wire sys_rst_i;
IBUF rst_212_bufg
(
    .I  (sys_rst),
    .O  (sys_rst_i)
);


always @(posedge axi_clk) 
    if (aresetn == 0) begin
        c0_init_calib_complete_r1 <= 1'b0;
        c0_init_calib_complete_r2 <= 1'b0;
        c1_init_calib_complete_r1 <= 1'b0;
        c1_init_calib_complete_r2 <= 1'b0;
    end
    else begin
        c0_init_calib_complete_r1 <= c0_init_calib_complete;
        c0_init_calib_complete_r2 <= c0_init_calib_complete_r1;
        c1_init_calib_complete_r1 <= c1_init_calib_complete;
        c1_init_calib_complete_r2 <= c1_init_calib_complete_r1;
    end

assign ddr3_calib_complete = c0_init_calib_complete_r2 & c1_init_calib_complete_r2;
assign init_calib_complete = ddr3_calib_complete;
/*
 * TX Memory Signals
 */
// memory cmd streams
assign toeTX_s_axis_read_cmd_tvalid = axis_txread_cmd_TVALID;
assign axis_txread_cmd_TREADY = toeTX_s_axis_read_cmd_tready;
assign toeTX_s_axis_read_cmd_tdata = axis_txread_cmd_TDATA;
assign toeTX_s_axis_write_cmd_tvalid = axis_txwrite_cmd_TVALID;
assign axis_txwrite_cmd_TREADY = toeTX_s_axis_write_cmd_tready;
assign toeTX_s_axis_write_cmd_tdata = axis_txwrite_cmd_TDATA;
// memory sts streams
assign axis_txread_sts_TVALID         = toeTX_m_axis_read_sts_tvalid;
assign toeTX_m_axis_read_sts_tready = axis_txread_sts_TREADY;
assign axis_txread_sts_TDATA          = toeTX_m_axis_read_sts_tdata;
assign axis_txwrite_sts_TVALID        = toeTX_m_axis_write_sts_tvalid;
assign toeTX_m_axis_write_sts_tready    = axis_txwrite_sts_TREADY;
assign axis_txwrite_sts_TDATA         = toeTX_m_axis_write_sts_tdata;
// memory data streams
assign axis_txread_data_TVALID = toeTX_m_axis_read_tvalid;
assign toeTX_m_axis_read_tready = axis_txread_data_TREADY;
assign axis_txread_data_TDATA = toeTX_m_axis_read_tdata;
assign axis_txread_data_TKEEP = toeTX_m_axis_read_tkeep;
assign axis_txread_data_TLAST = toeTX_m_axis_read_tlast;

assign toeTX_s_axis_write_tvalid = axis_txwrite_data_TVALID;
assign axis_txwrite_data_TREADY = toeTX_s_axis_write_tready;
assign toeTX_s_axis_write_tdata = axis_txwrite_data_TDATA;
assign toeTX_s_axis_write_tkeep = axis_txwrite_data_TKEEP;
assign toeTX_s_axis_write_tlast = axis_txwrite_data_TLAST;

wire           toeRX_s_axis_read_cmd_tvalid;
wire          toeRX_s_axis_read_cmd_tready;
wire[71:0]     toeRX_s_axis_read_cmd_tdata;
//read status
wire          toeRX_m_axis_read_sts_tvalid;
wire           toeRX_m_axis_read_sts_tready;
wire[7:0]     toeRX_m_axis_read_sts_tdata;
//read stream
wire[63:0]    toeRX_m_axis_read_tdata;
wire[7:0]     toeRX_m_axis_read_tkeep;
wire          toeRX_m_axis_read_tlast;
wire          toeRX_m_axis_read_tvalid;
wire           toeRX_m_axis_read_tready;

//write commands
wire           toeRX_s_axis_write_cmd_tvalid;
wire          toeRX_s_axis_write_cmd_tready;
wire[71:0]     toeRX_s_axis_write_cmd_tdata;
//write status
wire          toeRX_m_axis_write_sts_tvalid;
wire           toeRX_m_axis_write_sts_tready;
wire[31:0]     toeRX_m_axis_write_sts_tdata;
//write stream
wire[63:0]     toeRX_s_axis_write_tdata;
wire[7:0]      toeRX_s_axis_write_tkeep;
wire           toeRX_s_axis_write_tlast;
wire           toeRX_s_axis_write_tvalid;
wire          toeRX_s_axis_write_tready;

/*
 * RX Memory Signals
 */
// memory cmd streams
assign toeRX_s_axis_read_cmd_tvalid = axis_rxread_cmd_TVALID;
assign axis_rxread_cmd_TREADY = toeRX_s_axis_read_cmd_tready;
assign toeRX_s_axis_read_cmd_tdata = axis_rxread_cmd_TDATA;
assign toeRX_s_axis_write_cmd_tvalid = axis_rxwrite_cmd_TVALID;
assign axis_rxwrite_cmd_TREADY = toeRX_s_axis_write_cmd_tready;
assign toeRX_s_axis_write_cmd_tdata = axis_rxwrite_cmd_TDATA;
// memory sts streams
assign axis_rxread_sts_TVALID = 1'b0; //toeRX_m_axis_read_sts_tvalid;
assign toeRX_m_axis_read_sts_tready = axis_rxread_sts_TREADY;
assign axis_rxread_sts_TDATA = toeRX_m_axis_read_sts_tdata;
assign axis_rxwrite_sts_TVALID = 1'b0; //toeRX_m_axis_write_sts_tvalid;
assign toeRX_m_axis_write_sts_tready = axis_rxwrite_sts_TREADY;
assign axis_rxwrite_sts_TDATA = toeRX_m_axis_write_sts_tdata;
// memory data streams
assign axis_rxread_data_TVALID = toeRX_m_axis_read_tvalid;
assign toeRX_m_axis_read_tready = axis_rxread_data_TREADY;
assign axis_rxread_data_TDATA = toeRX_m_axis_read_tdata;
assign axis_rxread_data_TKEEP = toeRX_m_axis_read_tkeep;
assign axis_rxread_data_TLAST = toeRX_m_axis_read_tlast;

assign toeRX_s_axis_write_tvalid = axis_rxwrite_data_TVALID;
assign axis_rxwrite_data_TREADY = toeRX_s_axis_write_tready;
assign toeRX_s_axis_write_tdata = axis_rxwrite_data_TDATA;
assign toeRX_s_axis_write_tkeep = axis_rxwrite_data_TKEEP;
assign toeRX_s_axis_write_tlast = axis_rxwrite_data_TLAST;





assign upd_m_axis_read_sts_tready = 1'b1;
assign upd_m_axis_write_sts_tready = 1'b1;


/*
 * TCP DDR Memory Interface
 */
nkv_ddr_mem_inf  mem_inf_inst
(
.clk156_25(axi_clk),
//.reset233_n(reset233_n), //active low reset signal for 233MHz clock domain
.reset156_25_n(ddr3_calib_complete),
.clk212(sys_clk_212_i),
.clk200(clk_ref_200),
.sys_rst(sys_rst_i),

//ddr3 pins
//SODIMM 0
// Inouts
.c0_ddr3_dq(c0_ddr3_dq),
.c0_ddr3_dqs_n(c0_ddr3_dqs_n),
.c0_ddr3_dqs_p(c0_ddr3_dqs_p),

// Outputs
.c0_ddr3_addr(c0_ddr3_addr),
.c0_ddr3_ba(c0_ddr3_ba),
.c0_ddr3_ras_n(c0_ddr3_ras_n),
.c0_ddr3_cas_n(c0_ddr3_cas_n),
.c0_ddr3_we_n(c0_ddr3_we_n),
.c0_ddr3_reset_n(c0_ddr3_reset_n),
.c0_ddr3_ck_p(c0_ddr3_ck_p),
.c0_ddr3_ck_n(c0_ddr3_ck_n),
.c0_ddr3_cke(c0_ddr3_cke),
.c0_ddr3_cs_n(c0_ddr3_cs_n),
.c0_ddr3_dm(c0_ddr3_dm),
.c0_ddr3_odt(c0_ddr3_odt),
.c0_ui_clk(),
.c0_init_calib_complete(c0_init_calib_complete),

//SODIMM 1
// Inouts
.c1_ddr3_dq(c1_ddr3_dq),
.c1_ddr3_dqs_n(c1_ddr3_dqs_n),
.c1_ddr3_dqs_p(c1_ddr3_dqs_p),

// Outputs
.c1_ddr3_addr(c1_ddr3_addr),
.c1_ddr3_ba(c1_ddr3_ba),
.c1_ddr3_ras_n(c1_ddr3_ras_n),
.c1_ddr3_cas_n(c1_ddr3_cas_n),
.c1_ddr3_we_n(c1_ddr3_we_n),
.c1_ddr3_reset_n(c1_ddr3_reset_n),
.c1_ddr3_ck_p(c1_ddr3_ck_p),
.c1_ddr3_ck_n(c1_ddr3_ck_n),
.c1_ddr3_cke(c1_ddr3_cke),
.c1_ddr3_cs_n(c1_ddr3_cs_n),
.c1_ddr3_dm(c1_ddr3_dm),
.c1_ddr3_odt(c1_ddr3_odt),
.c1_ui_clk(),
.c1_init_calib_complete(c1_init_calib_complete),

//toe stream interface signals
.toeTX_s_axis_read_cmd_tvalid(toeTX_s_axis_read_cmd_tvalid),
.toeTX_s_axis_read_cmd_tready(toeTX_s_axis_read_cmd_tready),
.toeTX_s_axis_read_cmd_tdata(toeTX_s_axis_read_cmd_tdata),
//read status
.toeTX_m_axis_read_sts_tvalid(toeTX_m_axis_read_sts_tvalid),
.toeTX_m_axis_read_sts_tready(toeTX_m_axis_read_sts_tready),
.toeTX_m_axis_read_sts_tdata(toeTX_m_axis_read_sts_tdata),
//read stream
.toeTX_m_axis_read_tdata(toeTX_m_axis_read_tdata),
.toeTX_m_axis_read_tkeep(toeTX_m_axis_read_tkeep),
.toeTX_m_axis_read_tlast(toeTX_m_axis_read_tlast),
.toeTX_m_axis_read_tvalid(toeTX_m_axis_read_tvalid),
.toeTX_m_axis_read_tready(toeTX_m_axis_read_tready),

//write commands
.toeTX_s_axis_write_cmd_tvalid(toeTX_s_axis_write_cmd_tvalid),
.toeTX_s_axis_write_cmd_tready(toeTX_s_axis_write_cmd_tready),
.toeTX_s_axis_write_cmd_tdata(toeTX_s_axis_write_cmd_tdata),
//write status
.toeTX_m_axis_write_sts_tvalid(toeTX_m_axis_write_sts_tvalid),
.toeTX_m_axis_write_sts_tready(toeTX_m_axis_write_sts_tready),
.toeTX_m_axis_write_sts_tdata(toeTX_m_axis_write_sts_tdata),
//write stream
.toeTX_s_axis_write_tdata(toeTX_s_axis_write_tdata),
.toeTX_s_axis_write_tkeep(toeTX_s_axis_write_tkeep),
.toeTX_s_axis_write_tlast(toeTX_s_axis_write_tlast),
.toeTX_s_axis_write_tvalid(toeTX_s_axis_write_tvalid),
.toeTX_s_axis_write_tready(toeTX_s_axis_write_tready),

	// HashTable DRAM Connection

  .ht_dramRdData_data(ht_dramRdData_data),
  .ht_dramRdData_empty(ht_dramRdData_empty),
  .ht_dramRdData_almost_empty(ht_dramRdData_almost_empty),
  .ht_dramRdData_read(ht_dramRdData_read),
  
  .ht_cmd_dramRdData_data(ht_cmd_dramRdData_data),
  .ht_cmd_dramRdData_valid(ht_cmd_dramRdData_valid),
  .ht_cmd_dramRdData_stall(ht_cmd_dramRdData_stall),

  .ht_dramWrData_data(ht_dramWrData_data),
  .ht_dramWrData_valid(ht_dramWrData_valid),
  .ht_dramWrData_stall(ht_dramWrData_stall),
  
  .ht_cmd_dramWrData_data(ht_cmd_dramWrData_data),
  .ht_cmd_dramWrData_valid(ht_cmd_dramWrData_valid),
  .ht_cmd_dramWrData_stall(ht_cmd_dramWrData_stall),
  
  .upd_dramRdData_data(upd_dramRdData_data),
  .upd_dramRdData_empty(upd_dramRdData_empty),
  .upd_dramRdData_almost_empty(upd_dramRdData_almost_empty),
  .upd_dramRdData_read(upd_dramRdData_read),
  
  .upd_cmd_dramRdData_data(upd_cmd_dramRdData_data),
  .upd_cmd_dramRdData_valid(upd_cmd_dramRdData_valid),
  .upd_cmd_dramRdData_stall(upd_cmd_dramRdData_stall),
  
  .upd_dramWrData_data(upd_dramWrData_data),
  .upd_dramWrData_valid(upd_dramWrData_valid),
  .upd_dramWrData_stall(upd_dramWrData_stall),

  .upd_cmd_dramWrData_data(upd_cmd_dramWrData_data),
  .upd_cmd_dramWrData_valid(upd_cmd_dramWrData_valid),
  .upd_cmd_dramWrData_stall(upd_cmd_dramWrData_stall), 
  
   .ptr_rdcmd_data(ptr_rdcmd_data),
   .ptr_rdcmd_valid(ptr_rdcmd_valid),
   .ptr_rdcmd_ready(ptr_rdcmd_ready),
 
   .ptr_rd_data(ptr_rd_data),
   .ptr_rd_valid(ptr_rd_valid),
   .ptr_rd_ready(ptr_rd_ready),  
 
   .ptr_wr_data(ptr_wr_data),
   .ptr_wr_valid(ptr_wr_valid),
   .ptr_wr_ready(ptr_wr_ready),
 
   .ptr_wrcmd_data(ptr_wrcmd_data),
   .ptr_wrcmd_valid(ptr_wrcmd_valid),
   .ptr_wrcmd_ready(ptr_wrcmd_ready),
 
 
   .bmap_rdcmd_data(bmap_rdcmd_data),
   .bmap_rdcmd_valid(bmap_rdcmd_valid),
   .bmap_rdcmd_ready(bmap_rdcmd_ready),
 
   .bmap_rd_data(bmap_rd_data),
   .bmap_rd_valid(bmap_rd_valid),
   .bmap_rd_ready(bmap_rd_ready),  
 
   .bmap_wr_data(bmap_wr_data),
   .bmap_wr_valid(bmap_wr_valid),
   .bmap_wr_ready(bmap_wr_ready),
 
   .bmap_wrcmd_data(bmap_wrcmd_data),
   .bmap_wrcmd_valid(bmap_wrcmd_valid),
   .bmap_wrcmd_ready(bmap_wrcmd_ready)





);

//////////////////////////
// chipscope debug
//////////////////////////
/*  
wire [35:0] control0, control1;
wire [255:0] data;
reg[255:0] debug_r;
reg[255:0] debug_r2;


reg ready1;
reg ready2;
reg ready3;
reg ready4;
reg ready5;
reg ready6;
reg ready7;
reg ready8;
reg ready9;
reg ready10;
reg ready11;
reg ready12;

reg[15:0] mac_rx_count;
reg[15:0] mac_tx_count;
reg[15:0] open_count;
reg[15:0] success_count;
reg[15:0] fail_count;
reg[15:0] zeroid_count;

always @(posedge axi_clk) begin
    if (aresetn == 0) begin
        mac_rx_count <= 0;
        mac_tx_count <= 0;
        open_count <= 0;
        success_count <= 0;
        fail_count <= 0;
        zeroid_count <= 0;
    end
    else begin
    end
end



always @(posedge axi_clk) begin
  debug_r[0] <= axis_mc_tx_data_TVALID;
  debug_r[1] <= axis_mc_tx_data_TREADY;
  debug_r[2] <= axis_mc_rx_data_TVALID;
  debug_r[3] <= axis_mc_rx_data_TREADY;
  
  debug_r[4] <= axis_mc_udp_rx_data_TVALID;
  debug_r[5] <= axis_mc_udp_rx_data_TREADY;
  
  debug_r[6] <= axis_mc_udp_tx_data_TVALID;
  debug_r[7] <= axis_mc_udp_tx_data_TREADY;
  //TCP
  debug_r[8] <= axis_mc_tcp_rx_data_TVALID;
  debug_r[9] <= axis_mc_tcp_rx_data_TREADY;
  
  debug_r[10] <= axis_mc_tcp_tx_data_TVALID;
  debug_r[11] <= axis_mc_tcp_tx_data_TREADY;
  
  debug_r[12] <= AXI_M2_Stream_TVALID;
  debug_r[13] <= AXI_M2_Stream_TREADY;
  debug_r[29:14] <= AXI_M2_Stream_TDATA;
  debug_r[30] <= AXI_M2_Stream_TKEEP;
  debug_r[31] <= AXI_M2_Stream_TLAST;

  debug_r[32] <= AXI_S2_Stream_TVALID;
  debug_r[33] <= AXI_S2_Stream_TREADY;
  debug_r[49:34] <= AXI_S2_Stream_TDATA;
  debug_r[50] <= AXI_S2_Stream_TUSER;
  debug_r[51] <= AXI_S2_Stream_TLAST;  
  
  debug_r[52] <= AXI_M3_Stream_TVALID;
  debug_r[53] <= AXI_M3_Stream_TREADY;
  debug_r[59:54] <= AXI_M3_Stream_TDATA;
  debug_r[60] <= AXI_M3_Stream_TKEEP;
  debug_r[61] <= AXI_M3_Stream_TLAST;

  debug_r[62] <= AXI_S3_Stream_TVALID;
  debug_r[63] <= AXI_S3_Stream_TREADY;
  debug_r[79:64] <= AXI_S3_Stream_TDATA;
  debug_r[80] <= AXI_S3_Stream_TUSER;
  debug_r[81] <= AXI_S3_Stream_TLAST;  
  
  debug_r[83] <= AXI_M4_Stream_TVALID;
  debug_r[84] <= AXI_M4_Stream_TREADY;
  //debug_r[85] <= AXI_M_Stream_TDATA;
  debug_r[92:85] <= AXI_M4_Stream_TKEEP;
  debug_r[93] <= AXI_M4_Stream_TLAST;
  
  debug_r[94] <= AXI_S4_Stream_TVALID;
  debug_r[95] <= AXI_S4_Stream_TREADY;
  //debug_r[96] <= AXI_S_Stream_TDATA;
  debug_r[104:97] <= AXI_S4_Stream_TKEEP;
  debug_r[105] <= AXI_S4_Stream_TLAST;
  
  
  debug_r2 <= debug_r;
end

assign data = debug_r2;

icon icon_inst(
    .CONTROL0(control0),
    .CONTROL1(control1)
 );
 
 vio vio_inst(
     .CONTROL(control1),
     .CLK(axi_clk),
     .SYNC_OUT(vio_cmd)
 );
 
ila_256 ila_256_inst(
     .CONTROL(control0),
     .CLK(axi_clk),
     .TRIG0(data)
 );
/*  */

endmodule
