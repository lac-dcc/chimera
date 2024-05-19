// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module fixed_sme_wrapper (
  input  wire            clk,
  input  wire            rst,

  // AXI Stream input
  input  wire [8*8-1:0]  s_axis_tdata,
  input  wire [8-1:0]    s_axis_tkeep,
  input  wire            s_axis_tvalid,

  // Match output
  input  wire            next_index,
  output reg  [9:0]      match_index,
  output reg             match_valid,
  output reg             match_error,

  // merged state
  output reg  [3:0]      match_valid_stat,
  output reg  [3:0]      match_error_stat
);

  ///////////////////////////////////////////////
  ////////// Check for fixed patterns ///////////
  ///////////////////////////////////////////////
  wire [561-1:0] sme_output;

  fixed_loc_sme FSME (
    .clk(clk),
    .rst(rst | reload),

    .s_axis_tdata(s_axis_tdata),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tvalid(s_axis_tvalid),
    .match(sme_output)
  );

  // Encoding the output matches
  wire [4*10-1:0] shrinker_output;
  wire [3:0]      match_valids;
  wire [3:0]      match_errors;

  spaced_2lvl_penc # (
    .INPUT_WIDTH(561),
    .PENC1_SIZE (16),
    .PENC2_SIZE (16),
    .BIN_COUNT  (4)
  ) match_shrinker (
    .clk(clk),
    .rst(rst),

    .one_hot(sme_output),
    .index(shrinker_output),
    .valid(match_valids),
    .error(match_errors)
  );

  reg [3:0] selected_match;
  reg [3:0] selected_match_r;
  reg [9:0] selected_match_index;
  reg       selected_match_error;
  reg [3:0] match_mask;

  integer k;
  always @ (*) begin
    selected_match = 4'd1;
    selected_match_index = shrinker_output[0*10+:10];
    selected_match_error = match_errors[0];

    for (k=3;k>=0;k=k-1)
      if (match_valids[k] & match_mask[k]) begin
        selected_match       = 4'd1 << k;
        selected_match_index = shrinker_output[k*10+:10];
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
      match_valid_stat <= 4'd0;
      match_error_stat <= 4'd0;
    end
  end

  always @ (posedge clk) begin
    if (rst || reload)
      match_mask <= 4'hF;
    else if (next_index)
      match_mask <= match_mask & ~selected_match_r;
  end

endmodule
