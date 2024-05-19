// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_norm.v
//
// Abstract:
//   floating point normalize finction
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

module fm_3d_norm (
  i_s,
  i_e,
  i_f,
  o_b
);

///////////////////////////////////////////
//  port definition
///////////////////////////////////////////
    input         i_s;          // input s1, e5, f2.15
    input  [4:0]  i_e;          // input s1, e5, f2.15
    input  [16:0] i_f;          // input s1, e5, f2.15
    output [21:0] o_b;          // normalized out
///////////////////////////////////////////
//  wire definition
///////////////////////////////////////////
    // intermidiate wire
    wire        w_carry;       // fraction carry bit
    wire [3:0]  w_penc;        // result of priority encode
    wire        w_c_zero;      // fraction zero flag
    wire        w_ce_zero;     // exp zero flag
    wire [15:0] w_lshifted;    // left shifted fraction value
    wire [4:0]  w_lshift_val;  // left shift value
    wire [15:0] w_c_fraction;
    wire [15:0] w_c_frac;
    wire [4:0]  w_c_exp;       // normalized final exp
    wire        w_c_sign;      // final exp
    wire [5:0]  w_incdec_out;  // result of exp incdec

///////////////////////////////////////////
//  assign statement
///////////////////////////////////////////
    assign w_carry  = i_f[16];
// normalize

    // fraction zero flag
    assign w_c_zero = (i_f == 17'h0);

    // fraction priority encode
    // synthesis attribute priority_extract of w_penc is yes;
    assign w_penc = f_prenc(i_f[15:0]);

    // if w_incdec_out[5] == 1, under flow
    assign w_incdec_out = f_incdec(i_e, w_penc, w_carry);

    // left shift value for normalize
    assign  w_lshift_val = w_penc;
    // left shift for nornamize
    assign w_lshifted = i_f[15:0] << w_lshift_val;
    // decide final fraction
    assign w_c_frac = (w_carry) ? i_f[16:1] : w_lshifted;
    // decide final exp
    assign w_c_exp = (w_c_zero|w_incdec_out[5]) ? 5'h0 : w_incdec_out[4:0];
    // exp zero flag
    assign w_ce_zero = (w_c_exp == 5'h0);
    // decide final sign
    assign w_c_sign = i_s & !w_ce_zero;
    // decide final fraction
    assign w_c_fraction = (w_ce_zero) ? 16'h0 : w_c_frac;

    // output port connection
    assign o_b = {w_c_sign, w_c_exp, w_c_fraction};

///////////////////////////////////////////
//  function statement
///////////////////////////////////////////
function [3:0] f_prenc;
  input [15:0] mat;
  begin
    if (mat[15] == 1'b1) begin
      f_prenc = 4'h0;
    end else if (mat[14] == 1'b1) begin
      f_prenc = 4'h1;
    end else if (mat[13] == 1'b1) begin
      f_prenc = 4'h2;
    end else if (mat[12] == 1'b1) begin
      f_prenc = 4'h3;
    end else if (mat[11] == 1'b1) begin
      f_prenc = 4'h4;
    end else if (mat[10] == 1'b1) begin
      f_prenc = 4'h5;
    end else if (mat[9] == 1'b1) begin
      f_prenc = 4'h6;
    end else if (mat[8] == 1'b1) begin
      f_prenc = 4'h7;
    end else if (mat[7] == 1'b1) begin
      f_prenc = 4'h8;
    end else if (mat[6] == 1'b1) begin
      f_prenc = 4'h9;
    end else if (mat[5] == 1'b1) begin
      f_prenc = 4'ha;
    end else if (mat[4] == 1'b1) begin
      f_prenc = 4'hb;
    end else if (mat[3] == 1'b1) begin
      f_prenc = 4'hc;
    end else if (mat[2] == 1'b1) begin
      f_prenc = 4'hd;
    end else if (mat[1] == 1'b1) begin
      f_prenc = 4'he;
    end else begin
      f_prenc = 4'hf;
    end
  end
endfunction

function [5:0] f_incdec;
  input [4:0] a;
  input [3:0] b;
  input       inc;
  reg   [5:0] r_inc;
  reg   [5:0] r_dec;
  reg         r_1f_flag;
  begin
    r_1f_flag = (a == 5'h1f);
    r_inc = a + !r_1f_flag;
    r_dec = a - b;
    f_incdec = (inc) ? r_inc : r_dec;
/*
    if (inc) begin
      if (a == 5'h1f) f_incdec = a;
      else f_incdec = a + 1'b1;
    end else begin
      f_incdec = a - b;
    end
*/
  end
endfunction

endmodule

