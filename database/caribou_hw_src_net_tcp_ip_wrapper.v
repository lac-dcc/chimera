`timescale 1ns / 1ps
//----------------------------------------------------------
//Copyright (c) 2016, Xilinx, Inc.
//All rights reserved.
//
//Redistribution and use in source and binary forms, with or without modification, 
//are permitted provided that the following conditions are met:
//
//1. Redistributions of source code must retain the above copyright notice, 
//this list of conditions and the following disclaimer.
//
//2. Redistributions in binary form must reproduce the above copyright notice, 
//this list of conditions and the following disclaimer in the documentation 
//and/or other materials provided with the distribution.
//
//3. Neither the name of the copyright holder nor the names of its contributors 
//may be used to endorse or promote products derived from this software 
//without specific prior written permission.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
//ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
//THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
//IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
//INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
//PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
//HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
//OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
//EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//----------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2013 10:48:44
// Design Name: 
// Module Name: tcp_ip_wrapper
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


module tcp_ip_wrapper #(
    parameter MAC_ADDRESS = 48'hE59D02350A00, // LSB first, 00:0A:35:02:9D:E5
    parameter IP_ADDRESS = 32'h00000000,
    parameter IP_SUBNET_MASK = 32'h00FFFFFF,
    parameter IP_DEFAULT_GATEWAY = 32'h00000000,
    parameter DHCP_EN   = 0
)(
    input       aclk,
    //input       reset,
    input       aresetn,
    // network interface streams
    output      AXI_M_Stream_TVALID,
    input       AXI_M_Stream_TREADY,
    output[63:0] AXI_M_Stream_TDATA,
    output[7:0] AXI_M_Stream_TKEEP,
    output      AXI_M_Stream_TLAST,

    input       AXI_S_Stream_TVALID,
    output      AXI_S_Stream_TREADY,
    input[63:0] AXI_S_Stream_TDATA,
    input[7:0]  AXI_S_Stream_TKEEP,
    input       AXI_S_Stream_TLAST,
    
    // memory rx cmd streams
    output          m_axis_rxread_cmd_TVALID,
    input           m_axis_rxread_cmd_TREADY,
    output[71:0]    m_axis_rxread_cmd_TDATA,
    output          m_axis_rxwrite_cmd_TVALID,
    input           m_axis_rxwrite_cmd_TREADY,
    output[71:0]    m_axis_rxwrite_cmd_TDATA,
    // memory rx sts streams
    input           s_axis_rxread_sts_TVALID,
    output          s_axis_rxread_sts_TREADY,
    input[7:0]      s_axis_rxread_sts_TDATA,
    input           s_axis_rxwrite_sts_TVALID,
    output          s_axis_rxwrite_sts_TREADY,
    input[31:0]     s_axis_rxwrite_sts_TDATA,
    // memory rx data streams
    input           s_axis_rxread_data_TVALID,
    output          s_axis_rxread_data_TREADY,
    input[63:0]     s_axis_rxread_data_TDATA,
    input[7:0]      s_axis_rxread_data_TKEEP,
    input           s_axis_rxread_data_TLAST,
    
    output          m_axis_rxwrite_data_TVALID,
    input           m_axis_rxwrite_data_TREADY,
    output[63:0]    m_axis_rxwrite_data_TDATA,
    output[7:0]     m_axis_rxwrite_data_TKEEP,
    output          m_axis_rxwrite_data_TLAST,
    
    // memory tx cmd streams
    output          m_axis_txread_cmd_TVALID,
    input           m_axis_txread_cmd_TREADY,
    output[71:0]    m_axis_txread_cmd_TDATA,
    output          m_axis_txwrite_cmd_TVALID,
    input           m_axis_txwrite_cmd_TREADY,
    output[71:0]    m_axis_txwrite_cmd_TDATA,
    // memory tx sts streams
    input           s_axis_txread_sts_TVALID,
    output          s_axis_txread_sts_TREADY,
    input[7:0]      s_axis_txread_sts_TDATA,
    input           s_axis_txwrite_sts_TVALID,
    output          s_axis_txwrite_sts_TREADY,
    input[63:0]     s_axis_txwrite_sts_TDATA,
    // memory tx data streams
    input           s_axis_txread_data_TVALID,
    output          s_axis_txread_data_TREADY,
    input[63:0]     s_axis_txread_data_TDATA,
    input[7:0]      s_axis_txread_data_TKEEP,
    input           s_axis_txread_data_TLAST,
    
    output          m_axis_txwrite_data_TVALID,
    input           m_axis_txwrite_data_TREADY,
    output[63:0]    m_axis_txwrite_data_TDATA,
    output[7:0]     m_axis_txwrite_data_TKEEP,
    output          m_axis_txwrite_data_TLAST,
    
    //application interface streams
    output          m_axis_listen_port_status_TVALID,
    input           m_axis_listen_port_status_TREADY,
    output[7:0]     m_axis_listen_port_status_TDATA,
    output          m_axis_notifications_TVALID,
    input           m_axis_notifications_TREADY,
    output[87:0]    m_axis_notifications_TDATA,
    output          m_axis_open_status_TVALID,
    input           m_axis_open_status_TREADY,
    output[23:0]    m_axis_open_status_TDATA,
    output          m_axis_rx_data_TVALID,
    input           m_axis_rx_data_TREADY,
    output[63:0]    m_axis_rx_data_TDATA,
    output[7:0]     m_axis_rx_data_TKEEP,
    output          m_axis_rx_data_TLAST,
    output          m_axis_rx_metadata_TVALID,
    input           m_axis_rx_metadata_TREADY,
    output[15:0]    m_axis_rx_metadata_TDATA,
    output          m_axis_tx_status_TVALID,
    input           m_axis_tx_status_TREADY,
    output[63:0]    m_axis_tx_status_TDATA,
    input           s_axis_listen_port_TVALID,
    output          s_axis_listen_port_TREADY,
    input[15:0]     s_axis_listen_port_TDATA,
    //input           s_axis_close_port_TVALID,
    //output          s_axis_close_port_TREADY,
    //input[15:0]     s_axis_close_port_TDATA,
    input           s_axis_close_connection_TVALID,
    output          s_axis_close_connection_TREADY,
    input[15:0]     s_axis_close_connection_TDATA,
    input           s_axis_open_connection_TVALID,
    output          s_axis_open_connection_TREADY,
    input[47:0]     s_axis_open_connection_TDATA,
    input           s_axis_read_package_TVALID,
    output          s_axis_read_package_TREADY,
    input[31:0]     s_axis_read_package_TDATA,
    input           s_axis_tx_data_TVALID,
    output          s_axis_tx_data_TREADY,
    input[63:0]     s_axis_tx_data_TDATA,
    input[7:0]      s_axis_tx_data_TKEEP,
    input           s_axis_tx_data_TLAST,
    input           s_axis_tx_metadata_TVALID,
    output          s_axis_tx_metadata_TREADY,
    input[31:0]     s_axis_tx_metadata_TDATA, //change to 15?
    
    //debug
    output debug_axi_intercon_to_mie_tready,
    output debug_axi_intercon_to_mie_tvalid,
    output debug_axi_slice_toe_mie_tvalid,
    output debug_axi_slice_toe_mie_tready,
    
    output [161:0] debug_out,
    
    output[31:0]    ip_address_out,
    output[15:0]    regSessionCount_V,
    output          regSessionCount_V_ap_vld,

    input[3:0]      board_number,
    input[1:0]      subnet_number


    );

// cmd streams
wire axis_rxread_cmd_TVALID;
wire axis_rxread_cmd_TREADY;
wire[71:0] axis_rxread_cmd_TDATA;
wire axis_rxwrite_cmd_TVALID;
wire axis_rxwrite_cmd_TREADY;
wire[71:0] axis_rxwrite_cmd_TDATA;
wire axis_txread_cmd_TVALID;
wire axis_txread_cmd_TREADY;
wire[71:0] axis_txread_cmd_TDATA;
wire axis_txwrite_cmd_TVALID;
wire axis_txwrite_cmd_TREADY;
wire[71:0] axis_txwrite_cmd_TDATA;

// sts streams
wire axis_rxread_sts_TVALID;
wire axis_rxread_sts_TREADY;
wire[7:0] axis_rxread_sts_TDATA;
wire axis_rxwrite_sts_TVALID;
wire axis_rxwrite_sts_TREADY;
wire[7:0] axis_rxwrite_sts_TDATA;
wire axis_txread_sts_TVALID;
wire axis_txread_sts_TREADY;
wire[7:0] axis_txread_sts_TDATA;
wire axis_txwrite_sts_TVALID;
wire axis_txwrite_sts_TREADY;
wire[63:0] axis_txwrite_sts_TDATA;

//data streams
wire axis_rxbuffer2app_TVALID;
wire axis_rxbuffer2app_TREADY;
wire[63:0] axis_rxbuffer2app_TDATA;
wire[7:0] axis_rxbuffer2app_TKEEP;
wire axis_rxbuffer2app_TLAST;

wire axis_tcp2rxbuffer_TVALID;
wire axis_tcp2rxbuffer_TREADY;
wire[63:0] axis_tcp2rxbuffer_TDATA;
wire[7:0] axis_tcp2rxbuffer_TKEEP;
wire axis_tcp2rxbuffer_TLAST;

wire axis_txbuffer2tcp_TVALID;
wire axis_txbuffer2tcp_TREADY;
wire[63:0] axis_txbuffer2tcp_TDATA;
wire[7:0] axis_txbuffer2tcp_TKEEP;
wire axis_txbuffer2tcp_TLAST;

wire axis_app2txbuffer_TVALID;
wire axis_app2txbuffer_TREADY;
wire[63:0] axis_app2txbuffer_TDATA;
wire[7:0] axis_app2txbuffer_TKEEP;
wire axis_app2txbuffer_TLAST;

wire        upd_req_TVALID;
wire        upd_req_TREADY;
wire[111:0] upd_req_TDATA; //(1 + 1 + 14 + 96) - 1 = 111
wire        upd_rsp_TVALID;
wire        upd_rsp_TREADY;
wire[15:0]  upd_rsp_TDATA;

wire        ins_req_TVALID;
wire        ins_req_TREADY;
wire[111:0] ins_req_TDATA;
wire        del_req_TVALID;
wire        del_req_TREADY;
wire[111:0] del_req_TDATA;

wire        lup_req_TVALID;
wire        lup_req_TREADY;
wire[97:0]  lup_req_TDATA; //should be 96, also wrong in SmartCam
wire        lup_rsp_TVALID;
wire        lup_rsp_TREADY;
wire[15:0]  lup_rsp_TDATA;

//wire[14:0] free_list_data_count;

// IP Handler Outputs
wire            axi_iph_to_arp_slice_tvalid;
wire            axi_iph_to_arp_slice_tready;
wire[63:0]      axi_iph_to_arp_slice_tdata;
wire[7:0]       axi_iph_to_arp_slice_tkeep;
wire            axi_iph_to_arp_slice_tlast;
wire            axi_iph_to_icmp_slice_tvalid;
wire            axi_iph_to_icmp_slice_tready;
wire[63:0]      axi_iph_to_icmp_slice_tdata;
wire[7:0]       axi_iph_to_icmp_slice_tkeep;
wire            axi_iph_to_icmp_slice_tlast;
wire            axi_iph_to_udp_slice_tvalid;
wire            axi_iph_to_udp_slice_tready;
wire[63:0]      axi_iph_to_udp_slice_tdata;
wire[7:0]       axi_iph_to_udp_slice_tkeep;
wire            axi_iph_to_udp_slice_tlast;
wire            axi_iph_to_toe_slice_tvalid;
wire            axi_iph_to_toe_slice_tready;
wire[63:0]      axi_iph_to_toe_slice_tdata;
wire[7:0]       axi_iph_to_toe_slice_tkeep;
wire            axi_iph_to_toe_slice_tlast;

//Slice connections on RX path
wire            axi_arp_slice_to_arp_tvalid;
wire            axi_arp_slice_to_arp_tready;
wire[63:0]      axi_arp_slice_to_arp_tdata;
wire[7:0]       axi_arp_slice_to_arp_tkeep;
wire            axi_arp_slice_to_arp_tlast;
wire            axi_icmp_slice_to_icmp_tvalid;
wire            axi_icmp_slice_to_icmp_tready;
wire[63:0]      axi_icmp_slice_to_icmp_tdata;
wire[7:0]       axi_icmp_slice_to_icmp_tkeep;
wire            axi_icmp_slice_to_icmp_tlast;
wire            axi_udp_slice_to_udp_tvalid;
wire            axi_udp_slice_to_udp_tready;
wire[63:0]      axi_udp_slice_to_udp_tdata;
wire[7:0]       axi_udp_slice_to_udp_tkeep;
wire            axi_udp_slice_to_udp_tlast;
wire            axi_toe_slice_to_toe_tvalid;
wire            axi_toe_slice_to_toe_tready;
wire[63:0]      axi_toe_slice_to_toe_tdata;
wire[7:0]       axi_toe_slice_to_toe_tkeep;
wire            axi_toe_slice_to_toe_tlast;

// MAC-IP Encode Inputs
wire            axi_intercon_to_mie_tvalid;
wire            axi_intercon_to_mie_tready;
wire[63:0]      axi_intercon_to_mie_tdata;
wire[7:0]       axi_intercon_to_mie_tkeep;
wire            axi_intercon_to_mie_tlast;
wire            axi_mie_to_intercon_tvalid;
wire            axi_mie_to_intercon_tready;
wire[63:0]      axi_mie_to_intercon_tdata;
wire[7:0]       axi_mie_to_intercon_tkeep;
wire            axi_mie_to_intercon_tlast;
/*wire            axi_arp_slice_to_mie_tvalid;
wire            axi_arp_slice_to_mie_tready;
wire[63:0]      axi_arp_slice_to_mie_tdata;
wire[7:0]       axi_arp_slice_to_mie_tkeep;
wire            axi_arp_slice_to_mie_tlast;
wire            axi_icmp_slice_to_mie_tvalid;
wire            axi_icmp_slice_to_mie_tready;
wire[63:0]      axi_icmp_slice_to_mie_tdata;
wire[7:0]       axi_icmp_slice_to_mie_tkeep;
wire            axi_icmp_slice_to_mie_tlast;
wire            axi_toe_slice_to_mie_tvalid;
wire            axi_toe_slice_to_mie_tready;
wire[63:0]      axi_toe_slice_to_mie_tdata;
wire[7:0]       axi_toe_slice_to_mie_tkeep;
wire            axi_toe_slice_to_mie_tlast;*/
//Slice connections on RX path
wire            axi_arp_to_arp_slice_tvalid;
wire            axi_arp_to_arp_slice_tready;
wire[63:0]      axi_arp_to_arp_slice_tdata;
wire[7:0]       axi_arp_to_arp_slice_tkeep;
wire            axi_arp_to_arp_slice_tlast;
wire            axi_icmp_to_icmp_slice_tvalid;
wire            axi_icmp_to_icmp_slice_tready;
wire[63:0]      axi_icmp_to_icmp_slice_tdata;
wire[7:0]       axi_icmp_to_icmp_slice_tkeep;
wire            axi_icmp_to_icmp_slice_tlast;
wire            axi_toe_to_toe_slice_tvalid;
wire            axi_toe_to_toe_slice_tready;
wire[63:0]      axi_toe_to_toe_slice_tdata;
wire[7:0]       axi_toe_to_toe_slice_tkeep;
wire            axi_toe_to_toe_slice_tlast;


wire        axi_udp_to_merge_tvalid;
wire        axi_udp_to_merge_tready;
wire[63:0]  axi_udp_to_merge_tdata;
wire[7:0]   axi_udp_to_merge_tkeep;
wire        axi_udp_to_merge_tlast;

wire cam_ready;
wire sc_led0;
wire sc_led1;
wire[255:0] sc_debug;

wire [157:0] debug_out_ips;

assign debug_axi_intercon_to_mie_tready = axi_intercon_to_mie_tready;
assign debug_axi_intercon_to_mie_tvalid = axi_intercon_to_mie_tvalid;

assign debug_axi_slice_toe_mie_tvalid = axi_mie_to_intercon_tvalid;
assign debug_axi_slice_toe_mie_tready = axi_mie_to_intercon_tready;

// RX assignments
assign m_axis_rxread_cmd_TVALID       = axis_rxread_cmd_TVALID;
assign axis_rxread_cmd_TREADY       = m_axis_rxread_cmd_TREADY;
assign m_axis_rxread_cmd_TDATA        = axis_rxread_cmd_TDATA;
assign m_axis_rxwrite_cmd_TVALID      = axis_rxwrite_cmd_TVALID;
assign axis_rxwrite_cmd_TREADY      = m_axis_rxwrite_cmd_TREADY;
assign m_axis_rxwrite_cmd_TDATA       = axis_rxwrite_cmd_TDATA;

assign axis_rxread_sts_TVALID       = s_axis_rxread_sts_TVALID;
assign s_axis_rxread_sts_TREADY       = axis_rxread_sts_TREADY;
assign axis_rxread_sts_TDATA        = s_axis_rxread_sts_TDATA;
assign axis_rxwrite_sts_TVALID      = s_axis_rxwrite_sts_TVALID;
assign s_axis_rxwrite_sts_TREADY      = axis_rxwrite_sts_TREADY;
assign axis_rxwrite_sts_TDATA       = s_axis_rxwrite_sts_TDATA;
// read
/*assign     axis_rxbuffer2app_TVALID = s_axis_rxread_data_TVALID;
assign     s_axis_rxread_data_TREADY = axis_rxbuffer2app_TREADY;
assign     axis_rxbuffer2app_TDATA = s_axis_rxread_data_TDATA;
assign     axis_rxbuffer2app_TKEEP = s_axis_rxread_data_TKEEP;
assign     axis_rxbuffer2app_TLAST = s_axis_rxread_data_TLAST;
// write
assign     m_axis_rxwrite_data_TVALID = axis_tcp2rxbuffer_TVALID;
assign     axis_tcp2rxbuffer_TREADY = m_axis_rxwrite_data_TREADY;
assign     m_axis_rxwrite_data_TDATA = axis_tcp2rxbuffer_TDATA;
assign     m_axis_rxwrite_data_TKEEP = axis_tcp2rxbuffer_TKEEP;
assign     m_axis_rxwrite_data_TLAST = axis_tcp2rxbuffer_TLAST;*/



// TX assignments
assign m_axis_txread_cmd_TVALID       = axis_txread_cmd_TVALID;
assign axis_txread_cmd_TREADY         = m_axis_txread_cmd_TREADY;
assign m_axis_txread_cmd_TDATA        = axis_txread_cmd_TDATA;
assign m_axis_txwrite_cmd_TVALID      = axis_txwrite_cmd_TVALID;
assign axis_txwrite_cmd_TREADY        = m_axis_txwrite_cmd_TREADY;
assign m_axis_txwrite_cmd_TDATA       = axis_txwrite_cmd_TDATA;

assign axis_txread_sts_TVALID         = s_axis_txread_sts_TVALID;
assign s_axis_txread_sts_TREADY       = axis_txread_sts_TREADY;
assign axis_txread_sts_TDATA          = s_axis_txread_sts_TDATA;
assign axis_txwrite_sts_TVALID        = s_axis_txwrite_sts_TVALID;
assign s_axis_txwrite_sts_TREADY      = axis_txwrite_sts_TREADY;
assign axis_txwrite_sts_TDATA         = s_axis_txwrite_sts_TDATA;
// read
assign     axis_txbuffer2tcp_TVALID = s_axis_txread_data_TVALID;
assign     s_axis_txread_data_TREADY = axis_txbuffer2tcp_TREADY;
assign     axis_txbuffer2tcp_TDATA = s_axis_txread_data_TDATA;
assign     axis_txbuffer2tcp_TKEEP = s_axis_txread_data_TKEEP;
assign     axis_txbuffer2tcp_TLAST = s_axis_txread_data_TLAST;
// write
assign     m_axis_txwrite_data_TVALID = axis_app2txbuffer_TVALID;
assign     axis_app2txbuffer_TREADY = m_axis_txwrite_data_TREADY;
assign     m_axis_txwrite_data_TDATA = axis_app2txbuffer_TDATA;
assign     m_axis_txwrite_data_TKEEP = axis_app2txbuffer_TKEEP;
assign     m_axis_txwrite_data_TLAST = axis_app2txbuffer_TLAST;

// because read status is not used
assign axis_rxread_sts_TREADY = 1'b1;
assign axis_txread_sts_TREADY = 1'b1;


// Register and distribute ip address
wire[31:0]  dhcp_ip_address;
wire        dhcp_ip_address_en;
reg[47:0]   mie_mac_address;
reg[47:0]   arp_mac_address;
reg[31:0]   iph_ip_address;
reg[31:0]   arp_ip_address;
reg[31:0]   toe_ip_address;
reg[31:0]   ip_subnet_mask;
reg[31:0]   ip_default_gateway;

//assign dhcp_ip_address_en = 1'b1;
//assign dhcp_ip_address = 32'hD1D4010A;

always @(posedge aclk)
begin
    if (aresetn == 0) begin
        mie_mac_address <= 48'h000000000000;
        arp_mac_address <= 48'h000000000000;
        iph_ip_address <= 32'h00000000;
        arp_ip_address <= 32'h00000000;
        toe_ip_address <= 32'h00000000;
        ip_subnet_mask <= 32'h00000000;
        ip_default_gateway <= 32'h00000000;
    end
    else begin
        mie_mac_address <= {MAC_ADDRESS[47:44], (MAC_ADDRESS[43:40]+board_number), MAC_ADDRESS[39:0]};
        arp_mac_address <= {MAC_ADDRESS[47:44], (MAC_ADDRESS[43:40]+board_number), MAC_ADDRESS[39:0]};
        if (DHCP_EN == 1) begin
            if (dhcp_ip_address_en == 1'b1) begin
                iph_ip_address <= dhcp_ip_address;
                arp_ip_address <= dhcp_ip_address;
                toe_ip_address <= dhcp_ip_address;
            end
        end
        else begin
            iph_ip_address <= {IP_ADDRESS[31:28], IP_ADDRESS[27:24]+board_number, IP_ADDRESS[23:4], IP_ADDRESS[3:0]+subnet_number};
            arp_ip_address <= {IP_ADDRESS[31:28], IP_ADDRESS[27:24]+board_number, IP_ADDRESS[23:4], IP_ADDRESS[3:0]+subnet_number};
            toe_ip_address <= {IP_ADDRESS[31:28], IP_ADDRESS[27:24]+board_number, IP_ADDRESS[23:4], IP_ADDRESS[3:0]+subnet_number};
            ip_subnet_mask <= IP_SUBNET_MASK;
            ip_default_gateway <= {IP_DEFAULT_GATEWAY[31:4], IP_DEFAULT_GATEWAY[3:0]+subnet_number};
        end
    end
end
// ip address output
assign ip_address_out = iph_ip_address;


wire [157:0] debug_out_tcp;
wire [7:0] aux;


// for shortcut_toe
assign axis_rxread_cmd_TVALID = 1'b0;
assign axis_rxwrite_cmd_TVALID = 1'b0;
assign axis_rxwrite_sts_TREADY = 1'b1;
/*assign axis_rxbuffer2app_TREADY = 1'b1;
assign axis_tcp2rxbuffer_TVALID = 1'b0;*/

wire[31:0] rx_buffer_data_count;

shortcut_toe_NODELAY_ip toe_inst (
// Data output
.m_axis_tcp_data_TVALID(axi_toe_to_toe_slice_tvalid), // output AXI_M_Stream_TVALID
.m_axis_tcp_data_TREADY(axi_toe_to_toe_slice_tready), // input AXI_M_Stream_TREADY
.m_axis_tcp_data_TDATA(axi_toe_to_toe_slice_tdata), // output [63 : 0] AXI_M_Stream_TDATA
.m_axis_tcp_data_TKEEP(axi_toe_to_toe_slice_tkeep), // output [7 : 0] AXI_M_Stream_TSTRB
.m_axis_tcp_data_TLAST(axi_toe_to_toe_slice_tlast), // output [0 : 0] AXI_M_Stream_TLAST
// Data input
.s_axis_tcp_data_TVALID(axi_toe_slice_to_toe_tvalid), // input AXI_S_Stream_TVALID
.s_axis_tcp_data_TREADY(axi_toe_slice_to_toe_tready), // output AXI_S_Stream_TREADY
.s_axis_tcp_data_TDATA(axi_toe_slice_to_toe_tdata), // input [63 : 0] AXI_S_Stream_TDATA
.s_axis_tcp_data_TKEEP(axi_toe_slice_to_toe_tkeep), // input [7 : 0] AXI_S_Stream_TKEEP
.s_axis_tcp_data_TLAST(axi_toe_slice_to_toe_tlast), // input [0 : 0] AXI_S_Stream_TLAST
// rx read commands
/*.m_axis_rxread_cmd_TVALID(axis_rxread_cmd_TVALID),
.m_axis_rxread_cmd_TREADY(axis_rxread_cmd_TREADY),
.m_axis_rxread_cmd_TDATA(axis_rxread_cmd_TDATA),
// rx write commands
.m_axis_rxwrite_cmd_TVALID(axis_rxwrite_cmd_TVALID),
.m_axis_rxwrite_cmd_TREADY(axis_rxwrite_cmd_TREADY),
.m_axis_rxwrite_cmd_TDATA(axis_rxwrite_cmd_TDATA),
// rx write status
.s_axis_rxwrite_sts_TVALID(axis_rxwrite_sts_TVALID),
.s_axis_rxwrite_sts_TREADY(axis_rxwrite_sts_TREADY),
.s_axis_rxwrite_sts_TDATA(axis_rxwrite_sts_TDATA),*/
// rx buffer read path
.s_axis_rxread_data_TVALID(axis_rxbuffer2app_TVALID),
.s_axis_rxread_data_TREADY(axis_rxbuffer2app_TREADY),
.s_axis_rxread_data_TDATA(axis_rxbuffer2app_TDATA),
.s_axis_rxread_data_TKEEP(axis_rxbuffer2app_TKEEP),
.s_axis_rxread_data_TLAST(axis_rxbuffer2app_TLAST),
// rx buffer write path
.m_axis_rxwrite_data_TVALID(axis_tcp2rxbuffer_TVALID),
.m_axis_rxwrite_data_TREADY(axis_tcp2rxbuffer_TREADY),
.m_axis_rxwrite_data_TDATA(axis_tcp2rxbuffer_TDATA),
.m_axis_rxwrite_data_TKEEP(axis_tcp2rxbuffer_TKEEP),
.m_axis_rxwrite_data_TLAST(axis_tcp2rxbuffer_TLAST),
// tx read commands
.m_axis_txread_cmd_TVALID(axis_txread_cmd_TVALID),
.m_axis_txread_cmd_TREADY(axis_txread_cmd_TREADY),
.m_axis_txread_cmd_TDATA(axis_txread_cmd_TDATA),
//tx write commands
.m_axis_txwrite_cmd_TVALID(axis_txwrite_cmd_TVALID),
.m_axis_txwrite_cmd_TREADY(axis_txwrite_cmd_TREADY),
.m_axis_txwrite_cmd_TDATA(axis_txwrite_cmd_TDATA),
// tx write status
.s_axis_txwrite_sts_TVALID(axis_txwrite_sts_TVALID),
.s_axis_txwrite_sts_TREADY(axis_txwrite_sts_TREADY),
.s_axis_txwrite_sts_TDATA(axis_txwrite_sts_TDATA),
// tx read path
.s_axis_txread_data_TVALID(axis_txbuffer2tcp_TVALID),
.s_axis_txread_data_TREADY(axis_txbuffer2tcp_TREADY),
.s_axis_txread_data_TDATA(axis_txbuffer2tcp_TDATA),
.s_axis_txread_data_TKEEP(axis_txbuffer2tcp_TKEEP),
.s_axis_txread_data_TLAST(axis_txbuffer2tcp_TLAST),
// tx write path
.m_axis_txwrite_data_TVALID(axis_app2txbuffer_TVALID),
.m_axis_txwrite_data_TREADY(axis_app2txbuffer_TREADY),
.m_axis_txwrite_data_TDATA(axis_app2txbuffer_TDATA),
.m_axis_txwrite_data_TKEEP(axis_app2txbuffer_TKEEP),
.m_axis_txwrite_data_TLAST(axis_app2txbuffer_TLAST),
/// SmartCAM I/F ///
.m_axis_session_upd_req_TVALID(upd_req_TVALID),
.m_axis_session_upd_req_TREADY(upd_req_TREADY),
.m_axis_session_upd_req_TDATA(upd_req_TDATA),
.s_axis_session_upd_rsp_TVALID(upd_rsp_TVALID),
.s_axis_session_upd_rsp_TREADY(upd_rsp_TREADY),
.s_axis_session_upd_rsp_TDATA(upd_rsp_TDATA),

.m_axis_session_lup_req_TVALID(lup_req_TVALID),
.m_axis_session_lup_req_TREADY(lup_req_TREADY),
.m_axis_session_lup_req_TDATA(lup_req_TDATA),
.s_axis_session_lup_rsp_TVALID(lup_rsp_TVALID),
.s_axis_session_lup_rsp_TREADY(lup_rsp_TREADY),
.s_axis_session_lup_rsp_TDATA(lup_rsp_TDATA),

/* Application Interface */
// listen&close port
.s_axis_listen_port_req_TVALID(s_axis_listen_port_TVALID),
.s_axis_listen_port_req_TREADY(s_axis_listen_port_TREADY),
.s_axis_listen_port_req_TDATA(s_axis_listen_port_TDATA),
.m_axis_listen_port_rsp_TVALID(m_axis_listen_port_status_TVALID),
.m_axis_listen_port_rsp_TREADY(m_axis_listen_port_status_TREADY),
.m_axis_listen_port_rsp_TDATA(m_axis_listen_port_status_TDATA),

// notification & read request
.m_axis_notification_TVALID(m_axis_notifications_TVALID),
.m_axis_notification_TREADY(m_axis_notifications_TREADY),
.m_axis_notification_TDATA(m_axis_notifications_TDATA),
.s_axis_rx_data_req_TVALID(s_axis_read_package_TVALID),
.s_axis_rx_data_req_TREADY(s_axis_read_package_TREADY),
.s_axis_rx_data_req_TDATA(s_axis_read_package_TDATA),

// open&close connection
.s_axis_open_conn_req_TVALID(s_axis_open_connection_TVALID),
.s_axis_open_conn_req_TREADY(s_axis_open_connection_TREADY),
.s_axis_open_conn_req_TDATA(s_axis_open_connection_TDATA),
.m_axis_open_conn_rsp_TVALID(m_axis_open_status_TVALID),
.m_axis_open_conn_rsp_TREADY(m_axis_open_status_TREADY),
.m_axis_open_conn_rsp_TDATA(m_axis_open_status_TDATA),
.s_axis_close_conn_req_TVALID(s_axis_close_connection_TVALID),//axis_close_connection_TVALID
.s_axis_close_conn_req_TREADY(s_axis_close_connection_TREADY),
.s_axis_close_conn_req_TDATA(s_axis_close_connection_TDATA),

// rx data
.m_axis_rx_data_rsp_metadata_TVALID(m_axis_rx_metadata_TVALID),
.m_axis_rx_data_rsp_metadata_TREADY(m_axis_rx_metadata_TREADY),
.m_axis_rx_data_rsp_metadata_TDATA(m_axis_rx_metadata_TDATA),
.m_axis_rx_data_rsp_TVALID(m_axis_rx_data_TVALID),
.m_axis_rx_data_rsp_TREADY(m_axis_rx_data_TREADY),
.m_axis_rx_data_rsp_TDATA(m_axis_rx_data_TDATA),
.m_axis_rx_data_rsp_TKEEP(m_axis_rx_data_TKEEP),
.m_axis_rx_data_rsp_TLAST(m_axis_rx_data_TLAST),

// tx data
.s_axis_tx_data_req_metadata_TVALID(s_axis_tx_metadata_TVALID),
.s_axis_tx_data_req_metadata_TREADY(s_axis_tx_metadata_TREADY),
.s_axis_tx_data_req_metadata_TDATA(s_axis_tx_metadata_TDATA),
.s_axis_tx_data_req_TVALID(s_axis_tx_data_TVALID),
.s_axis_tx_data_req_TREADY(s_axis_tx_data_TREADY),
.s_axis_tx_data_req_TDATA(s_axis_tx_data_TDATA),
.s_axis_tx_data_req_TKEEP(s_axis_tx_data_TKEEP),
.s_axis_tx_data_req_TLAST(s_axis_tx_data_TLAST),
.m_axis_tx_data_rsp_TVALID(m_axis_tx_status_TVALID),
.m_axis_tx_data_rsp_TREADY(m_axis_tx_status_TREADY),
.m_axis_tx_data_rsp_TDATA(m_axis_tx_status_TDATA[63:0]),

.regIpAddress_V(toe_ip_address),
.regSessionCount_V(regSessionCount_V),
.regSessionCount_V_ap_vld(regSessionCount_V_ap_vld),

//for external RX Buffer
.axis_data_count_V(rx_buffer_data_count),
.axis_max_data_count_V(32'd2048),

//.debug_out(debug_out_tcp[157:0]),

.aclk(aclk), // input aclk
.aresetn(aresetn) // input aresetn
);

assign debug_out = {debug_out_tcp[137:0], debug_out_ips[19:0]};

//assign m_axis_tx_status_TDATA[7:0] = debug_out;


//RX BUFFER FIFO
fifo_generator_0 rx_buffer_fifo (
  .s_aresetn(aresetn),          // input wire s_axis_aresetn
  .s_aclk(aclk),                // input wire s_axis_aclk
  .s_axis_tvalid(axis_tcp2rxbuffer_TVALID),            // inp wire s_axis_tvalid
  .s_axis_tready(axis_tcp2rxbuffer_TREADY),            // output wire s_axis_tready
  .s_axis_tdata(axis_tcp2rxbuffer_TDATA),              // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(axis_tcp2rxbuffer_TKEEP),              // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(axis_tcp2rxbuffer_TLAST),              // input wire s_axis_tlast
  .m_axis_tvalid(axis_rxbuffer2app_TVALID),            // output wire m_axis_tvalid
  .m_axis_tready(axis_rxbuffer2app_TREADY),            // input wire m_axis_tready
  .m_axis_tdata(axis_rxbuffer2app_TDATA),              // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_rxbuffer2app_TKEEP),              // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_rxbuffer2app_TLAST),              // output wire m_axis_tlast
  .axis_data_count(rx_buffer_data_count[11:0])
);
assign rx_buffer_data_count[31:12] = 20'h0;

SmartCamCtl SmartCamCtl_inst
(
.clk(aclk),
.rst(~aresetn),
.led0(sc_led0),
.led1(sc_led1),
.cam_ready(cam_ready),

.lup_req_valid(lup_req_TVALID),
.lup_req_ready(lup_req_TREADY),
.lup_req_din(lup_req_TDATA),

.lup_rsp_valid(lup_rsp_TVALID),
.lup_rsp_ready(lup_rsp_TREADY),
.lup_rsp_dout(lup_rsp_TDATA),

.upd_req_valid(upd_req_TVALID),
.upd_req_ready(upd_req_TREADY),
.upd_req_din(upd_req_TDATA),

.upd_rsp_valid(upd_rsp_TVALID),
.upd_rsp_ready(upd_rsp_TREADY),
.upd_rsp_dout(upd_rsp_TDATA),

.debug(sc_debug)
);

// DHCP port
wire        axis_dhcp_open_port_tvalid;
wire        axis_dhcp_open_port_tready;
wire[15:0]  axis_dhcp_open_port_tdata;
wire        axis_dhcp_open_port_status_tvalid;
wire        axis_dhcp_open_port_status_tready;
wire[7:0]   axis_dhcp_open_port_status_tdata; //actually only [0:0]

// DHCP RX
wire        axis_dhcp_rx_data_tvalid;
wire        axis_dhcp_rx_data_tready;
wire[63:0]  axis_dhcp_rx_data_tdata;
wire[7:0]   axis_dhcp_rx_data_tkeep;
wire        axis_dhcp_rx_data_tlast;

wire        axis_dhcp_rx_metadata_tvalid;
wire        axis_dhcp_rx_metadata_tready;
wire[95:0]  axis_dhcp_rx_metadata_tdata;

// DHCP TX
wire        axis_dhcp_tx_data_tvalid;
wire        axis_dhcp_tx_data_tready;
wire[63:0]  axis_dhcp_tx_data_tdata;
wire[7:0]   axis_dhcp_tx_data_tkeep;
wire        axis_dhcp_tx_data_tlast;

wire        axis_dhcp_tx_metadata_tvalid;
wire        axis_dhcp_tx_metadata_tready;
wire[95:0]  axis_dhcp_tx_metadata_tdata;

wire        axis_dhcp_tx_length_tvalid;
wire        axis_dhcp_tx_length_tready;
wire[15:0]  axis_dhcp_tx_length_tdata;


assign axi_udp_slice_to_udp_tready = 1'b1;

assign axi_udp_to_merge_tvalid = 1'b0;
assign axi_udp_to_merge_tdata = 0;
assign axi_udp_to_merge_tkeep = 0;
assign axi_udp_to_merge_tlast = 0;

// UDP Engine
/*udp_ip udp_inst (
  .inputPathInData_TVALID(axi_udp_slice_to_udp_tvalid),               // input wire inputPathInData_TVALID
  .inputPathInData_TREADY(axi_udp_slice_to_udp_tready),               // output wire inputPathInData_TREADY
  .inputPathInData_TDATA(axi_udp_slice_to_udp_tdata),                 // input wire [63 : 0] inputPathInData_TDATA
  .inputPathInData_TKEEP(axi_udp_slice_to_udp_tkeep),                 // input wire [7 : 0] inputPathInData_TKEEP
  .inputPathInData_TLAST(axi_udp_slice_to_udp_tlast),                 // input wire [0 : 0] inputPathInData_TLAST
  .inputpathOutData_TVALID(axis_dhcp_rx_data_tvalid),                    // output wire inputpathOutData_V_TVALID
  .inputpathOutData_TREADY(axis_dhcp_rx_data_tready),                    // input wire inputpathOutData_V_TREADY
  .inputpathOutData_TDATA(axis_dhcp_rx_data_tdata),                      // output wire [71 : 0] inputpathOutData_V_TDATA
  .inputpathOutData_TKEEP(axis_dhcp_rx_data_tkeep),                      // output wire [7:0]  
  .inputpathOutData_TLAST(axis_dhcp_rx_data_tlast),                      // output wire
  .openPort_TVALID(axis_dhcp_open_port_tvalid),                // input wire openPort_V_TVALID
  .openPort_TREADY(axis_dhcp_open_port_tready),                // output wire openPort_V_TREADY
  .openPort_TDATA(axis_dhcp_open_port_tdata),                  // input wire [7 : 0] openPort_V_TDATA
  .confirmPortStatus_TVALID(axis_dhcp_open_port_status_tvalid),        // output wire confirmPortStatus_V_V_TVALID
  .confirmPortStatus_TREADY(axis_dhcp_open_port_status_tready),        // input wire confirmPortStatus_V_V_TREADY
  .confirmPortStatus_TDATA(axis_dhcp_open_port_status_tdata),          // output wire [15 : 0] confirmPortStatus_V_V_TDATA
  .inputPathOutputMetadata_TVALID(axis_dhcp_rx_metadata_tvalid),       // output wire inputPathOutputMetadata_V_TVALID
  .inputPathOutputMetadata_TREADY(axis_dhcp_rx_metadata_tready),       // input wire inputPathOutputMetadata_V_TREADY
  .inputPathOutputMetadata_TDATA(axis_dhcp_rx_metadata_tdata),         // output wire [95 : 0] inputPathOutputMetadata_V_TDATA
  .portRelease_TVALID(1'b0),                                    // input wire portRelease_V_V_TVALID
  .portRelease_TREADY(),                                        // output wire portRelease_V_V_TREADY
  .portRelease_TDATA(15'b0),                                    // input wire [15 : 0] portRelease_V_V_TDATA
  .outputPathInData_TVALID(axis_dhcp_tx_data_tvalid),                // input wire outputPathInData_V_TVALID
  .outputPathInData_TREADY(axis_dhcp_tx_data_tready),                // output wire outputPathInData_V_TREADY
  .outputPathInData_TDATA(axis_dhcp_tx_data_tdata),                  // input wire [71 : 0] outputPathInData_V_TDATA
  .outputPathInData_TKEEP(axis_dhcp_tx_data_tkeep),                  // input wire [7 : 0] outputPathInData_TKEEP
  .outputPathInData_TLAST(axis_dhcp_tx_data_tlast),                  // input wire [0 : 0] outputPathInData_TLAST
  .outputPathOutData_TVALID(axi_udp_to_merge_tvalid),           // output wire outputPathOutData_TVALID
  .outputPathOutData_TREADY(axi_udp_to_merge_tready),           // input wire outputPathOutData_TREADY
  .outputPathOutData_TDATA(axi_udp_to_merge_tdata),             // output wire [63 : 0] outputPathOutData_TDATA
  .outputPathOutData_TKEEP(axi_udp_to_merge_tkeep),             // output wire [7 : 0] outputPathOutData_TKEEP
  .outputPathOutData_TLAST(axi_udp_to_merge_tlast),             // output wire [0 : 0] outputPathOutData_TLAST  
  .outputPathInMetadata_TVALID(axis_dhcp_tx_metadata_tvalid),      // input wire outputPathInMetadata_V_TVALID
  .outputPathInMetadata_TREADY(axis_dhcp_tx_metadata_tready),      // output wire outputPathInMetadata_V_TREADY
  .outputPathInMetadata_TDATA(axis_dhcp_tx_metadata_tdata),        // input wire [95 : 0] outputPathInMetadata_V_TDATA
  .outputpathInLength_TVALID(axis_dhcp_tx_length_tvalid),        // input wire outputpathInLength_V_V_TVALID
  .outputpathInLength_TREADY(axis_dhcp_tx_length_tready),        // output wire outputpathInLength_V_V_TREADY
  .outputpathInLength_TDATA(axis_dhcp_tx_length_tdata),          // input wire [15 : 0] outputpathInLength_V_V_TDATA
  .inputPathPortUnreachable_TVALID(),    // output wire inputPathPortUnreachable_TVALID
  .inputPathPortUnreachable_TREADY(1'b1),    // input wire inputPathPortUnreachable_TREADY
  .inputPathPortUnreachable_TDATA(),      // output wire [63 : 0] inputPathPortUnreachable_TDATA
  .inputPathPortUnreachable_TKEEP(),      // output wire [7 : 0] inputPathPortUnreachable_TKEEP
  .inputPathPortUnreachable_TLAST(),      // output wire [0 : 0] inputPathPortUnreachable_TLAST
  .aclk(aclk),                                                  // input wire ap_clk
  .aresetn(aresetn)                                             // input wire ap_rst_n
);


dhcp_client_ip dhcp_client_inst (
  .m_axis_open_port_TVALID(axis_dhcp_open_port_tvalid),                // output wire m_axis_open_port_TVALID
  .m_axis_open_port_TREADY(axis_dhcp_open_port_tready),                // input wire m_axis_open_port_TREADY
  .m_axis_open_port_TDATA(axis_dhcp_open_port_tdata),                  // output wire [15 : 0] m_axis_open_port_TDATA
  .m_axis_tx_data_TVALID(axis_dhcp_tx_data_tvalid),                    // output wire m_axis_tx_data_TVALID
  .m_axis_tx_data_TREADY(axis_dhcp_tx_data_tready),                    // input wire m_axis_tx_data_TREADY
  .m_axis_tx_data_TDATA(axis_dhcp_tx_data_tdata),                      // output wire [63 : 0] m_axis_tx_data_TDATA
  .m_axis_tx_data_TKEEP(axis_dhcp_tx_data_tkeep),                      // output wire [7 : 0] m_axis_tx_data_TKEEP
  .m_axis_tx_data_TLAST(axis_dhcp_tx_data_tlast),                      // output wire [0 : 0] m_axis_tx_data_TLAST
  .m_axis_tx_length_TVALID(axis_dhcp_tx_length_tvalid),                // output wire m_axis_tx_length_TVALID
  .m_axis_tx_length_TREADY(axis_dhcp_tx_length_tready),                // input wire m_axis_tx_length_TREADY
  .m_axis_tx_length_TDATA(axis_dhcp_tx_length_tdata),                  // output wire [15 : 0] m_axis_tx_length_TDATA
  .m_axis_tx_metadata_TVALID(axis_dhcp_tx_metadata_tvalid),            // output wire m_axis_tx_metadata_TVALID
  .m_axis_tx_metadata_TREADY(axis_dhcp_tx_metadata_tready),            // input wire m_axis_tx_metadata_TREADY
  .m_axis_tx_metadata_TDATA(axis_dhcp_tx_metadata_tdata),              // output wire [95 : 0] m_axis_tx_metadata_TDATA
  .s_axis_open_port_status_TVALID(axis_dhcp_open_port_status_tvalid),  // input wire s_axis_open_port_status_TVALID
  .s_axis_open_port_status_TREADY(axis_dhcp_open_port_status_tready),  // output wire s_axis_open_port_status_TREADY
  .s_axis_open_port_status_TDATA(axis_dhcp_open_port_status_tdata),    // input wire [7 : 0] s_axis_open_port_status_TDATA
  .s_axis_rx_data_TVALID(axis_dhcp_rx_data_tvalid),                    // input wire s_axis_rx_data_TVALID
  .s_axis_rx_data_TREADY(axis_dhcp_rx_data_tready),                    // output wire s_axis_rx_data_TREADY
  .s_axis_rx_data_TDATA(axis_dhcp_rx_data_tdata),                      // input wire [63 : 0] s_axis_rx_data_TDATA
  .s_axis_rx_data_TKEEP(axis_dhcp_rx_data_tkeep),                      // input wire [7 : 0] s_axis_rx_data_TKEEP
  .s_axis_rx_data_TLAST(axis_dhcp_rx_data_tlast),                      // input wire [0 : 0] s_axis_rx_data_TLAST
  .s_axis_rx_metadata_TVALID(axis_dhcp_rx_metadata_tvalid),            // input wire s_axis_rx_metadata_TVALID
  .s_axis_rx_metadata_TREADY(axis_dhcp_rx_metadata_tready),            // output wire s_axis_rx_metadata_TREADY
  .s_axis_rx_metadata_TDATA(axis_dhcp_rx_metadata_tdata),              // input wire [95 : 0] s_axis_rx_metadata_TDATA
  .dhcpIpAddressOut_V(dhcp_ip_address),                          // output wire [31 : 0] dhcpIpAddressOut_V
  .dhcpIpAddressOut_V_ap_vld(dhcp_ip_address_en), 
  .aclk(aclk),                                                      // input wire aclk
  .aresetn(aresetn)                                                // input wire aresetn
);*/

ip_handler_ip ip_handler_inst (
.m_axis_ARP_TVALID(axi_iph_to_arp_slice_tvalid), // output AXI4Stream_M_TVALID
.m_axis_ARP_TREADY(axi_iph_to_arp_slice_tready), // input AXI4Stream_M_TREADY
.m_axis_ARP_TDATA(axi_iph_to_arp_slice_tdata), // output [63 : 0] AXI4Stream_M_TDATA
.m_axis_ARP_TKEEP(axi_iph_to_arp_slice_tkeep), // output [7 : 0] AXI4Stream_M_TSTRB
.m_axis_ARP_TLAST(axi_iph_to_arp_slice_tlast), // output [0 : 0] AXI4Stream_M_TLAST

.m_axis_ICMP_TVALID(axi_iph_to_icmp_slice_tvalid), // output AXI4Stream_M_TVALID
.m_axis_ICMP_TREADY(axi_iph_to_icmp_slice_tready), // input AXI4Stream_M_TREADY
.m_axis_ICMP_TDATA(axi_iph_to_icmp_slice_tdata), // output [63 : 0] AXI4Stream_M_TDATA
.m_axis_ICMP_TKEEP(axi_iph_to_icmp_slice_tkeep), // output [7 : 0] AXI4Stream_M_TSTRB
.m_axis_ICMP_TLAST(axi_iph_to_icmp_slice_tlast), // output [0 : 0] AXI4Stream_M_TLAST

.m_axis_UDP_TVALID(axi_iph_to_udp_slice_tvalid),          // output AXI4Stream_M_TVALID
.m_axis_UDP_TREADY(axi_iph_to_udp_slice_tready),          // input AXI4Stream_M_TREADY
.m_axis_UDP_TDATA(axi_iph_to_udp_slice_tdata),            // output [63 : 0] AXI4Stream_M_TDATA
.m_axis_UDP_TKEEP(axi_iph_to_udp_slice_tkeep),            // output [7 : 0] AXI4Stream_M_TSTRB
.m_axis_UDP_TLAST(axi_iph_to_udp_slice_tlast),            // output [0 : 0]  

.m_axis_TCP_TVALID(axi_iph_to_toe_slice_tvalid), // output AXI4Stream_M_TVALID
.m_axis_TCP_TREADY(axi_iph_to_toe_slice_tready), // input AXI4Stream_M_TREADY
.m_axis_TCP_TDATA(axi_iph_to_toe_slice_tdata), // output [63 : 0] AXI4Stream_M_TDATA
.m_axis_TCP_TKEEP(axi_iph_to_toe_slice_tkeep), // output [7 : 0] AXI4Stream_M_TSTRB
.m_axis_TCP_TLAST(axi_iph_to_toe_slice_tlast), // output [0 : 0] AXI4Stream_M_TLAST

.s_axis_raw_TVALID(AXI_S_Stream_TVALID), // input AXI4Stream_S_TVALID
.s_axis_raw_TREADY(AXI_S_Stream_TREADY), // output AXI4Stream_S_TREADY
.s_axis_raw_TDATA(AXI_S_Stream_TDATA), // input [63 : 0] AXI4Stream_S_TDATA
.s_axis_raw_TKEEP(AXI_S_Stream_TKEEP), // input [7 : 0] AXI4Stream_S_TSTRB
.s_axis_raw_TLAST(AXI_S_Stream_TLAST), // input [0 : 0] AXI4Stream_S_TLAST

.regIpAddress_V(iph_ip_address),

.aclk(aclk), // input aclk
.aresetn(aresetn) // input aresetn
);

assign debug_out_ips[0] = axi_iph_to_arp_slice_tvalid;
assign debug_out_ips[1] = axi_iph_to_arp_slice_tready;
assign debug_out_ips[2] = axi_iph_to_arp_slice_tlast;
assign debug_out_ips[3] = axi_iph_to_icmp_slice_tvalid;
assign debug_out_ips[4] = axi_iph_to_icmp_slice_tready;
assign debug_out_ips[5] = axi_iph_to_icmp_slice_tlast;
assign debug_out_ips[6] = axi_iph_to_toe_slice_tvalid;
assign debug_out_ips[7] = axi_iph_to_toe_slice_tready;
assign debug_out_ips[8] = axi_iph_to_toe_slice_tlast;
assign debug_out_ips[9] = AXI_S_Stream_TVALID;
assign debug_out_ips[10] = AXI_S_Stream_TREADY;
assign debug_out_ips[11] = AXI_S_Stream_TLAST;

// ARP lookup
wire        axis_arp_lookup_request_TVALID;
wire        axis_arp_lookup_request_TREADY;
wire[31:0]  axis_arp_lookup_request_TDATA;
wire        axis_arp_lookup_reply_TVALID;
wire        axis_arp_lookup_reply_TREADY;
wire[55:0]  axis_arp_lookup_reply_TDATA;

mac_ip_encode_ip mac_ip_encode_inst (
.m_axis_ip_TVALID(axi_mie_to_intercon_tvalid),
.m_axis_ip_TREADY(axi_mie_to_intercon_tready),
.m_axis_ip_TDATA(axi_mie_to_intercon_tdata),
.m_axis_ip_TKEEP(axi_mie_to_intercon_tkeep),
.m_axis_ip_TLAST(axi_mie_to_intercon_tlast),
.m_axis_arp_lookup_request_TVALID(axis_arp_lookup_request_TVALID),
.m_axis_arp_lookup_request_TREADY(axis_arp_lookup_request_TREADY),
.m_axis_arp_lookup_request_TDATA(axis_arp_lookup_request_TDATA),
.s_axis_ip_TVALID(axi_intercon_to_mie_tvalid),
.s_axis_ip_TREADY(axi_intercon_to_mie_tready),
.s_axis_ip_TDATA(axi_intercon_to_mie_tdata),
.s_axis_ip_TKEEP(axi_intercon_to_mie_tkeep),
.s_axis_ip_TLAST(axi_intercon_to_mie_tlast),
.s_axis_arp_lookup_reply_TVALID(axis_arp_lookup_reply_TVALID),
.s_axis_arp_lookup_reply_TREADY(axis_arp_lookup_reply_TREADY),
.s_axis_arp_lookup_reply_TDATA(axis_arp_lookup_reply_TDATA),

.myMacAddress_V(mie_mac_address),                                    // input wire [47 : 0] regMacAddress_V
.regSubNetMask_V(ip_subnet_mask),                                    // input wire [31 : 0] regSubNetMask_V
.regDefaultGateway_V(ip_default_gateway),                            // input wire [31 : 0] regDefaultGateway_V
  
.aclk(aclk), // input aclk
.aresetn(aresetn) // input aresetn
);


// merges icmp, udp and tcp
axis_interconnect_3to1 ip_merger (
  .ACLK(aclk), // input ACLK
  .ARESETN(aresetn), // input ARESETN
  // ICMP
  .S00_AXIS_ACLK(aclk), // input S00_AXIS_ACLK
  .S00_AXIS_ARESETN(aresetn), // input S00_AXIS_ARESETN
  .S00_AXIS_TVALID(axi_icmp_to_icmp_slice_tvalid), // input S00_AXIS_TVALID
  .S00_AXIS_TREADY(axi_icmp_to_icmp_slice_tready), // output S00_AXIS_TREADY
  .S00_AXIS_TDATA(axi_icmp_to_icmp_slice_tdata), // input [63 : 0] S00_AXIS_TDATA
  .S00_AXIS_TKEEP(axi_icmp_to_icmp_slice_tkeep), // input [7 : 0] S00_AXIS_TKEEP
  .S00_AXIS_TLAST(axi_icmp_to_icmp_slice_tlast), // input S00_AXIS_TLAST
  //UDP
  .S01_AXIS_ACLK(aclk), // input S01_AXIS_ACLK
  .S01_AXIS_ARESETN(aresetn), // input S01_AXIS_ARESETN
  .S01_AXIS_TVALID(axi_udp_to_merge_tvalid), // input S01_AXIS_TVALID
  .S01_AXIS_TREADY(axi_udp_to_merge_tready), // output S01_AXIS_TREADY
  .S01_AXIS_TDATA(axi_udp_to_merge_tdata), // input [63 : 0] S01_AXIS_TDATA
  .S01_AXIS_TKEEP(axi_udp_to_merge_tkeep), // input [7 : 0] S01_AXIS_TKEEP
  .S01_AXIS_TLAST(axi_udp_to_merge_tlast), // input S01_AXIS_TLAST
  //TCP
  .S02_AXIS_ACLK(aclk), // input S01_AXIS_ACLK
  .S02_AXIS_ARESETN(aresetn), // input S01_AXIS_ARESETN
  .S02_AXIS_TVALID(axi_toe_to_toe_slice_tvalid), // input S01_AXIS_TVALID
  .S02_AXIS_TREADY(axi_toe_to_toe_slice_tready), // output S01_AXIS_TREADY
  .S02_AXIS_TDATA(axi_toe_to_toe_slice_tdata), // input [63 : 0] S01_AXIS_TDATA
  .S02_AXIS_TKEEP(axi_toe_to_toe_slice_tkeep), // input [7 : 0] S01_AXIS_TKEEP
  .S02_AXIS_TLAST(axi_toe_to_toe_slice_tlast), // input S01_AXIS_TLAST
  .M00_AXIS_ACLK(aclk), // input M00_AXIS_ACLK
  .M00_AXIS_ARESETN(aresetn), // input M00_AXIS_ARESETN
  .M00_AXIS_TVALID(axi_intercon_to_mie_tvalid), // output M00_AXIS_TVALID
  .M00_AXIS_TREADY(axi_intercon_to_mie_tready), // input M00_AXIS_TREADY
  .M00_AXIS_TDATA(axi_intercon_to_mie_tdata), // output [63 : 0] M00_AXIS_TDATA
  .M00_AXIS_TKEEP(axi_intercon_to_mie_tkeep), // output [7 : 0] M00_AXIS_TKEEP
  .M00_AXIS_TLAST(axi_intercon_to_mie_tlast), // output M00_AXIS_TLAST
  .S00_ARB_REQ_SUPPRESS(1'b0), // input S00_ARB_REQ_SUPPRESS
  .S01_ARB_REQ_SUPPRESS(1'b0), // input S01_ARB_REQ_SUPPRESS
  .S02_ARB_REQ_SUPPRESS(1'b0) // input S02_ARB_REQ_SUPPRESS
);

// merges ip and arp
axis_interconnect_2to1 mac_merger (
  .ACLK(aclk), // input ACLK
  .ARESETN(aresetn), // input ARESETN
  .S00_AXIS_ACLK(aclk), // input S00_AXIS_ACLK
  .S01_AXIS_ACLK(aclk), // input S01_AXIS_ACLK
  .S00_AXIS_ARESETN(aresetn), // input S00_AXIS_ARESETN
  .S01_AXIS_ARESETN(aresetn), // input S01_AXIS_ARESETN
  .S00_AXIS_TVALID(axi_arp_to_arp_slice_tvalid), // input S00_AXIS_TVALID
  .S01_AXIS_TVALID(axi_mie_to_intercon_tvalid), // input S01_AXIS_TVALID
  .S00_AXIS_TREADY(axi_arp_to_arp_slice_tready), // output S00_AXIS_TREADY
  .S01_AXIS_TREADY(axi_mie_to_intercon_tready), // output S01_AXIS_TREADY
  .S00_AXIS_TDATA(axi_arp_to_arp_slice_tdata), // input [63 : 0] S00_AXIS_TDATA
  .S01_AXIS_TDATA(axi_mie_to_intercon_tdata), // input [63 : 0] S01_AXIS_TDATA
  .S00_AXIS_TKEEP(axi_arp_to_arp_slice_tkeep), // input [7 : 0] S00_AXIS_TKEEP
  .S01_AXIS_TKEEP(axi_mie_to_intercon_tkeep), // input [7 : 0] S01_AXIS_TKEEP
  .S00_AXIS_TLAST(axi_arp_to_arp_slice_tlast), // input S00_AXIS_TLAST
  .S01_AXIS_TLAST(axi_mie_to_intercon_tlast), // input S01_AXIS_TLAST
  .M00_AXIS_ACLK(aclk), // input M00_AXIS_ACLK
  .M00_AXIS_ARESETN(aresetn), // input M00_AXIS_ARESETN
  .M00_AXIS_TVALID(AXI_M_Stream_TVALID), // output M00_AXIS_TVALID
  .M00_AXIS_TREADY(AXI_M_Stream_TREADY), // input M00_AXIS_TREADY
  .M00_AXIS_TDATA(AXI_M_Stream_TDATA), // output [63 : 0] M00_AXIS_TDATA
  .M00_AXIS_TKEEP(AXI_M_Stream_TKEEP), // output [7 : 0] M00_AXIS_TKEEP
  .M00_AXIS_TLAST(AXI_M_Stream_TLAST), // output M00_AXIS_TLAST
  .S00_ARB_REQ_SUPPRESS(1'b0), // input S00_ARB_REQ_SUPPRESS
  .S01_ARB_REQ_SUPPRESS(1'b0) // input S01_ARB_REQ_SUPPRESS
);

assign debug_out_ips[12] = axi_arp_to_arp_slice_tvalid;
assign debug_out_ips[13] = axi_arp_to_arp_slice_tready;
assign debug_out_ips[14] = axi_mie_to_intercon_tvalid;
assign debug_out_ips[15] = axi_mie_to_intercon_tready;
assign debug_out_ips[16] = AXI_M_Stream_TVALID;
assign debug_out_ips[17] = AXI_M_Stream_TREADY;
assign debug_out_ips[18] = AXI_M_Stream_TLAST;

// ARP Server
/*arpServerWrapper arpServerInst (
.axi_arp_to_arp_slice_tvalid(axi_arp_to_arp_slice_tvalid),
.axi_arp_to_arp_slice_tready(axi_arp_to_arp_slice_tready),
.axi_arp_to_arp_slice_tdata(axi_arp_to_arp_slice_tdata),
.axi_arp_to_arp_slice_tkeep(axi_arp_to_arp_slice_tkeep),
.axi_arp_to_arp_slice_tlast(axi_arp_to_arp_slice_tlast),
.axis_arp_lookup_reply_TVALID(axis_arp_lookup_reply_TVALID),
.axis_arp_lookup_reply_TREADY(axis_arp_lookup_reply_TREADY),
.axis_arp_lookup_reply_TDATA(axis_arp_lookup_reply_TDATA),
.axi_arp_slice_to_arp_tvalid(axi_arp_slice_to_arp_tvalid),
.axi_arp_slice_to_arp_tready(axi_arp_slice_to_arp_tready),
.axi_arp_slice_to_arp_tdata(axi_arp_slice_to_arp_tdata),
.axi_arp_slice_to_arp_tkeep(axi_arp_slice_to_arp_tkeep),
.axi_arp_slice_to_arp_tlast(axi_arp_slice_to_arp_tlast),
.axis_arp_lookup_request_TVALID(axis_arp_lookup_request_TVALID),
.axis_arp_lookup_request_TREADY(axis_arp_lookup_request_TREADY),
.axis_arp_lookup_request_TDATA(axis_arp_lookup_request_TDATA),
//.ip_address(arp_ip_address),
.aclk(aclk), // input aclk
.aresetn(aresetn)); // input aresetn*/

arp_server_subnet_ip arp_server_inst(
.m_axis_TVALID(axi_arp_to_arp_slice_tvalid),
.m_axis_TREADY(axi_arp_to_arp_slice_tready),
.m_axis_TDATA(axi_arp_to_arp_slice_tdata),
.m_axis_TKEEP(axi_arp_to_arp_slice_tkeep),
.m_axis_TLAST(axi_arp_to_arp_slice_tlast),
.m_axis_arp_lookup_reply_TVALID(axis_arp_lookup_reply_TVALID),
.m_axis_arp_lookup_reply_TREADY(axis_arp_lookup_reply_TREADY),
.m_axis_arp_lookup_reply_TDATA(axis_arp_lookup_reply_TDATA),
.s_axis_TVALID(axi_arp_slice_to_arp_tvalid),
.s_axis_TREADY(axi_arp_slice_to_arp_tready),
.s_axis_TDATA(axi_arp_slice_to_arp_tdata),
.s_axis_TKEEP(axi_arp_slice_to_arp_tkeep),
.s_axis_TLAST(axi_arp_slice_to_arp_tlast),
.s_axis_arp_lookup_request_TVALID(axis_arp_lookup_request_TVALID),
.s_axis_arp_lookup_request_TREADY(axis_arp_lookup_request_TREADY),
.s_axis_arp_lookup_request_TDATA(axis_arp_lookup_request_TDATA),

.regMacAddress_V(arp_mac_address),
.regIpAddress_V(arp_ip_address),

.aclk(aclk), // input aclk
.aresetn(aresetn) // input aresetn
);

icmp_server_ip icmp_server_inst (
.m_axis_TVALID(axi_icmp_to_icmp_slice_tvalid),
.m_axis_TREADY(axi_icmp_to_icmp_slice_tready),
.m_axis_TDATA(axi_icmp_to_icmp_slice_tdata),
.m_axis_TKEEP(axi_icmp_to_icmp_slice_tkeep),
.m_axis_TLAST(axi_icmp_to_icmp_slice_tlast),
.s_axis_TVALID(axi_icmp_slice_to_icmp_tvalid),
.s_axis_TREADY(axi_icmp_slice_to_icmp_tready),
.s_axis_TDATA(axi_icmp_slice_to_icmp_tdata),
.s_axis_TKEEP(axi_icmp_slice_to_icmp_tkeep),
.s_axis_TLAST(axi_icmp_slice_to_icmp_tlast),
.ttlIn_TVALID(1'b0),    // input wire ttlIn_TVALID
.ttlIn_TREADY(),    // output wire ttlIn_TREADY
.ttlIn_TDATA(64'h0000000000000000),      // input wire [63 : 0] ttlIn_TDATA
.ttlIn_TKEEP(8'h00),      // input wire [7 : 0] ttlIn_TKEEP
.ttlIn_TLAST(1'b0),      // input wire [0 : 0] ttlIn_TLAST
.udpIn_TVALID(1'b0),    // input wire udpIn_TVALID
.udpIn_TREADY(),    // output wire udpIn_TREADY
.udpIn_TDATA(64'h0000000000000000),      // input wire [63 : 0] udpIn_TDATA
.udpIn_TKEEP(8'h00),      // input wire [7 : 0] udpIn_TKEEP
.udpIn_TLAST(1'b0),      // input wire [0 : 0] udpIn_TLAST
.aclk(aclk), // input aclk
.aresetn(aresetn) // input aresetn
);


/*
 * Slices
 */
 // ARP Input Slice
axis_register_slice_64 axis_register_arp_in_slice(
 .aclk(aclk),
 .aresetn(aresetn),
 .s_axis_tvalid(axi_iph_to_arp_slice_tvalid),
 .s_axis_tready(axi_iph_to_arp_slice_tready),
 .s_axis_tdata(axi_iph_to_arp_slice_tdata),
 .s_axis_tkeep(axi_iph_to_arp_slice_tkeep),
 .s_axis_tlast(axi_iph_to_arp_slice_tlast),
 .m_axis_tvalid(axi_arp_slice_to_arp_tvalid),
 .m_axis_tready(axi_arp_slice_to_arp_tready),
 .m_axis_tdata(axi_arp_slice_to_arp_tdata),
 .m_axis_tkeep(axi_arp_slice_to_arp_tkeep),
 .m_axis_tlast(axi_arp_slice_to_arp_tlast)
);
// ARP Output Slice
/*axis_register_slice_64 axis_register_arp_out_slice(
 .aclk(aclk),
 .aresetn(aresetn),
 .s_axis_tvalid(axi_arp_to_arp_slice_tvalid),
 .s_axis_tready(axi_arp_to_arp_slice_tready),
 .s_axis_tdata(axi_arp_to_arp_slice_tdata),
 .s_axis_tkeep(axi_arp_to_arp_slice_tkeep),
 .s_axis_tlast(axi_arp_to_arp_slice_tlast),
 .m_axis_tvalid(axi_arp_slice_to_mie_tvalid),
 .m_axis_tready(axi_arp_slice_to_mie_tready),
 .m_axis_tdata(axi_arp_slice_to_mie_tdata),
 .m_axis_tkeep(axi_arp_slice_to_mie_tkeep),
 .m_axis_tlast(axi_arp_slice_to_mie_tlast)
);*/
 // ICMP Input Slice
axis_register_slice_64 axis_register_icmp_in_slice(
  .aclk(aclk),
  .aresetn(aresetn),
  .s_axis_tvalid(axi_iph_to_icmp_slice_tvalid),
  .s_axis_tready(axi_iph_to_icmp_slice_tready),
  .s_axis_tdata(axi_iph_to_icmp_slice_tdata),
  .s_axis_tkeep(axi_iph_to_icmp_slice_tkeep),
  .s_axis_tlast(axi_iph_to_icmp_slice_tlast),
  .m_axis_tvalid(axi_icmp_slice_to_icmp_tvalid),
  .m_axis_tready(axi_icmp_slice_to_icmp_tready),
  .m_axis_tdata(axi_icmp_slice_to_icmp_tdata),
  .m_axis_tkeep(axi_icmp_slice_to_icmp_tkeep),
  .m_axis_tlast(axi_icmp_slice_to_icmp_tlast)
);
// ICMP Output Slice
/*axis_register_slice_64 axis_register_icmp_out_slice(
  .aclk(aclk),
  .aresetn(aresetn),
  .s_axis_tvalid(axi_icmp_to_icmp_slice_tvalid),
  .s_axis_tready(axi_icmp_to_icmp_slice_tready),
  .s_axis_tdata(axi_icmp_to_icmp_slice_tdata),
  .s_axis_tkeep(axi_icmp_to_icmp_slice_tkeep),
  .s_axis_tlast(axi_icmp_to_icmp_slice_tlast),
  .m_axis_tvalid(axi_icmp_slice_to_mie_tvalid),
  .m_axis_tready(axi_icmp_slice_to_mie_tready),
  .m_axis_tdata(axi_icmp_slice_to_mie_tdata),
  .m_axis_tkeep(axi_icmp_slice_to_mie_tkeep),
  .m_axis_tlast(axi_icmp_slice_to_mie_tlast)
);*/
// UDP Input Slice
axis_register_slice_64 axis_register_udp_in_slice(
.aclk(aclk),
.aresetn(aresetn),
.s_axis_tvalid(axi_iph_to_udp_slice_tvalid),
.s_axis_tready(axi_iph_to_udp_slice_tready),
.s_axis_tdata(axi_iph_to_udp_slice_tdata),
.s_axis_tkeep(axi_iph_to_udp_slice_tkeep),
.s_axis_tlast(axi_iph_to_udp_slice_tlast),
.m_axis_tvalid(axi_udp_slice_to_udp_tvalid),
.m_axis_tready(axi_udp_slice_to_udp_tready),
.m_axis_tdata(axi_udp_slice_to_udp_tdata),
.m_axis_tkeep(axi_udp_slice_to_udp_tkeep),
.m_axis_tlast(axi_udp_slice_to_udp_tlast)
);
 // TOE Input Slice
axis_register_slice_64 axis_register_toe_in_slice(
.aclk(aclk),
.aresetn(aresetn),
.s_axis_tvalid(axi_iph_to_toe_slice_tvalid),
.s_axis_tready(axi_iph_to_toe_slice_tready),
.s_axis_tdata(axi_iph_to_toe_slice_tdata),
.s_axis_tkeep(axi_iph_to_toe_slice_tkeep),
.s_axis_tlast(axi_iph_to_toe_slice_tlast),
.m_axis_tvalid(axi_toe_slice_to_toe_tvalid),
.m_axis_tready(axi_toe_slice_to_toe_tready),
.m_axis_tdata(axi_toe_slice_to_toe_tdata),
.m_axis_tkeep(axi_toe_slice_to_toe_tkeep),
.m_axis_tlast(axi_toe_slice_to_toe_tlast)
);
// TOE Output Slice
/*axis_register_slice_64 axis_register_toe_out_slice(
  .aclk(aclk),
  .aresetn(aresetn),
  .s_axis_tvalid(axi_toe_to_toe_slice_tvalid),
  .s_axis_tready(axi_toe_to_toe_slice_tready),
  .s_axis_tdata(axi_toe_to_toe_slice_tdata),
  .s_axis_tkeep(axi_toe_to_toe_slice_tkeep),
  .s_axis_tlast(axi_toe_to_toe_slice_tlast),
  .m_axis_tvalid(axi_toe_slice_to_mie_tvalid),
  .m_axis_tready(axi_toe_slice_to_mie_tready),
  .m_axis_tdata(axi_toe_slice_to_mie_tdata),
  .m_axis_tkeep(axi_toe_slice_to_mie_tkeep),
  .m_axis_tlast(axi_toe_slice_to_mie_tlast)
);*/

//debug

/*reg[3:0] pkg_count;
reg[3:0] port_count;

always @(posedge aclk)
begin
    if (aresetn == 0) begin
        pkg_count <= 0;
        port_count <= 0;
    end
    else begin
        if ((axis_dhcp_tx_data_tvalid == 1'b1) && (axis_dhcp_tx_data_tready == 1'b1)) begin// && (axi_toe_to_toe_slice_tlast == 1'b1)) begin
            pkg_count <= pkg_count + 1;
        end
        if ((axis_dhcp_open_port_status_tvalid == 1'b1) && (axis_dhcp_open_port_status_tready == 1'b1)) begin
            port_count <= port_count + 1;
        end
    end
end

reg[255:0] debug_r;
reg[255:0] debug_r2;


always @(posedge aclk)
begin
   debug_r[0] <= axis_dhcp_rx_data_tvalid;
   debug_r[1] <= axis_dhcp_rx_data_tready;
   debug_r[65:2] <= axis_dhcp_rx_data_tdata;
   debug_r[73:66] <= axis_dhcp_rx_data_tkeep;
   debug_r[74] <= axis_dhcp_rx_data_tlast;

   debug_r[75] <= axi_udp_to_merge_tvalid;
   debug_r[76] <= axi_udp_to_merge_tready;
   debug_r[140:77] <= axi_udp_to_merge_tdata;
   debug_r[148:141] <= axi_udp_to_merge_tkeep;
   debug_r[149] <= axi_udp_to_merge_tlast;

   debug_r[181:150] <= dhcp_ip_address;
   debug_r[182] <= dhcp_ip_address_en;
   debug_r[214:183] <= arp_ip_address;
   /*debug_r[150] <= axi_iph_to_udp_tvalid;
   debug_r[151] <= axi_iph_to_udp_tready;
   debug_r[215:152] <= axi_iph_to_udp_tdata;
   debug_r[223:216] <= axi_iph_to_udp_tkeep;
   debug_r[224] <= axi_iph_to_udp_tlast;

   debug_r[225] <= axis_dhcp_tx_data_tvalid;
   debug_r[226] <= axis_dhcp_tx_data_tready;
   debug_r[242:227] <= axis_dhcp_tx_data_tdata[15:0];
   debug_r[243] <= axis_dhcp_tx_data_tlast;
   
   debug_r[244] <= axis_dhcp_open_port_tvalid;
   debug_r[245] <= axis_dhcp_open_port_tready;
   //debug_r[243] <= axis_arp_lookup_request_TDATA),
   
   debug_r[246] <= axis_dhcp_open_port_status_tvalid;
   debug_r[247] <= axis_dhcp_open_port_status_tready;
   //debug_r[248] <= axis_dhcp_open_port_status_tdata[0];
   
   //debug_r[248] <= axis_txbuffer2tcp_TVALID;
   //debug_r[249] <= axis_txbuffer2tcp_TREADY;
   //debug_r[247] <= axis_txbuffer2tcp_TDATA;
   //debug_r[247] <= axis_txbuffer2tcp_TKEEP;
   //debug_r[250] <= axis_txbuffer2tcp_TLAST;*/

   /*debug_r[251:248] <= port_count;
   debug_r[255:252] <= pkg_count;
   
   debug_r2 <= debug_r;
end

wire [35:0] control0;
wire [35:0] control1;
wire [63:0] vio_signals;
wire [255:0] debug_signal;

assign debug_signal = debug_r2;

icon icon_isnt
(
  .CONTROL0 (control0),
  .CONTROL1 (control1)
);

ila_256 ila_inst
(
    .CLK (aclk),
    .CONTROL (control0),
    .TRIG0 (debug_signal)
);

vio vio_inst
(
    .CLK (aclk),
    .CONTROL (control1),
    .SYNC_OUT (vio_signals)
);*/

endmodule