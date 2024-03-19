module HTIFEthernetAdapter
(
  input clk,
  input reset,

  input [63:0] rxq_bits,
  input        rxq_last_word,
  input        rxq_val,
  output       rxq_rdy,

  output [63:0] txq_bits,
  output [2:0]  txq_byte_cnt,
  output        txq_last_word,
  output        txq_val,
  input         txq_rdy,

  output        htif_req_val,
  output [63:0] htif_req_bits,

  output        htif_resp_rdy,
  input         htif_resp_val,
  input  [63:0] htif_resp_bits
);

  localparam RISCV_TYPE = 16'h8888;
  localparam CMD_LOAD = 16'd0;
  localparam CMD_SAVE = 16'd1;
  localparam CMD_LCR = 16'd2;
  localparam CMD_WCR = 16'd3;

  // rx adapter

  reg [9:0] reg_rx_cnt, reg_rx_size;
  reg reg_rx_good_packet;

  always @(posedge clk)
  begin
    if (reset)
      reg_rx_cnt <= 10'd0;
    else if (rxq_val)
      reg_rx_cnt <= rxq_last_word ? 1'b0 : reg_rx_cnt+1'b1;

    if (rxq_val && reg_rx_cnt == 10'd1)
      reg_rx_good_packet <= (rxq_bits[47:32] == RISCV_TYPE);

    if (rxq_val && reg_rx_cnt == 10'd2)
      reg_rx_size <= 10'd3 + ((rxq_bits[15:0] == CMD_LOAD ||
                               rxq_bits[15:0] == CMD_LCR)    ? 1'b0
                                                             : rxq_bits[39:35]);
  end

  assign rxq_rdy = 1'b1;
  assign htif_req_val = rxq_val & (reg_rx_cnt > 10'd1) &
                        reg_rx_good_packet & (reg_rx_cnt == 10'd2 || reg_rx_cnt <= reg_rx_size);
  assign htif_req_bits = rxq_bits;

  // tx adapter

  localparam MAC_DST = 48'hff_ff_ff_ff_ff_ff;
  localparam MAC_SRC = 48'h01_02_03_04_05_06;

  reg [4:0] reg_tx_cnt, reg_payload_words;

  always @(posedge clk)
  begin
    if (reset)
      reg_tx_cnt <= 5'd0;
    else if (txq_val && txq_rdy)
      reg_tx_cnt <= txq_last_word ? 1'b0 : reg_tx_cnt+1'b1;

    if (txq_val && txq_rdy && reg_tx_cnt == 5'd0)
      reg_payload_words <= htif_resp_bits[39:35];
  end

  assign txq_bits
    = reg_tx_cnt == 5'd0 ? {MAC_SRC[15:0], MAC_DST}
    : reg_tx_cnt == 5'd1 ? {16'd0, RISCV_TYPE, MAC_SRC[47:16]}
    : htif_resp_bits;

  assign txq_byte_cnt = 3'd7;
  assign txq_val = htif_resp_val;
  assign txq_last_word = (reg_tx_cnt+1'b1 == reg_payload_words+5'd3) & (reg_tx_cnt != 5'd0);

  assign htif_resp_rdy = txq_rdy & (reg_tx_cnt > 5'd1);

endmodule
