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

module airi5c_float_sqrt
(
    input                   clk,
    input                   n_reset,
    input                   kill,
    input                   load,

    input                   op_sqrt,

    input           [23:0]  man,
    input   signed  [9:0]   Exp,
    input                   sgn,
    input                   zero,
    input                   inf,
    input                   sNaN,
    input                   qNaN,

    output          [23:0]  man_y,
    output  reg     [9:0]   exp_y,
    output  reg             sgn_y,

    output                  round_bit,
    output                  sticky_bit,

    output  reg             IV,

    output  reg             final_res,
    output  reg             ready
);

    reg     [25:0]  reg_rad;
    reg     [25:0]  reg_res;
    reg     [27:0]  reg_rem;

    reg     [28:0]  acc [1:0];
    reg     [1:0]   s;

    reg     [1:0]   state;

    parameter       IDLE        = 2'b01,
                    CALC        = 2'b10;

    assign          man_y       = reg_res[25:2];
    assign          round_bit   = reg_res[1];
    assign          sticky_bit  = |reg_rem || reg_res[0];

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_rad     <= 26'h0000000;
            reg_res     <= 26'h0000000;
            reg_rem     <= 28'h0000000;
            exp_y       <= 10'h000;
            sgn_y       <= 1'b0;
            IV          <= 1'b0;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end
        
        else if (kill || (load && !op_sqrt)) begin
            reg_rad     <= 26'h0000000;
            reg_res     <= 26'h0000000;
            reg_rem     <= 28'h0000000;
            exp_y       <= 10'h000;
            sgn_y       <= 1'b0;
            IV          <= 1'b0;
            final_res   <= 1'b0;
            state       <= IDLE;
            ready       <= 1'b0;
        end

        else if (load) begin
            reg_rem     <= 28'h0000000;
            // +0.0 or -0.0
            if (zero) begin
                reg_rad     <= 26'h0000000;
                reg_res     <= 26'h0000000;
                exp_y       <= 10'h000;
                sgn_y       <= sgn;
                IV          <= 1'b0;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // NaN (negative numbers, except -0.0)
            else if (sgn || sNaN || qNaN) begin
                reg_rad     <= 26'h0000000;
                reg_res     <= {24'hc00000, 2'b00};
                exp_y       <= 10'h0ff;
                sgn_y       <= 1'b0;
                IV          <= 1'b1;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end
            // inf
            else if (inf) begin
                reg_rad     <= 26'h0000000;
                reg_res     <= {24'h800000, 2'b00};
                exp_y       <= 10'h0ff;
                sgn_y       <= 1'b0;
                IV          <= 1'b1;
                final_res   <= 1'b1;
                state       <= IDLE;
                ready       <= 1'b1;
            end

            else begin
                reg_rad     <= {1'b0, man, 1'b0} << Exp[0];
                reg_res     <= 26'h0000000;
                exp_y       <= Exp >>> 1;
                sgn_y       <= 1'b0;
                IV          <= 1'b0;
                final_res   <= 1'b0;
                state       <= CALC;
                ready       <= 1'b0;
            end
        end

        else case (state)
            IDLE:       ready <= 1'b0;

            CALC:       begin
                            reg_rad <= reg_rad << 4;
                            reg_res <= (reg_res << 2) | s;
                            reg_rem <= acc[1][27:0];

                            // when the calculation is finished,
                            // the MSB of the result is always 1
                            if (reg_res[23]) begin
                                state   <= IDLE;
                                ready   <= 1'b1;
                            end
                        end
        endcase
    end

    always @(*) begin
        acc[0]  = {1'b0, reg_rem[25:0], reg_rad[25:24]} - {1'b0, reg_res, 2'b01};
        s[1]    = !acc[0][28];
        acc[0]  = acc[0][28] ? {1'b0, reg_rem[25:0], reg_rad[25:24]} : acc[0];

        acc[1]  = {1'b0, acc[0][25:0], reg_rad[23:22]} - {1'b0, reg_res[23:0], s[1], 2'b01};
        s[0]    = !acc[1][28];
        acc[1]  = acc[1][28] ? {1'b0, acc[0][25:0], reg_rad[23:22]} : acc[1];
    end

endmodule
