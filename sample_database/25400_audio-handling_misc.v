// This program was cloned from: https://github.com/b-etz/audio-handling
// License: Apache License 2.0

`timescale 1ns/10ps

//   misc.v
//
//   Copyright 2022 Brady Etz
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

// MP3 decoder TBD...
// Requires review of MP3 decoding standard, ISO/IEC 11172-3:1993, https://www.iso.org/standard/22412.html

module pattern_display(
  input  clk_i, rstn_i,
  output reg [3:0] bits_o
);
  
  wire [31:0] rng_bits;
  rand_num_gen RNG(clk_i, rstn_i, rng_bits);
  
  reg [23:0] counter;
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      bits_o <= 4'b0;
      counter <= 0;
    end
    else begin
      if (counter >= 23'h400000) begin
        counter <= 0;
        bits_o <= rng_bits[3:0];
      end
      else counter <= counter + 1;
    end
  end
endmodule


module rand_num_gen #(
  parameter N = 32
) (
  input  clk_i, rstn_i,
  output reg [N-1:0] dat_o
);
  
  // Design derived from work in Indhumathi Devi, et al. 
  // "Hardware Random Number Generator Using FPGA", Journal of Cyber Security and Mobility, Vol 8 Issue 4, Oct 2019.
  
  reg [N-1:0] ringosc_o, ringosc_r, lhca_o, delay_r;
  
  always @* begin
    ringosc_o[0] = ~(ringosc_o[N-1] ^ ringosc_o[0] ^ ringosc_o[1]); // Inverted to avoid stability
    ringosc_o[N-1] = ringosc_o[N-2] ^ ringosc_o[N-1] ^ ringosc_o[0];
    
    lhca_o[0] = 1'b0 ^ ringosc_r[0] ^ delay_r[0] ^ dat_o[1];
    lhca_o[N-1] = 1'b0 ^ ringosc_r[N-1] ^ delay_r[N-1] ^ dat_o[N-2];
  end
  
  genvar i;
  generate
    for (i = 1; i < N-1; i = i + 1) begin : generalized_ring_osc
      always @* begin
        ringosc_o[i] = ringosc_o[i-1] ^ ringosc_o[i] ^ ringosc_o[i+1];
      end
    end
    for (i = 1; i < N-1; i = i + 1) begin : generalized_lhca
      always @* begin
        lhca_o[i] = dat_o[i-1] ^ ringosc_r[i] ^ delay_r[i] ^ dat_o[i+1];
      end
    end
  endgenerate
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      ringosc_r <= 0;
      delay_r <= 0;
      dat_o <= 0;
    end
    else begin
      ringosc_r <= ringosc_o;
      dat_o <= lhca_o;
      delay_r <= dat_o;
    end
  end
  
endmodule


module counter #(
  parameter Duration = 1000
) (
  input  clk_i, rstn_i, enable,
  output reg done
);
  reg [$clog2(Duration)-1:0] count;
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      count <= 0; done <= 1'b0;
    end
    else begin
      if (enable) begin
        if (count < Duration - 1) count <= count + 1;
        else                      done <= 1'b1;
      end else begin
        count <= 0; done <= 1'b0;
      end
    end
  end
endmodule


module gray_encoder #(
  parameter DataWidth = 4
) (
  input  [DataWidth-1:0] data_i, // Binary input, unsigned
  output [DataWidth-1:0] data_o  // Gray code output
);
  assign data_o = data_i ^ (data_i >> 1);
endmodule

module gray_decoder #(
  parameter DataWidth = 4
) (
  input  [DataWidth-1:0] data_i, // Gray code input
  output reg [DataWidth-1:0] data_o  // Binary output, unsigned
);
  integer i;
  always @*
    for (i = 0; i < DataWidth; i = i+1)
      data_o[i] = ^(data_i >> i);
endmodule

