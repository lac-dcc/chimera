// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_afifo.v
//
// Abstract:
//   Asynchronus FIFO
//   block ram version
//  Created:
//    5 november 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
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

module fm_afifo (
  clk_core,
  clk_vi,
  rst_x,
  i_wstrobe,
  i_dt,
  o_full,
  i_renable,
  o_dt,
  o_empty,
  o_dnum
);

// set default parameters
parameter P_RANGE = 7;
parameter P_DEPTH = 1 << P_RANGE;  // 128
`include "polyphony_params.v"
////////////////////////////
// I/O definition
////////////////////////////
input         clk_core;       // system clock
input         clk_vi;
input         rst_x;          // system reset
input         i_wstrobe;      // write strobe
input  [P_IB_DATA_WIDTH-1:0]
              i_dt;           // write data
output        o_full;         // write data full
input         i_renable;      // read enable
output [15:0] o_dt;           // read data
output        o_empty;        // read data empty
output [P_RANGE:0] o_dnum;     // written data number

/////////////////////////
//  Register definition
/////////////////////////
reg [P_RANGE-1:0] r_write_counter;
reg [P_RANGE-1:0] r_read_counter;
// data registers
`ifdef PP_BUSWIDTH_64
reg [1:0]        r_select_hw;
`else
reg              r_select_hw;
`endif
/////////////////////////
//  wire definition
/////////////////////////
wire             o_full;
wire             o_empty;
wire [15:0]      o_dt;
wire             w_we;
wire             w_re;
wire [P_IB_DATA_WIDTH-1:0]
                 w_dt;
wire [P_RANGE-1:0] w_read_counter_inc;
wire [P_RANGE-1:0] w_read_counter;
/////////////////////////
//  assign statement
/////////////////////////
`ifdef PP_BUSWIDTH_64
assign o_dt = (r_select_hw == 'd1) ? w_dt[31:16] :
              (r_select_hw == 'd2) ? w_dt[47:32] :
              (r_select_hw == 'd3) ? w_dt[63:48] :
               w_dt[15:0];
`else
assign o_dt = (r_select_hw) ? w_dt[31:16] : w_dt[15:0];
`endif
assign o_dnum = 0;
assign o_full = 1'b0;
assign o_empty = 1'b0;
assign w_we = i_wstrobe;
`ifdef PP_BUSWIDTH_64
assign w_re = i_renable & (r_select_hw == 'd3);
`else
assign w_re = i_renable & r_select_hw;
`endif

assign w_read_counter_inc = r_read_counter + 1'b1;
assign w_read_counter = (w_re) ? w_read_counter_inc : r_read_counter;

////////////////////////
// always 
///////////////////////
  // write side (clk_core)
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_write_counter <= 'd0;
    end else begin
      if (w_we) begin
        r_write_counter <= r_write_counter + 1'b1;
      end
    end
  end

  // read side (clk_vi)
  always @(posedge clk_vi or negedge rst_x) begin
    if (~rst_x) begin
      r_read_counter <= 'd0;
    end else begin
      if (w_re) begin
        r_read_counter <= w_read_counter_inc;
      end
    end
  end

  // select half word
  always @(posedge clk_vi or negedge rst_x) begin
    if (~rst_x) begin
      r_select_hw <= 'd0;
    end else begin
        if (i_renable) r_select_hw <= r_select_hw + 1'b1;
    end
  end

///////////////////
// module instance
///////////////////
    fm_cmn_bram_02 #(P_IB_DATA_WIDTH, P_RANGE) bram_00 (
        .clka(clk_core),
        .clkb(clk_vi),
        .wea(w_we),
        .addra(r_write_counter),
        .addrb(w_read_counter),
        .dia(i_dt),
        .doa(),
        .dob(w_dt)
    );

endmodule


