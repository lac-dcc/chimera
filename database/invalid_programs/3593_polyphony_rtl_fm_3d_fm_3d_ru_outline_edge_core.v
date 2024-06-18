// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_edge_core.v
//
// Abstract:
//   generate outline edge, new version
//   previous version generated edge parameter by interpolation,
//   this version generates them by step value addition
//  Created:
//    7 September 2008 (interpolation version)
//    15 December 2008 (step version)
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

module fm_3d_ru_outline_edge_core (
    clk_core,
    rst_x,
    // idle state indicator
    o_idle,
    // outline parameters
    i_valid,
    i_has_bottom,
    i_start_x,
    i_start_x_05,
    i_start_y,
    i_end_y,
    i_delta_x,
    i_delta_t,
    i_delta_a,
    o_ack,
    // vertex parameters
    i_z_s,
    i_iw_s,
    i_param00_s,
    i_param01_s,
    i_param02_s,
    i_param03_s,
    i_param10_s,
    i_param11_s,
`ifdef VTX_PARAM1_REDUCE
`else
    i_param12_s,
    i_param13_s,
`endif
    i_z_e,
    i_iw_e,
    i_param00_e,
    i_param01_e,
    i_param02_e,
    i_param03_e,
    i_param10_e,
    i_param11_e,
`ifdef VTX_PARAM1_REDUCE
`else
    i_param12_e,
    i_param13_e,
`endif
    // control registers
    i_aa_mode,
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    // output
    o_valid,
    i_busy,
    o_x,
    o_y,
    o_z,
    o_iw,
    o_param00,
    o_param01,
    o_param02,
    o_param03,
    o_param10,
    o_param11
`ifdef VTX_PARAM1_REDUCE
`else
    ,o_param12,
    o_param13
`endif
);

////////////////////////////
// parameter
////////////////////////////
    parameter P_IDLE         = 3'h0;
    parameter P_SETUP        = 3'h1;
    parameter P_SKIP_BOTTOM  = 3'h2;
    parameter P_SETUP_AA     = 3'h3;
    parameter P_WAIT_AA      = 3'h4;
    parameter P_OUTPUT       = 3'h5;
    parameter P_UPDATE       = 3'h6;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // idle state indicator
    output        o_idle;
    // outline parameters
    input         i_valid;
    input         i_has_bottom;
    input  [20:0] i_start_x;
    input  [20:0] i_start_x_05;
    input  [20:0] i_start_y;
    input  [20:0] i_end_y;
    input  [21:0] i_delta_x;
    input  [21:0] i_delta_t;
    input  [21:0] i_delta_a;
    output        o_ack;  // empty flag
    // vertex parameters
    input  [20:0] i_z_s;
    input  [20:0] i_iw_s;
    input  [20:0] i_param00_s;
    input  [20:0] i_param01_s;
    input  [20:0] i_param02_s;
    input  [20:0] i_param03_s;
    input  [20:0] i_param10_s;
    input  [20:0] i_param11_s;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_param12_s;
    input  [20:0] i_param13_s;
`endif
    input  [20:0] i_z_e;
    input  [20:0] i_iw_e;
    input  [20:0] i_param00_e;
    input  [20:0] i_param01_e;
    input  [20:0] i_param02_e;
    input  [20:0] i_param03_e;
    input  [20:0] i_param10_e;
    input  [20:0] i_param11_e;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_param12_e;
    input  [20:0] i_param13_e;
`endif
    // control registers
    input         i_aa_mode;
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    // output
    output        o_valid;
    input         i_busy;
    output [20:0] o_x;
    output [8:0]  o_y;
    output [20:0] o_z;
    output [20:0] o_iw;
    output [20:0] o_param00;
    output [20:0] o_param01;
    output [20:0] o_param02;
    output [20:0] o_param03;
    output [20:0] o_param10;
    output [20:0] o_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_param12;
    output [20:0] o_param13;
`endif

////////////////////////////
// reg
////////////////////////////
    reg    [2:0]   r_state;
////////////////////////////
// wire
////////////////////////////
    wire   [20:0] w_start_x;
    wire          w_start_step;
    wire          w_finish_step;
    wire          w_initial_valid;
    wire   [3:0]  w_initial_kind;
    wire   [21:0] w_initial_val;
    wire   [21:0] w_initial_step;

    wire          w_start_update;
    wire          w_finish_update;
    wire          w_update_valid;
    wire   [3:0]  w_update_kind;
    wire   [21:0] w_update_edge_val;
    wire          w_aa_mode;

    wire          w_edge_end;
    wire   [20:0] w_edge_y;
////////////////////////////
// assign
////////////////////////////
    assign w_aa_mode = (r_state == P_SETUP_AA)|(r_state == P_WAIT_AA);
    assign w_start_x = (i_aa_mode) ? i_start_x : i_start_x_05;
    assign w_edge_end = (w_edge_y >= i_end_y);

    assign w_start_step = (r_state == P_IDLE) & i_valid;
    assign w_start_update = (r_state == P_SETUP_AA) |
                            ((r_state == P_SETUP) & w_finish_step & !i_aa_mode & !i_has_bottom & !w_edge_end) |
                            ((r_state == P_OUTPUT) & !i_busy&!w_edge_end);

    // port connection
    assign o_valid = (r_state == P_OUTPUT);
    assign o_ack = ((r_state == P_OUTPUT)& !i_busy&w_edge_end) |
                   ((r_state == P_SETUP)&w_finish_step&!i_has_bottom&w_edge_end&!i_aa_mode);
    assign o_idle = (r_state == P_IDLE);
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE: begin
                    if (i_valid) r_state <= P_SETUP;
                end
                P_SETUP: begin  // gen setps
                    if (w_finish_step) begin
                        if (i_aa_mode) begin
                            r_state <= P_SETUP_AA;
                        end else if (!i_has_bottom) begin
                            if (w_edge_end) r_state <= P_IDLE;
                            else r_state <= P_SKIP_BOTTOM;
                        end else begin
                            r_state <= P_OUTPUT;
                        end
                    end
                end
                P_SKIP_BOTTOM: begin
                    if (w_finish_update) begin
                        if (i_aa_mode) r_state <= P_SETUP_AA;

                        else r_state <= P_OUTPUT;
                    end
                end
                P_SETUP_AA: begin  // additional setup for aa
                    r_state <= P_WAIT_AA;
                end
                P_WAIT_AA: begin
                    if (w_finish_update) r_state <= P_OUTPUT;
                end
                P_OUTPUT: begin
                    if (!i_busy) begin
                        if (w_edge_end) r_state <= P_IDLE;
                        else r_state <= P_UPDATE;
                    end
                end
                P_UPDATE: begin
                    if (w_finish_update) r_state <= P_OUTPUT;
                end
            endcase
        end
    end

////////////////////////////
// module instance
////////////////////////////
    fm_3d_ru_outline_step outline_step (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // outline parameter input
        .i_start(w_start_step),
        .o_finish(w_finish_step),
        .i_delta_t(i_delta_t),
        // vertex parameters
        .i_start_x(w_start_x),
        .i_start_y(i_start_y),
        .i_delta_x(i_delta_x),
        .i_z_s(i_z_s),
        .i_iw_s(i_iw_s),
        .i_param00_s(i_param00_s),
        .i_param01_s(i_param01_s),
        .i_param02_s(i_param02_s),
        .i_param03_s(i_param03_s),
        .i_param10_s(i_param10_s),
        .i_param11_s(i_param11_s),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_s(i_param12_s),
        .i_param13_s(i_param13_s),
`endif
        .i_z_e(i_z_e),
        .i_iw_e(i_iw_e),
        .i_param00_e(i_param00_e),
        .i_param01_e(i_param01_e),
        .i_param02_e(i_param02_e),
        .i_param03_e(i_param03_e),
        .i_param10_e(i_param10_e),
        .i_param11_e(i_param11_e),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_e(i_param12_e),
        .i_param13_e(i_param13_e),
`endif
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // output
        .o_valid(w_initial_valid),
        .o_param_kind(w_initial_kind),
        .o_initial_val(w_initial_val),
        .o_step_val(w_initial_step)
    );

    fm_3d_ru_outline_update outline_update (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // parameter input
        .i_start(w_start_update),
        .i_aa_mode(w_aa_mode),
        .i_delta_a(i_delta_a),
        .o_finish(w_finish_update),
        // generated steps
        .i_valid_step(w_initial_valid),
        .i_step_kind(w_initial_kind),
        .i_step_val(w_initial_step),
        .i_initial_val(w_initial_val),
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // new value
        .o_new_valid(w_update_valid),
        .o_new_kind(w_update_kind),
        .o_new_edge_val(w_update_edge_val)
    );

    fm_3d_ru_outline_reg outline_reg (
        .clk_core(clk_core),
        // parameter init
        .i_coord_valid(w_start_step),
        .i_start_x(w_start_x),
        .i_start_y(i_start_y),
        .i_init_valid(w_initial_valid),
        .i_init_kind(w_initial_kind),
        .i_init_val(w_initial_val[20:0]),
        // parameter update
        .i_update_valid(w_update_valid),
        .i_update_kind(w_update_kind),
        .i_update_edge_val(w_update_edge_val),
        // parameter out
        .o_edge_x(o_x),
        .o_edge_y(o_y),
        .o_edge_y_float(w_edge_y),
        .o_edge_z(o_z),
        .o_edge_iw(o_iw),
        .o_edge_param00(o_param00),
        .o_edge_param01(o_param01),
        .o_edge_param02(o_param02),
        .o_edge_param03(o_param03),
        .o_edge_param10(o_param10),
        .o_edge_param11(o_param11)
`ifdef VTX_PARAM1_REDUCE
`else
        ,.o_edge_param12(o_param12),
        .o_edge_param13(o_param13)
`endif
    );
endmodule
