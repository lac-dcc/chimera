// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0


`ifndef FIXED_POINT_FFT
`define FIXED_POINT_FFT

`include "fft/helpers/sine_wave.v"
`include "fft/helpers/bit_reverse.v"
`include "fft/cooley_tukey/helpers/stage.v"
module fft_cooley_tukey_FFT #(
  parameter int BIT_WIDTH  = 32,
  parameter int DECIMAL_PT = 16,
  parameter int N_SAMPLES  = 8
) (
  input  logic [BIT_WIDTH - 1:0] recv_msg[N_SAMPLES],
  input  logic                   recv_val,
  output logic                   recv_rdy,

  output logic [BIT_WIDTH - 1:0] send_msg[N_SAMPLES],
  output logic                   send_val,
  input  logic                   send_rdy,

  input logic reset,
  input logic clk
);

  logic [BIT_WIDTH - 1:0] real_msg     [$clog2(N_SAMPLES)+1] [N_SAMPLES];
  logic [BIT_WIDTH - 1:0] complex_msg  [$clog2(N_SAMPLES)+1] [N_SAMPLES];

  logic                   val_in       [$clog2(N_SAMPLES)+1];
  logic                   rdy_in       [$clog2(N_SAMPLES)+1];

  logic [BIT_WIDTH - 1:0] sine_wave_out[          N_SAMPLES];


  assign val_in[0]                 = recv_val;
  assign recv_rdy                  = rdy_in[0];

  assign send_val                  = val_in[$clog2(N_SAMPLES)];
  assign rdy_in[$clog2(N_SAMPLES)] = send_rdy;

  generate
    for (genvar i = 0; i < N_SAMPLES; i++) begin
      assign complex_msg[0][i] = 0;
    end
  endgenerate

  fft_helpers_SineWave #(
    .N(N_SAMPLES),
    .W(BIT_WIDTH),
    .D(DECIMAL_PT)
  ) sine_wave (
    .out(sine_wave_out)
  );

  fft_helpers_BitReverse #(
    .N_SAMPLES(N_SAMPLES),
    .BIT_WIDTH(BIT_WIDTH)
  ) bit_reverse (
    .in (recv_msg),
    .out(real_msg[0])
  );

  generate
    for (genvar i = 0; i < $clog2(N_SAMPLES); i++) begin
      fft_cooley_tukey_helpers_Stage #(
        .BIT_WIDTH (BIT_WIDTH),
        .DECIMAL_PT(DECIMAL_PT),
        .N_SAMPLES (N_SAMPLES),
        .STAGE_FFT (i)
      ) fft_stage (
        .recv_msg_real(real_msg[i]),
        .recv_msg_imag(complex_msg[i]),
        .recv_val     (val_in[i]),
        .recv_rdy     (rdy_in[i]),

        .send_msg_real(real_msg[i+1]),
        .send_msg_imag(complex_msg[i+1]),
        .send_val     (val_in[i+1]),
        .send_rdy     (rdy_in[i+1]),

        .sine_wave_out(sine_wave_out),

        .reset(reset),
        .clk  (clk)
      );
    end
  endgenerate

  generate
    for (genvar i = 0; i < N_SAMPLES; i++) begin
      assign send_msg[i] = real_msg[$clog2(N_SAMPLES)][i];
    end
  endgenerate
endmodule

`endif
