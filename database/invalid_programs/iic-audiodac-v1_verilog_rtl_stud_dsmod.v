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

`ifndef _DSMOD_
`define _DSMOD_

`default_nettype none

`include "stud_second_order_modulator.v"
`include "stud_first_order_modulator.v"

// delta-sigma modulator with first and second order mode
module stud_dsmod
#(
    parameter BITWIDTH = 16             // audio data input width
)
(
    input n_rst_i,                      // active low synchronous reset
    input clk_i,                        // clock input

    input mode_i,                       // modulator mode, 1'b0 -> first order, 1'b1 -> second order
    
    input [BITWIDTH - 1 : 0] data_i,    // audio data input (unsigned)

    output wire mod_o                   // 1 bit modulator output
);

// mode input delayed by 1 clock cycle
reg prev_mode;
// active low reset strobe for the first order modulator, triggered every time the mode changes
reg rst_strb;

// input data for the first order modulator
// In first order mode, this is simply the input audio data.
// In second order mode, the two bit output of the second order modulator is padded with zeros
// and used as the input for the first order modulator.
reg [BITWIDTH - 1 : 0] first_order_data;

// output of the first stage (second oder modulator)
wire [1 : 0] stage1;
// output of the second stage (first order modulator)
wire stage2;

// registers
always @(posedge clk_i) begin
    if (!n_rst_i) begin
        // synchronously reset register values
        prev_mode <= 1'b0;
    end else begin
        // store mode input
        prev_mode <= mode_i;
    end
end

// combinatorics
always @* begin
    // gerate negative strobe every time the mode changes
    rst_strb = mode_i == prev_mode;

    if (mode_i) begin
        // second order mode => use output of the first stage (second order modulator) as input data
        // for the second stage (first order modulator)
        first_order_data = {stage1, {BITWIDTH - 2 {1'b0}}};
    end else begin
        // first order mode => use audio data input as input for the first order modulator
        first_order_data = data_i;
    end
end

// second order modulator, first stage of the design when in second order mode
stud_second_order_modulator #(.BITWIDTH(BITWIDTH)) modulator1
(
    .n_rst_i(n_rst_i & mode_i), // disable first stage when first order mode is enabled
    .clk_i(clk_i),
    .data_i(data_i),
    .mod_o(stage1)
);

// first order modulator, second stage of the design when in second order mode
stud_first_order_modulator #(.BITWIDTH(BITWIDTH)) modulator2
(
    .n_rst_i(n_rst_i & rst_strb), // reset second stage every time the mode chages
    .clk_i(clk_i),
    .data_i(first_order_data),
    .mod_o(stage2)
);

// output of the modulator is the output of the second stage
assign mod_o = stage2;

endmodule

`endif
