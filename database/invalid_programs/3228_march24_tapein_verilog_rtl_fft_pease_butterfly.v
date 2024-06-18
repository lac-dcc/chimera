// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//================================================
// Iterative Butterfly Unit
// -----------------------------------------------
// This module performs the butterfly operation
// which is equivalent to the following matrix
// multiplication:
// | 1  w |   | a |   | c |
// | 1 -w | * | b | = | d |
// where w is the ith root of unity e^(-2*pi*i/n)
// and n/d is the fixed point specification`
// This module is used in the FFT module, and
// contains an area optimization parameter to
// save area by not including the complex
// multiplier in certain cases.
//================================================
`default_nettype none
`ifndef fixed_point_combinational_Butterfly
`define fixed_point_combinational_Butterfly
`include "complex_multiplier.v"

module fixed_point_combinational_Butterfly #(
  parameter int n = 32,
  parameter int d = 16,
  parameter int b = 4
  // Number of inputs to rotate around
) (
  input logic [n-1:0] ar[b],
  input logic [n-1:0] ac[b],
  input logic [n-1:0] br[b],
  input logic [n-1:0] bc[b],
  input logic [n-1:0] wr[b],
  input logic [n-1:0] wc[b],

  output logic [n-1:0] cr[b],
  output logic [n-1:0] cc[b],
  output logic [n-1:0] dr[b],
  output logic [n-1:0] dc[b]
);

  /* performs the butterfly operation, equivalent to doing
    | 1  w |   | a |   | c |
    | 1 -w | * | b | = | d |
  */

  logic [n-1:0] m_cr[b];
  logic [n-1:0] m_cc[b];

  generate
    for (genvar i = 0; i < b; i++) begin
      // complex multiplier instantiation as combinatorial
      fixed_point_combinational_ComplexMultiplierS #(
        .n(n),
        .d(d)
      ) mult (
        .ar(wr[i]),
        .ac(wc[i]),
        .br(br[i]),
        .bc(bc[i]),
        .cr(m_cr[i]),
        .cc(m_cc[i])
      );

      assign cc[i] = ac[i] + m_cc[i];
      assign cr[i] = ar[i] + m_cr[i];
      assign dc[i] = ac[i] - m_cc[i];
      assign dr[i] = ar[i] - m_cr[i];
    end
  endgenerate


endmodule
`endif
