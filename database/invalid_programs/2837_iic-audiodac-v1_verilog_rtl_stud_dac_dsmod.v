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


`ifndef _DAC_DSMOD_
`define _DAC_DSMOD_

`include "stud_fifo_master.v"
`include "stud_ds_modulator.v"

module stud_dac_dsmod #(parameter AUDIO_WIDTH = 16, VOLUME_WIDTH = 8,FIFO_LENGTH = 128, WB_DATA_WIDTH = 32, WB_SEL_WIDTH = 4, SYNC_LEN = 2)(
`ifdef USE_POWER_PINS
	inout 				vccd1,
	inout 				vssd1,
`endif
	input [AUDIO_WIDTH-1:0] 	fifo_i,
    	input [3:0] 			test_sine_psc_i,
	input 				fifo_rdy_i, rst_n_i, clk_i, test_mode_i, 
   	output 				fifo_ack_o, fifo_full_o, fifo_empty_o, 
	output				ds_o, ds_n_o,
	input [1:0]			osr_i,
	input				mute_i, mode_i,
	input [VOLUME_WIDTH - 1 : 0]	volume_i
);
	
	
	wire [AUDIO_WIDTH-1:0] data;
	wire audio_rd;
	
	stud_fifo_master #(FIFO_LENGTH, AUDIO_WIDTH, WB_DATA_WIDTH, WB_SEL_WIDTH, SYNC_LEN) DUT(
		.fifo_i(fifo_i),
		.test_sine_psc_i(test_sine_psc_i),
		.fifo_rdy_i(fifo_rdy_i),
		.audio_rd_i(audio_rd),
		.rst_n_i(rst_n_i),
		.clk_i(clk_i),
		.test_mode_i(test_mode_i),
		.fifo_ack_o(fifo_ack_o),
		.fifo_full_o(fifo_full_o),
		.fifo_empty_o(fifo_empty_o),
		.audio_o(data)
    	);
	
	stud_ds_modulator #(.AUDIO_WIDTH(AUDIO_WIDTH), .VOLUME_WIDTH(VOLUME_WIDTH)) modulator(
		.clk_i(clk_i),
		.rst_n_i(rst_n_i),
		.audio_i(data),
		.mode_i(mode_i),
		.osr_i(osr_i),
		.mute_i(mute_i),
		.volume_i(volume_i),
		.audio_rd(audio_rd),
		.ds_o(ds_o),
		.ds_n_o(ds_n_o)
	);
	
endmodule

`endif

