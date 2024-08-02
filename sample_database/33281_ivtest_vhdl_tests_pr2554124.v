// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
  wire b;
  a a( .b_buf(b),
       .b (b));
endmodule // test


module a(output b_buf, input b);
  assign b_buf = 1'b0;
endmodule // a
