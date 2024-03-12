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

module airi5c_rshifter_static
#(
    parameter       n       = 8,
    parameter       offset  = 1
)
(
    input       [n-1:0] in,
    input               sel,
    input               sgn,

    output  reg [n-1:0] out,
    output  reg         sticky_bit
);

    always @(*) begin
        if (sel) begin
            out         = {{offset{sgn}}, in[n-1:offset]};
            sticky_bit  = |in[offset-1:0];
        end

        else begin
            out         = in;
            sticky_bit  = 1'b0;
        end
    end

endmodule