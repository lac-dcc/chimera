// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  // You can't have an under range value (compile time error).
  enum bit[1:0] {nega = -1, b , c} val;

  initial $display("FAILED");
endmodule
