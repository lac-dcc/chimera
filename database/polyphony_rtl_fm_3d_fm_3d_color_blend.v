// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_color_blend.v
//
// Abstract:
//   color blending module
//
//  Created:
//    15 January 2009
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
// 2009/01/31 add register in front of input for timing improvement

module fm_3d_color_blend (
    clk_core,
    rst_x,
    // register configuration
    i_color_mode,
    i_color_blend_en,
    i_color_blend_eq,
    i_color_blend_sr,
    i_color_blend_sd,
    // source input
    i_src_valid,
    i_sr,
    i_sg,
    i_sb,
    i_sa,
    // destination input
    i_dst_valid,
    i_dst,
    // blend out
    o_valid,
    o_fr,
    o_fg,
    o_fb,
    o_fa
);

////////////////////////////
// Parameter definition
////////////////////////////
    // main state
    parameter P_IDLE     = 3'd0;
    parameter P_GEN_SRC  = 3'd1;
    parameter P_WAIT_DST = 3'd2;
    parameter P_GEN_DST  = 3'd3;
    parameter P_EQ       = 3'd4;
    parameter P_OUT      = 3'd5;
    // sub state
    parameter P_CR     = 2'd0;
    parameter P_CG     = 2'd1;
    parameter P_CB     = 2'd2;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // register configuration
    input  [1:0]  i_color_mode;
    input         i_color_blend_en;
    input  [2:0]  i_color_blend_eq;
    input  [3:0]  i_color_blend_sr;
    input  [3:0]  i_color_blend_sd;
    // source input
    input         i_src_valid;
    input  [7:0]  i_sr;
    input  [7:0]  i_sg;
    input  [7:0]  i_sb;
    input  [7:0]  i_sa;
    // destination input
    input         i_dst_valid;
    input  [15:0] i_dst;
    // blend out
    output        o_valid;
    output [7:0]  o_fr;
    output [7:0]  o_fg;
    output [7:0]  o_fb;
    output [7:0]  o_fa;
////////////////////////////
// reg
////////////////////////////
    reg    [2:0]  r_state;
    reg    [1:0]  r_sub_state;
    reg    [7:0]  r_sr;  // src or result
    reg    [7:0]  r_sg;
    reg    [7:0]  r_sb;
    reg    [7:0]  r_dr;  // src or result
    reg    [7:0]  r_dg;
    reg    [7:0]  r_db;
    reg    [15:0] r_dst;
    reg           r_dst_ready;

    reg    [7:0]  r_isr;
    reg    [7:0]  r_isg;
    reg    [7:0]  r_isb;
    reg    [7:0]  r_isa;

////////////////////////////
// wire
////////////////////////////
    wire          w_set_sr;
    wire          w_set_sg;
    wire          w_set_sb;
    wire          w_set_dr;
    wire          w_set_dg;
    wire          w_set_db;
    wire   [7:0]  w_ia;
    wire   [7:0]  w_a_cr;
    wire   [7:0]  w_a_cg;
    wire   [7:0]  w_a_cb;
    wire   [7:0]  w_b_cr;
    wire   [7:0]  w_b_cg;
    wire   [7:0]  w_b_cb;

    wire   [7:0]  w_a;
    wire   [7:0]  w_b;
    wire   [7:0]  w_c;


    wire   [7:0]  w_dr;
    wire   [7:0]  w_dg;
    wire   [7:0]  w_db;

    wire   [8:0]  w_fr;
    wire   [8:0]  w_fg;
    wire   [8:0]  w_fb;

    wire   [7:0]  w_ffr;
    wire   [7:0]  w_ffg;
    wire   [7:0]  w_ffb;
    wire          w_start;
    wire          w_sub_start;
    wire          w_ready_clear;
    wire          w_ready_set;
    wire          w_finish_src;
    wire          w_finish_dst;
////////////////////////////
// assign
////////////////////////////
    assign o_valid = (r_state == P_OUT);

    assign w_dr = f_get_color_r(r_dst,i_color_mode);
    assign w_dg = f_get_color_g(r_dst,i_color_mode);
    assign w_db = f_get_color_b(r_dst,i_color_mode);

    assign w_ia = ~r_isa;
    assign w_a_cr = (r_state == P_GEN_SRC) ? r_isr : w_dr;
    assign w_a_cg = (r_state == P_GEN_SRC) ? r_isg : w_dg;
    assign w_a_cb = (r_state == P_GEN_SRC) ? r_isb : w_db;
    assign w_b_cr = (r_state == P_GEN_SRC) ? r_isa : w_ia;
    assign w_b_cg = (r_state == P_GEN_SRC) ? r_isa : w_ia;
    assign w_b_cb = (r_state == P_GEN_SRC) ? r_isa : w_ia;

    assign  w_a = (r_sub_state == P_CG) ? w_a_cg:
                  (r_sub_state == P_CB) ? w_a_cb:
                                          w_a_cr;

    assign  w_b = (r_sub_state == P_CG) ? w_b_cg:
                  (r_sub_state == P_CB) ? w_b_cb:
                                          w_b_cr;

    assign w_set_sr = (r_state == P_GEN_SRC) & (r_sub_state == P_CR);
    assign w_set_sg = (r_state == P_GEN_SRC) & (r_sub_state == P_CG);
    assign w_set_sb = (r_state == P_GEN_SRC) & (r_sub_state == P_CB);
    assign w_set_dr = (r_state == P_GEN_DST) & (r_sub_state == P_CR);
    assign w_set_dg = (r_state == P_GEN_DST) & (r_sub_state == P_CG);
    assign w_set_db = (r_state == P_GEN_DST) & (r_sub_state == P_CB);

    assign w_finish_src = w_set_sb;
    assign w_finish_dst = w_set_db;

    assign w_fr = r_sr + r_dr;
    assign w_fg = r_sg + r_dg;
    assign w_fb = r_sb + r_db;

    assign w_ffr = {8{w_fr[8]}} | w_fr[7:0];
    assign w_ffg = {8{w_fg[8]}} | w_fg[7:0];
    assign w_ffb = {8{w_fb[8]}} | w_fb[7:0];

    assign o_fr = w_ffr;
    assign o_fg = w_ffg;
    assign o_fb = w_ffb;
    assign o_fa = i_sa;
    assign w_start = i_color_blend_en & i_src_valid; 
    assign w_sub_start = ((r_state == P_GEN_SRC) & (r_sub_state == P_CR)) |
                         ((r_state == P_GEN_DST) & (r_sub_state == P_CR));
    assign w_ready_clear = (r_state == P_OUT);
    assign w_ready_set = i_dst_valid;
