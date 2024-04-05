//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_fragment.v
//
// Abstract:
//   parameter update x-loop
//  Created:
//    18 December 2008
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

module fm_3d_ru_span_fragment (
    clk_core,
    rst_x,
    // setup module interface
    i_valid,
    i_aa_mode,
    i_kind,
    i_initial_val,
    i_step_val,
    i_delta_a,
    i_end_flag,
    i_y,
    i_end_x,
    o_busy,
    // idle state indicator
    o_idle,
    // control registers
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param0_kind,
    i_param1_size,
    i_param1_kind,
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
// parameter
////////////////////////////
    parameter P_IDLE          = 3'h0;
    parameter P_INITIAL_SETUP = 3'h1;
    parameter P_UPDATE_AA     = 3'h2;
    parameter P_WAIT_AA       = 3'h3;
    parameter P_GEN_FRAGMENT  = 3'h4;
    parameter P_OUT           = 3'h5;

    parameter P_PU_IDLE     = 2'h0;
    parameter P_PU_OUT      = 2'h1;
    parameter P_PU_WAIT     = 2'h2;
    parameter P_TU_IDLE     = 2'h0;
    parameter P_TU_OUT      = 2'h1;
    parameter P_TU_WAIT     = 2'h2;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // setup module interface
    input         i_valid;
    input         i_aa_mode;
    input  [3:0]  i_kind;
    input  [21:0] i_initial_val;
    input  [21:0] i_step_val;
    input  [21:0] i_delta_a;
    input  [8:0]  i_y;
    input         i_end_flag;
    input  [20:0] i_end_x;
    output        o_busy;
    // idle state indicator
    output        o_idle;
    // control registers
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    input  [1:0]  i_param0_kind;
    input  [1:0]  i_param1_kind;
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
// reg
////////////////////////////
    reg    [2:0]   r_state;
    reg    [1:0]   r_state_pu;
    reg    [1:0]   r_state_tu;
    reg    [8:0]   r_y;
    reg    [20:0]  r_end_x;
    reg            r_aa_mode;
////////////////////////////
// wire
////////////////////////////
    wire           w_valid;
    wire           w_finish_setup;
    wire           w_start_update;
    wire           w_finish_update;
    wire           w_finish_fragment;
    wire           w_aa_mode;
    // internal connection
    wire           w_update_valid;
    wire   [3:0]   w_update_kind;
    wire           w_update_end_flag;
    wire   [21:0]  w_update_val;
    wire   [21:0]  w_update_frag;
    wire   [9:0]   w_update_x;
    wire   [15:0]  w_update_z;
    wire   [7:0]   w_update_color;
    wire   [20:0]  w_cur_x;
    wire   [20:0]  w_cur_z;
    wire   [20:0]  w_cur_iw;
    wire   [20:0]  w_cur_param00;
    wire   [20:0]  w_cur_param01;
    wire   [20:0]  w_cur_param02;
    wire   [20:0]  w_cur_param03;
    wire   [20:0]  w_cur_param10;
    wire   [20:0]  w_cur_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0]  w_cur_param12;
    wire   [20:0]  w_cur_param13;
