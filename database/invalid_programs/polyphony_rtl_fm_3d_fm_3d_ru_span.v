//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span.v
//
// Abstract:
//   Generate fragment
//
//  Created:
//    30 August 2008
//    17 December 2008 (New version)
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

module fm_3d_ru_span (
    clk_core,
    rst_x,
    // span parameters
    i_valid,
    i_aa_mode,
    i_x_l,
    i_y_l,
    i_z_l,
    i_iw_l,
    i_param00_l,
    i_param01_l,
    i_param02_l,
    i_param03_l,
    i_param10_l,
    i_param11_l,
`ifdef VTX_PARAM1_REDUCE
`else
    i_param12_l,
    i_param13_l,
`endif
    i_x_r,
    i_y_r,
    i_z_r,
    i_iw_r,
    i_param00_r,
    i_param01_r,
    i_param02_r,
    i_param03_r,
    i_param10_r,
    i_param11_r,
`ifdef VTX_PARAM1_REDUCE
`else
    i_param12_r,
    i_param13_r,
`endif
    o_ack,
    // control registers
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    i_param0_kind,
    i_param1_kind,
    // idle state indicator
    o_idle,
    // pixel unit bus
    o_valid_pu,
    i_busy_pu,
    o_aa_mode,
    o_x,
    o_y,
    o_z,
    o_cr,
    o_cg,
    o_cb,
    o_ca,
    // texture unit bus
    o_valid_tu,
    i_busy_tu,
    o_tu,
    o_tv
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // span parameters
    input         i_valid;
    input         i_aa_mode;
    input  [20:0] i_x_l;
    input  [8:0]  i_y_l;
    input  [20:0] i_z_l;
    input  [20:0] i_iw_l;
    input  [20:0] i_param00_l;
    input  [20:0] i_param01_l;
    input  [20:0] i_param02_l;
    input  [20:0] i_param03_l;
    input  [20:0] i_param10_l;
    input  [20:0] i_param11_l;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_param12_l;
    input  [20:0] i_param13_l;
`endif
    input  [20:0] i_x_r;
    input  [8:0]  i_y_r;
    input  [20:0] i_z_r;
    input  [20:0] i_iw_r;
    input  [20:0] i_param00_r;
    input  [20:0] i_param01_r;
    input  [20:0] i_param02_r;
    input  [20:0] i_param03_r;
    input  [20:0] i_param10_r;
    input  [20:0] i_param11_r;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_param12_r;
    input  [20:0] i_param13_r;
`endif
    output        o_ack;
    // control registers
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    input  [1:0]  i_param0_kind;
    input  [1:0]  i_param1_kind;
    // idle state indicator
    output        o_idle;
    // pixel unit bus
    output        o_valid_pu;
    input         i_busy_pu;
    output        o_aa_mode;
    output [9:0]  o_x;
    output [8:0]  o_y;
    output [15:0] o_z;
    output [7:0]  o_cr;
    output [7:0]  o_cg;
    output [7:0]  o_cb;
    output [7:0]  o_ca;
    // texture unit bus
    output        o_valid_tu;
    input         i_busy_tu;
    output [21:0] o_tu;
    output [21:0] o_tv;

////////////////////////////
// wire
////////////////////////////
    wire          w_valid;
    wire          w_aa_mode;
    wire   [3:0]  w_kind;
    wire   [21:0] w_initial_val;
    wire   [21:0] w_step_val;
    wire   [21:0] w_delta_a;
    wire   [8:0]  w_y;
    wire          w_end_flag;
    wire   [20:0] w_end_x;
    wire          w_busy;

    wire          w_idle_setup;
    wire          w_idle_fragment;
////////////////////////////
// assign
////////////////////////////
    assign o_idle = w_idle_setup & w_idle_fragment;
////////////////////////////
// module instance
////////////////////////////

    // setup module
    fm_3d_ru_span_setup span_setup(
        .clk_core(clk_core),
        .rst_x(rst_x),
        // span parameters
        .i_valid(i_valid),
        .i_aa_mode(i_aa_mode),
        .i_x_l(i_x_l),
        .i_y_l(i_y_l),
        .i_z_l(i_z_l),
        .i_iw_l(i_iw_l),
        .i_param00_l(i_param00_l),
        .i_param01_l(i_param01_l),
        .i_param02_l(i_param02_l),
        .i_param03_l(i_param03_l),
        .i_param10_l(i_param10_l),
        .i_param11_l(i_param11_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_l(i_param12_l),
        .i_param13_l(i_param13_l),
`endif
        .i_x_r(i_x_r),
        .i_y_r(i_y_r),
        .i_z_r(i_z_r),
        .i_iw_r(i_iw_r),
        .i_param00_r(i_param00_r),
        .i_param01_r(i_param01_r),
        .i_param02_r(i_param02_r),
        .i_param03_r(i_param03_r),
        .i_param10_r(i_param10_r),
        .i_param11_r(i_param11_r),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_r(i_param12_r),
        .i_param13_r(i_param13_r),
`endif
        .o_ack(o_ack),
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // idle state indicator
        .o_idle(w_idle_setup),
        // update module interface
        .o_valid(w_valid),
        .o_aa_mode(w_aa_mode),
        .o_kind(w_kind),   // y will be int, and last kind
        .o_initial_val(w_initial_val),
        .o_step_val(w_step_val),
        .o_delta_a(w_delta_a),
        .o_y(w_y),
        .o_end_flag(w_end_flag),
        .o_end_x(w_end_x),
        .i_busy(w_busy)
    );


    // fragment generation (x -loop)
    fm_3d_ru_span_fragment span_fragment(
        .clk_core(clk_core),
        .rst_x(rst_x),
        // setup module interface
        .i_valid(w_valid),
        .i_aa_mode(w_aa_mode),
        .i_kind(w_kind),
        .i_initial_val(w_initial_val),
        .i_step_val(w_step_val),
        .i_delta_a(w_delta_a),
        .i_y(w_y),
        .i_end_flag(w_end_flag),
        .i_end_x(w_end_x),
        .o_busy(w_busy),
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        .i_param0_kind(i_param0_kind),
        .i_param1_kind(i_param1_kind),
        // idle state indicator
        .o_idle(w_idle_fragment),
        // pixel unit bus
        .o_valid_pu(o_valid_pu),
        .i_busy_pu(i_busy_pu),
        .o_aa_mode(o_aa_mode),
        .o_x(o_x),
        .o_y(o_y),
        .o_z(o_z),
        .o_cr(o_cr),
        .o_cg(o_cg),
        .o_cb(o_cb),
        .o_ca(o_ca),
        // texture unit bus
        .o_valid_tu(o_valid_tu),
        .i_busy_tu(i_busy_tu),
        .o_tu(o_tu),
        .o_tv(o_tv)
    );
endmodule
