//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_delta.v
//
// Abstract:
//   span setup module
//     calculate delta_x = x_r - x_l,  delta_t = 1/ delta_x,
//     o_delta_a = (delta_x == 0) ? 0 : 0.5;
//  Created:
//    19 December 2008
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

module fm_3d_ru_span_delta (
    clk_core,
    rst_x,
    // span parameters
    i_start,
    o_finish,
    i_x_l,
    i_x_r,
    // generated parameters
    o_delta_t,
    o_delta_a
);
////////////////////////////
// parameter
////////////////////////////
    parameter P_SETUP0   = 3'h0;
    parameter P_SETUP1   = 3'h1;
    parameter P_SETUP2   = 3'h2;
    parameter P_SETUP3   = 3'h3;
    parameter P_SETUP4   = 3'h4;
    parameter P_SETUP5   = 3'h5;
    parameter P_SETUP6   = 3'h6;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // span parameters
    input         i_start;
    output        o_finish;
    input  [20:0] i_x_l;
    input  [20:0] i_x_r;
    // generated parameters
    output [21:0] o_delta_t;
    output [21:0] o_delta_a;

////////////////////////////
// reg
////////////////////////////
    reg    [2:0]  r_state;
    reg    [21:0] r_delta_t;
    reg           r_is_delta_x_zero;
////////////////////////////
// wire
////////////////////////////
    wire  [21:0]  w_adder_out;
    wire  [21:0]  w_recip_out;

    wire          w_set_delta_t;
    wire          w_set_dx_zero;
    wire  [21:0]  w_05;
    wire  [21:0]  w_00;
    wire          w_is_zero;
////////////////////////////
// assign
////////////////////////////
    assign w_05 = 22'he8000;
    assign w_00 = 22'h00000;
    assign w_set_dx_zero = (r_state == P_SETUP3);
    assign w_is_zero = (w_adder_out == w_00);  // compare delta_x and zero
    assign w_set_delta_t = (r_state == P_SETUP5);
    // port connection
    assign o_delta_t = r_delta_t;
    assign o_delta_a = (r_is_delta_x_zero) ? w_00 : w_05;
    assign o_finish = (r_state == P_SETUP6);
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_SETUP0;
        end else begin
            case (r_state)
                P_SETUP0: if (i_start) r_state <= P_SETUP1;
                P_SETUP1: r_state <= P_SETUP2;
                P_SETUP2: r_state <= P_SETUP3;
                P_SETUP3: r_state <= P_SETUP4;
                P_SETUP4: r_state <= P_SETUP5;
                P_SETUP5: r_state <= P_SETUP6;
                P_SETUP6: r_state <= P_SETUP0;  // delta_t register store cycle
            endcase
        end
    end

    always @(posedge clk_core) begin
        if (w_set_delta_t) r_delta_t <= w_recip_out;
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_is_delta_x_zero <= 1'b0;
        end else begin
            if (w_set_dx_zero) r_is_delta_x_zero <= w_is_zero;
        end
    end

////////////////////////////
// module instance
////////////////////////////
    // adder
    fm_3d_fadd fadd (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_a({1'b0,i_x_r}),
        .i_b({1'b0,i_x_l}),
        .i_adsb(1'b1),
        .o_c(w_adder_out)
    );
    // 1/x
    fm_3d_frcp frcp (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_a(w_adder_out),
        .o_c(w_recip_out)
    );

endmodule
