// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module x_bit_mux_4 #(
  parameter WIDTH = 16
) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input [WIDTH-1:0] c,
  input [WIDTH-1:0] d,
  input s0,
  input s1,
  output [WIDTH-1:0] out
);

genvar i;

generate 
  for (i = 0; i < WIDTH; i = i + 1) begin
    mux_4 mux0 (.a(a[i]), .b(b[i]), .c(c[i]), .d(d[i]),
      .s0(s0), .s1(s1), .out(out[i]));
  end
endgenerate

endmodule
