// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef fft_cooley_tukey_helpers_CROSSBAR
`define fft_cooley_tukey_helpers_CROSSBAR
`default_nettype none

/// FFT Crossbar
/// @param BIT_WIDTH  : Data bit width
/// @param SIZE_FFT   : Number of points in the FFT
/// @param STAGE_FFT  : Stage of the FFT to generate crossbar for
/// @param FRONT      : 1 if the crossbar is in the front of the FFT, 0 if it is in the back
module fft_cooley_tukey_helpers_Crossbar #(
  parameter int BIT_WIDTH = 32,
  parameter int SIZE_FFT  = 8,
  parameter int STAGE_FFT = 0,
  parameter bit FRONT     = 1
) (
  input  logic [BIT_WIDTH - 1:0] recv_real     [SIZE_FFT],
  input  logic [BIT_WIDTH - 1:0] recv_imaginary[SIZE_FFT],
  input  logic                   recv_val      [SIZE_FFT],
  output logic                   recv_rdy      [SIZE_FFT],

  output logic [BIT_WIDTH - 1:0] send_real     [SIZE_FFT],
  output logic [BIT_WIDTH - 1:0] send_imaginary[SIZE_FFT],
  output logic                   send_val      [SIZE_FFT],
  input  logic                   send_rdy      [SIZE_FFT]
);
  generate
    for (genvar m = 0; m < 2 ** STAGE_FFT; m = m + 1) begin
      for (genvar i = m; i < SIZE_FFT; i = i + 2 ** (STAGE_FFT + 1)) begin
        if (FRONT == 1) begin
          assign send_real[i+m]        = recv_real[i];
          assign send_imaginary[i+m]   = recv_imaginary[i];
          assign send_val[i+m]         = recv_val[i];
          assign recv_rdy[i+m]         = send_rdy[i];

          assign send_real[i+m+1]      = recv_real[i+2**STAGE_FFT];
          assign send_imaginary[i+m+1] = recv_imaginary[i+2**STAGE_FFT];
          assign send_val[i+m+1]       = recv_val[i+2**STAGE_FFT];
          assign recv_rdy[i+m+1]       = send_rdy[i+2**STAGE_FFT];
        end else begin
          assign send_real[i]                   = recv_real[i+m];
          assign send_imaginary[i]              = recv_imaginary[i+m];
          assign send_val[i]                    = recv_val[i+m];
          assign recv_rdy[i]                    = send_rdy[i+m];

          assign send_real[i+2**STAGE_FFT]      = recv_real[i+m+1];
          assign send_imaginary[i+2**STAGE_FFT] = recv_imaginary[i+m+1];
          assign send_val[i+2**STAGE_FFT]       = recv_val[i+m+1];
          assign recv_rdy[i+2**STAGE_FFT]       = send_rdy[i+m+1];
        end
      end
    end
  endgenerate

endmodule

`endif
