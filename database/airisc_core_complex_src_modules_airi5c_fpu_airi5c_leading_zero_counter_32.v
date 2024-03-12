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

// super fast leading zero counter
module airi5c_leading_zero_counter_32
(
    input       [31:0]  in,
    output  reg [4:0]   y,
    output              a
);

    wire    [7:0]   a_int;
    wire    [1:0]   y_int [7:0];

    wire            a7_nand_a6;
    wire            a5_nand_a4;
    wire            a3_nand_a2;
    wire            a1_nand_a0;

    assign          a7_nand_a6  = !(a_int[7] && a_int[6]);
    assign          a5_nand_a4  = !(a_int[5] && a_int[4]);
    assign          a3_nand_a2  = !(a_int[3] && a_int[2]);
    assign          a1_nand_a0  = !(a_int[1] && a_int[0]);
    assign          a           = !(a1_nand_a0 || a3_nand_a2) && y[4];

    always @(*) begin
        y[4] = !(a7_nand_a6 || a5_nand_a4);
        y[3] = !(a7_nand_a6 || (!a5_nand_a4 && a3_nand_a2));
        y[2] =
            ((a_int[1] || !a_int[2]) && a_int[3] && a_int[5] && a_int[7]) ||
            (!(a_int[4] && a_int[6]) && !(a_int[6] && !a_int[5]) && a_int[7]);

        case (y[4:2])
        3'b000:     y[1:0] = y_int[7];
        3'b001:     y[1:0] = y_int[6];
        3'b010:     y[1:0] = y_int[5];
        3'b011:     y[1:0] = y_int[4];
        3'b100:     y[1:0] = y_int[3];
        3'b101:     y[1:0] = y_int[2];
        3'b110:     y[1:0] = y_int[1];
        3'b111:     y[1:0] = y_int[0];
        default:    y[1:0] = 2'b00;
        endcase
    end

    generate
        genvar i;
        
        for (i = 0; i < 8; i = i + 1) begin: gen_LZC_4
            airi5c_leading_zero_counter_4 LZC_4_inst
            (
                .in(in[i*4+3:i*4]),
                .y(y_int[i]),
                .a(a_int[i])
            );
        end
    endgenerate

endmodule