//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_interp.v, latency = 9
//
// Abstract:
//   parameter interpolator
//   o_c = i_a + (i_b-i_a) *t
//   (o_c = i_a * (1-t) + i_b *t)
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
//    i_en   i_a     i_b    i_t   o_c   ib-ia  mul    final add
// 0.  o      o       o      o           
// 1.                                    
// 2.                                    
// 3.                                    o     
// 4.                                           
// 5.                                           
// 6.                                           o
// 7.
// 8.                                            
// 9.                                                        o

module fm_3d_interp (
  clk_core,
  i_en,
  i_a,
  i_b,
  i_t,
  o_c
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         i_en;
    input  [21:0] i_a;
    input  [21:0] i_b;
    input  [21:0] i_t;
    output [21:0] o_c;          // result


///////////////////////////////////////////
//  wire 
///////////////////////////////////////////
    wire [21:0]  w_b_a_3z;
    wire [21:0]  w_a_3z;
    wire [21:0]  w_t_3z;
    wire [21:0]  w_abt_6z;
    wire [21:0]  w_a_6z;

////////////////////////////
// module instance
////////////////////////////

    // stage1-3

    // ib-ia
    fm_3d_fadd fadd_b_a (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(i_b),
        .i_b(i_a),
        .i_adsb(1'b1),
        .o_c(w_b_a_3z)
    );

    fm_3d_delay #(22,3) delay_a (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_a),
        .o_data(w_a_3z)
    );

    fm_3d_delay #(22,3) delay_t (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(i_t),
        .o_data(w_t_3z)
    );

    // stage 4-6

    // (i_b-i_a)*t
    fm_3d_fmul fmul_t (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_b_a_3z),
        .i_b(w_t_3z),
        .o_c(w_abt_6z)
    );

    fm_3d_delay #(22,3) delay_a_2 (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_data(w_a_3z),
        .o_data(w_a_6z)
    );

    // stage 6-9

    // i_a + (i_b-i_a) *t
    fm_3d_fadd fadd_ab (
        .clk_core(clk_core),
        .i_en(i_en),
        .i_a(w_a_6z),
        .i_b(w_abt_6z),
        .i_adsb(1'b0),
        .o_c(o_c)
    );

endmodule
