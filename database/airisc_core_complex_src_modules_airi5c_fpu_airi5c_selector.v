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

module airi5c_selector
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input               op_min,
    input               op_max,

    input       [31:0]  a,
    input       [31:0]  b,

    output  reg [31:0]  float_out,
    output  reg         IV,

    output  reg         ready
);

    wire    greater;
    wire    equal;
    wire    less;
    wire    sNaN_a;
    wire    qNaN_a;
    wire    sNaN_b;
    wire    qNaN_b;

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            float_out   <= 32'h00000000;
            IV          <= 1'b0;
            ready       <= 1'b0;
        end
        
        else if (kill || (load && !(op_min || op_max))) begin
            float_out   <= 32'h00000000;
            IV          <= 1'b0;
            ready       <= 1'b0;
        end

        else if (load) begin
            if (op_min) begin
                if ((qNaN_a || sNaN_a) && (qNaN_b || sNaN_b))
                    float_out   <= 32'h7fc00000;

                else if (less)
                    float_out   <= a;

                else if (greater || qNaN_a || sNaN_a)
                    float_out   <= b;

                else if (equal) // -0.0f < 0.0f
                    float_out   <= {a[31] | b[31], a[30:0]};

                else            // less
                    float_out   <= a;
            end

            else if (op_max) begin
                if ((qNaN_a || sNaN_a) && (qNaN_b || sNaN_b))
                    float_out   <= 32'h7fc00000;

                else if (less || qNaN_a || sNaN_a)
                    float_out   <= b;

                else if (equal) // -0.0f < 0.0f
                    float_out   <= {a[31] & b[31], a[30:0]};

                else            // greater
                    float_out   <= a;
            end
            
            IV      <= sNaN_a || sNaN_b;
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

        .greater(greater),
        .equal(equal),
        .less(less),
        .unordered()
    );

endmodule
