// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module fast_pattern_sme_wrapper (
  input  wire            clk,
  input  wire            rst,

  // AXI Stream input
  input  wire [7:0]      s_axis_tdata,
  input  wire            s_axis_tvalid,

  // Preamble state (7B data and 1B len)
  input  wire [8*8-1:0]  preamble_state,
  input  wire            reload,

  // Match output
  input  wire            next_index,
  output reg  [12:0]     match_index,
  output reg             match_valid,
  output reg             match_error,

  // Last bytes (7B data and 1B len)
  output wire [8*8-1:0]  last_bytes_state,

  // merged state
  output reg  [7:0]      match_valid_stat,
  output reg  [7:0]      match_error_stat
);

  ///////////////////////////////////////////////
  //////////   Selecting input data   ///////////
  ///////////////////////////////////////////////
  wire [7:0]    muxed_data;
  wire          muxed_data_v;
  reg  [2:0]    preamble_ptr;

  assign muxed_data   = preamble_ptr > 0 ? preamble_state[preamble_ptr*8+:8]
                                         : s_axis_tdata;
  assign muxed_data_v = preamble_ptr > 0 ? 1'b1 : s_axis_tvalid;

  always @ (posedge clk)
    if (rst)
      preamble_ptr <= 3'b0;
    else if (reload)
      preamble_ptr <= preamble_state [2:0];
    else if (preamble_ptr > 0)
      preamble_ptr <= preamble_ptr - 3'd1;

  ///////////////////////////////////////////////
  ////////// Check for fast patterns ////////////
  ///////////////////////////////////////////////
  wire [4636-1:0] sme_output;
  fast_pattern_sme SME (
    .clk(clk),
    .rst(rst | reload),

    .s_axis_tdata(muxed_data),
    .s_axis_tvalid(muxed_data_v),
    .match(sme_output)
  );

  // Encoding the output matches
  wire [8*13-1:0] shrinker_output;
  wire [7:0]      match_valids;
  wire [7:0]      match_errors;

  spaced_2lvl_penc # (
    .INPUT_WIDTH(4636),
    .PENC1_SIZE (32),
    .PENC2_SIZE (32),
    .BIN_COUNT  (8)
  ) match_shrinker (
    .clk(clk),
    .rst(rst),

    .one_hot(sme_output),
    .index(shrinker_output),
    .valid(match_valids),
    .error(match_errors)
  );

  reg [7:0]  selected_match;
  reg [7:0]  selected_match_r;
  reg [12:0] selected_match_index;
  reg        selected_match_error;
  reg [7:0]  match_mask;

  integer k;
  always @ (*) begin
    selected_match = 8'd1;
    selected_match_index = shrinker_output[0*13+:13];
    selected_match_error = match_errors[0];

    for (k=7;k>=0;k=k-1)
      if (match_valids[k] & match_mask[k]) begin
        selected_match       = 8'd1 << k;
        selected_match_index = shrinker_output[k*13+:13];
        selected_match_error = match_errors[k];
      end
  end

  always @ (posedge clk) begin
    selected_match_r <= selected_match;
    match_index      <= selected_match_index;
    match_error      <= selected_match_error;

    match_valid      <= |(match_valids & match_mask);
    match_valid_stat <= match_valids & match_mask;
    match_error_stat <= match_errors & match_mask;

    if (rst) begin
      match_valid      <= 1'b0;
      match_valid_stat <= 8'd0;
      match_error_stat <= 8'd0;
    end
  end

  always @ (posedge clk) begin
    if (rst || reload)
      match_mask <= 8'hFF;
    else if (next_index)
      match_mask <= match_mask & ~selected_match_r;
  end

  ///////////////////////////////////////////////
  ////////// Keeping last bytes logic ///////////
  ///////////////////////////////////////////////
  reg [7:0] byte_reg [0:6];
  reg [2:0] byte_reg_len;

  integer j;
  always @ (posedge clk) begin
    if (s_axis_tvalid) begin
      byte_reg[0]   <= s_axis_tdata;
      for (j=6;j>0;j=j-1)
        byte_reg[j] <= byte_reg[j-1];

      if (byte_reg_len < 7)
        byte_reg_len <= byte_reg_len + 3'd1;
    end

    if (rst || reload) // Flush the pipe
      byte_reg_len <= 3'd0;
  end

  genvar i;
  generate
    for (i=1; i<8; i=i+1) begin: last_byte_remap
      assign last_bytes_state[i*8+:8] = byte_reg[i-1];
    end
  endgenerate
  assign last_bytes_state[7:0] = {5'd0, byte_reg_len};

endmodule
