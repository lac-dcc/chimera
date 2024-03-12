//=======================================================================
// Project Polyphony
//
// File:
//   fm_hvc_aa_filter_core.v
//
// Abstract:
//   Anti-aliasing filter core
//   out color = 1/2*base + 1/8*br+1/8*bl+1/8*tr+1/8*tl
//
//  Created:
//    22 January 2009
//
// Copyright (c) 2008-2009 Kenji Ishimaru, All rights reserved.
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

module fm_hvc_aa_filter_core (
    clk_vi,
    // configuration
    i_fb_blend_en,
    // incoming color
    i_base,
    i_br,
    i_bl,
    i_tr,
    i_tl,
    // outgoing color
    o_c
);

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_vi;     // 25MHz
    // configuration
    input          i_fb_blend_en;
    // incoming color
    input  [7:0]   i_base; // 7.1 or 8.0
    input  [7:0]   i_br;   // 5.3
    input  [7:0]   i_bl;   // 5.3
    input  [7:0]   i_tr;   // 5.3 or 8.0
    input  [7:0]   i_tl;   // 5.3

    // outgoing color
    output [7:0]   o_c;
//////////////////////////////////
// reg
//////////////////////////////////
    //reg    [7:0]   r_c;
//////////////////////////////////
// wire
//////////////////////////////////
    wire   [8:0]   w_b;  // intermediate 6.3
    wire   [8:0]   w_t;  // intermediate 6.3
    wire   [9:0]   w_m;  // intermediate 7.3
    wire   [10:0]  w_f;  // intermediate 8.3
    wire   [8:0]   w_ff; // intermediate 9.0
    wire   [7:0]   w_r;  // rounded final color

    // for buffer blend function
    wire   [8:0]   w_ff_a; // intermediate 9.0
    wire   [8:0]   w_ff_b; // intermediate 9.0
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_b = i_br + i_bl;  // 6.3
    assign w_t = i_tr + i_tl;  // 6.3
    assign w_m = w_b + w_t;    // 7.3
    assign w_f = w_m + {i_base,2'b00}; // 8.3
    assign w_ff_a = (w_f[2]) ? w_f[10:3] : w_f[10:3] + 1'b1;  // 9.0 for aa
    assign w_ff_b = i_base + i_tr;  // 9.0 for blend
    assign w_ff = (!i_fb_blend_en) ? w_ff_a : w_ff_b;
    assign w_r = (w_ff[8]) ? 8'hff : w_ff[7:0];

//    assign o_c = r_c;
    assign o_c = w_r;
//////////////////////////////////
// always
//////////////////////////////////
/*
    always @(posedge clk_vi) begin
        r_c = w_r;
    end
*/

endmodule
