// This program was cloned from: https://github.com/scale-lab/OpenPhySyn
// License: BSD 3-Clause "New" or "Revised" License

/* Generated by Yosys 0.9 (git sha1 UNKNOWN, clang  -fPIC -Os) */

module AndModule(a, b, c);
  input a;
  input b;
  output c;
  AND2_X1 _0_ (
    .A1(b),
    .A2(a),
    .ZN(c)
  );
endmodule

module AndOr(a, b, c, d, e, f);
  wire _0_;
  input a;
  input b;
  input c;
  output d;
  output e;
  output f;
  wire h;
  LOGIC1_X1 _1_ (
    .Z(_0_)
  );
  AndModule x (
    .a(a),
    .b(b),
    .c(d)
  );
  OrWrapper y (
    .a(b),
    .b(c),
    .c(e),
    .d(h)
  );
  OrModule z (
    .a(_0_),
    .b(h),
    .c(f)
  );
endmodule

module Constants(clock, io_wide_bus, reduced, out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  input clock;
  input [5:0] io_wide_bus;
  output [2:0] out;
  output reduced;
  NOR3_X1 _06_ (
    .A1(io_wide_bus[4]),
    .A2(io_wide_bus[3]),
    .A3(io_wide_bus[0]),
    .ZN(_01_)
  );
  NOR3_X1 _07_ (
    .A1(io_wide_bus[5]),
    .A2(io_wide_bus[2]),
    .A3(io_wide_bus[1]),
    .ZN(_02_)
  );
  NAND2_X1 _08_ (
    .A1(_01_),
    .A2(_02_),
    .ZN(_00_)
  );
  LOGIC1_X1 _09_ (
    .Z(_04_)
  );
  LOGIC0_X1 _10_ (
    .Z(_05_)
  );
  DFF_X1 _11_ (
    .CK(clock),
    .D(_00_),
    .Q(reduced),
    .QN(_03_)
  );
  AndOr mod (
    .a(reduced),
    .b(_05_),
    .c(_04_),
    .d(out[0]),
    .e(out[1]),
    .f(out[2])
  );
endmodule

module OrModule(a, b, c);
  input a;
  input b;
  output c;
  OR2_X1 _0_ (
    .A1(b),
    .A2(a),
    .ZN(c)
  );
endmodule

module OrWrapper(a, b, c, d);
  wire _0_;
  input a;
  input b;
  output c;
  output d;
  INV_X1 _1_ (
    .A(b),
    .ZN(_0_)
  );
  NAND2_X1 _2_ (
    .A1(_0_),
    .A2(a),
    .ZN(d)
  );
  OrModule z (
    .a(a),
    .b(b),
    .c(c)
  );
endmodule
