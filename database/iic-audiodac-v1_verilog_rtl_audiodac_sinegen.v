// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

/*
* SPDX-FileCopyrightText: 2022 Harald Pretl
* Johannes Kepler University, Institute for Integrated Circuits
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* SPDX-License-Identifier: Apache-2.0
*
* Simple sine-generator based on LUT.
*/

`default_nettype none
`ifndef __AUDIODAC_SINEGEN
`define __AUDIODAC_SINEGEN

module audiodac_sinegen (
	output wire	[15:0]			data_o,
	input					data_rd_i,
	input					rst_n_i,
	input					clk_i,

	input					tst_sinegen_en_i,
	input		[3:0]			tst_sinegen_step_i
);

	reg		[5:0]			read_ptr;

	// this bitpattern is a 16b UINT sine with a period of 64 samples with
	// 90% amplitude and an offset of 0x8000
	/* verilator lint_off LITENDIAN */
	localparam [0:(64*16)-1] sin_const = {
		16'h8000,16'h8B4B,16'h9679,16'hA171,16'hAC16,16'hB64E,16'hC000,16'hC915,
		16'hD175,16'hD90D,16'hDFC9,16'hE599,16'hEA6E,16'hEE3D,16'hF0FD,16'hF2A5,
		16'hF333,16'hF2A5,16'hF0FD,16'hEE3D,16'hEA6E,16'hE599,16'hDFC9,16'hD90D,
		16'hD175,16'hC915,16'hC000,16'hB64E,16'hAC16,16'hA171,16'h9679,16'h8B4B,
		16'h8000,16'h74B5,16'h6987,16'h5E8F,16'h53EA,16'h49B2,16'h4000,16'h36EB,
		16'h2E8B,16'h26F3,16'h2037,16'h1A67,16'h1592,16'h11C3,16'h0F03,16'h0D5B,
		16'h0CCD,16'h0D5B,16'h0F03,16'h11C3,16'h1592,16'h1A67,16'h2037,16'h26F3,
		16'h2E8B,16'h36EB,16'h4000,16'h49B2,16'h53EA,16'h5E8F,16'h6987,16'h74B5
	};
	/* verilator lint_on LITENDIAN */

	assign data_o = sin_const[read_ptr*16 +: 16];

	always @(posedge clk_i) begin
		if (!rst_n_i) begin
			// reset all registers
			read_ptr <= 6'b0;
		end else begin
			if (tst_sinegen_en_i && data_rd_i) begin
				read_ptr <= (read_ptr + {2'b0,tst_sinegen_step_i}) % 6'b111111;
			end
		end
	end

endmodule // audiodac_fifo

`endif
`default_nettype wire
