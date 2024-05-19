// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_update_core.v
//
// Abstract:
//   generate span update parameters
//    (cw = 1/iw                                 latency = 2)
//    o_frag_p = i_cur_p * cw                   latency = 3
//    o_cur_p  = i_cur_p + i_step_p             latency = 3(total 6)
//
//   In aa_mode:
//   o_cur_p = i_cur_p + i_step_p*i_delta_a     latency = 6
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

`include "fm_3d_def.v"

module fm_3d_ru_span_update_core (
    clk_core,
    rst_x,
    i_en,
    i_valid,
    i_kind,
    i_end_flag,
    i_cur_p,
    i_step_p,
    i_delta_a,
    i_aa_mode,
    o_valid,
    o_kind,
    o_end_flag,
    o_cur_p,
    o_frag_p,
    o_x,
    o_z,
    o_color
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
    input  [21:0] i_cur_p;
    input  [21:0] i_step_p;
    input  [21:0] i_delta_a;
    input         i_aa_mode;
    output        o_valid;
    output [3:0]  o_kind;
    output        o_end_flag;
    output [21:0] o_cur_p;
    output [21:0] o_frag_p;
    output [9:0]  o_x;
    output [15:0] o_z;
    output [7:0]  o_color;
////////////////////////////
// reg
////////////////////////////
    reg    [21:0]  r_cw;

////////////////////////////
// wire
////////////////////////////
    wire  [21:0]  w_cw;
    wire  [21:0]  w_recip_out;
    wire          w_kind_iw;
    wire          w_kind_x;
    wire          w_set_cw;
    wire  [21:0]  w_mul_in_a;
    wire  [21:0]  w_mul_in_b;
    wire  [21:0]  w_10;
    wire  [21:0]  w_mul_out;
    wire  [21:0]  w_fadd_in_a;
    wire  [21:0]  w_fadd_in_b;

    wire  [21:0]  w_step_3d;
    wire  [21:0]  w_cur_3d;
    wire          w_valid_3d;
    wire          w_end_flag_3d;
    wire  [3:0]   w_kind_3d;
    wire  [15:0]  w_ix;
    wire  [15:0]  w_iz;
    wire  [7:0]   w_color;
////////////////////////////
// assign
////////////////////////////
    assign w_kind_iw = (i_kind == `FPARAM_IW);
    assign w_kind_x = (i_kind == `FPARAM_X);
    assign w_cw = (w_kind_iw) ? w_recip_out : r_cw;
    assign w_mul_in_b = (i_aa_mode)           ? i_delta_a :
                        (w_kind_x|w_kind_iw)  ? w_10:
                                                w_cw;

    assign w_mul_in_a = (i_aa_mode)           ? i_step_p : i_cur_p;
    assign w_10 = {1'b0, 5'h0f, 16'h8000};
    assign w_fadd_in_a = (i_aa_mode) ? w_mul_out : w_cur_3d;
    assign w_fadd_in_b = (i_aa_mode) ? w_cur_3d : w_step_3d;
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core) begin
        if (w_set_cw) r_cw <= w_recip_out;
    end
////////////////////////////
// module instance
////////////////////////////
    // cw = 1/iw  (only for iw)
    fm_3d_frcp frcp (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_cur_p),
        .o_c(w_recip_out)
    );

    // delay adjust for cw register
    fm_3d_delay #(1,2) delay_iw (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_kind_iw),
        .o_data(w_set_cw)
    );

    ////////////////////////////////
    // stage0-2
    ///////////////////////////////
    // current value * cw;
    fm_3d_fmul mul_delta (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_mul_in_a),
        .i_b(w_mul_in_b),
        .o_c(w_mul_out)
    );

    // fmul delay adjust
    fm_3d_delay #(1,3) delay_valid_fmul (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_valid),
        .o_data(w_valid_3d)
    );

    fm_3d_delay #(1,3) delay_end_flag_fmul (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_end_flag),
        .o_data(w_end_flag_3d)
    );

    fm_3d_delay #(4,3) delay_kind_fmul (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_kind),
        .o_data(w_kind_3d)
    );

    fm_3d_delay #(22,3) delay_step_fmul (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_step_p),
        .o_data(w_step_3d)
    );

    fm_3d_delay #(22,3) delay_cur_fmul (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_cur_p),
        .o_data(w_cur_3d)
    );
    ////////////////////////////////
    // stage3-5
    ///////////////////////////////
    // adder (end_p - start_p)
    fm_3d_fadd fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_fadd_in_a),
        .i_b(w_fadd_in_b),
        .i_adsb(1'b0),
        .o_c(o_cur_p)
    );

    // delay adjust for fragment
    fm_3d_delay #(22,3) delay_frag_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_mul_out),
        .o_data(o_frag_p)
    );

    // delay adjust for valid
    fm_3d_delay #(1,3) delay_valid_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_valid_3d),
        .o_data(o_valid)
    );

    fm_3d_delay #(1,3) delay_end_flag_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_end_flag_3d),
        .o_data(o_end_flag)
    );

    fm_3d_delay #(4,3) delay_kind_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_kind_3d),
        .o_data(o_kind)
    );

    // ftoi for x
    fm_3d_f22_to_ui ftoi_x (
        .i_a(w_mul_out),
        .o_b(w_ix)
    );

    fm_3d_delay #(10,3) delay_x_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_ix[9:0]),
        .o_data(o_x)
    );

    // ftoi for z
    fm_3d_f22_to_z ftoi_z (
        .i_a(w_mul_out),
        .o_b(w_iz)
    );

    fm_3d_delay #(16,3) delay_z_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_iz),
        .o_data(o_z)
    );

    // ftoc
    fm_3d_f22_to_i8_2 ftoc (
        .i_a(w_mul_out),
        .o_b(w_color)
    );

    fm_3d_delay #(8,3) delay_col_fadd (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_color),
        .o_data(o_color)
    );


endmodule
