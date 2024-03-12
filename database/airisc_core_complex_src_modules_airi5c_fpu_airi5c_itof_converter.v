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

module airi5c_itof_converter
(
    input           clk,
    input           n_reset,
    input           kill,
    input           load,

    input           op_cvtif,
    input           op_cvtuf,
    input   [2:0]   rm,

    input   [31:0]  int_in,
    output  [31:0]  float_out,
    output          IE,

    output  reg     ready
);

    wire    [31:0]  man_denorm;
    reg     [31:0]  man_norm;

    wire    [4:0]   leading_zeros;

    wire    [22:0]  man;
    reg     [7:0]   Exp;
    wire            sgn;

    wire            inc_exp;

    reg     [2:0]   reg_rm;
    reg             reg_sgn;

    assign          sgn         = int_in[31] && op_cvtif;
    assign          man_denorm  = sgn ? -int_in : int_in;
    assign          float_out   = {reg_sgn, Exp + inc_exp, man};

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_rm      <= 3'b000;
            man_norm    <= 32'h00000000;
            Exp         <= 8'h00;
            reg_sgn     <= 1'b0;
            ready       <= 1'b0;
        end
        
        else if (kill || (load && !(op_cvtif || op_cvtuf))) begin
            reg_rm      <= 3'b000;
            man_norm    <= 32'h00000000;
            Exp         <= 8'h00;
            reg_sgn     <= 1'b0;
            ready       <= 1'b0;
        end

        else if (load) begin
            reg_rm      <= rm;
            reg_sgn     <= sgn;
            ready       <= 1'b1;

            if (|int_in) begin
                man_norm    <= man_denorm << leading_zeros;
                Exp         <= 8'h9e - leading_zeros;
            end

            else begin
                man_norm    <= 32'h00000000;
                Exp         <= 8'h00;
            end
        end

        else
            ready       <= 1'b0;
    end

    airi5c_leading_zero_counter_32 LZC_32_inst
    (
        .in(man_denorm),
        .y(leading_zeros),
        .a()
    );

    airi5c_rounding_logic #(23) rounding_logic_inst
    (
        .rm(reg_rm),

        .sticky_bit(|man_norm[6:0]),
        .round_bit(man_norm[7]),

        .in(man_norm[30:8]),
        .sgn(reg_sgn),

        .out(man),
        .carry(inc_exp),

        .inexact(IE)
    );

endmodule