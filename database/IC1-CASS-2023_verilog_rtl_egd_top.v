// This program was cloned from: https://github.com/unic-cass/IC1-CASS-2023
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2022 Efabless Corporation
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

//-------------------------------------------------------------------------------------------------------
// Title    	  : H.264/AVC Baseline Decoder
// Author	 	    : Ke Xu
// Released 	  : April 30, 2008
// Version 		  : 1.0
// Availability	: https://opencores.org/projects/nova
//-------------------------------------------------------------------------------------------------------
// Design    	  : egd_top
// Co-Author(s) : Qi Yang Lim, Zhi Lin Tan, Zhuofan Lin, Zixian Guo
// Email	   	  : qiyanglim@ieee.org, zhilintan@ieee.org, henrylll0406@gmail.com, itslaleyla@gmail.com
// Mentor		    : Yang Wei Lim (https://scholar.google.com.my/citations?user=NURveMkAAAAJ&hl=en)
// File      	  : egd_top.v
// Modified 	  : Sep 19, 2023
//-------------------------------------------------------------------------------------------------------
// Description 
// Top level module for H.264 decoder
//-------------------------------------------------------------------------------------------------------

module egd_top (
  input           clk, reset_n,
  input   [1:0]   exp_golomb_sel,
  input   [15:0]  BitStream_buffer_input,
  
  // inputs for test_data_controller.v
  output 	[2:0] 	half_fill_counter,
  output 	[3:0] 	reset_counter,

  // output for inspection of testbench
  output  [7:0]   exp_golomb_decoding_output
  // output  [15:0]  BitStream_buffer_output
);
  wire  [15:0]  BitStream_buffer_output;
  wire  [3:0]   heading_one_pos, exp_golomb_len;
  wire          heading_one_en;
  wire  [7:0]   temp_egd_out;
  wire  [2:0]   te_range;

  parameter te                             = 2'b11;

  BitStream_buffer BitStream_buffer (
    .clk(~clk),
    .reset_n(reset_n),
    .BitStream_buffer_input(BitStream_buffer_input),
    .exp_golomb_len(exp_golomb_len),

    .BitStream_buffer_valid_n(heading_one_en),
    .BitStream_buffer_output(BitStream_buffer_output),

    .half_fill_counter(half_fill_counter),
    .reset_counter(reset_counter)
  );

  heading_one_detector heading_one_detector (
    .heading_one_en(heading_one_en),
    .BitStream_buffer_output(BitStream_buffer_output),

    .heading_one_pos(heading_one_pos)
  );

  exp_golomb_decoding exp_golomb_decoding (
    .heading_one_pos(heading_one_pos),
    .BitStream_buffer_output(BitStream_buffer_output),
    .exp_golomb_sel(exp_golomb_sel),
    .te_range(te_range),

    .exp_golomb_decoding_output(temp_egd_out),
    .exp_golomb_len(exp_golomb_len)
  );

  assign te_range = (exp_golomb_sel == te) ? (temp_egd_out[2:0] + 1) : 0;
  assign exp_golomb_decoding_output = temp_egd_out;

endmodule
