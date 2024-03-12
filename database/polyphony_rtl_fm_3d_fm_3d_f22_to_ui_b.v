//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_f22_to_ui_b.v
//
// Abstract:
//   floating point to integer conversion
//   (16.0 bias, 16.0 -> 1.0)
//  Created:
//    26 December 2008
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

module fm_3d_f22_to_ui_b (
    i_a,
    o_b
);

///////////////////////////////////////////
//  port definition
///////////////////////////////////////////
    input  [21:0] i_a;          // input s1, e5, f1.15
    output [15:0] o_b;          // unsigned integer
///////////////////////////////////////////
//  wire definition
///////////////////////////////////////////
    // intermidiate wire
    wire [4:0]  w_exp;
    wire [15:0] w_fraction;

///////////////////////////////////////////
//  assign statement
///////////////////////////////////////////
    assign w_exp  = i_a[20:16];
    assign w_fraction = i_a[15:0];

    assign o_b = f_ftoi(w_exp, w_fraction);
///////////////////////////////////////////
//  function statement
///////////////////////////////////////////
    function [15:0] f_ftoi;
        input [4:0]  exp;
        input [15:0] frac;
        begin
            case (exp)
                5'd19: f_ftoi = {15'b0,frac[15]};    // bias 0
                5'd20: f_ftoi = {14'b0,frac[15:14]};
                5'd21: f_ftoi = {13'b0,frac[15:13]};
                5'd22: f_ftoi = {12'b0,frac[15:12]};
                5'd23: f_ftoi = {11'b0,frac[15:11]};
                5'd24: f_ftoi = {10'b0,frac[15:10]};
                5'd25: f_ftoi = {9'b0,frac[15:9]};
                5'd26: f_ftoi = {8'b0,frac[15:8]};
                5'd27: f_ftoi = {7'b0,frac[15:7]};
                5'd28: f_ftoi = {6'b0,frac[15:6]};
                5'd29: f_ftoi = {5'b0,frac[15:5]};
                5'd30: f_ftoi = {4'b0,frac[15:4]};
                5'd31: f_ftoi = {3'b0,frac[15:3]};
                default: f_ftoi = 16'h0;
            endcase
        end
    endfunction

endmodule

