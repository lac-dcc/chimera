// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_update.v
//
// Abstract:
//   generate span edge parameter update,
//   parameter offset for anti-aliasing
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

module fm_3d_ru_span_update (
    clk_core,
    rst_x,
    // parameter input
    i_start,
    i_aa_mode,
    i_delta_a,
    o_finish,
    // generated steps
    i_valid_step,
    i_step_kind,
    i_step_val,
    // control registers
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    // current values
    i_cur_x,
    i_cur_z,
    i_cur_iw,
    i_cur_param00,
    i_cur_param01,
    i_cur_param02,
    i_cur_param03,
    i_cur_param10,
    i_cur_param11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_cur_param12,
    i_cur_param13,
`endif
    // new value
    o_update_valid,
    o_update_kind,
    o_update_end_flag,
    o_update_val,
    o_update_frag,
    o_update_x,
    o_update_z,
    o_update_color
);
////////////////////////////
// parameter
////////////////////////////
    parameter P_UPDATE_IW   = 4'h0;
    parameter P_UPDATE_X    = 4'h1;
    parameter P_UPDATE_Z    = 4'h2;
    parameter P_UPDATE_P00  = 4'h3;
    parameter P_UPDATE_P01  = 4'h4;
    parameter P_UPDATE_P02  = 4'h5;
    parameter P_UPDATE_P03  = 4'h6;
    parameter P_UPDATE_P10  = 4'h7;
    parameter P_UPDATE_P11  = 4'h8;
    parameter P_UPDATE_P12  = 4'h9;
    parameter P_UPDATE_P13  = 4'ha;
    parameter P_UPDATE_WAIT  = 4'hb;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // outline parameter input
    input         i_start;
    output        o_finish;
    input         i_aa_mode;
    input  [21:0] i_delta_a;
    // generated steps
    input         i_valid_step;
    input  [3:0]  i_step_kind;
    input  [21:0] i_step_val;
    // control registers
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    // current values
    input  [20:0] i_cur_x;
    input  [20:0] i_cur_z;
    input  [20:0] i_cur_iw;
    input  [20:0] i_cur_param00;
    input  [20:0] i_cur_param01;
    input  [20:0] i_cur_param02;
    input  [20:0] i_cur_param03;
    input  [20:0] i_cur_param10;
    input  [20:0] i_cur_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_cur_param12;
    input  [20:0] i_cur_param13;
`endif
    // new value
    output        o_update_valid;
    output [3:0]  o_update_kind;
    output        o_update_end_flag;
    output [21:0] o_update_val;
    output [21:0] o_update_frag;
    output [9:0]  o_update_x;
    output [15:0] o_update_z;
    output [7:0]  o_update_color;

////////////////////////////
// reg
////////////////////////////
    reg    [3:0]  r_state;
    reg    [21:0] r_step_z;
    reg    [21:0] r_step_iw;
    reg    [21:0] r_step_param00;
    reg    [21:0] r_step_param01;
    reg    [21:0] r_step_param02;
    reg    [21:0] r_step_param03;
    reg    [21:0] r_step_param10;
    reg    [21:0] r_step_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    reg    [21:0] r_step_param12;
    reg    [21:0] r_step_param13;
`endif
////////////////////////////
// wire
////////////////////////////
    wire          w_valid;
    wire          w_end_flag;
    wire          w_end_flag_z;
    wire          w_end_flag_p00;
    wire          w_end_flag_p01;
    wire          w_end_flag_p02;
    wire          w_end_flag_p03;
    wire          w_end_flag_p10;
    wire          w_end_flag_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire          w_end_flag_p12;
    wire          w_end_flag_p13;
`endif
    wire  [20:0]  w_cur_val;
    wire  [21:0]  w_cur_step;
    wire  [21:0]  w_10;
    wire  [3:0]   w_kind;
////////////////////////////
// assign
////////////////////////////
    assign w_10 = {1'b0, 5'h0f, 16'h8000};
    assign w_valid = (r_state != P_UPDATE_WAIT) &
                     ((r_state != P_UPDATE_IW) |((r_state == P_UPDATE_IW)&i_start));
    assign w_end_flag_z   = (r_state == P_UPDATE_Z) & !i_param0_en & !i_param1_en;
    assign w_end_flag_p00 = (r_state == P_UPDATE_P00) &
                            (i_param0_en & (i_param0_size == 2'd0)) &
                            !i_param1_en;
    assign w_end_flag_p01 = (r_state == P_UPDATE_P01) &
                            (i_param0_size == 2'd1) & !i_param1_en;
    assign w_end_flag_p02 = (r_state == P_UPDATE_P02) &
                            (i_param0_size == 2'd2) & !i_param1_en;
    assign w_end_flag_p03 = (r_state == P_UPDATE_P03) & !i_param1_en;
    assign w_end_flag_p10 = (r_state == P_UPDATE_P10) & (i_param1_size == 2'd0);
    assign w_end_flag_p11 = (r_state == P_UPDATE_P11) & (i_param1_size == 2'd1);
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_end_flag_p12 = (r_state == P_UPDATE_P11) & (i_param1_size == 2'd2);
    assign w_end_flag_p13 = (r_state == P_UPDATE_P11);
`endif

`ifdef VTX_PARAM1_REDUCE
    assign w_end_flag = w_end_flag_z |
                        w_end_flag_p00 | w_end_flag_p01 | w_end_flag_p02 | w_end_flag_p03|
                        w_end_flag_p10 | w_end_flag_p11;
`else
    assign w_end_flag = w_end_flag_z |
                        w_end_flag_p00 | w_end_flag_p01 | w_end_flag_p02 | w_end_flag_p03|
                        w_end_flag_p10 | w_end_flag_p11 | w_end_flag_p12 | w_end_flag_p03;
`endif

`ifdef VTX_PARAM1_REDUCE
    assign w_cur_val =  
                        (r_state == P_UPDATE_IW) ? i_cur_iw :
                        (r_state == P_UPDATE_X)  ? i_cur_x :
                        (r_state == P_UPDATE_Z)  ? i_cur_z :
                        (r_state == P_UPDATE_P00) ? i_cur_param00 :
                        (r_state == P_UPDATE_P01) ? i_cur_param01 :
                        (r_state == P_UPDATE_P02) ? i_cur_param02 :
                        (r_state == P_UPDATE_P03) ? i_cur_param03 :
                        (r_state == P_UPDATE_P10) ? i_cur_param10 :
                                                    i_cur_param11 ;

    assign w_cur_step =
                        (r_state == P_UPDATE_IW) ? r_step_iw :
                        (r_state == P_UPDATE_X)  ? w_10 :
                        (r_state == P_UPDATE_Z)  ? r_step_z :
                        (r_state == P_UPDATE_P00) ? r_step_param00 :
                        (r_state == P_UPDATE_P01) ? r_step_param01 :
                        (r_state == P_UPDATE_P02) ? r_step_param02 :
                        (r_state == P_UPDATE_P03) ? r_step_param03 :
                        (r_state == P_UPDATE_P10) ? r_step_param10 :
                                                    r_step_param11 ;

    assign w_kind =
                    (r_state == P_UPDATE_IW)  ? `FPARAM_IW :
                    (r_state == P_UPDATE_X)   ? `FPARAM_X :
                    (r_state == P_UPDATE_Z)   ? `FPARAM_Z :
                    (r_state == P_UPDATE_P00) ? `FPARAM_P00 :
                    (r_state == P_UPDATE_P01) ? `FPARAM_P01 :
                    (r_state == P_UPDATE_P02) ? `FPARAM_P02 :
                    (r_state == P_UPDATE_P03) ? `FPARAM_P03 :
                    (r_state == P_UPDATE_P10) ? `FPARAM_P10 :
                                                `FPARAM_P11 ;
`else
    assign w_cur_val =  
                        (r_state == P_UPDATE_IW) ? i_cur_iw :
                        (r_state == P_UPDATE_X)  ? i_cur_x :
                        (r_state == P_UPDATE_Z)  ? i_cur_z :
                        (r_state == P_UPDATE_P00) ? i_cur_param00 :
                        (r_state == P_UPDATE_P01) ? i_cur_param01 :
                        (r_state == P_UPDATE_P02) ? i_cur_param02 :
                        (r_state == P_UPDATE_P03) ? i_cur_param03 :
                        (r_state == P_UPDATE_P10) ? i_cur_param10 :
                        (r_state == P_UPDATE_P11) ? i_cur_param11 :
                        (r_state == P_UPDATE_P12) ? i_cur_param12 :
                                                    i_cur_param13;

    assign w_cur_step =
                        (r_state == P_UPDATE_IW) ? r_step_iw :
                        (r_state == P_UPDATE_X)  ? w_10 :
                        (r_state == P_UPDATE_Z)  ? r_step_z :
                        (r_state == P_UPDATE_P00) ? r_step_param00 :
                        (r_state == P_UPDATE_P01) ? r_step_param01 :
                        (r_state == P_UPDATE_P02) ? r_step_param02 :
                        (r_state == P_UPDATE_P03) ? r_step_param03 :
                        (r_state == P_UPDATE_P10) ? r_step_param10 :
                        (r_state == P_UPDATE_P11) ? r_step_param11 :
                        (r_state == P_UPDATE_P12) ? r_step_param12 :
                                                    r_step_param13;

    assign w_kind =
                    (r_state == P_UPDATE_IW)  ? `FPARAM_IW :
                    (r_state == P_UPDATE_X)   ? `FPARAM_X :
                    (r_state == P_UPDATE_Z)   ? `FPARAM_Z :
                    (r_state == P_UPDATE_P00) ? `FPARAM_P00 :
                    (r_state == P_UPDATE_P01) ? `FPARAM_P01 :
                    (r_state == P_UPDATE_P02) ? `FPARAM_P02 :
                    (r_state == P_UPDATE_P03) ? `FPARAM_P03 :
                    (r_state == P_UPDATE_P10) ? `FPARAM_P10 :
                    (r_state == P_UPDATE_P11) ? `FPARAM_P11 :
                    (r_state == P_UPDATE_P12) ? `FPARAM_P12 :
                                                `FPARAM_P13;
`endif
    assign o_finish = o_update_end_flag & (r_state == P_UPDATE_WAIT);
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_UPDATE_IW;
        end else begin
            case (r_state)
                P_UPDATE_IW: begin
                    if (i_start) begin
                        if (i_aa_mode) r_state <= P_UPDATE_Z;
                        else r_state <= P_UPDATE_X;
                    end
                end
                P_UPDATE_X: begin
                    r_state <= P_UPDATE_Z;
                end
                P_UPDATE_Z: begin
                    if (i_param0_en) r_state <= P_UPDATE_P00;
                    else if (i_param1_en) r_state <= P_UPDATE_P10;
                    else r_state <= P_UPDATE_WAIT;
                end
                P_UPDATE_P00: begin
                    if (i_param0_size == 2'd0) begin
                        if (i_param1_en) r_state <= P_UPDATE_P10;
                        else  r_state <= P_UPDATE_WAIT;
                    end else begin
                        r_state <= P_UPDATE_P01;
                    end
                end
                P_UPDATE_P01: begin
                    if (i_param0_size == 2'd1) begin
                        if (i_param1_en) r_state <= P_UPDATE_P10;
                        else  r_state <= P_UPDATE_WAIT;
                    end else begin
                        r_state <= P_UPDATE_P02;
                    end
                end
                P_UPDATE_P02: begin
                    if (i_param0_size == 2'd2) begin
                        if (i_param1_en) r_state <= P_UPDATE_P10;
                        else  r_state <= P_UPDATE_WAIT;
                    end else begin
                        r_state <= P_UPDATE_P03;
                    end
                end
                P_UPDATE_P03: begin
                   if (i_param1_en) r_state <= P_UPDATE_P10;
                   else  r_state <= P_UPDATE_WAIT;
                end
                P_UPDATE_P10: begin
                    if (i_param1_size == 2'd0) begin
                        r_state <= P_UPDATE_WAIT;
                    end else begin
                        r_state <= P_UPDATE_P11;
                    end
                end
                P_UPDATE_P11: begin
                    if (i_param1_size == 2'd1) begin
                        r_state <= P_UPDATE_WAIT;
                    end else begin
                        r_state <= P_UPDATE_P12;
                    end
                end
                P_UPDATE_P12: begin
                    if (i_param1_size == 2'd2) begin
                        r_state <= P_UPDATE_WAIT;
                    end else begin
                        r_state <= P_UPDATE_P13;
                    end
                end
                P_UPDATE_P13: begin
                    r_state <= P_UPDATE_WAIT;
                end
                P_UPDATE_WAIT: begin
                    if (o_update_end_flag) r_state <= P_UPDATE_IW;
                end
            endcase
        end
    end

    always @(posedge clk_core) begin
        if (i_valid_step) begin
            if (i_step_kind == `FPARAM_Z) r_step_z <= i_step_val;
            if (i_step_kind == `FPARAM_IW) r_step_iw <= i_step_val;
            if (i_step_kind == `FPARAM_P00) r_step_param00 <= i_step_val;
            if (i_step_kind == `FPARAM_P01) r_step_param01 <= i_step_val;
            if (i_step_kind == `FPARAM_P02) r_step_param02 <= i_step_val;
            if (i_step_kind == `FPARAM_P03) r_step_param03 <= i_step_val;
            if (i_step_kind == `FPARAM_P10) r_step_param10 <= i_step_val;
            if (i_step_kind == `FPARAM_P11) r_step_param11 <= i_step_val;
`ifdef VTX_PARAM1_REDUCE
`else
            if (i_step_kind == `FPARAM_P12) r_step_param12 <= i_step_val;
            if (i_step_kind == `FPARAM_P13) r_step_param13 <= i_step_val;
`endif
        end
    end


////////////////////////////
// module instance
////////////////////////////
    fm_3d_ru_span_update_core span_update_core (
        .clk_core(clk_core),
        .rst_x(rst_x),
        .i_en(1'b1),
        .i_valid(w_valid),
        .i_kind(w_kind),
        .i_end_flag(w_end_flag),
        .i_cur_p({1'b0,w_cur_val}),
        .i_step_p(w_cur_step),
        .i_delta_a(i_delta_a),
        .i_aa_mode(i_aa_mode),
        .o_valid(o_update_valid),
        .o_kind(o_update_kind),
        .o_end_flag(o_update_end_flag),
        .o_cur_p(o_update_val),
        .o_frag_p(o_update_frag),
        .o_x(o_update_x),
        .o_z(o_update_z),
        .o_color(o_update_color)
    );

endmodule
