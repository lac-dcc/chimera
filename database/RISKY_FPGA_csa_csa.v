// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module csa #(
  parameter BITS = 64
) (
  input [BITS-1:0] x,
  input [BITS-1:0] y,
  input [BITS-1:0] z,
  output [BITS-1:0] s,
  output [BITS-1:0] c
);

assign c[0] = 1'b0;

genvar i;

generate 
  for (i = 0; i < BITS-1; i = i + 1) begin
    full_adder fa(.bit1(x[i]), .bit2(y[i]), .cin(z[i]), .sum(s[i]), .cout(c[i+1]));
  end
endgenerate

assign s[BITS-1] = 1'b0;

endmodule
