//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_edge_ctrl.v
//
// Abstract:
//   edge select control
//
//  Created:
//    8 September 2008
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

module fm_3d_ru_outline_edge_ctrl (
    clk_core,
    rst_x,
    // outline parameters
    i_valid,
    i_ml,
    i_is_first,
    i_is_second,
    // idle state indicator
    o_idle,
    //   edge0
    i_start_x_e0,
    i_start_x_05_e0,
    i_start_y_e0,
    i_end_y_e0,
    i_delta_e0,
    i_delta_t_e0,
    i_delta_a_e0,
    //   edge1
    i_start_x_e1,
    i_start_x_05_e1,
    i_start_y_e1,
    i_end_y_e1,
    i_delta_e1,
    i_delta_t_e1,
    i_delta_a_e1,
    //   edge2
    i_start_x_e2,
    i_start_x_05_e2,
    i_start_y_e2,
    i_end_y_e2,
    i_delta_e2,
    i_delta_t_e2,
    i_delta_a_e2,
    o_ack,
    // triangle data
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
    // control flag
    o_has_bottom,
    // left edge data out
    o_valid_l,
    o_start_x_l,
    o_start_x_05_l,
    o_start_y_l,
    o_end_y_l,
    o_delta_l,
    o_delta_t_l,
    o_delta_a_l,
    i_ack_l,
    // left vertex parameters
    o_z_s_l,
    o_iw_s_l,
    o_p00_s_l,
    o_p01_s_l,
    o_p02_s_l,
    o_p03_s_l,
    o_p10_s_l,
    o_p11_s_l,
`ifdef VTX_PARAM1_REDUCE
`else
    o_p12_s_l,
    o_p13_s_l,
`endif
    o_z_e_l,
    o_iw_e_l,
    o_p00_e_l,
    o_p01_e_l,
    o_p02_e_l,
    o_p03_e_l,
    o_p10_e_l,
    o_p11_e_l,
`ifdef VTX_PARAM1_REDUCE
`else
    o_p12_e_l,
    o_p13_e_l,
`endif
    // right edge data out
    o_valid_r,
    o_start_x_r,
    o_start_x_05_r,
    o_start_y_r,
    o_end_y_r,
    o_delta_r,
    o_delta_t_r,
    o_delta_a_r,
    i_ack_r,
    // right vertex parameters
    o_z_s_r,
    o_iw_s_r,
    o_p00_s_r,
    o_p01_s_r,
    o_p02_s_r,
    o_p03_s_r,
    o_p10_s_r,
    o_p11_s_r,
`ifdef VTX_PARAM1_REDUCE
`else
    o_p12_s_r,
    o_p13_s_r,
`endif
    o_z_e_r,
    o_iw_e_r,
    o_p00_e_r,
    o_p01_e_r,
    o_p02_e_r,
    o_p03_e_r,
    o_p10_e_r,
    o_p11_e_r
`ifdef VTX_PARAM1_REDUCE
`else
    ,o_p12_e_r,
    o_p13_e_r
`endif
);

////////////////////////////
// parameter
////////////////////////////
    parameter P_IDLE       = 2'b00;
    parameter P_FIRST_TRI  = 2'b01;
    parameter P_SECOND_TRI = 2'b10;
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // outline parameters
    input         i_valid;
    input         i_ml;
    input         i_is_first;
    input         i_is_second;
    // idle state indicator
    output        o_idle;
    //   edge0
    input  [20:0] i_start_x_e0;
    input  [20:0] i_start_x_05_e0;
    input  [20:0] i_start_y_e0;
    input  [20:0] i_end_y_e0;
    input  [21:0] i_delta_e0;
    input  [21:0] i_delta_t_e0;
    input  [21:0] i_delta_a_e0;
    //   edge1
    input  [20:0] i_start_x_e1;
    input  [20:0] i_start_x_05_e1;
    input  [20:0] i_start_y_e1;
    input  [20:0] i_end_y_e1;
    input  [21:0] i_delta_e1;
    input  [21:0] i_delta_t_e1;
    input  [21:0] i_delta_a_e1;
    //   edge2
    input  [20:0] i_start_x_e2;
    input  [20:0] i_start_x_05_e2;
    input  [20:0] i_start_y_e2;
    input  [20:0] i_end_y_e2;
    input  [21:0] i_delta_e2;
    input  [21:0] i_delta_t_e2;
    input  [21:0] i_delta_a_e2;
    output        o_ack;
    // triangle data
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
    // control flag
    output        o_has_bottom;
    // left edge data out
    output        o_valid_l;
    output [20:0] o_start_x_l;
    output [20:0] o_start_x_05_l;
    output [20:0] o_start_y_l;
    output [20:0] o_end_y_l;
    output [21:0] o_delta_l;
    output [21:0] o_delta_t_l;
    output [21:0] o_delta_a_l;
    input         i_ack_l;
    // left vertex parameters
    output [20:0] o_z_s_l;
    output [20:0] o_iw_s_l;
    output [20:0] o_p00_s_l;
    output [20:0] o_p01_s_l;
    output [20:0] o_p02_s_l;
    output [20:0] o_p03_s_l;
    output [20:0] o_p10_s_l;
    output [20:0] o_p11_s_l;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_p12_s_l;
    output [20:0] o_p13_s_l;
