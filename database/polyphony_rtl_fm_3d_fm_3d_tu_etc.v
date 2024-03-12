//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_tu_etc.v
//
// Abstract:
//   ETC texture decode module
//
//  Created:
//    17 November 2008
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

module fm_3d_tu_etc (
    clk_core,
    i_u_sub,
    i_v_sub,
    i_code_l32,
    i_code_u32,
    o_r,
    o_g,
    o_b
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input  [1:0]  i_u_sub;
    input  [1:0]  i_v_sub;
    input  [31:0] i_code_l32;
    input  [31:0] i_code_u32;
    output [7:0]  o_r;
    output [7:0]  o_g;
    output [7:0]  o_b;
////////////////////////////
// reg
////////////////////////////
    reg    [7:0]  r_cr_1z;
    reg    [7:0]  r_cg_1z;
    reg    [7:0]  r_cb_1z;
////////////////////////////
// wire
////////////////////////////
    wire   [1:0]  w_idx0;
    wire   [1:0]  w_idx1;
    wire   [1:0]  w_idx2;
    wire   [1:0]  w_idx3;
    wire   [1:0]  w_idx4;
    wire   [1:0]  w_idx5;
    wire   [1:0]  w_idx6;
    wire   [1:0]  w_idx7;
    wire   [1:0]  w_idx8;
    wire   [1:0]  w_idx9;
    wire   [1:0]  w_idx10;
    wire   [1:0]  w_idx11;
    wire   [1:0]  w_idx12;
    wire   [1:0]  w_idx13;
    wire   [1:0]  w_idx14;
    wire   [1:0]  w_idx15;
    wire          w_flip_bit;
    wire          w_diff_bit;
    wire   [2:0]  w_tc1;
    wire   [2:0]  w_tc2;

    wire   [3:0]  w_r1_4bits;
    wire   [3:0]  w_r2_4bits;
    wire   [3:0]  w_g1_4bits;
    wire   [3:0]  w_g2_4bits;
    wire   [3:0]  w_b1_4bits;
    wire   [3:0]  w_b2_4bits;

    wire   [4:0]  w_r1_5bits;
    wire   [4:0]  w_r2_5bits;
    wire   [2:0]  w_r2_delta;
    wire   [4:0]  w_g1_5bits;
    wire   [4:0]  w_g2_5bits;
    wire   [2:0]  w_g2_delta;
    wire   [4:0]  w_b1_5bits;
    wire   [4:0]  w_b2_5bits;
    wire   [2:0]  w_b2_delta;

    wire   [7:0]  w_r1_8bits;
    wire   [7:0]  w_r2_8bits;
    wire   [7:0]  w_g1_8bits;
    wire   [7:0]  w_g2_8bits;
    wire   [7:0]  w_b1_8bits;
    wire   [7:0]  w_b2_8bits;

    wire   [3:0]  w_idx;
    wire   [1:0]  w_tbl_idx;
    wire   [7:0]  w_r;
    wire   [7:0]  w_g;
    wire   [7:0]  w_b;

    wire   [4:0]  w_rom_adrs;
    wire   [8:0]  w_rom_out;

    wire   [8:0]  w_cr_t;
    wire   [8:0]  w_cg_t;
    wire   [8:0]  w_cb_t;
    wire          w_select1;
////////////////////////////
// assign
////////////////////////////
    // pixel index
    assign w_idx0 = {i_code_l32[16],i_code_l32[0]};
    assign w_idx1 = {i_code_l32[17],i_code_l32[1]};
    assign w_idx2 = {i_code_l32[18],i_code_l32[2]};
    assign w_idx3 = {i_code_l32[19],i_code_l32[3]};
    assign w_idx4 = {i_code_l32[20],i_code_l32[4]};
    assign w_idx5 = {i_code_l32[21],i_code_l32[5]};
    assign w_idx6 = {i_code_l32[22],i_code_l32[6]};
    assign w_idx7 = {i_code_l32[23],i_code_l32[7]};
    assign w_idx8 = {i_code_l32[24],i_code_l32[8]};
    assign w_idx9 = {i_code_l32[25],i_code_l32[9]};
    assign w_idx10 = {i_code_l32[26],i_code_l32[10]};
    assign w_idx11 = {i_code_l32[27],i_code_l32[11]};
    assign w_idx12 = {i_code_l32[28],i_code_l32[12]};
    assign w_idx13 = {i_code_l32[29],i_code_l32[13]};
    assign w_idx14 = {i_code_l32[30],i_code_l32[14]};
    assign w_idx15 = {i_code_l32[31],i_code_l32[15]};

    assign w_flip_bit = i_code_u32[0];
    assign w_diff_bit = i_code_u32[1];
    assign w_tc2 = i_code_u32[4:2];
    assign w_tc1 = i_code_u32[7:5];
    // color 4:4:4
    assign w_b2_4bits = i_code_u32[11:8];
    assign w_b1_4bits = i_code_u32[15:12];
    assign w_g2_4bits = i_code_u32[19:16];
    assign w_g1_4bits = i_code_u32[23:20];
    assign w_r2_4bits = i_code_u32[27:24];
    assign w_r1_4bits = i_code_u32[31:28];
    // color 5:5:5
    assign w_b2_delta = i_code_u32[10:8];
    assign w_b1_5bits = i_code_u32[15:11];
    assign w_b2_5bits = f_apply_diff_b(w_b1_5bits,w_b2_delta);

    assign w_g2_delta = i_code_u32[18:16];
    assign w_g1_5bits = i_code_u32[23:19];
    assign w_g2_5bits = f_apply_diff_g(w_g1_5bits,w_g2_delta);

    assign w_r2_delta = i_code_u32[26:24];
    assign w_r1_5bits = i_code_u32[31:27];
    assign w_r2_5bits = f_apply_diff_r(w_r1_5bits,w_r2_delta);

    assign w_r1_8bits = (w_diff_bit) ? {w_r1_5bits,w_r1_5bits[4:2]} :
                                       {w_r1_4bits,w_r1_4bits};
    assign w_r2_8bits = (w_diff_bit) ? {w_r2_5bits,w_r2_5bits[4:2]} :
                                       {w_r2_4bits,w_r2_4bits};
    assign w_g1_8bits = (w_diff_bit) ? {w_g1_5bits,w_g1_5bits[4:2]} :
                                       {w_g1_4bits,w_g1_4bits};
    assign w_g2_8bits = (w_diff_bit) ? {w_g2_5bits,w_g2_5bits[4:2]} :
                                       {w_g2_4bits,w_g2_4bits};
    assign w_b1_8bits = (w_diff_bit) ? {w_b1_5bits,w_b1_5bits[4:2]} :
                                       {w_b1_4bits,w_b1_4bits};
    assign w_b2_8bits = (w_diff_bit) ? {w_b2_5bits,w_b2_5bits[4:2]} :
                                       {w_b2_4bits,w_b2_4bits};

    assign w_idx = {i_u_sub,i_v_sub};
    assign w_tbl_idx = (w_idx == 4'd0) ? w_idx0 :
                       (w_idx == 4'd1) ? w_idx1 :
                       (w_idx == 4'd2) ? w_idx2 :
                       (w_idx == 4'd3) ? w_idx3 :
                       (w_idx == 4'd4) ? w_idx4 :
                       (w_idx == 4'd5) ? w_idx5 :
                       (w_idx == 4'd6) ? w_idx6 :
                       (w_idx == 4'd7) ? w_idx7 :
                       (w_idx == 4'd8) ? w_idx8 :
                       (w_idx == 4'd9) ? w_idx9 :
                       (w_idx == 4'd10) ? w_idx10 :
                       (w_idx == 4'd11) ? w_idx11 :
                       (w_idx == 4'd12) ? w_idx12 :
                       (w_idx == 4'd13) ? w_idx13 :
                       (w_idx == 4'd14) ? w_idx14 :
                                          w_idx15;

    assign w_select1 = (w_flip_bit &  !i_v_sub[1]) |
                       (!w_flip_bit & !i_u_sub[1]);
    assign w_rom_adrs = (w_select1) ? {w_tc1,w_tbl_idx} : {w_tc2,w_tbl_idx};
    assign w_r = (w_select1) ? w_r1_8bits : w_r2_8bits;
    assign w_g = (w_select1) ? w_g1_8bits : w_g2_8bits;
    assign w_b = (w_select1) ? w_b1_8bits : w_b2_8bits;

    assign w_cr_t = {1'b0,r_cr_1z} + w_rom_out;
    assign o_r = (!w_cr_t[8])   ? w_cr_t[7:0] :
                 (w_rom_out[8]) ? 8'h00: 8'hff;
    assign w_cg_t = {1'b0,r_cg_1z} + w_rom_out;
    assign o_g = (!w_cg_t[8])   ? w_cg_t[7:0] :
                 (w_rom_out[8]) ? 8'h00: 8'hff;
    assign w_cb_t = {1'b0,r_cb_1z} + w_rom_out;
    assign o_b = (!w_cb_t[8])   ? w_cb_t[7:0] :
                 (w_rom_out[8]) ? 8'h00: 8'hff;
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core) begin
        r_cr_1z <= w_r;
        r_cg_1z <= w_g;
        r_cb_1z <= w_b;
    end

////////////////////////////
// function
////////////////////////////
    function [4:0] f_apply_diff_r;
        input [4:0] c1;
        input [2:0] diff;
        reg [5:0] tmp;
        begin
            tmp = c1 + {diff[2],diff[2],diff};  // sign extension
            if (tmp[5]) begin
                // over-flow
                f_apply_diff_r = (diff[2]) ? tmp[4:0] : 5'h1f;
            end else begin
                // under-flow
                f_apply_diff_r = (diff[2]) ? 5'h00: tmp[4:0];
            end
        end
    endfunction

    function [4:0] f_apply_diff_g;
        input [4:0] c1;
        input [2:0] diff;
        reg [5:0] tmp;
        begin
            tmp = c1 + {diff[2],diff[2],diff};  // sign extension
            if (tmp[5]) begin
                // over-flow
                f_apply_diff_g = (diff[2]) ? tmp[4:0] : 5'h1f;
            end else begin
                // under-flow
                f_apply_diff_g = (diff[2]) ? 5'h00: tmp[4:0];
            end
        end
    endfunction

    function [4:0] f_apply_diff_b;
        input [4:0] c1;
        input [2:0] diff;
        reg [5:0] tmp;
        begin
            tmp = c1 + {diff[2],diff[2],diff};  // sign extension
            if (tmp[5]) begin
                // over-flow
                f_apply_diff_b = (diff[2]) ? tmp[4:0] : 5'h1f;
            end else begin
                // under-flow
                f_apply_diff_b = (diff[2]) ? 5'h00: tmp[4:0];
            end
        end
    endfunction


////////////////////////////
// module instance
////////////////////////////
    fm_3d_tu_etc_rom tu_etc_rom (
        .clk_core(clk_core),
        .i_a(w_rom_adrs),
        .o_c(w_rom_out)
    );

endmodule
