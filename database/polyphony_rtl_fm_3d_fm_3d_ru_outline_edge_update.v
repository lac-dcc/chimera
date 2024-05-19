// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_edge_update.v
//
// Abstract:
//   generate outline edge update parameters
//   o_cur_p = i_cur_p + i_step_p
//
//   In aa_mode:
//   o_cur_p = i_cur_p + i_step_p*i_delta_a
//  Created:
//    15 December 2008
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

module fm_3d_ru_outline_edge_update (
    clk_core,
    rst_x,
    i_en,
    i_cur_p,
    i_step_p,
    i_delta_a,
    i_aa_mode,
    o_cur_p
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    input         i_en;
    input  [21:0] i_cur_p;
    input  [21:0] i_step_p;
    input  [21:0] i_delta_a;
    input         i_aa_mode;
    output [21:0] o_cur_p;
////////////////////////////
// wire
////////////////////////////
    wire  [21:0]  w_step_p;
    wire  [21:0]  w_cur_p;
    wire  [21:0]  w_step_pp;
    wire  [21:0]  w_cur_pp;
////////////////////////////
// assign
////////////////////////////
    assign w_step_pp = (i_aa_mode) ? w_step_p : i_step_p;
    assign w_cur_pp  = (i_aa_mode) ? w_cur_p : i_cur_p;
////////////////////////////
// module instance
////////////////////////////

    // step * delta
    fm_3d_fmul mul_delta (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_step_p),
        .i_b(i_delta_a),
        .o_c(w_step_p)
    );

    // delay adjust for delta
    fm_3d_delay #(22,3) delay_p (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_cur_p),
        .o_data(w_cur_p)
    );

    // adder (end_p - start_p)
    fm_3d_fadd fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_cur_pp),
        .i_b(w_step_pp),
        .i_adsb(1'b0),
        .o_c(o_cur_p)
    );



endmodule