`endif
    output [20:0] o_z_e_l;
    output [20:0] o_iw_e_l;
    output [20:0] o_p00_e_l;
    output [20:0] o_p01_e_l;
    output [20:0] o_p02_e_l;
    output [20:0] o_p03_e_l;
    output [20:0] o_p10_e_l;
    output [20:0] o_p11_e_l;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_p12_e_l;
    output [20:0] o_p13_e_l;
`endif
    // right edge data out
    output        o_valid_r;
    output [20:0] o_start_x_r;
    output [20:0] o_start_x_05_r;
    output [20:0] o_start_y_r;
    output [20:0] o_end_y_r;
    output [21:0] o_delta_r;
    output [21:0] o_delta_t_r;
    output [21:0] o_delta_a_r;
    input         i_ack_r;
    // righr vertex parameters
    output [20:0] o_z_s_r;
    output [20:0] o_iw_s_r;
    output [20:0] o_p00_s_r;
    output [20:0] o_p01_s_r;
    output [20:0] o_p02_s_r;
    output [20:0] o_p03_s_r;
    output [20:0] o_p10_s_r;
    output [20:0] o_p11_s_r;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_p12_s_r;
    output [20:0] o_p13_s_r;
`endif
    output [20:0] o_z_e_r;
    output [20:0] o_iw_e_r;
    output [20:0] o_p00_e_r;
    output [20:0] o_p01_e_r;
    output [20:0] o_p02_e_r;
    output [20:0] o_p03_e_r;
    output [20:0] o_p10_e_r;
    output [20:0] o_p11_e_r;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_p12_e_r;
    output [20:0] o_p13_e_r;
`endif

////////////////////////////
// reg
////////////////////////////
    reg    [1:0] r_state;
////////////////////////////
// wire
////////////////////////////
    wire   [20:0] w_start_x_fs;
    wire   [20:0] w_start_x_05_fs;
    wire   [20:0] w_start_y_fs;
    wire   [20:0] w_end_y_fs;
    wire   [21:0] w_delta_fs;
    wire   [21:0] w_delta_t_fs;
    wire   [21:0] w_delta_a_fs;
    wire   [20:0] w_z_s_fs;
    wire   [20:0] w_iw_s_fs;
    wire   [20:0] w_p00_s_fs;
    wire   [20:0] w_p01_s_fs;
    wire   [20:0] w_p02_s_fs;
    wire   [20:0] w_p03_s_fs;
    wire   [20:0] w_p10_s_fs;
    wire   [20:0] w_p11_s_fs;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_p12_s_fs;
    wire   [20:0] w_p13_s_fs;
`endif
    wire   [20:0] w_z_e_fs;
    wire   [20:0] w_iw_e_fs;
    wire   [20:0] w_p00_e_fs;
    wire   [20:0] w_p01_e_fs;
    wire   [20:0] w_p02_e_fs;
    wire   [20:0] w_p03_e_fs;
    wire   [20:0] w_p10_e_fs;
    wire   [20:0] w_p11_e_fs;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_p12_e_fs;
    wire   [20:0] w_p13_e_fs;
`endif

