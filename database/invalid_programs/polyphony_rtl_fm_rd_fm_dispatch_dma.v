//=======================================================================
// Project Polyphony
//
// File:
//   fm_dispatch_dma.v
//
// Abstract:
//   dma controller for internal sdram
//
//  Created:
//    6 November 2008
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
//  2009/04/09 dual DMA mode is implemented

module fm_dispatch_dma (
    clk_core,
    rst_x,
    // system port
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
    // memory port
    o_req,
    o_wr,
    o_adrs,
    o_len,
    i_ack,
    o_strw,
    o_be,
    o_wd,
    i_ackw
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    parameter P_IDLE         = 3'h0;
    parameter P_SETUP        = 3'h1;
    parameter P_REQ          = 3'h2;
    parameter P_DOUT         = 3'h3;
    parameter P_NEXT         = 3'h4;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input           clk_core;
    input           rst_x;
    // system port
    input           i_dma_start;
    input  [3:0]    i_dma_mode;
    output          o_dma_end;
    input  [19:0]   i_dma_top_address0;  // 32w:bit[29:10]
    input  [19:0]   i_dma_top_address1;
    input  [19:0]   i_dma_top_address2;
    input  [19:0]   i_dma_top_address3;
    input  [17:0]   i_dma_length;
    input  [3:0]    i_dma_be;
    input  [31:0]   i_dma_wd0;
    input  [31:0]   i_dma_wd1;
    // memory port
    output          o_req;
    output          o_wr;
    output [P_IB_ADDR_WIDTH-1:0] o_adrs;
    output [P_IB_LEN_WIDTH-1:0]  o_len;
    input           i_ack;
    output          o_strw;
    output [P_IB_BE_WIDTH-1:0]   o_be;
    output [P_IB_DATA_WIDTH-1:0] o_wd;
    input           i_ackw;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg    [2:0]   r_state;
    reg    [P_IB_ADDR_WIDTH-1:0] r_adrs;
    reg    [17:0]  r_length;  // 32bits length
    reg    [4:0]   r_len;     // 32bits or 64bits
    reg    [4:0]   r_cnt;
    reg    [3:0]   r_dma_kind;

//////////////////////////////////
// wire 
//////////////////////////////////
`ifdef PP_BUSWIDTH_64
    wire   [5:0]   w_next_len;      // 32bits or 64bits
`else
    wire   [4:0]   w_next_len;      // 32bits or 64bits
`endif
    wire   [17:0]  w_remain_length; // 32bits length
    wire           w_dma_end;
    wire   [19:0]  w_set_address;
    wire           w_all_dma_end;
    wire           w_sel_wd;
    wire   [3:0]   w_next_kind;
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_next_len = f_len(r_length);
    assign w_remain_length = r_length - {13'b0,w_next_len};
    assign w_set_address = f_adrs(r_dma_kind,
                                  i_dma_top_address0,
                                  i_dma_top_address1,
                                  i_dma_top_address2,
                                  i_dma_top_address3);
    assign w_next_kind = f_kind_update(r_dma_kind);
    assign w_dma_end = (r_length == 18'd0);
    assign w_all_dma_end = (r_dma_kind == 4'b0);
    assign o_dma_end = (r_state == P_SETUP) & w_all_dma_end;

    assign w_sel_wd = f_sel_wd(r_dma_kind);
    assign o_req = (r_state == P_REQ);
    assign o_wr = 1'b1;
    assign o_adrs = r_adrs;
    assign o_len = {1'b0,r_len};
    assign o_strw = (r_state == P_REQ) | (r_state == P_DOUT);
`ifdef PP_BUSWIDTH_64
    assign o_be = {i_dma_be,i_dma_be};
    assign o_wd = (w_sel_wd) ? {i_dma_wd1,i_dma_wd1} : {i_dma_wd0,i_dma_wd0};
`else
    assign o_be = i_dma_be;
    assign o_wd = (w_sel_wd) ? i_dma_wd1 : i_dma_wd0;
`endif

//////////////////////////////////
// always
//////////////////////////////////

// memory fill/ burst sequence (near interface)
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_len <= 5'b0;
        r_cnt <= 5'b0;
        r_state <= P_IDLE;
        r_adrs <= {P_IB_ADDR_WIDTH{1'b0}};
        r_length <= 18'd0;
        r_dma_kind <= 4'b0;
    end else begin
        case (r_state)
            P_IDLE : begin
                if (i_dma_start) begin  // memory fill start (address0)
                    r_length <= i_dma_length;
                    r_cnt <= 5'b1;
                    r_dma_kind <= i_dma_mode;
                    r_state <= P_SETUP;
                end
            end
            P_SETUP : begin
                // decide burst length
`ifdef PP_BUSWIDTH_64
	        r_adrs[28:9] <= w_set_address;
                r_adrs[8:0] <= 9'h0;
                r_len <= w_next_len[5:1];
`else
	        r_adrs[29:10] <= w_set_address;
                r_adrs[9:0] <= 10'h0;
                r_len <= w_next_len;
`endif
                r_length <= w_remain_length;
                if (w_all_dma_end) begin
                    r_state <= P_IDLE;
                end else begin
                    r_state <= P_REQ;
                end
            end
            P_REQ : begin
                if (i_ack) begin
                    if (r_len == 1) begin  // not burst
                        r_state <= P_NEXT;
                    end else begin
                        r_state <= P_DOUT;
                    end
                    r_cnt <= r_cnt + 1'b1;
                end
            end
            P_DOUT : begin
                if (i_ackw) begin
                    r_cnt <= r_cnt + 1'b1;
                    if (r_cnt == r_len) begin
                        r_state <= P_NEXT;
                    end
                end
            end
            P_NEXT : begin
                if (w_dma_end) begin
                    r_dma_kind <= w_next_kind;
                    r_length <= i_dma_length;
                    r_cnt <= 5'd1;
                    r_state <= P_SETUP;
                end else begin
                    r_cnt <= 5'd1;
                    r_adrs <= r_adrs + r_len;
`ifdef PP_BUSWIDTH_64
                    r_len <= w_next_len[5:1];
`else
                    r_len <= w_next_len;
`endif
                    r_length <= w_remain_length;
                    r_state <= P_REQ;
                end
            end
        endcase
    end
end
//////////////////////////////////
// function
//////////////////////////////////
`ifdef PP_BUSWIDTH_64
    function [5:0] f_len;    // return per64
`else
    function [4:0] f_len;    // return  per32
`endif
        input [17:0] c_len;  // 32-bit length
        reg cmp;
        begin
`ifdef PP_BUSWIDTH_64
	    cmp = |c_len[17:5];
            if (cmp) f_len = 6'h20;  // c_len > 'h20
            else f_len = {1'b0,c_len[4:0]};
`else
	    cmp = |c_len[17:4];
            if (cmp) f_len = 5'h10;  // c_len > 'h10, 32bits x 16 burst
            else f_len = {1'b0,c_len[3:0]};
`endif
        end
    endfunction

    function [19:0] f_adrs;
        input [3:0]  kind;
        input [19:0] a0;
        input [19:0] a1;
        input [19:0] a2;
        input [19:0] a3;
        reg cmp;
        begin
            if (kind[0])f_adrs = a0;
            else if (kind[1])f_adrs = a1;
            else if (kind[2])f_adrs = a2;
            else f_adrs = a3;
        end
    endfunction

    function [4:0] f_kind_update;
        input [3:0] kind;
        reg [3:0] result;
        integer i;
        begin
            if (kind[0]) result = {kind[3:1],1'b0};
            else if (kind[1]) result = {kind[3:2],2'b0};
            else if (kind[2]) result = {kind[3],3'b0};
            else result = 4'b0;
            f_kind_update = result;
        end
    endfunction

    function f_sel_wd;
        input [3:0] kind;
        reg   result;
        integer i;
        begin
            if (kind[0]) result = 1'b0;
            else if (kind[1]) result = 1'b0;
            else if (kind[2]) result = 1'b1;
            else result = 1'b1;
            f_sel_wd = result;
        end
    endfunction

endmodule
