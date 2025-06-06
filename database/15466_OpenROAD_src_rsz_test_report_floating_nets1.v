// This program was cloned from: https://github.com/The-OpenROAD-Project/OpenROAD
// License: BSD 3-Clause "New" or "Revised" License

module top (in1, clk1, clk2, clk3, out);
  input in1, clk1, clk2, clk3;
  output out;

   // unconnected reg output
  DFF_X1 r1 (.D(in1), .CK(clk1), .Q(r1q), .QN(r1qn));

  // no driver for r2q
  BUF_X1 u1 (.A(r2q), .Z(u1z));
  AND2_X1 u2 (.A1(r1q), .A2(u1z), .ZN(u2z));
  DFF_X1 r3 (.D(u2z), .CK(clk3), .Q(out));
endmodule // top
