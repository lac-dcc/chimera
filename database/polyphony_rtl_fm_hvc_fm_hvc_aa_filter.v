// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_hvc_aa_filter.v
//
// Abstract:
//   Anti-aliasing filter
//     only support 565 color mode
//  Created:
//    22 January 2009
//
// Copyright (c) 2008-2009 Kenji Ishimaru, All rights reserved.
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

module fm_hvc_aa_filter (
    clk_vi,
    rst_x,
    // configuration
    i_fb_blend_en,
    // incoming color
    i_h_active,
    i_first_line,
    i_r_base,
    i_g_base,
    i_b_base,
    i_upper,
    i_lower,
    // outgoing color
    o_r,
    o_g,
    o_b
);

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_vi;     // 25MHz
    input          rst_x;
    // configuration
    input          i_fb_blend_en;
    // incoming color
    input          i_h_active;
    input          i_first_line;
    input  [7:0]   i_r_base;
    input  [7:0]   i_g_base;
    input  [7:0]   i_b_base;
    input  [15:0]  i_upper;
    input  [15:0]  i_lower;
    // outgoing color
    output [7:0]   o_r;
    output [7:0]   o_g;
    output [7:0]   o_b;
//////////////////////////////////
// reg
//////////////////////////////////
    reg    [15:0]  r_upper;
    reg    [15:0]  r_lower;

//////////////////////////////////
// wire
//////////////////////////////////
    wire   [7:0]   w_r_tr;
    wire   [7:0]   w_g_tr;
    wire   [7:0]   w_b_tr;
    wire   [7:0]   w_r_tl;
    wire   [7:0]   w_g_tl;
    wire   [7:0]   w_b_tl;
    wire   [7:0]   w_r_br;
    wire   [7:0]   w_g_br;
    wire   [7:0]   w_b_br;
    wire   [7:0]   w_r_bl;
    wire   [7:0]   w_g_bl;
    wire   [7:0]   w_b_bl;
//////////////////////////////////
// assign
//////////////////////////////////
    // extend 5:6:5 to 8:8:8
    assign w_r_tr = {i_upper[15:11],i_upper[15:13]};
    assign w_g_tr = {i_upper[10:5],i_upper[10:9]};
    assign w_b_tr = {i_upper[4:0],i_upper[4:2]};
    assign w_r_tl = {r_upper[15:11],r_upper[15:13]};
    assign w_g_tl = {r_upper[10:5],r_upper[10:9]};
    assign w_b_tl = {r_upper[4:0],r_upper[4:2]};
    assign w_r_br = (i_first_line) ? w_r_tr : {i_lower[15:11],i_lower[15:13]};
    assign w_g_br = (i_first_line) ? w_g_tr : {i_lower[10:5],i_lower[10:9]};
    assign w_b_br = (i_first_line) ? w_b_tr : {i_lower[4:0],i_lower[4:2]};
    assign w_r_bl = (i_first_line) ? w_r_tl : {r_lower[15:11],r_lower[15:13]};
    assign w_g_bl = (i_first_line) ? w_g_tl : {r_lower[10:5],r_lower[10:9]};
    assign w_b_bl = (i_first_line) ? w_b_tl : {r_lower[4:0],r_lower[4:2]};

//////////////////////////////////
// always
//////////////////////////////////
    always @(posedge clk_vi) begin
        r_upper <= i_upper;
        r_lower <= i_lower;
    end
//////////////////////////////////
// module instance
//////////////////////////////////

// r component
    fm_hvc_aa_filter_core filter_r (
        .clk_vi(clk_vi),
        // configuration
        .i_fb_blend_en(i_fb_blend_en),
        // incoming color
        .i_base(i_r_base),
        .i_br(w_r_br),
        .i_bl(w_r_bl),
        .i_tr(w_r_tr),
        .i_tl(w_r_tl),
        // outgoing color
        .o_c(o_r)
    );

// g component
    fm_hvc_aa_filter_core filter_g (
        .clk_vi(clk_vi),
        // configuration
        .i_fb_blend_en(i_fb_blend_en),
        // incoming color
        .i_base(i_g_base),
        .i_br(w_g_br),
        .i_bl(w_g_bl),
        .i_tr(w_g_tr),
        .i_tl(w_g_tl),
        // outgoing color
        .o_c(o_g)
    );

// b component
    fm_hvc_aa_filter_core filter_b (
        .clk_vi(clk_vi),
        // configuration
        .i_fb_blend_en(i_fb_blend_en),
        // incoming color
        .i_base(i_b_base),
        .i_br(w_b_br),
        .i_bl(w_b_bl),
        .i_tr(w_b_tr),
        .i_tl(w_b_tl),
        // outgoing color
        .o_c(o_b)
    );

endmodule
