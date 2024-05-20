// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License

module mul4(a, b, p);
  input [3:0] a, b;
  output [7:0] p;

  wire [3:0] w1, w2, w3, w0;
  wire [5:0] t2, t3, t4;
  wire [3:0] t1;
  wire [5:0] w5, w6;
  wire [3:0] w4;

  mul2 m1(a[1:0], b[1:0], w0[3:0]);
  mul2 m2(a[3:2], b[1:0], w1[3:0]);
  mul2 m3(a[1:0], b[3:2], w2[3:0]);
  mul2 m4(a[3:2], b[3:2], w3[3:0]);

  add4 a1(w1[3:0], {2'b0, w0[3:2]}, w4);
  add6 a2({2'b0, w2[3:0]}, {w3[3:0], 2'b0}, w5);
  add6 a3({2'b0, w4[3:0]}, w5, w6);

  assign p[1:0] = w0[1:0];
  assign p[7:2] = w6[5:0];

endmodule
