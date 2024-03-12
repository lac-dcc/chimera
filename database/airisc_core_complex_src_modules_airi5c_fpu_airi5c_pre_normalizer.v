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

module airi5c_pre_normalizer
(
    input               zero,
    input               denormal,

    input       [23:0]  man_in,
    input       [7:0]   exp_in,

    output  reg [23:0]  man_out,
    output  reg [9:0]   exp_out
);

    wire    [4:0]   leading_zeros;

    always @(*) begin
        // input is zero: exponent is zero
        if (zero) begin
            exp_out = 10'h000;
            man_out = 24'h000000;
        end

        // input is denormal (but not zero)
        else if (denormal) begin
            // normalize mantissa
            man_out = man_in << leading_zeros;

            //exponent is smallest possible (-126) minus the number of shifts needed to normalize
            exp_out = 10'h382 - {5'b0, leading_zeros};
        end

        else begin
            // mantissa is normalized
            man_out = man_in;

            //subtract bias from exponent
            exp_out = {2'b00, exp_in[7:0]} - 10'h07f;
        end
    end

    airi5c_leading_zero_counter_24 LZC_24_inst
    (
        .in(man_in),
        .y(leading_zeros),
        .a()
    );

endmodule
