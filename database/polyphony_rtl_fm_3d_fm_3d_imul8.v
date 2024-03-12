//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_imul8.v
//
// Abstract:
//   8-bit integer multiplyer
//  Created:
//    15 January 2009
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

module fm_3d_imul8 (
    i_a,
    i_b,
    o_c
);

////////////////////////////
// I/O definition
////////////////////////////
    input  [7:0]  i_a;
    input  [7:0]  i_b;
    output [7:0]  o_c;

///////////////////////////////////////////
//  wire 
///////////////////////////////////////////
    wire   [15:0] w_m0;
    wire   [15:0] w_m1;
    wire   [8:0]  w_carry;
    wire   [7:0]  w_c;
///////////////////////////////////////////
//  assign
///////////////////////////////////////////
    assign w_m0 = i_a * i_b;
    //assign w_m1 = w_m0 + 8'd128;  // original code
    assign w_m1[6:0] = w_m0[6:0];
    assign w_m1[15:7] = w_m0[15:7] + 1'b1;
    assign w_carry = w_m1[7:0] + w_m1[15:8];
    assign w_c = w_m1[15:8] + w_carry[8];
    assign o_c = w_c;

endmodule
