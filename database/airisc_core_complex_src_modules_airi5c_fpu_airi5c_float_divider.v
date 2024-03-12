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

module airi5c_float_divider
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input               op_div,

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
    output  reg         DZ,

    output  reg         final_res,
    output  reg         ready
);

    reg     [23:0]  reg_man_b;
    reg     [25:0]  reg_res;
    reg     [26:0]  reg_rem;
    reg     [9:0]   reg_exp_y;
    reg             reg_sgn_y;
    reg     [3:0]   counter;

    wire            IV_int;

    reg     [26:0]  acc [2:0];
    reg     [1:0]   q;
    integer         i;

    reg     [1:0]   state;

    localparam      IDLE    = 2'b01,
                    CALC    = 2'b10;

    assign          IV_int  = sNaN_a || sNaN_b || (zero_a && zero_b) || (inf_a && inf_b);

    always @(*) begin
        if (reg_res[25] || final_res) begin
            sgn_y       = reg_sgn_y;
            exp_y       = reg_exp_y;
            man_y       = reg_res[25:2];
            round_bit   = reg_res[1];
            sticky_bit  = |reg_rem || reg_res[0];
        end

        else begin
            sgn_y       = reg_sgn_y;
            exp_y       = reg_exp_y - 10'd1;
            man_y       = reg_res[24:1];
            round_bit   = reg_res[0];
            sticky_bit  = |reg_rem;
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_man_b   <= 24'h000000;
            reg_res     <= {24'hc00000, 2'b00};
            reg_rem     <= 27'h0000000;
            reg_exp_y   <= 10'h000;
            reg_sgn_y   <= 1'b0;
            IV          <= 1'b0;
            DZ          <= 1'b0;
            counter     <= 4'd0;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end
        
        else if (kill || (load && !op_div)) begin
            reg_man_b   <= 24'h000000;
            reg_res     <= {24'hc00000, 2'b00};
            reg_rem     <= 27'h0000000;
            reg_exp_y   <= 10'h000;
            reg_sgn_y   <= 1'b0;
            IV          <= 1'b0;
            DZ          <= 1'b0;
            counter     <= 4'd0;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end

        else if (load) begin
            IV          <= IV_int;
            DZ          <= zero_b;
            counter     <= 4'd0;
            // NaN
            if (IV_int || qNaN_a || qNaN_b) begin
                reg_man_b   <= 24'h000000;
                reg_res     <= {24'hc00000, 2'b00};
                reg_rem     <= 27'h0000000;
                reg_exp_y   <= 10'h0ff;
                reg_sgn_y   <= 1'b0;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // inf
            else if (inf_a || zero_b) begin
                reg_man_b   <= 24'h000000;
                reg_res     <= {24'h800000, 2'b00};
                reg_rem     <= 27'h0000000;
                reg_exp_y   <= 10'h0ff;
                reg_sgn_y   <= sgn_a ^ sgn_b;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // zero
            else if (zero_a || inf_b) begin
                reg_man_b   <= 24'h000000;
                reg_res     <= {24'h000000, 2'b00};
                reg_rem     <= 27'h0000000;
                reg_exp_y   <= 10'h000;
                reg_sgn_y   <= sgn_a ^ sgn_b;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end

            else begin
                reg_man_b   <= man_b;
                reg_res     <= 26'd0;
                reg_rem     <= {1'b0, man_a, 2'b00};
                reg_exp_y   <= exp_a - exp_b;
                reg_sgn_y   <= sgn_a ^ sgn_b;
                final_res   <= 1'b0;
                state       <= CALC;
                ready       <= 1'b0;
            end
        end

        else case (state)
            IDLE:   ready   <= 1'b0;

            CALC:   begin
                        reg_res     <= (reg_res << 2) | q;
                        reg_rem     <= acc[2];

                        if (counter == 4'd12) begin
                            state   <= IDLE;
                            ready   <= 1'b1;
                        end

                        else
                            counter <= counter + 4'd1;
                    end
        endcase
    end

    always @(*) begin
        acc[0]  = reg_rem;

        for (i = 1; i <= 2; i = i+1) begin
            acc[i]  = acc[i-1] - {1'b0, reg_man_b, 2'b00};
            q[2-i]  = !acc[i][26];
            acc[i]  = (acc[i][26] ? acc[i-1] : acc[i]) << 1;
        end
    end

endmodule