// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef fft_pease_helpers_TWIDDLE_GENERATOR
`define fft_pease_helpers_TWIDDLE_GENERATOR

/// Twiddle Generator module for a stage in a pease FFT
module fft_pease_helpers_TwiddleGenerator #(
  parameter int BIT_WIDTH  = 4,
  parameter int DECIMAL_PT = 2,
  parameter int SIZE_FFT   = 8,
  parameter int STAGE_FFT  = 0
) (
  input logic [BIT_WIDTH - 1:0] sine_wave_in[SIZE_FFT],  //sine_wave_in = sin(2*pi m / N)

  output logic [BIT_WIDTH - 1:0] twiddle_real     [SIZE_FFT/2],
  output logic [BIT_WIDTH - 1:0] twiddle_imaginary[SIZE_FFT/2]
);
  generate
    if (STAGE_FFT == 0) begin
      for (genvar i = 0; i < SIZE_FFT / 2; i = i + 1) begin
        assign twiddle_real[i] = {{BIT_WIDTH - DECIMAL_PT - 1{1'b0}}, 1'b1, {DECIMAL_PT{1'b0}}};
        assign twiddle_imaginary[i] = 0;
      end
      logic unused = &sine_wave_in;
    end else begin

      for (genvar m = 0; m < 2 ** STAGE_FFT; m = m + 1) begin
        for (genvar j = 0; j < 2 ** ($clog2(SIZE_FFT) - STAGE_FFT - 1); j = j + 1) begin
          localparam int stageLeft = $clog2(SIZE_FFT) - STAGE_FFT - 1;
          localparam int idx = m * (2 ** stageLeft);
          localparam int si = idx + j;
          assign twiddle_real[si] = sine_wave_in[idx+SIZE_FFT/4];
          assign twiddle_imaginary[si] = sine_wave_in[idx+SIZE_FFT/2];
        end
      end
    end
  endgenerate

endmodule

`endif
