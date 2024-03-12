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

module airi5c_float_comparator_seq
(
    input           clk,
    input           n_reset,
    input           kill,
    input           load,

    input           op_eq,
    input           op_lt,
    input           op_le,

    input   [31:0]  a,
    input   [31:0]  b,

    output  [31:0]  int_out,
    output  reg     IV,

    output  reg     ready
);

    reg     y;

    wire    sNaN_a;
    wire    qNaN_a;
    wire    sNaN_b;
    wire    qNaN_b;

    wire    equal;
    wire    less;

    assign  int_out = {31'h00000000, y};

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            y       <= 1'b0;
            IV      <= 1'b0;
            ready   <= 1'b0;
        end
        
        else if (kill ||(load && !(op_eq || op_le || op_lt))) begin
            y       <= 1'b0;
            IV      <= 1'b0;
            ready   <= 1'b0;
        end

        else if (load) begin
            if (op_eq) begin
                y   <= equal;
                IV  <= sNaN_a || sNaN_b;
            end

            else if (op_lt) begin
                y   <= less;
                IV  <= sNaN_a || qNaN_a || sNaN_b || qNaN_b;
            end

            else if (op_le) begin
                y   <= less || equal;
                IV  <= sNaN_a || qNaN_a || sNaN_b || qNaN_b;
            end

            ready   <= 1'b1;
        end

        else
            ready   <= 1'b0;
    end

    airi5c_float_comparator_comb float_comparator_inst
    (
        .a(a),
        .b(b),

        .sNaN_a(sNaN_a),
        .qNaN_a(qNaN_a),
        .sNaN_b(sNaN_b),
        .qNaN_b(qNaN_b),

        .greater(),
        .equal(equal),
        .less(less),
        .unordered()
    );

endmodule
