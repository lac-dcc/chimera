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

`ifndef _DS_VOLUME_
`define _DS_VOLUME_

`default_nettype none

// volume control and format conversion for the delta-sigma modulator
module stud_ds_volume
#(
	parameter AUDIO_WIDTH=16,					// audio data input and output width
	VOLUME_WIDTH=8								// volume input width
)
(
	output reg [AUDIO_WIDTH - 1:0] audio_o,		// audio data output (unsigned)

	input signed [AUDIO_WIDTH - 1:0] audio_i,	// audio data input (signed)

	input mute_i,								// mute input, 1'b0 => normal operation, 1'b1 => output muted
	input [VOLUME_WIDTH - 1:0] volume_i,		// volume input (unsigned)

	input clk_i,								// clock input
	input n_rst_i								// active low synchronous reset
);

// actual volume, an offset of 1 is added to the volume input so that the audio data remains unchanged at
// maximum volume
reg [VOLUME_WIDTH : 0] volume;
// scaled signed audio data
reg signed [AUDIO_WIDTH : 0] audio_scaled;
// scaled audio data offset to unsigned value range, but still in signed format
reg signed [AUDIO_WIDTH-1 : 0] audio_offset;
// scaled, unsigned audio data
reg [AUDIO_WIDTH-1 : 0] next_audio_out;
/* verilator lint_off UNUSED */
reg dummy1;
reg [VOLUME_WIDTH-1:0] dummy2;
/* verilator lint_on UNUSED */

// combinatorics
always @* begin
	if (mute_i) begin
		// mute input activated, set volume to 0
		volume = {VOLUME_WIDTH + 1 {1'b0}};
	end else begin
		// normal operation, add 1 to volume input
		volume = {1'b0, volume_i} + {{VOLUME_WIDTH {1'b0}}, 1'b1};
	end

	// multiply input data by volume and shift right by VOLUME_WIDTH
	{dummy2,audio_scaled} = ({{VOLUME_WIDTH {audio_i[AUDIO_WIDTH - 1]}}, audio_i} * volume) >>> VOLUME_WIDTH;

	// add 2 ^ (AUDIO_WIDTH - 1) to convert the signed audio data to the unsigned data range
	{dummy1,audio_offset} = audio_scaled[AUDIO_WIDTH : 0] + {2'b01, {AUDIO_WIDTH - 1 {1'b0}}};
	
	// truncate result to AUDIO_WIDTH bits
	next_audio_out = audio_offset[AUDIO_WIDTH - 1 : 0];
end

// registers
always @(posedge clk_i) begin
	if (!n_rst_i) begin
		// synchronously reset register values
		// start audio output at 50 % i.e. 0
		audio_o <= {1'b0, {AUDIO_WIDTH - 1 {1'b1}}};
	end else begin
		audio_o <= next_audio_out;
	end
end
	
endmodule

`endif
