//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_mu_cache_ctrl.v
//     block ram  tag version
// Abstract:
//   Cacahe controller
//  Created:
//    26 December 2008
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
//  Revision History
// 2014/03/19 cache tag format 11.5.4 -> 21.5.4
// 2014/03/27 support 64-bit data width
//             32-bit:21.5.4
//             64-bit:20.5.4
module fm_3d_mu_cache_ctrl (
    clk_core,
    rst_x,
    // system configuration
    i_cache_init,
    i_cache_flush,
    o_flush_done,
    // cache in
    i_req_ci,
    i_wr_ci,
    i_adrs_ci,
    o_ack_ci,
    i_len_ci,
    i_be_ci,
    i_strw_ci,
    i_dbw_ci,
    o_ackw_ci,
    o_strr_ci,
    o_dbr_ci,
    // cache tag
    o_tw_valid,
    o_cmp_adrs_pre,
    o_cmp_adrs,
    o_tag_clear,
    i_hit,
    i_need_wb,
    i_entry,
    i_tag_adrs,
    //cache memory
    o_we_cm,
    o_adrs_cm,
    o_adrs_pre_cm,
    o_be_cm,
    o_dt_cm,
    i_dt_cm,
    i_dt_pre_cm,
    // external memory access
    o_req_co,
    o_wr_co,
    o_adrs_co,
    i_ack_co,
    o_len_co,
    o_be_co,
    o_strw_co,
    o_dbw_co,
    i_ackw_co,
    i_strr_co,
    i_dbr_co
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    localparam P_MAIN_IDLE        = 4'd0;
    localparam P_MAIN_TAG_CHECK   = 4'd1;
    localparam P_MAIN_CACHE_WRITE = 4'd2;
    localparam P_MAIN_CACHE_READ0 = 4'd3;
    localparam P_MAIN_CACHE_READ1 = 4'd4;
    localparam P_MAIN_CACHE_READ2 = 4'd5;
    localparam P_MAIN_EXT_WRITE0  = 4'd6;
    localparam P_MAIN_EXT_WRITE1  = 4'd7;
    localparam P_MAIN_EXT_READ    = 4'd8;
    localparam P_MAIN_FLUSH       = 4'd9;
    localparam P_MAIN_FLUSH_TAG_REQ = 4'd10;
    localparam P_MAIN_FLUSH_TAG_CHECK = 4'd11;
    localparam P_MAIN_FLUSH_WRITE = 4'd12;

    // external memory access
    localparam P_EXT_IDLE  = 3'd0;
    localparam P_EXT_WPRE  = 3'd1;
    localparam P_EXT_WREQ  = 3'd2;
    localparam P_EXT_RREQ  = 3'd3;
    localparam P_EXT_WDATA = 3'd4;
    localparam P_EXT_RDATA = 3'd5;

    localparam P_MAX_BURST_LEN = 1 << P_IB_CACHE_LINE_WIDTH;
    localparam P_MAX_FLUSH_ADRS = 1 << P_IB_CACHE_ENTRY_WIDTH;
   
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // system configuration
    input         i_cache_init;
    input         i_cache_flush;
    output        o_flush_done;
    // cache in
    input         i_req_ci;
    input         i_wr_ci;
    input  [P_IB_ADDR_WIDTH-1:0]
                  i_adrs_ci;
    output        o_ack_ci;
    input  [P_IB_LEN_WIDTH-1:0]
                  i_len_ci;
    input  [P_IB_BE_WIDTH-1:0]
                  i_be_ci;
    input         i_strw_ci;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbw_ci;
    output        o_ackw_ci;
    output        o_strr_ci;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbr_ci;
    // cache tag
    output        o_tw_valid;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_cmp_adrs_pre;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_cmp_adrs;
    output        o_tag_clear;
    input         i_hit;
    input         i_need_wb;
    input  [P_IB_CACHE_ENTRY_WIDTH-1:0]
                  i_entry;  // 32 entries
    input  [P_IB_TAG_ADDR_WIDTH-1:0]
                  i_tag_adrs;
    //cache memory
    output        o_we_cm;
    output [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  o_adrs_cm;
    output [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  o_adrs_pre_cm;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_cm;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dt_cm;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dt_cm;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dt_pre_cm;
    // cache out
    output        o_req_co;
    output        o_wr_co;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_co;
    input         i_ack_co;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_co;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_co;
    output        o_strw_co;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbw_co;
    input         i_ackw_co;
    input         i_strr_co;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbr_co;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg    [3:0]  r_state;
    reg    [2:0]  r_ext_state;
    // save access address
    reg           r_wr_ci;
    reg           r_len_ci;
    reg    [P_IB_ADDR_WIDTH-1:0]
                  r_adrs_ci;
    reg    [P_IB_BE_WIDTH-1:0]
                  r_be_ci;
    reg    [P_IB_DATA_WIDTH-1:0]
                  r_dbw_ci;

    reg    [P_IB_CACHE_ENTRY_WIDTH-1:0]
                  r_entry;  // 32 entries
    reg    [P_IB_CACHE_ENTRY_WIDTH-1:0] 
                  r_flush_adrs;
    reg    [P_IB_TAG_ADDR_WIDTH-1:0]
                  r_tag_adrs;
    reg    [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  r_adrs_cm;

    reg    [P_IB_LEN_WIDTH-1:0]
                  r_data_cnt;
    reg           r_ackw_1z;
//////////////////////////////////
// wire 
//////////////////////////////////
    wire   [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  w_adrs_cm_next;
    wire          w_save_adrs;
    wire          w_save_wdata;
    wire          w_ext_wstart;
    wire          w_ext_rstart;
    wire          w_burst_write_end;
    wire          w_burst_read_end;
    wire          w_cnt_clear;
    wire          w_cnt_inc;
    wire          w_ext_read_end;
    wire          w_ext_write_end;
    wire          w_cache_adrs_init;
    wire          w_cache_adrs_inc;
    wire          w_set_entry;
    wire          w_need_write_back;
    wire          w_flush_init;
    wire          w_flush_inc;
    wire          w_flush_end;
    wire          w_cnt_inc_write;
    wire          w_ackw_rise;
    wire          w_ext_read_partial_end;
    wire  [P_IB_CACHE_LINE_WIDTH-1:0]
                  w_adrs_ci_p1;
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_adrs_cm_next = r_adrs_cm +1'b1;
    assign o_flush_done = ((r_state == P_MAIN_FLUSH_TAG_CHECK)&!w_need_write_back&w_flush_end) |
                          ((r_state == P_MAIN_FLUSH_WRITE)&w_ext_write_end&w_flush_end);
    assign w_save_adrs = (r_state == P_MAIN_IDLE) & i_req_ci;
    assign w_save_wdata = w_save_adrs & i_wr_ci;
    assign o_cmp_adrs_pre = (r_state == P_MAIN_FLUSH_TAG_REQ)   ? {{P_IB_TAG_ADDR_WIDTH{1'b0}},
                                                                   r_flush_adrs,
                                                                  {P_IB_CACHE_LINE_WIDTH{1'b0}}} :
                            (r_state == P_MAIN_FLUSH_TAG_CHECK) ? {{P_IB_TAG_ADDR_WIDTH{1'b0}},
                                                                   r_flush_adrs,
                                                                   {P_IB_CACHE_LINE_WIDTH{1'b0}}} :
                                                                   i_adrs_ci;
    assign o_cmp_adrs = (r_state == P_MAIN_FLUSH_TAG_REQ)   ? {{P_IB_TAG_ADDR_WIDTH{1'b0}},
                                                               r_flush_adrs,
                                                               {P_IB_CACHE_LINE_WIDTH{1'b0}}} :
                        (r_state == P_MAIN_FLUSH_TAG_CHECK) ? {{P_IB_TAG_ADDR_WIDTH{1'b0}},
                                                               r_flush_adrs,
                                                               {P_IB_CACHE_LINE_WIDTH{1'b0}}} :
                                                               r_adrs_ci;
    assign w_cnt_clear = w_ext_rstart | w_ext_wstart;
    assign w_cnt_inc = (r_ext_state == P_EXT_RDATA) ? i_strr_co : w_cnt_inc_write;
    assign w_cnt_inc_write = (r_ext_state ==P_EXT_WREQ)  ? (i_ackw_co & i_ack_co) : 
                             (r_ext_state ==P_EXT_WDATA) ?  i_ackw_co : 1'b0;
    assign w_cache_adrs_init = w_cnt_clear;
    assign w_cache_adrs_inc = w_cnt_inc;
    assign w_ext_read_end = (r_ext_state == P_EXT_RDATA)&w_burst_read_end;
    assign w_ext_write_end = (r_ext_state == P_EXT_WDATA)&w_burst_write_end;
    assign w_set_entry = (r_state == P_MAIN_TAG_CHECK)|
                         (r_state == P_MAIN_FLUSH_TAG_CHECK);
    assign o_tw_valid = (r_state == P_MAIN_TAG_CHECK);

    assign o_ack_ci = (r_state == P_MAIN_IDLE);
    assign o_ackw_ci = o_ack_ci;
    assign o_strr_ci = (r_state == P_MAIN_CACHE_READ1) |
                       (r_state == P_MAIN_CACHE_READ2) |
                       ((r_state == P_MAIN_EXT_READ)& w_ext_read_partial_end);

    assign o_dbr_ci = ((r_state == P_MAIN_CACHE_READ1) |
                       (r_state == P_MAIN_CACHE_READ2)) ? i_dt_cm : i_dbr_co;
    assign o_tag_clear = i_cache_init;
    assign o_we_cm = (r_state == P_MAIN_CACHE_WRITE) | 
                     ((r_state == P_MAIN_EXT_READ)&i_strr_co);
//    assign o_adrs_cm = (r_state == P_MAIN_CACHE_WRITE) ? {r_entry,r_adrs_ci[3:0]}:
//                       (r_state == P_MAIN_CACHE_READ0) ? {r_entry,r_adrs_ci[3:0]}:
//                       (r_state == P_MAIN_CACHE_READ1) ? {r_entry,r_adrs_ci[3:0]+ 1'b1}:
//                                                          r_adrs_cm;

    assign w_adrs_ci_p1 = r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]+ 1'b1;
    assign o_adrs_cm = (r_state == P_MAIN_TAG_CHECK)   ? {i_entry,r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]}:  // pre address for read
                       (r_state == P_MAIN_CACHE_WRITE) ? {r_entry,r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]}:
                       (r_state == P_MAIN_CACHE_READ0) ? {r_entry,r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]}:
                       (r_state == P_MAIN_CACHE_READ1) ? {r_entry,w_adrs_ci_p1}:
                                                         r_adrs_cm;

    assign o_adrs_pre_cm = w_adrs_cm_next;
    assign o_be_cm = (r_state == P_MAIN_EXT_READ) ? 
                                                     {P_IB_BE_WIDTH{1'b1}} :
                                                      r_be_ci;
    assign o_dt_cm = (r_state == P_MAIN_EXT_READ) ? i_dbr_co : r_dbw_ci;

    assign w_ext_rstart = ((r_state == P_MAIN_TAG_CHECK) & !i_hit & !w_need_write_back) |
                          (r_state == P_MAIN_EXT_WRITE1);
    assign w_ext_wstart = ((r_state == P_MAIN_TAG_CHECK) & !i_hit & w_need_write_back) |
                          ((r_state == P_MAIN_FLUSH_TAG_CHECK) & w_need_write_back);

    assign w_need_write_back = i_need_wb;

    assign w_burst_write_end = (r_data_cnt == (P_MAX_BURST_LEN-1)) & i_ackw_co;
    assign w_burst_read_end = (r_data_cnt == (P_MAX_BURST_LEN-1)) & i_strr_co;
    assign w_flush_init = (r_state == P_MAIN_FLUSH);
    assign w_flush_inc = ((r_state == P_MAIN_FLUSH_TAG_CHECK) & !w_need_write_back) |
                         ((r_state == P_MAIN_FLUSH_WRITE) & w_ext_write_end);
    assign w_flush_end = (r_flush_adrs == (P_MAX_FLUSH_ADRS-1));

    // external memory access
    assign o_req_co = (r_ext_state == P_EXT_WREQ) | (r_ext_state == P_EXT_RREQ);
    assign o_wr_co = (r_ext_state == P_EXT_WREQ);
                                                     // 21 . 5. 4
    assign o_adrs_co = (r_ext_state == P_EXT_WREQ) ? {r_tag_adrs,r_entry,{P_IB_CACHE_LINE_WIDTH{1'b0}}} :     // flush 
                                                     {r_adrs_ci[P_IB_ADDR_WIDTH-1:P_IB_CACHE_LINE_WIDTH],
                                                      {P_IB_CACHE_LINE_WIDTH{1'b0}}};
    assign o_len_co = 6'h10;
    assign o_be_co = {P_IB_BE_WIDTH{1'b1}};
    assign o_strw_co = (r_ext_state == P_EXT_WREQ) | (r_ext_state == P_EXT_WDATA);
    assign o_dbw_co = ((r_ext_state == P_EXT_WREQ)| w_ackw_rise) ? i_dt_cm :
                       i_dt_pre_cm;
    assign w_ackw_rise = i_ackw_co & !r_ackw_1z;
    //assign w_ext_read_partial_end = ((r_data_cnt == r_adrs_ci[3:0])|
    //                                 (r_data_cnt == w_adrs_ci_p1)) & i_strr_co & !r_wr_ci;
    assign w_ext_read_partial_end = (r_data_cnt == r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]) & i_strr_co & !r_wr_ci;
//////////////////////////////////
// always
//////////////////////////////////
    // main state
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_MAIN_IDLE;
        end else begin
            case(r_state)
                P_MAIN_IDLE: begin
                    if (i_cache_flush) r_state <= P_MAIN_FLUSH;
                    else if (i_req_ci) r_state <= P_MAIN_TAG_CHECK;
                end
                P_MAIN_TAG_CHECK: begin
                    if (i_hit) begin
                        // cache hit
                        if (r_wr_ci) r_state <= P_MAIN_CACHE_WRITE;
                        else r_state <= P_MAIN_CACHE_READ1;  // CACHE_READ0 is only used in cache miss
                    end else begin
                        // cache miss hit
                        if (w_need_write_back) begin
                            r_state <= P_MAIN_EXT_WRITE0;
                        end else begin
                            r_state <= P_MAIN_EXT_READ;
                        end
                    end
                end
                P_MAIN_CACHE_WRITE: begin
                    r_state <= P_MAIN_IDLE;
                end
                P_MAIN_CACHE_READ0: begin  // pre address state
                    r_state <= P_MAIN_CACHE_READ1;
                end
                P_MAIN_CACHE_READ1: begin
                    if (r_len_ci) r_state <= P_MAIN_CACHE_READ2;
                    else r_state <= P_MAIN_IDLE;
                end
                P_MAIN_CACHE_READ2: begin
                    r_state <= P_MAIN_IDLE;
                end
                P_MAIN_EXT_WRITE0: begin
                    if (w_ext_write_end) r_state <= P_MAIN_EXT_WRITE1;
                end
                P_MAIN_EXT_WRITE1: begin
                    r_state <= P_MAIN_EXT_READ;
                end
                P_MAIN_EXT_READ: begin
                    // read until getting all read data
                    if (w_ext_read_end) begin
                        if (r_wr_ci) r_state <= P_MAIN_CACHE_WRITE;
                        else r_state <= P_MAIN_IDLE;  // read data is returned on-the-fly
                        //else r_state <= P_MAIN_CACHE_READ0;
                    end
                end
                P_MAIN_FLUSH: begin
                    r_state <= P_MAIN_FLUSH_TAG_REQ;
                end
                P_MAIN_FLUSH_TAG_REQ: begin
                    r_state <= P_MAIN_FLUSH_TAG_CHECK;
                end
                P_MAIN_FLUSH_TAG_CHECK: begin
                    if (w_need_write_back) r_state <= P_MAIN_FLUSH_WRITE;
                    else if (w_flush_end) r_state <= P_MAIN_IDLE;
                    else r_state <= P_MAIN_FLUSH_TAG_REQ;
                end
                P_MAIN_FLUSH_WRITE: begin
                   if (w_ext_write_end) begin
                       if (w_flush_end) r_state <= P_MAIN_IDLE;
                       else r_state <= P_MAIN_FLUSH_TAG_REQ; 
                   end
                end
            endcase
        end
    end


    // external memory access
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_ext_state <= P_EXT_IDLE;
        end else begin
            case(r_ext_state)
                P_EXT_IDLE: begin
                    if (w_ext_wstart) r_ext_state <= P_EXT_WPRE;
                    else if (w_ext_rstart) r_ext_state <= P_EXT_RREQ;
                end
                P_EXT_WPRE: begin
                    r_ext_state <= P_EXT_WREQ;
                end
                P_EXT_WREQ: begin
                    if (i_ack_co & i_ackw_co) r_ext_state <= P_EXT_WDATA;
                end
                P_EXT_RREQ: begin
                    if (i_ack_co) r_ext_state <= P_EXT_RDATA;
                end
                P_EXT_WDATA: begin
                    if (w_burst_write_end) r_ext_state <= P_EXT_IDLE;
                end
                P_EXT_RDATA: begin
                    if (w_burst_read_end) r_ext_state <= P_EXT_IDLE;
                end
            endcase
        end
    end


    // write/read data counter
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_data_cnt <= {P_IB_LEN_WIDTH{1'b0}};
        end else begin
            if (w_cnt_clear) r_data_cnt <= {P_IB_LEN_WIDTH{1'b0}};
            else if (w_cnt_inc) r_data_cnt <= r_data_cnt + 1'b1;
        end
    end


    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_ackw_1z <= 1'b0;
        end else begin
            r_ackw_1z <= i_ackw_co;
        end
    end

    always @(posedge clk_core) begin
        if (w_set_entry) begin
            r_entry <= i_entry;
            r_tag_adrs <= i_tag_adrs;
        end
    end
    always @(posedge clk_core) begin
        if (w_cache_adrs_init) r_adrs_cm <= {i_entry,{P_IB_CACHE_LINE_WIDTH{1'b0}}};
        else if (w_cache_adrs_inc) r_adrs_cm <= w_adrs_cm_next;
    end

    always @(posedge clk_core) begin
        if (w_flush_init) r_flush_adrs <= {P_IB_CACHE_ENTRY_WIDTH{1'b0}};
        else if (w_flush_inc) r_flush_adrs <= r_flush_adrs + 1'b1;
    end

    always @(posedge clk_core) begin
        if (w_save_adrs) begin
            r_wr_ci <= i_wr_ci;
            r_adrs_ci <= i_adrs_ci;
            r_len_ci <= i_len_ci[1];
        end
    end

    always @(posedge clk_core) begin
        if (w_save_wdata) begin
            r_be_ci <= i_be_ci;
            r_dbw_ci <= i_dbw_ci;
        end
    end
endmodule
