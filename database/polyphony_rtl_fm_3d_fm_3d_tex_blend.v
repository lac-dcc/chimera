// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_tex_blend.v
//
// Abstract:
//   texture blender, only supports multiply operation
//
//  Created:
//    16 January 2009
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

module fm_3d_tex_blend (
    clk_core,
    rst_x,
    // ru interface
    i_valid_ru,
    i_aa_mode,
    i_x,
    i_y,
    i_z,
    i_cr,
    i_cg,
    i_cb,
    i_ca,
    o_busy_ru,
    // texture unit
    i_valid_tu,
    i_tr,
    i_tg,
    i_tb,
    i_ta,
    o_busy_tu,
    // configurations
    i_tex_enable,
    i_tex_blend_enable,
    // blend out
    o_valid,
    o_aa_mode,
    o_x,
    o_y,
    o_z,
    o_br,
    o_bg,
    o_bb,
    o_ba,
    i_busy
);

////////////////////////////
// Parameter definition
////////////////////////////
    // main state
    parameter P_IDLE     = 2'd0;
    parameter P_WAIT_TEX = 2'd1;
    parameter P_BLEND    = 2'd2;
    parameter P_OUT      = 2'd3;
    // sub state
    parameter P_CR     = 2'd0;
    parameter P_CG     = 2'd1;
    parameter P_CB     = 2'd2;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // ru interface
    input         i_valid_ru;
    input         i_aa_mode;
    input  [9:0]  i_x;
    input  [8:0]  i_y;
    input  [15:0] i_z;
    input  [7:0]  i_cr;
    input  [7:0]  i_cg;
    input  [7:0]  i_cb;
    input  [7:0]  i_ca;
    output        o_busy_ru;
    // texture unit
    input         i_valid_tu;
    input  [7:0]  i_tr;
    input  [7:0]  i_tg;
    input  [7:0]  i_tb;
    input  [7:0]  i_ta;
    output        o_busy_tu;
    // configurations
    input         i_tex_enable;
    input         i_tex_blend_enable;
    // blend out
    output        o_valid;
    output        o_aa_mode;
    output [9:0]  o_x;
    output [8:0]  o_y;
    output [15:0] o_z;
    output [7:0]  o_br;
    output [7:0]  o_bg;
    output [7:0]  o_bb;
    output [7:0]  o_ba;
    input         i_busy;
////////////////////////////
// reg
////////////////////////////
    reg    [1:0]  r_state;
    reg    [1:0]  r_sub_state;
    reg    [7:0]  r_cr;
    reg    [7:0]  r_cg;
    reg    [7:0]  r_cb;
    reg    [7:0]  r_ca;
    reg    [7:0]  r_tr;
    reg    [7:0]  r_tg;
    reg    [7:0]  r_tb;
    reg    [7:0]  r_br;
    reg    [7:0]  r_bg;
    reg    [7:0]  r_bb;
    reg           r_aa_mode;
    reg    [9:0]  r_x;
    reg    [8:0]  r_y;
    reg    [15:0] r_z;
////////////////////////////
// wire
////////////////////////////
    wire          w_out_c;
    wire          w_out_t;

    wire          w_set_ru;
    wire          w_set_tu;
    wire          w_set_br;
    wire          w_set_bg;
    wire          w_set_bb;

    wire   [7:0]  w_a;
    wire   [7:0]  w_b;
    wire   [7:0]  w_c;


    wire          w_sub_start;
    wire          w_finish;
    wire   [1:0]  w_valid;
////////////////////////////
// assign
////////////////////////////
    assign w_valid = {i_valid_tu, i_valid_ru};
    assign o_busy_ru = (r_state != P_IDLE);
    assign o_busy_tu = !((r_state == P_IDLE) | (r_state == P_WAIT_TEX));
    assign w_out_c = (!i_tex_enable & !i_tex_blend_enable);
    assign w_out_t = (i_tex_enable & !i_tex_blend_enable);

    assign o_valid = (r_state == P_OUT);

    assign  w_a = (r_sub_state == P_CG) ? r_cg:
                  (r_sub_state == P_CB) ? r_cb:
                                          r_cr;

    assign  w_b = (r_sub_state == P_CG) ? r_tg:
                  (r_sub_state == P_CB) ? r_tb:
                                          r_tr;

    assign w_set_ru = i_valid_ru & (r_state == P_IDLE);
    assign w_set_tu = i_valid_tu & ((r_state == P_IDLE) | (r_state == P_WAIT_TEX));

    assign w_set_br = (r_state == P_BLEND) & (r_sub_state == P_CR);
    assign w_set_bg = (r_state == P_BLEND) & (r_sub_state == P_CG);
    assign w_set_bb = (r_state == P_BLEND) & (r_sub_state == P_CB);

    assign w_finish = w_set_bb;

    assign o_br = (w_out_c) ? r_cr :
                  (w_out_t) ? r_tr :
                              r_br;
    assign o_bg = (w_out_c) ? r_cg :
                  (w_out_t) ? r_tg :
                              r_bg;
    assign o_bb = (w_out_c) ? r_cb :
                  (w_out_t) ? r_tb :
                              r_bb;
    assign o_ba = r_ca;
    assign o_aa_mode = r_aa_mode;
    assign o_x = r_x;
    assign o_y = r_y;
    assign o_z = r_z;
    assign w_sub_start = ((r_state == P_BLEND) & (r_sub_state == P_CR));
////////////////////////////
// always
////////////////////////////
    // main sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE:begin
                    case (w_valid)
                        2'b01: begin // ru valid
                            if (w_out_c) r_state <= P_OUT;
                            else r_state <= P_WAIT_TEX;
                        end
                        2'b11: begin // ru & tu valid
                            if (w_out_t) r_state <= P_OUT;
                            else r_state <= P_BLEND;
                        end
                    endcase
                end
                P_WAIT_TEX:begin
                    if (i_valid_tu) begin
                        if (w_out_t) r_state <= P_OUT;
                        else r_state <= P_BLEND;
                    end
                end
                P_BLEND:begin
                    if (w_finish) begin
                        r_state <= P_OUT;
                    end
                end
                P_OUT:begin
                    if (!i_busy) r_state <= P_IDLE;
                end
            endcase
        end
    end

    // sub sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_sub_state <= P_CR;
        end else begin
            case (r_sub_state)
                P_CR:begin
                    if (w_sub_start) r_sub_state <= P_CG;
                end
                P_CG:begin
                    r_sub_state <= P_CB;
                end
                P_CB:begin
                    r_sub_state <= P_CR;
                end             
            endcase
        end
    end

    always @(posedge clk_core) begin
        if (w_set_ru) begin
            r_cr <= i_cr;
            r_cg <= i_cg;
            r_cb <= i_cb;
            r_ca <= i_ca;
            r_aa_mode <= i_aa_mode;
            r_x <= i_x;
            r_y <= i_y;
            r_z <= i_z;
        end
    end

    always @(posedge clk_core) begin
        if (w_set_tu) begin
            r_tr <= i_tr;
            r_tg <= i_tg;
            r_tb <= i_tb;
        end
    end

    always @(posedge clk_core) begin
        if (w_set_br) r_br <= w_c;
        if (w_set_bg) r_bg <= w_c;
        if (w_set_bb) r_bb <= w_c;
    end

////////////////////////////
// module instance
////////////////////////////
    fm_3d_imul8 imul8 (
        .i_a(w_a),
        .i_b(w_b),
        .o_c(w_c)
    );

endmodule
