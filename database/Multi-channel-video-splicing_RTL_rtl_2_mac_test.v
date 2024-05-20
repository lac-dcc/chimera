// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale 1 ns/1 ns
module mac_test
(
 input                rst_n  ,       
 input                gmii_tx_clk ,
 input                gmii_rx_clk ,
 input                gmii_rx_dv,
 input  [7:0]         gmii_rxd,
 output reg           gmii_tx_en,
 output reg [7:0]     gmii_txd,
 input                video_clk,   
 output               write_sel,
 output               udp_rec_data_valid,
 output               al_full,
 output               emp_sum,
 output               checksum_wr,
 output [4:0]         use_rd,
 output [7:0]         udp_rec_ram_rdata ,//ram¶ÁÊý¾Ý
 input [10:0]         udp_rec_ram_read_addr ,//ram¶ÁµØÖ·
 output  [10:0]       rec_length,
 output [15:0]        udp_rec_data_length
);

localparam UDP_WIDTH = 32 ;
localparam UDP_DEPTH = 5 ;


wire  [10:0]         length;
reg                  gmii_rx_dv_d0 ;
reg   [7:0]          gmii_rxd_d0 ;
wire                 gmii_tx_en_tmp ;
wire   [7:0]         gmii_txd_tmp ;


wire  [7:0]          tx_ram_wr_data ;
wire                 tx_ram_wr_en ;
wire                 arp_request_req ;
wire                 mac_send_end ;
wire                 key_flag;

wire [15:0]          udp_rec_data_length ;
wire                 udp_rec_data_valid ;
wire                 almost_full ;
reg                  udp_ram_wr_en ;
reg  [31:0]          wait_cnt ;
reg  write_sel ;
wire mac_not_exist ;
wire arp_found ;

parameter IDLE          = 6'b000_001 ;
parameter ARP_REQ       = 6'b000_010 ;
parameter ARP_SEND      = 6'b000_100 ;
parameter ARP_WAIT      = 6'b001_000 ;
parameter WAIT_REC      = 6'b010_000 ;
parameter CHECK_ARP     = 6'b100_000 ;



reg [5:0]    state  ;
reg [5:0]    next_state ;
reg  [15:0]  ram_cnt ;
reg    almost_full_d1 ;
always @(posedge gmii_tx_clk or negedge rst_n)
  begin
    if (~rst_n)
      state  <=  IDLE  ;
    else
      state  <= next_state ;
  end
  
always @(*)
  begin
    case(state)
      IDLE        :
        begin
        if (wait_cnt == 32'd125_000_000)    //1s
            next_state <= ARP_REQ ;
          else
            next_state <= IDLE ;
        end

      ARP_REQ     :
        next_state <= ARP_SEND ;
      ARP_SEND    :
        begin
          if (mac_send_end)
            next_state <= ARP_WAIT ;
          else
            next_state <= ARP_SEND ;
        end
      ARP_WAIT    :
        begin
          if (arp_found)
            next_state <= WAIT_REC ;
          else if (wait_cnt == 32'd125_000_000)
            next_state <= ARP_REQ ;
          else
            next_state <= ARP_WAIT ;
        end
        
        
      WAIT_REC       :
        begin
		  if (wait_cnt == 32'd125_000_000)    //1s
            next_state <= CHECK_ARP ;
          else
            next_state <= WAIT_REC ;
        end
      CHECK_ARP   :
        begin
          if (mac_not_exist)
            next_state <= ARP_REQ ;
          else if (almost_full_d1)
            next_state <= CHECK_ARP ;
          else
            next_state <= WAIT_REC ;
        end
      default     :
        next_state <= IDLE ;
    endcase
  end
  

assign length               = rec_length;

always@(posedge gmii_rx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        gmii_rx_dv_d0 <= 1'b0 ;
        gmii_rxd_d0   <= 8'd0 ;
      end
    else
      begin
        gmii_rx_dv_d0 <= gmii_rx_dv ;
        gmii_rxd_d0   <= gmii_rxd ;
      end
  end
  
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        gmii_tx_en <= 1'b0 ;
        gmii_txd   <= 8'd0 ;
      end
    else
      begin
        gmii_tx_en <= gmii_tx_en_tmp ;
        gmii_txd   <= gmii_txd_tmp ;
      end
  end



  
mac_top mac_top0
(
 .gmii_tx_clk                 (gmii_tx_clk)                  ,
 .gmii_rx_clk                 (gmii_rx_clk)                  ,
 .rst_n                       (rst_n)  ,
 
 .source_mac_addr             (48'h00_0a_35_01_fe_c0)   ,       //source mac address
 .TTL                         (8'h80),
 .source_ip_addr              (32'hc0a80002),
 .destination_ip_addr         (32'hc0a80003),
 .udp_send_source_port        (16'h1f90),
 .udp_send_destination_port   (16'h1f90),
 .video_clk                   (video_clk), 

 .rec_length                  (rec_length),
 .arp_request_req             (arp_request_req ),
 
 .mac_send_end                (mac_send_end),
 .mac_data_valid              (gmii_tx_en_tmp),
 .mac_tx_data                 (gmii_txd_tmp),
 .rx_dv                       (gmii_rx_dv_d0   ),
 .mac_rx_datain               (gmii_rxd_d0 ),
 
 .udp_rec_ram_rdata           (udp_rec_ram_rdata),
 .udp_rec_ram_read_addr       (udp_rec_ram_read_addr),
 .udp_rec_data_length         (udp_rec_data_length ),
 
 .udp_rec_data_valid          (udp_rec_data_valid),
 .arp_found                   (arp_found ),
 .mac_not_exist               (mac_not_exist ),
//         .al_full (al_full),
         .emp_sum (emp_sum),
 .checksum_wr(checksum_wr),
         .use_rd  (use_rd)    
) ;

  
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      write_sel <= 1'b0 ;
    else if (state == WAIT_REC)
      begin
        if (udp_rec_data_valid)
          write_sel <= 1'b1 ;
        else
          write_sel <= 1'b0 ;
      end
  end

assign arp_request_req  = (state == ARP_REQ) ;

always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      wait_cnt <= 0 ;
    else if ((state==IDLE||state == WAIT_REC || state == ARP_WAIT) && state != next_state)
      wait_cnt <= 0 ;
    else if (state==IDLE||state == WAIT_REC || state == ARP_WAIT)
      wait_cnt <= wait_cnt + 1'b1 ;
	 else
	   wait_cnt <= 0 ;
  end

 
endmodule


