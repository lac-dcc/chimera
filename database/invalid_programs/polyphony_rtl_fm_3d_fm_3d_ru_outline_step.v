//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_step.v
//
// Abstract:
//   generate outline edge steps
//
//  Created:
//    16 December 2008
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

module fm_3d_ru_outline_step (
    clk_core,
    rst_x,
    // outline parameter input
    i_start,
    o_finish,
    i_delta_t,
    // vertex parameters
    i_start_x,
    i_start_y,
    i_delta_x,
    i_z_s,
    i_iw_s,
    i_param00_s,
    i_param01_s,
    i_param02_s,
    i_param03_s,
    i_param10_s,
    i_param11_s,
`ifdef VTX_PARAM1_REDUCE
`else
    i_param12_s,
    i_param13_s,
`endif
    i_z_e,
    i_iw_e,
    i_param00_e,
    i_param01_e,
    i_param02_e,
    i_param03_e,
    i_param10_e,
    i_param11_e,
`ifdef VTX_PARAM1_REDUCE
`else
    i_param12_e,
    i_param13_e,
`endif
    // control registers
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    // output
    o_valid,
    o_param_kind,
    o_initial_val,
    o_step_val
);
////////////////////////////
// parameter
////////////////////////////
    parameter P_SETUP_X     = 4'h0;
    parameter P_SETUP_Y     = 4'h1;
    parameter P_SETUP_IW    = 4'h2;
    parameter P_SETUP_Z     = 4'h3;
    parameter P_SETUP_P00   = 4'h4;
    parameter P_SETUP_P01   = 4'h5;
    parameter P_SETUP_P02   = 4'h6;
    parameter P_SETUP_P03   = 4'h7;
    parameter P_SETUP_P10   = 4'h8;
    parameter P_SETUP_P11   = 4'h9;
    parameter P_SETUP_P12   = 4'ha;
    parameter P_SETUP_P13   = 4'hb;
    parameter P_SETUP_WAIT  = 4'hc;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // outline parameter input
    input         i_start;
    output        o_finish;
    input  [21:0] i_delta_t;
    // vertex parameters
    input  [20:0] i_start_x;
    input  [20:0] i_start_y;
    input  [21:0] i_delta_x;
    input  [20:0] i_z_s;
    input  [20:0] i_iw_s;
    input  [20:0] i_param00_s;
    input  [20:0] i_param01_s;
    input  [20:0] i_param02_s;
    input  [20:0] i_param03_s;
    input  [20:0] i_param10_s;
    input  [20:0] i_param11_s;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_param12_s;
    input  [20:0] i_param13_s;
`endif
    input  [20:0] i_z_e;
    input  [20:0] i_iw_e;
    input  [20:0] i_param00_e;
    input  [20:0] i_param01_e;
    input  [20:0] i_param02_e;
    input  [20:0] i_param03_e;
    input  [20:0] i_param10_e;
    input  [20:0] i_param11_e;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_param12_e;
    input  [20:0] i_param13_e;
`endif
    // control registers
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    // output
    output        o_valid;
    output [3:0]  o_param_kind;
    output [21:0] o_initial_val;
    output [21:0] o_step_val;
////////////////////////////
// reg
////////////////////////////
    reg    [3:0]  r_state;
////////////////////////////
// wire
////////////////////////////
    wire  [20:0]  w_end_p;
    wire  [20:0]  w_start_p;
    wire          w_apply_iw;
    wire          w_valid;
    wire          w_end_flag;
    wire          w_end_flag_z;
    wire          w_end_flag_p00;
    wire          w_end_flag_p01;
    wire          w_end_flag_p02;
    wire          w_end_flag_p03;
    wire          w_end_flag_p10;
    wire          w_end_flag_p11;
    wire          w_end_flag_p12;
    wire  [3:0]   w_param_kind;
    wire  [21:0]  w_10;

    wire          w_valid_core;
    wire  [3:0]   w_param_kind_core;
    wire  [20:0]  w_initial_val_core;
    wire  [21:0]  w_step_val_core;
