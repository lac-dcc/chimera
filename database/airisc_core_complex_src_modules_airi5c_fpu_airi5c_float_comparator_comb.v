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

module airi5c_float_comparator_comb
(
    input   [31:0]  a,
    input   [31:0]  b,

    output          sNaN_a,
    output          qNaN_a,
    output          sNaN_b,
    output          qNaN_b,

    output  reg     greater,
    output  reg     equal,
    output  reg     less,
    output          unordered
);

    // input a
    wire            sgn_a;
    wire    [23:0]  man_a;
    wire    [7:0]   exp_a;
    wire            zero_a;

    airi5c_splitter splitter_a
    (
        .float_in(a),

        .man(man_a),
        .Exp(exp_a),
        .sgn(sgn_a),

        .zero(zero_a),
        .inf(),
        .sNaN(sNaN_a),
        .qNaN(qNaN_a),
        .denormal()
    );

    // input b
    wire            sgn_b;
    wire    [23:0]  man_b;
    wire    [7:0]   exp_b;
    wire            zero_b;

    airi5c_splitter splitter_b
    (
        .float_in(b),

        .man(man_b),
        .Exp(exp_b),
        .sgn(sgn_b),

        .zero(zero_b),
        .inf(),
        .sNaN(sNaN_b),
        .qNaN(qNaN_b),
        .denormal()
    );

    wire    sgn_a_int;
    wire    sgn_b_int;

    assign  sgn_a_int   = sgn_a && !zero_a;
    assign  sgn_b_int   = sgn_b && !zero_b;
    assign  unordered   = sNaN_a || qNaN_a || sNaN_b || qNaN_b;

    always @(*) begin
        if (unordered) begin
            greater = 1'b0;
            equal   = 1'b0;
            less    = 1'b0;
        end

        else begin
            if (exp_a == exp_b) begin
                greater = man_a > man_b;
                less    = man_a < man_b;
            end

            else begin
                greater = exp_a > exp_b;
                less    = exp_a < exp_b;
            end

            if ((greater && sgn_a_int) || (less && sgn_b_int)) begin
                greater = !greater;
                less    = !less;
            end

            equal = !(greater || less);

            // equal magnitude, different signs
            if (equal && (sgn_a_int ^ sgn_b_int)) begin
                greater = sgn_b_int;
                less    = sgn_a_int;
                equal   = !(greater || less);
            end
        end
    end

endmodule