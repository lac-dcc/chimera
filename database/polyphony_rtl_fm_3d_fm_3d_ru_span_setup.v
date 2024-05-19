// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_setup.v
//
// Abstract:
//   span setup module
//     calculate delta_x = x_r - x_l,  delta_t = 1/ delta_x,
//     delta_t * 0.5 for anti-aliasing
//     update delta values, initial parameter values
//  Created:
//    23 October 2008
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

module fm_3d_ru_span_setup (
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
    // idle state indicator
    o_idle,
    // update module interface
    o_valid,
    o_aa_mode,
    o_kind,
    o_initial_val,
    o_step_val,
    o_delta_a,
    o_y,
    o_end_flag,
    o_end_x,
    i_busy
);
////////////////////////////
// parameter
////////////////////////////
    parameter P_IDLE      = 2'h0;
    parameter P_GEN_DELTA = 2'h1;
    parameter P_GEN_STEP  = 2'h2;
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
    // idle state indicator
    output        o_idle;
    // update module interface
    output        o_valid;
    output        o_aa_mode;
    output [3:0]  o_kind;
    output [21:0] o_initial_val;
    output [21:0] o_step_val;
    output [21:0] o_delta_a;
    output [8:0]  o_y;
    output        o_end_flag;
    output [20:0] o_end_x;
    input         i_busy;

////////////////////////////
// reg
////////////////////////////
    reg    [1:0]   r_state;
    reg            r_aa_mode;
////////////////////////////
// wire
////////////////////////////
    wire          w_start_delta;
    wire          w_start_step;
    wire          w_finish_delta;
    wire          w_finish_step;
    wire   [21:0] w_delta_t;
////////////////////////////
// assign
////////////////////////////
    assign w_start_delta = (r_state == P_IDLE) & i_valid;
    assign w_start_step = (r_state == P_GEN_DELTA) & w_finish_delta;
    assign o_y = i_y_l;
    assign o_end_x = i_x_r;
    assign o_ack = w_finish_step & (r_state == P_GEN_STEP);
    assign o_idle = (r_state == P_IDLE);
    assign o_aa_mode = r_aa_mode;
////////////////////////////
// always
////////////////////////////

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE: begin
                    if (i_valid) r_state <= P_GEN_DELTA;
                end
                P_GEN_DELTA: begin  // gen setps
                    if (w_finish_delta) r_state <= P_GEN_STEP;
                end
                P_GEN_STEP: begin
                    if (w_finish_step) r_state <= P_IDLE;
                end
            endcase
        end
    end


    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_aa_mode <= 1'b0;
        end else begin
            if (w_start_delta) r_aa_mode <= i_aa_mode;
        end
    end

////////////////////////////
// module instance
////////////////////////////
    fm_3d_ru_span_delta span_delta (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // span parameters
        .i_start(w_start_delta),
        .o_finish(w_finish_delta),
        .i_x_l(i_x_l),
        .i_x_r(i_x_r),
        // generated parameters
        .o_delta_t(w_delta_t),
        .o_delta_a(o_delta_a)
    );


    fm_3d_ru_span_step span_step (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // span parameter input
        .i_start(w_start_step),
        .o_finish(w_finish_step),
        .i_delta_t(w_delta_t),
        // vertex parameters
        .i_x_l(i_x_l),
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
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // output
        .o_valid(o_valid),
        .o_param_kind(o_kind),
        .o_initial_val(o_initial_val),
        .o_step_val(o_step_val),
        .o_end_flag(o_end_flag),
        .i_busy(i_busy)
    );
endmodule
