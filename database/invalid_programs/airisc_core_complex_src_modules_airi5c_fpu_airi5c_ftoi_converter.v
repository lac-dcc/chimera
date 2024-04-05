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

`include "modules/airi5c_fpu/airi5c_FPU_constants.vh"

module airi5c_ftoi_converter
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input               op_cvtfi,
    input               op_cvtfu,
    input       [2:0]   rm,

    input       [23:0]  man,
    input       [7:0]   Exp,
    input               sgn,
    input               zero,
    input               inf,
    input               sNaN,
    input               qNaN,

    output  reg [31:0]  int_out,

    output  reg         IV,
    output  reg         IE,

    output  reg         ready
);

    reg     [31:0]  cmp_min;
    wire            less;

    reg     [31:0]  cmp_max;
    wire            greater;

    wire    [7:0]   offset;
    wire    [32:0]  shifter_out;
    wire            sticky_bit;

    reg     [2:0]   reg_rm;
    reg     [31:0]  reg_int;
    reg             reg_sgn;
    reg             reg_round_bit;
    reg             reg_sticky_bit;
    reg             reg_IV;
    reg             reg_IE;
    reg             negate;
    reg             final_res;

    wire    [31:0]  int_rounded;
    wire            inexact;

    wire            lower_limit_exc;
    wire            upper_limit_exc;
    wire            rounded_zero;

    assign          lower_limit_exc = inf && sgn;
    assign          upper_limit_exc = (inf && !sgn) || sNaN || qNaN;
    assign          rounded_zero    = op_cvtfu && sgn;

    assign          offset          = 8'h9e - Exp;

    /* calculate offset:
     *   31 - exp_unbiased
     * = 31 + bias - (exp_unbiased + bias)
     * = 31 + bias - exp_biased
     * = 31 + 127 - exp_biased
     */

    always @(*) begin
        if (final_res) begin
            int_out = reg_int;
            IV      = reg_IV;
            IE      = reg_IE;
        end

        else begin
            int_out = negate ? -int_rounded : int_rounded;
            IV      = reg_IV;
            IE      = inexact;
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_rm          <= 3'b000;
            reg_int         <= 32'h00000000;
            reg_sgn         <= 1'b0;
            reg_round_bit   <= 1'b0;
            reg_sticky_bit  <= 1'b0;
            reg_IV          <= 1'b0;
            reg_IE          <= 1'b0;
            negate          <= 1'b0;
            final_res       <= 1'b0;
            ready           <= 1'b0;
        end
        
        else if (kill || (load && !(op_cvtfi || op_cvtfu))) begin
            reg_rm          <= 3'b000;
            reg_int         <= 32'h00000000;
            reg_sgn         <= 1'b0;
            reg_round_bit   <= 1'b0;
            reg_sticky_bit  <= 1'b0;
            reg_IV          <= 1'b0;
            reg_IE          <= 1'b0;
            negate          <= 1'b0;
            final_res       <= 1'b0;
            ready           <= 1'b0;
        end

        else if (load) begin
            reg_rm  <= rm;
            reg_sgn <= sgn;
            ready   <= 1'b1;
            // implemented non signaling IE (IEEE 754 2019 p. 39f)
            // input is below lower limit
            if (less || lower_limit_exc) begin
                reg_int         <= op_cvtfi ? 32'h80000000 : 32'h00000000;
                reg_round_bit   <= 1'b0;
                reg_sticky_bit  <= 1'b0;
                reg_IV          <= 1'b1;
                reg_IE          <= lower_limit_exc;
                negate          <= 1'b0;
                final_res       <= 1'b1;
            end
            // input is above upper limit or NaN
            else if (greater || upper_limit_exc) begin
                reg_int         <= op_cvtfi ? 32'h7fffffff : 32'hffffffff;
                reg_round_bit   <= 1'b0;
                reg_sticky_bit  <= 1'b0;
                reg_IV          <= 1'b1;
                reg_IE          <= upper_limit_exc;
                negate          <= 1'b0;
                final_res       <= 1'b1;
            end
            // rounded input is zero
            else if (zero || rounded_zero) begin
                reg_int         <= 32'h0000000;
                reg_round_bit   <= 1'b0;
                reg_sticky_bit  <= 1'b0;
                reg_IV          <= 1'b0;
                reg_IE          <= rounded_zero;
                negate          <= 1'b0;
                final_res       <= 1'b1;
            end

            else begin
                reg_int         <= shifter_out[32:1];
                reg_round_bit   <= shifter_out[0];
                reg_sticky_bit  <= sticky_bit;
                reg_IV          <= 1'b0;
                reg_IE          <= 1'b0;
                negate          <= op_cvtfi && sgn;
                final_res       <= 1'b0;
            end
        end

        else
            ready           <= 1'b0;
    end

    always @(*) begin
        // set min and max valid int value to compare
        if (op_cvtfi) begin
            cmp_min = 32'hcf000000;
            cmp_max = 32'h4effffff;
        end
        // set min and max valid unsigned int value to compare
        else begin
            // inputs less than 0.0 are normally invalid
            // inputs less than 0.0 but greater than -1.0
            // can be valid if rounded to 0.0
            case (rm)
            `FPU_RM_RNE:    cmp_min = 32'hbf700000; // < -0.5
            `FPU_RM_RTZ,
            `FPU_RM_RUP:    cmp_min = 32'hbf7fffff; // < -0.99...
            `FPU_RM_RMM:    cmp_min = 32'hbeffffff; // < -0.49...
            default:        cmp_min = 32'h00000000; // <  0.0
            endcase

            cmp_max = 32'h4f7fffff;
        end
    end

    airi5c_float_comparator_comb float_comparator_inst_1
    (
        .a({sgn, Exp, man[22:0]}),
        .b(cmp_min),

        .sNaN_a(),
        .qNaN_a(),
        .sNaN_b(),
        .qNaN_b(),

        .greater(),
        .equal(),
        .less(less),
        .unordered()
    );

    airi5c_float_comparator_comb float_comparator_inst_2
    (
        .a({sgn, Exp, man[22:0]}),
        .b(cmp_max),

        .sNaN_a(),
        .qNaN_a(),
        .sNaN_b(),
        .qNaN_b(),

        .greater(greater),
        .equal(),
        .less(),
        .unordered()
    );

    airi5c_rshifter #(33, 6) rshifter_inst
    (
        .in({man, 9'h00}),
        .sel(|offset[7:6] ? 6'b111111 : offset[5:0]),
        .sgn(1'b0),

        .out(shifter_out),
        .sticky_bit(sticky_bit)
    );

    airi5c_rounding_logic #(32) rounding_logic_inst
    (
        .rm(reg_rm),

        .sticky_bit(reg_sticky_bit),
        .round_bit(reg_round_bit),

        .in(reg_int),
        .sgn(reg_sgn),

        .out(int_rounded),
        .carry(),

        .inexact(inexact)
    );

endmodule
