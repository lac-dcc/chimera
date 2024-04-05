//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_span_reg.v
//
// Abstract:
//   span register module
//
//  Created:
//    18 December 2008
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

`include "fm_3d_def.v"

module fm_3d_ru_span_reg (
    clk_core,
    // parameter setup
    i_initial_valid,
    i_initial_kind,
    i_initial_val,
    // parameter update
    i_update_valid,
    i_update_kind,
    i_update_end_flag,
    i_update_val,
    i_update_frag,
    i_update_x,
    i_update_z,
    i_update_color,
    // control registers
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    i_param0_kind,
    i_param1_kind,
    // current parameter output
    o_cur_x,
    o_cur_z,
    o_cur_iw,
    o_cur_param00,
    o_cur_param01,
    o_cur_param02,
    o_cur_param03,
    o_cur_param10,
    o_cur_param11,
`ifdef VTX_PARAM1_REDUCE
`else
    o_cur_param12,
    o_cur_param13,
`endif
    // parameter output
    o_x,
    o_z,
    o_cr,
    o_cg,
    o_cb,
    o_ca,
    o_tu,
    o_tv
);
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    // parameter setup
    input         i_initial_valid;
    input  [3:0]  i_initial_kind;
    input  [21:0] i_initial_val;
    // parameter update
    input         i_update_valid;
    input  [3:0]  i_update_kind;
    input         i_update_end_flag;
    input  [21:0] i_update_val;
    input  [21:0] i_update_frag;
    input  [9:0]  i_update_x;
    input  [15:0] i_update_z;
    input  [7:0]  i_update_color;
    // control registers
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    input  [1:0]  i_param0_kind;
    input  [1:0]  i_param1_kind;
    // current parameter output
    output [20:0] o_cur_x;
    output [20:0] o_cur_z;
    output [20:0] o_cur_iw;
    output [20:0] o_cur_param00;
    output [20:0] o_cur_param01;
    output [20:0] o_cur_param02;
    output [20:0] o_cur_param03;
    output [20:0] o_cur_param10;
    output [20:0] o_cur_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_cur_param12;
    output [20:0] o_cur_param13;
`endif
    // parameter output
    output [9:0]  o_x;
    output [15:0] o_z;
    output [7:0]  o_cr;
    output [7:0]  o_cg;
    output [7:0]  o_cb;
    output [7:0]  o_ca;
    output [21:0] o_tu;
    output [21:0] o_tv;
////////////////////////////
// reg
////////////////////////////
    reg    [20:0] r_x;
    reg    [20:0] r_z;
    reg    [20:0] r_iw;
    reg    [20:0] r_param00;
    reg    [20:0] r_param01;
    reg    [20:0] r_param02;
    reg    [20:0] r_param03;
    reg    [20:0] r_param10;
    reg    [20:0] r_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    reg    [20:0] r_param12;
    reg    [20:0] r_param13;
`endif
    // output registers
    reg    [9:0]  r_fx;
    reg    [15:0] r_fz;
    reg    [7:0]  r_cr;
    reg    [7:0]  r_cg;
    reg    [7:0]  r_cb;
    reg    [7:0]  r_ca;
    reg    [21:0] r_tu;
    reg    [21:0] r_tv;
////////////////////////////
// wire
////////////////////////////
    wire          w_set_initial_x;
    wire          w_set_initial_z;
    wire          w_set_initial_iw;
    wire          w_set_initial_param00;
    wire          w_set_initial_param01;
    wire          w_set_initial_param02;
    wire          w_set_initial_param03;
    wire          w_set_initial_param10;
    wire          w_set_initial_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire          w_set_initial_param12;
    wire          w_set_initial_param13;
`endif

    wire          w_set_update_x;
    wire          w_set_update_z;
    wire          w_set_update_iw;
    wire          w_set_update_param00;
    wire          w_set_update_param01;
    wire          w_set_update_param02;
    wire          w_set_update_param03;
    wire          w_set_update_param10;
    wire          w_set_update_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire          w_set_update_param12;
    wire          w_set_update_param13;
`endif

    wire          w_set_x;
    wire          w_set_z;
    wire          w_set_cr;
    wire          w_set_cg;
    wire          w_set_cb;
    wire          w_set_ca;
    wire          w_set_tu;
    wire          w_set_tv;

