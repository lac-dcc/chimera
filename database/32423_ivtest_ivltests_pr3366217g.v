// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  // You can't have duplicate values!
  enum {red = 1, green, blue = 2} light;
  enum {first = 2, second = 1, third} nums;

  initial $display("FAILED");
endmodule
