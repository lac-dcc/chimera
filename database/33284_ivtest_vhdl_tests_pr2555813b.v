// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
  wire x, y;
a__a a_(
.b_buf(y),
.b (x)
);
endmodule

module a__a(b_buf, b);
output b_buf;
input b;
endmodule // a__a
