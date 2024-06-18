// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module jk_flip_flop (
  input wire clk,
  input wire j,
  input wire k,
  input wire reset,
  output reg q,
  output reg q_bar
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 1'b0;
    else if (j && ~k)
      q <= 1'b1;
    else if (~j && k)
      q <= 1'b0;
    else if (j && k)
      q <= ~q;
  end

  always @(q) begin
    q_bar <= ~q;
  end

endmodule
