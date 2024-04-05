//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_cu_bselect.v
//
// Abstract:
//   3D Control unit bus selecter
//
//  Created:
//    30 September 2009
//
// Copyright (c) 2009  Kenji Ishimaru, All rights reserved.
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

`include "fm_3d_def.v"

module fm_3d_cu_bselect (
    clk_core,
    rst_x,
    // system bus
    i_req_sys,
    i_wr_sys,
    i_adrs_sys,
    o_ack_sys,
    i_be_sys,
    i_dbw_sys,
    o_strr_sys,
    o_dbr_sys,
    // DMA bus
    i_req_dma,
    i_adrs_dma,
    i_dbw_dma,
    // internal bus side
    o_req,
    o_wr,
    o_adrs,
    i_ack,
    o_be,
    o_dbw,
    i_strr,
    i_dbr
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // system bus
    input         i_req_sys;
    input         i_wr_sys;
    input  [21:0] i_adrs_sys;
    output        o_ack_sys;
    input  [3:0]  i_be_sys;
    input  [31:0] i_dbw_sys;
    output        o_strr_sys;
    output [31:0] o_dbr_sys;
    // DMA bus
    input         i_req_dma;
    input  [21:0] i_adrs_dma;
    input  [31:0] i_dbw_dma;
    // internal bus side
    output        o_req;
    output        o_wr;
    output [21:0] o_adrs;
    input         i_ack;
    output [3:0]  o_be;
    output [31:0] o_dbw;
    input         i_strr;
    input  [31:0] i_dbr;
/////////////////////////
//  register definition
/////////////////////////
    reg           r_req_sys;
    reg           r_wr_sys;
    reg    [21:0] r_adrs_sys;
    reg    [3:0]  r_be_sys;
    reg    [31:0] r_dbw_sys;
    // DMA bus
    reg           r_req_dma;
    reg    [21:0] r_adrs_dma;
    reg    [31:0] r_dbw_dma;
/////////////////////////
//  wire definition
/////////////////////////
    wire          w_ack;
/////////////////////////
//  assign statement
/////////////////////////
    assign o_req = r_req_sys | r_req_dma;
    assign o_wr = (r_req_dma) ? 1'b1 : r_wr_sys;
    assign o_adrs = (r_req_dma) ? r_adrs_dma : r_adrs_sys;
    assign o_be = (r_req_dma) ? 4'hf : r_be_sys;
    assign o_dbw = (r_req_dma) ? r_dbw_dma : r_dbw_sys;
    assign o_strr_sys = i_strr;
    assign o_dbr_sys = i_dbr;

    assign w_ack = (r_req_dma) ? 1'b0 : i_ack;
    assign o_ack_sys = w_ack;
/////////////////////////
//  always statement
/////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_req_sys <= 1'b0;
            r_req_dma <= 1'b0;
        end else begin
            if (w_ack) r_req_sys <= 1'b0;
            else r_req_sys <= i_req_sys; 

            r_req_dma <= i_req_dma;
        end
    end

    always @(posedge clk_core) begin
        r_wr_sys <= i_wr_sys;
        r_adrs_sys <= i_adrs_sys;
        r_be_sys <= i_be_sys;
        r_dbw_sys <= i_dbw_sys;
        r_adrs_dma <= i_adrs_dma;
        r_dbw_dma <= i_dbw_dma;
    end


endmodule