////////////////////////////
// assign
////////////////////////////
    // first/second selection
    assign w_start_x_fs = (r_state == P_FIRST_TRI) ? i_start_x_e1 : i_start_x_e2;
    assign w_start_x_05_fs = (r_state == P_FIRST_TRI) ? i_start_x_05_e1 : i_start_x_05_e2;
    assign w_start_y_fs = (r_state == P_FIRST_TRI) ? i_start_y_e1 : i_start_y_e2;
    assign w_end_y_fs = (r_state == P_FIRST_TRI) ? i_end_y_e1 : i_end_y_e2;
    assign w_delta_fs = (r_state == P_FIRST_TRI) ? i_delta_e1 : i_delta_e2;
    assign w_delta_t_fs = (r_state == P_FIRST_TRI) ? i_delta_t_e1 : i_delta_t_e2;
    assign w_delta_a_fs = (r_state == P_FIRST_TRI) ? i_delta_a_e1 : i_delta_a_e2;
    assign w_z_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_z : i_vtx1_z;
    assign w_iw_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_iw : i_vtx1_iw;
    assign w_p00_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p00 : i_vtx1_p00;
    assign w_p01_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p01 : i_vtx1_p01;
    assign w_p02_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p02 : i_vtx1_p02;
    assign w_p03_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p03 : i_vtx1_p03;
    assign w_p10_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p10 : i_vtx1_p10;
    assign w_p11_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p11 : i_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_p12_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p12 : i_vtx1_p12;
    assign w_p13_s_fs = (r_state == P_FIRST_TRI) ? i_vtx2_p13 : i_vtx1_p13;
`endif

    assign w_z_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_z : i_vtx0_z;
    assign w_iw_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_iw : i_vtx0_iw;
    assign w_p00_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p00 : i_vtx0_p00;
    assign w_p01_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p01 : i_vtx0_p01;
    assign w_p02_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p02 : i_vtx0_p02;
    assign w_p03_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p03 : i_vtx0_p03;
    assign w_p10_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p10 : i_vtx0_p10;
    assign w_p11_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p11 : i_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_p12_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p12 : i_vtx0_p12;
    assign w_p13_e_fs = (r_state == P_FIRST_TRI) ? i_vtx1_p13 : i_vtx0_p13;
`endif

    // left edge data out
    assign o_valid_l = (r_state != P_IDLE);

    assign o_start_x_l = (!i_ml)    ? i_start_x_e0 : w_start_x_fs;
    assign o_start_x_05_l = (!i_ml) ? i_start_x_05_e0 : w_start_x_05_fs;
    assign o_start_y_l = (!i_ml)    ? i_start_y_e0 : w_start_y_fs;
    assign o_end_y_l = (!i_ml)      ? i_end_y_e0 : w_end_y_fs;
    assign o_delta_l = (!i_ml)      ? i_delta_e0 : w_delta_fs;
    assign o_delta_t_l = (!i_ml)    ? i_delta_t_e0 : w_delta_t_fs;
    assign o_delta_a_l = (!i_ml)    ? i_delta_a_e0 : w_delta_a_fs;
    // right edge data out
    assign o_valid_r = (r_state != P_IDLE);

    assign o_start_x_r = (i_ml)     ? i_start_x_e0 : w_start_x_fs;
    assign o_start_x_05_r = (i_ml)  ? i_start_x_05_e0 : w_start_x_05_fs;
    assign o_start_y_r = (i_ml)     ? i_start_y_e0 : w_start_y_fs;
    assign o_end_y_r = (i_ml)       ? i_end_y_e0 : w_end_y_fs;
    assign o_delta_r = (i_ml)       ? i_delta_e0 : w_delta_fs;
    assign o_delta_t_r = (i_ml)     ? i_delta_t_e0 : w_delta_t_fs;
    assign o_delta_a_r = (i_ml)     ? i_delta_a_e0 : w_delta_a_fs;

    // left vertex parameters
    assign o_z_s_l =  (!i_ml) ? i_vtx2_z : w_z_s_fs;
    assign o_iw_s_l = (!i_ml) ? i_vtx2_iw : w_iw_s_fs;
    assign o_p00_s_l = (!i_ml) ? i_vtx2_p00 : w_p00_s_fs;
    assign o_p01_s_l = (!i_ml) ? i_vtx2_p01 : w_p01_s_fs;
    assign o_p02_s_l = (!i_ml) ? i_vtx2_p02 : w_p02_s_fs;
    assign o_p03_s_l = (!i_ml) ? i_vtx2_p03 : w_p03_s_fs;
    assign o_p10_s_l = (!i_ml) ? i_vtx2_p10 : w_p10_s_fs;
    assign o_p11_s_l = (!i_ml) ? i_vtx2_p11 : w_p11_s_fs;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_p12_s_l = (!i_ml) ? i_vtx2_p12 : w_p12_s_fs;
    assign o_p13_s_l = (!i_ml) ? i_vtx2_p13 : w_p13_s_fs;
