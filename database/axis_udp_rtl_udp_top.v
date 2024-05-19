// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License

`timescale 1ns/1ps

module udp_top (
   input wire         clk,  
   input wire         reset, 

// Device MAC address config 
   input wire [47:0]  CFG_MAC, 
// Device IP address config
   input wire [31:0]  CFG_IP,


// AXI-Stream from Ethernet MAC
   input wire [63:0]  mac_rx_tdata,
   input wire [7:0]   mac_rx_tkeep,
   input wire         mac_rx_tvalid,
   input wire         mac_rx_tuser,
   input wire         mac_rx_tlast,


// AXI-Stream to Ethernet MAC
   output wire [63:0] mac_tx_tdata,
   output wire [7:0]  mac_tx_tkeep,
   output wire        mac_tx_tvalid,
   output wire        mac_tx_tlast,
   input  wire        mac_tx_tready,


// AXI-Stream for inbound UDP traffic
   output wire [63:0] udp_rx_tdata,
   output wire [7:0]  udp_rx_tkeep,
   output wire        udp_rx_tvalid,
   output wire        udp_rx_tlast,
   input  wire        udp_rx_tready,

   output wire [47:0] udp_rx_src_mac,
   output wire [31:0] udp_rx_src_ip,
   output wire [15:0] udp_rx_src_port,
   output wire [15:0] udp_rx_dst_port,


// AXI-Stream for outbound UDP traffic
   input  wire [63:0] udp_tx_tdata,
   input  wire [7:0]  udp_tx_tkeep,
   input  wire        udp_tx_tvalid,
   input  wire        udp_tx_tlast,
   output wire        udp_tx_tready,

   input  wire [47:0] udp_tx_dst_mac,
   input  wire [31:0] udp_tx_dst_ip,
   input  wire [15:0] udp_tx_dst_port,
   input  wire [15:0] udp_tx_src_port
   
);


   rx_udp_ip inst_rx_udp_ip (
      .clk       (clk),
      .reset     (reset),

      .CFG_MAC   (CFG_MAC),
      .CFG_IP    (CFG_IP),

      .rx_tdata  (mac_rx_tdata),
      .rx_tkeep  (mac_rx_tkeep),
      .rx_tvalid (mac_rx_tvalid),
      .rx_tuser  (mac_rx_tuser),
      .rx_tlast  (mac_rx_tlast),


      .tx_tdata  (udp_rx_tdata),
      .tx_tkeep  (udp_rx_tkeep),
      .tx_tvalid (udp_rx_tvalid),
      .tx_tlast  (udp_rx_tlast),
      .tx_tready (udp_rx_tready),

      .src_mac   (udp_rx_src_mac),
      .src_ip    (udp_rx_src_ip),
      .src_udp   (udp_rx_src_port),
      .dst_udp   (udp_rx_dst_port)
   );


   wire [63:0] arb_mux_tx_tdata;
   wire [7:0]  arb_mux_tx_tkeep;
   wire        arb_mux_tx_tvalid;
   wire        arb_mux_tx_tready;
   wire        arb_mux_tx_tlast;

   tx_udp_ip inst_tx_udp_ip(
      .clk       (clk),
      .reset     (reset),

      .CFG_MAC   (CFG_MAC),
      .CFG_IP    (CFG_IP),

      .dst_mac   (udp_tx_dst_mac),
      .dst_ip    (udp_tx_dst_ip),
      .dst_udp   (udp_tx_dst_port),
      .src_udp   (udp_tx_src_port),

      .rx_tdata  (udp_tx_tdata),
      .rx_tkeep  (udp_tx_tkeep),
      .rx_tvalid (udp_tx_tvalid),
      .rx_tlast  (udp_tx_tlast),
      .rx_tready (udp_tx_tready),

      .tx_tdata  (arb_mux_tx_tdata),
      .tx_tkeep  (arb_mux_tx_tkeep),
      .tx_tvalid (arb_mux_tx_tvalid),
      .tx_tlast  (arb_mux_tx_tlast),
      .tx_tready (arb_mux_tx_tready)
   );

   wire [63:0] arp_tx_tdata;
   wire [7:0]  arp_tx_tkeep;
   wire        arp_tx_tready;
   wire        arp_tx_tvalid;
   wire        arp_tx_tlast;

   arp_engine arp_engine(
      .clk       (clk),
      .reset     (reset),

      .rx_tdata  (mac_rx_tdata),
      .rx_tkeep  (mac_rx_tkeep),
      .rx_tvalid (mac_rx_tvalid),
      .rx_tlast  (mac_rx_tlast),

      .tx_tdata  (arp_tx_tdata),
      .tx_tkeep  (arp_tx_tkeep),
      .tx_tready (arp_tx_tready),
      .tx_tvalid (arp_tx_tvalid),
      .tx_tlast  (arp_tx_tlast),

      .CFG_MAC   (CFG_MAC),
      .CFG_IP    (CFG_IP)
   );

   axis_arb_mux #(
       .S_COUNT(2),
       .DATA_WIDTH(64),
       .ID_ENABLE(0),
       .DEST_ENABLE(0),
       .USER_ENABLE(0),
       .ARB_TYPE("PRIORITY"), //"PRIORITY" or "ROUND_ROBIN"
       .LSB_PRIORITY("HIGH")     // "LOW", "HIGH"
     ) axis_arb_mux (
       .clk           (clk),
       .rst           (reset),

       .s_axis_tdata  ({arp_tx_tdata,  arb_mux_tx_tdata}),
       .s_axis_tkeep  ({arp_tx_tkeep,  arb_mux_tx_tkeep}),
       .s_axis_tvalid ({arp_tx_tvalid, arb_mux_tx_tvalid}),
       .s_axis_tready ({arp_tx_tready, arb_mux_tx_tready}),
       .s_axis_tlast  ({arp_tx_tlast,  arb_mux_tx_tlast}),

       .m_axis_tdata  (mac_tx_tdata),
       .m_axis_tkeep  (mac_tx_tkeep),
       .m_axis_tvalid (mac_tx_tvalid),
       .m_axis_tready (mac_tx_tready),
       .m_axis_tlast  (mac_tx_tlast)
     );


endmodule