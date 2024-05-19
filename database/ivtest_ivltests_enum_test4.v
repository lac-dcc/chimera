// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  enum bit [3:0] {first, second, third, fourth, last = -4'sd1} my_type;
  initial $display("PASSED");
endmodule
