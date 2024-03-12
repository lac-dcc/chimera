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

module airi5c_rshifter
#(
    parameter       n = 8,  // data bits
    parameter       s = 3   // select bits
)
(
    input   [n-1:0] in,
    input   [s-1:0] sel,
    input           sgn,

    output  [n-1:0] out,
    output          sticky_bit
);

    wire    [n-1:0] out_int [s-1:0];
    wire    [s-1:0] sticky_bit_int;

    assign          out         = out_int[s-1];
    assign          sticky_bit  = |sticky_bit_int;

    generate
        genvar i;

        for (i = 0; i < s; i = i+1) begin: gen_rshifter_static
            if (i == 0) begin
                airi5c_rshifter_static #(n, 2**i) rshifter_static_inst
                (
                    .in(in),
                    .sel(sel[i]),
                    .sgn(sgn),

                    .out(out_int[i]),
                    .sticky_bit(sticky_bit_int[i])
                );
            end

            else begin
                airi5c_rshifter_static #(n, 2**i) rshifter_static_inst
                (
                    .in(out_int[i-1]),
                    .sel(sel[i]),
                    .sgn(sgn),

                    .out(out_int[i]),
                    .sticky_bit(sticky_bit_int[i])
                );
            end
        end
    endgenerate

endmodule