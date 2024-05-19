// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2022 Johannes Kepler University, Institute for 
// Integrated Circuits (H. Pretl, L. Blagojevic, M. Esen, K. Freinberger, 
// M. Golser, M. Hackl, A. Hinterdorfer, O. Kara, D. Kellerer, P. Kotek, 
// J. Mayrhofer, M. Meingast, T. Pankratz, J. Ratschenberger, R. Reddy.Mitta, 
// P. Schmidt, S. Seidl, I. Shala, M. Zöbl)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`ifndef _FIRST_ORDER_MODULATOR_
`define _FIRST_ORDER_MODULATOR_

`default_nettype none

// first order delta-sigma modulator
module stud_first_order_modulator
#(
    parameter BITWIDTH = 16             // audio data input width
)
(
    input n_rst_i,                      // active low synchronous reset
    input clk_i,                        // clock input

    input [BITWIDTH - 1 : 0] data_i,    // audio data input (unsigned)

    output reg mod_o                    // 1 bit modulator output
);

// feedback line
reg [BITWIDTH - 1 : 0] fb;
reg [BITWIDTH - 1 : 0] fb_next;

// accumulator
reg [BITWIDTH : 0] acc;
reg [BITWIDTH : 0] acc_next;

// modulator output
reg mod_next;

// combinatorics
always @* begin
    // least significant bits of the accumulator get delayed by 1 clock cycle
    // and then fed back into the accumulator
    fb_next = acc[BITWIDTH - 1 : 0];
    acc_next = {1'b0, data_i} + {1'b0, fb};

    // most significant bit of the accumulator becomes the output
    mod_next = acc[BITWIDTH];
end

// registers
always @(posedge clk_i) begin
    if (!n_rst_i) begin
        // synchronously reset register values
        fb <= {BITWIDTH {1'b0}};
        acc <= {BITWIDTH + 1 {1'b0}};
        mod_o <= 1'b0;
    end else begin
        fb <= fb_next;
        acc <= acc_next;

        mod_o <= mod_next;
    end
end

endmodule

`endif
