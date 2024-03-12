//=======================================================================
// Project Polyphony
//
// File:
//   fm_line_mem.v
//
// Abstract:
//   Block RAM FIFO
//   keeps 1 line rgb colors for aa-filter, this is not a fifo
//  Created:
//    22 January 2009
//
// Copyright (c) 2008-2009  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module fm_line_mem (
  clk_vi,
  rst_x,
  i_clear,
  i_dt,
  i_renable,
  o_dt
);

// set default parameters
parameter P_WIDTH = 16;
parameter P_RANGE = 10;
parameter P_DEPTH = 640;
////////////////////////////
// I/O definition
////////////////////////////
input         clk_vi;       // system clock
input         rst_x;        // system reset
input         i_clear;      // write strobe
input  [P_WIDTH-1:0] i_dt;  // write data
input         i_renable;    // read enable
output [P_WIDTH-1:0] o_dt;  // read data

/////////////////////////
//  Register definition
/////////////////////////
reg [P_RANGE-1:0] r_write_counter;
reg [P_RANGE-1:0] r_read_counter;
/////////////////////////
//  wire definition
/////////////////////////
wire             w_we;
wire             w_re;
wire [P_RANGE-1:0] w_read_counter_inc;
wire [P_RANGE-1:0] w_read_counter;
/////////////////////////
//  assign statement
/////////////////////////

assign w_read_counter_inc = r_read_counter + 1'b1;
assign w_read_counter = (w_re) ? w_read_counter_inc : r_read_counter;
assign w_we = i_renable;
assign w_re = i_renable;
////////////////////////
// always statement
///////////////////////
  // write side
  always @(posedge clk_vi or negedge rst_x) begin
    if (~rst_x) begin
      r_write_counter <= 'd0;
    end else begin
      if (i_clear)  r_write_counter <= 'd0;
      else if (w_we) r_write_counter <= r_write_counter + 1'b1;
    end
  end

  // read side
  always @(posedge clk_vi or negedge rst_x) begin
    if (~rst_x) begin
      r_read_counter <= 'd0;
    end else begin
      if (i_clear)   r_read_counter <= 'd0;
      else if (w_re) r_read_counter <= w_read_counter_inc;
    end
  end

///////////////////
// module instance
///////////////////
    fm_cmn_bram_01 #(P_WIDTH, P_RANGE) bram_00 (
        .clk(clk_vi),
        .we(w_we),
        .a(r_write_counter),
        .dpra(w_read_counter),
        .di(i_dt),
        .spo(),
        .dpo(o_dt)
    );
endmodule


