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

`ifndef _DS_MODULATOR_
`define _DS_MODULATOR_

`include "stud_dsmod.v"
`include "stud_strobe.v"
`include "stud_ds_volume.v"

`default_nettype none

module stud_ds_modulator #(parameter AUDIO_WIDTH = 16, VOLUME_WIDTH = 8)(
	input								clk_i,
	input								rst_n_i,
	input signed [AUDIO_WIDTH - 1 : 0]	audio_i,
	input								mode_i,
	input			[1 : 0]				osr_i,
	input								mute_i,
	input		 [VOLUME_WIDTH - 1 : 0]	volume_i,
	output				wire			audio_rd,
	output				wire			ds_o,
	output  			wire			ds_n_o
);
	
	wire [AUDIO_WIDTH-1:0] audio;
	assign ds_n_o = ~ds_o;
	
	stud_strobe strobe1 (
		.clk_i(clk_i),
		.rst_n_i(rst_n_i),
		.osr_i(osr_i),
		.audio_rd_o(audio_rd)
  	);
	
	stud_ds_volume #(.AUDIO_WIDTH(AUDIO_WIDTH), .VOLUME_WIDTH(VOLUME_WIDTH)) ds_volume1 (
		.audio_o(audio),
		.audio_i(audio_i),
		.mute_i(mute_i),
		.volume_i(volume_i),
		.clk_i(clk_i),
		.n_rst_i(rst_n_i)
	);
	
	stud_dsmod #(.BITWIDTH(AUDIO_WIDTH)) modulator (
		.n_rst_i(rst_n_i),
		.clk_i(clk_i),
		.mode_i(mode_i),
		.data_i(audio),
		.mod_o(ds_o)
	);
	
endmodule

`endif
