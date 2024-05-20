// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`default_nettype none
`ifndef FIXED_POINT_COMB_MULTIPLIER
`define FIXED_POINT_COMB_MULTIPLIER

module fixed_point_combinational_Multiplier #(
  parameter int n = 32,  // bit width
  parameter int d = 16,  // number of decimal bits
  parameter bit sign = 1  // 1 if signed, 0 otherwise.
) (
  input  logic [n-1:0] a,
  input  logic [n-1:0] b,
  output logic [n-1:0] c
);

  logic [d+n-1:0] prod;
  logic [d+n-1:0] a_ext, b_ext;

  generate
    if (sign) begin
      assign a_ext = {{d{a[n-1]}}, a};
      assign b_ext = {{d{b[n-1]}}, b};
      assign prod  = (a_ext * b_ext);
    end else begin
      assign prod = (a * b);
    end
  endgenerate

  assign c = prod[n+d-1:d];


  // The upper n bits of prod are discarded.
  generate
    if (d > 0) begin
      /* verilator lint_off UNUSED */
      logic unused;
      /* verilator lint_on UNUSED */
      assign unused = &{1'b0, prod[d-1:0], 1'b0};
    end
  endgenerate

endmodule

`endif
