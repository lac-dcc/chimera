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

`ifndef _SECOND_ORDER_MODULATOR_
`define _SECOND_ORDER_MODULATOR_

// second order delta-sigma modulator, stage 1
module stud_second_order_modulator
#(
    parameter BITWIDTH = 16             // audio data input width
)
(
    input n_rst_i,                      // active low synchronous reset
    input clk_i,                        // clock input

    input [BITWIDTH - 1 : 0] data_i,    // audio data input (unsigned)

    output reg [1 : 0] mod_o            // 2 bit modulator output
);

// counter to realize fs / 4 sampling rate
reg [1 : 0] counter;
reg [1 : 0] counter_next;

// sampling strobe, triggered every 4 cycles
reg sampling_strb;
reg sampling_strb_next;

// feedback line 1
reg [BITWIDTH - 1 : 0] fb1;
reg [BITWIDTH - 1 : 0] fb1_next;

// feedback line 2
reg [BITWIDTH - 1 : 0] fb2;
reg [BITWIDTH - 1 : 0] fb2_next;

// accumulator
reg [BITWIDTH + 1: 0] acc;
reg [BITWIDTH + 1: 0] acc_next;

// modulator output
reg [1 : 0] mod_next;

// counter and sampling strobe combinatorics
always @* begin
    // default assignments
    counter_next = counter;
    sampling_strb_next = 1'b0;

    if (counter == 2'd3) begin
        // reset counter on overflow and trigger strobe
        counter_next = 2'b0;
        sampling_strb_next = 1'b1;
    end else begin
        // increment counter
        counter_next = counter + 2'd1;
    end
end

// modulator combinatorics
always @* begin
    // default assignments
    fb1_next = fb1;
    fb2_next = fb2;
    acc_next = acc;
    mod_next = mod_o;

    // only update registers every sampling interval (4 clock cycles)
    if (sampling_strb) begin
        // fb2 is the (n - 2) least significant bits of the accumulator
        // delayed by 2 sampling intervals (8 clock cycles)
        fb2_next = fb1;

        // fb1 is the (n - 2) least significant bits of the accumulator
        // delayed by 1 sampling interval (4 clock cycles)
        fb1_next = acc[BITWIDTH - 1 : 0];

        // accumulator value = audio data input + 2 * fb1 + (-1) * fb2
        // in order to prevent underflows, an offset of 2 ^ BITWIDTH has to be added to (-1) * fb2
        acc_next = {2'b0, data_i} + ({2'b0, fb1} << 1) + {1'b0, {1'b1, {BITWIDTH {1'b0}}} - {1'b0, fb2}};

        // 2 most significant bits of the accumulator become the output
        mod_next = acc[BITWIDTH + 1 : BITWIDTH];
    end
end

// registers
always @(posedge clk_i) begin
    if (!n_rst_i) begin
        // synchronously reset register values
        counter <= 2'd3; // ensure counter overflow at the start
        sampling_strb <= 1'b0;

        fb1 <= {BITWIDTH {1'b0}};
        fb2 <= {BITWIDTH {1'b0}};
        acc <= {BITWIDTH + 2 {1'b0}};
        mod_o <= 2'b0;
    end else begin
        counter <= counter_next;
        sampling_strb <= sampling_strb_next;

        fb1 <= fb1_next;
        fb2 <= fb2_next;
        acc <= acc_next;

        mod_o <= mod_next;
    end
end

endmodule

`endif
