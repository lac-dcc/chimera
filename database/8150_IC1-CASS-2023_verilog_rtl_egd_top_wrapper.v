// This program was cloned from: https://github.com/unic-cass/IC1-CASS-2023
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
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

// Design       : egd_top_wrapper
// Co-Author(s) : Qi Yang Lim, Zhi Lin Tan, Zhuofan Lin, Zixian Guo
// Email        : qiyanglim@ieee.org, zhilintan@ieee.org, henrylll0406@gmail.com, itslaleyla@gmail.com
// Mentor       : Yang Wei Lim (https://scholar.google.com.my/citations?user=NURveMkAAAAJ&hl=en)
// File         : egd_top_wrapper.v
// Modified     : Aug 30, 2023
//-------------------------------------------------------------------------------------------------------
// Description 
// Wrapper for egd_top to communicate with Caravel harness pins
//-------------------------------------------------------------------------------------------------------

module egd_top_wrapper (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,

    // Logic Analyzer Signals
    input           la_data_in_65,
    input  [15:0]   la_data_in_58_43,
    input  [1:0]    la_data_in_60_59,
    output [7:0]    la_data_out_23_16,
    output [2:0]    la_data_out_26_24,
    output [3:0]    la_data_out_30_27
);
    wire clk;
    wire rst;

    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = wb_clk_i;
    assign rst = la_data_in_65;

    egd_top egd_top (
        .clk                        (clk),
        .reset_n                    (rst),

        .BitStream_buffer_input     (la_data_in_58_43),
        .exp_golomb_sel             (la_data_in_60_59),

        .exp_golomb_decoding_output (la_data_out_23_16),
        .half_fill_counter          (la_data_out_26_24),
        .reset_counter              (la_data_out_30_27)
    );
endmodule
