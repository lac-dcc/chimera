// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
  a a_(
       .b_buf(b),
       .b (b)
       );
endmodule // test

module a(b, b_buf);
  input b, b_buf;
endmodule // a_
