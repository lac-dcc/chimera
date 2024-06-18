// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_cnv.v
//
// Abstract:
//   3D float conversion
//
//  Created:
//    27 August 2008
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
//
//  Revision History
//  2009/01/17 round carry bug fix, under flow bugfix(input 0x36800000)

module fm_3d_fcnv (
  i_f32,
  o_f22
);

////////////////////////////
// I/O definition
////////////////////////////
    input  [31:0] i_f32;
    output [21:0] o_f22;

////////////////////////////
// assign
////////////////////////////
    assign o_f22 = f_f32_to_f22(i_f32);
////////////////////////////
// function
////////////////////////////
    function [21:0] f_f32_to_f22;
        input [31:0] f32;
        reg s;
        reg [7:0]  e8;
        reg [8:0]  e8d;  // width sign bit
        reg [4:0]  e5;
        reg [23:0] m23;
        reg [14:0] m15;
        reg        carry;
        reg        zf;
        begin
            s = f32[31];
            e8 = f32[30:23];
            zf = (e8 == 8'h00);
            m23 = f32[22:0];
            {carry,m15} = m23[22:8] + m23[7];
            e8d = e8 - 112 + carry;  // -127+15 + carry
            if (zf|e8d[8]) begin
                e5 = 5'h0;
            end else begin
                e5 = e8d[4:0];
            end
            f_f32_to_f22 = {s,e5,!(zf|e8d[8]),m15};
        end
    endfunction

endmodule
