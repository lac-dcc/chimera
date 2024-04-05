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

`include "airi5c_FPU_constants.vh"

module airi5c_float_adder
(
    input                   clk,
    input                   n_reset,
    input                   kill,
    input                   load,

    input                   op_add,
    input                   op_sub,
    input           [2:0]   rm,

    input           [23:0]  man_a,
    input   signed  [9:0]   exp_a,
    input                   sgn_a,
    input                   zero_a,
    input                   inf_a,
    input                   sNaN_a,
    input                   qNaN_a,

    input           [23:0]  man_b,
    input   signed  [9:0]   exp_b,
    input                   sgn_b,
    input                   zero_b,
    input                   inf_b,
    input                   sNaN_b,
    input                   qNaN_b,

    output  reg     [23:0]  man_y,
    output  reg     [9:0]   exp_y,
    output  reg             sgn_y,

    output  reg             round_bit,
    output  reg             sticky_bit,

    output  reg             IV,

    output  reg             final_res,
    output  reg             ready
);

    wire            sgn_b_int;
    wire            sub_int;
    reg             reg_sub_int;
    wire            swapInputs;
    wire            zero_y;
    reg             sgn_y_int;
    wire            IV_int;

    reg     [23:0]  reg_man_a;
    reg     [9:0]   reg_exp_a;
    reg     [23:0]  reg_man_b;
    reg     [9:0]   reg_exp_b;

    wire    [9:0]   align;
    wire    [25:0]  shifter_in;
    wire    [25:0]  shifter_out;

    reg             guard_bit;
    wire            sticky_bit_int;

    reg     [24:0]  sum;

    wire    [4:0]   leading_zeros;

    reg     [3:0]   state;

    localparam      IDLE    = 4'b0001,
                    ALIGN   = 4'b0010,
                    ADD     = 4'b0100,
                    NORM    = 4'b1000;

    assign          sgn_b_int       = sgn_b ^ op_sub;
    assign          sub_int         = sgn_a ^ sgn_b_int;
    assign          swapInputs      = (zero_a && !zero_b) || (exp_a < exp_b) || ((exp_a == exp_b) && (man_a < man_b));
    assign          zero_y          = ({exp_a, man_a} == {exp_b, man_b}) && sub_int;
    assign          IV_int          = sNaN_a || sNaN_b || (sub_int && inf_a && inf_b);
    assign          align           = reg_exp_a - reg_exp_b;
    assign          shifter_in      = reg_sub_int ? -{reg_man_b, 2'b00} : {reg_man_b, 2'b00};

    // sign logic
    always @(*) begin
        if (zero_a && zero_b)
            sgn_y_int   = sgn_a && sgn_b_int;

        else if (zero_y)
            sgn_y_int   = rm == `FPU_RM_RDN;

        else if (swapInputs)
            sgn_y_int   = sgn_b_int;

        else
            sgn_y_int   = sgn_a;
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_sub_int <= 1'b0;
            reg_man_a   <= 24'h000000;
            reg_exp_a   <= 10'h000;
            reg_man_b   <= 24'h000000;
            reg_exp_b   <= 10'h000;
            man_y       <= 24'h000000;
            exp_y       <= 10'h000;
            sgn_y       <= 1'b0;
            guard_bit   <= 1'b0;
            round_bit   <= 1'b0;
            sticky_bit  <= 1'b0;
            IV          <= 1'b0;
            sum         <= 25'h0000000;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end

        else if (kill || (load && !(op_add || op_sub))) begin
            reg_sub_int <= 1'b0;
            reg_man_a   <= 24'h000000;
            reg_exp_a   <= 10'h000;
            reg_man_b   <= 24'h000000;
            reg_exp_b   <= 10'h000;
            man_y       <= 24'h000000;
            exp_y       <= 10'h000;
            sgn_y       <= 1'b0;
            guard_bit   <= 1'b0;
            round_bit   <= 1'b0;
            sticky_bit  <= 1'b0;
            IV          <= 1'b0;
            sum         <= 25'h0000000;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end

        else if (load) begin
            reg_sub_int <= sub_int;
            reg_man_a   <= 24'h000000;
            reg_exp_a   <= 10'h000;
            reg_man_b   <= 24'h000000;
            reg_exp_b   <= 10'h000;
            man_y       <= 24'h000000;
            exp_y       <= 10'h000;
            sgn_y       <= sgn_y_int;
            guard_bit   <= 1'b0;
            round_bit   <= 1'b0;
            sticky_bit  <= 1'b0;
            IV          <= IV_int;
            sum         <= 25'h0000000;
            // NaN
            if (IV_int || qNaN_a || qNaN_b) begin
                man_y       <= 24'hc00000;
                exp_y       <= 10'h0ff;
                sgn_y       <= 1'b0;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // inf
            else if (inf_a || inf_b) begin
                man_y       <= 24'h800000;
                exp_y       <= 10'h0ff;
                sgn_y       <= sgn_y_int;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // zero
            else if (zero_y) begin
                man_y       <= 24'h000000;
                exp_y       <= 10'h000;
                sgn_y       <= sgn_y_int;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // a
            else if (zero_b) begin
                man_y       <= man_a;
                exp_y       <= exp_a;
                sgn_y       <= sgn_y_int;
                final_res   <= 1'b0;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // b
            else if (zero_a) begin
                man_y       <= man_b;
                exp_y       <= exp_b;
                sgn_y       <= sgn_y_int;
                final_res   <= 1'b0;
                state       <= IDLE;
                ready       <= 1'b1;
            end

            else begin
                // swap inputs if abs(a) < abs(b)
                if (swapInputs) begin
                    reg_man_a <= man_b;
                    reg_exp_a <= exp_b;
                    reg_man_b <= man_a;
                    reg_exp_b <= exp_a;
                end

                else begin
                    reg_man_a <= man_a;
                    reg_exp_a <= exp_a;
                    reg_man_b <= man_b;
                    reg_exp_b <= exp_b;
                end

                final_res   <= 1'b0;
                state       <= ALIGN;
                ready       <= 1'b0;
            end
        end

        else case (state)
            IDLE:   ready <= 1'b0;

            ALIGN:  begin
                        reg_man_b   <= shifter_out[25:2];
                        guard_bit   <= shifter_out[1];
                        round_bit   <= shifter_out[0];
                        sticky_bit  <= sticky_bit_int;
                        state       <= ADD;
                    end

            ADD:    begin
                        sum         <= reg_man_a + reg_man_b;
                        state       <= NORM;
                    end

            NORM:   begin
                        // shift right 1 digit (only if there was a carry after addition)
                        if (!reg_sub_int && sum[24]) begin
                            man_y       <= sum[24:1];
                            exp_y       <= reg_exp_a + 10'd1;
                            sticky_bit  <= guard_bit || round_bit || sticky_bit;
                            round_bit   <= sum[0];
                        end

                        // dont shift (because a >= b, the result is always >= 0 after
                        // subtraction, so carry is a dont care in this case)
                        else if (sum[23]) begin
                            man_y       <= sum[23:0];
                            exp_y       <= reg_exp_a;
                            sticky_bit  <= round_bit || sticky_bit;
                            round_bit   <= guard_bit;
                        end

                        // shift left 1 digit
                        else if (!sum[23] && sum[22]) begin
                            man_y       <= {sum[22:0], guard_bit};
                            exp_y       <= reg_exp_a - leading_zeros;
                        end

                        // shift left more than 1 digit
                        else begin
                            man_y       <= {sum[22:0], guard_bit} << (leading_zeros - 5'd1);
                            exp_y       <= reg_exp_a - leading_zeros;
                            sticky_bit  <= 1'b0;
                            round_bit   <= 1'b0;
                        end

                        state   <= IDLE;
                        ready   <= 1'b1;
                    end
        endcase
    end

    airi5c_rshifter #(26, 5) rshifter_inst
    (
        .in(shifter_in),
        .sel(|align[9:5] ? 5'b11111 : align[4:0]),
        .sgn(reg_sub_int),

        .out(shifter_out),
        .sticky_bit(sticky_bit_int)
    );

    airi5c_leading_zero_counter_24 LZC_24_inst
    (
        .in(sum[23:0]),
        .y(leading_zeros),
        .a()
    );

endmodule
