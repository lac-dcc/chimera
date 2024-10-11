// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////////
//Module Name : mac_top
//Description :
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module mac_top
       (
         input                gmii_tx_clk  ,
         input                gmii_rx_clk  ,
         input                rst_n     ,
         input                video_clk,  
         input  [47:0]        source_mac_addr ,       //source mac address
         input  [7:0]         TTL,
         input  [31:0]        source_ip_addr,
         input  [31:0]        destination_ip_addr,
         input  [15:0]        udp_send_source_port,
         input  [15:0]        udp_send_destination_port,
         



         output               almost_full,
         

         input                arp_request_req,
         output               mac_data_valid,
         output               mac_send_end,
         output [7:0]         mac_tx_data,
         
         input                rx_dv,
         input  [7:0]         mac_rx_datain,
         output [7:0]         udp_rec_ram_rdata ,
         input  [10:0]        udp_rec_ram_read_addr,
         output [15:0]        udp_rec_data_length,
         output               udp_rec_data_valid,
         
         output               arp_found,
         output               mac_not_exist,
//         output  al_full,
         output  emp_sum,
         output  checksum_wr,
         output  wire[10:0]          rec_length,
         output [4:0] use_rd
         
       ) ;
       
       
wire                  arp_reply_ack ;
wire                  arp_reply_req ;
wire  [31:0]          arp_rec_source_ip_addr ;
wire  [47:0]          arp_rec_source_mac_addr ;
wire   [47:0]         destination_mac_addr ;

wire [7:0]            mac_rx_dataout ;
wire [15:0]           upper_layer_data_length ;
wire                  icmp_rx_req ;
wire                  icmp_rev_error ;
wire                  upper_data_req ;
wire                  icmp_tx_ready ;
wire  [7:0]           icmp_tx_data ;
wire                  icmp_tx_end ;
wire                  icmp_tx_req ;
wire                  icmp_tx_ack ;
wire [15:0]           icmp_send_data_length ;

mac_tx_top mac_tx0
           (
            .clk                         (gmii_tx_clk)                  ,
            .rst_n                       (rst_n)  ,
            
            .destination_mac_addr        (destination_mac_addr)   , //destination mac address
            .source_mac_addr             (source_mac_addr)   ,       //source mac address
            .TTL                         (TTL),
            .source_ip_addr              (source_ip_addr),
            .destination_ip_addr         (destination_ip_addr),
            
            .udp_send_source_port        (udp_send_source_port),
            .udp_send_destination_port   (udp_send_destination_port),
            
            .arp_reply_ack               (arp_reply_ack ),
            .arp_reply_req               (arp_reply_req ),
            .arp_rec_source_ip_addr      (arp_rec_source_ip_addr ),
            .arp_rec_source_mac_addr     (arp_rec_source_mac_addr ),
            .arp_request_req             (arp_request_req ),
            

            .almost_full                 (almost_full                ),  
            
            .upper_data_req              (upper_data_req ),
            .icmp_tx_ready               (icmp_tx_ready ),
            .icmp_tx_data                (icmp_tx_data  ),
            .icmp_tx_end                 (icmp_tx_end  ),
            .icmp_tx_req                 (icmp_tx_req  ),
            .icmp_tx_ack                 (icmp_tx_ack  ),
            .icmp_send_data_length       (icmp_send_data_length),
            
            .mac_data_valid              (mac_data_valid),
            .mac_send_end                (mac_send_end),
            .mac_tx_data                 (mac_tx_data),
//         .al_full (al_full),
         .emp_sum (emp_sum),
 .checksum_wr(checksum_wr),
         .use_rd  (use_rd)    
           ) ;
           
           
           
           
           
           
mac_rx_top mac_rx0
           (
            .clk                      (gmii_rx_clk)                  ,
            .rst_n                    (rst_n)  ,
            .video_clk                (video_clk),
            .rx_dv                    (rx_dv   ),
            .mac_rx_datain            (mac_rx_datain ),
            
            .local_ip_addr            (source_ip_addr ),
            .local_mac_addr           (source_mac_addr),
            .arp_reply_ack            (arp_reply_ack ),
            .arp_reply_req            (arp_reply_req ),
            .arp_rec_source_ip_addr   (arp_rec_source_ip_addr ),
            .arp_rec_source_mac_addr  (arp_rec_source_mac_addr ),
            
            .udp_rec_ram_rdata        (udp_rec_ram_rdata),
            .udp_rec_ram_read_addr    (udp_rec_ram_read_addr),
            .udp_rec_data_length      (udp_rec_data_length ),
            .udp_rec_data_valid       (udp_rec_data_valid),
            
            .mac_rx_dataout           (mac_rx_dataout ),
            .upper_layer_data_length  (upper_layer_data_length  ),
            .ip_total_data_length     (icmp_send_data_length),
            .icmp_rx_req              (icmp_rx_req ),
            .icmp_rev_error           (icmp_rev_error ),
            .rec_length               (rec_length),
            .arp_found                (arp_found  )
           ) ;
           
           
icmp_reply icmp0
           (
              .clk                      (gmii_rx_clk)                  ,
              .rst_n                    (rst_n)  ,
              .mac_send_end             (mac_send_end   ),
              .icmp_rx_data             (mac_rx_dataout ),
              .icmp_rx_req              (icmp_rx_req ),
              .icmp_rev_error           (icmp_rev_error ),
              
              .upper_layer_data_length  (upper_layer_data_length  ),
              
              .icmp_data_req            (upper_data_req  ),
              .icmp_tx_ready            (icmp_tx_ready ),
              .icmp_tx_data             (icmp_tx_data  ),
              .icmp_tx_end              (icmp_tx_end  ),
              .ip_tx_ack              (icmp_tx_ack  ),
              .icmp_tx_req              (icmp_tx_req  )
             
             
           );
           
           
arp_cache cache0
(
 .clk                         (gmii_tx_clk),
 .rst_n                       (rst_n),
 .arp_found                   (arp_found  ),
 .arp_rec_source_ip_addr      (arp_rec_source_ip_addr ),
 .arp_rec_source_mac_addr     (arp_rec_source_mac_addr ),
 .destination_ip_addr         (destination_ip_addr),
 .destination_mac_addr        (destination_mac_addr)   ,
 .mac_not_exist               (mac_not_exist )
);
endmodule

