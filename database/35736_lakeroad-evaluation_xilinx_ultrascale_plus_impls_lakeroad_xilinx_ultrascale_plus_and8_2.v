// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

/* Generated by Yosys 0.19 (git sha1 a45c131b37c, clang 13.1.6 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_and8_2(a, b, out0);
  input [7:0] a;
  wire [7:0] a;
  input [7:0] b;
  wire [7:0] b;
  output [7:0] out0;
  wire [7:0] out0;
  LUT2 #(
    .INIT(4'h8)
  ) lut2_0 (
    .I0(a[0]),
    .I1(b[0]),
    .O(out0[0])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_1 (
    .I0(a[1]),
    .I1(b[1]),
    .O(out0[1])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_2 (
    .I0(a[2]),
    .I1(b[2]),
    .O(out0[2])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_3 (
    .I0(a[3]),
    .I1(b[3]),
    .O(out0[3])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_4 (
    .I0(a[4]),
    .I1(b[4]),
    .O(out0[4])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_5 (
    .I0(a[5]),
    .I1(b[5]),
    .O(out0[5])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_6 (
    .I0(a[6]),
    .I1(b[6]),
    .O(out0[6])
  );
  LUT2 #(
    .INIT(4'h8)
  ) lut2_7 (
    .I0(a[7]),
    .I1(b[7]),
    .O(out0[7])
  );
endmodule

