// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_update.v
//
// Abstract:
//   generate outline edge parameter update,
//   parameter offset for anti-aliasing
//  Created:
//    16 December 2008
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

module fm_3d_ru_outline_update (
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
    i_initial_val,
    // control registers
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    // new value
    o_new_valid,
    o_new_kind,
    o_new_edge_val
);
////////////////////////////
// parameter
////////////////////////////
    parameter P_UPDATE_Y    = 4'h0;
    parameter P_UPDATE_X    = 4'h1;
    parameter P_UPDATE_IW   = 4'h2;
    parameter P_UPDATE_Z    = 4'h3;
    parameter P_UPDATE_P00  = 4'h4;
    parameter P_UPDATE_P01  = 4'h5;
    parameter P_UPDATE_P02  = 4'h6;
    parameter P_UPDATE_P03  = 4'h7;
    parameter P_UPDATE_P10  = 4'h8;
    parameter P_UPDATE_P11  = 4'h9;
    parameter P_UPDATE_P12  = 4'ha;
    parameter P_UPDATE_P13  = 4'hb;
    parameter P_UPDATE_WAIT  = 4'hc;

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
    input  [21:0] i_initial_val;
    // control registers
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    // new value
    output        o_new_valid;
    output [3:0]  o_new_kind;
    output [21:0] o_new_edge_val;

////////////////////////////
// reg
////////////////////////////
    reg    [3:0]  r_state;
    reg    [3:0]  r_kind_1z;
    reg           r_valid_1z;
    reg           r_end_flag_1z;
////////////////////////////
// wire
////////////////////////////
    wire          w_valid;
    wire          w_valid_normal;
    wire          w_valid_aa;
    wire          w_end_flag;
    wire          w_end_flag_z;
    wire          w_end_flag_p00;
    wire          w_end_flag_p01;
    wire          w_end_flag_p02;
    wire          w_end_flag_p03;
    wire          w_end_flag_p10;
    wire          w_end_flag_p11;
    wire          w_end_flag_p12;
    wire          w_end_flag_p13;
    wire  [21:0]  w_cur_val;
    wire  [20:0]  w_initial_val;
    wire  [21:0]  w_cur_step;
    wire  [21:0]  w_10;
    wire  [3:0]   w_kind;

    wire  [21:0]  w_new_val;

    wire          w_ram_we;
    wire  [3:0]   w_ram_in_adrs;
    wire  [3:0]   w_ram_out_adrs;
    wire  [64:0]  w_ram_in;
    wire  [64:0]  w_ram_out;
    wire  [21:0]  w_cur_val_ri;
    wire  [20:0]  w_initial_val_ri;
    wire  [21:0]  w_cur_step_ri;
    wire  [20:0]  w_initial_val_out;
    wire  [21:0]  w_step_val_out;
////////////////////////////
// assign
////////////////////////////
    assign w_10 = {1'b0, 5'h0f, 16'h8000};
    assign w_valid_normal = (r_state != P_UPDATE_WAIT)&
                     ((r_state != P_UPDATE_Y) | ((r_state == P_UPDATE_Y)&i_start));
    assign w_valid_aa = (r_state != P_UPDATE_WAIT)& (r_state != P_UPDATE_Y);
    assign w_valid = (i_aa_mode) ? w_valid_aa : w_valid_normal; 


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
    assign w_end_flag_p12 = (r_state == P_UPDATE_P11) & (i_param1_size == 2'd2);
    assign w_end_flag_p13 = (r_state == P_UPDATE_P11);

    assign w_end_flag = w_end_flag_z |
                        w_end_flag_p00 | w_end_flag_p01 | w_end_flag_p02 | w_end_flag_p03|
                        w_end_flag_p10 | w_end_flag_p11 | w_end_flag_p12 | w_end_flag_p03;


    assign w_kind = (r_state == P_UPDATE_Y)   ? `FPARAM_Y :
                    (r_state == P_UPDATE_X)   ? `FPARAM_X :
                    (r_state == P_UPDATE_IW)  ? `FPARAM_IW :
                    (r_state == P_UPDATE_Z)   ? `FPARAM_Z :
                    (r_state == P_UPDATE_P00) ? `FPARAM_P00 :
                    (r_state == P_UPDATE_P01) ? `FPARAM_P01 :
                    (r_state == P_UPDATE_P02) ? `FPARAM_P02 :
                    (r_state == P_UPDATE_P03) ? `FPARAM_P03 :
                    (r_state == P_UPDATE_P10) ? `FPARAM_P10 :
                    (r_state == P_UPDATE_P11) ? `FPARAM_P11 :
                    (r_state == P_UPDATE_P12) ? `FPARAM_P12 :
                                                `FPARAM_P13;


    assign w_ram_in_adrs = (i_valid_step) ? i_step_kind : o_new_kind;
    assign w_ram_we =      o_new_valid | i_valid_step;

    assign w_cur_val_ri = (i_valid_step) ? 22'h0 : w_new_val;
    assign w_initial_val_ri = (i_valid_step) ? i_initial_val : w_initial_val_out;
    assign w_cur_step_ri = (i_valid_step) ? i_step_val : w_step_val_out;

    assign w_ram_in = {w_initial_val_ri, w_cur_val_ri, w_cur_step_ri};
    assign w_ram_out_adrs = w_kind;
    assign {w_initial_val,w_cur_val,w_cur_step} = w_ram_out;
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_UPDATE_Y;
        end else begin
            case (r_state)
                P_UPDATE_Y: begin
                    if (i_start) r_state <= P_UPDATE_X;
                end
                P_UPDATE_X: begin
                    r_state <= P_UPDATE_IW;
                end
                P_UPDATE_IW: begin
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
                    if (o_finish) r_state <= P_UPDATE_Y;
                end
            endcase
        end
    end


    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_valid_1z <= 1'b0;
            r_kind_1z <= 4'h0;
            r_end_flag_1z <= 1'b0;
        end else begin
            r_valid_1z <= w_valid;
            r_kind_1z <= w_kind;
            r_end_flag_1z <= w_end_flag;
        end
    end
////////////////////////////
// module instance
////////////////////////////
    fm_3d_ru_outline_update_core outline_update_core (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_valid(r_valid_1z),
        .i_kind(r_kind_1z),
        .i_end_flag(r_end_flag_1z),
        .i_cur_p(w_cur_val),
        .i_initial_p(w_initial_val),
        .i_step_p(w_cur_step),
        .i_delta_a(i_delta_a),
        .i_aa_mode(i_aa_mode),
        .o_valid(o_new_valid),
        .o_end_flag(o_finish),
        .o_kind(o_new_kind),
        .o_initial_p(w_initial_val_out),
        .o_step_p(w_step_val_out),
        .o_cur_p(w_new_val),
        .o_cur_edge_p(o_new_edge_val)
    );


`ifdef USE_OUTLINE_RRAM
    fm_cmn_bram_01 #(65,4) param_bram (
`else
    fm_cmn_dram_01 #(65,4,12) param_dram (
`endif
        .clk(clk_core),
        .we(w_ram_we),
        .a(w_ram_in_adrs),
        .dpra(w_ram_out_adrs),
        .di(w_ram_in),
        .spo(),
        .dpo(w_ram_out)
    );


endmodule
