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

module airi5c_float_multiplier
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input               op_mul,

    input       [23:0]  man_a,
    input       [9:0]   exp_a,
    input               sgn_a,
    input               zero_a,
    input               inf_a,
    input               sNaN_a,
    input               qNaN_a,

    input       [23:0]  man_b,
    input       [9:0]   exp_b,
    input               sgn_b,
    input               zero_b,
    input               inf_b,
    input               sNaN_b,
    input               qNaN_b,

    output  reg [23:0]  man_y,
    output  reg [9:0]   exp_y,
    output  reg         sgn_y,

    output  reg         round_bit,
    output  reg         sticky_bit,

    output  reg         IV,

    output  reg         final_res,
    output  reg         ready
);

    reg     [23:0]  reg_man_b;
    reg     [47:0]  reg_res;
    reg     [9:0]   reg_exp_y;
    reg             reg_sgn_y;
    reg     [1:0]   counter;

    wire            IV_int;

    reg     [29:0]  acc;
    integer         i;

    reg     [1:0]   state;

    localparam      IDLE    = 2'b01,
                    CALC    = 2'b10;

    assign          IV_int  = sNaN_a || sNaN_b || (zero_a && inf_b) || (inf_a && zero_b);

    always @(*) begin
        if (reg_res[47] || final_res) begin
            sgn_y       = reg_sgn_y;
            exp_y       = reg_exp_y + !final_res;
            man_y       = reg_res[47:24];
            round_bit   = reg_res[23];
            sticky_bit  = |reg_res[22:0];
        end

        else begin
            sgn_y       = reg_sgn_y;
            exp_y       = reg_exp_y;
            man_y       = reg_res[46:23];
            round_bit   = reg_res[22];
            sticky_bit  = |reg_res[21:0];
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_man_b   <= 24'h000000;
            reg_res     <= 48'h000000000000;
            reg_exp_y   <= 10'h000;
            reg_sgn_y   <= 1'b0;
            IV          <= 1'b0;
            counter     <= 2'd0;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end

        else if (kill || (load && !op_mul)) begin
            reg_man_b   <= 24'h000000;
            reg_res     <= 48'h000000000000;
            reg_exp_y   <= 10'h000;
            reg_sgn_y   <= 1'b0;
            IV          <= 1'b0;
            counter     <= 2'd0;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end

        else if (load) begin
            IV          <= IV_int;
            counter     <= 2'd0;
            // NaN
            if (IV_int || qNaN_a || qNaN_b) begin
                reg_man_b   <= 24'h000000;
                reg_res     <= {24'hc00000, 24'h000000};
                reg_exp_y   <= 10'h0ff;
                reg_sgn_y   <= 1'b0;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // inf
            else if (inf_a || inf_b) begin
                reg_man_b   <= 24'h000000;
                reg_res     <= {24'h800000, 24'h000000};
                reg_exp_y   <= 10'h0ff;
                reg_sgn_y   <= sgn_a ^ sgn_b;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // zero
            else if (zero_a || zero_b) begin
                reg_man_b   <= 24'h000000;
                reg_res     <= {24'h000000, 24'h000000};
                reg_exp_y   <= 10'h000;
                reg_sgn_y   <= sgn_a ^ sgn_b;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end

            else begin
                reg_man_b   <= man_b;
                reg_res     <= {24'h000000, man_a};
                reg_exp_y   <= exp_a + exp_b;
                reg_sgn_y   <= sgn_a ^ sgn_b;
                final_res   <= 1'b0;
                state       <= CALC;
                ready       <= 1'b0;
            end
        end

        else case (state)
            IDLE:   ready <= 1'b0;

            CALC:   begin
                        reg_res <= {acc, reg_res[23:6]};

                        if (counter == 2'd3) begin
                            state   <= IDLE;
                            ready   <= 1'b1;
                        end

                        else
                            counter <= counter + 2'd1;
                    end
        endcase
    end

    always @(*) begin
        acc = {6'b000000, reg_res[47:24]};

        for (i = 0; i < 6; i = i+1) begin
            if (reg_res[i])
                acc = acc + ({6'b000000, reg_man_b} << i);
        end
    end

endmodule
