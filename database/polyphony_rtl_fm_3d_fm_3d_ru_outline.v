//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline.v
//
// Abstract:
//   Generate triangle outline edge
//
//  Created:
//    29 August 2008
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

module fm_3d_ru_outline (
    clk_core,
    rst_x,
    // triangle data
    i_valid,
    i_ml,
    o_ack,
    i_vtx0_x,
    i_vtx0_y,
    i_vtx0_z,
    i_vtx0_iw,
    i_vtx0_p00,
    i_vtx0_p01,
    i_vtx0_p02,
    i_vtx0_p03,
    i_vtx0_p10,
    i_vtx0_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_vtx0_p12,
    i_vtx0_p13,
`endif
    i_vtx1_x,
    i_vtx1_y,
    i_vtx1_z,
    i_vtx1_iw,
    i_vtx1_p00,
    i_vtx1_p01,
    i_vtx1_p02,
    i_vtx1_p03,
    i_vtx1_p10,
    i_vtx1_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_vtx1_p12,
    i_vtx1_p13,
`endif
    i_vtx2_x,
    i_vtx2_y,
    i_vtx2_z,
    i_vtx2_iw,
    i_vtx2_p00,
    i_vtx2_p01,
    i_vtx2_p02,
    i_vtx2_p03,
    i_vtx2_p10,
    i_vtx2_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_vtx2_p12,
    i_vtx2_p13,
`endif
    // control registers
    i_aa_en,
    i_attr0_en,
    i_attr0_size,
    i_attr0_kind,
    i_attr1_en,
    i_attr1_size,
    i_attr1_kind,
    o_idle,
    // edge data
    o_valid,
    o_aa_mode,
    i_ack,
    // edge data left
    o_x_l,
    o_y_l,
    o_z_l,
    o_iw_l,
    o_param00_l,
    o_param01_l,
    o_param02_l,
    o_param03_l,
    o_param10_l,
    o_param11_l,
`ifdef VTX_PARAM1_REDUCE
`else
    o_param12_l,
    o_param13_l,
`endif
    // edge data right
    o_x_r,
    o_y_r,
    o_z_r,
    o_iw_r,
    o_param00_r,
    o_param01_r,
    o_param02_r,
    o_param03_r,
    o_param10_r,
    o_param11_r
`ifdef VTX_PARAM1_REDUCE
`else
    ,o_param12_r,
    o_param13_r
`endif
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // triangle data
    input         i_valid;
    input         i_ml;
    output        o_ack;
    input  [20:0] i_vtx0_x;
    input  [20:0] i_vtx0_y;
    input  [20:0] i_vtx0_z;
    input  [20:0] i_vtx0_iw;
    input  [20:0] i_vtx0_p00;
    input  [20:0] i_vtx0_p01;
    input  [20:0] i_vtx0_p02;
    input  [20:0] i_vtx0_p03;
    input  [20:0] i_vtx0_p10;
    input  [20:0] i_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_vtx0_p12;
    input  [20:0] i_vtx0_p13;
`endif
    input  [20:0] i_vtx1_x;
    input  [20:0] i_vtx1_y;
    input  [20:0] i_vtx1_z;
    input  [20:0] i_vtx1_iw;
    input  [20:0] i_vtx1_p00;
    input  [20:0] i_vtx1_p01;
    input  [20:0] i_vtx1_p02;
    input  [20:0] i_vtx1_p03;
    input  [20:0] i_vtx1_p10;
    input  [20:0] i_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_vtx1_p12;
    input  [20:0] i_vtx1_p13;
`endif
    input  [20:0] i_vtx2_x;
    input  [20:0] i_vtx2_y;
    input  [20:0] i_vtx2_z;
    input  [20:0] i_vtx2_iw;
    input  [20:0] i_vtx2_p00;
    input  [20:0] i_vtx2_p01;
    input  [20:0] i_vtx2_p02;
    input  [20:0] i_vtx2_p03;
    input  [20:0] i_vtx2_p10;
    input  [20:0] i_vtx2_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_vtx2_p12;
    input  [20:0] i_vtx2_p13;
`endif
    // control registers
    input         i_aa_en;
    input         i_attr0_en;
    input  [1:0]  i_attr0_size;
    input  [1:0]  i_attr0_kind;
    input         i_attr1_en;
    input  [1:0]  i_attr1_size;
    input  [1:0]  i_attr1_kind;
    output        o_idle;
    // edge data
    output        o_valid;
    output        o_aa_mode;
    input         i_ack;
    // edge data left
    output [20:0] o_x_l;
    output [8:0]  o_y_l;
    output [20:0] o_z_l;
    output [20:0] o_iw_l;
    output [20:0] o_param00_l;
    output [20:0] o_param01_l;
    output [20:0] o_param02_l;
    output [20:0] o_param03_l;
    output [20:0] o_param10_l;
    output [20:0] o_param11_l;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_param12_l;
    output [20:0] o_param13_l;
`endif
    // edge data right
    output [20:0] o_x_r;
    output [8:0]  o_y_r;
    output [20:0] o_z_r;
    output [20:0] o_iw_r;
    output [20:0] o_param00_r;
    output [20:0] o_param01_r;
    output [20:0] o_param02_r;
    output [20:0] o_param03_r;
    output [20:0] o_param10_r;
    output [20:0] o_param11_r;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_param12_r;
    output [20:0] o_param13_r;
`endif

////////////////////////////
// wire
////////////////////////////
    // outline parameters
    wire          w_is_first;
    wire          w_is_second;
    wire          w_valid;
    wire          w_aa_mode;
    //   edge0
    wire   [20:0] w_start_x_e0;
    wire   [20:0] w_start_x_05_e0;
    wire   [20:0] w_start_y_e0;
    wire   [20:0] w_end_y_e0;
    wire   [21:0] w_delta_e0;
    wire   [21:0] w_delta_t_e0;
    wire   [21:0] w_delta_a_e0;
    //   edge1
    wire   [20:0] w_start_x_e1;
    wire   [20:0] w_start_x_05_e1;
    wire   [20:0] w_start_y_e1;
    wire   [20:0] w_end_y_e1;
    wire   [21:0] w_delta_e1;
    wire   [21:0] w_delta_t_e1;
    wire   [21:0] w_delta_a_e1;
    //   edge2
    wire   [20:0] w_start_x_e2;
    wire   [20:0] w_start_x_05_e2;
    wire   [20:0] w_start_y_e2;
    wire   [20:0] w_end_y_e2;
    wire   [21:0] w_delta_e2;
    wire   [21:0] w_delta_t_e2;
    wire   [21:0] w_delta_a_e2;
    wire          w_ack;

    wire          w_valid_l;
    wire          w_valid_r;

    wire          w_idle_setup;
    wire          w_idle_edge;

////////////////////////////
// assign
////////////////////////////
    assign o_valid = w_valid_l & w_valid_r;
    assign o_idle = w_idle_setup & w_idle_edge;
    assign o_aa_mode = w_aa_mode;
////////////////////////////
// module instance
////////////////////////////

    fm_3d_ru_outline_setup outline_setup (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // control registers
        .i_aa_en(i_aa_en),
        // triangle data
        .i_valid(i_valid),
        .o_ack(o_ack),
        .i_vtx0_x(i_vtx0_x),
        .i_vtx0_y(i_vtx0_y),
        .i_vtx1_x(i_vtx1_x),
        .i_vtx1_y(i_vtx1_y),
        .i_vtx2_x(i_vtx2_x),
        .i_vtx2_y(i_vtx2_y),
        // parameter out
        .o_valid(w_valid),
        .o_is_first(w_is_first),
        .o_is_second(w_is_second),
        .o_aa_mode(w_aa_mode),
        // idle state indicator
        .o_idle(w_idle_setup),
        //   edge0
        .o_start_x_e0(w_start_x_e0),
        .o_start_x_05_e0(w_start_x_05_e0),
        .o_start_y_e0(w_start_y_e0),
        .o_end_y_e0(w_end_y_e0),
        .o_delta_e0(w_delta_e0),
        .o_delta_t_e0(w_delta_t_e0),
        .o_delta_a_e0(w_delta_a_e0),
        //   edge1
        .o_start_x_e1(w_start_x_e1),
        .o_start_x_05_e1(w_start_x_05_e1),
        .o_start_y_e1(w_start_y_e1),
        .o_end_y_e1(w_end_y_e1),
        .o_delta_e1(w_delta_e1),
        .o_delta_t_e1(w_delta_t_e1),
        .o_delta_a_e1(w_delta_a_e1),
        //   edge2
        .o_start_x_e2(w_start_x_e2),
        .o_start_x_05_e2(w_start_x_05_e2),
        .o_start_y_e2(w_start_y_e2),
        .o_end_y_e2(w_end_y_e2),
        .o_delta_e2(w_delta_e2),
        .o_delta_t_e2(w_delta_t_e2),
        .o_delta_a_e2(w_delta_a_e2),
        .i_ack(w_ack)
    );


    fm_3d_ru_outline_edge outline_edge (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // outline parameters
        .i_ml(i_ml),
        .i_is_first(w_is_first),
        .i_is_second(w_is_second),
        .i_valid(w_valid),
        .i_aa_mode(w_aa_mode),
        // idle state indicator
        .o_idle(w_idle_edge),
        //   edge0
        .i_start_x_e0(w_start_x_e0),
        .i_start_x_05_e0(w_start_x_05_e0),
        .i_start_y_e0(w_start_y_e0),
        .i_end_y_e0(w_end_y_e0),
        .i_delta_e0(w_delta_e0),
        .i_delta_t_e0(w_delta_t_e0),
        .i_delta_a_e0(w_delta_a_e0),
        //   edge1
        .i_start_x_e1(w_start_x_e1),
        .i_start_x_05_e1(w_start_x_05_e1),
        .i_start_y_e1(w_start_y_e1),
        .i_end_y_e1(w_end_y_e1),
        .i_delta_e1(w_delta_e1),
        .i_delta_t_e1(w_delta_t_e1),
        .i_delta_a_e1(w_delta_a_e1),
        //   edge2
        .i_start_x_e2(w_start_x_e2),
        .i_start_x_05_e2(w_start_x_05_e2),
        .i_start_y_e2(w_start_y_e2),
        .i_end_y_e2(w_end_y_e2),
        .i_delta_e2(w_delta_e2),
        .i_delta_t_e2(w_delta_t_e2),
        .i_delta_a_e2(w_delta_a_e2),
        .o_ack(w_ack),
        // triangle data
        .i_vtx0_z(i_vtx0_z),
        .i_vtx0_iw(i_vtx0_iw),
        .i_vtx0_p00(i_vtx0_p00),
        .i_vtx0_p01(i_vtx0_p01),
        .i_vtx0_p02(i_vtx0_p02),
        .i_vtx0_p03(i_vtx0_p03),
        .i_vtx0_p10(i_vtx0_p10),
        .i_vtx0_p11(i_vtx0_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx0_p12(i_vtx0_p12),
        .i_vtx0_p13(i_vtx0_p13),
`endif
        .i_vtx1_z(i_vtx1_z),
        .i_vtx1_iw(i_vtx1_iw),
        .i_vtx1_p00(i_vtx1_p00),
        .i_vtx1_p01(i_vtx1_p01),
        .i_vtx1_p02(i_vtx1_p02),
        .i_vtx1_p03(i_vtx1_p03),
        .i_vtx1_p10(i_vtx1_p10),
        .i_vtx1_p11(i_vtx1_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx1_p12(i_vtx1_p12),
        .i_vtx1_p13(i_vtx1_p13),
`endif
        .i_vtx2_z(i_vtx2_z),
        .i_vtx2_iw(i_vtx2_iw),
        .i_vtx2_p00(i_vtx2_p00),
        .i_vtx2_p01(i_vtx2_p01),
        .i_vtx2_p02(i_vtx2_p02),
        .i_vtx2_p03(i_vtx2_p03),
        .i_vtx2_p10(i_vtx2_p10),
        .i_vtx2_p11(i_vtx2_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx2_p12(i_vtx2_p12),
        .i_vtx2_p13(i_vtx2_p13),
`endif
        // control registers
        .i_param0_en(i_attr0_en),
        .i_param1_en(i_attr1_en),
        .i_param0_size(i_attr0_size),
        .i_param1_size(i_attr1_size),
        // output left
        .o_valid_l(w_valid_l),
        .i_busy_l(!i_ack),
        .o_x_l(o_x_l),
        .o_y_l(o_y_l),
        .o_z_l(o_z_l),
        .o_iw_l(o_iw_l),
        .o_param00_l(o_param00_l),
        .o_param01_l(o_param01_l),
        .o_param02_l(o_param02_l),
        .o_param03_l(o_param03_l),
        .o_param10_l(o_param10_l),
        .o_param11_l(o_param11_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_param12_l(o_param12_l),
        .o_param13_l(o_param13_l),
`endif
        // output right
        .o_valid_r(w_valid_r),
        .i_busy_r(!i_ack),
        .o_x_r(o_x_r),
        .o_y_r(o_y_r),
        .o_z_r(o_z_r),
        .o_iw_r(o_iw_r),
        .o_param00_r(o_param00_r),
        .o_param01_r(o_param01_r),
        .o_param02_r(o_param02_r),
        .o_param03_r(o_param03_r),
        .o_param10_r(o_param10_r),
        .o_param11_r(o_param11_r)
`ifdef VTX_PARAM1_REDUCE
`else
        ,.o_param12_r(o_param12_r),
        .o_param13_r(o_param13_r)
`endif
    );

endmodule
