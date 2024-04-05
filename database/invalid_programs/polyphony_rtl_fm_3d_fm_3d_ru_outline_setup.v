//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_setup.v
//
// Abstract:
//   generate start, end x/y and delta values
//   v0: top, v1: middle, v2:bottom
//  Created:
//    29 August 2008
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
//  Revision History
// 2008/10/16 if y -1 < 0(start_y == 0), end_y is clamped to 0
// 2008/12/17 delta calculation for anti-antialiasing is added
// 2008/12/18 start_x + 0.5 is added
// 2008/12/27 if (end_y - start_y) == 1, canceled
//            if (end_y - start_y) == 2 and not has second tri, canceled
// 2009/01/22 Anti-aliasing mode support

`include "fm_3d_def.v"


module fm_3d_ru_outline_setup (
    clk_core,
    rst_x,
    // control registers
    i_aa_en,
    // triangle data
    i_valid,
    o_ack,
    i_vtx0_x,
    i_vtx0_y,
    i_vtx1_x,
    i_vtx1_y,
    i_vtx2_x,
    i_vtx2_y,
    // parameter out
    o_valid,
    o_is_first,
    o_is_second,
    o_aa_mode,
    // idle state indicator
    o_idle,
    //   edge0
    o_start_x_e0,
    o_start_x_05_e0,
    o_start_y_e0,
    o_end_y_e0,
    o_delta_e0,
    o_delta_t_e0,
    o_delta_a_e0,
    //   edge1
    o_start_x_e1,
    o_start_x_05_e1,
    o_start_y_e1,
    o_end_y_e1,
    o_delta_e1,
    o_delta_t_e1,
    o_delta_a_e1,
    //   edge2
    o_start_x_e2,
    o_start_x_05_e2,
    o_start_y_e2,
    o_end_y_e2,
    o_delta_e2,
    o_delta_t_e2,
    o_delta_a_e2,
    i_ack
);

////////////////////////////
// parameter
////////////////////////////
    parameter P_IDLE  = 3'd0;
    parameter P_EDGE0 = 3'd1;
    parameter P_EDGE1 = 3'd2;
    parameter P_EDGE2 = 3'd3;
    parameter P_PROC  = 3'd4;
    parameter P_PROC_AA  = 3'd5;
    parameter P_ACK   = 3'd6;

    // sub state
    parameter P_SUB0 = 4'd0;
    parameter P_SUB1 = 4'd1;
    parameter P_SUB2 = 4'd2;
    parameter P_SUB3 = 4'd3;
    parameter P_SUB4 = 4'd4;
    parameter P_SUB5 = 4'd5;
    parameter P_SUB6 = 4'd6;
    parameter P_SUB7 = 4'd7;
    parameter P_SUB8 = 4'd8;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // control registers
    input         i_aa_en;
    // triangle data
    input         i_valid;
    output        o_ack;
    input  [20:0] i_vtx0_x;  // x,y = positice in viewport
    input  [20:0] i_vtx0_y;
    input  [20:0] i_vtx1_x;
    input  [20:0] i_vtx1_y;
    input  [20:0] i_vtx2_x;
    input  [20:0] i_vtx2_y;
    // parameter out
    output        o_is_first;
    output        o_is_second;
    output        o_valid;
    output        o_aa_mode;
    // idle state indicator
    output        o_idle;
    //   edge0
    output [20:0] o_start_x_e0;
    output [20:0] o_start_x_05_e0;
    output [20:0] o_start_y_e0;
    output [20:0] o_end_y_e0;
    output [21:0] o_delta_e0;
    output [21:0] o_delta_t_e0;
    output [21:0] o_delta_a_e0;
    //   edge1
    output [20:0] o_start_x_e1;
    output [20:0] o_start_x_05_e1;
    output [20:0] o_start_y_e1;
    output [20:0] o_end_y_e1;
    output [21:0] o_delta_e1;
    output [21:0] o_delta_t_e1;
    output [21:0] o_delta_a_e1;
    //   edge2
    output [20:0] o_start_x_e2;
    output [20:0] o_start_x_05_e2;
    output [20:0] o_start_y_e2;
    output [20:0] o_end_y_e2;
    output [21:0] o_delta_e2;
    output [21:0] o_delta_t_e2;
    output [21:0] o_delta_a_e2;

    input         i_ack;
////////////////////////////
// reg
////////////////////////////
    reg    [2:0]  r_state;
    reg    [3:0]  r_sub_state;
    reg    [20:0] r_delta_y;
    reg    [21:0] r_delta_e0;
    reg    [21:0] r_delta_e1;
    reg    [21:0] r_delta_e2;
    reg    [21:0] r_delta_t_e0;
    reg    [21:0] r_delta_t_e1;
    reg    [21:0] r_delta_t_e2;
    reg    [20:0] r_end_y_e0;
    reg    [20:0] r_end_y_e1;
    reg    [20:0] r_end_y_e2;
    reg           r_is_delta_y_zero_e0;
    reg           r_is_delta_y_zero_e1;
    reg           r_is_delta_y_zero_e2;
    reg    [20:0] r_start_x_05_vtx1;
    reg    [20:0] r_start_x_05_vtx2;
////////////////////////////
// wire
////////////////////////////
    wire   [21:0] w_adder_in_a;
    wire   [21:0] w_adder_in_b;
    wire   [21:0] w_adder_out;
    wire   [20:0] w_adder_out_clamped;
    wire   [21:0] w_recip_out;
    wire   [21:0] w_mul_out;

    wire          w_set_delta_y;
    wire          w_set_delta_e0;
    wire          w_set_delta_e1;
    wire          w_set_delta_e2;
    wire          w_set_delta_t_e0;
    wire          w_set_delta_t_e1;
    wire          w_set_delta_t_e2;
    wire          w_set_end_y_e0;
    wire          w_set_end_y_e1;
    wire          w_set_end_y_e2;

    wire          w_sub_start;

    wire  [21:0]  w_in_a_e0;
    wire  [21:0]  w_in_b_e0;
    wire  [21:0]  w_in_a_e1;
    wire  [21:0]  w_in_b_e1;
    wire  [21:0]  w_in_a_e2;
    wire  [21:0]  w_in_b_e2;
    wire  [21:0]  w_10;
    wire  [21:0]  w_05;
    wire  [21:0]  w_00;
    wire          w_is_zero;
    wire          w_set_dy_zero_e0;
    wire          w_set_dy_zero_e1;
    wire          w_set_dy_zero_e2;
    wire          w_set_x_05_vtx1;
    wire          w_set_x_05_vtx2;
    wire          w_adsb;
    wire          w_cancel;
    wire          w_y_one_line;
    wire          w_y_two_line;
    wire          w_only_aa;
////////////////////////////
// assign
////////////////////////////
    assign w_10 = 22'hf8000;
    assign w_05 = 22'he8000;
    assign w_00 = 22'h00000;
    assign o_is_first = (i_vtx2_y != i_vtx1_y);  // bottom != middle
    assign o_is_second = (i_vtx1_y != i_vtx0_y);  // midle != top

    assign w_is_zero = (w_adder_out == w_00);  // compare delta_y and zero
    assign w_in_a_e0 = (r_sub_state == P_SUB0) ? {1'b0,i_vtx0_y} :
                       (r_sub_state == P_SUB2) ? {1'b0,i_vtx0_x} :
                                                 {1'b0,i_vtx0_y};
    assign w_in_b_e0 = (r_sub_state == P_SUB0) ? {1'b0,i_vtx2_y} :
                       (r_sub_state == P_SUB2) ? {1'b0,i_vtx2_x} :
                                                  w_10;
    assign w_in_a_e1 = (r_sub_state == P_SUB0) ? {1'b0,i_vtx1_y} :
                       (r_sub_state == P_SUB2) ? {1'b0,i_vtx1_x} :
                       (r_sub_state == P_SUB3) ? w_05 :
                                                 {1'b0,i_vtx1_y};
    assign w_in_b_e1 = (r_sub_state == P_SUB0) ? {1'b0,i_vtx2_y} :
                       (r_sub_state == P_SUB2) ? {1'b0,i_vtx2_x} :
                       (r_sub_state == P_SUB3) ? {1'b0,i_vtx2_x} :
                                                 w_10;
    assign w_in_a_e2 = (r_sub_state == P_SUB0) ? {1'b0,i_vtx0_y} :
                       (r_sub_state == P_SUB2) ? {1'b0,i_vtx0_x} :
                       (r_sub_state == P_SUB3) ? w_05 :
                                                 {1'b0,i_vtx0_y};
    assign w_in_b_e2 = (r_sub_state == P_SUB0) ? {1'b0,i_vtx1_y} :
                       (r_sub_state == P_SUB2) ? {1'b0,i_vtx1_x} :
                       (r_sub_state == P_SUB3) ? {1'b0,i_vtx1_x} :
                                                 w_10;

    assign w_adder_in_a = (r_state == P_EDGE0) ? w_in_a_e0 :   // top - bottom
                          (r_state == P_EDGE1) ? w_in_a_e1 :   // middle - bottom
                                                 w_in_a_e2 ;   // top- middle
    assign w_adder_in_b = (r_state == P_EDGE0) ? w_in_b_e0 :   // top - bottom
                          (r_state == P_EDGE1) ? w_in_b_e1 :   // middle - bottom
                                                 w_in_b_e2 ;   // top- middle
    assign w_set_delta_y =  (r_state == P_EDGE0) & (r_sub_state == P_SUB3);
    assign w_set_delta_t_e0 = (r_state == P_EDGE0) & (r_sub_state == P_SUB5);
    assign w_set_delta_t_e1 = (r_state == P_EDGE1) & (r_sub_state == P_SUB5);
    assign w_set_delta_t_e2 = (r_state == P_EDGE2) & (r_sub_state == P_SUB5);
    assign w_set_delta_e0 = (r_state == P_EDGE0) & (r_sub_state == P_SUB8);
    assign w_set_delta_e1 = (r_state == P_EDGE1) & (r_sub_state == P_SUB8);
    assign w_set_delta_e2 = (r_state == P_EDGE2) & (r_sub_state == P_SUB8);
    assign w_set_end_y_e0 = (r_state == P_EDGE0) & (r_sub_state == P_SUB4);
    assign w_set_end_y_e1 = (r_state == P_EDGE1) & (r_sub_state == P_SUB4);
    assign w_set_end_y_e2 = (r_state == P_EDGE2) & (r_sub_state == P_SUB4);
    assign w_set_dy_zero_e0 = (r_state == P_EDGE0) & (r_sub_state == P_SUB3);
    assign w_set_dy_zero_e1 = (r_state == P_EDGE1) & (r_sub_state == P_SUB3);
    assign w_set_dy_zero_e2 = (r_state == P_EDGE2) & (r_sub_state == P_SUB3);

    assign w_set_x_05_vtx2 =  (r_state == P_EDGE1) & (r_sub_state == P_SUB6);
    assign w_set_x_05_vtx1 =  (r_state == P_EDGE2) & (r_sub_state == P_SUB6);

    assign w_sub_start = (r_state == P_EDGE0) | 
                         (r_state == P_EDGE1) |
                         (r_state == P_EDGE2) ;
    assign w_adder_out_clamped = w_adder_out[21] ? 21'h0: w_adder_out[20:0];
    assign w_adsb = !(r_sub_state == P_SUB3);

    assign w_y_one_line = (r_delta_y == w_00[20:0]);
    assign w_y_two_line = (r_delta_y == w_10[20:0]);
    assign w_cancel = w_y_one_line | (w_y_two_line & o_is_first & !i_aa_en);
    assign w_only_aa = (w_y_two_line & o_is_first & i_aa_en);
    // output port
    assign o_ack = (r_state == P_ACK) | 
                   ((r_state == P_EDGE0)&w_set_delta_e0&w_cancel);
    assign o_delta_e0 = r_delta_e0;
    assign o_delta_e1 = r_delta_e1;
    assign o_delta_e2 = r_delta_e2;
    assign o_delta_t_e0 = r_delta_t_e0;
    assign o_delta_t_e1 = r_delta_t_e1;
    assign o_delta_t_e2 = r_delta_t_e2;

    assign o_start_x_e0 = i_vtx2_x;
    assign o_start_x_05_e0 = r_start_x_05_vtx2;
    assign o_start_y_e0 = i_vtx2_y;
    assign o_end_y_e0 = r_end_y_e0;

    assign o_start_x_e1 = i_vtx2_x;
    assign o_start_x_05_e1 = r_start_x_05_vtx2;
    assign o_start_y_e1 = i_vtx2_y;
    assign o_end_y_e1 = r_end_y_e1;

    assign o_start_x_e2 = i_vtx1_x;
    assign o_start_x_05_e2 = r_start_x_05_vtx1;
    assign o_start_y_e2 = i_vtx1_y;
    assign o_end_y_e2 = r_end_y_e2;

    assign o_delta_a_e0 = (r_is_delta_y_zero_e0) ? w_00 : w_05;
    assign o_delta_a_e1 = (r_is_delta_y_zero_e1) ? w_00 : w_05;
    assign o_delta_a_e2 = (r_is_delta_y_zero_e2) ? w_00 : w_05;

    assign o_valid = (r_state == P_PROC) | (r_state == P_PROC_AA);
    assign o_aa_mode = (r_state == P_PROC_AA);
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
                    if (i_valid) r_state <= P_EDGE0;
                end
                P_EDGE0: begin
                    if (w_set_delta_e0) begin
                        if (w_cancel) r_state <= P_IDLE;
                        else r_state <= P_EDGE1;
                    end
                end
                P_EDGE1: begin
                    if (w_set_delta_e1) r_state <= P_EDGE2;
                end
                P_EDGE2: begin
                    if (w_set_delta_e2) begin
                     if (w_only_aa) r_state <= P_PROC_AA;
                     else r_state <= P_PROC;
                    end
                end
                P_PROC: begin
                    if (i_ack) begin
                        if (i_aa_en) r_state <= P_PROC_AA;
                        else r_state <= P_ACK;
                    end
                end
                P_PROC_AA: begin
                    if (i_ack) r_state <= P_ACK;
                end
                P_ACK: begin
                    r_state <= P_IDLE;
                end
            endcase
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_sub_state <= P_SUB0;
        end else begin
            case (r_sub_state)
                P_SUB0: if (w_sub_start) r_sub_state <= P_SUB1;
                P_SUB1: r_sub_state <= P_SUB2;
                P_SUB2: r_sub_state <= P_SUB3;
                P_SUB3: r_sub_state <= P_SUB4;
                P_SUB4: r_sub_state <= P_SUB5;
                P_SUB5: r_sub_state <= P_SUB6;
                P_SUB6: r_sub_state <= P_SUB7;
                P_SUB7: r_sub_state <= P_SUB8;
                P_SUB8: r_sub_state <= P_SUB0;
            endcase
        end
    end


    always @(posedge clk_core) begin
        if (w_set_delta_e0) r_delta_e0 <= w_mul_out;
        if (w_set_delta_e1) r_delta_e1 <= w_mul_out;
        if (w_set_delta_e2) r_delta_e2 <= w_mul_out;
        if (w_set_delta_t_e0) r_delta_t_e0 <= w_recip_out;
        if (w_set_delta_t_e1) r_delta_t_e1 <= w_recip_out;
        if (w_set_delta_t_e2) r_delta_t_e2 <= w_recip_out;
        if (w_set_end_y_e0) r_end_y_e0 <= w_adder_out_clamped[20:0];
        if (w_set_end_y_e1) r_end_y_e1 <= w_adder_out_clamped[20:0];
        if (w_set_end_y_e2) r_end_y_e2 <= w_adder_out_clamped[20:0];
        if (w_set_dy_zero_e0) r_is_delta_y_zero_e0 <= w_is_zero;
        if (w_set_dy_zero_e1) r_is_delta_y_zero_e1 <= w_is_zero;
        if (w_set_dy_zero_e2) r_is_delta_y_zero_e2 <= w_is_zero;
        if (w_set_x_05_vtx1) r_start_x_05_vtx1 <= w_adder_out[20:0];
        if (w_set_x_05_vtx2) r_start_x_05_vtx2 <= w_adder_out[20:0];
        if (w_set_delta_y) r_delta_y <= w_adder_out[20:0];
    end

////////////////////////////
// module instance
////////////////////////////
    //    adder in:   out:    recip in:      out        mul in:              result
    // 0.       ey-sy
    // 1.       ey-1.0
    // 2.       ex-sx
    // 3.       ex+0.5 delta_y delta_y                                      ey-sy
    // 4.       ey-2.0 ey-1.0                                               ey-1.0
    // 5.              delta_x              1/delta_y delta_x*delta_t       delta_t(1/delta_y)
    // 6.              ex+0.5
    // 7.              ey-2.0                                                
    // 8.                                                                   delta


    // fadd, latency = 3
    fm_3d_fadd fadd (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_a(w_adder_in_a),
        .i_b(w_adder_in_b),
        .i_adsb(w_adsb),
        .o_c(w_adder_out)
    );
    // frcp, latency = 2
    fm_3d_frcp frcp (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_a(w_adder_out),
        .o_c(w_recip_out)
    );
    // fmul, latency = 3
    fm_3d_fmul fmul (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_a(w_adder_out),
        .i_b(w_recip_out),
        .o_c(w_mul_out)
    );
endmodule
