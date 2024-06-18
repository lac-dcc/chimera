// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef fft_helpers_BIT_REVERSE
`define fft_helpers_BIT_REVERSE
`default_nettype none

/// FFT Bit Reversal
/// @param BIT_WIDTH  : Data bit width
/// @param N_SAMPLES   : Number of points in the FFT
module fft_helpers_BitReverse #(
  parameter int BIT_WIDTH = 32,
  parameter int N_SAMPLES = 8
) (
  input  logic [BIT_WIDTH - 1:0] in [N_SAMPLES],
  output logic [BIT_WIDTH - 1:0] out[N_SAMPLES]
);
  // number of bits in an index
  localparam int n = $clog2(N_SAMPLES);

  generate
    if (N_SAMPLES == 8) begin
      assign out[0] = in[0];
      assign out[1] = in[4];
      assign out[2] = in[2];
      assign out[3] = in[6];
      assign out[4] = in[1];
      assign out[5] = in[5];
      assign out[6] = in[3];
      assign out[7] = in[7];
    end else begin
      for (genvar m = 0; m < N_SAMPLES; m++) begin
        logic [n-1:0] m_rev;
        for (genvar i = 0; i < n; i++) begin
          assign m_rev[n-i-1] = m[i];
        end
        assign out[m] = in[m_rev];
      end
    end
  endgenerate

endmodule

`endif
