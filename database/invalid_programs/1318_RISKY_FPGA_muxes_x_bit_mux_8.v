// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../muxes/mux_8.v"
module x_bit_mux_8 #(
  parameter WIDTH = 16
) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input [WIDTH-1:0] c,
  input [WIDTH-1:0] d,
  input [WIDTH-1:0] e,
  input [WIDTH-1:0] f,
  input [WIDTH-1:0] g,
  input [WIDTH-1:0] h,
  input s0,
  input s1,
  input s2,
  output [WIDTH-1:0] out
);

genvar i;

generate 
  for (i = 0; i < WIDTH; i = i + 1) begin
    mux_8 mux0 (.a(a[i]), .b(b[i]), .c(c[i]), .d(d[i]),
      .e(e[i]), .f(f[i]), .g(g[i]), .h(h[i]),
      .s0(s0), .s1(s1), .s2(s2), .out(out[i]));
  end
endgenerate

endmodule
