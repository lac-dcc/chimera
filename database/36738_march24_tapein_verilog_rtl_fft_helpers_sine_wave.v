// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef fft_helpers_SINE_WAVE
`define fft_helpers_SINE_WAVE
`default_nettype none

// Macro to generate a sine table for N evenly spaced values from 0 to 2pi.
// Returns values in a fixedpoint format with D fractional bits and W total bits.
module fft_helpers_SineWave #(
  parameter int N = 8,
  parameter int W = 32,
  parameter int D = 16
) (
  output logic [W - 1:0] out[N]
);
  // arccos(-1) = pi
  localparam real PI = $acos(-1);

  // Checks on parameters to make sure behavior is well defined.
  generate
    if (D >= 32) begin
      $error("D must be less than 32");
    end
    for (genvar i = 0; i < N; i++) begin
      localparam real sinvalue = $sin(2 * PI * i / N);
      /* verilator lint_off UNUSED */
      int fixedptvalue = int'(sinvalue * 2.0 ** D);
      /* lint_on */

      assign out[i] = {{(W - D - 1) {fixedptvalue[31]}}, fixedptvalue[D:0]};
    end
  endgenerate

endmodule

`endif
