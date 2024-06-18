// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License

module arp_engine (
   input wire clk,   
   input wire reset,

   input wire [63:0]  rx_tdata,
   input wire [7:0]   rx_tkeep,
   input wire         rx_tvalid,
   input wire         rx_tlast,

   output wire [63:0] tx_tdata,
   output wire [7:0]  tx_tkeep,
   input  wire        tx_tready,
   output wire        tx_tvalid,
   output wire        tx_tlast,

   input wire [47:0] CFG_MAC,
   input wire [31:0] CFG_IP
);

   reg [10:0] rx_cntr;
   reg [10:0] rx_cntr_r;
   always @(posedge clk) begin
      if(reset || (rx_tvalid && rx_tlast)) begin
         rx_cntr <= 0;
      end else begin
         if (rx_tvalid) rx_cntr <= rx_cntr +1;
      end
   end

   always @(posedge clk) begin 
      if(reset) rx_cntr_r <= 0;
      else begin 
         if (rx_tvalid && rx_tlast) rx_cntr_r <= rx_cntr;
      end

   end


   reg dst_is_broadcast;
   always @(posedge clk) begin
      if(reset) begin
         dst_is_broadcast <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 0) && (rx_tdata[47:0]== 48'hFFFFFFFFFFFF))  dst_is_broadcast <= 1;
         if (rx_tvalid && rx_tlast) dst_is_broadcast <= 0;
      end
   end

   reg dst_is_cfg_mac;
   always @(posedge clk) begin
      if(reset) begin
         dst_is_cfg_mac <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 0) && (rx_tdata[47:0]== CFG_MAC))  dst_is_cfg_mac <= 1;
         if (rx_tvalid && rx_tlast) dst_is_cfg_mac <= 0;
      end
   end

   reg [47:0] rx_dst_mac;

   always @(posedge clk) begin 
      if(reset) begin
         rx_dst_mac[15:0] <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr==0)) rx_dst_mac[15:0] <= rx_tdata[63:48];
      end
   end

   always @(posedge clk) begin 
      if(reset) begin
         rx_dst_mac[47:16] <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr ==1)) rx_dst_mac[47:16] <= rx_tdata[31:0];
      end
   end

   reg [31:0] mac_type_hw_type;
   always @(posedge clk) begin 
      if(reset) begin
         mac_type_hw_type <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 1)) mac_type_hw_type <= rx_tdata[63:32];
      end
   end

   reg type_valid;
   always @(posedge clk) begin
      if(reset || (rx_tvalid && rx_tlast)) begin
         type_valid <= 0;
      end else begin
         if (rx_cntr > 1) type_valid <= (mac_type_hw_type == 32'h01000608);
      end
   end

   reg ptype_valid;
   reg [47:0] sender_mac;
   always @(posedge clk) begin 
      if(reset || (rx_tvalid && rx_tlast)) begin
         ptype_valid <= 0;
         sender_mac[15:0] <= 0;
      end else begin
         
         if (rx_tvalid && (rx_cntr == 2)) begin 
            sender_mac[15:0] <= rx_tdata[63:48];
            ptype_valid <= (rx_tdata[47:0] == 48'h010004060008);
         end
      end
   end

   reg [31:0] sender_ip;
   always @(posedge clk) begin
      if(reset) begin
         sender_mac[47:16] <= 0;
         sender_ip <=0;
      end else begin
         if (rx_tvalid && (rx_cntr == 3)) begin
            sender_mac[47:16] <= rx_tdata[31:0];
            sender_ip <= rx_tdata[63:32];
         end
      end
   end

   reg [47:0] target_mac;
   reg target_ip_valid;
   always @(posedge clk) begin
      if(reset) begin
         target_mac <= 0;
         //target_ip[15:0] <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 4)) begin
            target_mac <= rx_tdata[47:0];
            target_ip_valid <= (rx_tdata[63:48] == CFG_IP[15:0]);
         end
      end
   end

   reg chk_flag;
   reg [31:0] sender_ip_r;
   reg [47:0] sender_mac_r;
   always @(posedge clk) begin
      if(reset) begin
         chk_flag <= 0;
         sender_mac_r <=0;
         sender_ip_r <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr==5) && (rx_tdata[15:0]==CFG_IP[31:16])) begin 
            chk_flag <= ((dst_is_broadcast || dst_is_cfg_mac) && type_valid && ptype_valid && target_ip_valid);
         end 
         
         if (rx_tvalid && (rx_cntr == 5)) begin 
            sender_mac_r <= sender_mac;
            sender_ip_r <= sender_ip;
         end
      end
   end

   reg arp_valid;
   always @(posedge clk) begin 
      if (reset) begin 
         arp_valid <= 0;
      end else begin
         arp_valid <= (rx_tvalid && rx_tlast && (rx_cntr==7) && (rx_tkeep == 8'h0f) && chk_flag) ;
      end
   end

/**************************************/
//ICMP
   reg [63:0] frame [15:0];

   wire [63:0] word_0;
   assign word_0 = frame[0];
   wire [63:0] word_1;
   assign word_1 = frame[1];
   wire [63:0] word_2;
   assign word_2 = frame[2];
    wire [63:0] word_3;
   assign word_3 = frame[3];
   wire [63:0] word_4;
   assign word_4 = frame[4];
   wire [63:0] word_5; 
   assign word_5 = frame[5];
   wire [63:0] word_6;
   assign word_6 = frame[6];
   wire [63:0] word_7;
   assign word_7 = frame[7];
   wire [63:0] word_8;
   assign word_8 = frame[8];
   wire [63:0] word_9;
   assign word_9 = frame[9];
   wire [63:0] word_10;
   assign word_10 = frame[10];
   wire [63:0] word_11;
   assign word_11 = frame[11];
   wire [63:0] word_12;
   assign word_12 = frame[12];
   wire [63:0] word_13;
   assign word_13 = frame[13];
   wire [63:0] word_14;
   assign word_14 = frame[14];
   wire [63:0] word_15;
   assign word_15 = frame[15];


   always @(posedge clk) begin 
      if (rx_tvalid) frame[rx_cntr[4:0]] <= rx_tdata;
   end


   reg icmp_w1_chk;
   always @(posedge clk) begin
      if(reset) begin
         icmp_w1_chk <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 1) && (rx_tdata[47:32]== 16'h0008) && (rx_tdata[55:48]== 8'h45))  icmp_w1_chk <= 1;
         if (rx_tvalid && rx_tlast) icmp_w1_chk <= 0;
      end
   end

   reg icmp_w2_chk;
   always @(posedge clk) begin
      if(reset) begin
         icmp_w2_chk <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 2) && (rx_tdata[63:56]== 8'h01) )  icmp_w2_chk <= 1;
         if (rx_tvalid && rx_tlast) icmp_w2_chk <= 0;
      end
   end


   reg icmp_w3_chk;
   always @(posedge clk) begin
      if(reset) begin
         icmp_w3_chk <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 3) && (rx_tdata[63:48]== CFG_IP[15:0]) )  icmp_w3_chk <= 1;
         if (rx_tvalid && rx_tlast) icmp_w3_chk <= 0;
      end
   end

   reg icmp_w4_chk;
   always @(posedge clk) begin
      if(reset) begin
         icmp_w4_chk <= 0;
      end else begin
         if (rx_tvalid && (rx_cntr == 4) && (rx_tdata[15:0]== CFG_IP[31:16]) && (rx_tdata[23:16]== 16'h0008))  icmp_w4_chk <= 1;
         if (rx_tvalid && rx_tlast) icmp_w4_chk <= 0;
      end
   end

   reg icmp_valid;
   always @(posedge clk) begin 
      if (reset) begin 
         icmp_valid <= 0;
      end else begin
         icmp_valid <= (rx_tvalid && rx_tlast && icmp_w1_chk && icmp_w2_chk && icmp_w3_chk && icmp_w4_chk) ;
      end
   end

   reg [31:0] rx_src_ip;
   always @(posedge clk) begin 
      if (reset) begin 
         rx_src_ip <= 0;
      end else begin 
         if (rx_tvalid && (rx_cntr == 3)) rx_src_ip <= rx_tdata[47:16];
      end
   end

   reg [7:0] tkeep_tmp;
   always @(posedge clk) begin 
      if (rx_tvalid && rx_tlast) tkeep_tmp <= rx_tkeep;
   end


   wire [159:0]   outbond_header;
   wire           outbond_header_valid;
   wire [15:0]    outbond_header_cheecksum;
   wire           outbond_header_crc_valid;
   
   assign outbond_header_valid = (rx_cntr==4);
   
   assign outbond_header = {  
                        word_3[47:16],                                         
                        rx_tdata[15:0],                                        
                        word_3[63:48],                                         
                        16'b0,                                                 
                        word_2[63:48], word_2[47:16],            
                        word_2[15:0], 
                        word_1[63:48]                                          
                     };
   
   outbond_header_crc outbond_header_crc(
      .clk(clk),                                 
      .reset(reset),                             
      .header(outbond_header),                   
      .header_valid(outbond_header_valid),       
      .checksum(outbond_header_cheecksum[15:0]), 
      .checksum_valid(outbond_header_crc_valid)  
   );


   reg [15:0] header_chksum;
   always @(posedge clk) if (outbond_header_crc_valid) header_chksum <= outbond_header_cheecksum[15:0];


   wire [15:0] icmp_crc;
   wire icmp_crc_valid;
   wire crc_sop;

   assign crc_sop = (rx_cntr == 4) && rx_tvalid;

   reg [63:0] icmp_crc_din;

   always @(*) begin 
      if (crc_sop) icmp_crc_din = {rx_tdata[63:48], 16'h0000, rx_tdata[31:24], 8'h0, 16'h0000};
      else icmp_crc_din = {        
                              rx_tkeep[7] ? rx_tdata[63:56] :8'h0, 
                              rx_tkeep[6] ? rx_tdata[55:48] :8'h0,
                              rx_tkeep[5] ? rx_tdata[47:40] :8'h0,
                              rx_tkeep[4] ? rx_tdata[39:32] :8'h0,
                              rx_tkeep[3] ? rx_tdata[31:24] :8'h0,
                              rx_tkeep[2] ? rx_tdata[23:16] :8'h0,
                              rx_tkeep[1] ? rx_tdata[15:8]  :8'h0,
                              rx_tkeep[0] ? rx_tdata[7:0]   :8'h0
                           };
   end

   reg icmp_payload_valid;
   always @(posedge clk) begin 
      if (reset) icmp_payload_valid <= 0;
      else begin 
         if (rx_cntr == 3) icmp_payload_valid <= 1;
         if (rx_tvalid && rx_tlast) icmp_payload_valid <= 0;
      end
   end

   payload_crc_acc_A inst_payload_crc_acc_A
      (
         .clk            (clk),
         .rst            (reset),
         .udp_data       (icmp_crc_din),
         .udp_data_valid (icmp_payload_valid && rx_tvalid),
         .eop            (rx_tvalid&& rx_tlast),
         .sop            (crc_sop),
         .udp_crc        (icmp_crc),
         .udp_crc_valid  (icmp_crc_valid)
      );

   wire [15:0] icmp_chksum_result;
   assign icmp_chksum_result     = !(|icmp_crc) ? icmp_crc : ~icmp_crc;

/**************************************/

   localparam  IDLE         = 0,
               TX_ARP_REPLY = 1,
               WAIT_CRC     = 2;
   reg [1:0]  state;
   reg [63:0] tx_pkt [0:15];
   reg [4:0]  tx_cntr;
   reg [4:0]  tx_cntr_stop;
   reg [7:0]  last_tkeep;

   always @(posedge clk) begin
      if(reset) begin
         state <= IDLE;
         tx_cntr <= 0;
      end else begin
         case (state)
            IDLE: begin 
               if (arp_valid) begin 
                  tx_pkt[0] <= {CFG_MAC[15:0], sender_mac_r};
                  tx_pkt[1] <= {32'h01000608, CFG_MAC[47:16]};
                  tx_pkt[2] <= {CFG_MAC[15:0], 48'h020004060008};
                  tx_pkt[3] <= {CFG_IP[31:0], CFG_MAC[47:16]};
                  tx_pkt[4] <= {sender_ip_r[15:0], sender_mac_r};
                  tx_pkt[5] <= {48'h0, sender_ip_r[31:16]};
                  tx_cntr_stop <= 5;
                  last_tkeep <= 8'h03;
                  state <= TX_ARP_REPLY;
               end

               if (icmp_valid) begin 
                  tx_pkt[0] <= {CFG_MAC[15:0], word_1[31:0], word_0[63:48]};
                  tx_pkt[1]  <= {word_1[63:32], CFG_MAC[47:16]};
                  tx_pkt[2]  <= { word_2[63:32], word_2[31:0]};
                  tx_pkt[5]  <= word_5;
                  tx_pkt[6]  <= word_6;
                  tx_pkt[7]  <= word_7;
                  tx_pkt[8]  <= word_8;
                  tx_pkt[9]  <= word_9;
                  tx_pkt[10] <= word_10;
                  tx_pkt[11] <= word_11;
                  tx_pkt[12] <= word_12;
                  tx_pkt[13] <= word_13;
                  tx_pkt[14] <= word_14;
                  tx_pkt[15] <= word_15;
                  tx_cntr_stop <= rx_cntr_r;
                  last_tkeep <= tkeep_tmp;
                  state <= WAIT_CRC;

               end
                  tx_cntr <= 0;
            end //IDLE: begin 

            WAIT_CRC: begin 
               if (icmp_crc_valid) begin
                  tx_pkt[3]  <= {rx_src_ip[15:0], CFG_IP[31:0], header_chksum};
                  tx_pkt[4]  <= {word_4[63:48], icmp_chksum_result, 16'h0000, rx_src_ip[31:16]};
                  state <= TX_ARP_REPLY;
               end
            end

            TX_ARP_REPLY: begin 
               if (tx_tvalid && tx_tready && !tx_tlast) tx_cntr <= tx_cntr +1;
               if (tx_tvalid && tx_tready && tx_tlast) state <= IDLE;
            end
         
            default : state <= IDLE;
         endcase
      end
   end

   assign tx_tdata = tx_pkt[tx_cntr];
   assign tx_tvalid = (state == TX_ARP_REPLY);
   assign tx_tlast = (tx_cntr == tx_cntr_stop);
   assign tx_tkeep = (tx_cntr == tx_cntr_stop) ? last_tkeep : 8'hFF;

endmodule