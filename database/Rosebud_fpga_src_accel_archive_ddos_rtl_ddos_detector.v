// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module ddos_detector # (
  // TIME_WIDTH+CNT_WIDTH+1 should be 36 at most
  parameter TIME_WIDTH = 25,
  parameter CNT_WIDTH  = 10,
  parameter HASH_BITS  = 16
) (
  input  wire                  clk,
  input  wire                  rst,

  input  wire [15:0]           len_thresh,
  input  wire [TIME_WIDTH-1:0] time_thresh,
  input  wire                  alert,

  input  wire [31:0]           dst_ip,
  input  wire [15:0]           payload_len,
  input  wire                  hdr_valid,
  output wire                  ready,

  input  wire [HASH_BITS-2:0]  init_wr_addr,
  input  wire                  init_wr_en,

  output reg  [CNT_WIDTH-1:0]  occurence,
  output reg                   alerted,
  output reg                   occ_valid
);

  localparam LINE_WIDTH = TIME_WIDTH + CNT_WIDTH + 1;
  localparam URAM_WIDTH = 2 * LINE_WIDTH;
  localparam HASH_WIDTH = 4;

  // Hash of destination IP
  function [31:0] hash_toep(input [HASH_WIDTH*8-1:0] data, input [5:0] len, input [(HASH_WIDTH+4)*8-1:0] key);
    integer i, j;
    hash_toep = 0;

    for (i = 0; i < len; i = i + 1)
      for (j = 0; j < 8; j = j + 1)
        if (data[i*8 + (7-j)])
          hash_toep = hash_toep ^ key[(HASH_WIDTH+4)*8 - 32 - i*8 - j +: 32];
  endfunction

  wire [31:0] hash_raw = hash_toep(dst_ip, HASH_WIDTH, 64'h6d5a56da255b0ec2);

  reg [HASH_BITS-1:0] hash;

  always @ (posedge clk) begin
    if (hdr_valid && ready)
      hash <= hash_raw[HASH_BITS-1:0];

    if (rst)
      hash <= {HASH_BITS{1'b0}};
  end

  // 25 bit Timer
  reg [TIME_WIDTH-1:0] timer;
  always @ (posedge clk)
    if (rst)
      timer <= {TIME_WIDTH{1'b0}};
    else
      timer <= timer +{{(TIME_WIDTH-1){1'b0}}, 1'b1};

  // Memory read
  (* ram_style = "ultra" *)
  reg [URAM_WIDTH-1:0] mem [0:(1<<(HASH_BITS-1))-1];
  reg [URAM_WIDTH-1:0] mem_rd_r;

  wire [TIME_WIDTH-1:0] last_ts;
  wire [CNT_WIDTH-1:0]  counter;
  wire                  in_alert;

  always @ (posedge clk)
    mem_rd_r <= mem[hash[HASH_BITS-1:1]];

  assign {in_alert, counter, last_ts} = hash[0] ? mem_rd_r[URAM_WIDTH-1:LINE_WIDTH] : mem_rd_r [LINE_WIDTH-1:0];

  // Compute statistics
  reg [TIME_WIDTH:0]  time_diff;
  reg [CNT_WIDTH-1:0] counter_plus;
  reg [CNT_WIDTH-1:0] counter_minus;
  reg                 hdr_valid_r, hdr_valid_rr, hdr_valid_rrr;

  always @ (posedge clk) begin
    // MSB will be cut off
    time_diff     <= {1'b1, timer} - {1'b0, last_ts};
    counter_plus  <= counter + {{(CNT_WIDTH-1){1'b0}}, 1'b1};

    if (counter != {CNT_WIDTH{1'b0}})
      counter_minus <= counter - {{(CNT_WIDTH-1){1'b0}}, 1'b1};
    else
      counter_minus <= {CNT_WIDTH{1'b0}};

    hdr_valid_r   <= hdr_valid && ready;
    hdr_valid_rr  <= hdr_valid_r;
    hdr_valid_rrr <= hdr_valid_rr;

    if (rst) begin
      hdr_valid_r   <= 1'b0;
      hdr_valid_rr  <= 1'b0;
      hdr_valid_rrr <= 1'b0;
    end
  end

  wire small_pkt = (payload_len < len_thresh);
  wire short_int = (time_diff[TIME_WIDTH-1:0] < time_thresh);

  reg [LINE_WIDTH-1:0] new_line;

  // hash and read value doesn't change, so we can reuse
  always @(*) begin
    if (hdr_valid_rrr)
      if (small_pkt && short_int)
        new_line = {(alert||in_alert), counter_plus, timer};
      else
        new_line = {(alert||in_alert), counter_minus, last_ts};
  end

  assign ready = ! (hdr_valid_r || hdr_valid_rr || hdr_valid_rrr);

  // Memory write
  reg [URAM_WIDTH-1:0] wr_data;
  reg [HASH_BITS-2:0]  wr_addr;
  reg                  wr_en;

  always @ (posedge clk) begin
    wr_en <= 1'b0;

    if (init_wr_en) begin
      wr_data <= {URAM_WIDTH{1'b0}};
      wr_addr <= init_wr_addr;
      wr_en   <= 1'b1;
    end else if (hdr_valid_rrr) begin
      wr_data <= hash[0] ? {new_line, mem_rd_r [LINE_WIDTH-1:0]}:
                   {mem_rd_r[URAM_WIDTH-1:LINE_WIDTH], new_line};
      wr_addr <= hash[HASH_BITS-1:1];
      wr_en   <= 1'b1;
    end

    if (wr_en)
      mem[wr_addr] <= wr_data;

    if (rst)
      wr_en <= 1'b0;
  end

  // Generate output
  always @(posedge clk) begin
    if (hdr_valid_rrr) begin
      alerted   <= in_alert;
      occ_valid <= 1'b1;
      if (small_pkt && short_int)
        occurence <= counter_plus;
      else
        occurence <= counter_minus;
    end else if (hdr_valid && ready) begin
      occ_valid <= 1'b0;
    end

    if (rst)
      occ_valid <= 1'b0;
  end

endmodule
