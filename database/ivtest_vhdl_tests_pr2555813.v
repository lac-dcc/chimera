// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
  wire a, b;
  a__a a_(
          .b_buf(b),
          .b (a)
          );
endmodule

module a__a(b_buf, b);
output b_buf;
input b;
endmodule