////////////////////////////
// always
////////////////////////////
    // main sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE:begin
                    if (w_start) r_state <= P_GEN_SRC;
                end
                P_GEN_SRC:begin
                    if (w_finish_src) begin
                        if (r_dst_ready) r_state <= P_GEN_DST;
                        else r_state <= P_WAIT_DST;
                    end
                end
                P_WAIT_DST:begin
                    if (r_dst_ready) r_state <= P_GEN_DST;
                end
                P_GEN_DST:begin
                    if (w_finish_dst) begin
                        r_state <= P_EQ;
                    end
                end
                P_EQ:begin
                    r_state <= P_OUT;
                end
                P_OUT:begin
                    r_state <= P_IDLE;
                end
            endcase
        end
    end

    // main sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_sub_state <= P_CR;
        end else begin
            case (r_sub_state)
                P_CR:begin
                    if (w_sub_start) r_sub_state <= P_CG;
                end
                P_CG:begin
                    r_sub_state <= P_CB;
                end
                P_CB:begin
                    r_sub_state <= P_CR;
                end             
            endcase
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_dst_ready <= 1'b0;
        end else begin
            if (w_ready_clear)    r_dst_ready <= 1'b0;
            else if (w_ready_set) r_dst_ready <= 1'b1;
        end
    end

    always @(posedge clk_core) begin
        if (i_dst_valid) r_dst <= i_dst;
    end

    always @(posedge clk_core) begin
         r_isr <= i_sr;
         r_isg <= i_sg;
         r_isb <= i_sb;
         r_isa <= i_sa;
    end

    always @(posedge clk_core) begin
        if (w_set_sr) r_sr <= w_c;
        if (w_set_sg) r_sg <= w_c;
        if (w_set_sb) r_sb <= w_c;
        if (w_set_dr) r_dr <= w_c;
        if (w_set_dg) r_dg <= w_c;
        if (w_set_db) r_db <= w_c;
    end

////////////////////////////
// function
////////////////////////////
    function [7:0] f_get_color_r;
        input [15:0] dbr;
        input [2:0]  mode;
        begin
            case (mode)
                2'b00 : begin
                    // R5G6B5
                    f_get_color_r = {dbr[15:11],dbr[15:13]};
                end
                2'b01 : begin
                    // R5G5B5A1
                    f_get_color_r = {dbr[15:11],dbr[15:13]};
                end
                2'b10 : begin
                    // R4G4B4A4
                    f_get_color_r = {dbr[15:12],dbr[15:12]};
                end
                default : begin
                    f_get_color_r = {dbr[15:12],dbr[15:12]};
                end
            endcase
        end
    endfunction

    function [7:0] f_get_color_g;
        input [15:0] dbr;
        input [2:0]  mode;
        begin
            case (mode)
                2'b00 : begin
                    // R5G6B5
                    f_get_color_g = {dbr[10:5],dbr[10:9]};
                end
                2'b01 : begin
                    // R5G5B5A1
                    f_get_color_g = {dbr[10:6],dbr[10:8]};
                end
                2'b10 : begin
                    // R4G4B4A4
                    f_get_color_g = {dbr[11:8],dbr[11:8]};
                end
                default : begin
                    f_get_color_g = {dbr[11:8],dbr[11:8]};
                end
            endcase
        end
    endfunction

    function [7:0] f_get_color_b;
        input [15:0] dbr;
        input [2:0]  mode;
        begin
            case (mode)
                2'b00 : begin
                    // R5G6B5
                    f_get_color_b = {dbr[4:0],dbr[4:2]};
                end
                2'b01 : begin
                    // R5G5B5A1
                    f_get_color_b = {dbr[5:1],dbr[5:3]};
                end
                2'b10 : begin
                    // R4G4B4A4
                    f_get_color_b = {dbr[7:4],dbr[7:4]};
                end
                default : begin
                    f_get_color_b = {dbr[7:4],dbr[7:4]};
                end
            endcase
        end
    endfunction

////////////////////////////
// module instance
////////////////////////////
    fm_3d_imul8 imul8 (
        .i_a(w_a),
        .i_b(w_b),
        .o_c(w_c)
    );

endmodule
