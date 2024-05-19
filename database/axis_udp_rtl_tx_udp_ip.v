// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License

`timescale 1ns / 1ps

module tx_udp_ip (

   input wire clk,
   input wire reset,

   input wire [47:0]    CFG_MAC,
   input wire [31:0]    CFG_IP,
   
   input wire [47:0]    dst_mac,
   input wire [31:0]    dst_ip,
   input wire [15:0]    dst_udp,
   input wire [15:0]    src_udp,
   
// UDP payload 
   input wire [63:0]    rx_tdata,            
   input wire [7:0]     rx_tkeep,
   input wire           rx_tvalid,
   input wire           rx_tlast,
   output wire          rx_tready,


   output wire [63:0]   tx_tdata,
   output wire [7:0]    tx_tkeep,
   output wire          tx_tvalid,
   output wire          tx_tlast,
   input wire           tx_tready
);

   localparam LEN_TYPE = 16'h0008;
   localparam IHL_VERSION  = 8'h45;
   localparam TOS = 8'b0;
   localparam IP_PROTOCOL = 8'h11;
   localparam TTL = 8'h40;
   localparam FRAG_OFFSETS_FLAGS = 16'h0040;
   localparam IDENTIFICATION = 16'h00;

   wire [63:0] payload_tdata;
   wire [7:0] payload_tkeep;
   wire payload_tvalid;
   wire payload_tready;
   wire payload_tlast;

   axis_fifo #(
       .DEPTH(256),
       .DATA_WIDTH(64),
       .LAST_ENABLE(1),
       .ID_ENABLE(0),
       .USER_ENABLE(1),
       .USER_WIDTH(1),

       .FRAME_FIFO(1),
       .USER_BAD_FRAME_VALUE(1),

       .DROP_BAD_FRAME(1),
       .DROP_WHEN_FULL(1)
   ) axis_fifo (
      .clk(clk),   // input  wire                   
      .rst(reset), // input  wire                   

      .s_axis_tdata(rx_tdata),   //input  wire [DATA_WIDTH-1:0]  
      .s_axis_tkeep(rx_tkeep),   // input  wire [KEEP_WIDTH-1:0]  
      .s_axis_tvalid(rx_tvalid), // input  wire                   
      .s_axis_tready(rx_tready), // output wire                   
      .s_axis_tlast(rx_tlast),   // input  wire                   
      /*
       * AXI output
       */
      .m_axis_tdata(payload_tdata),   // output wire [DATA_WIDTH-1:0]  
      .m_axis_tkeep(payload_tkeep),   // output wire [KEEP_WIDTH-1:0]  
      .m_axis_tvalid(payload_tvalid), // output wire                   
      .m_axis_tready(payload_tready), // input  wire                   
      .m_axis_tlast(payload_tlast),   // output wire
      /*
       * Status
       */
      .status_overflow(),
      .status_bad_frame(),
      .status_good_frame()
   ); 



// Get payload length:
   reg [3:0] bytes_in_word;
   always @(*) begin
      case (rx_tkeep)
         8'b00000001: bytes_in_word = 1;
         8'b00000011: bytes_in_word = 2;
         8'b00000111: bytes_in_word = 3;
         8'b00001111: bytes_in_word = 4;
         8'b00011111: bytes_in_word = 5;
         8'b00111111: bytes_in_word = 6;
         8'b01111111: bytes_in_word = 7;
         8'b11111111: bytes_in_word = 8;
         default :    bytes_in_word = 0;
      endcase
   end


   reg rx_in_progress;
   always @(posedge clk) begin
      if (reset) rx_in_progress <= 0; else begin
         if (rx_tvalid && rx_tlast) rx_in_progress <= 0;
         else if (rx_tvalid && rx_tready) rx_in_progress <= 1;
      end
   end

   wire sof1;
   assign sof1 = rx_tvalid && rx_tready && !rx_in_progress;   

   reg [15:0] payload_byte_cntr;

   always @(posedge clk) begin 
      if(sof1) begin
         payload_byte_cntr <= {12'b0, bytes_in_word};
      end else begin
         if (rx_tvalid && rx_tready) payload_byte_cntr <= payload_byte_cntr + bytes_in_word;
      end
   end

   wire [63:0] payload_crc_din;

   assign payload_crc_din[7:0]   = rx_tkeep[0] ? rx_tdata[7:0]   : 8'b0;
   assign payload_crc_din[15:8]  = rx_tkeep[1] ? rx_tdata[15:8]  : 8'b0;
   assign payload_crc_din[23:16] = rx_tkeep[2] ? rx_tdata[23:16] : 8'b0;
   assign payload_crc_din[31:24] = rx_tkeep[3] ? rx_tdata[31:24] : 8'b0;
   assign payload_crc_din[39:32] = rx_tkeep[4] ? rx_tdata[39:32] : 8'b0;
   assign payload_crc_din[47:40] = rx_tkeep[5] ? rx_tdata[47:40] : 8'b0;
   assign payload_crc_din[55:48] = rx_tkeep[6] ? rx_tdata[55:48] : 8'b0;
   assign payload_crc_din[63:56] = rx_tkeep[7] ? rx_tdata[63:56] : 8'b0;

   reg last_data_strb;
   always @(posedge clk) begin
      if (rx_tvalid && rx_tlast) last_data_strb <=1;
      else last_data_strb <= 0;
   end

   wire [15:0] payload_crc;
   wire payload_crc_valid;

   payload_crc_acc payload_crc_acc(
      .clk(clk),                                   //    input    wire        
      .rst(payload_crc_valid || reset),            //    input    wire        
      .udp_data(payload_crc_din),                  //    input    wire [63:0]    
      .udp_data_valid(rx_tvalid && rx_tready),     //    input    wire         
      .last_data(rx_tvalid && rx_tlast),           //    input    wire        
      .udp_crc(payload_crc),                       //    output   reg[15:0]      
      .udp_crc_valid(payload_crc_valid)            //    output   reg
   );

   reg [15:0] payload_crc_r;
   always @(posedge clk) if (payload_crc_valid) payload_crc_r <= payload_crc;


//************** Сalculation IPv4 header checksum
   reg [15:0] dst_udp_r;
   reg [15:0] src_udp_r;
   reg [31:0] dst_ip_r;
   reg [47:0] dst_mac_r;

   always @(posedge clk) begin 
      if(sof1) begin
         dst_udp_r <= dst_udp;
         src_udp_r <= src_udp;
         dst_ip_r  <= dst_ip;
         dst_mac_r <= dst_mac;
      end 
   end



   reg [15:0] total_length;
   reg length_valid;

   always @(posedge clk) begin
      if(last_data_strb) begin
         {total_length[7:0], total_length[15:8]} <= payload_byte_cntr + 28;
         length_valid <= 1;
      end else begin
         length_valid <= 0;
      end
   end

   reg [159:0] ip_header_sreg;
   wire ip_crc_reset;
   wire ip_crc_valid;

   reg [1:0] ip_crc_phase;
   localparam  IP_CRC_IDLE = 0,
               IP_CRC_CALC = 1;

   always @(posedge clk) begin
      if(reset) begin
         ip_crc_phase <= IP_CRC_IDLE;
      end else begin
         case (ip_crc_phase)
            IP_CRC_IDLE: begin 
               if (length_valid) begin 
                  ip_crc_phase <= IP_CRC_CALC;
                  ip_header_sreg <= {
                                       dst_ip_r[15:0],                         
                                       CFG_IP,                               
                                       16'h00, dst_ip_r[31:16],              
                                       IP_PROTOCOL, TTL,                     
                                       FRAG_OFFSETS_FLAGS, IDENTIFICATION, 
                                       total_length, TOS, IHL_VERSION      
                  };
               end
            end

            IP_CRC_CALC: begin 
               ip_header_sreg <= {32'h0, ip_header_sreg[159:32]};
               if(ip_crc_valid) begin
                  ip_crc_phase <= IP_CRC_IDLE;
               end
            end 
            default :ip_crc_phase <= IP_CRC_IDLE;
         endcase 
      end
   end

   assign ip_crc_reset = (ip_crc_phase != IP_CRC_CALC) || ip_crc_valid;


   wire [15:0] ip_crc_out;
   ip_header_checksum ip_header_checksum(
      .clk(clk),                       // input 
      .valid(ip_crc_valid),            // output
      .checksum(ip_crc_out),           // output [15:0]
      .header(ip_header_sreg[31:0]),   // input  [31:0] 
      .reset(ip_crc_reset)             // input  
   );



   reg [159:0] ip_header_r;
   always @(posedge clk) begin 
      if (ip_crc_valid) ip_header_r <= {
                     TOS, IHL_VERSION,
                     IP_PROTOCOL, TTL,
                     FRAG_OFFSETS_FLAGS,
                     IDENTIFICATION, total_length,
                     dst_ip_r[15:0], 
                     CFG_IP,
                     {ip_crc_out[7:0], ip_crc_out[15:8]}, //crc,
                     dst_ip_r[31:16]
                  };
   end

//***************************
//Final UDP checksum calculation 

   reg [15:0] udp_length_r;
   reg udp_length_valid;

   always @(posedge clk) begin
      if(last_data_strb) begin
         udp_length_r <= payload_byte_cntr + 8;
         udp_length_valid <= 1;
      end else begin
         udp_length_valid <= 0;
      end
   end

   reg [159:0] udp_ph_sreg;
   wire ph_crc_reset;
   reg [2:0] ph_sreg_cntr;
   reg udp_crc_phase;
   reg ph_data_valid;
   reg ph_last;
   wire ph_crc_valid;

   localparam UDP_CRC_IDLE = 0,
              UDP_CRC_CALC = 1;

   always @(posedge clk) begin
      if(reset) begin
         udp_crc_phase <= UDP_CRC_IDLE;
         ph_sreg_cntr <= 0;
         ph_last <= 0;
         ph_data_valid <= 0;
      end else begin
         case (udp_crc_phase)
            UDP_CRC_IDLE: begin 
               if (/*udp_length_valid*/ payload_crc_valid) begin 
                  ph_sreg_cntr <= 0;
                  ph_data_valid <= 1;
                  udp_crc_phase <= UDP_CRC_CALC;
                  udp_ph_sreg <= {
                     {udp_length_r[7:0], udp_length_r[15:8]}, payload_crc,
                     src_udp_r, dst_udp_r,
                     IP_PROTOCOL, 8'h00,    {udp_length_r[7:0], udp_length_r[15:8]},
                     dst_ip_r,
                     CFG_IP
                  };
               end
            end

            UDP_CRC_CALC: begin 
               udp_ph_sreg <= {32'h0, udp_ph_sreg[159:32]};
               if (ph_crc_valid) begin 
                  udp_crc_phase <= UDP_CRC_IDLE;
               end
            end
            default : udp_crc_phase <= UDP_CRC_IDLE;
         endcase
      end
   end

   assign ph_crc_reset = (udp_crc_phase != UDP_CRC_CALC) || ph_crc_valid;

   wire [15:0] ph_crc;

   ip_header_checksum header_checksum(
      .clk(clk),                    // input 
      .valid(ph_crc_valid),         // output
      .checksum(ph_crc),            // output [15:0]
      .header(udp_ph_sreg[31:0]),   // input  [31:0] 
      .reset(ph_crc_reset)          // input  
   );


//***************************
// Generation outgoing packets 

   reg [319:0] header_sreg;
   reg [1:0] state;
   reg [2:0] shift_cntr;
   reg payload_last;
   reg payload_flag;

   localparam  IDLE       = 0,
               TX_HEADER  = 1,
               TX_PAYLOAD = 2;

   always @(posedge clk) begin 
      if(reset) begin
         state <= IDLE;
         shift_cntr <= 0;
         payload_last <= 0;
         payload_flag <= 0;
      end else begin
         case (state)
            IDLE: begin
               if (ph_crc_valid) begin 
                  state <= TX_HEADER;
                  shift_cntr <= 0;
                  header_sreg <= {  {udp_length_r[7:0], udp_length_r[15:8]}, dst_udp_r, src_udp_r, dst_ip_r[31:16],
                                    dst_ip_r[15:0], CFG_IP, ip_crc_out, 
                                    IP_PROTOCOL, TTL, FRAG_OFFSETS_FLAGS, IDENTIFICATION, total_length,
                                    TOS, IHL_VERSION, LEN_TYPE, CFG_MAC[47:16],
                                    CFG_MAC[15:0], dst_mac_r
                                 };
               end
               payload_last <= 0;
               payload_flag <= 0;
            end

            TX_HEADER: begin
               if (tx_tready && tx_tvalid) begin
                  shift_cntr <= shift_cntr +1;
                  header_sreg <= {64'b0, header_sreg[319:64]};
                  if (shift_cntr == 4) begin
                     state <= TX_PAYLOAD;
                     payload_flag <= 1;
                  end
               end
            end

            TX_PAYLOAD: begin
               if (tx_tvalid && tx_tready && tx_tlast) begin 
                  state <= IDLE;
                  payload_flag <= 0;
               end
               shift_cntr <= 0;
            end
            default : state <= IDLE;
         endcase
      end
   end

   assign payload_tready = payload_flag;

   reg [15:0] payload_tmp;
   reg [1:0] tkeep_tmp;

   always @(posedge clk) begin 
      if (reset) begin
         payload_tmp <= 0;
         tkeep_tmp <= 0;
      end else begin
         if (ph_crc_valid && !payload_flag) begin 
            payload_tmp <= ph_crc;
            tkeep_tmp <= 2'b11;
         end 
         else if (payload_flag && payload_tvalid && payload_tready) begin
            payload_tmp <= payload_tdata[63:48];
            tkeep_tmp <= payload_tkeep[7:6];
         end
      end
   end

   reg tx_last_r =0;
   always @(posedge clk) begin
      if (reset) tx_last_r <= 0; 
      else begin
         if ((state == TX_PAYLOAD) && payload_tlast && payload_tvalid && (payload_tkeep[7]||payload_tkeep[6])) tx_last_r <= 1;
         if (tx_tready && tx_tvalid && tx_tlast) tx_last_r <=0;
      end
   end

   reg payload_tlast_r;
   always @(posedge clk) payload_tlast_r <= (payload_tlast && payload_tready && payload_tvalid);

   reg carry_last;
   always @(posedge clk) begin
      if (reset || (tx_tready && tx_tvalid && tx_tlast) ) begin
         carry_last <= 0;
      end else begin
         if (payload_tvalid && payload_tlast && payload_tready && payload_tkeep[6]) begin 
            carry_last <= 1;
         end
      end 
   end

   assign tx_tdata  = payload_flag ? {payload_tdata[47:0], payload_tmp}  : header_sreg[63:0];
   assign tx_tkeep[1:0]  = tkeep_tmp[1:0];
 //  assign tx_tkeep[7:2]  = carry_last ? 6'b0 : payload_tkeep[5:0];
   assign tx_tkeep[7:2]  =  (state == TX_HEADER) ? 6'b111111 : carry_last ? 6'b0 : payload_tkeep[5:0];
   assign tx_tvalid = (state == TX_HEADER) || (payload_tvalid && state == TX_PAYLOAD) || (carry_last &&  state == TX_PAYLOAD);
   assign tx_tlast  = (state == TX_HEADER) ? 1'b0 : tx_last_r || (!(payload_tkeep[7]||payload_tkeep[6]) && payload_tlast);

endmodule
