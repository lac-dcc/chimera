// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_interp_s.v, latency = 12
//
// Abstract:
//   parameter interpolator with w correction
//   o_c = (i_a*(1-t) + i_b*t) * w
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

module fm_3d_interp_s (
    clk_core,
    rst_x,
    i_en,
    i_a,
    i_b,
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
    input  [21:0] i_a;
    input  [21:0] i_b;
    input  [21:0] i_t;
    input  [21:0] i_w;
    output [21:0] o_c;          // result


///////////////////////////////////////////
//  wire 
///////////////////////////////////////////
    wire [21:0]  w_wd;

    wire [21:0]  w_io;
////////////////////////////
// module instance
////////////////////////////

    // stage1-9 (interpolate)

    fm_3d_interp interp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_a),
        .i_b(i_b),
        .i_t(i_t),
        .o_c(w_io)
    );

    fm_3d_delay #(22,9) delay_wd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_w),
        .o_data(w_wd)
    );

    // stage 10-12
    fm_3d_fmul mul_w (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_io),
        .i_b(w_wd),
        .o_c(o_c)
    );

endmodule