`endif

    wire           w_param0_is_color0;
    wire           w_param1_is_color0;
    wire           w_param0_is_texture0;
    wire           w_param1_is_texture0;

    wire           w_go_out_pu;
    wire           w_set_color0;
    wire           w_set_color1;
    wire           w_set_no_color;
    wire           w_go_out_tu;
    wire           w_set_texture0;
    wire           w_set_texture1;
    wire           w_go_idle_pu;
    wire           w_go_idle_tu;
    wire           w_go_idle;
    wire           w_end_x;
////////////////////////////
// assign
////////////////////////////
    assign o_busy = !((r_state == P_IDLE)|(r_state == P_INITIAL_SETUP));
    assign w_start_update = ((r_state == P_INITIAL_SETUP) & w_finish_setup ) |
                            (r_state == P_WAIT_AA) |
                            ((r_state == P_OUT) & w_go_idle & !w_end_x);
    assign w_finish_setup = i_valid & i_end_flag & !o_busy;
    assign w_valid = i_valid & ((r_state == P_IDLE)|(r_state == P_INITIAL_SETUP));
   
    assign w_param0_is_color0 = (i_param0_en & (i_param0_kind == `ATTR_COLOR0));
    assign w_param1_is_color0 = (i_param1_en & (i_param1_kind == `ATTR_COLOR0));
    assign w_param0_is_texture0 = (i_param0_en & (i_param0_kind == `ATTR_TEXTURE0));
    assign w_param1_is_texture0 = (i_param1_en & (i_param1_kind == `ATTR_TEXTURE0));

    assign w_set_color0 = w_param0_is_color0 &
                          (((w_update_kind == `FPARAM_P02)&(i_param0_size == 2'd2))
                           |(w_update_kind == `FPARAM_P03));
    assign w_set_color1 = w_param1_is_color0 &
                          (((w_update_kind == `FPARAM_P12)&(i_param1_size == 2'd2))
                           |(w_update_kind == `FPARAM_P13));
    assign w_set_no_color = !w_param0_is_color0 & !w_param1_is_color0 &
                            (w_update_kind == `FPARAM_Z);

    assign w_go_out_pu = !w_aa_mode & w_update_valid & (w_set_color0 | w_set_color1 | w_set_no_color);

    assign w_set_texture0 = w_param0_is_texture0 & (w_update_kind == `FPARAM_P01);
    assign w_set_texture1 = w_param1_is_texture0 & (w_update_kind == `FPARAM_P11);
    assign w_go_out_tu = !w_aa_mode & w_update_valid & (w_set_texture0 | w_set_texture1);
    assign w_go_idle_pu = (w_param0_is_texture0|w_param1_is_texture0) ?
                                           ((r_state_pu == P_PU_WAIT) & (r_state_tu == P_TU_WAIT)) :
                                           (r_state_pu == P_PU_WAIT);
    assign w_go_idle_tu =  ((r_state_pu == P_PU_WAIT) & (r_state_tu == P_TU_WAIT));
    assign w_go_idle = (w_go_idle_tu | w_go_idle_pu);
    assign w_finish_fragment = w_finish_update;
    assign w_end_x = (w_cur_x >= r_end_x);
    assign w_aa_mode = (r_state == P_UPDATE_AA)|
                       ((r_state == P_INITIAL_SETUP) & w_finish_setup &i_aa_mode);

    assign o_y = r_y;
    assign o_valid_pu = (r_state_pu == P_PU_OUT);
    assign o_valid_tu = (r_state_tu == P_TU_OUT);
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
                    if (i_valid) r_state <= P_INITIAL_SETUP;
                end
                P_INITIAL_SETUP: begin
                    if (w_finish_setup) begin
                        if (i_aa_mode) r_state <= P_UPDATE_AA;
                        else r_state <= P_GEN_FRAGMENT;
                    end
                end
                P_UPDATE_AA: begin 
                    if (w_finish_update) r_state <= P_WAIT_AA;
                end
                P_WAIT_AA: begin 
                    r_state <= P_GEN_FRAGMENT;
                end
                P_GEN_FRAGMENT: begin
                    if (w_finish_fragment) r_state <= P_OUT;
                end
                P_OUT: begin
                    if (w_go_idle) begin
                        if (w_end_x) r_state <= P_IDLE;
                        else r_state <= P_GEN_FRAGMENT;
                    end
                end
            endcase
        end
    end

    // pixel unit output state
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state_pu <= P_PU_IDLE;
        end else begin
            case (r_state_pu)
                P_PU_IDLE: begin
                    if (w_go_out_pu) r_state_pu <= P_PU_OUT;
                end
                P_PU_OUT: begin
                    if (!i_busy_pu) r_state_pu <= P_PU_WAIT;
                end
                P_PU_WAIT: begin
                    if (w_go_idle_pu) r_state_pu <= P_PU_IDLE;
                end
            endcase
        end
    end

    // texture unit output state
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state_tu <= P_TU_IDLE;
        end else begin
            case (r_state_tu)
                P_TU_IDLE: begin
                    if (w_go_out_tu) r_state_tu <= P_TU_OUT;
                end
                P_TU_OUT: begin
                    if (!i_busy_tu) r_state_tu <= P_TU_WAIT;
                end
                P_TU_WAIT: begin
                    if (w_go_idle_tu) r_state_tu <= P_TU_IDLE;
                end
            endcase
        end
    end

    always @(posedge clk_core) begin
        if (w_finish_setup) begin
            r_y <= i_y;
            r_end_x <= i_end_x;
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_aa_mode <= 1'b0;
        end else begin
            if (w_valid) r_aa_mode <= i_aa_mode;
        end
    end


////////////////////////////
// module instance
////////////////////////////
    fm_3d_ru_span_update span_update (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // parameter input
        .i_start(w_start_update),
        .i_aa_mode(w_aa_mode),
        .i_delta_a(i_delta_a),
        .o_finish(w_finish_update),
        // generated steps
        .i_valid_step(w_valid),
        .i_step_kind(i_kind),
        .i_step_val(i_step_val),
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // current values
        .i_cur_x(w_cur_x),
        .i_cur_z(w_cur_z),
        .i_cur_iw(w_cur_iw),
        .i_cur_param00(w_cur_param00),
        .i_cur_param01(w_cur_param01),
        .i_cur_param02(w_cur_param02),
        .i_cur_param03(w_cur_param03),
        .i_cur_param10(w_cur_param10),
        .i_cur_param11(w_cur_param11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_cur_param12(w_cur_param12),
        .i_cur_param13(w_cur_param13),
`endif
        // new value
        .o_update_valid(w_update_valid),
        .o_update_kind(w_update_kind),
        .o_update_end_flag(w_update_end_flag),
        .o_update_val(w_update_val),
        .o_update_frag(w_update_frag),
        .o_update_x(w_update_x),
        .o_update_z(w_update_z),
        .o_update_color(w_update_color)
    );

    fm_3d_ru_span_reg span_reg (
        .clk_core(clk_core),
        // parameter setup
        .i_initial_valid(w_valid),
        .i_initial_kind(i_kind),
        .i_initial_val(i_initial_val),
        // parameter update
        .i_update_valid(w_update_valid),
        .i_update_kind(w_update_kind),
        .i_update_end_flag(w_update_end_flag),
        .i_update_val(w_update_val),
        .i_update_frag(w_update_frag),
        .i_update_x(w_update_x),
        .i_update_z(w_update_z),
        .i_update_color(w_update_color),
        // control registers
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        .i_param0_kind(i_param0_kind),
        .i_param1_kind(i_param1_kind),
        // current values
        .o_cur_x(w_cur_x),
        .o_cur_z(w_cur_z),
        .o_cur_iw(w_cur_iw),
        .o_cur_param00(w_cur_param00),
        .o_cur_param01(w_cur_param01),
        .o_cur_param02(w_cur_param02),
        .o_cur_param03(w_cur_param03),
        .o_cur_param10(w_cur_param10),
        .o_cur_param11(w_cur_param11),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_cur_param12(w_cur_param12),
        .o_cur_param13(w_cur_param13),
`endif
        // parameter output
        .o_x(o_x),
        .o_z(o_z),
        .o_cr(o_cr),
        .o_cg(o_cg),
        .o_cb(o_cb),
        .o_ca(o_ca),
        .o_tu(o_tu),
        .o_tv(o_tv)
    );


endmodule
