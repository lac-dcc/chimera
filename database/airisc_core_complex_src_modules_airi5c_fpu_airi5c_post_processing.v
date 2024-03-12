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

module airi5c_post_processing
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input       [2:0]   rm,

    input       [23:0]  man,
    input       [9:0]   Exp,
    input               sgn,

    input               round_bit,
    input               sticky_bit,

    input               IV_in,
    input               DZ_in,

    input               final_res,

    output  reg [31:0]  float_out,

    output  reg         IV,
    output  reg         DZ,
    output  reg         OF,
    output  reg         UF,
    output  reg         IE,

    output  reg         ready
);

    reg     [2:0]   reg_rm;
    reg     [22:0]  reg_man;
    reg     [9:0]   reg_exp;
    reg             reg_sgn;
    reg             reg_round_bit;
    reg             reg_sticky_bit;
    reg             reg_final_res;
    reg             reg_equal;
    reg             reg_less;

    reg     [9:0]   exp_biased;
    reg             equal;
    reg             less;
    reg     [9:0]   offset;

    wire    [24:0]  shifter_out;
    wire            sticky_bitt;

    wire    [22:0]  man_rounded;
    reg     [9:0]   exp_rounded;
    wire            inc_exp;
    wire            inexact;

    wire            RTZ;
    wire            RDN;
    wire            RUP;

    assign          RTZ = reg_rm == `FPU_RM_RTZ;
    assign          RDN = reg_rm == `FPU_RM_RDN;
    assign          RUP = reg_rm == `FPU_RM_RUP;

    // input logic
    always @(*) begin
        // add bias to exponent
        exp_biased  = Exp + 10'h07f;

        // check if result is denormal
        equal       = ~|exp_biased;     // exp_biased == 0
        less        = exp_biased[9];    // exp_biased < 0

        /* If exp_biased is less or equal 0, the result is (probably) a denormal
         * number and the mantissa needs to be right shifted accordingly. The only
         * case when the result is not a denormal number, is when exp_biased equals
         * 0 and there was a carry to the MSB of mantissa in rounding. In this case
         * the mantissa gets shifted anyway because a carry results all mantissa
         * bits, except for the hidden bit, to be zero. But the hidden bit is
         * defined by the exponent anyway.
         */

        if (equal || less) begin
            offset      = 10'd1 - exp_biased;   // calculate number of shifts needed to denormalize
            exp_biased  = 10'd0;                // exponent is 0 if result might be denormal
        end

        else
            offset = 10'd0;
    end

    // output logic
    always @(*) begin
        exp_rounded = 10'h000;
        float_out   = {reg_sgn, reg_exp[7:0], reg_man};
        OF          = 1'b0;
        UF          = 1'b0;
        IE          = 1'b0;

        if (!reg_final_res) begin
            // rounding can cause a carry to the exponent
            exp_rounded = reg_exp + inc_exp;

            // overflow
            if (&exp_rounded[7:0] || exp_rounded[8] || exp_rounded[9]) begin
                IE = 1'b1;
                OF = 1'b1;
                UF = 1'b0;

                // setFmax
                if (RTZ || (RDN && !reg_sgn) || (RUP && reg_sgn))
                    float_out = {reg_sgn, 31'h7fffffff};

                // setInf
                else
                    float_out = {reg_sgn, 31'h7f800000};
            end

            else begin
                // underflow
                if (inexact && ((reg_equal && !inc_exp) || reg_less)) begin
                    IE  = 1'b1;
                    UF  = 1'b1;
                end

                // normal
                else begin
                    IE  = inexact;
                    UF  = 1'b0;
                end

                float_out = {reg_sgn, exp_rounded[7:0], man_rounded};
            end

            // If (before rounding) mantissa is 0 but round or sticky are 1
            // and man is still 0 after rounding, Exp should be 0. This
            // can only happen if result is denormal but for denormal results
            // Exp is 0 anyway
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_rm          <= 3'b000;
            reg_man         <= 23'h000000;
            reg_exp         <= 10'h000;
            reg_sgn         <= 1'b0;
            reg_round_bit   <= 1'b0;
            reg_sticky_bit  <= 1'b0;
            reg_equal       <= 1'b0;
            reg_less        <= 1'b0;
            IV              <= 1'b0;
            DZ              <= 1'b0;
            reg_final_res   <= 1'b0;
            ready           <= 1'b0;
        end
        
        else if (kill) begin
            reg_rm          <= 3'b000;
            reg_man         <= 23'h000000;
            reg_exp         <= 10'h000;
            reg_sgn         <= 1'b0;
            reg_round_bit   <= 1'b0;
            reg_sticky_bit  <= 1'b0;
            reg_equal       <= 1'b0;
            reg_less        <= 1'b0;
            IV              <= 1'b0;
            DZ              <= 1'b0;
            reg_final_res   <= 1'b0;
            ready           <= 1'b0;
        end

        else if (load) begin
            reg_rm          <= rm;
            reg_final_res   <= final_res;
            ready           <= 1'b1;

            if (final_res) begin
                reg_man         <= man[22:0];
                reg_exp         <= Exp;
                reg_sgn         <= sgn;
                reg_round_bit   <= 1'b0;
                reg_sticky_bit  <= 1'b0;
                reg_equal       <= 1'b0;
                reg_less        <= 1'b0;
                IV              <= IV_in;
                DZ              <= DZ_in;
            end

            else begin
                reg_man         <= shifter_out[23:1];
                reg_exp         <= exp_biased;
                reg_sgn         <= sgn;
                reg_round_bit   <= shifter_out[0];
                reg_sticky_bit  <= sticky_bit || sticky_bitt;
                reg_equal       <= equal;
                reg_less        <= less;
                IV              <= 1'b0;
                DZ              <= 1'b0;
            end
        end

        else
            ready           <= 1'b0;
    end

    airi5c_rshifter #(25, 5) rshifter_inst
    (
        .in({man, round_bit}),
        .sel(|offset[9:5] ? 5'b11111 : offset[4:0]),
        .sgn(1'b0),

        .out(shifter_out),
        .sticky_bit(sticky_bitt)
    );

    airi5c_rounding_logic #(23) rounding_logic_inst
    (
        .rm(reg_rm),

        .sticky_bit(reg_sticky_bit),
        .round_bit(reg_round_bit),

        .in(reg_man),
        .sgn(reg_sgn),

        .out(man_rounded),
        .carry(inc_exp),

        .inexact(inexact)
    );

endmodule