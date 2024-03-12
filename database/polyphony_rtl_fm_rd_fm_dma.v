//=======================================================================
// Project Polyphony
//
// File:
//   fm_dma.v
//
// Abstract:
//   DMA controller
//
//  Created:
//    3 November 2008
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

module fm_dma (
    clk_core,
    rst_x,
    // DMA
    i_dma_start,
    i_dma_mode,
    o_dma_end,
    i_dma_top_address0,
    i_dma_top_address1,
    i_dma_top_address2,
    i_dma_top_address3,
    i_dma_length,
    i_dma_be,
    i_dma_wd0,
    i_dma_wd1,
    // memory access
    o_req_mem,
    o_wr_mem,
    o_adrs_mem,
    o_len_mem,
    i_ack_mem,
    o_strw_mem,
    o_be_mem,
    o_wd_mem,
    i_ackw_mem
);
//////////////////////////////////
// I/O port definition
//////////////////////////////////
`include "polyphony_params.v"
    input           clk_core;
    input           rst_x;
    // DMA
    input           i_dma_start;
    input  [3:0]    i_dma_mode;
    output          o_dma_end;
    input  [19:0]   i_dma_top_address0;
    input  [19:0]   i_dma_top_address1;
    input  [19:0]   i_dma_top_address2;
    input  [19:0]   i_dma_top_address3;
    input  [17:0]   i_dma_length;
    input  [3:0]    i_dma_be;
    input  [31:0]   i_dma_wd0;
    input  [31:0]   i_dma_wd1;
    // sdram interface
    output          o_req_mem;
    output          o_wr_mem;
    output [P_IB_ADDR_WIDTH-1:0]  o_adrs_mem;
    output [P_IB_LEN_WIDTH-1:0]   o_len_mem;
    input           i_ack_mem;
    output          o_strw_mem;
    output [P_IB_BE_WIDTH-1:0]    o_be_mem;
    output [P_IB_DATA_WIDTH-1:0]  o_wd_mem;
    input           i_ackw_mem;

    // dma
    wire            w_req_dma;
    wire            w_wr_dma;
    wire   [P_IB_ADDR_WIDTH-1:0]  w_adrs_dma;
    wire   [P_IB_LEN_WIDTH-1:0]   w_len_dma;
    wire            w_ack_dma;
    wire            w_strw_dma;
    wire   [P_IB_BE_WIDTH-1:0]    w_be_dma;
    wire   [P_IB_DATA_WIDTH-1:0]  w_wd_dma;
    wire            w_ackw_dma;
//////////////////////////////////
// assign
//////////////////////////////////

//////////////////////////////////
// module instance
//////////////////////////////////
    fm_dispatch_dma dispatch_dma (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system port
        .i_dma_start(i_dma_start),
        .i_dma_mode(i_dma_mode),
        .o_dma_end(o_dma_end),
        .i_dma_top_address0(i_dma_top_address0),
        .i_dma_top_address1(i_dma_top_address1),
        .i_dma_top_address2(i_dma_top_address2),
        .i_dma_top_address3(i_dma_top_address3),
        .i_dma_length(i_dma_length),
        .i_dma_be(i_dma_be),
        .i_dma_wd0(i_dma_wd0),
        .i_dma_wd1(i_dma_wd1),
        // memory port
        .o_req(w_req_dma),
        .o_wr(w_wr_dma),
        .o_adrs(w_adrs_dma),
        .o_len(w_len_dma),
        .i_ack(w_ack_dma),
        .o_strw(w_strw_dma),
        .o_be(w_be_dma),
        .o_wd(w_wd_dma),
        .i_ackw(w_ackw_dma)
    );

    fm_cmn_if_ff_out #(P_IB_ADDR_WIDTH,
                       P_IB_DATA_WIDTH,
                       P_IB_LEN_WIDTH) if_ff_out (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // local interface
        .i_req(w_req_dma),
        .i_wr(w_wr_dma),
        .i_adrs(w_adrs_dma),
        .i_len(w_len_dma),
        .o_ack(w_ack_dma),
        .i_strw(w_strw_dma),
        .i_be(w_be_dma),
        .i_dbw(w_wd_dma),
        .o_ackw(w_ackw_dma),
        .o_strr(),
        .o_dbr(),
        // F/F interface
        .o_req(o_req_mem),
        .o_wr(o_wr_mem),
        .o_adrs(o_adrs_mem),
        .o_len(o_len_mem),
        .i_ack(i_ack_mem),
        .o_strw(o_strw_mem),
        .o_be(o_be_mem),
        .o_dbw(o_wd_mem),
        .i_ackw(i_ackw_mem),
        .i_strr(1'b0),
        .i_dbr({P_IB_DATA_WIDTH{1'b0}})
    );

endmodule