////////////////////////////
// assign
////////////////////////////
    assign w_set_initial_x = i_initial_valid & (i_initial_kind == `FPARAM_X);
    assign w_set_initial_z = i_initial_valid & (i_initial_kind == `FPARAM_Z);
    assign w_set_initial_iw = i_initial_valid & 
                              (i_initial_kind == `FPARAM_IW);
    assign w_set_initial_param00 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P00);
    assign w_set_initial_param01 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P01);
    assign w_set_initial_param02 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P02);
    assign w_set_initial_param03 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P03);
    assign w_set_initial_param10 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P10);
    assign w_set_initial_param11 = i_initial_valid & 
                                  (i_initial_kind == `FPARAM_P11);
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_set_initial_param12 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P12);
    assign w_set_initial_param13 = i_initial_valid & 
                                   (i_initial_kind == `FPARAM_P13);
`endif
    assign w_set_update_x = i_update_valid & (i_update_kind == `FPARAM_X);
    assign w_set_update_z = i_update_valid & (i_update_kind == `FPARAM_Z);
    assign w_set_update_iw = i_update_valid & 
                              (i_update_kind == `FPARAM_IW);
    assign w_set_update_param00 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P00);
    assign w_set_update_param01 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P01);
    assign w_set_update_param02 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P02);
    assign w_set_update_param03 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P03);
    assign w_set_update_param10 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P10);
    assign w_set_update_param11 = i_update_valid & 
                                  (i_update_kind == `FPARAM_P11);
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_set_update_param12 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P12);
    assign w_set_update_param13 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P13);
`endif

    assign w_set_x = w_set_update_x;
    assign w_set_z = w_set_update_z;
    assign w_set_cr = (i_param0_kind == `ATTR_COLOR0) ? w_set_update_param00 :
                                                        w_set_update_param10;
    assign w_set_cg = (i_param0_kind == `ATTR_COLOR0) ? w_set_update_param01 :
                                                        w_set_update_param11;
`ifdef VTX_PARAM1_REDUCE
    assign w_set_cb = w_set_update_param02;
    assign w_set_ca = w_set_update_param03;
`else
    assign w_set_cb = (i_param0_kind == `ATTR_COLOR0) ? w_set_update_param02 :
                                                        w_set_update_param12;
    assign w_set_ca = (i_param0_kind == `ATTR_COLOR0) ? w_set_update_param03 :
                                                        w_set_update_param13;
`endif
    assign w_set_tu = (i_param1_kind == `ATTR_TEXTURE0) ? w_set_update_param10 :
                                                          w_set_update_param00;
    assign w_set_tv = (i_param1_kind == `ATTR_TEXTURE0) ? w_set_update_param11 :
                                                          w_set_update_param01;

    assign o_cur_x = r_x;
    assign o_cur_z = r_z;
    assign o_cur_iw = r_iw;
    assign o_cur_param00 = r_param00;
    assign o_cur_param01 = r_param01;
    assign o_cur_param02 = r_param02;
    assign o_cur_param03 = r_param03;
    assign o_cur_param10 = r_param10;
    assign o_cur_param11 = r_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_cur_param12 = r_param12;
    assign o_cur_param13 = r_param13;
`endif

    assign o_x = r_fx;
    assign o_z = r_fz;
    assign o_cr = r_cr;
    assign o_cg = r_cg;
    assign o_cb = r_cb;
    assign o_ca = r_ca;
    assign o_tu = r_tu;
    assign o_tv = r_tv;
////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core) begin

        if (w_set_update_x)       r_x <= i_update_val[20:0];
        else if (w_set_initial_x) r_x <= i_initial_val[20:0];

        if (w_set_update_z)       r_z <= i_update_val[20:0];
        else if (w_set_initial_z) r_z <= i_initial_val[20:0];

        if (w_set_update_iw)       r_iw <= i_update_val[20:0];
        else if (w_set_initial_iw) r_iw <= i_initial_val[20:0];

        if (w_set_update_param00)       r_param00 <= i_update_val[20:0];
        else if (w_set_initial_param00) r_param00 <= i_initial_val[20:0];

        if (w_set_update_param01)       r_param01 <= i_update_val[20:0];
        else if (w_set_initial_param01) r_param01 <= i_initial_val[20:0];

        if (w_set_update_param02)       r_param02 <= i_update_val[20:0];
        else if (w_set_initial_param02) r_param02 <= i_initial_val[20:0];

        if (w_set_update_param03)       r_param03 <= i_update_val[20:0];
        else if (w_set_initial_param03) r_param03 <= i_initial_val[20:0];

        if (w_set_update_param10)       r_param10 <= i_update_val[20:0];
        else if (w_set_initial_param10) r_param10 <= i_initial_val[20:0];

        if (w_set_update_param11)       r_param11 <= i_update_val[20:0];
        else if (w_set_initial_param11) r_param11 <= i_initial_val[20:0];

`ifdef VTX_PARAM1_REDUCE
`else
        if (w_set_update_param12)       r_param12 <= i_update_val[20:0];
        else if (w_set_initial_param12) r_param12 <= i_initial_val[20:0];

        if (w_set_update_param13)       r_param13 <= i_update_val[20:0];
        else if (w_set_initial_param13) r_param13 <= i_initial_val[20:0];
`endif
    end

    // output registers
    always @(posedge clk_core) begin
        if (w_set_x) r_fx <= i_update_x;
        if (w_set_z) r_fz <= i_update_z;
        if (w_set_cr) r_cr <= i_update_color;
        if (w_set_cg) r_cg <= i_update_color;
        if (w_set_cb) r_cb <= i_update_color;
        if (w_set_ca) r_ca <= i_update_color;
        if (w_set_tu) r_tu <= i_update_frag;
        if (w_set_tv) r_tv <= i_update_frag;
    end

endmodule
