//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_mu_cache_mem.v
//
// Abstract:
//   Cacahe memory
//     32bits x 512 word (32x16)
//  Created:
//    27 October 2008
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
//  2008/12/30 pre_adrs added, ram model changed for pre read

module fm_3d_mu_cache_mem (
    clk_core,
    i_we,
    i_adrs,
    i_adrs_pre,
    i_be,
    i_dt,
    o_dt,
    o_dt_pre
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    parameter P_RANGE = P_IB_CACHE_ENTRY_WIDTH+P_IB_CACHE_LINE_WIDTH;
    parameter P_DEPTH = 1 << P_RANGE;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         i_we;
    input  [P_RANGE-1:0]
                  i_adrs;
    input  [P_RANGE-1:0]
                  i_adrs_pre;
    input  [P_IB_DATA_WIDTH/8-1:0]
                  i_be;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dt;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dt;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dt_pre;

//////////////////////////////////
// wire 
//////////////////////////////////
    wire   [P_IB_BE_WIDTH/2-1:0]
                  w_we;
//////////////////////////////////
// assign
//////////////////////////////////
////////////////////////////
// module instance
////////////////////////////
    genvar gi;
    // per 16-bit byte enable
    generate for (gi=0;gi < P_IB_BE_WIDTH/2;gi=gi+1) begin
      assign w_we[gi] = i_we & (|i_be[gi*2+1:gi*2]);
      
      fm_cmn_bram_01 #(16, P_RANGE) bram (
        .clk(clk_core),
        .we(w_we[gi]),
        .a(i_adrs),
        .dpra(i_adrs_pre),
        .di(i_dt[(gi+1)*16-1:gi*16]),
        .spo(o_dt[(gi+1)*16-1:gi*16]),
        .dpo(o_dt_pre[(gi+1)*16-1:gi*16])
      );
    end
    endgenerate

endmodule
