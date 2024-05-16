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

module airi5c_classifier
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,

    input               op_class,

    input               sgn,
    input               zero,
    input               inf,
    input               sNaN,
    input               qNaN,
    input               denormal,

    output  reg [31:0]  int_out,

    output  reg         ready
);

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            int_out <= 32'h00000000;
            ready   <= 1'b0;
        end
        
        else if (kill || (load && !op_class)) begin
            int_out <= 32'h00000000;
            ready   <= 1'b0;
        end

        else if (load) begin
            // 0.0
            if (!sgn && zero)
                int_out <= 32'h00000010;

            // -0.0
            else if (sgn && zero)
                int_out <= 32'h00000008;

            // +inf
            else if (!sgn && inf)
                int_out <= 32'h00000080;

            // -inf
            else if (sgn && inf)
                int_out <= 32'h00000001;

            // sNaN
            else if (sNaN)
                int_out <= 32'h00000100;

            // qNaN
            else if (qNaN)
                int_out <= 32'h00000200;

            // positive normal number
            else if (!sgn && !denormal)
                int_out <= 32'h00000040;

            // negative normal number
            else if (sgn && !denormal)
                int_out <= 32'h00000002;

            // positive denormal number
            else if (!sgn && denormal)
                int_out <= 32'h00000020;

            // negative denormal number
            else if (sgn && denormal)
                int_out <= 32'h00000004;

            else
                int_out <= 32'h00000000;

            ready   <= 1'b1;
        end

        else
            ready   <= 1'b0;
    end

endmodule