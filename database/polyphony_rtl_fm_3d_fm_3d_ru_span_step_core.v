// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_step_core.v
//
// Abstract:
//   generate span step calculation
//
//   (endp - start_p)*delta_t,                  latency = 6
//
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

module fm_3d_ru_span_step_core (
    clk_core,
    rst_x,
    i_en,
    i_valid,
    i_kind,
    i_end_flag,
    i_start_p,
    i_end_p,
    i_delta_t,
    o_valid,
    o_kind,
    o_end_flag,
    o_start_p,
    o_step_p
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    input         i_en;
    input         i_valid;
    input  [3:0]  i_kind;
    input         i_end_flag;
    input  [21:0] i_start_p;
    input  [21:0] i_end_p;
    input  [21:0] i_delta_t;
    output        o_valid;
    output [3:0]  o_kind;
    output        o_end_flag;
    output [21:0] o_start_p;
    output [21:0] o_step_p;
////////////////////////////
// wire
////////////////////////////
    wire  [21:0]  w_end_p;
    wire  [21:0]  w_start_p;
    wire  [21:0]  w_delta_p;
////////////////////////////
// assign
////////////////////////////
////////////////////////////
// module instance
////////////////////////////
    // adder (end_p - start_p)
    fm_3d_fadd fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_end_p),
        .i_b(i_start_p),
        .i_adsb(1'b1),
        .o_c(w_delta_p)
    );

    // delta_p * delta_t (not necessary to add delay to delta_t, t is static)
    fm_3d_fmul mul_delta_tp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_delta_p),
        .i_b(i_delta_t),
        .o_c(o_step_p)
    );
    // delay adjust for o_start_p
    fm_3d_delay #(22,6) delay_p (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_start_p),
        .o_data(o_start_p)
    );

    // delay adjust for valid
    fm_3d_delay #(1,6) delay_valid (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_valid),
        .o_data(o_valid)
    );

    fm_3d_delay #(1,6) delay_end_flag (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_end_flag),
        .o_data(o_end_flag)
    );

    fm_3d_delay #(4,6) delay_kind (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_kind),
        .o_data(o_kind)
    );

endmodule