`endif

    assign o_z_e_l  = (!i_ml) ? i_vtx0_z : w_z_e_fs;
    assign o_iw_e_l = (!i_ml) ? i_vtx0_iw : w_iw_e_fs;
    assign o_p00_e_l = (!i_ml) ? i_vtx0_p00 : w_p00_e_fs;
    assign o_p01_e_l = (!i_ml) ? i_vtx0_p01 : w_p01_e_fs;
    assign o_p02_e_l = (!i_ml) ? i_vtx0_p02 : w_p02_e_fs;
    assign o_p03_e_l = (!i_ml) ? i_vtx0_p03 : w_p03_e_fs;
    assign o_p10_e_l = (!i_ml) ? i_vtx0_p10 : w_p10_e_fs;
    assign o_p11_e_l = (!i_ml) ? i_vtx0_p11 : w_p11_e_fs;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_p12_e_l = (!i_ml) ? i_vtx0_p12 : w_p12_e_fs;
    assign o_p13_e_l = (!i_ml) ? i_vtx0_p13 : w_p13_e_fs;
`endif

    // right vertex parameters
    assign o_z_s_r  = (i_ml) ? i_vtx2_z : w_z_s_fs;
    assign o_iw_s_r = (i_ml) ? i_vtx2_iw : w_iw_s_fs;
    assign o_p00_s_r = (i_ml) ? i_vtx2_p00 : w_p00_s_fs;
    assign o_p01_s_r = (i_ml) ? i_vtx2_p01 : w_p01_s_fs;
    assign o_p02_s_r = (i_ml) ? i_vtx2_p02 : w_p02_s_fs;
    assign o_p03_s_r = (i_ml) ? i_vtx2_p03 : w_p03_s_fs;
    assign o_p10_s_r = (i_ml) ? i_vtx2_p10 : w_p10_s_fs;
    assign o_p11_s_r = (i_ml) ? i_vtx2_p11 : w_p11_s_fs;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_p12_s_r = (i_ml) ? i_vtx2_p12 : w_p12_s_fs;
    assign o_p13_s_r = (i_ml) ? i_vtx2_p13 : w_p13_s_fs;
`endif
    assign o_z_e_r  = (i_ml) ? i_vtx0_z : w_z_e_fs;
    assign o_iw_e_r = (i_ml) ? i_vtx0_iw : w_iw_e_fs;
    assign o_p00_e_r = (i_ml) ? i_vtx0_p00 : w_p00_e_fs;
    assign o_p01_e_r = (i_ml) ? i_vtx0_p01 : w_p01_e_fs;
    assign o_p02_e_r = (i_ml) ? i_vtx0_p02 : w_p02_e_fs;
    assign o_p03_e_r = (i_ml) ? i_vtx0_p03 : w_p03_e_fs;
    assign o_p10_e_r = (i_ml) ? i_vtx0_p10 : w_p10_e_fs;
    assign o_p11_e_r = (i_ml) ? i_vtx0_p11 : w_p11_e_fs;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_p12_e_r = (i_ml) ? i_vtx0_p12 : w_p12_e_fs;
    assign o_p13_e_r = (i_ml) ? i_vtx0_p13 : w_p13_e_fs;
`endif

    assign o_ack = ((r_state == P_FIRST_TRI)&!i_is_second & i_ack_l) |
                   ((r_state == P_SECOND_TRI)& i_ack_l);

    assign o_has_bottom = (r_state == P_SECOND_TRI);
    assign o_idle = (r_state == P_IDLE);

////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE: begin
                    if (i_valid) begin
                        if (i_is_first) r_state <= P_FIRST_TRI;
                        else r_state <= P_SECOND_TRI;
                    end
                end
                P_FIRST_TRI: begin
                    if (i_ack_r|i_ack_l) begin
                        if (i_is_second) r_state <= P_SECOND_TRI;
                        else r_state <= P_IDLE;
                    end
                end
                P_SECOND_TRI: begin
                    if (i_ack_r|i_ack_l) r_state <= P_IDLE;
                end
            endcase
        end
    end



endmodule
