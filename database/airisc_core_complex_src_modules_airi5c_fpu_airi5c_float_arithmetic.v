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

module airi5c_float_arithmetic
(
    input           clk,
    input           n_reset,
    input           kill,
    input           load,

    input           op_add,
    input           op_sub,
    input           op_mul,
    input           op_div,
    input           op_sqrt,

    input   [2:0]   rm,

    input   [23:0]  man_a,
    input   [9:0]   exp_a,
    input           sgn_a,
    input           zero_a,
    input           inf_a,
    input           sNaN_a,
    input           qNaN_a,

    input   [23:0]  man_b,
    input   [9:0]   exp_b,
    input           sgn_b,
    input           zero_b,
    input           inf_b,
    input           sNaN_b,
    input           qNaN_b,

    output  [31:0]  float_out,

    output          IV,
    output          DZ,
    output          OF,
    output          UF,
    output          IE,

    output          ready
);

    // adder
    wire    [23:0]  man_y_add;
    wire    [9:0]   exp_y_add;
    wire            sgn_y_add;
    wire            round_bit_add;
    wire            sticky_bit_add;
    wire            IV_add;
    wire            final_res_add;
    wire            ready_add;

    // multiplier
    wire    [23:0]  man_y_mul;
    wire    [9:0]   exp_y_mul;
    wire            sgn_y_mul;
    wire            round_bit_mul;
    wire            sticky_bit_mul;
    wire            IV_mul;
    wire            final_res_mul;
    wire            ready_mul;

    // divider
    wire    [23:0]  man_y_div;
    wire    [9:0]   exp_y_div;
    wire            sgn_y_div;
    wire            round_bit_div;
    wire            sticky_bit_div;
    wire            IV_div;
    wire            DZ_div;
    wire            final_res_div;
    wire            ready_div;

    // square root
    wire    [23:0]  man_y_sqrt;
    wire    [9:0]   exp_y_sqrt;
    wire            sgn_y_sqrt;
    wire            round_bit_sqrt;
    wire            sticky_bit_sqrt;
    wire            IV_sqrt;
    wire            final_res_sqrt;
    wire            ready_sqrt;

    // output
    reg     [23:0]  man_y;
    reg     [9:0]   exp_y;
    reg             sgn_y;
    reg             round_bit;
    reg             sticky_bit;
    reg             IV_int;
    reg             DZ_int;
    reg     [2:0]   reg_rm;
    reg             final_res;

    // output selector
    always @(*) begin
        man_y       = 24'h000000;
        exp_y       = 10'h000;
        sgn_y       = 1'b0;
        round_bit   = 1'b0;
        sticky_bit  = 1'b0;
        IV_int      = 1'b0;
        DZ_int      = 1'b0;
        final_res   = 1'b0;

        if (ready_add) begin
            man_y       = man_y_add;
            exp_y       = exp_y_add;
            sgn_y       = sgn_y_add;
            round_bit   = round_bit_add;
            sticky_bit  = sticky_bit_add;
            IV_int      = IV_add;
            final_res   = final_res_add;
        end

        else if (ready_mul) begin
            man_y       = man_y_mul;
            exp_y       = exp_y_mul;
            sgn_y       = sgn_y_mul;
            round_bit   = round_bit_mul;
            sticky_bit  = sticky_bit_mul;
            IV_int      = IV_mul;
            final_res   = final_res_mul;
        end

        else if (ready_div) begin
            man_y       = man_y_div;
            exp_y       = exp_y_div;
            sgn_y       = sgn_y_div;
            round_bit   = round_bit_div;
            sticky_bit  = sticky_bit_div;
            IV_int      = IV_div;
            DZ_int      = DZ_div;
            final_res   = final_res_div;
        end

        else if (ready_sqrt) begin
            man_y       = man_y_sqrt;
            exp_y       = exp_y_sqrt;
            sgn_y       = sgn_y_sqrt;
            round_bit   = round_bit_sqrt;
            sticky_bit  = sticky_bit_sqrt;
            IV_int      = IV_sqrt;
            final_res   = final_res_sqrt;
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset)
            reg_rm  <= 3'b000;
        
        else if (kill)
            reg_rm  <= 3'b000;
            
        else if (load)
            reg_rm  <= rm;
    end

    airi5c_float_adder float_adder_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),

        .op_add(op_add),
        .op_sub(op_sub),
        .rm(rm),

        .man_a(man_a),
        .exp_a(exp_a),
        .sgn_a(sgn_a),
        .zero_a(zero_a),
        .inf_a(inf_a),
        .sNaN_a(sNaN_a),
        .qNaN_a(qNaN_a),

        .man_b(man_b),
        .exp_b(exp_b),
        .sgn_b(sgn_b),
        .zero_b(zero_b),
        .inf_b(inf_b),
        .sNaN_b(sNaN_b),
        .qNaN_b(qNaN_b),

        .man_y(man_y_add),
        .exp_y(exp_y_add),
        .sgn_y(sgn_y_add),

        .round_bit(round_bit_add),
        .sticky_bit(sticky_bit_add),

        .IV(IV_add),

        .final_res(final_res_add),
        .ready(ready_add)
    );

    airi5c_float_multiplier float_multiplier_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),
        
        .op_mul(op_mul),

        .man_a(man_a),
        .exp_a(exp_a),
        .sgn_a(sgn_a),
        .zero_a(zero_a),
        .inf_a(inf_a),
        .sNaN_a(sNaN_a),
        .qNaN_a(qNaN_a),

        .man_b(man_b),
        .exp_b(exp_b),
        .sgn_b(sgn_b),
        .zero_b(zero_b),
        .inf_b(inf_b),
        .sNaN_b(sNaN_b),
        .qNaN_b(qNaN_b),

        .man_y(man_y_mul),
        .exp_y(exp_y_mul),
        .sgn_y(sgn_y_mul),

        .round_bit(round_bit_mul),
        .sticky_bit(sticky_bit_mul),

        .IV(IV_mul),

        .final_res(final_res_mul),
        .ready(ready_mul)
    );

    airi5c_float_divider float_divider_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),
        
        .op_div(op_div),

        .man_a(man_a),
        .exp_a(exp_a),
        .sgn_a(sgn_a),
        .zero_a(zero_a),
        .inf_a(inf_a),
        .sNaN_a(sNaN_a),
        .qNaN_a(qNaN_a),

        .man_b(man_b),
        .exp_b(exp_b),
        .sgn_b(sgn_b),
        .zero_b(zero_b),
        .inf_b(inf_b),
        .sNaN_b(sNaN_b),
        .qNaN_b(qNaN_b),

        .man_y(man_y_div),
        .exp_y(exp_y_div),
        .sgn_y(sgn_y_div),

        .round_bit(round_bit_div),
        .sticky_bit(sticky_bit_div),

        .IV(IV_div),
        .DZ(DZ_div),

        .final_res(final_res_div),
        .ready(ready_div)
    );

    airi5c_float_sqrt float_sqrt_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(load),
        
        .op_sqrt(op_sqrt),

        .man(man_a),
        .Exp(exp_a),
        .sgn(sgn_a),
        .zero(zero_a),
        .inf(inf_a),
        .sNaN(sNaN_a),
        .qNaN(qNaN_a),

        .man_y(man_y_sqrt),
        .exp_y(exp_y_sqrt),
        .sgn_y(sgn_y_sqrt),

        .round_bit(round_bit_sqrt),
        .sticky_bit(sticky_bit_sqrt),

        .IV(IV_sqrt),

        .final_res(final_res_sqrt),
        .ready(ready_sqrt)
    );

    airi5c_post_processing post_processing_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill || load),
        .load(ready_add || ready_mul || ready_div || ready_sqrt),

        .rm(reg_rm),

        .man(man_y),
        .Exp(exp_y),
        .sgn(sgn_y),

        .round_bit(round_bit),
        .sticky_bit(sticky_bit),

        .IV_in(IV_int),
        .DZ_in(DZ_int),

        .final_res(final_res),

        .float_out(float_out),

        .IV(IV),
        .DZ(DZ),
        .OF(OF),
        .UF(UF),
        .IE(IE),

        .ready(ready)
    );

endmodule