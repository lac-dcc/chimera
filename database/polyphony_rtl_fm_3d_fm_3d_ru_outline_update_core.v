//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_update_core.v
//
// Abstract:
//   generate outline edge update parameters
//   o_cur_edge_p = (i_cur_p + i_step_p)+i_initial_p  latency = 6
//   o_cur_p = i_cur_p + i_step_p
//
//   In aa_mode:
//   o_cur_edge_p = i_initial_p + i_step_p*i_delta_a latency = 6
//   o_cur_p = i_cur_p + i_step_p*i_delta_a          latency = 6
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

module fm_3d_ru_outline_update_core (
    clk_core,
    i_en,
    i_valid,
    i_kind,
    i_end_flag,
    i_cur_p,
    i_initial_p,
    i_step_p,
    i_delta_a,
    i_aa_mode,
    o_valid,
    o_kind,
    o_end_flag,
    o_initial_p,
    o_step_p,
    o_cur_p,
    o_cur_edge_p
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         i_en;
    input         i_valid;
    input  [3:0]  i_kind;
    input         i_end_flag;
    input  [21:0] i_cur_p;
    input  [20:0] i_initial_p;
    input  [21:0] i_step_p;
    input  [21:0] i_delta_a;
    input         i_aa_mode;
    output        o_valid;
    output [3:0]  o_kind;
    output        o_end_flag;
    output [20:0] o_initial_p;
    output [21:0] o_step_p;
    output [21:0] o_cur_p;
    output [21:0] o_cur_edge_p;
////////////////////////////
// wire
////////////////////////////
    wire  [21:0]  w_cur_p;
    wire  [21:0]  w_cur_pp;
    wire  [20:0]  w_initial_p;
    wire  [21:0]  w_adder_out; 
    wire  [21:0]  w_mul_out;
    wire  [21:0]  w_adder_in_a;
    wire  [21:0]  w_adder_in_aa;
    wire  [21:0]  w_adder_in_bb;
////////////////////////////
// assign
////////////////////////////
    assign w_adder_in_a = (i_aa_mode) ? w_mul_out : w_adder_out;
    assign w_adder_in_aa = (i_aa_mode) ? w_mul_out : i_step_p;
    assign w_adder_in_bb = (i_aa_mode) ? w_cur_p : i_cur_p;
    assign o_cur_p = (i_aa_mode) ? w_adder_out : w_cur_pp;
////////////////////////////
// module instance
////////////////////////////

    // step * delta
    fm_3d_fmul mul_delta (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_step_p),
        .i_b(i_delta_a),
        .o_c(w_mul_out)
    );

    // step + delta
    fm_3d_fadd fadd_cs (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_adder_in_aa),
        .i_b(w_adder_in_bb),
        .i_adsb(1'b0),
        .o_c(w_adder_out)
    );

    // fmul/fadd delay adjust
    fm_3d_delay #(22,3) delay_cur_p (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_cur_p),
        .o_data(w_cur_p)
    );

    fm_3d_delay #(21,3) delay_initial_p (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_initial_p),
        .o_data(w_initial_p)
    );

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

    // adder (initialp + step*cur)
    fm_3d_fadd fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_adder_in_a),
        .i_b({1'b0,w_initial_p}),
        .i_adsb(1'b0),
        .o_c(o_cur_edge_p)
    );

    fm_3d_delay #(22,3) delay_cp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_adder_out),
        .o_data(w_cur_pp)
    );

    fm_3d_delay #(21,3) delay_initial_pp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_initial_p),
        .o_data(o_initial_p)
    );

    fm_3d_delay #(22,6) delay_step_pp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_step_p),
        .o_data(o_step_p)
    );


endmodule
