// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_axi_monitor_rv
//
// Abstract:
//   AXI read channel monitor
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

module fm_axi_monitor_r (
  clk_core,
  rst_x,
  i_clear,
  i_arvalid,
  i_arready,
  i_arlen,
  i_rresp,
  i_rlast,
  i_rvalid,
  i_rready,
  // result out
  o_set_no_wait,
  o_set_bukets,
  o_set_no_more,
  o_timer,
  o_bukets_no_wait,
  o_bukets_0,
  o_bukets_1,
  o_bukets_2,
  o_bukets_3,
  o_bukets_more,
  o_rvalid_invalid_cycles,
  o_state,
  o_len,
  o_total_bytes,
  o_rd_cont,
  o_rd_discont,
  o_bukets_nrdy_0,
  o_bukets_nrdy_1,
  o_bukets_nrdy_2,
  o_bukets_nrdy_3
);
`include "polyphony_axi_def.v"
localparam P_TIMER_WIDTH = 'd12;
localparam P_IDLE = 1'b0;
localparam P_RUN = 1'b1;   
localparam P_NUM_OF_BUCKETS  = 'd4;
localparam P_BUCKET_RANGE    = 'd8;
localparam P_BUCKET_RANGE_NRDY = 'd4;
localparam P_BUCKET_SIZE     = 'd32;
localparam P_COUNTER_SIZE    = 'd32;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  input clk_core;
  input rst_x;
  input i_clear;
   
  //   read port
  input  [P_AXI_M_ARLEN-1:0] i_arlen;
  input  i_arvalid;
  input  i_arready;
  // read response
  input  [P_AXI_M_RRESP-1:0] i_rresp;
  input  i_rlast;
  input  i_rvalid;
  input  i_rready;
  // result out
  output o_set_no_wait;
  output [P_NUM_OF_BUCKETS-1:0] o_set_bukets;
  output o_set_no_more;
  output [P_TIMER_WIDTH-1:0] o_timer;
  output [P_BUCKET_SIZE-1:0] o_bukets_no_wait;
  output [P_BUCKET_SIZE-1:0] o_bukets_0;
  output [P_BUCKET_SIZE-1:0] o_bukets_1;
  output [P_BUCKET_SIZE-1:0] o_bukets_2;
  output [P_BUCKET_SIZE-1:0] o_bukets_3;
  output [P_BUCKET_SIZE-1:0] o_bukets_more;
  output [P_BUCKET_SIZE-1:0] o_rvalid_invalid_cycles;
  output 		     o_state;
  output [P_AXI_M_ARLEN-1:0] o_len;
  output [31:0] 	     o_total_bytes;
  output [P_BUCKET_SIZE-1:0] o_rd_cont;
  output [P_BUCKET_SIZE-1:0] o_rd_discont;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_0;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_1;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_2;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_3;
   
   
//////////////////////////////////
// reg
//////////////////////////////////
  reg [P_TIMER_WIDTH-1:0] r_timer;
  reg r_state;
  reg [P_AXI_M_ARLEN-1:0] r_len;
  reg [P_BUCKET_SIZE-1:0]  r_bukets[P_NUM_OF_BUCKETS-1:0];
  reg [P_BUCKET_SIZE-1:0]  r_bukets_no_wait;
  reg [P_BUCKET_SIZE-1:0]  r_bukets_more;
  reg [P_BUCKET_SIZE-1:0]  r_rvalid_invalid_cycles;
  reg [31:0] 	           r_total_bytes;
  reg [P_BUCKET_SIZE-1:0]  r_rd_cont;
  reg [P_BUCKET_SIZE-1:0]  r_rd_discont;
  reg r_rvalid_invalid_flag;
  reg [P_BUCKET_SIZE-1:0]  r_bukets_nrdy[P_NUM_OF_BUCKETS-1:0];
  reg [15:0] r_nrdy_counter;
  reg [P_BUCKET_SIZE-1:0]  r_bukets_nrdy_more;
//////////////////////////////////
// wire
//////////////////////////////////
  wire  w_fifo_empty;
  wire  w_fifo_ren;
  wire  w_set_first;
  wire  [P_AXI_M_ARLEN-1:0] w_len;


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
  wire [P_NUM_OF_BUCKETS-1:0]
                 w_set_nrdy;
   wire   w_set_nrdy_more;
//////////////////////////////////
// assign
//////////////////////////////////
  assign w_start = !w_fifo_empty & i_rvalid;
  assign w_clear_len =  ((r_state == P_RUN)&w_stop&i_rvalid);
  assign w_len_inc =  r_len + 1'b1;
  assign w_inc = i_rvalid & i_rready;
  assign w_fifo_ren = ((r_state == P_IDLE) & (w_len == 'd0)) |
                      (w_inc & (w_len == r_len)) ;
  assign w_stop = w_inc & (w_len == r_len) ;
//  assign w_stop = w_inc i_rlast;
  assign w_set_first = w_inc & (r_len == 'd0);
   
  assign  w_set_no_wait = w_set_first & 
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
  assign o_timer = w_timer_diff;
  assign o_rvalid_invalid_cycles = r_rvalid_invalid_cycles;
  assign o_state = r_state;
  assign o_len = r_len;
//  assign o_total_bytes = r_total_bytes;
  assign o_total_bytes = r_bukets_nrdy_more;
  assign o_rd_cont = r_rd_cont;
  assign o_rd_discont = r_rd_discont;

  assign o_bukets_nrdy_0 = r_bukets_nrdy[0];
  assign o_bukets_nrdy_1 = r_bukets_nrdy[1];
  assign o_bukets_nrdy_2 = r_bukets_nrdy[2];
  assign o_bukets_nrdy_3 = r_bukets_nrdy[3];

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
            if (w_len == 'd0) r_state <= P_IDLE;
            else r_state <= P_RUN;
          end
        end
        P_RUN: begin
          if (w_stop|i_clear) begin
            r_state <= P_IDLE;
          end
        end
      endcase
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_len <= 'd0;
    end else begin
      if (i_clear) r_len <= 'd0;
      else begin
      if (w_clear_len) begin
        r_len <= 'd0;
      end else begin
        if (w_inc) r_len <= w_len_inc;
      end
      end
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
        else if (w_set[gi]) r_bukets[gi] <= r_bukets[gi] + 1'b1;
    end
  end

end
endgenerate

// read wait
genvar gj;
generate for (gj=0;gj<P_NUM_OF_BUCKETS;gj=gj+1)begin
  assign w_set_nrdy[gj] = ((P_BUCKET_RANGE_NRDY*gj <= r_nrdy_counter) &
                     (r_nrdy_counter < P_BUCKET_RANGE_NRDY*(gj+1))) & 
                      w_fifo_ren & !w_fifo_empty;

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_nrdy[gj] <= {P_BUCKET_SIZE{1'b0}};
    end else begin
        if (i_clear) r_bukets_nrdy[gj] <= {P_BUCKET_SIZE{1'b0}};
        else
        if (w_set_nrdy[gj]) r_bukets_nrdy[gj] <= r_bukets_nrdy[gj] + 1'b1;
    end
  end

end
endgenerate
  
  assign  w_set_nrdy_more = (P_BUCKET_RANGE*P_NUM_OF_BUCKETS <= r_nrdy_counter) &
                             (i_rvalid & i_rready & i_rlast);
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_nrdy_more <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear) begin
        r_bukets_nrdy_more <= {P_BUCKET_SIZE{1'b0}};
      end else begin
        if (w_set_nrdy_more) r_bukets_nrdy_more <= r_bukets_nrdy_more + 1'b1;
      end
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_nrdy_counter<= 'd0;
    end else begin
      if (i_clear) r_nrdy_counter<= 'd0;
      else
      if (w_fifo_ren) r_nrdy_counter <= 'd0;
      else if (!i_rvalid & (r_state == P_RUN)) r_nrdy_counter <= r_nrdy_counter + 1'b1;
    end
  end

   
// rvalid invalid cycles
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_rvalid_invalid_cycles <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear) begin
        r_rvalid_invalid_cycles <= {P_BUCKET_SIZE{1'b0}};
      end else begin
      if (r_state == P_RUN) begin
        if ((r_len != 'd0) & (!i_rvalid))
          r_rvalid_invalid_cycles <= r_rvalid_invalid_cycles + 1'b1;
      end
      end
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_rvalid_invalid_flag <= 1'b0;
    end else begin
      if (i_clear) begin
        r_rvalid_invalid_flag <= 1'b0;
      end else begin
      if (r_state == P_IDLE) begin
        r_rvalid_invalid_flag <= 1'b0;
      end else
      if (r_state == P_RUN) begin
        if ((r_len != 'd0) & (!i_rvalid))
          r_rvalid_invalid_flag <= 1'b1;
      end
      end
    end
  end
   
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_rd_cont <= 'd0;
      r_rd_discont <= 'd0;
    end else begin
      if (i_clear) begin
        r_rd_cont <= 'd0;
        r_rd_discont <= 'd0;
      end else begin
      if (r_state == P_IDLE) begin
        if (w_start & (w_len == 'd0)) r_rd_cont <= r_rd_cont + 1'b1;
      end else
      if (r_state == P_RUN) begin
	if (w_stop) begin
          if (~r_rvalid_invalid_flag) r_rd_cont <= r_rd_cont + 1'b1;
          if (r_rvalid_invalid_flag) r_rd_discont <= r_rd_discont + 1'b1;
	end
      end
    end
    end
  end

 // special case
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_bukets_no_wait <= {P_BUCKET_SIZE{1'b0}};
    end else begin
      if (i_clear)      r_bukets_no_wait <= {P_BUCKET_SIZE{1'b0}};
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
      else     
      r_timer <= r_timer + 1'b1;
    end
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_total_bytes <= 'd0;
    end else begin
      if (i_clear) r_total_bytes <= 'd0;
      else
      if (w_inc) r_total_bytes <= r_total_bytes + 1'b1;
    end
  end


fm_fifo #(.P_WIDTH(P_AXI_M_ARLEN+P_TIMER_WIDTH),
          .P_RANGE(4),
          .P_CLEAR("TRUE")) u_fifo (
  .clk_core(clk_core),
  .rst_x(rst_x|i_clear),
  .i_wstrobe(i_arvalid & i_arready),
  .i_dt({r_timer,i_arlen}),
  .o_full(),
  .i_renable(w_fifo_ren),
  .o_dt({w_timer,w_len}),
  .o_empty(w_fifo_empty),
  .o_dnum()
);

endmodule
