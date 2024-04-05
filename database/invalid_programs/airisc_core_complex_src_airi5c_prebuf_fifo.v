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
//
// File             : airi5c_prebuf_fifo.v
// Author           : S. Nolting
// Creation Date    : 15.12.2022
// Version          : 1.0
// Abstract         : Prefetch Buffer FIFO with parameterizable data width
//                    and depth and async. (!) read access.
// Note             : Derived from https://github.com/stnolting/neorv32/blob/main/rtl/core/neorv32_fifo.vhd (BSD-License)
// History          : 15.12.2021 - initial setup / complete redesign
//
//

`include "airi5c_arch_options.vh"

module airi5c_prebuf_fifo
#(
  parameter FIFO_DEPTH = 2, // has to be a power of two
  parameter FIFO_WIDTH = 32
)
(
  // global control
  input                   clk_i,
  input                   rstn_i,  // async reset
  input                   clear_i, // sync reset
  output                  hfull_o, // at least half full
  // write port
  input                   we_i,
  input  [FIFO_WIDTH-1:0] data_i,
  output                  free_o,
  // read port
  input  [2:0]            re_i,
  output [FIFO_WIDTH-1:0] data_o,
  output                  avail_o
);

// status flags
wire match;
wire full;
wire empty;
wire free;
wire avail;
wire half;

// internal access
wire we;
wire re;


// --------------------------------------------------------------------------------------------
// FIFO read/write pointers
// --------------------------------------------------------------------------------------------

reg [$clog2(FIFO_DEPTH):0] wr_pnt;
reg [$clog2(FIFO_DEPTH):0] rd_pnt;

always @(posedge clk_i or negedge rstn_i) begin
  if (!rstn_i) begin
    wr_pnt <= 0;
    rd_pnt <= 0;
  end else begin
    // write pointer
    if (clear_i) begin
      wr_pnt <= 0;
    end else if (we) begin
      wr_pnt <= wr_pnt + 1;
    end
    // read pointer
    if (clear_i) begin
      rd_pnt <= 0;
    end else if (re) begin
      rd_pnt <= rd_pnt + 1;
    end
  end
end

// safe access - ignore read/write commands if FIFO is empty/full
assign we = we_i & free;
assign re = re_i & avail;


// --------------------------------------------------------------------------------------------
// FIFO status
// --------------------------------------------------------------------------------------------
assign match = ((rd_pnt[$clog2(FIFO_DEPTH)-1:0] == wr_pnt[$clog2(FIFO_DEPTH)-1:0]) || (FIFO_DEPTH == 1)) ? 1'b1 : 1'b0;
assign full  = ((rd_pnt[$clog2(FIFO_DEPTH)] != wr_pnt[$clog2(FIFO_DEPTH)]) && match) ? 1'b1 : 1'b0;
assign empty = ((rd_pnt[$clog2(FIFO_DEPTH)] == wr_pnt[$clog2(FIFO_DEPTH)]) && match) ? 1'b1 : 1'b0;

assign free  = ~full;
assign avail = ~empty;

assign free_o  = free;
assign avail_o = avail;


// half full?
generate
  if (FIFO_DEPTH == 1) begin
    assign hfull_o = full;
  end else begin
    wire [$clog2(FIFO_DEPTH):0] level_diff;
    assign level_diff = wr_pnt - rd_pnt;
    assign hfull_o    = level_diff[$clog2(FIFO_DEPTH)-1] | full;
  end
endgenerate


// --------------------------------------------------------------------------------------------
// FIFO memory access
// --------------------------------------------------------------------------------------------

generate
  if (FIFO_DEPTH == 1) begin // implement a single register

    reg [FIFO_WIDTH-1:0] fifo_mem;
    always @(posedge clk_i) begin
      if (we) begin
        fifo_mem <= data_i;
      end
    end
    assign data_o = fifo_mem; // async. read!

  end else begin // implement a "real" FIFO memory (several entries deep)

    reg [FIFO_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
    always @(posedge clk_i) begin
      if (we) begin
        fifo_mem[wr_pnt[$clog2(FIFO_DEPTH)-1:0]] <= data_i;
      end
    end
    assign data_o = fifo_mem[rd_pnt[$clog2(FIFO_DEPTH)-1:0]]; // async. read!

  end
endgenerate


endmodule
