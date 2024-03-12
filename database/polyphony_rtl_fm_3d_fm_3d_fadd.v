//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_fadd.v
//
// Abstract:
//   floating point adder, latency = 3
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

module fm_3d_fadd (
  clk_core,
  i_en,
  i_a,
  i_b,
  i_adsb,
  o_c
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         i_en;
    input  [21:0] i_a;          // input A
    input  [21:0] i_b;          // input B
    input         i_adsb;       // 0 : A + B, 1 : A - B
    output [21:0] o_c;          // result


///////////////////////////////////////////
//  register definition
///////////////////////////////////////////
    reg    [21:0] r_c;         // result

    reg           r_sign_1z;
    reg    [4:0]  r_exp_1z;
    reg           r_sign_2z;
    reg    [4:0]  r_exp_2z;
    reg    [16:0] r_mats;
///////////////////////////////////////////
//  wire 
///////////////////////////////////////////
    // input data separation
    wire         w_a_sign;
    wire [15:0]  w_a_fraction;
    wire [4:0]   w_a_exp;
    wire         w_b_sign;
    wire [15:0]  w_b_fraction;
    wire [4:0]   w_b_exp;
    // intermidiate wire
    wire        w_mag_frac;   // mag of fraction
    wire        w_mag_exp;    // mag of exponent
    wire [4:0]  w_amb;        // exp a - b
    wire [4:0]  w_bma;        // exp b - a
    wire [4:0]  w_ex0;        // larger exp - smaller exp
    wire [4:0]  w_exp_l;      //
    wire        w_mag;        // mag of A/B
    wire [15:0] w_f0;         // larger fraction
    wire [15:0] w_f1_sa;      // smaller fraction
    wire [15:0] w_f1_sb;      // smaller fraction
    wire [15:0] w_f1t;        // smaller fraction
    wire        w_sign;       // sign bit
    wire        w_sub;        // subtract frag
    wire [16:0] w_mats;       // result of ADD/SUB + carry
    // finale result
    wire [21:0] w_c;

///////////////////////////////////////////
//  assign
///////////////////////////////////////////
    // separate input
    assign w_a_sign = i_a[21];
    assign w_a_exp  = i_a[20:16];
    assign w_a_fraction = i_a[15:0];

    assign w_b_sign = i_b[21];
    assign w_b_exp  = i_b[20:16];
    assign w_b_fraction = i_b[15:0];

    // output port
    assign o_c = r_c;

////////////////////////////////////
// stage 0
///////////////////////////////////
    assign w_mag_frac = (w_a_fraction <= w_b_fraction );
    assign w_mag_exp = (w_a_exp <= w_b_exp );
    assign w_exp_l = (w_mag_exp) ?  w_b_exp : w_a_exp;
    assign w_amb = w_a_exp - w_b_exp;
    assign w_bma = w_b_exp - w_a_exp;
    // larger exp - smaller exp
    assign w_ex0 = (w_mag_exp) ? w_bma : w_amb;

    assign w_mag = (w_ex0 == 4'b0) ? w_mag_frac : w_mag_exp;

    // select larger/smaller fraction
    assign w_f0 = (!w_mag) ? w_a_fraction : w_b_fraction;
//    assign w_f1 = (!w_mag) ? w_b_fraction : w_a_fraction;

    // A >= B : MAG = 0
    // ADD :              SUB :
    //         a + b             a - b
    //         a - b             a + b
    //        -a + b            -a - b
    //        -a - b            -a + b
    // SGN = sign of a
    //
    // A < B : MAG = 1
    // ADD :              SUB :
    //         a + b             a - b *
    //         a - b             a + b *
    //        -a + b            -a - b *
    //        -a - b            -a + b *
    //      (sign of b)       (sign of ~b)
    // if (adsb ==1 ) then b is sign, else not b is sign

    assign w_sign = ( w_mag == 1'b0) ? w_a_sign : (i_adsb ^ w_b_sign);

    // adsb = 0(add) : a  + -b  or b + -a ( sub)
    // adsb = 1(sub) : -a  - -b  or b - a
    assign w_sub = ((w_a_sign ^ w_b_sign) & !i_adsb) |
                   (!(w_a_sign ^ w_b_sign) & i_adsb) ;

    assign w_f1_sa = w_a_fraction >> w_ex0;
    assign w_f1_sb = w_b_fraction >> w_ex0;
    assign w_f1t = (w_mag) ? w_f1_sa : w_f1_sb;

////////////////////////////////////
// stage 1
///////////////////////////////////
    reg         r_sub;
    reg  [15:0] r_f0;
    reg  [15:0] r_f1t;

    always @(posedge clk_core) begin
        if (i_en) begin
            r_sign_1z <= w_sign;
            r_exp_1z <= w_exp_l;
            r_sub <= w_sub;
            r_f0 <= w_f0;
            r_f1t <= w_f1t;
        end
    end


///////////////////////////////////////////
//  stage 2
///////////////////////////////////////////

    assign w_mats =  (!r_sub) ? (r_f0 + r_f1t) : (r_f0 - r_f1t);
    always @(posedge clk_core) begin
        if (i_en) begin
            r_sign_2z <= r_sign_1z;
            r_exp_2z <= r_exp_1z;
            r_mats <= w_mats;
        end
    end


///////////////////////////////////////////
//  stage 3
///////////////////////////////////////////
    // normalize
    fm_3d_norm norm (
        .i_s(r_sign_2z),
        .i_e(r_exp_2z),
        .i_f(r_mats),
        .o_b(w_c)
    );


    always @(posedge clk_core) begin
        if (i_en) r_c <= w_c;
    end



endmodule
