// Ethernet receiver
//
// GNSS Firehose
// Copyright (c) 2015 Peter Monta <pmonta@gmail.com>

module packet_rx(
  input clk,
  input [7:0] data,
  input [1:0] ctl,
  input [47:0] mac_addr,
  input clk_cpu,
  input clk_cpu_reset,
  output reg [5:0] eth_rx_addr,
  output [7:0] eth_rx_wdata,
  output reg eth_rx_we,
  output reg eth_rx_ready,
  input eth_rx_read
);

  localparam [3:0]
    IDLE = 4'd0,
    PREAMBLE = 4'd1,
    DEST_1 = 4'd2,
    DEST_2 = 4'd3,
    DEST_3 = 4'd4,
    DEST_4 = 4'd5,
    DEST_5 = 4'd6,
    DEST_6 = 4'd7,
    SKIP = 4'd8,
    PAYLOAD = 4'd9,
    WAIT = 4'd10,
    IGNORE = 4'd11;

  reg [3:0] state;
  reg [3:0] c;

  assign eth_rx_wdata = data;

  always @(posedge clk)
    case (state)
      IDLE: if (ctl==2'b11) state <= PREAMBLE;
      PREAMBLE: if (ctl!=2'b11) state <= IDLE; else if (data==8'hd5) state <= DEST_1;
      DEST_1: if (ctl!=2'b11) state <= IDLE; else if (data==mac_addr[47:40]) state <= DEST_2; else state <= IGNORE;
      DEST_2: if (ctl!=2'b11) state <= IDLE; else if (data==mac_addr[39:32]) state <= DEST_3; else state <= IGNORE;
      DEST_3: if (ctl!=2'b11) state <= IDLE; else if (data==mac_addr[31:24]) state <= DEST_4; else state <= IGNORE;
      DEST_4: if (ctl!=2'b11) state <= IDLE; else if (data==mac_addr[23:16]) state <= DEST_5; else state <= IGNORE;
      DEST_5: if (ctl!=2'b11) state <= IDLE; else if (data==mac_addr[15:8]) state <= DEST_6; else state <= IGNORE;
      DEST_6: if (ctl!=2'b11) state <= IDLE; else if (data==mac_addr[7:0]) begin c <= 0; state <= SKIP; end else state <= IGNORE;
      SKIP:                        // skip over source MAC address and type/len field to get to start of payload
        if (ctl!=2'b11)
          state <= IDLE;
        else begin
          c <= c + 1;
          if (c==4'd7) begin
            eth_rx_addr <= 0;
            eth_rx_we <= 1;
            state <= PAYLOAD;
          end
        end
      PAYLOAD:                     // place first 64 bytes of payload into packet RAM
        if (ctl!=2'b11)
          state <= IDLE;
        else if (eth_rx_addr==6'd63) begin 
          eth_rx_we <= 0;
          eth_rx_ready <= 1;
          state <= WAIT;
        end else begin
          eth_rx_addr <= eth_rx_addr + 1;
        end
      WAIT: if (eth_rx_read) begin eth_rx_ready <= 0; state <= IDLE; end
      IGNORE: if (ctl!=2'b11) state <= IDLE;
      default: state <= IDLE;
    endcase

endmodule
