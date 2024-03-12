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

module airi5c_FPU
(
    input           clk,
    input           n_reset,
    input           kill,
    input           load,

    input   [4:0]   op,
    input   [2:0]   rm,

    input   [31:0]  a,
    input   [31:0]  b,
    input   [31:0]  c,

    output  [31:0]  result,

    output          IV,
    output          DZ,
    output          OF,
    output          UF,
    output          IE,

    output          busy,
    output          ready
);

    reg             reg_load;
    reg     [4:0]   reg_op;
    reg     [2:0]   reg_rm;
    reg     [31:0]  reg_a;
    reg     [31:0]  reg_b;
    reg     [31:0]  reg_c;

    reg             reg_op_add;
    reg             reg_op_sub;
    reg             reg_op_mul;
    reg             reg_op_div;
    reg             reg_op_sqrt;
    reg             reg_op_sgnj;
    reg             reg_op_sgnjn;
    reg             reg_op_sgnjx;
    reg             reg_op_cvtfi;
    reg             reg_op_cvtfu;
    reg             reg_op_cvtif;
    reg             reg_op_cvtuf;
    reg             reg_op_eq;
    reg             reg_op_lt;
    reg             reg_op_le;
    reg             reg_op_class;
    reg             reg_op_min;
    reg             reg_op_max;

    reg             loaded;
    reg             wb_ena;
    wire            wb;
    wire            ready_int;

    assign          busy        = loaded && !ready;
    assign          ready       = !wb_ena && ready_int;
    assign          wb          =  wb_ena && ready_int;

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            reg_load        <= 1'b0;
            reg_op          <= 5'd0;
            reg_rm          <= 3'h0;
            reg_a           <= 32'h00000000;
            reg_b           <= 32'h00000000;
            reg_c           <= 32'h00000000;
            reg_op_add      <= 1'b0;
            reg_op_sub      <= 1'b0;
            reg_op_mul      <= 1'b0;
            reg_op_div      <= 1'b0;
            reg_op_sqrt     <= 1'b0;
            reg_op_sgnj     <= 1'b0;
            reg_op_sgnjn    <= 1'b0;
            reg_op_sgnjx    <= 1'b0;
            reg_op_cvtfi    <= 1'b0;
            reg_op_cvtfu    <= 1'b0;
            reg_op_cvtif    <= 1'b0;
            reg_op_cvtuf    <= 1'b0;
            reg_op_eq       <= 1'b0;
            reg_op_lt       <= 1'b0;
            reg_op_le       <= 1'b0;
            reg_op_class    <= 1'b0;
            reg_op_min      <= 1'b0;
            reg_op_max      <= 1'b0;
        end
        
        else if (kill) begin
            reg_load        <= 1'b0;
            reg_op          <= 5'd0;
            reg_rm          <= 3'h0;
            reg_a           <= 32'h00000000;
            reg_b           <= 32'h00000000;
            reg_c           <= 32'h00000000;
            reg_op_add      <= 1'b0;
            reg_op_sub      <= 1'b0;
            reg_op_mul      <= 1'b0;
            reg_op_div      <= 1'b0;
            reg_op_sqrt     <= 1'b0;
            reg_op_sgnj     <= 1'b0;
            reg_op_sgnjn    <= 1'b0;
            reg_op_sgnjx    <= 1'b0;
            reg_op_cvtfi    <= 1'b0;
            reg_op_cvtfu    <= 1'b0;
            reg_op_cvtif    <= 1'b0;
            reg_op_cvtuf    <= 1'b0;
            reg_op_eq       <= 1'b0;
            reg_op_lt       <= 1'b0;
            reg_op_le       <= 1'b0;
            reg_op_class    <= 1'b0;
            reg_op_min      <= 1'b0;
            reg_op_max      <= 1'b0;
        end

        else if (load) begin
            reg_load        <= 1'b1;
            reg_op          <= op;
            reg_rm          <= rm;
            reg_a           <= a;
            reg_b           <= b;
            reg_c           <= c;
            reg_op_add      <= op == `FPU_OP_ADD;
            reg_op_sub      <= op == `FPU_OP_SUB;
            reg_op_mul      <= op == `FPU_OP_MUL  ||
                               op == `FPU_OP_MADD || op == `FPU_OP_NMADD ||
                               op == `FPU_OP_MSUB || op == `FPU_OP_NMSUB;
            reg_op_div      <= op == `FPU_OP_DIV;
            reg_op_sqrt     <= op == `FPU_OP_SQRT;
            reg_op_sgnj     <= op == `FPU_OP_SGNJ;
            reg_op_sgnjn    <= op == `FPU_OP_SGNJN;
            reg_op_sgnjx    <= op == `FPU_OP_SGNJX;
            reg_op_cvtfi    <= op == `FPU_OP_CVTFI;
            reg_op_cvtfu    <= op == `FPU_OP_CVTFU;
            reg_op_cvtif    <= op == `FPU_OP_CVTIF;
            reg_op_cvtuf    <= op == `FPU_OP_CVTUF;
            reg_op_eq       <= op == `FPU_OP_EQ;
            reg_op_lt       <= op == `FPU_OP_LT;
            reg_op_le       <= op == `FPU_OP_LE;
            reg_op_class    <= op == `FPU_OP_CLASS;
            reg_op_min      <= op == `FPU_OP_MIN;
            reg_op_max      <= op == `FPU_OP_MAX;
        end
        
        else if (wb) begin
            reg_load        <= 1'b1;
            reg_a           <= reg_op == `FPU_OP_NMADD || reg_op == `FPU_OP_NMSUB ?
                               {!result[31], result[30:0]} : result;
            reg_b           <= reg_c;
            reg_op_add      <= reg_op == `FPU_OP_MADD || reg_op == `FPU_OP_NMSUB;
            reg_op_sub      <= reg_op == `FPU_OP_MSUB || reg_op == `FPU_OP_NMADD;
            reg_op_mul      <= 1'b0;
        end

        else
            reg_load    <= 1'b0;
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            loaded      <= 1'b0;
            wb_ena      <= 1'b0;
        end
        
        else if (kill) begin
            loaded      <= 1'b0;
            wb_ena      <= 1'b0;
        end

        else if (load) begin
            loaded      <= 1'b1;
            wb_ena      <= op == `FPU_OP_MADD || op == `FPU_OP_NMSUB ||
                           op == `FPU_OP_MSUB || op == `FPU_OP_NMADD;
        end

        else if (wb)
            wb_ena      <= 1'b0;

        else if (ready)
            loaded      <= 1'b0;
    end

    airi5c_FPU_core FPU_core_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .kill(kill),
        .load(reg_load),

        .op_add(reg_op_add),
        .op_sub(reg_op_sub),
        .op_mul(reg_op_mul),
        .op_div(reg_op_div),
        .op_sqrt(reg_op_sqrt),
        .op_sgnj(reg_op_sgnj),
        .op_sgnjn(reg_op_sgnjn),
        .op_sgnjx(reg_op_sgnjx),
        .op_cvtfi(reg_op_cvtfi),
        .op_cvtfu(reg_op_cvtfu),
        .op_cvtif(reg_op_cvtif),
        .op_cvtuf(reg_op_cvtuf),
        .op_eq(reg_op_eq),
        .op_lt(reg_op_lt),
        .op_le(reg_op_le),
        .op_class(reg_op_class),
        .op_min(reg_op_min),
        .op_max(reg_op_max),

        .rm(reg_rm),

        .a(reg_a),
        .b(reg_b),

        .result(result),

        .IV(IV),
        .DZ(DZ),
        .OF(OF),
        .UF(UF),
        .IE(IE),

        .ready(ready_int)
    );

endmodule
