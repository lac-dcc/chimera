// This program was cloned from: https://github.com/The-OpenROAD-Project/OpenROAD
// License: BSD 3-Clause "New" or "Revised" License

module testcase(clk, din, dout);
  input clk;
  input din;
  output dout;

  DFF_X1 _0_ (
    .CK(clk),
    .D(din),
    .Q(dout)
  );
endmodule
