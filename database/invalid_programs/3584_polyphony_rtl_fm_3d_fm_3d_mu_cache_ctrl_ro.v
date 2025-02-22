// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_mu_cache_ctrl_ro.v
//     block ram tag version, for read-only cache
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
//  2010 2/21 return data length bug fix
//            2 data returned snspite of len = 1 only in the case of cache miss


module fm_3d_mu_cache_ctrl_ro (
    clk_core,
    rst_x,
    // system configuration
    i_cache_init,
    // cache in
    i_req_ci,
    i_adrs_ci,
    o_ack_ci,
    i_len_ci,
    o_strr_ci,
    o_dbr_ci,
    // cache tag
    o_tw_valid,
    o_cmp_adrs_pre,
    o_cmp_adrs,
    o_tag_clear,
    i_hit,
    i_entry,
    i_tag_adrs,
    //cache memory
    o_we_cm,
    o_adrs_cm,
    o_be_cm,
    o_dt_cm,
    i_dt_cm,
    // external memory access
    o_req_co,
    o_adrs_co,
    i_ack_co,
    o_len_co,
    i_strr_co,
    i_dbr_co
);
`include "polyphony_params.v"
////////////////////////////
// Localparam definition
////////////////////////////
    localparam P_MAIN_IDLE        = 3'd0;
    localparam P_MAIN_TAG_CHECK   = 3'd1;
    localparam P_MAIN_CACHE_READ0 = 3'd2;
    localparam P_MAIN_CACHE_READ1 = 3'd3;
    localparam P_MAIN_CACHE_READ2 = 3'd4;
    localparam P_MAIN_EXT_READ    = 3'd5;

    // external memory access
    localparam P_EXT_IDLE  = 2'd0;
    localparam P_EXT_RREQ  = 2'd1;
    localparam P_EXT_RDATA = 2'd2;
    localparam P_MAX_BURST_LEN = 1 << P_IB_CACHE_LINE_WIDTH;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // system configuration
    input         i_cache_init;
    // cache in
    input         i_req_ci;
    input  [P_IB_ADDR_WIDTH-1:0] 
                  i_adrs_ci;
    output        o_ack_ci;
    input  [P_IB_LEN_WIDTH-1:0]
                  i_len_ci;
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
   input  [P_IB_CACHE_ENTRY_WIDTH-1:0]
                  i_entry;  // 32 entries
    input  [P_IB_TAG_ADDR_WIDTH-1:0]
                  i_tag_adrs;
    //cache memory
    output        o_we_cm;
    output [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  o_adrs_cm;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_cm;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dt_cm;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dt_cm;
    // cache out
    output        o_req_co;
    output [P_IB_ADDR_WIDTH-1:0] 
                  o_adrs_co;
    input         i_ack_co;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_co;
    input         i_strr_co;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbr_co;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg    [2:0]  r_state;

    reg    [1:0]  r_ext_state;

    // save access address
    reg           r_len_ci;
    reg    [P_IB_ADDR_WIDTH-1:0]
                  r_adrs_ci;


    reg    [P_IB_CACHE_ENTRY_WIDTH-1:0]
                  r_entry;  // 32 entries
    reg    [P_IB_TAG_ADDR_WIDTH-1:0]
                  r_tag_adrs;
    reg    [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  r_adrs_cm;

    reg    [P_IB_LEN_WIDTH-1:0]
                  r_data_cnt;
//////////////////////////////////
// wire 
//////////////////////////////////
    wire   [P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH-1:0]
                  w_adrs_cm_next;
    wire          w_save_adrs;
    wire          w_ext_rstart;
    wire          w_burst_read_end;
    wire          w_cnt_clear;
    wire          w_cnt_inc;
    wire          w_ext_read_end;
    wire          w_cache_adrs_init;
    wire          w_cache_adrs_inc;
    wire          w_set_entry;
    wire          w_ext_read_partial_end;
    wire  [P_IB_CACHE_LINE_WIDTH-1:0]
                  w_adrs_ci_p1;
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_adrs_cm_next = r_adrs_cm +1'b1;
    assign w_save_adrs = (r_state == P_MAIN_IDLE) & i_req_ci;
    assign o_cmp_adrs_pre = i_adrs_ci;
    assign o_cmp_adrs = r_adrs_ci;
    assign w_cnt_clear = w_ext_rstart;
    assign w_cnt_inc = i_strr_co; 
    assign w_cache_adrs_init = w_cnt_clear;
    assign w_cache_adrs_inc = w_cnt_inc;
    assign w_ext_read_end = (r_ext_state == P_EXT_RDATA)&w_burst_read_end;
    assign w_set_entry = (r_state == P_MAIN_TAG_CHECK);
    assign o_tw_valid = (r_state == P_MAIN_TAG_CHECK);

    assign o_ack_ci = (r_state == P_MAIN_IDLE);
    assign o_strr_ci = (r_state == P_MAIN_CACHE_READ1) |
                       (r_state == P_MAIN_CACHE_READ2) |
                       ((r_state == P_MAIN_EXT_READ)& w_ext_read_partial_end);

    assign o_dbr_ci = ((r_state == P_MAIN_CACHE_READ1) |
                       (r_state == P_MAIN_CACHE_READ2)) ? i_dt_cm : i_dbr_co;
    assign o_tag_clear = i_cache_init;
    assign o_we_cm =  ((r_state == P_MAIN_EXT_READ)&i_strr_co);
//    assign o_adrs_cm = 
//                       (r_state == P_MAIN_CACHE_READ0) ? {r_entry,r_adrs_ci[3:0]}:
//                       (r_state == P_MAIN_CACHE_READ1) ? {r_entry,r_adrs_ci[3:0]+ 1'b1}:
//                                                         r_adrs_cm;
    assign w_adrs_ci_p1 = r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]+ 1'b1;
    assign o_adrs_cm = (r_state == P_MAIN_TAG_CHECK)   ? {i_entry,r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]}:  // pre address for read
                       (r_state == P_MAIN_CACHE_READ0) ? {r_entry,r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0]}:
                       (r_state == P_MAIN_CACHE_READ1) ? {r_entry,w_adrs_ci_p1}:
                                                         r_adrs_cm;

    assign o_be_cm =  {P_IB_BE_WIDTH{1'b1}};
    assign o_dt_cm = i_dbr_co;

    assign w_ext_rstart = ((r_state == P_MAIN_TAG_CHECK) & !i_hit);

    assign w_burst_read_end = (r_data_cnt == (P_MAX_BURST_LEN-1)) & i_strr_co;

    // external memory access
    assign o_req_co = (r_ext_state == P_EXT_RREQ);
    assign o_adrs_co = {r_adrs_ci[P_IB_ADDR_WIDTH-1:P_IB_CACHE_LINE_WIDTH],
                                                      {P_IB_CACHE_LINE_WIDTH{1'b0}}};
    assign o_len_co = 6'h10;
    assign w_ext_read_partial_end = ((r_data_cnt == r_adrs_ci[P_IB_CACHE_LINE_WIDTH-1:0])|
                                     (r_data_cnt == w_adrs_ci_p1) & r_len_ci) & i_strr_co; // 2010/2/21

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
                    if (i_req_ci) r_state <= P_MAIN_TAG_CHECK;
                end
                P_MAIN_TAG_CHECK: begin
                    if (i_hit) begin
                        // cache hit
                        r_state <= P_MAIN_CACHE_READ1;
                    end else begin
                        // cache miss hit
                        r_state <= P_MAIN_EXT_READ;
                    end
                end
                P_MAIN_CACHE_READ0: begin
                    r_state <= P_MAIN_CACHE_READ1;
                end
                P_MAIN_CACHE_READ1: begin
                    if (r_len_ci) r_state <= P_MAIN_CACHE_READ2;
                    else r_state <= P_MAIN_IDLE;
                end
                P_MAIN_CACHE_READ2: begin
                    r_state <= P_MAIN_IDLE;
                end
                P_MAIN_EXT_READ: begin
                    // read until getting all read data
                    if (w_ext_read_end) begin
                        r_state <= P_MAIN_IDLE;  // read data is returned on-the-fly
                        //r_state <= P_MAIN_CACHE_READ0;
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
                    if (w_ext_rstart) r_ext_state <= P_EXT_RREQ;
                end
                P_EXT_RREQ: begin
                    if (i_ack_co) r_ext_state <= P_EXT_RDATA;
                end
                P_EXT_RDATA: begin
                    if (w_burst_read_end) r_ext_state <= P_EXT_IDLE;
                end
            endcase
        end
    end


    // read data counter
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_data_cnt <= {P_IB_LEN_WIDTH{1'b0}};
        end else begin
            if (w_cnt_clear) r_data_cnt <= {P_IB_LEN_WIDTH{1'b0}};
            else if (w_cnt_inc) r_data_cnt <= r_data_cnt + 1'b1;
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
        if (w_save_adrs) begin
            r_adrs_ci <= i_adrs_ci;
            r_len_ci <= i_len_ci[1];
        end
    end

endmodule
