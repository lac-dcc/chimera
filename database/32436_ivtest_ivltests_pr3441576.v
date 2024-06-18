// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg foo;
  always @* foo <= 0;
  initial #1 $display("foo is %b", foo);
endmodule
