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

module airi5c_rounding_logic
#(
    parameter       n = 23
)
(
    input   [2:0]   rm,

    input           sticky_bit,
    input           round_bit,

    input   [n-1:0] in,
    input           sgn,

    output  [n-1:0] out,
    output          carry,

    output          inexact
);

    wire    r_and_s;
    wire    r_and_not_s;
    wire    r_or_s;
    reg     inc;

    assign  r_and_s         = round_bit && sticky_bit;
    assign  r_and_not_s     = round_bit && !sticky_bit;
    assign  r_or_s          = round_bit || sticky_bit;
    assign  inexact         = r_or_s;

    always @(*) begin
        case (rm)
                        // round to nearest, ties to even
        `FPU_RM_RNE:    inc = r_and_s || (r_and_not_s && in[0]);

                        // round to nearest, ties to max magnitude
        `FPU_RM_RMM:    inc = r_and_s || (r_and_not_s && !in[0]);

                        // round towards zero (truncate fraction)
        `FPU_RM_RTZ:    inc = 1'b0;

                        // round down (towards -inf)
        `FPU_RM_RDN:    inc = r_or_s && sgn;

                        // round up (towards +inf)
        `FPU_RM_RUP:    inc = r_or_s && !sgn;

        default:        inc = 1'b0;
        endcase
    end

    assign  {carry, out}    = in + inc;

endmodule