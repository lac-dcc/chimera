// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_fmul.v
//
// Abstract:
//   floating point multiplyer, latency = 3
//
//  Created:
//    28 August 2008
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

module fm_3d_fmul (
  clk_core,
  i_en,
  i_a,
  i_b,
  o_c
);

///////////////////////////////////////////
//  port definition
///////////////////////////////////////////
    input         clk_core;
    input         i_en;
    input  [21:0] i_a;
    input  [21:0] i_b;
    output [21:0] o_c;

///////////////////////////////////////////
//  register
///////////////////////////////////////////
    reg    [21:0] r_c;

    reg           r_sign_1z;
    reg           r_sign_2z;
    reg    [17:0] r_cf_tmp;
    reg    [4:0]  r_ce_tmp_1z;
    reg    [4:0]  r_ce_tmp_2z;
    reg    [16:0] r_cf_tmp2;

///////////////////////////////////////////
//  wire definition
///////////////////////////////////////////
    // input data separation
    wire        w_a_sign;
    wire [15:0] w_a_fraction;
    wire [4:0]  w_a_exp;
    wire        w_b_sign;
    wire [15:0] w_b_fraction;
    wire [4:0]  w_b_exp;

    // intermidiate wire
    wire [5:0]  w_adder_out;   // result of exp addition
    wire        w_sign;
    wire [31:0] w_cf_tmp;      // multplyer out 1.15 * 1.15 = 2.30
    wire [16:0] w_cf_tmp2;     // multplyer out (rounded) 2.15
    wire [4:0]  w_ce_tmp;      // temporary exp out
    wire [21:0] w_c;
///////////////////////////////////////////
//  stage0
///////////////////////////////////////////
    // separate input and add implied fraction msb
    assign w_a_sign = i_a[21];
    assign w_a_exp  = i_a[20:16];
    assign w_a_fraction = i_a[15:0];

    assign w_b_sign = i_b[21];
    assign w_b_exp  = i_b[20:16];
    assign w_b_fraction = i_b[15:0];

    // exponent calculation
    //    (ea + eb - bias)
    wire [5:0] w_exp_add;
    assign w_exp_add = w_a_exp + w_b_exp;
    assign w_adder_out = w_exp_add -  4'hf;
    assign w_ce_tmp = (w_exp_add < 5'hf) ? 5'h00 :
                      (w_adder_out[5])   ? 5'h1f :
                                           w_adder_out[4:0];
    assign w_sign = w_a_sign ^ w_b_sign;
    // fraction multiplyer
    assign w_cf_tmp = w_a_fraction * w_b_fraction;

///////////////////////////////////////////
//  stage1
///////////////////////////////////////////
    always @(posedge clk_core) begin
        if (i_en) begin
            r_sign_1z <= w_sign;
            r_cf_tmp <= w_cf_tmp[31:14];
            r_ce_tmp_1z <= w_ce_tmp;
        end
    end
    // round
    //assign w_cf_tmp2 = w_cf_tmp[14] ? w_cf_tmp[31:15] + 1'b1 :
    //                                  w_cf_tmp[31:15];
    wire [16:0] w_rounded;
    assign w_rounded = r_cf_tmp[17:1] + 1'b1;
    assign w_cf_tmp2 = r_cf_tmp[0] ?  w_rounded :               // 2.15
                                      r_cf_tmp[17:1];



///////////////////////////////////////////
//  stage2
///////////////////////////////////////////
    always @(posedge clk_core) begin
        if (i_en) begin
            r_sign_2z <= r_sign_1z;
            r_ce_tmp_2z <= r_ce_tmp_1z;
            r_cf_tmp2 <= w_cf_tmp2;
        end
    end

// normalize
    fm_3d_norm norm (
        .i_s(r_sign_2z),
        .i_e(r_ce_tmp_2z),
        .i_f(r_cf_tmp2),
        .o_b(w_c)
    );


///////////////////////////////////////////
//  stage3
///////////////////////////////////////////
    // final register
    always @(posedge clk_core) begin
        if (i_en) r_c <= w_c;
    end

    // output port connection
    assign o_c = r_c;
endmodule
