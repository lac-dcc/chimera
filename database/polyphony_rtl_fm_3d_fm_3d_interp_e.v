//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_interp_e.v, latency = 12
//
// Abstract:
//   parameter interpolator with w correction
//   o_c = (i_a*i_iwa * (1-t) + i_b *i_iwb*t)
//  Created:
//    28 August 2008
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

module fm_3d_interp_e (
    clk_core,
    rst_x,
    i_en,
    i_wf,
    i_a,
    i_iwa,
    i_b,
    i_iwb,
    i_t,
    i_w,
    o_c
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    input         i_en;
    input         i_wf;
    input  [21:0] i_a;
    input  [21:0] i_iwa;
    input  [21:0] i_b;
    input  [21:0] i_iwb;
    input  [21:0] i_t;
    input  [21:0] i_w;
    output [21:0] o_c;          // result


///////////////////////////////////////////
//  wire 
///////////////////////////////////////////
    wire [21:0]  w_aiw;
    wire [21:0]  w_biw;

    wire [21:0]  w_aiw_s;
    wire [21:0]  w_biw_s;


    wire [21:0]  w_td;
    wire [21:0]  w_td_s;
    wire [21:0]  w_wd;

    wire [21:0]  w_wdd;
////////////////////////////
// assign
////////////////////////////
    assign w_aiw_s = (i_wf) ? w_aiw : i_a;
    assign w_biw_s = (i_wf) ? w_biw : i_b;
    assign w_td_s  = (i_wf) ? w_td : i_t;


////////////////////////////
// module instance
////////////////////////////

    // stage1-3

    fm_3d_fmul mul_aiw (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_a),
        .i_b(i_iwa),
        .o_c(w_aiw)
    );

    fm_3d_fmul mul_biw (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_b),
        .i_b(i_iwb),
        .o_c(w_biw)
    );

    fm_3d_delay #(22,3) delay_t (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_t),
        .o_data(w_td)
    );

    fm_3d_delay #(22,2) delay_w (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_w),
        .o_data(w_wd)
    );

    // stage4-12 (interpolate)

    fm_3d_interp interp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_aiw_s),
        .i_b(w_biw_s),
        .i_t(w_td_s),
        .o_c(o_c)
    );

endmodule
