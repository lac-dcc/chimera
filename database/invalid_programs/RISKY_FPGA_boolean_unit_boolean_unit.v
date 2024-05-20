// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../muxes/mux_4.v"

module boolean_unit#(
  parameter WIDTH = 8
) (
  input [3:0] alufn_sig,
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  output [WIDTH-1:0] out
);


genvar i;

generate
  for (i = 0; i < WIDTH; i=i+1) begin
    mux_4 u0 (
    .a(alufn_sig[0]),
    .b(alufn_sig[1]),
    .c(alufn_sig[2]),
    .d(alufn_sig[3]),
    .s0(a[i]),
    .s1(b[i]),
    .out(out[i])
  );
  end
endgenerate

endmodule
  
