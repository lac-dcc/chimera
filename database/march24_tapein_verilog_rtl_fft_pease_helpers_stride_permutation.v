// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef fft_pease_helpers_STRIDE_PERMUTATION
`define fft_pease_helpers_STRIDE_PERMUTATION

/// Takes a bus of width `N_SAMPLES` and performs a stride permutation on it.
/// Described on page 33 of https://link.springer.com/chapter/10.1007/978-1-4757-2767-8_2
/// @param N_SAMPLES The number of samples in the bus. Must be divisible by two.
/// @param WIDTH The width of each sample in the bus.
module fft_pease_helpers_StridePermutation #(
  parameter int N_SAMPLES = 8,
  parameter int BIT_WIDTH = 32
) (
  input  logic [BIT_WIDTH-1:0] recv[N_SAMPLES],
  output logic [BIT_WIDTH-1:0] send[N_SAMPLES]
);

  generate
    for (genvar i = 0; i < N_SAMPLES / 2; i++) begin
      assign send[i] = recv[i*2];
      assign send[i+N_SAMPLES/2] = recv[i*2+1];
    end
  endgenerate

endmodule

`endif
