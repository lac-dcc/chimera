//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_vtx_fifo.v
//
// Abstract:
//   Block RAM FIFO
//
//  Created:
//    20 October 2008
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

module fm_3d_vtx_fifo (
  clk_core,
  rst_x,
  i_wstrobe,
  i_dt,
  o_full,
  i_renable,
  o_dt,
  o_empty,
  o_dnum,  // 32bit data size
  // 32bit discard flag
  i_req,
  i_len,
  i_discard
);

// set default parameters
parameter P_RANGE = 8;
parameter P_DEPTH = 1 << P_RANGE;
`include "polyphony_params.v"
localparam P_IN_WIDTH = 64;
localparam P_OUT_WIDTH = 32;
////////////////////////////
// I/O definition
////////////////////////////
input         clk_core;       // system clock
input         rst_x;          // system reset
input         i_wstrobe;      // write strobe
input  [P_IN_WIDTH-1:0] i_dt;      // write data
output        o_full;         // write data full
input         i_renable;      // read enable
output [P_OUT_WIDTH-1:0] o_dt;      // read data
output        o_empty;        // read data empty
output [P_RANGE:0] o_dnum;      // written data number
// 32bit discard flag
input i_req;
input [P_IB_LEN_WIDTH-1:0]  i_len;
input i_discard;

/////////////////////////
//  Register definition
/////////////////////////
reg [P_RANGE-1:0] r_write_counter;
reg [P_RANGE-1:0] r_read_counter;
reg [P_RANGE:0]   r_status;
reg               r_sel;
// read data counter
reg [P_IB_LEN_WIDTH-1:0]  r_read_cnt;
reg r_read_lsb;
/////////////////////////
//  wire definition
/////////////////////////
wire             o_full;
wire [P_OUT_WIDTH-1:0] o_dt;
wire [P_IN_WIDTH-1:0] w_dto;
wire [P_IN_WIDTH-1:0] w_dto_th;
wire [1:0]       w_status;
wire             w_we;
wire             w_re;
wire [P_RANGE-1:0] w_read_counter_inc;
wire [P_RANGE-1:0] w_read_counter;

wire w_discard_full;
wire w_discard_ren;
wire [P_IB_LEN_WIDTH:0] w_discard_dt;
wire w_discard_empty;
wire [4:0] w_discard_dnum;
wire       w_read_end;
wire [P_IB_LEN_WIDTH-1:0] w_discard_len;
wire  w_discard_flag;
wire  w_ren64;
wire [63:0] w_dt64;
/////////////////////////
//  assign statement
/////////////////////////
assign {w_discard_flag,w_discard_len} = w_discard_dt;
assign w_ren64 = (r_read_lsb & w_re) | w_discard_ren;
   
assign w_discard_ren = (r_read_cnt == w_discard_len) & w_re &
                       ((!r_read_lsb & w_discard_flag) | (r_read_lsb & !w_discard_flag));
assign w_read_end = w_discard_ren;

assign o_full  = (r_status == P_DEPTH) | w_discard_full;
assign o_empty = (r_status == 0);
assign o_dnum = {r_status,1'b0}; // x2
assign w_dt64 = (r_sel) ? w_dto_th : w_dto;
assign o_dt = (r_read_lsb) ? w_dt64[63:32] : w_dt64[31:0];

assign w_read_counter_inc = r_read_counter + 1'b1;
assign w_read_counter = (w_ren64) ? w_read_counter_inc : r_read_counter;
assign w_we = !o_full & i_wstrobe;
assign w_re = i_renable & !o_empty;
assign w_status = {w_ren64,w_we};
////////////////////////
// always statement
///////////////////////
  // write side
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_write_counter <= 'd0;
    end else begin
      if (w_we) begin
        r_write_counter <= r_write_counter + 1'b1;
      end
    end
  end

  // read side
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_read_counter <= 'd0;
    end else begin
      if (w_ren64) begin
        r_read_counter <= w_read_counter_inc;
      end
    end
  end

  // ram output select
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_sel <= 1'b0;
    end else begin
        r_sel <= (r_write_counter == w_read_counter) ? 1'b1 : 1'b0;
    end
  end

  // status counter
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_status <= 'd0;
    end else begin
      case (w_status)
        2'b01:  r_status <= r_status + 1'b1; // write
        2'b10:  r_status <= r_status - 1'b1; // read
        default:  r_status <= r_status;      // nothing to do 
      endcase
    end
  end

// read data counter
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_read_lsb <= 1'b0;
  end else begin
    if (w_read_end)r_read_lsb <= 1'b0;
    else if (w_re) r_read_lsb <= ~r_read_lsb;
  end
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_read_cnt <= 1;
  end else begin
    if (w_read_end) begin
      r_read_cnt <= 1;
    end else if (w_ren64) begin
      r_read_cnt <= r_read_cnt + 1'b1;
    end
  end
end
///////////////////
// module instance
///////////////////
    fm_cmn_bram_01 #(P_IN_WIDTH, P_RANGE) bram_00 (
        .clk(clk_core),
        .we(w_we),
        .a(r_write_counter),
        .dpra(w_read_counter),
        .di(i_dt),
        .spo(w_dto_th),
        .dpo(w_dto)
    );
    // discard fifo
   fm_fifo #((P_IB_LEN_WIDTH+1),4) u_discard_fifo (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_wstrobe(i_req),
    .i_dt({i_discard,i_len}),
    .o_full(w_discard_full),
    .i_renable(w_discard_ren),
    .o_dt(w_discard_dt),
    .o_empty(w_discard_empty),
    .o_dnum(w_discard_dnum)
  );

endmodule


