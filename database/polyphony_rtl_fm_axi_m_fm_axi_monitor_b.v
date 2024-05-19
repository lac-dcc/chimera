// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_axi_monitor_b.v
//
// Abstract:
//   axi monitor bresp
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

module fm_axi_monitor_b (
  clk_core,
  rst_x,
  i_clear,
  i_wvalid,  // wvalid & wlast
  i_wready,
  i_bid,
  i_bresp,
  i_bvalid,
  i_bready,
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
  o_num_of_cmd,
  o_num_of_b
);
`include "polyphony_axi_def.v"
localparam P_TIMER_WIDTH = 'd16;
localparam P_IDLE = 1'b0;
localparam P_RUN = 1'b1;   
localparam P_NUM_OF_BUCKETS  = 'd4;
localparam P_BUCKET_RANGE    = 'd4;
localparam P_BUCKET_SIZE     = 'd32;
localparam P_COUNTER_SIZE    = 'd32;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  input clk_core;
  input rst_x;
  input i_clear;
  //   read port
  input  i_wvalid;
  input  i_wready;
  // read response
  input  [P_AXI_M_BID-1:0] i_bid;
  input  [P_AXI_M_BRESP-1:0] i_bresp;
  input  i_bvalid;
  input  i_bready;
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
  output [P_BUCKET_SIZE-1:0] o_num_of_cmd;
  output [P_BUCKET_SIZE-1:0] o_num_of_b;
   
//////////////////////////////////
// reg
//////////////////////////////////
  reg [P_TIMER_WIDTH-1:0] r_timer;
  reg r_state;
  reg [P_BUCKET_SIZE-1:0]  r_bukets[P_NUM_OF_BUCKETS-1:0];
  reg [P_BUCKET_SIZE-1:0]  r_bukets_no_wait;
  reg [P_BUCKET_SIZE-1:0]  r_bukets_more;

  reg [P_BUCKET_SIZE-1:0] r_num_of_cmd;
  reg [P_BUCKET_SIZE-1:0] r_num_of_b;
   
//////////////////////////////////
// wire
//////////////////////////////////
  wire  w_fifo_empty;
  wire  w_fifo_ren;
  wire  w_set_first;

  wire [P_TIMER_WIDTH-1:0] w_timer;
  wire w_start;
  wire w_clear_len;
  wire w_stop;
  wire [P_AXI_M_ARLEN-1:0] w_len_inc;
  wire w_inc;
  wire   [P_NUM_OF_BUCKETS-1:0]
                 w_set;
  wire   w_set_no_wait;
  wire   w_set_more;
  wire [P_TIMER_WIDTH-1:0] w_timer_diff;
//////////////////////////////////
// assign
//////////////////////////////////
  assign w_start = i_wvalid & i_wready;
  assign w_clear_len = w_start & (r_state == P_IDLE);
  assign w_inc = (r_state == P_RUN) & i_bvalid & i_bready;
  assign w_fifo_ren = w_inc ;
  assign w_stop = w_inc;
  assign w_set_first = w_inc;
   
  assign  w_set_no_wait = (r_state == P_IDLE) & w_start & 
                          (w_timer_diff == 'd0);
  assign  w_set_more = (P_BUCKET_RANGE*P_NUM_OF_BUCKETS <= w_timer_diff) &
                        w_set_first & !w_fifo_empty;
  assign w_timer_diff = (r_timer > w_timer) ? {1'b0,r_timer} - {1'b0,w_timer} :
                                              {1'b1,r_timer} - {1'b0,w_timer};
                        
  assign o_bukets_no_wait = r_bukets_no_wait;
  assign o_bukets_0 = r_bukets[0];
  assign o_bukets_1 = r_bukets[1];
  assign o_bukets_2 = r_bukets[2];
  assign o_bukets_3 = r_bukets[3];
  assign o_bukets_more = r_bukets_more;
  assign o_set_no_wait = w_set_no_wait;
  assign o_set_bukets = w_set;
  assign o_set_no_more = w_set_more;
  assign o_counter = w_timer_diff;
  assign o_num_of_cmd = r_num_of_cmd;
  assign o_num_of_b = r_num_of_b;
//////////////////////////////////
// always
//////////////////////////////////
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_state <= P_IDLE;
    end else begin
      case (r_state)
        P_IDLE: begin
          if (w_start) begin
            r_state <= P_RUN;
          end
        end
        P_RUN: begin
          if (w_stop| i_clear) begin
            r_state <= P_IDLE;
          end
        end
      endcase
    end
  end

genvar gi;
generate for (gi=0;gi<P_NUM_OF_BUCKETS;gi=gi+1)begin
  assign w_set[gi] = ((P_BUCKET_RANGE*gi <= w_timer_diff) &
                     (w_timer_diff < P_BUCKET_RANGE*(gi+1))) & 
                      w_set_first & !w_fifo_empty;

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets[gi] <= {P_BUCKET_SIZE{1'b0}};
    end else begin
        if (i_clear) r_bukets[gi] <= {P_BUCKET_SIZE{1'b0}};
        else
        if (w_set[gi]) r_bukets[gi] <= r_bukets[gi] + 1'b1;
    end
  end

end
endgenerate

 // special case
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_no_wait <= {P_BUCKET_SIZE{1'b0}};
    end else begin
        if (i_clear) r_bukets_no_wait <= {P_BUCKET_SIZE{1'b0}};
        else
        if (w_set_no_wait) r_bukets_no_wait <= r_bukets_no_wait + 1'b1;
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_more <= {P_BUCKET_SIZE{1'b0}};
    end else begin
        if (i_clear) r_bukets_more <= {P_BUCKET_SIZE{1'b0}};
        else
        if (w_set_more) r_bukets_more <= r_bukets_more + 1'b1;
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_timer <= 'd0;
    end else begin
      if (i_clear) r_timer <= 'd0;  
      else r_timer <= r_timer + 1'b1;
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_num_of_cmd <= 'd0;
      r_num_of_b <= 'd0;
    end else begin
      if (i_clear) begin
        r_num_of_cmd <= 'd0;
        r_num_of_b <= 'd0;
      end else begin      
      if (i_wvalid&i_wready) r_num_of_cmd <= r_num_of_cmd + 1'b1;
      if (i_bvalid&i_bready) r_num_of_b <= r_num_of_b + 1'b1;
      end
    end
  end

   
fm_fifo #(.P_WIDTH(P_TIMER_WIDTH),
          .P_RANGE(4),
          .P_CLEAR("TRUE")) u_fifo (
  .clk_core(clk_core),
  .rst_x(rst_x | i_clear),
  .i_wstrobe(i_wvalid & i_wready),
  .i_dt(r_timer),
  .o_full(),
  .i_renable(w_fifo_ren),
  .o_dt(w_timer),
  .o_empty(w_fifo_empty),
  .o_dnum()
);

endmodule
