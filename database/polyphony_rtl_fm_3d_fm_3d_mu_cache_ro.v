//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_mu_cache_ro.v
//
// Abstract:
//   Cacahe module in 3d memory interconnect, read-only cache for texture
//   1 entry = 512bits, 32entries
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

module fm_3d_mu_cache_ro (
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
    // cache out
    o_req_co,
    o_adrs_co,
    i_ack_co,
    o_len_co,
    i_strr_co,
    i_dbr_co
);
`include "polyphony_params.v"
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // system configueration
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
// wire 
//////////////////////////////////
    // tag - ctrl
    wire          w_tw_valid;
    wire   [P_IB_ADDR_WIDTH-1:0]
           w_cmp_adrs;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_cmp_adrs_pre;
    wire          w_tag_clear;
    wire          w_hit;
   wire   [P_IB_CACHE_ENTRY_WIDTH-1:0]
                  w_entry;  // 32 entries
    wire   [P_IB_TAG_ADDR_WIDTH-1:0]
                  w_tag_adrs;
    // cache memory - ctrl
    wire          w_we_cm;
    wire   [P_IB_CACHE_LINE_WIDTH+P_IB_CACHE_ENTRY_WIDTH-1:0]
                  w_adrs_cm;
    wire   [P_IB_CACHE_LINE_WIDTH+P_IB_CACHE_ENTRY_WIDTH-1:0]
                  w_adrs_pre_cm;
    wire   [P_IB_BE_WIDTH-1:0] 
                  w_be_cm;
    wire   [P_IB_DATA_WIDTH-1:0] 
                  w_dto_cm;
    wire   [P_IB_DATA_WIDTH-1:0] 
                  w_dti_cm;
    wire   [P_IB_DATA_WIDTH-1:0] 
                  w_dti_pre_cm;
////////////////////////////
// module instance
////////////////////////////
    fm_3d_mu_cache_tag cache_tag (
        .clk_core(clk_core),
        .rst_x(rst_x),
        .i_tw_valid(w_tw_valid),
        .i_adrs_pre(w_cmp_adrs_pre[P_IB_ADDR_WIDTH-1:P_IB_CACHE_LINE_WIDTH]),
        .i_adrs(w_cmp_adrs[P_IB_ADDR_WIDTH-1:P_IB_CACHE_LINE_WIDTH]),
        .i_tag_clear(w_tag_clear),
        .o_hit(w_hit),
        .o_need_wb(),
        .o_entry(w_entry),
        .o_tag_adrs(w_tag_adrs)
    );

    fm_3d_mu_cache_mem cache_mem (
        .clk_core(clk_core),
        .i_we(w_we_cm),
        .i_adrs(w_adrs_cm),
        .i_adrs_pre(w_adrs_cm),
        .i_be(w_be_cm),
        .i_dt(w_dto_cm),
        .o_dt(w_dti_cm),
        .o_dt_pre()
    );

    fm_3d_mu_cache_ctrl_ro cache_ctrl (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system configuration 
        .i_cache_init(i_cache_init),
        // cache in
        .i_req_ci(i_req_ci),
        .i_adrs_ci(i_adrs_ci),
        .o_ack_ci(o_ack_ci),
        .i_len_ci(i_len_ci),
        .o_strr_ci(o_strr_ci),
        .o_dbr_ci(o_dbr_ci),
        // cache tag
        .o_tw_valid(w_tw_valid),
        .o_cmp_adrs_pre(w_cmp_adrs_pre),
        .o_cmp_adrs(w_cmp_adrs),
        .o_tag_clear(w_tag_clear),
        .i_hit(w_hit),
        .i_entry(w_entry),
        .i_tag_adrs(w_tag_adrs),
        //cache memory
        .o_we_cm(w_we_cm),
        .o_adrs_cm(w_adrs_cm),
        .o_be_cm(w_be_cm),
        .o_dt_cm(w_dto_cm),
        .i_dt_cm(w_dti_cm),
        // external memory access
        .o_req_co(o_req_co),
        .o_adrs_co(o_adrs_co),
        .i_ack_co(i_ack_co),
        .o_len_co(o_len_co),
        .i_strr_co(i_strr_co),
        .i_dbr_co(i_dbr_co)
    );


endmodule
