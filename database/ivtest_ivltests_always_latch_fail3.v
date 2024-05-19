// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg q, en, d;
  event foo;

  always_latch begin
    if (en) @foo q <= d;
  end

  initial $display("Expected compile failure!");

endmodule
