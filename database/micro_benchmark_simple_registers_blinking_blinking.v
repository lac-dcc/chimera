// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

// ------------------------------
// Design Name: Blinking
// Functionality: 1-bit blinking
// ------------------------------
module blinking(
  clk,
  out
);

input clk;
output reg out;

  always @(posedge clk) begin
    out = ~out;
  end

endmodule
