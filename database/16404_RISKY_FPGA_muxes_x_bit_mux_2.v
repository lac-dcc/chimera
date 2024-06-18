// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module x_bit_mux_2 #(
  parameter WIDTH = 16
) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input s,
  output [WIDTH-1:0] out
);

genvar i;

generate
  for (i = 0; i < WIDTH; i = i + 1) begin
    mux_2 mux0 (.a(a[i]), .b(b[i]), .s(s), .out(out[i]));
  end
endgenerate

endmodule
