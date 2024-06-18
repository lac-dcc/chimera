// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License

`timescale 1ns / 1ps

module rx_udp_ip (

   input wire clk,
   input wire reset,

   input wire [47:0]  CFG_MAC,
   input wire [31:0]  CFG_IP,


   input wire [63:0]  rx_tdata,            
   input wire [7:0]   rx_tkeep,
   input wire         rx_tvalid,
   input wire         rx_tuser,
   input wire         rx_tlast,


   output wire [63:0]   tx_tdata,
   output wire [7:0]    tx_tkeep,
   output wire          tx_tvalid,
   output wire          tx_tlast,
   input wire           tx_tready,

   output wire [47:0]   src_mac,
   output wire [31:0]   src_ip,
   output wire [15:0]   src_udp,
   output wire [15:0]   dst_udp

);


//*******  Parsing headers(MAC, IP, UDP)

   reg [7:0] word_cntr;
   always @(posedge clk) begin 
      if(reset || rx_tlast) begin
         word_cntr <= 0;
      end else begin
         if (rx_tvalid) word_cntr <= word_cntr +1;
      end
   end

   reg [47:0] dst_mac_r;
   reg [47:0] src_mac_r;
   always @(posedge clk) begin
      if(reset) begin
         dst_mac_r[47:0] <= 0;
         src_mac_r[15:0] <= 0;
      end else begin
         if (rx_tvalid && (word_cntr == 0)) begin
            dst_mac_r <= rx_tdata[47:0];
            src_mac_r[15:0] <= rx_tdata[63:48];
         end
      end
   end

   reg [15:0] length_type_r;
   reg [7:0] ihl_ver_r;
   reg [7:0] tos_r;

   always @(posedge clk) begin 
      if(reset) begin
         src_mac_r[47:16] <= 0;
         length_type_r <= 0;
         ihl_ver_r <= 0;
         tos_r <= 0;
      end else begin
         if (rx_tvalid && (word_cntr == 1)) begin
            src_mac_r[47:16] <= rx_tdata[31:0];
            length_type_r <= rx_tdata[47:32];
            ihl_ver_r <= rx_tdata[55:48];
            tos_r <= rx_tdata[63:56];
         end
      end
   end

   reg [15:0] ip_total_length_r;
   reg [15:0] ip_identification_r;
   reg [15:0] ip_fr_offset_flags_r;
   reg [7:0]  ip_ttl_r;
   reg [7:0]  ip_protocol_r;

   always @(posedge clk) begin 
      if(reset) begin
         ip_total_length_r <= 0;
         ip_identification_r <= 0;
         ip_fr_offset_flags_r <= 0;
         ip_ttl_r <= 0;
         ip_protocol_r <= 0;
      end else begin
         if (rx_tvalid && (word_cntr == 2)) begin
            ip_total_length_r <= rx_tdata[15:0];
            ip_identification_r <= rx_tdata[31:16];
            ip_fr_offset_flags_r <= rx_tdata[47:32];
            ip_ttl_r <= rx_tdata[55:48];
            ip_protocol_r <= rx_tdata[63:56];
         end
      end
   end


   reg [15:0] ip_checksum_r;
   reg [31:0] srs_ip_r;
   reg [31:0] dst_ip_r;

   always @(posedge clk) begin 
      if(reset) begin
         ip_checksum_r <= 0;
         srs_ip_r <= 0;
         dst_ip_r[15:0] <= 0;
      end else begin
         if (rx_tvalid && (word_cntr == 3)) begin
            ip_checksum_r <= rx_tdata[15:0];
            srs_ip_r <= rx_tdata[47:16];
            dst_ip_r[15:0] <= rx_tdata[63:48];
         end
      end
   end

   reg [15:0] src_udp_r;
   reg [15:0] dst_udp_r;
   reg [15:0] udp_length_r;

   always @(posedge clk) begin 
      if(reset) begin
         dst_ip_r[31:16] <= 0;
         src_udp_r <= 0;
         dst_udp_r <= 0;
         udp_length_r <= 0;
      end else begin
         if (rx_tvalid && (word_cntr == 4)) begin
            dst_ip_r[31:16] <= rx_tdata[15:0];
            src_udp_r <= rx_tdata[31:16];
            dst_udp_r <= rx_tdata[47:32];
            udp_length_r <= rx_tdata[63:48];
         end
      end
   end


   reg [15:0] udp_checksum_r;
   always @(posedge clk) begin 
      if(reset) begin
         udp_checksum_r <= 0;
      end else begin
         if (rx_tvalid && (word_cntr == 5)) begin
            udp_checksum_r <= rx_tdata[15:0];
         end
      end
   end
//***************

//***************** UDP payload alignment on 64b bus

   reg payload_present =0;

   always @(posedge clk) begin
      if(reset || (rx_tvalid && rx_tlast)) begin
         payload_present <= 0;
      end else begin
        if (rx_tvalid && (word_cntr >= 5))  payload_present <= 1;
      end
   end

   reg [63:0] udp_payload_r;
   reg [47:0] payload_tmp;

   always @(posedge clk) if (rx_tvalid) payload_tmp <= rx_tdata[63:16];


   wire [63:0] udp_payload;
   assign udp_payload =  {rx_tdata[15:0], payload_tmp};
   always @(posedge clk) begin
      if(reset) begin
         udp_payload_r <= 0;
      end else begin
         if (rx_tvalid) udp_payload_r <= {rx_tdata[15:0], payload_tmp};
      end
   end

   reg [5:0] rx_tkeep_tmp;
   reg[7:0] udp_payload_tkeep_r;

   reg [7:0] rx_tkeep_r;
   always @(posedge clk) if (rx_tvalid) rx_tkeep_r <= rx_tkeep;

   always @(posedge clk) begin
      if (reset) begin 
         rx_tkeep_tmp <= 0;
      end else begin
         if (rx_tvalid) rx_tkeep_tmp[5:0] <= rx_tkeep[7:2];
      end
   end

   wire udp_payload_tlast;
   wire udp_payload_tvalid;
   reg carry_last=0;
   always @(posedge clk) begin 
      if (reset || udp_payload_tvalid && udp_payload_tlast) carry_last <= 0;
      else if (rx_tvalid && rx_tlast && rx_tkeep[2]) carry_last <= 1;
   end

   assign udp_payload_tlast = (rx_tlast && !rx_tkeep[2]) || carry_last;

   wire [63:0] udp_payload_tdata;
   assign udp_payload_tdata = {rx_tdata[15:0], payload_tmp};
   wire [7:0] udp_payload_tkeep;
   assign udp_payload_tkeep[7:6] = carry_last ? 1'b0 : rx_tkeep[1:0];   
   assign udp_payload_tkeep[5:0] = rx_tkeep_tmp;
   assign udp_payload_tvalid = (rx_tvalid && payload_present) || carry_last;

   reg rx_tuser_r;
   always @(posedge clk) if (rx_tvalid && rx_tlast) rx_tuser_r <= rx_tuser;

   wire udp_payload_tuser;
   assign udp_payload_tuser = rx_tuser || (carry_last && rx_tuser);

   wire [63:0] payload_tdata;
   wire [7:0]  payload_tkeep;
   wire        payload_tvalid;
   wire        payload_tlast;
   wire        payload_tuser;

   axis_pipeline_register #(
      .DATA_WIDTH(64),
      .LAST_ENABLE(1),
      .USER_ENABLE(1),
      .USER_WIDTH(1),
      .REG_TYPE(2),
      .LENGTH(7)
   ) axis_pipeline_register
   (
      .clk(clk),                             // input  wire                   
      .rst(reset),                           // input  wire                   

       /*
        * AXI input
        */
      .s_axis_tdata(udp_payload_tdata),      // input  wire [DATA_WIDTH-1:0]  
      .s_axis_tkeep(udp_payload_tkeep),      // input  wire [KEEP_WIDTH-1:0]  
      .s_axis_tvalid(udp_payload_tvalid),    // input  wire                   
      .s_axis_tready(),                      // output wire                   
      .s_axis_tlast(udp_payload_tlast),      // input  wire                   
      .s_axis_tuser(udp_payload_tuser),      // input  wire [USER_WIDTH-1:0]  

       /*
        * AXI output
        */
      .m_axis_tdata(payload_tdata),          // output wire [DATA_WIDTH-1:0]  
      .m_axis_tkeep(payload_tkeep),          // output wire [KEEP_WIDTH-1:0]  
      .m_axis_tvalid(payload_tvalid),        // output wire                   
      .m_axis_tready(1'b1),                  // input  wire                   
      .m_axis_tlast(payload_tlast),          // output wire                   
      .m_axis_tuser(payload_tuser)           // output wire [USER_WIDTH-1:0]  
   );


   //****** Сalculation IPv4 header checksum
   reg [159:0] ip_header_sreg;
   reg [1:0]  ip_crc_state;
   reg ip_crc_reset;
   localparam  IP_CRC_IDLE = 0,
               IP_CRC_CALC = 1;

   always @(posedge clk) begin 
      if (reset) begin 
         ip_crc_state <= IP_CRC_IDLE;
         ip_crc_reset <= 1;
      end else case(ip_crc_state)
         IP_CRC_IDLE: begin 
            if (rx_tvalid && rx_tlast) begin 
               ip_crc_state <= IP_CRC_CALC;
               ip_header_sreg <= { 
                  dst_ip_r,
                  srs_ip_r,
                  16'b0,
                  ip_protocol_r, ip_ttl_r,
                  ip_fr_offset_flags_r,
                  ip_identification_r,
                  ip_total_length_r,
                  tos_r, ihl_ver_r
               };
               ip_crc_reset <= 0;
            end
         end //

         IP_CRC_CALC: begin 
            ip_header_sreg <= {32'h0, ip_header_sreg[159:32]};
            if (ip_crc_valid) begin 
               ip_crc_state <= IP_CRC_IDLE;
               ip_crc_reset <= 1;
            end
         end //

         default: ip_crc_state <= IP_CRC_IDLE;
      endcase
   end

   
   wire [15:0] ip_crc_out;
   ip_header_checksum ip_header_checksum(
      .clk(clk),                       // input 
      .valid(ip_crc_valid),            // output
      .checksum(ip_crc_out),           // output [15:0]
      .header(ip_header_sreg[31:0]),   // input  [31:0] 
      .reset(ip_crc_reset)             // input  
   );

   reg [15:0] ip_crc_result;
   always @(posedge clk) if (ip_crc_valid) ip_crc_result <= ip_crc_out;


//****************

//**************** Initial calculation UDP-payload checksum
   wire [63:0] udp_crc_din;
   assign udp_crc_din = {
      udp_payload_tkeep[7] && udp_payload_tvalid ? udp_payload_tdata[63:56] : 8'b0,
      udp_payload_tkeep[6] && udp_payload_tvalid ? udp_payload_tdata[55:48] : 8'b0,
      udp_payload_tkeep[5] && udp_payload_tvalid ? udp_payload_tdata[47:40] : 8'b0,
      udp_payload_tkeep[4] && udp_payload_tvalid ? udp_payload_tdata[39:32] : 8'b0,
      udp_payload_tkeep[3] && udp_payload_tvalid ? udp_payload_tdata[31:24] : 8'b0,
      udp_payload_tkeep[2] && udp_payload_tvalid ? udp_payload_tdata[23:16] : 8'b0,
      udp_payload_tkeep[1] && udp_payload_tvalid ? udp_payload_tdata[15:8]  : 8'b0,
      udp_payload_tkeep[0] && udp_payload_tvalid ? udp_payload_tdata[7:0]   : 8'b0
   };

   reg payload_crc_reset = 0;
   always @(posedge clk) begin
      if (word_cntr == 1) payload_crc_reset <= 1;
      else if (rx_tvalid && (word_cntr >= 4)) payload_crc_reset <= 0;
   end

   wire [15:0] payload_crc;
   wire payload_crc_valid;
   payload_crc_acc payload_crc_acc(
      .clk(clk),                             //    input    wire        
      .rst(payload_crc_reset),                   //    input    wire        
      .udp_data(udp_crc_din),              //    input    wire [63:0]    
      .udp_data_valid(udp_payload_tvalid),    //    input    wire         
      .last_data(udp_payload_tlast),                 //    input    wire        
      .udp_crc(payload_crc),             //    output   reg[15:0]      
      .udp_crc_valid(payload_crc_valid)  //    output   reg
   );

   reg [15:0] payload_crc_r;
   always @(posedge clk) begin
      if(reset) begin
         payload_crc_r <= 0;
      end else begin
         if (payload_crc_valid) payload_crc_r <= payload_crc;
      end
   end

   reg [159:0] udp_ph_sreg;  // ph = pseudo header
   reg [1:0] udp_crc_stage;
   reg ph_crc_reset;
   reg ph_data_valid;
   reg ph_last;
   reg [1:0] ph_sreg_cntr;

   localparam UDP_CRC_IDLE    = 0,
              UDP_HEADER_SHIFT = 1,
              UDP_PAYLOAD_CALC = 2;

   always @(posedge clk) begin
      if(reset) begin
         udp_crc_stage  <= UDP_CRC_IDLE;
         udp_ph_sreg <= 0;
         ph_crc_reset <= 1;
         ph_data_valid <= 0;
         ph_last <= 0;
      end else begin
         case (udp_crc_stage)
            UDP_CRC_IDLE: begin 
               if (word_cntr > 4) begin 
                  ph_crc_reset <= 0;
                  ph_data_valid <= 1;
                  ph_last <= 0;
                  ph_sreg_cntr <= 0;
                  udp_crc_stage <= UDP_HEADER_SHIFT;

                  udp_ph_sreg <= {

                     udp_length_r, 16'b0,
                     src_udp_r, dst_udp_r,  
                     ip_protocol_r, 8'h0,  udp_length_r,
                     srs_ip_r,
                     dst_ip_r

                  };

               end
            end

            UDP_HEADER_SHIFT: begin 
               if (ph_sreg_cntr < 2) ph_sreg_cntr <= ph_sreg_cntr +1;
               udp_ph_sreg <= {64'h0, udp_ph_sreg[159:64]};
               if (ph_sreg_cntr == 1) ph_last <= 1;
               if (ph_sreg_cntr == 2) begin 
                  ph_data_valid <= 0;
               end
               if (rx_tlast && rx_tvalid) begin
                  udp_crc_stage <= UDP_CRC_IDLE;
                  ph_crc_reset <= 1;
               end
            end
            default : udp_crc_stage <= UDP_CRC_IDLE;
         endcase
      end
    end

   wire [15:0] ph_crc;
   reg [15:0] ph_crc_r =0;
   wire ph_crc_valid;
   payload_crc_acc ph_crc_acc(
      .clk(clk),                             //    input    wire        
      .rst(ph_crc_reset),                    //    input    wire        
      .udp_data(udp_ph_sreg[63:0]),          //    input    wire [63:0]    
      .udp_data_valid(ph_data_valid),        //    input    wire         
      .last_data(ph_last),                   //    input    wire        
      .udp_crc(ph_crc),                      //    output   reg[15:0]      
      .udp_crc_valid(ph_crc_valid)           //    output   reg
   );

   always @(posedge clk) if (ph_crc_valid) ph_crc_r <= ph_crc;

   reg [15:0] udp_crc_r;

   wire [16:0] udp_crc_result_tmp;

   assign udp_crc_result_tmp = payload_crc_r + ph_crc_r;
   wire [15:0] udp_crc_result;
   assign udp_crc_result = ~(udp_crc_result_tmp[15:0] + udp_crc_result_tmp[16]);
   always @(posedge clk) if (payload_crc_valid)  udp_crc_r <= udp_crc_result[15:0];

   reg udp_crc_valid;
   always @(posedge clk) udp_crc_valid <= payload_crc_valid;

//****************

//**************** Packets filtration

   reg [47:0] dst_mac_rr;
   reg [47:0] src_mac_rr;
   reg [15:0] length_type_rr;
   reg [7:0]  ihl_ver_rr;
   reg [7:0]  tos_rr;
   reg [15:0] ip_total_length_rr;
   reg [15:0] ip_identification_rr;
   reg [15:0] ip_fr_offset_flags_rr;
   reg [7:0]  ip_ttl_rr;
   reg [7:0]  ip_protocol_rr;
   reg [31:0] srs_ip_rr;
   reg [31:0] dst_ip_rr;
   reg [15:0] src_udp_rr;
   reg [15:0] dst_udp_rr;
   reg [15:0] udp_length_rr;
   reg [15:0] udp_checksum_rr;
   reg [15:0] ip_checksum_rr;

   always @(posedge clk) begin 
      if(rx_tvalid && rx_tlast) begin
         dst_mac_rr              <= dst_mac_r;
         src_mac_rr              <= src_mac_r;
         length_type_rr          <= length_type_r;
         ihl_ver_rr              <= ihl_ver_r;
         tos_rr                  <= tos_r;
         ip_total_length_rr      <= ip_total_length_r;
         ip_identification_rr    <= ip_identification_r;
         ip_fr_offset_flags_rr   <= ip_fr_offset_flags_r;
         ip_ttl_rr               <= ip_ttl_r;
         ip_protocol_rr          <= ip_protocol_r;
         srs_ip_rr               <= srs_ip_r;
         dst_ip_rr               <= dst_ip_r;
         src_udp_rr              <= src_udp_r;
         dst_udp_rr              <= dst_udp_r;
         udp_length_rr           <= udp_length_r;
         udp_checksum_rr         <= udp_checksum_r;
         ip_checksum_rr          <= ip_checksum_r;
      end
   end

   reg rx_last_r =0;
   always @(posedge clk) rx_last_r <= rx_tvalid && rx_tlast;


   reg ip_crc_ok =0;
   always @(posedge clk) begin
      if(payload_tvalid && payload_tlast) begin
         ip_crc_ok <= 0;
      end else begin
         if (ip_crc_valid && (ip_checksum_rr == ip_crc_out)) ip_crc_ok <= 1;
      end
   end

   reg udp_crc_ok =0;
   always @(posedge clk) begin
      if(payload_tvalid && payload_tlast) begin
         udp_crc_ok <= 0;
      end else begin
         if (udp_crc_valid && (udp_checksum_rr == udp_crc_result)) udp_crc_ok <= 1;
      end
   end

   reg dst_mac_ok =0;
   always @(posedge clk) begin
      if (payload_tvalid && payload_tlast) dst_mac_ok <=0;
      if (rx_last_r && dst_mac_rr == CFG_MAC) begin
         dst_mac_ok <= 1;
      end 
   end

   reg dst_ip_ok =0;
   always @(posedge clk) begin
      if (payload_tvalid && payload_tlast) dst_ip_ok <=0;
      if (rx_last_r && dst_ip_rr == CFG_IP) begin
         dst_ip_ok <= 1;
      end 
   end

   wire drop_flag;

   assign drop_flag = payload_tlast && ( !ip_crc_ok || !dst_mac_ok || !dst_ip_ok);


   fwft_fifo #(
      .DATA_WIDTH(48)
   ) header_fifo_1 (
      .RST   (reset),
      .CLK   (clk),
      .DO    (src_mac),
      .EMPTY (),
      .FULL  (),
      .DI    ({src_mac_rr}),
      .RDEN  (tx_tlast && tx_tvalid && tx_tready),
      .WREN  (!(payload_tuser || drop_flag) && payload_tvalid && payload_tlast)
   );

   fwft_fifo #(
      .DATA_WIDTH(64)
   ) header_fifo_2  (
      .RST   (reset),
      .CLK   (clk),
      .DO    ({src_ip, dst_udp, src_udp}),
      .EMPTY (),
      .FULL  (),
      .DI    ({srs_ip_rr, dst_udp_rr, src_udp_rr}),
      .RDEN  (tx_tlast && tx_tvalid && tx_tready),
      .WREN  (!(payload_tuser || drop_flag) && payload_tvalid && payload_tlast)
   );



   axis_fifo #(
       .DEPTH(2048),
       .DATA_WIDTH(64),
       .LAST_ENABLE(1),
       .ID_ENABLE(0),
       .USER_ENABLE(1),
       .USER_WIDTH(1),

       .FRAME_FIFO(1),
       .USER_BAD_FRAME_VALUE(1),

       .DROP_BAD_FRAME(1),
       .DROP_WHEN_FULL(1)
   ) axis_fifo_st2 (
      .clk(clk),                       // input  wire                   
      .rst(reset),                     // input  wire                   

      .s_axis_tdata(payload_tdata),    //input  wire [DATA_WIDTH-1:0]  
      .s_axis_tkeep(payload_tkeep),    // input  wire [KEEP_WIDTH-1:0]  
      .s_axis_tvalid(payload_tvalid),  // input  wire                   
      .s_axis_tready(),                // output wire                   
      .s_axis_tlast(payload_tlast),    // input  wire                   
      .s_axis_tuser(payload_tuser || drop_flag), // input  wire [USER_WIDTH-1:0]  
      /*
       * AXI output
       */
      .m_axis_tdata(tx_tdata),         // output wire [DATA_WIDTH-1:0]  
      .m_axis_tkeep(tx_tkeep),         // output wire [KEEP_WIDTH-1:0]  
      .m_axis_tvalid(tx_tvalid),       // output wire                   
      .m_axis_tready(tx_tready),       // input  wire                   
      .m_axis_tlast(tx_tlast),         // output wire                   
      .m_axis_tid(),                   // output wire [ID_WIDTH-1:0]    
      .m_axis_tdest(),                 // output wire [DEST_WIDTH-1:0]  
      .m_axis_tuser(),                 // output wire [USER_WIDTH-1:0]  
      /*
       * Status
       */
      .status_overflow(),
      .status_bad_frame(),
      .status_good_frame()
   ); 

endmodule
