// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_mu_cache_tag.v
//     block ram tag version, 
//     i_adrs should be same at least one cycle before i_valid
// Abstract:
//   Cache tag 
//   1 bit valid + 11bits address (32 entries)
//  Created:
//    24 December 2008
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
module fm_3d_mu_cache_tag (
    clk_core,
    rst_x,
    i_tw_valid,
    i_adrs_pre,  // for timing improvement
    i_adrs,
    i_tag_clear,
    o_hit,
    o_need_wb,
    o_entry,
    o_tag_adrs
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    //parameter P_ADRS_WIDTH  = 26;   // 21.5.4
    parameter P_ADRS_WIDTH  =  P_IB_TAG_ADDR_WIDTH+P_IB_CACHE_ENTRY_WIDTH;
    parameter P_ENTRY_RANGE = P_IB_CACHE_ENTRY_WIDTH;
    parameter P_ENTRY_DEPTH = 1 << P_ENTRY_RANGE;
    parameter P_TAG_RANGE   = P_ADRS_WIDTH - P_ENTRY_RANGE;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    input         i_tw_valid;
    input  [P_ADRS_WIDTH-1:0]
                  i_adrs_pre;
    input  [P_ADRS_WIDTH-1:0]
                  i_adrs;
    input         i_tag_clear;
    output        o_hit;
    output        o_need_wb;
    output [P_ENTRY_RANGE-1:0]
                  o_entry;
    output [P_TAG_RANGE-1:0]
                  o_tag_adrs;

//////////////////////////////////
// wire 
//////////////////////////////////
    wire          w_tag_update;
    wire [P_ENTRY_RANGE-1:0]
                  w_update_number_pre;
    wire [P_ENTRY_RANGE-1:0]
                  w_update_number;
    wire          w_cmp;
    wire          w_valid;
    wire [P_ADRS_WIDTH-P_ENTRY_RANGE-1:0]
                  w_tag_adrs;
    wire [P_ADRS_WIDTH-P_ENTRY_RANGE-1:0]
                  w_new_adrs;
//////////////////////////////////
// reg
//////////////////////////////////
    reg  [P_ENTRY_DEPTH-1:0] r_valids;
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_update_number_pre = i_adrs_pre[P_ENTRY_RANGE-1:0];
    assign w_update_number = i_adrs[P_ENTRY_RANGE-1:0];
    assign w_new_adrs = i_adrs[P_ADRS_WIDTH-1:P_ENTRY_RANGE];
    assign w_cmp = (w_tag_adrs == w_new_adrs);
    assign w_valid = r_valids[w_update_number];
    assign o_hit = (w_valid) ? w_cmp : 1'b0 ;
 
    assign w_tag_update = !o_hit & i_tw_valid;
    assign o_need_wb = w_valid;
    assign o_entry = w_update_number;
    assign o_tag_adrs = w_tag_adrs;
//////////////////////////////////
// always
//////////////////////////////////

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            // tag initial clear
            r_valids <= {P_ENTRY_DEPTH{1'b0}};
        end else begin
            if (i_tag_clear) begin
                r_valids <= {P_ENTRY_DEPTH{1'b0}};
            end
            if (w_tag_update) begin
                  r_valids[w_update_number] <= 1'b1;
            end
        end
    end

////////////////////////////
// module instance
////////////////////////////
    // not including valid bit
    fm_cmn_bram_01 #((P_ADRS_WIDTH-P_ENTRY_RANGE),P_ENTRY_RANGE) tag_bram (
        .clk(clk_core),
        .we(w_tag_update),
        .a(w_update_number),
        .dpra(w_update_number_pre),  // check address
        .di(w_new_adrs),
        .spo(),
        .dpo(w_tag_adrs)
    );

endmodule
