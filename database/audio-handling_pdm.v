// This program was cloned from: https://github.com/b-etz/audio-handling
// License: Apache License 2.0

`timescale 1ns/10ps

//   pdm.v
//   Support RTL related to demodulation of digital mic PDM data streams
//
//   Copyright 2024 Brady Etz
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

// PDM CIC Decimator
// Converts a two-wire PDM interface to left and right output data.
// The downconversion/decimation ratio, R, is set by (f_PDM / f_PCM) from the external clocks.
// N sets the number of cascaded stages, defaulting to 4 stages.
// Output data width is controlled by DataWidth, defaulting to 24 bits.
//   *** This width should be at least (N * log2(R) + 2) to avoid noise from truncation.
//
// PDM left/right channels are assigned per the following table:
// | Channel | SELECT | Data Changes On | Data Valid On |
// | ------- | ------ | --------------- | ------------- |
// | Left    | VDD/1  | Rising CLK      | Falling CLK   |
// | Right   | GND/0  | Falling CLK     | Rising CLK    |
//
// A CIC filter topology is a good first stage for high decimation ratios. 
// It is an area-efficient way to downsample with so-so antialiasing built in.
// It passes the binary data through N integrators.
// It passes the integrated data through N differentiators (comb stages) at a reduced clock.
// This provides a coarse low-pass response and inexpensive downsampling.
// 
// * This design assumes synchronous consumption of the output with the input clock edge.
//   There is no ready/valid handshaking on the output side.
//   *** pdm_clk_i AND pcm_clk_i MUST BE SYNCHRONOUS.
// * Both channels are processed together on pcm_clk_i after downsampling. 
//   This delays one channel by one half-cycle of pdm_clk_i relative to the other channel.
//   The delayed channel depends on the phase of pcm_clk_i relative to pdm_clk_i.
// * To reduce area and simplify startup, this design is a stream with undefined initial state. 
//   It assumes no detrimental effects from bad data on startup for the first (N+1)*R PDM clock cycles.
// 
module pdm_cic_decimator #(
  parameter DataWidth = 24, // Integer >= 2
  parameter N = 4 // Number of cascaded integrators/combs, positive integer
) (
  input                             pdm_clk_i, pdm_dat_i,
  input                             pcm_clk_i,
  output reg signed [DataWidth-1:0] ldata_o, rdata_o
);
  integer i;
  reg signed [DataWidth-1:0] int_l[N-1:0], int_r[N-1:0];
  always @(negedge pdm_clk_i) begin // Left channel integrator stages
    int_l[0] <= pdm_dat_i ? int_l[0]+1 : int_l[0]-1;
    for (i = 1; i < N; i = i+1) begin
      int_l[i] <= int_l[i] + int_l[i-1];
    end
  end
  always @(posedge pdm_clk_i) begin // Right channel integrator stages
    int_r[0] <= pdm_dat_i ? int_r[0]+1 : int_r[0]-1;
    for (i = 1; i < N; i = i+1) begin
      int_r[i] <= int_r[i] + int_r[i-1];
    end
  end
  
  reg signed [DataWidth-1:0] diff_l[N-1:0], diff_r[N-1:0];
  generate // Left channel comb stages
  if (N > 1) begin
    always @(posedge pcm_clk_i) begin
      diff_l[0] <= int_l[N-1];
      diff_l[1] <= int_l[N-1] - diff_l[0];
      for (i = 2; i < N; i = i+1) begin
        diff_l[i] <= diff_l[i-2] - diff_l[i-1];
      end
      ldata_o <= diff_l[N-2] - diff_l[N-1];
    end
  end else begin
    always @(posedge pcm_clk_i) begin
      diff_l[0] <= int_l[0];
      ldata_o <= int_l[0] - diff_l[0];
    end
  end
  endgenerate
  generate // Right channel comb stages
  if (N > 1) begin
    always @(posedge pcm_clk_i) begin
      diff_r[0] <= int_r[N-1];
      diff_r[1] <= int_r[N-1] - diff_r[0];
      for (i = 2; i < N; i = i+1) begin
        diff_r[i] <= diff_r[i-2] - diff_r[i-1];
      end
      rdata_o <= diff_r[N-2] - diff_r[N-1];
    end
  end else begin
    always @(posedge pcm_clk_i) begin
      diff_r[0] <= int_r[0];
      rdata_o <= int_r[0] - diff_r[0];
    end
  end
  endgenerate
endmodule // pdm_cic_decimator

// DC Offset Remover
// Calculates and removes the steady-state DC offset from a PCM stream
// The module uses an accumulator in a negative feedback loop to store an offset estimate.
// The accumulator uses a data width of twice the input/output width.
// Signals which do not change over many cycles set the offset estimate.
// 
module dc_offset_remover #(
  parameter DataWidth = 24 // Positive integer
) (
  input                         pcm_clk_i,
  input  signed [DataWidth-1:0] data_i,
  output signed [DataWidth-1:0] data_o // Output data is not clocked to save area
);
  reg signed [2*DataWidth-1:0] acc_r;
  always @(posedge pcm_clk_i) begin
    acc_r <= acc_r + { {DataWidth{data_o[DataWidth-1]}}, data_o };
  end
  
  assign data_o = data_i - acc_r[2*DataWidth-1:DataWidth];
endmodule //dc_offset_remover