////////////////////////////
// assign
////////////////////////////
    assign w_10 = {1'b0, 5'h0f, 16'h8000};
    assign w_valid = (r_state != P_SETUP_WAIT) &
                     (r_state != P_SETUP_X) & (r_state != P_SETUP_Y);

    assign w_apply_iw = (r_state != P_SETUP_IW);
    assign w_end_flag_z   = (r_state == P_SETUP_Z) & !i_param0_en & !i_param1_en;
    assign w_end_flag_p00 = (r_state == P_SETUP_P00) &
                            (i_param0_en & (i_param0_size == 2'd0)) &
                            !i_param1_en;
    assign w_end_flag_p01 = (r_state == P_SETUP_P01) &
                            (i_param0_size == 2'd1) & !i_param1_en;
    assign w_end_flag_p02 = (r_state == P_SETUP_P02) &
                            (i_param0_size == 2'd2) & !i_param1_en;
    assign w_end_flag_p03 = (r_state == P_SETUP_P03) & !i_param1_en;
    assign w_end_flag_p10 = (r_state == P_SETUP_P10) & (i_param1_size == 2'd0);
    assign w_end_flag_p11 = (r_state == P_SETUP_P11) & (i_param1_size == 2'd1);
    assign w_end_flag_p12 = (r_state == P_SETUP_P11) & (i_param1_size == 2'd2);

    assign w_end_flag = w_end_flag_z |
                        w_end_flag_p00 | w_end_flag_p01 | w_end_flag_p02 | w_end_flag_p03|
                        w_end_flag_p10 | w_end_flag_p11 | w_end_flag_p12 | w_end_flag_p03;


`ifdef VTX_PARAM1_REDUCE
    assign w_start_p =  (r_state == P_SETUP_IW)  ? i_iw_s :
                        (r_state == P_SETUP_Z)   ? i_z_s :
                        (r_state == P_SETUP_P00) ? i_param00_s :
                        (r_state == P_SETUP_P01) ? i_param01_s :
                        (r_state == P_SETUP_P02) ? i_param02_s :
                        (r_state == P_SETUP_P03) ? i_param03_s :
                        (r_state == P_SETUP_P10) ? i_param10_s :
                                                   i_param11_s ;

    assign w_end_p   =  (r_state == P_SETUP_IW)  ? i_iw_e :
                        (r_state == P_SETUP_Z)   ? i_z_e :
                        (r_state == P_SETUP_P00) ? i_param00_e :
                        (r_state == P_SETUP_P01) ? i_param01_e :
                        (r_state == P_SETUP_P02) ? i_param02_e :
                        (r_state == P_SETUP_P03) ? i_param03_e :
                        (r_state == P_SETUP_P10) ? i_param10_e :
                                                   i_param11_e ;

`else

    assign w_start_p =  (r_state == P_SETUP_IW)  ? i_iw_s :
                        (r_state == P_SETUP_Z)   ? i_z_s :
                        (r_state == P_SETUP_P00) ? i_param00_s :
                        (r_state == P_SETUP_P01) ? i_param01_s :
                        (r_state == P_SETUP_P02) ? i_param02_s :
                        (r_state == P_SETUP_P03) ? i_param03_s :
                        (r_state == P_SETUP_P10) ? i_param10_s :
                        (r_state == P_SETUP_P11) ? i_param11_s :
                        (r_state == P_SETUP_P12) ? i_param12_s :
                                                   i_param13_s;

    assign w_end_p   =  (r_state == P_SETUP_IW)  ? i_iw_e :
                        (r_state == P_SETUP_Z)   ? i_z_e :
                        (r_state == P_SETUP_P00) ? i_param00_e :
                        (r_state == P_SETUP_P01) ? i_param01_e :
                        (r_state == P_SETUP_P02) ? i_param02_e :
                        (r_state == P_SETUP_P03) ? i_param03_e :
                        (r_state == P_SETUP_P10) ? i_param10_e :
                        (r_state == P_SETUP_P11) ? i_param11_e :
                        (r_state == P_SETUP_P12) ? i_param12_e :
                                                   i_param13_e;


`endif



    assign w_param_kind = (r_state == P_SETUP_IW)  ? `FPARAM_IW :
                          (r_state == P_SETUP_Z)   ? `FPARAM_Z :
                          (r_state == P_SETUP_P00) ? `FPARAM_P00 :
                          (r_state == P_SETUP_P01) ? `FPARAM_P01 :
                          (r_state == P_SETUP_P02) ? `FPARAM_P02 :
                          (r_state == P_SETUP_P03) ? `FPARAM_P03 :
                          (r_state == P_SETUP_P10) ? `FPARAM_P10 :
                          (r_state == P_SETUP_P11) ? `FPARAM_P11 :
                          (r_state == P_SETUP_P12) ? `FPARAM_P12 :
                                                     `FPARAM_P13;

    assign o_valid = w_valid_core | (r_state == P_SETUP_Y) |
                     ((r_state == P_SETUP_X)&i_start);

                          
    assign o_param_kind = (r_state == P_SETUP_X)   ? `FPARAM_X :
                          (r_state == P_SETUP_Y)   ? `FPARAM_Y : 
                                                      w_param_kind_core;
    assign o_initial_val = (r_state == P_SETUP_X)   ? i_start_x:
                           (r_state == P_SETUP_Y)   ? i_start_y:
                                                      w_initial_val_core;
                           
    assign o_step_val = (r_state == P_SETUP_X)   ? i_delta_x :
                        (r_state == P_SETUP_Y)   ? w_10 :
                                                   w_step_val_core;

////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_SETUP_X;
        end else begin
            case (r_state)
                P_SETUP_X: begin
                    if (i_start) r_state <= P_SETUP_Y;
                end
                P_SETUP_Y: begin
                    r_state <= P_SETUP_IW;
                end
                P_SETUP_IW: begin
                    r_state <= P_SETUP_Z;
                end
                P_SETUP_Z: begin
                    if (i_param0_en) r_state <= P_SETUP_P00;
                    else if (i_param1_en) r_state <= P_SETUP_P10;
                    else r_state <= P_SETUP_WAIT;
                end
                P_SETUP_P00: begin
                    if (i_param0_size == 2'd0) begin
                        if (i_param1_en) r_state <= P_SETUP_P10;
                        else  r_state <= P_SETUP_WAIT;
                    end else begin
                        r_state <= P_SETUP_P01;
                    end
                end
                P_SETUP_P01: begin
                    if (i_param0_size == 2'd1) begin
                        if (i_param1_en) r_state <= P_SETUP_P10;
                        else  r_state <= P_SETUP_WAIT;
                    end else begin
                        r_state <= P_SETUP_P02;
                    end
                end
                P_SETUP_P02: begin
                    if (i_param0_size == 2'd2) begin
                        if (i_param1_en) r_state <= P_SETUP_P10;
                        else  r_state <= P_SETUP_WAIT;
                    end else begin
                        r_state <= P_SETUP_P03;
                    end
                end
                P_SETUP_P03: begin
                   if (i_param1_en) r_state <= P_SETUP_P10;
                   else  r_state <= P_SETUP_WAIT;
                end
                P_SETUP_P10: begin
                    if (i_param1_size == 2'd0) begin
                        r_state <= P_SETUP_WAIT;
                    end else begin
                        r_state <= P_SETUP_P11;
                    end
                end
                P_SETUP_P11: begin
                    if (i_param1_size == 2'd1) begin
                        r_state <= P_SETUP_WAIT;
                    end else begin
                        r_state <= P_SETUP_P12;
                    end
                end
                P_SETUP_P12: begin
                    if (i_param1_size == 2'd2) begin
                        r_state <= P_SETUP_WAIT;
                    end else begin
                        r_state <= P_SETUP_P13;
                    end
                end
                P_SETUP_P13: begin
                    r_state <= P_SETUP_WAIT;
                end
                P_SETUP_WAIT: begin
                    if (o_finish) r_state <= P_SETUP_X;
                end
            endcase
        end
    end


////////////////////////////
// module instance
////////////////////////////
    fm_3d_ru_outline_step_core outline_step_core (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_valid(w_valid),
        .i_kind(w_param_kind),
        .i_end_flag(w_end_flag),
        .i_start_p(w_start_p),
        .i_end_p(w_end_p),
        .i_start_iw(i_iw_s),
        .i_end_iw(i_iw_e),
        .i_delta_t(i_delta_t),
        .i_apply_iw(w_apply_iw),
        .o_valid(w_valid_core),
        .o_kind(w_param_kind_core),
        .o_end_flag(o_finish),
        .o_start_p(w_initial_val_core),
        .o_step_p(w_step_val_core)
    );



endmodule
