// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

/* Generated by Yosys 0.19 (git sha1 a45c131b37c, clang 13.1.6 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_not2_1(a, out0);
  input [1:0] a;
  wire [1:0] a;
  output [1:0] out0;
  wire [1:0] out0;
  LUT1 #(
    .INIT(2'h1)
  ) lut1_0 (
    .I0(a[0]),
    .O(out0[0])
  );
  LUT1 #(
    .INIT(2'h1)
  ) lut1_1 (
    .I0(a[1]),
    .O(out0[1])
  );
endmodule

