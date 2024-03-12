//=======================================================================
// Project Polyphony
//
// File:
//   fm_cmn_if_ff_out.v
//
// Abstract:
//   F/F bus interface
//
//  Created:
//    2 October 2008
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

module fm_cmn_if_ff_out (
    clk_core,
    rst_x,
    // local interface
    i_req,
    i_wr,
    i_adrs,
    i_len,
    o_ack,
    i_strw,
    i_be,
    i_dbw,
    o_ackw,
    o_strr,
    o_dbr,
    // F/F interface
    o_req,
    o_wr,
    o_adrs,
    o_len,
    i_ack,
    o_strw,
    o_be,
    o_dbw,
    i_ackw,
    i_strr,
    i_dbr
 );

//////////////////////////////////
// parameter
//////////////////////////////////
    parameter P_ADRS_WIDTH = 'd22;
    parameter P_DATA_WIDTH = 'd32;
    parameter P_BLEN_WIDTH = 'd6;

    parameter P_BE_WIDTH   = P_DATA_WIDTH/8;

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_core;
    input          rst_x;
    // local interface
    input          i_req;
    input          i_wr;
    input  [P_ADRS_WIDTH-1:0]
                   i_adrs;
    input  [P_BLEN_WIDTH-1:0]
                   i_len;
    output         o_ack;
    input          i_strw;
    input  [P_BE_WIDTH-1:0]
                   i_be;
    input  [P_DATA_WIDTH-1:0]
                   i_dbw;
    output         o_ackw;
    output         o_strr;
    output [P_DATA_WIDTH-1:0]
                   o_dbr;
    // F/F-ed interface
    output         o_req;
    output         o_wr;
    output [P_ADRS_WIDTH-1:0]
                   o_adrs;
    output [P_BLEN_WIDTH-1:0]
                   o_len;
    input          i_ack;
    output         o_strw;
    output [P_BE_WIDTH-1:0]
                   o_be;
    output [P_DATA_WIDTH-1:0]
                   o_dbw;
    input          i_ackw;
    input          i_strr;
    input  [P_DATA_WIDTH-1:0]
                   i_dbr;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg            r_req;
    reg            r_wr;
    reg    [P_ADRS_WIDTH-1:0]
                   r_adrs;
    reg    [P_BLEN_WIDTH-1:0]
                   r_len;
    reg            r_ack;
    reg            r_strw;
    reg    [P_BE_WIDTH-1:0]
                   r_be;
    reg    [P_DATA_WIDTH-1:0]
                   r_dbw;
    reg            r_ackw;
//    reg    [P_DATA_WIDTH-1:0]
//                   r_dbr;
//    reg            r_strr;
//////////////////////////////////
// wire 
//////////////////////////////////
//////////////////////////////////
// assign 
//////////////////////////////////

    assign o_req = r_req;
    assign o_wr = r_wr;
    assign o_adrs = r_adrs;
    assign o_len = r_len;
    assign o_strw = r_strw;
    assign o_be = r_be;
    assign o_dbw = r_dbw;

    assign o_ack = (i_req & i_wr) ? (r_ack & r_ackw) : r_ack;
    assign o_ackw = (i_req & i_wr) ? (r_ack & r_ackw) : r_ackw;

    assign o_dbr = i_dbr;
    assign o_strr = i_strr;

//////////////////////////////////
// always
//////////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_req <= 1'b0;
            r_wr <= 1'b0;
            r_strw <= 1'b0;
        end else begin
            r_req <= (o_ack) ? i_req : 1'b0;
            r_wr <= i_wr;
            r_strw <= (o_ackw & i_strw);
        end
    end

    always @(posedge clk_core) begin
        r_adrs <= i_adrs;
        r_len <= i_len;
        r_be <= i_be;
        r_dbw <= i_dbw;
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_ack <= 1'b0;
            r_ackw <= 1'b0;
        end else begin
            r_ack <= i_ack;
            r_ackw <= i_ackw;
        end
    end

endmodule
