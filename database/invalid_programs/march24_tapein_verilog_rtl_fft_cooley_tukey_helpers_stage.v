// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0


`ifndef fft_cooley_tukey_helpers_STAGE
`define fft_cooley_tukey_helpers_STAGE

`include "fft/cooley_tukey/helpers/twiddle_generator.v"
`include "fft/cooley_tukey/helpers/crossbar.v"
`include "fixed_point/iterative/butterfly.v"


/// Performs one stage of the FFT
/// @param BIT_WIDTH  The width of the fixed point numbers
/// @param DECIMAL_PT The number of decimal bits in each fixed point number
/// @param N_SAMPLES  The number of samples in the FFT
/// @param STAGE_FFT  The stage of the FFT to calculate
module fft_cooley_tukey_helpers_Stage #(
  parameter int BIT_WIDTH  = 32,
  parameter int DECIMAL_PT = 16,
  parameter int N_SAMPLES  = 8,
  parameter int STAGE_FFT  = 0
) (
  input  logic [BIT_WIDTH - 1:0] recv_msg_real[N_SAMPLES],
  input  logic [BIT_WIDTH - 1:0] recv_msg_imag[N_SAMPLES],
  input  logic                   recv_val,
  output logic                   recv_rdy,

  output logic [BIT_WIDTH - 1:0] send_msg_real[N_SAMPLES],
  output logic [BIT_WIDTH - 1:0] send_msg_imag[N_SAMPLES],
  output logic                   send_val,
  input  logic                   send_rdy,

  input logic [BIT_WIDTH - 1:0] sine_wave_out[N_SAMPLES],

  input logic reset,
  input logic clk
);

  logic                 val_in [N_SAMPLES];
  logic                 rdy_in [N_SAMPLES];

  logic                 val_out[N_SAMPLES];
  logic                 rdy_out[N_SAMPLES];

  logic [N_SAMPLES-1:0] imm;
  generate
    for (genvar i = 0; i < N_SAMPLES; i++) begin
      assign val_in[i] = recv_val;
      assign imm[i] = rdy_in[i];
    end
    assign recv_rdy = (imm == {N_SAMPLES{1'b1}});
  endgenerate


  logic [BIT_WIDTH - 1:0] butterfly_in_real      [  N_SAMPLES];
  logic [BIT_WIDTH - 1:0] butterfly_out_real     [  N_SAMPLES];
  logic [BIT_WIDTH - 1:0] butterfly_in_imaginary [  N_SAMPLES];
  logic [BIT_WIDTH - 1:0] butterfly_out_imaginary[  N_SAMPLES];

  logic                   val_interior_in        [  N_SAMPLES];
  logic                   rdy_interior_in        [  N_SAMPLES];
  logic                   val_interior_out       [  N_SAMPLES];
  logic                   rdy_interior_out       [  N_SAMPLES];

  logic [BIT_WIDTH - 1:0] twiddle_real           [N_SAMPLES/2];
  logic [BIT_WIDTH - 1:0] twiddle_imaginary      [N_SAMPLES/2];

  logic                   val_interior_mini      [N_SAMPLES/2];
  logic                   rdy_interior_mini      [N_SAMPLES/2];

  fft_cooley_tukey_helpers_Crossbar #(
    .BIT_WIDTH(BIT_WIDTH),
    .SIZE_FFT(N_SAMPLES),
    .STAGE_FFT(STAGE_FFT),
    .FRONT(1)
  ) xbar_in_1 (
    .recv_real(recv_msg_real),
    .recv_imaginary(recv_msg_imag),
    .recv_val(val_in),
    .recv_rdy(rdy_in),
    .send_real(butterfly_in_real),
    .send_imaginary(butterfly_in_imaginary),
    .send_val(val_interior_in),
    .send_rdy(rdy_interior_in)
  );

  generate
    for (genvar b = 0; b < N_SAMPLES / 2; b++) begin
      localparam int IX = (b % (1 << STAGE_FFT)) * (N_SAMPLES / (2 * (1 << STAGE_FFT)));

      localparam byte MMC = (
        (IX == 0)? 1 :
        (IX == N_SAMPLES >> 1)? 2 :
        (IX == N_SAMPLES >> 2)? 4 :
        (IX == 3 * (N_SAMPLES >> 2))? 3 : 0
      );

      fixed_point_iterative_Butterfly #(
        .n(BIT_WIDTH),
        .d(DECIMAL_PT),
        .mult(MMC)
      ) bfu_in (
        .ar      (butterfly_in_real[b*2]),
        .ac      (butterfly_in_imaginary[b*2]),
        .br      (butterfly_in_real[(b*2)+1]),
        .bc      (butterfly_in_imaginary[(b*2)+1]),
        .wr      (twiddle_real[b]),
        .wc      (twiddle_imaginary[b]),
        .recv_val(val_interior_in[b*2] && val_interior_in[(b*2)+1]),
        .recv_rdy(rdy_interior_mini[b]),
        .cr      (butterfly_out_real[b*2]),
        .cc      (butterfly_out_imaginary[b*2]),
        .dr      (butterfly_out_real[(b*2)+1]),
        .dc      (butterfly_out_imaginary[(b*2)+1]),
        .send_rdy(send_val && rdy_interior_out[b*2] && rdy_interior_out[(b*2)+1]),
        .send_val(val_interior_mini[b]),
        .reset   (reset),
        .clk     (clk)
      );

      assign val_interior_out[(b*2)+1] = val_interior_mini[b];  //
      assign val_interior_out[b*2]     = val_interior_mini[b];

      assign rdy_interior_in[(b*2)+1]  = rdy_interior_mini[b];
      assign rdy_interior_in[b*2]      = rdy_interior_mini[b];
    end
  endgenerate



  fft_cooley_tukey_helpers_Crossbar #(
    .BIT_WIDTH(BIT_WIDTH),
    .SIZE_FFT(N_SAMPLES),
    .STAGE_FFT(STAGE_FFT),
    .FRONT(0)
  ) xbar_out_1 (
    .recv_real(butterfly_out_real),
    .recv_imaginary(butterfly_out_imaginary),
    .recv_val(val_interior_out),
    .recv_rdy(rdy_interior_out),
    .send_real(send_msg_real),
    .send_imaginary(send_msg_imag),
    .send_val(val_out),
    .send_rdy(rdy_out)
  );

  fft_cooley_tukey_helpers_TwiddleGenerator #(
    .BIT_WIDTH (BIT_WIDTH),
    .DECIMAL_PT(DECIMAL_PT),
    .SIZE_FFT  (N_SAMPLES),
    .STAGE_FFT (STAGE_FFT)
  ) twiddle_generator (
    .sine_wave_in(sine_wave_out),
    .twiddle_real(twiddle_real),
    .twiddle_imaginary(twiddle_imaginary)
  );

  logic [N_SAMPLES - 1:0] imm2;
  generate
    for (genvar i = 0; i < N_SAMPLES; i++) begin
      assign imm2[i] = val_out[i];
      assign rdy_out[i] = send_rdy & send_val;
    end
    assign send_val = (imm2 == {N_SAMPLES{1'b1}});
  endgenerate
endmodule

`endif
