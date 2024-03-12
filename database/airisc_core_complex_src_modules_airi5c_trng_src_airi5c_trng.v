//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File          : airi5c_trng.v
// Author        : S. Nolting
// Creation Date : 05.04.2023
// Abstract      : Technology-agnostic true-random number generator.
//

`timescale 1ns/100ps
`include "airi5c_hasti_constants.vh"

module airi5c_trng
#(
  parameter BASE_ADDR  = 'hC0000800,
  parameter FIFO_DEPTH = 5
)
(
  input                               n_reset,
  input                               clk,
  // AHB-Lite interface
  input      [`HASTI_ADDR_WIDTH-1:0]  haddr,
  input                               hwrite,
  input      [`HASTI_TRANS_WIDTH-1:0] htrans,
  input      [`HASTI_BUS_WIDTH-1:0]   hwdata,
  output reg [`HASTI_BUS_WIDTH-1:0]   hrdata,
  output                              hready,
  output     [`HASTI_RESP_WIDTH-1:0]  hresp
);


  // bus interface
  reg [`HASTI_ADDR_WIDTH-1:0] haddr_r;
  reg                         hwrite_r;

  // control register
  reg enable;

  // trng/FIFO interface
  wire [7:0] trng_data, rnd_data, rnd_masked;
  wire       trng_valid, rnd_valid, rnd_rd, rnd_clr;

  // Check if we're inside the Matrix (aka "is this a simulation?")
  localparam IS_SIM = 0 // seems like we're on real hardware
// pragma translate_off
// synthesis translate_off
// synthesis synthesis_off
// RTL_SYNTHESIS OFF
  | 1 // this MIGHT be a simulation
// RTL_SYNTHESIS ON
// synthesis synthesis_on
// synthesis translate_on
// pragma translate_on
  ;


// ----------------------------------------------------------------------
//  Bus Interface
// ----------------------------------------------------------------------

  always @(posedge clk, negedge n_reset) begin
    if (!n_reset) begin
      haddr_r  <= `HASTI_ADDR_WIDTH'h0;
      hwrite_r <= 1'b0;
    end else begin
      haddr_r  <= haddr;
      hwrite_r <= hwrite;
    end
  end

  always @(posedge clk, negedge n_reset) begin
    if (!n_reset) begin
      hrdata <= `HASTI_BUS_WIDTH'h0;
      enable <= 1'b0;
    end else begin
      // write access
      if (hwrite_r) begin
        if (haddr_r == BASE_ADDR) begin
          enable <= hwdata[30]; // enable TRNG
        end
      end
      // read access
      hrdata <= `HASTI_BUS_WIDTH'h0; // default
      if (|htrans & !hwrite) begin
        if (haddr == BASE_ADDR) begin
          hrdata[7:0] <= rnd_masked; // random data byte
          hrdata[29]  <= IS_SIM;     // to check if we are in a simulation
          hrdata[30]  <= enable;     // enable TRNG
          hrdata[31]  <= rnd_valid;  // data is valid when set
        end
      end
    end
  end

  assign hready = 1'b1;
  assign hresp  = `HASTI_RESP_OKAY;


// ----------------------------------------------------------------------
//  TRNG Core
// ----------------------------------------------------------------------

  // the TRNG core (entropy source + post-processing)
  // https://github.com/stnolting/neoTRNG
  // uses a "know-good" configuration
  neoTRNG
  #(
    .NUM_CELLS(3),
    .NUM_INV_START(3),
    .NUM_INV_INC(2),
    .NUM_INV_DELAY(2),
    .POST_PROC_EN(1),
    .IS_SIM(IS_SIM)
  )
  trng_core (
    .clk_i(clk),
    .rstn_i(n_reset),
    .enable_i(enable),
    .data_o(trng_data),
    .valid_o(trng_valid)
  );

  // random data buffer (re-use the CPU's instruction prefetch buffer as general purpose FIFO)
  airi5c_prebuf_fifo
  #(
    .FIFO_DEPTH(FIFO_DEPTH),
    .FIFO_WIDTH(8)
  )
  random_pool (
    .clk_i(clk),
    .rstn_i(n_reset),
    .clear_i(rnd_clr),
    .hfull_o(),
    .we_i(trng_valid),
    .data_i(trng_data),
    .free_o(),
    .re_i(rnd_rd),
    .data_o(rnd_data),
    .avail_o(rnd_valid)
  );

  // mask output to make sure the same random byte cannot be read twice
  assign rnd_masked = (rnd_valid == 1'b1) ? rnd_data : 8'h00;

  // clear FIFO when module is disabled
  assign rnd_clr = ~enable;

  // read FIFO when reading the TRNG's interface register
  assign rnd_rd = ((|htrans == 1'b1) && (hwrite == 1'b0) && (haddr == BASE_ADDR)) ? 1'b1 : 1'b0;


endmodule
