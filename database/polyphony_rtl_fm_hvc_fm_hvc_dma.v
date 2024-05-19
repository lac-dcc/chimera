// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_hvc_dma.v
//
// Abstract:
//   VGA DMAC
//
//  Created:
//    8 August 2008
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
//  2008/12/26 output clk_sys synchronized vsync
//  2009/01/22 anti-aliasing mode support

module fm_hvc_dma (
    clk_core,
    rst_x,
    i_video_start,
    i_vsync,
    i_hsync,
    i_fb0_offset,
    i_fb0_ms_offset,
    i_fb1_offset,
    i_fb1_ms_offset,
    i_front_buffer,
    i_aa_en,
    i_fifo_available,
    o_fifo_available_ack,
    o_vsync,
    o_vsync_edge,
    // dram if
    o_req,
    o_adrs,
    o_len,
    i_ack
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    parameter P_IDLE   = 3'd0;
    parameter P_REQ    = 3'd1;
    parameter P_REQ_AA = 3'd2;
    parameter P_WAIT_FIFO_AVL = 3'd3;
    parameter P_WAIT_AVL_FALL = 3'd4;

    parameter P_BURST_SIZE = 6'd32;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input         clk_core;
    input         rst_x;
    input         i_video_start;
    input         i_vsync;
    input         i_hsync;
    input  [11:0] i_fb0_offset;
    input  [11:0] i_fb0_ms_offset;
    input  [11:0] i_fb1_offset;
    input  [11:0] i_fb1_ms_offset;
    input         i_front_buffer;
    input         i_aa_en;
    input         i_fifo_available;
    output        o_fifo_available_ack;
    output        o_vsync;
    output        o_vsync_edge;
    // dram if
    output        o_req;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len;  // 32 burst x 10
    input         i_ack;

//////////////////////////////////
// reg
//////////////////////////////////
    reg    [2:0]   r_state;
    reg            r_req;
//    reg    [17:0]  r_cur_adrs_l;
    reg    [12:0]  r_cur_adrs_l;

    reg    [3:0]   r_req_cnt;
    // syncro register
    reg            r_vsync_1z;
    reg            r_vsync_2z;
    reg            r_vsync_3z;

    reg            r_hsync_1z;
    reg            r_hsync_2z;
    reg            r_hsync_3z;

    reg            r_fifo_available_1z;
    reg            r_fifo_available_2z;
    reg            r_fifo_available_3z;
    reg            r_fifo_available_ack;
//////////////////////////////////
// wire
//////////////////////////////////
    wire           w_set_initial_adrs;
    wire           w_v_rise;
    wire           w_h_start;
    wire           w_adrs_inc;
    wire           w_line_end;
    wire           w_req_cnt_clear;

    wire    [11:0] w_fb_offset;
    wire    [11:0] w_fb_ms_offset;
    wire    [11:0] w_offset;
//////////////////////////////////
// assign
//////////////////////////////////
    assign o_req = r_req;
`ifdef PP_BUSWIDTH_64
    assign o_len = P_BURST_SIZE >> 1;
`else
    assign o_len = P_BURST_SIZE;
`endif
    assign o_fifo_available_ack = r_fifo_available_ack;

    assign w_set_initial_adrs = w_v_rise;
    assign w_adrs_inc = (i_aa_en) ? (r_state == P_REQ_AA) & i_ack:
                                    (r_state == P_REQ) & i_ack;

    assign w_h_start = i_video_start & r_hsync_2z & !r_hsync_3z;  // rise of hsync
    assign w_v_rise = r_vsync_2z & !r_vsync_3z;  // rising edge of vsync
    assign w_line_end = (r_req_cnt == 4'd10); // 320 times

    assign w_req_cnt_clear = w_line_end & !r_fifo_available_2z &
                             (r_state == P_WAIT_AVL_FALL);
`ifdef PP_BUSWIDTH_64
    assign o_adrs = {w_offset, r_cur_adrs_l,4'b0};
`else
    assign o_adrs = {w_offset, r_cur_adrs_l,5'b0};
`endif
    assign w_fb_offset = (i_front_buffer) ? i_fb1_offset : i_fb0_offset;
    assign w_fb_ms_offset = (i_front_buffer) ? i_fb1_ms_offset : i_fb0_ms_offset;
    assign w_offset = (r_state == P_REQ_AA) ? w_fb_ms_offset : w_fb_offset;

    assign o_vsync = r_vsync_2z;
    assign o_vsync_edge = !r_vsync_2z & r_vsync_3z;  // falling edge

//////////////////////////////////
// always
//////////////////////////////////
    // request state
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
            r_req <= 1'b0;
            r_fifo_available_ack <= 1'b0;
        end else begin
            case (r_state)
                P_IDLE: begin
                    if (w_h_start) begin
                        r_req <= 1'b1;
                        r_state <= P_REQ;
                    end
                end
                P_REQ: begin
                    if (i_ack) begin
                        if (i_aa_en) begin
                            r_req <= 1'b1;
                            r_state <= P_REQ_AA;
                        end else begin
                            r_req <= 1'b0;
                            r_state <= P_WAIT_FIFO_AVL;
                        end
                    end
                end
                P_REQ_AA: begin
                    if (i_ack) begin
                        r_req <= 1'b0;
                        r_state <= P_WAIT_FIFO_AVL;
                    end
                end
                P_WAIT_FIFO_AVL: begin
                   if (r_req_cnt < 4'd4) begin
                       r_req <= 1'b1;
                       r_state <= P_REQ;
                   end else begin
                       if (r_fifo_available_2z) begin
                           r_fifo_available_ack <= 1'b1;
                           r_state <= P_WAIT_AVL_FALL;
                       end
                   end
                end
                P_WAIT_AVL_FALL: begin
                    if (!r_fifo_available_2z) begin
                       r_fifo_available_ack <= 1'b0;
                        if (w_line_end) begin
                            r_state <= P_IDLE;
                        end else begin
                            r_req <= 1'b1;
                            r_state <= P_REQ;
                        end
                    end
                end
            endcase
        end
    end

    // current address
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_cur_adrs_l <= 13'h0; // for simulation
        end else begin
            if (w_set_initial_adrs) begin
                r_cur_adrs_l <= 13'h0;
            end else if (w_adrs_inc) begin
                r_cur_adrs_l <= r_cur_adrs_l + 1'b1;  // same as + 32
            end
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_req_cnt <= 4'd0;
        end else begin
           if (w_req_cnt_clear) r_req_cnt <= 4'd0;
           else if (w_adrs_inc) r_req_cnt <= r_req_cnt + 1'b1;
        end
    end

    // syncro register
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_vsync_1z <= 1'b1;
            r_vsync_2z <= 1'b1;
            r_vsync_3z <= 1'b1;
            r_hsync_1z <= 1'b1;
            r_hsync_2z <= 1'b1;
            r_hsync_3z <= 1'b1;
            r_fifo_available_1z <= 1'b0;
            r_fifo_available_2z <= 1'b0;
        end else begin
            r_vsync_1z <= i_vsync;
            r_vsync_2z <= r_vsync_1z;
            r_vsync_3z <= r_vsync_2z;
            r_hsync_1z <= i_hsync;
            r_hsync_2z <= r_hsync_1z;
            r_hsync_3z <= r_hsync_2z;
            r_fifo_available_1z <= i_fifo_available;
            r_fifo_available_2z <= r_fifo_available_1z;
        end
    end



endmodule
