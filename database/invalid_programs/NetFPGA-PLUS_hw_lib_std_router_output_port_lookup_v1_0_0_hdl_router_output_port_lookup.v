//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2010, 2011 Muhammad Shahbaz
// Copyright (C) 2015 Gianni Antichi, Noa Zilberman, Salvator Galea
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
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

`include "output_port_lookup_cpu_regs_defines.v"

module router_output_port_lookup
#(
   // -- Master AXI Stream Data Width
   parameter C_M_AXIS_DATA_WIDTH	= 512,
   parameter C_S_AXIS_DATA_WIDTH	= 512,
   parameter C_M_AXIS_TUSER_WIDTH	= 128,
   parameter C_S_AXIS_TUSER_WIDTH	= 128,
   
   // -- AXI Registers Data Width
   parameter C_S_AXI_DATA_WIDTH	= 32,          
   parameter C_S_AXI_ADDR_WIDTH	= 12,          
   parameter C_USE_WSTRB		= 0,
   parameter C_DPHASE_TIMEOUT	= 0,               
   parameter C_NUM_ADDRESS_RANGES	= 1,
   parameter C_TOTAL_NUM_CE	= 1,
   parameter C_S_AXI_MIN_SIZE	= 32'h0000_FFFF,
   parameter C_FAMILY		= "virtex7", 
   parameter C_BASEADDR		= 32'h00000000,
   parameter C_HIGHADDR		= 32'h0000FFFF
)
(
   // -- Global Ports
   input                                      axis_aclk,
   input                                      axis_resetn,

   // -- Master Stream Ports (interface to data path)
   output [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_tdata,
   output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
   output [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser,
   output                                     m_axis_tvalid,
   input                                      m_axis_tready,
   output                                     m_axis_tlast,

   // -- Slave Stream Ports (interface to RX queues)
   input [C_S_AXIS_DATA_WIDTH - 1:0]          s_axis_tdata,
   input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0]  s_axis_tkeep,
   input [C_S_AXIS_TUSER_WIDTH-1:0]           s_axis_tuser,
   input                                      s_axis_tvalid,
   output                                     s_axis_tready,
   input                                      s_axis_tlast,


   // -- Slave AXI Ports
   input                                     S_AXI_ACLK,
   input                                     S_AXI_ARESETN,
   input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
   input                                     S_AXI_AWVALID,
   input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
   input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
   input                                     S_AXI_WVALID,
   input                                     S_AXI_BREADY,
   input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
   input                                     S_AXI_ARVALID,
   input                                     S_AXI_RREADY,
   output                                    S_AXI_ARREADY,
   output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
   output     [1 : 0]                        S_AXI_RRESP,
   output                                    S_AXI_RVALID,
   output                                    S_AXI_WREADY,
   output     [1 : 0]                        S_AXI_BRESP,
   output                                    S_AXI_BVALID,
   output                                    S_AXI_AWREADY
);

   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2

  //--------------------- Internal Parameter-------------------------

  localparam NUM_QUEUES        = 8;
  localparam NUM_QUEUES_WIDTH  = log2(NUM_QUEUES);
  localparam LPM_LUT_ROWS      = `MEM_IP_LPM_TCAM_DEPTH;
  localparam LPM_LUT_ROWS_BITS = log2(LPM_LUT_ROWS);
  localparam ARP_LUT_ROWS      = `MEM_IP_ARP_CAM_DEPTH;
  localparam ARP_LUT_ROWS_BITS = log2(ARP_LUT_ROWS);
  localparam FILTER_ROWS       = `MEM_DEST_IP_CAM_DEPTH;
  localparam FILTER_ROWS_BITS  = log2(FILTER_ROWS);


  // -- Signals
 
  wire                                            pkt_sent_from_cpu;
  wire                                            pkt_sent_to_cpu_options_ver;
  wire                                            pkt_sent_to_cpu_bad_ttl;
  wire                                            pkt_sent_to_cpu_dest_ip_hit;
  wire                                            pkt_forwarded;
  wire                                            pkt_dropped_checksum;
  wire                                            pkt_sent_to_cpu_non_ip;
  wire                                            pkt_sent_to_cpu_arp_miss;
  wire                                            pkt_sent_to_cpu_lpm_miss;
  wire                                            pkt_dropped_wrong_dst_mac;

  wire [LPM_LUT_ROWS_BITS-1:0]                    lpm_rd_addr;
  wire                                            lpm_rd_req;
  wire [31:0]                                     lpm_rd_ip;
  wire [31:0]                                     lpm_rd_mask;
  wire [NUM_QUEUES-1:0]                           lpm_rd_oq;
  wire [31:0]                                     lpm_rd_next_hop_ip;
  wire                                            lpm_rd_ack;
  wire [LPM_LUT_ROWS_BITS-1:0]                    lpm_wr_addr;
  wire                                            lpm_wr_req;
  wire [NUM_QUEUES-1:0]                           lpm_wr_oq;
  wire [31:0]                                     lpm_wr_next_hop_ip;
  wire [31:0]                                     lpm_wr_ip;
  wire [31:0]                                     lpm_wr_mask;
  wire                                            lpm_wr_ack;

  wire [ARP_LUT_ROWS_BITS-1:0]                    arp_rd_addr;
  wire                                            arp_rd_req;
  wire  [47:0]                                    arp_rd_mac;
  wire  [31:0]                                    arp_rd_ip;
  wire                                            arp_rd_ack;
  wire [ARP_LUT_ROWS_BITS-1:0]                    arp_wr_addr;
  wire                                            arp_wr_req;
  wire [47:0]                                     arp_wr_mac;
  wire [31:0]                                     arp_wr_ip;
  wire                                            arp_wr_ack;

  wire [FILTER_ROWS_BITS-1:0]                     dest_ip_filter_rd_addr;
  wire                                            dest_ip_filter_rd_req;
  wire [31:0]                                     dest_ip_filter_rd_ip;
  wire                                            dest_ip_filter_rd_ack;
  wire [FILTER_ROWS_BITS-1:0]                     dest_ip_filter_wr_addr;
  wire                                            dest_ip_filter_wr_req;
  wire [31:0]                                     dest_ip_filter_wr_ip;
  wire                                            dest_ip_filter_wr_ack;

  wire [47:0]                                     mac_0;
  wire [47:0]                                     mac_1;
  wire [47:0]                                     mac_2;
  wire [47:0]                                     mac_3;


  reg      [`REG_ID_BITS]                                id_reg;
  reg      [`REG_VERSION_BITS]                           version_reg;
  wire     [`REG_RESET_BITS]                             reset_reg;
  reg      [`REG_FLIP_BITS]                              ip2cpu_flip_reg;
  wire     [`REG_FLIP_BITS]                              cpu2ip_flip_reg;
  reg      [`REG_DEBUG_BITS]                             ip2cpu_debug_reg;
  wire     [`REG_DEBUG_BITS]                             cpu2ip_debug_reg;
  reg      [`REG_PKT_SENT_FROM_CPU_CNTR_BITS]            pkt_sent_from_cpu_cntr_reg;
  wire                                                   pkt_sent_from_cpu_cntr_reg_clear;
  reg      [`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_BITS]  pkt_sent_to_cpu_options_ver_cntr_reg;
  wire                                                   pkt_sent_to_cpu_options_ver_cntr_reg_clear;
  reg      [`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_BITS]      pkt_sent_to_cpu_bad_ttl_cntr_reg;
  wire                                                   pkt_sent_to_cpu_bad_ttl_cntr_reg_clear;
  reg      [`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_BITS]  pkt_sent_to_cpu_dest_ip_hit_cntr_reg;
  wire                                                   pkt_sent_to_cpu_dest_ip_hit_cntr_reg_clear;
  reg      [`REG_PKT_FORWARDED_CNTR_BITS]                pkt_forwarded_cntr_reg;
  wire                                                   pkt_forwarded_cntr_reg_clear;
  reg      [`REG_PKT_DROPPED_CHECKSUM_CNTR_BITS]         pkt_dropped_checksum_cntr_reg;
  wire                                                   pkt_dropped_checksum_cntr_reg_clear;
  reg      [`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_BITS]       pkt_sent_to_cpu_non_ip_cntr_reg;
  wire                                                   pkt_sent_to_cpu_non_ip_cntr_reg_clear;
  reg      [`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_BITS]     pkt_sent_to_cpu_arp_miss_cntr_reg;
  wire                                                   pkt_sent_to_cpu_arp_miss_cntr_reg_clear;
  reg      [`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_BITS]     pkt_sent_to_cpu_lpm_miss_cntr_reg;
  wire                                                   pkt_sent_to_cpu_lpm_miss_cntr_reg_clear;
  reg      [`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_BITS]    pkt_dropped_wrong_dst_mac_cntr_reg;
  wire                                                   pkt_dropped_wrong_dst_mac_cntr_reg_clear;
  wire     [`REG_MAC_0_HI_BITS]                          mac_0_hi_reg;
  wire     [`REG_MAC_0_LOW_BITS]                         mac_0_low_reg;
  wire     [`REG_MAC_1_HI_BITS]                          mac_1_hi_reg;
  wire     [`REG_MAC_1_LOW_BITS]                         mac_1_low_reg;
  wire     [`REG_MAC_2_HI_BITS]                          mac_2_hi_reg;
  wire     [`REG_MAC_2_LOW_BITS]                         mac_2_low_reg;
  wire     [`REG_MAC_3_HI_BITS]                          mac_3_hi_reg;
  wire     [`REG_MAC_3_LOW_BITS]                         mac_3_low_reg;
  wire     [`MEM_IP_LPM_TCAM_ADDR_BITS]                  ip_lpm_tcam_addr;
  wire     [127:0]                                       ip_lpm_tcam_data;
  wire                                                   ip_lpm_tcam_rd_wrn;
  wire                                                   ip_lpm_tcam_cmd_valid;
  reg      [127:0]                                       ip_lpm_tcam_reply;
  reg                                                    ip_lpm_tcam_reply_valid;
  wire     [`MEM_IP_ARP_CAM_ADDR_BITS]                   ip_arp_cam_addr;
  wire     [127:0]                                       ip_arp_cam_data;
  wire                                                   ip_arp_cam_rd_wrn;
  wire                                                   ip_arp_cam_cmd_valid;
  reg      [127:0]                                       ip_arp_cam_reply;
  reg                                                    ip_arp_cam_reply_valid;
  wire     [`MEM_DEST_IP_CAM_ADDR_BITS]                  dest_ip_cam_addr;
  wire     [127:0]                                       dest_ip_cam_data;
  wire                                                   dest_ip_cam_rd_wrn;
  wire                                                   dest_ip_cam_cmd_valid;
  reg      [127:0]                                       dest_ip_cam_reply;
  reg                                                    dest_ip_cam_reply_valid;

  wire                                                   clear_counters;
  wire                                                   reset_registers;
  wire     [3:0]                                         reset_tables;

     
   assign mac_0	=	{mac_0_hi_reg[15:0],mac_0_low_reg};
   assign mac_1	=	{mac_1_hi_reg[15:0],mac_1_low_reg};
   assign mac_2	=	{mac_2_hi_reg[15:0],mac_2_low_reg};
   assign mac_3	=	{mac_3_hi_reg[15:0],mac_3_low_reg};

   // -- Signals for the Registers Table Interface  
   // -- Read signals for ip_lpm_tcam
   assign lpm_rd_req		=	ip_lpm_tcam_cmd_valid & ip_lpm_tcam_rd_wrn;
   assign lpm_rd_addr		=	lpm_rd_req ? ip_lpm_tcam_addr[LPM_LUT_ROWS_BITS-1:0] 	: {LPM_LUT_ROWS_BITS{1'b0}};
   // -- Write signals for ip_lpm_tcam
   assign lpm_wr_req		=	ip_lpm_tcam_cmd_valid & ~ip_lpm_tcam_rd_wrn;
   assign lpm_wr_addr		=	lpm_wr_req ? ip_lpm_tcam_addr[LPM_LUT_ROWS_BITS-1:0] 	: {LPM_LUT_ROWS_BITS{1'b0}};
   assign lpm_wr_ip		=	lpm_wr_req ? ip_lpm_tcam_data[127:96] 	: 32'b0;
   assign lpm_wr_next_hop_ip	=	lpm_wr_req ? ip_lpm_tcam_data[95:64] 	: 32'b0;
   assign lpm_wr_mask		=	lpm_wr_req ? ip_lpm_tcam_data[63:32] 	: 32'b0;
   assign lpm_wr_oq		=	lpm_wr_req ? ip_lpm_tcam_data[7:0] 	: 8'b0;

   // -- Read signals for ip_arp_cam
   assign arp_rd_req		=	ip_arp_cam_cmd_valid & ip_arp_cam_rd_wrn;
   assign arp_rd_addr		=	arp_rd_req ? ip_arp_cam_addr[ARP_LUT_ROWS_BITS-1:0] : {ARP_LUT_ROWS_BITS{1'b0}};
   // -- Write signals for ip_arp_cam
   assign arp_wr_req        	=	ip_arp_cam_cmd_valid & ~ip_arp_cam_rd_wrn;
   assign arp_wr_addr     	=	arp_wr_req ? ip_arp_cam_addr[ARP_LUT_ROWS_BITS-1:0] 	: {ARP_LUT_ROWS_BITS{1'b0}};
   assign arp_wr_mac        	=	arp_wr_req ? ip_arp_cam_data[111:64] 	: 48'b0;
   assign arp_wr_ip         	=	arp_wr_req ? ip_arp_cam_data[31:0] 	: 32'b0;

   // -- Read signals for dest_ip_cam
   assign dest_ip_filter_rd_req		=	dest_ip_cam_cmd_valid & dest_ip_cam_rd_wrn;
   assign dest_ip_filter_rd_addr	=	dest_ip_filter_rd_req ? dest_ip_cam_addr[FILTER_ROWS_BITS-1:0] : {FILTER_ROWS_BITS{1'b0}};
   // -- Write signals for dest_ip_cam
   assign dest_ip_filter_wr_req 	=	dest_ip_cam_cmd_valid & ~dest_ip_cam_rd_wrn;
   assign dest_ip_filter_wr_addr  	=	dest_ip_filter_wr_req ? dest_ip_cam_addr[FILTER_ROWS_BITS-1:0] 	: {FILTER_ROWS_BITS{1'b0}};
   assign dest_ip_filter_wr_ip   	=       dest_ip_filter_wr_req ? dest_ip_cam_data[31:0] 	: 32'b0;

  // -- Read signals for ip_lpm_tcam, ip_arp_cam, dest_ip_cam
  always @(posedge axis_aclk)  begin
	if (~resetn_sync) begin
	  	dest_ip_cam_reply		<=	128'b0;
	  	dest_ip_cam_reply_valid		<=	1'b0;
		ip_arp_cam_reply		<=	128'b0;
		ip_arp_cam_reply_valid		<=	1'b0;
		ip_lpm_tcam_reply		<=	128'b0;
		ip_lpm_tcam_reply_valid		<=	1'b0;
	end
	else begin
		dest_ip_cam_reply	<= dest_ip_filter_rd_ack ? {{96{1'b0}},dest_ip_filter_rd_ip} : dest_ip_cam_reply;
  		dest_ip_cam_reply_valid	<= dest_ip_filter_rd_ack ? 1'b1 : 1'b0;
		ip_arp_cam_reply 	<= arp_rd_ack ? {{16{1'b0}},arp_rd_mac,{32{1'b0}},arp_rd_ip} : ip_arp_cam_reply;
		ip_arp_cam_reply_valid	<= arp_rd_ack ? 1'b1 : 1'b0;
		ip_lpm_tcam_reply	<= lpm_rd_ack ? {lpm_rd_ip,lpm_rd_next_hop_ip,lpm_rd_mask,{24{1'b0}},lpm_rd_oq} : ip_lpm_tcam_reply;
		ip_lpm_tcam_reply_valid <= lpm_rd_ack ? 1'b1 : 1'b0;
	end
  end

  

  // -- Router
  output_port_lookup #
  (
    .C_M_AXIS_DATA_WIDTH  (C_M_AXIS_DATA_WIDTH),
    .C_S_AXIS_DATA_WIDTH  (C_S_AXIS_DATA_WIDTH),
    .C_M_AXIS_TUSER_WIDTH (C_M_AXIS_TUSER_WIDTH),
    .C_S_AXIS_TUSER_WIDTH (C_S_AXIS_TUSER_WIDTH),
    .NUM_OUTPUT_QUEUES    (NUM_QUEUES),
    .LPM_LUT_DEPTH        (LPM_LUT_ROWS),
    .ARP_LUT_DEPTH        (ARP_LUT_ROWS),
    .FILTER_DEPTH         (FILTER_ROWS)
   ) output_port_lookup
  (
    // -- Global Ports
    .axis_aclk      (axis_aclk),
    .axis_resetn    (axis_resetn),

    // -- Master Stream Ports (interface to data path)
    .m_axis_tdata  (m_axis_tdata),
    .m_axis_tkeep  (m_axis_tkeep),
    .m_axis_tuser  (m_axis_tuser),
    .m_axis_tvalid (m_axis_tvalid), 
    .m_axis_tready (m_axis_tready),
    .m_axis_tlast  (m_axis_tlast),

    // -- Slave Stream Ports (interface to RX queues)
    .s_axis_tdata  (s_axis_tdata),
    .s_axis_tkeep  (s_axis_tkeep),
    .s_axis_tuser  (s_axis_tuser),
    .s_axis_tvalid (s_axis_tvalid),
    .s_axis_tready (s_axis_tready),
    .s_axis_tlast  (s_axis_tlast),

    // -- Interface to op_lut_process_sm
    .pkt_sent_from_cpu            (pkt_sent_from_cpu),
    .pkt_sent_to_cpu_options_ver  (pkt_sent_to_cpu_options_ver), 
    .pkt_sent_to_cpu_bad_ttl      (pkt_sent_to_cpu_bad_ttl),     
    .pkt_sent_to_cpu_dest_ip_hit  (pkt_sent_to_cpu_dest_ip_hit), 
    .pkt_forwarded                (pkt_forwarded),          
    .pkt_dropped_checksum         (pkt_dropped_checksum),        
    .pkt_sent_to_cpu_non_ip       (pkt_sent_to_cpu_non_ip),      
    .pkt_sent_to_cpu_arp_miss     (pkt_sent_to_cpu_arp_miss),    
    .pkt_sent_to_cpu_lpm_miss     (pkt_sent_to_cpu_lpm_miss),    
    .pkt_dropped_wrong_dst_mac    (pkt_dropped_wrong_dst_mac),

    // -- Interface to ip_lpm
    .lpm_rd_addr                  (lpm_rd_addr),          
    .lpm_rd_req                   (lpm_rd_req),           
    .lpm_rd_ip                    (lpm_rd_ip),            
    .lpm_rd_mask                  (lpm_rd_mask),          
    .lpm_rd_oq                    (lpm_rd_oq),            
    .lpm_rd_next_hop_ip           (lpm_rd_next_hop_ip),   
    .lpm_rd_ack                   (lpm_rd_ack),           
    .lpm_wr_addr                  (lpm_wr_addr),
    .lpm_wr_req                   (lpm_wr_req),
    .lpm_wr_oq                    (lpm_wr_oq),
    .lpm_wr_next_hop_ip           (lpm_wr_next_hop_ip),   
    .lpm_wr_ip                    (lpm_wr_ip),            
    .lpm_wr_mask                  (lpm_wr_mask),
    .lpm_wr_ack                   (lpm_wr_ack),

    // -- Interface to ip_arp
    .arp_rd_addr                  (arp_rd_addr),        
    .arp_rd_req                   (arp_rd_req),         
    .arp_rd_mac                   (arp_rd_mac),         
    .arp_rd_ip                    (arp_rd_ip),          
    .arp_rd_ack                   (arp_rd_ack),         
    .arp_wr_addr                  (arp_wr_addr),
    .arp_wr_req                   (arp_wr_req),
    .arp_wr_mac                   (arp_wr_mac),
    .arp_wr_ip                    (arp_wr_ip),          
    .arp_wr_ack                   (arp_wr_ack),

    // -- Interface to dest_ip_filter
    .dest_ip_filter_rd_addr       (dest_ip_filter_rd_addr),  
    .dest_ip_filter_rd_req        (dest_ip_filter_rd_req),   
    .dest_ip_filter_rd_ip         (dest_ip_filter_rd_ip),    
    .dest_ip_filter_rd_ack        (dest_ip_filter_rd_ack),   
    .dest_ip_filter_wr_addr       (dest_ip_filter_wr_addr),
    .dest_ip_filter_wr_req        (dest_ip_filter_wr_req),
    .dest_ip_filter_wr_ip         (dest_ip_filter_wr_ip),    
    .dest_ip_filter_wr_ack        (dest_ip_filter_wr_ack),

    // -- Interface to eth_parser
    .mac_0                        (mac_0),
    .mac_1                        (mac_1),
    .mac_2                        (mac_2),
    .mac_3                        (mac_3),

    // --- Reset to Register Tables ( {dest_ip_cam,ip_arp_cam,ip_lpm_tcam,-} )
    .reset_tables		  (reset_tables)
  );



 // --- Registers section
 output_port_lookup_cpu_regs 
 #(
   .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
   .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
   .C_BASE_ADDRESS    (C_BASEADDR)
 ) opl_cpu_regs_inst
 (   
    // General ports
    .clk                    (axis_aclk),
    .resetn                 (axis_resetn),
    // AXI Lite ports
    .S_AXI_ACLK             (S_AXI_ACLK),
    .S_AXI_ARESETN          (S_AXI_ARESETN),
    .S_AXI_AWADDR           (S_AXI_AWADDR),
    .S_AXI_AWVALID          (S_AXI_AWVALID),
    .S_AXI_WDATA            (S_AXI_WDATA),
    .S_AXI_WSTRB            (S_AXI_WSTRB),
    .S_AXI_WVALID           (S_AXI_WVALID),
    .S_AXI_BREADY           (S_AXI_BREADY),
    .S_AXI_ARADDR           (S_AXI_ARADDR),
    .S_AXI_ARVALID          (S_AXI_ARVALID),
    .S_AXI_RREADY           (S_AXI_RREADY),
    .S_AXI_ARREADY          (S_AXI_ARREADY),
    .S_AXI_RDATA            (S_AXI_RDATA),
    .S_AXI_RRESP            (S_AXI_RRESP),
    .S_AXI_RVALID           (S_AXI_RVALID),
    .S_AXI_WREADY           (S_AXI_WREADY),
    .S_AXI_BRESP            (S_AXI_BRESP),
    .S_AXI_BVALID           (S_AXI_BVALID),
    .S_AXI_AWREADY          (S_AXI_AWREADY),

    // Register ports
   .id_reg          				(id_reg),
   .version_reg          			(version_reg),
   .reset_reg          				(reset_reg),
   .ip2cpu_flip_reg          			(ip2cpu_flip_reg),
   .cpu2ip_flip_reg          			(cpu2ip_flip_reg),
   .ip2cpu_debug_reg          			(ip2cpu_debug_reg),
   .cpu2ip_debug_reg          			(cpu2ip_debug_reg),
   .pkt_sent_from_cpu_cntr_reg          	(pkt_sent_from_cpu_cntr_reg),
   .pkt_sent_from_cpu_cntr_reg_clear    	(pkt_sent_from_cpu_cntr_reg_clear),
   .pkt_sent_to_cpu_options_ver_cntr_reg        (pkt_sent_to_cpu_options_ver_cntr_reg),
   .pkt_sent_to_cpu_options_ver_cntr_reg_clear  (pkt_sent_to_cpu_options_ver_cntr_reg_clear),
   .pkt_sent_to_cpu_bad_ttl_cntr_reg          	(pkt_sent_to_cpu_bad_ttl_cntr_reg),
   .pkt_sent_to_cpu_bad_ttl_cntr_reg_clear    	(pkt_sent_to_cpu_bad_ttl_cntr_reg_clear),
   .pkt_sent_to_cpu_dest_ip_hit_cntr_reg        (pkt_sent_to_cpu_dest_ip_hit_cntr_reg),
   .pkt_sent_to_cpu_dest_ip_hit_cntr_reg_clear  (pkt_sent_to_cpu_dest_ip_hit_cntr_reg_clear),
   .pkt_forwarded_cntr_reg         		(pkt_forwarded_cntr_reg),
   .pkt_forwarded_cntr_reg_clear    		(pkt_forwarded_cntr_reg_clear),
   .pkt_dropped_checksum_cntr_reg          	(pkt_dropped_checksum_cntr_reg),
   .pkt_dropped_checksum_cntr_reg_clear    	(pkt_dropped_checksum_cntr_reg_clear),
   .pkt_sent_to_cpu_non_ip_cntr_reg          	(pkt_sent_to_cpu_non_ip_cntr_reg),
   .pkt_sent_to_cpu_non_ip_cntr_reg_clear    	(pkt_sent_to_cpu_non_ip_cntr_reg_clear),
   .pkt_sent_to_cpu_arp_miss_cntr_reg           (pkt_sent_to_cpu_arp_miss_cntr_reg),
   .pkt_sent_to_cpu_arp_miss_cntr_reg_clear     (pkt_sent_to_cpu_arp_miss_cntr_reg_clear),
   .pkt_sent_to_cpu_lpm_miss_cntr_reg           (pkt_sent_to_cpu_lpm_miss_cntr_reg),
   .pkt_sent_to_cpu_lpm_miss_cntr_reg_clear     (pkt_sent_to_cpu_lpm_miss_cntr_reg_clear),
   .pkt_dropped_wrong_dst_mac_cntr_reg          (pkt_dropped_wrong_dst_mac_cntr_reg),
   .pkt_dropped_wrong_dst_mac_cntr_reg_clear    (pkt_dropped_wrong_dst_mac_cntr_reg_clear),
   .mac_0_hi_reg          			(mac_0_hi_reg),
   .mac_0_low_reg          			(mac_0_low_reg),
   .mac_1_hi_reg          			(mac_1_hi_reg),
   .mac_1_low_reg          			(mac_1_low_reg),
   .mac_2_hi_reg          			(mac_2_hi_reg),
   .mac_2_low_reg          			(mac_2_low_reg),
   .mac_3_hi_reg          			(mac_3_hi_reg),
   .mac_3_low_reg          			(mac_3_low_reg),
    // -- Register Table ports
   .ip_lpm_tcam_addr          			(ip_lpm_tcam_addr),
   .ip_lpm_tcam_data          			(ip_lpm_tcam_data),
   .ip_lpm_tcam_rd_wrn        			(ip_lpm_tcam_rd_wrn),
   .ip_lpm_tcam_cmd_valid     			(ip_lpm_tcam_cmd_valid),
   .ip_lpm_tcam_reply         			(ip_lpm_tcam_reply),
   .ip_lpm_tcam_reply_valid   			(ip_lpm_tcam_reply_valid),
   .ip_arp_cam_addr           			(ip_arp_cam_addr),
   .ip_arp_cam_data           			(ip_arp_cam_data),
   .ip_arp_cam_rd_wrn         			(ip_arp_cam_rd_wrn),
   .ip_arp_cam_cmd_valid      			(ip_arp_cam_cmd_valid),
   .ip_arp_cam_reply          			(ip_arp_cam_reply),
   .ip_arp_cam_reply_valid    			(ip_arp_cam_reply_valid),
   .dest_ip_cam_addr          			(dest_ip_cam_addr),
   .dest_ip_cam_data          			(dest_ip_cam_data),
   .dest_ip_cam_rd_wrn        			(dest_ip_cam_rd_wrn),
   .dest_ip_cam_cmd_valid     			(dest_ip_cam_cmd_valid),
   .dest_ip_cam_reply         			(dest_ip_cam_reply),
   .dest_ip_cam_reply_valid   			(dest_ip_cam_reply_valid),

   // Global Registers - user can select if to use
   .cpu_resetn_soft	(),		//software reset, after cpu module
   .resetn_soft    	(),		//software reset to cpu module (from central reset management)
   .resetn_sync    	(resetn_sync)	//synchronized reset, use for better timing
);

   assign clear_counters =  reset_reg[0];
   assign reset_registers = reset_reg[4];
   assign reset_tables   =  reset_reg[11:8];


always @(posedge axis_aclk)
	if (~resetn_sync | reset_registers) begin
		id_reg 					<= #1	 `REG_ID_DEFAULT;
		version_reg 				<= #1    `REG_VERSION_DEFAULT;
		ip2cpu_flip_reg 			<= #1    `REG_FLIP_DEFAULT;
		ip2cpu_debug_reg 			<= #1    `REG_DEBUG_DEFAULT;
		pkt_sent_from_cpu_cntr_reg 		<= #1    `REG_PKT_SENT_FROM_CPU_CNTR_DEFAULT;
		pkt_sent_to_cpu_options_ver_cntr_reg 	<= #1    `REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_DEFAULT;
		pkt_sent_to_cpu_bad_ttl_cntr_reg 	<= #1    `REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_DEFAULT;
		pkt_sent_to_cpu_dest_ip_hit_cntr_reg 	<= #1    `REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_DEFAULT;
		pkt_forwarded_cntr_reg 			<= #1    `REG_PKT_FORWARDED_CNTR_DEFAULT;
		pkt_dropped_checksum_cntr_reg 		<= #1    `REG_PKT_DROPPED_CHECKSUM_CNTR_DEFAULT;
		pkt_sent_to_cpu_non_ip_cntr_reg 	<= #1    `REG_PKT_SENT_TO_CPU_NON_IP_CNTR_DEFAULT;
		pkt_sent_to_cpu_arp_miss_cntr_reg 	<= #1    `REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_DEFAULT;
		pkt_sent_to_cpu_lpm_miss_cntr_reg 	<= #1    `REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_DEFAULT;
		pkt_dropped_wrong_dst_mac_cntr_reg 	<= #1    `REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_DEFAULT;
	end
	else begin
		id_reg 			<= #1    `REG_ID_DEFAULT;
		version_reg 		<= #1    `REG_VERSION_DEFAULT;
		ip2cpu_flip_reg 	<= #1    ~cpu2ip_flip_reg;
		ip2cpu_debug_reg 	<= #1    `REG_DEBUG_DEFAULT+cpu2ip_debug_reg;


		// -- pkt_sent_from_cpu counter
		pkt_sent_from_cpu_cntr_reg[`REG_PKT_SENT_FROM_CPU_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_from_cpu_cntr_reg_clear) ? 'h0 : pkt_sent_from_cpu_cntr_reg[`REG_PKT_SENT_FROM_CPU_CNTR_WIDTH - 2 : 0] + pkt_sent_from_cpu;
		pkt_sent_from_cpu_cntr_reg[`REG_PKT_SENT_FROM_CPU_CNTR_WIDTH - 1 : 0]	<=	(clear_counters | pkt_sent_from_cpu_cntr_reg_clear) ? 1'b1 : pkt_sent_from_cpu & (pkt_sent_from_cpu_cntr_reg[`REG_PKT_SENT_FROM_CPU_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_FROM_CPU_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_from_cpu_cntr_reg[`REG_PKT_SENT_FROM_CPU_CNTR_WIDTH - 1];


		// -- pkt_sent_to_cpu_options_ver counter
		pkt_sent_to_cpu_options_ver_cntr_reg[`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_to_cpu_options_ver_cntr_reg_clear) ? 'h0 : pkt_sent_to_cpu_options_ver_cntr_reg[`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_WIDTH - 2 : 0] + pkt_sent_to_cpu_options_ver;
		pkt_sent_to_cpu_options_ver_cntr_reg[`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_WIDTH - 1]		<=	(clear_counters | pkt_sent_to_cpu_options_ver_cntr_reg_clear) ? 1'b0 : pkt_sent_to_cpu_options_ver & (pkt_sent_to_cpu_options_ver_cntr_reg[`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_to_cpu_options_ver_cntr_reg[`REG_PKT_SENT_TO_CPU_OPTIONS_VER_CNTR_WIDTH - 1];


		// -- pkt_sent_to_cpu_bad_ttl counter
		pkt_sent_to_cpu_bad_ttl_cntr_reg[`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_to_cpu_bad_ttl_cntr_reg_clear) ? 'h0 : pkt_sent_to_cpu_bad_ttl_cntr_reg[`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_WIDTH - 2 : 0] + pkt_sent_to_cpu_bad_ttl;
		pkt_sent_to_cpu_bad_ttl_cntr_reg[`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_WIDTH - 1]		<=	(clear_counters | pkt_sent_to_cpu_bad_ttl_cntr_reg_clear) ? 1'b0 : pkt_sent_to_cpu_bad_ttl & (pkt_sent_to_cpu_bad_ttl_cntr_reg[`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_to_cpu_bad_ttl_cntr_reg[`REG_PKT_SENT_TO_CPU_BAD_TTL_CNTR_WIDTH - 1];


		// -- pkt_sent_to_cpu_dest_ip_hit counter
		pkt_sent_to_cpu_dest_ip_hit_cntr_reg[`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_to_cpu_dest_ip_hit_cntr_reg_clear) ? 'h0 : pkt_sent_to_cpu_dest_ip_hit_cntr_reg[`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_WIDTH - 2 : 0] + pkt_sent_to_cpu_dest_ip_hit;
		pkt_sent_to_cpu_dest_ip_hit_cntr_reg[`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_WIDTH - 1]		<=	(clear_counters | pkt_sent_to_cpu_dest_ip_hit_cntr_reg_clear) ? 1'b0 : pkt_sent_to_cpu_dest_ip_hit & (pkt_sent_to_cpu_dest_ip_hit_cntr_reg[`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_to_cpu_dest_ip_hit_cntr_reg[`REG_PKT_SENT_TO_CPU_DEST_IP_HIT_CNTR_WIDTH - 1];


		// -- pkt_forwarded counter
		pkt_forwarded_cntr_reg[`REG_PKT_FORWARDED_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_forwarded_cntr_reg_clear) ? 'h0 : pkt_forwarded_cntr_reg[`REG_PKT_FORWARDED_CNTR_WIDTH - 2 : 0] + pkt_forwarded;
		pkt_forwarded_cntr_reg[`REG_PKT_FORWARDED_CNTR_WIDTH - 1]	<=	(clear_counters | pkt_forwarded_cntr_reg_clear) ? 1'b0 : pkt_forwarded & (pkt_forwarded_cntr_reg[`REG_PKT_FORWARDED_CNTR_WIDTH - 2 : 0] + (1'b1) > {(`REG_PKT_FORWARDED_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_forwarded_cntr_reg[`REG_PKT_FORWARDED_CNTR_WIDTH - 1];


		// -- pkt_dropped_checksum counter
		pkt_dropped_checksum_cntr_reg[`REG_PKT_DROPPED_CHECKSUM_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_dropped_checksum_cntr_reg_clear) ? 'h0 : pkt_dropped_checksum_cntr_reg[`REG_PKT_DROPPED_CHECKSUM_CNTR_WIDTH - 2 : 0] + pkt_dropped_checksum;
		pkt_dropped_checksum_cntr_reg[`REG_PKT_DROPPED_CHECKSUM_CNTR_WIDTH - 1 ]	<=	(clear_counters | pkt_dropped_checksum_cntr_reg_clear) ? 1'b0 : pkt_dropped_checksum & (pkt_dropped_checksum_cntr_reg[`REG_PKT_DROPPED_CHECKSUM_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_DROPPED_CHECKSUM_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_dropped_checksum_cntr_reg[`REG_PKT_DROPPED_CHECKSUM_CNTR_WIDTH - 1];


		// -- pkt_sent_to_cpu_non_ip counter
		pkt_sent_to_cpu_non_ip_cntr_reg[`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_to_cpu_non_ip_cntr_reg_clear) ? 'h0 : pkt_sent_to_cpu_non_ip_cntr_reg[`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_WIDTH - 2 : 0] + pkt_sent_to_cpu_non_ip;
		pkt_sent_to_cpu_non_ip_cntr_reg[`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_WIDTH - 1 ]	<=	(clear_counters | pkt_sent_to_cpu_non_ip_cntr_reg_clear) ? 1'b0 : pkt_sent_to_cpu_non_ip & (pkt_sent_to_cpu_non_ip_cntr_reg[`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_to_cpu_non_ip_cntr_reg[`REG_PKT_SENT_TO_CPU_NON_IP_CNTR_WIDTH - 1];
		

		// -- pkt_sent_to_cpu_arp_miss counter
		pkt_sent_to_cpu_arp_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_to_cpu_arp_miss_cntr_reg_clear) ? 'h0 : pkt_sent_to_cpu_arp_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_WIDTH - 2 : 0] + pkt_sent_to_cpu_arp_miss;
		pkt_sent_to_cpu_arp_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_WIDTH - 1 ]	<=	(clear_counters | pkt_sent_to_cpu_arp_miss_cntr_reg_clear) ? 1'b0 : pkt_sent_to_cpu_arp_miss & (pkt_sent_to_cpu_arp_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_to_cpu_arp_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_ARP_MISS_CNTR_WIDTH - 1];


		// -- pkt_sent_to_cpu_lpm_miss counter
		pkt_sent_to_cpu_lpm_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_sent_to_cpu_lpm_miss_cntr_reg_clear) ? 'h0 : pkt_sent_to_cpu_lpm_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_WIDTH - 2 : 0] + pkt_sent_to_cpu_lpm_miss;
		pkt_sent_to_cpu_lpm_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_WIDTH - 1 ]	<=	(clear_counters | pkt_sent_to_cpu_lpm_miss_cntr_reg_clear) ? 1'b0 : pkt_sent_to_cpu_lpm_miss & (pkt_sent_to_cpu_lpm_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_sent_to_cpu_lpm_miss_cntr_reg[`REG_PKT_SENT_TO_CPU_LPM_MISS_CNTR_WIDTH - 1];


		// -- pkt_dropped_wrong_dst_mac counter
		pkt_dropped_wrong_dst_mac_cntr_reg[`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_WIDTH - 2 : 0]	<=	(clear_counters | pkt_dropped_wrong_dst_mac_cntr_reg_clear) ? 'h0 : pkt_dropped_wrong_dst_mac_cntr_reg[`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_WIDTH - 2 : 0] + pkt_dropped_wrong_dst_mac;
		pkt_dropped_wrong_dst_mac_cntr_reg[`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_WIDTH - 1 ]	<=	(clear_counters | pkt_dropped_wrong_dst_mac_cntr_reg_clear) ? 1'b0 : pkt_dropped_wrong_dst_mac & (pkt_dropped_wrong_dst_mac_cntr_reg[`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_WIDTH - 2 : 0] + 1'b1 > {(`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_WIDTH-1){1'b1}}) ? 1'b1 : pkt_dropped_wrong_dst_mac_cntr_reg[`REG_PKT_DROPPED_WRONG_DST_MAC_CNTR_WIDTH - 1];

end



   
endmodule // output_port_lookup

