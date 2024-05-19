// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_f22_floor.v
//
// Abstract:
//   floating point clipping
//
//  Created:
//    27 December 2008
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

module fm_3d_f22_floor (
    i_a,
    o_b
);

///////////////////////////////////////////
//  port definition
///////////////////////////////////////////
    input  [20:0] i_a;          // input e5, f1.15
    output [20:0] o_b;          
///////////////////////////////////////////
//  wire definition
///////////////////////////////////////////
    // intermidiate wire
    wire [4:0]  w_exp;
    wire [15:0] w_fraction;
    wire [15:0] w_fraction_out;

///////////////////////////////////////////
//  assign statement
///////////////////////////////////////////
    assign w_exp  = i_a[20:16];
    assign w_fraction = i_a[15:0];

    assign o_b = {w_exp, w_fraction_out};
    assign w_fraction_out = f_floor(w_exp, w_fraction);
///////////////////////////////////////////
//  function statement
///////////////////////////////////////////
    function [15:0] f_floor;
        input [4:0]  exp;
        input [15:0] frac;
        begin
            case (exp[4:0])
                5'hf:  f_floor = {frac[15],15'h0};
                5'h10: f_floor = {frac[15:14],14'h0};
                5'h11: f_floor = {frac[15:13],13'h0};
                5'h12: f_floor = {frac[15:12],12'h0};
                5'h13: f_floor = {frac[15:11],11'h0};
                5'h14: f_floor = {frac[15:10],10'h0};
                5'h15: f_floor = {frac[15:9],9'h0};
                5'h16: f_floor = {frac[15:8],8'h0};
                5'h17: f_floor = {frac[15:7],7'h0};
                5'h18: f_floor = {frac[15:6],6'h0};
                5'h19: f_floor = {frac[15:5],5'h0};
                5'h1a: f_floor = {frac[15:4],4'h0};
                5'h1b: f_floor = {frac[15:3],3'h0};
                5'h1c: f_floor = {frac[15:2],2'h0};
                5'h1d: f_floor = {frac[15:1],1'h0};
                5'h1e: f_floor = frac[15:0];
                default: f_floor = 16'h0;
            endcase
        end
    endfunction

endmodule

