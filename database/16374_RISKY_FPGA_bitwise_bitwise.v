// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module bitwise #(
  parameter BITS = 8
) (
  input [BITS-1:0] a,
  input b,
  output [BITS-1:0] p
);

genvar i;

generate 
  for (i = 0; i < BITS; i = i + 1) begin
    assign p[i] = a[i] & b;
  end
endgenerate
endmodule

