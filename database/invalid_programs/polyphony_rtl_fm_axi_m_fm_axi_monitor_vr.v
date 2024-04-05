//=======================================================================
// Project Polyphony
//
// File:
//   fm_axi_monitor_vr.v
//
// Abstract:
//   read valid-ready timer
//
//  Created:
//    8 October 2013
//
// Copyright (c) 2013  Kenji Ishimaru, All rights reserved.
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

module fm_axi_monitor_vr (
  clk_core,
  rst_x,
  i_start,
  i_clear,
  i_stop,
  i_alen,
  // result out
  o_set_no_wait,
  o_set_bukets,
  o_set_no_more,
  o_counter,
  o_bukets_no_wait,
  o_bukets_0,
  o_bukets_1,
  o_bukets_2,
  o_bukets_3,
  o_bukets_more,
  o_max_count,
  o_min_count,
  o_bukets_len_0,
  o_bukets_len_1,
  o_bukets_len_2,
  o_bukets_len_3
);
`include "polyphony_axi_def.v"
//////////////////////////////////
// parameter definition
//////////////////////////////////
localparam P_NUM_OF_BUCKETS  = 'd4;
localparam P_BUCKET_RANGE    = 'd1;
localparam P_BUCKET_SIZE     = 'd32;
localparam P_COUNTER_SIZE    = 'd32;

localparam P_IDLE = 1'b0;
localparam P_RUN = 1'b1;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  input clk_core;
  input rst_x;
  input i_start;
  input i_clear;
  input i_stop;
  input  [P_AXI_M_ARLEN-1:0] i_alen;
  // result out
  output o_set_no_wait;
  output [P_NUM_OF_BUCKETS-1:0] o_set_bukets;
  output o_set_no_more;
  output [P_COUNTER_SIZE-1:0] o_counter;
  output [P_BUCKET_SIZE-1:0] o_bukets_no_wait;
  output [P_BUCKET_SIZE-1:0] o_bukets_0;
  output [P_BUCKET_SIZE-1:0] o_bukets_1;
  output [P_BUCKET_SIZE-1:0] o_bukets_2;
  output [P_BUCKET_SIZE-1:0] o_bukets_3;
  output [P_BUCKET_SIZE-1:0] o_bukets_more;
  output [P_COUNTER_SIZE-1:0] o_max_count;
  output [P_COUNTER_SIZE-1:0] o_min_count;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_0;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_1;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_2;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_3;

//////////////////////////////////
// reg
//////////////////////////////////
  reg [P_BUCKET_SIZE-1:0]  r_bukets[P_NUM_OF_BUCKETS-1:0];
  reg [P_BUCKET_SIZE-1:0]  r_bukets_len[P_NUM_OF_BUCKETS-1:0];
  reg [P_BUCKET_SIZE-1:0]  r_bukets_no_wait;
  reg [P_BUCKET_SIZE-1:0]  r_bukets_more;
  reg [P_COUNTER_SIZE-1:0]  r_counter;
  reg r_state;
  reg [P_COUNTER_SIZE-1:0] r_max_count;
  reg [P_COUNTER_SIZE-1:0] r_min_count;
//////////////////////////////////
// wire
//////////////////////////////////
  wire   w_inc;
  wire   [P_NUM_OF_BUCKETS-1:0]
                 w_set;
  wire   [P_NUM_OF_BUCKETS-1:0]
                 w_set_len;
  wire   w_set_no_wait;
  wire   w_set_more;
  wire   w_start;
  wire [P_COUNTER_SIZE-1:0]  w_counter_inc;

  wire   w_set_max_min;
   
//////////////////////////////////
// assign
//////////////////////////////////
  assign w_inc = (r_state == P_RUN);

  assign  w_set_no_wait = (r_state == P_IDLE) & i_start & i_stop;
  assign  w_set_more = (P_BUCKET_RANGE*P_NUM_OF_BUCKETS <= w_counter_inc) &
                        ((r_state == P_RUN) & i_stop);
  assign  w_start = (r_state == P_IDLE) & i_start & (!i_stop);
  assign  w_counter_inc = (r_state == P_IDLE) ? 'd0 : r_counter + 1'b1;

  assign  w_set_max_min = w_set_no_wait | ((r_state == P_RUN) & i_stop);

  assign o_bukets_no_wait = r_bukets_no_wait;
  assign o_bukets_0 = r_bukets[0];
  assign o_bukets_1 = r_bukets[1];
  assign o_bukets_2 = r_bukets[2];
  assign o_bukets_3 = r_bukets[3];
  assign o_bukets_more = r_bukets_more;
  assign o_set_no_wait = w_set_no_wait;
  assign o_set_bukets = w_set;
  assign o_set_no_more = w_set_more;
  assign o_counter = r_counter;
  assign o_max_count = r_max_count;
  assign o_min_count = r_min_count;
  assign o_bukets_len_0 = r_bukets_len[0];
  assign o_bukets_len_1 = r_bukets_len[1];
  assign o_bukets_len_2 = r_bukets_len[2];
  assign o_bukets_len_3 = r_bukets_len[3];
//////////////////////////////////
// always
//////////////////////////////////
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_state <= P_IDLE;
    end else begin
      case (r_state)
        P_IDLE: begin
          if (i_start) begin
            if (!i_stop) r_state <= P_RUN;
          end
        end
        P_RUN: begin
          if (i_stop|i_clear) begin
            r_state <= P_IDLE;
          end
        end
      endcase
    end
  end


  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_counter <= {P_COUNTER_SIZE{1'b0}};
    end else begin
      if (w_start|i_clear) begin
        r_counter <= {P_COUNTER_SIZE{1'b0}};
      end else begin
        if (w_inc) r_counter <= w_counter_inc;
      end
    end
  end

genvar gi;
generate for (gi=0;gi<P_NUM_OF_BUCKETS;gi=gi+1)begin
  assign w_set[gi] = ((P_BUCKET_RANGE*gi <= w_counter_inc) &
                     (w_counter_inc < P_BUCKET_RANGE*(gi+1))) & 
                     (((r_state == P_IDLE) & i_start & i_stop) |
                      ((r_state == P_RUN) & i_stop));

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets[gi] <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear) begin
        r_bukets[gi] <= {P_BUCKET_SIZE{1'b0}};
      end else begin
        if (w_set[gi]) r_bukets[gi] <= r_bukets[gi] + 1'b1;
      end
    end
  end

end
endgenerate

 // special case
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_no_wait <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear) begin
        r_bukets_no_wait <= {P_BUCKET_SIZE{1'b0}};
      end else begin
        if (w_set_no_wait) r_bukets_no_wait <= r_bukets_no_wait + 1'b1;
      end
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_more <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear) begin
        r_bukets_more <= {P_BUCKET_SIZE{1'b0}};
      end else begin
        if (w_set_more) r_bukets_more <= r_bukets_more + 1'b1;
      end
    end
  end
  // max min
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_max_count <= {P_COUNTER_SIZE{1'b0}};
      r_min_count <= {P_COUNTER_SIZE{1'b1}};
    end else begin
      if (i_clear) begin
        r_max_count <= {P_COUNTER_SIZE{1'b0}};
        r_min_count <= {P_COUNTER_SIZE{1'b1}};
      end else begin
      if ( w_set_max_min) begin
	if (!w_set_no_wait)
          if (w_counter_inc > r_max_count) r_max_count <= w_counter_inc;
	if (w_set_no_wait) r_min_count <= 'd0;
        else if (w_counter_inc < r_min_count) r_min_count <= w_counter_inc;
      end
      end
    end
  end

genvar gj;
generate for (gj=0;gj<P_NUM_OF_BUCKETS;gj=gj+1)begin
  assign w_set_len[gj] = ((P_BUCKET_RANGE*gj <= i_alen) &
                     (i_alen < P_BUCKET_RANGE*(gj+1))) & 
                     (((r_state == P_IDLE) & i_start & i_stop) |
                      ((r_state == P_RUN) & i_stop));

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_len[gj] <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear) begin
        r_bukets_len[gj] <= {P_BUCKET_SIZE{1'b0}};
      end else begin
        if (w_set_len[gj]) r_bukets_len [gj] <= r_bukets_len[gj] + 1'b1;
      end
    end
  end

end
endgenerate

endmodule
