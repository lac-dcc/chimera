// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg q, clk, d;
  event foo;

  always_ff @(posedge clk) begin
    @foo q <= d;
  end

  initial $display("Expected compile failure!");

endmodule
