// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_tu_etc_rom.v
//
// Abstract:
//   ETC texture decompression rom (2's complement table)
//  Created:
//    20 October 2008
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

module fm_3d_tu_etc_rom (
  clk_core,
  i_a,
  o_c
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input  [4:0]  i_a;  // table 3bits, index 2bits
    output [8:0]  o_c;

////////////////////////////
// reg
////////////////////////////
    reg    [8:0]  r_c;
////////////////////////////
// assign
////////////////////////////
    assign o_c = r_c;
///////////////////////////////////////////
//  always statement
///////////////////////////////////////////
    always @(posedge clk_core) begin
        case (i_a)
            5'b000_00:   r_c <= 9'h002;  // table0, index0 =  2
            5'b000_01:   r_c <= 9'h008;  // table0, index1 =  8
            5'b000_10:   r_c <= 9'h1fe;  // table0, index2 = -2
            5'b000_11:   r_c <= 9'h1f8;  // table0, index3 = -8
            5'b001_00:   r_c <= 9'h005;  // table1, index0 =  5
            5'b001_01:   r_c <= 9'h011;  // table1, index1 =  17
            5'b001_10:   r_c <= 9'h1fb;  // table1, index2 = -5
            5'b001_11:   r_c <= 9'h1ef;  // table1, index3 = -17
            5'b010_00:   r_c <= 9'h009;  // table2, index0 =  9
            5'b010_01:   r_c <= 9'h01d;  // table2, index1 =  29
            5'b010_10:   r_c <= 9'h1f7;  // table2, index2 = -9
            5'b010_11:   r_c <= 9'h1e3;  // table2, index3 = -29
            5'b011_00:   r_c <= 9'h00d;  // table3, index0 =  13
            5'b011_01:   r_c <= 9'h02a;  // table3, index1 =  42
            5'b011_10:   r_c <= 9'h1f3;  // table3, index2 = -13
            5'b011_11:   r_c <= 9'h1d6;  // table3, index3 = -42
            5'b100_00:   r_c <= 9'h012;  // table4, index0 =  18
            5'b100_01:   r_c <= 9'h03c;  // table4, index1 =  60
            5'b100_10:   r_c <= 9'h1ee;  // table4, index2 = -18
            5'b100_11:   r_c <= 9'h1c4;  // table4, index3 = -60
            5'b101_00:   r_c <= 9'h018;  // table5, index0 =  24
            5'b101_01:   r_c <= 9'h050;  // table5, index1 =  80
            5'b101_10:   r_c <= 9'h1e8;  // table5, index2 = -24
            5'b101_11:   r_c <= 9'h1b0;  // table5, index3 = -80
            5'b110_00:   r_c <= 9'h021;  // table6, index0 =  33
            5'b110_01:   r_c <= 9'h06a;  // table6, index1 =  106
            5'b110_10:   r_c <= 9'h1df;  // table6, index2 = -33
            5'b110_11:   r_c <= 9'h196;  // table6, index3 = -106
            5'b111_00:   r_c <= 9'h02f;  // table7, index0 =  47
            5'b111_01:   r_c <= 9'h0b7;  // table7, index1 =  183
            5'b111_10:   r_c <= 9'h1d1;  // table7, index2 = -47
            5'b111_11:   r_c <= 9'h149;  // table7, index3 = -183
            default: r_c <= 9'h000;
        endcase
    end


endmodule
