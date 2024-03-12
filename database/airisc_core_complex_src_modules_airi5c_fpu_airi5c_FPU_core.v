//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//

module airi5c_FPU_core
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input               op_add,
    input               op_sub,
    input               op_mul,
    input               op_div,
    input               op_sqrt,
    input               op_sgnj,
    input               op_sgnjn,
    input               op_sgnjx,
    input               op_cvtfi,
    input               op_cvtfu,
    input               op_cvtif,
    input               op_cvtuf,
    input               op_eq,
    input               op_lt,
    input               op_le,
    input               op_class,
    input               op_min,
    input               op_max,

    input       [2:0]   rm,

    input       [31:0]  a,
    input       [31:0]  b,

    output  reg [31:0]  result,

    output  reg         IV,
    output  reg         DZ,
    output  reg         OF,
    output  reg         UF,
    output  reg         IE,

    output  reg         ready
);

    // input a
    wire    [23:0]  man_a;
    wire    [7:0]   exp_a;
    wire            sgn_a;
    wire            zero_a;
    wire            inf_a;
    wire            sNaN_a;
    wire            qNaN_a;
    wire            denormal_a;
    wire    [23:0]  man_a_norm;
    wire    [9:0]   exp_a_norm;

    // input b
    wire    [23:0]  man_b;
    wire    [7:0]   exp_b;
    wire            sgn_b;
    wire            zero_b;
    wire            inf_b;
    wire            sNaN_b;
    wire            qNaN_b;
    wire            denormal_b;
    wire    [23:0]  man_b_norm;
    wire    [9:0]   exp_b_norm;

    // arithmetic
    wire    [31:0]  result_arith;
    wire            IV_arith;
    wire            DZ_arith;
    wire            OF_arith;
    wire            UF_arith;
    wire            IE_arith;
    wire            ready_arith;
    reg             sel_arith;

    // sign modifier
    wire    [31:0]  result_sgn_mod;
    wire            ready_sgn_mod;
    reg             sel_sgn_mod;

    // ftoi converter
    wire    [31:0]  result_ftoi;
    wire            IV_ftoi;
    wire            IE_ftoi;
    wire            ready_ftoi;
    reg             sel_ftoi;

    // itof converter
    wire    [31:0]  result_itof;
    wire            IE_itof;
    wire            ready_itof;
    reg             sel_itof;

    // comparator
    wire    [31:0]  result_cmp;
    wire            IV_cmp;
    wire            ready_cmp;
    reg             sel_cmp;

    // selector
    wire    [31:0]  result_sel;
    wire            IV_sel;
    wire            ready_sel;
    reg             sel_sel;

    // classifier
    wire    [31:0]  result_class;
    wire            ready_class;
    reg             sel_class;

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            sel_arith   <= 1'b0;
            sel_sgn_mod <= 1'b0;
            sel_ftoi    <= 1'b0;
            sel_itof    <= 1'b0;
            sel_cmp     <= 1'b0;
            sel_sel     <= 1'b0;
            sel_class   <= 1'b0;
        end
        
        else if (kill) begin
            sel_arith   <= 1'b0;
            sel_sgn_mod <= 1'b0;
            sel_ftoi    <= 1'b0;
            sel_itof    <= 1'b0;
            sel_cmp     <= 1'b0;
            sel_sel     <= 1'b0;
            sel_class   <= 1'b0;
        end

        else if (load) begin
            sel_arith   <= op_add || op_sub || op_mul || op_div || op_sqrt;
            sel_sgn_mod <= op_sgnj || op_sgnjn || op_sgnjx;
            sel_ftoi    <= op_cvtfi || op_cvtfu;
            sel_itof    <= op_cvtif || op_cvtuf;
            sel_cmp     <= op_eq || op_lt || op_le;
            sel_sel     <= op_min || op_max;
            sel_class   <= op_class;
        end
    end

    always @(*) begin
        result      = 32'h00000000;
        IV          = 1'b0;
        DZ          = 1'b0;
        OF          = 1'b0;
        UF          = 1'b0;
        IE          = 1'b0;
        ready       = 1'b0;

        if (sel_arith) begin
            result  = result_arith;
            IV      = IV_arith;
            DZ      = DZ_arith;
            OF      = OF_arith;
            UF      = UF_arith;
            IE      = IE_arith;
            ready   = ready_arith;
        end

        else if (sel_sgn_mod) begin
            result  = result_sgn_mod;
            ready   = ready_sgn_mod;
        end

        else if (sel_ftoi) begin
            result  = result_ftoi;
            IV      = IV_ftoi;
            IE      = IE_ftoi;
            ready   = ready_ftoi;
        end

        else if (sel_itof) begin
            result  = result_itof;
            IE      = IE_itof;
            ready   = ready_itof;
        end

        else if (sel_cmp) begin
            result  = result_cmp;
            IV      = IV_cmp;
            ready   = ready_cmp;
        end

        else if (sel_sel) begin
            result  = result_sel;
            IV      = IV_sel;
            ready   = ready_sel;
        end

        else if (sel_class) begin
            result  = result_class;
            ready   = ready_class;
        end
    end

    airi5c_splitter splitter_a
    (
        .float_in(a),

        .man(man_a),
        .Exp(exp_a),
        .sgn(sgn_a),

        .zero(zero_a),
        .inf(inf_a),
        .sNaN(sNaN_a),
        .qNaN(qNaN_a),
        .denormal(denormal_a)
    );

    airi5c_pre_normalizer pre_normalizer_a
    (
        .zero(zero_a),
        .denormal(denormal_a),

        .man_in(man_a),
        .exp_in(exp_a),

        .man_out(man_a_norm),
        .exp_out(exp_a_norm)
    );

    airi5c_splitter splitter_b
    (
        .float_in(b),

        .man(man_b),
        .Exp(exp_b),
        .sgn(sgn_b),

        .zero(zero_b),
        .inf(inf_b),
        .sNaN(sNaN_b),
        .qNaN(qNaN_b),
        .denormal(denormal_b)
    );

    airi5c_pre_normalizer pre_normalizer_b
    (
        .zero(zero_b),
        .denormal(denormal_b),

        .man_in(man_b),
        .exp_in(exp_b),

        .man_out(man_b_norm),
        .exp_out(exp_b_norm)
    );

    airi5c_float_arithmetic float_arithmetic_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_add(op_add),
        .op_sub(op_sub),
        .op_mul(op_mul),
        .op_div(op_div),
        .op_sqrt(op_sqrt),

        .rm(rm),

        .man_a(man_a_norm),
        .exp_a(exp_a_norm),
        .sgn_a(sgn_a),
        .zero_a(zero_a),
        .inf_a(inf_a),
        .sNaN_a(sNaN_a),
        .qNaN_a(qNaN_a),

        .man_b(man_b_norm),
        .exp_b(exp_b_norm),
        .sgn_b(sgn_b),
        .zero_b(zero_b),
        .inf_b(inf_b),
        .sNaN_b(sNaN_b),
        .qNaN_b(qNaN_b),

        .float_out(result_arith),

        .IV(IV_arith),
        .DZ(DZ_arith),
        .OF(OF_arith),
        .UF(UF_arith),
        .IE(IE_arith),

        .ready(ready_arith)
    );

    airi5c_sign_modifier sign_modifier_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_sgnj(op_sgnj),
        .op_sgnjn(op_sgnjn),
        .op_sgnjx(op_sgnjx),

        .a(a),
        .sgn_b(b[31]),

        .float_out(result_sgn_mod),

        .ready(ready_sgn_mod)
    );

    airi5c_ftoi_converter ftoi_converter_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_cvtfi(op_cvtfi),
        .op_cvtfu(op_cvtfu),
        .rm(rm),

        .man(man_a),
        .Exp(exp_a),
        .sgn(sgn_a),
        .zero(zero_a),
        .inf(inf_a),
        .sNaN(sNaN_a),
        .qNaN(qNaN_a),

        .int_out(result_ftoi),

        .IV(IV_ftoi),
        .IE(IE_ftoi),

        .ready(ready_ftoi)
    );

    airi5c_itof_converter itof_converter_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_cvtif(op_cvtif),
        .op_cvtuf(op_cvtuf),
        .rm(rm),

        .int_in(a),
        .float_out(result_itof),
        .IE(IE_itof),

        .ready(ready_itof)
    );

    airi5c_float_comparator_seq float_comparator_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_eq(op_eq),
        .op_lt(op_lt),
        .op_le(op_le),

        .a(a),
        .b(b),

        .int_out(result_cmp),
        .IV(IV_cmp),

        .ready(ready_cmp)
    );

    airi5c_selector selector_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_min(op_min),
        .op_max(op_max),

        .a(a),
        .b(b),

        .float_out(result_sel),
        .IV(IV_sel),

        .ready(ready_sel)
    );

    airi5c_classifier classifier_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_class(op_class),

        .sgn(sgn_a),
        .zero(zero_a),
        .inf(inf_a),
        .sNaN(sNaN_a),
        .qNaN(qNaN_a),
        .denormal(denormal_a),

        .int_out(result_class),

        .ready(ready_class)
    );

endmodule
