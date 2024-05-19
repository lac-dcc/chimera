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
* AUDIODAC -- 16b Delta-Sigma Modulator with Single-Bit Output
*/

`default_nettype none
`ifndef __AUDIODAC_DSMOD
`define __AUDIODAC_DSMOD

module audiodac_dsmod(
	input 		[15:0]	audio_i,	// audio data from FIFO
	output wire		audio_rd_o, 	// indicates a read from FIFO
	input			rst_n_i,
	input			clk_i,
	input			mode_i, 	// 0 = 1st order, 1 = 2nd order SD-modulator
	input 		[3:0]	volume_i,	// 0 = off, 15 = max volume
	input		[1:0]	osr_i, 		// 0 = 32; 1 = 64, 2 = 128, 3 = 256
	output reg		ds_o,		// single-bit SD-modulator output
	output wire		ds_n_o		//  plus the complementary output
);

	reg 		[15:0]	accu1;
	reg		[15:0]	accu2;
	reg		[1:0]	accu3;
	wire 		[15:0]	audio_scaled;	// audio data treated with volume control
	reg		[7:0]	fetch_ctr;	// clock divideid by osr

	reg		[1:0]	mod2_ctr;	// clk divide by 4 for 1st stage of 2nd order mod.
	reg		[1:0]	mod2_out;	// output 1st stage

	localparam	[7:0]	CTR_OSR32  	=  8'd31;
	localparam	[7:0]	CTR_OSR64  	=  8'd63;
	localparam	[7:0]	CTR_OSR128 	=  8'd127;
	localparam	[7:0]	CTR_OSR256 	=  8'd255;
	localparam	[1:0]	OSR32  		= 2'd0;
	localparam	[1:0]	OSR64  		= 2'd1;
	localparam	[1:0]	OSR128 		= 2'd2;
	localparam	[1:0]	OSR256 		= 2'd3;
	localparam		ORD1 		= 1'd0;
	localparam		ORD2 		= 1'd1;

	// provide out and out_n to make levelshifter easier
  	assign ds_n_o = ~ds_o;

	// we provide volume control in 6dB steps, 0=min (off), 15=max
	assign audio_scaled = (volume_i === 4'd0) ? 16'b0 : audio_i >> (4'd15 - volume_i);

	// the fetch counter controls the read of the next sample from the FIFO
	// counter runs down so decoding is easier for different counter
	// cycles
	assign audio_rd_o = (fetch_ctr === 8'd0);

  	always @(posedge clk_i) begin
		if (!rst_n_i) begin
			// reset all registers
			accu1 <= 16'b0;
			accu2 <= 16'b0;
			accu3 <=  2'b0;
			ds_o <= 1'b0;
			fetch_ctr <= 8'b0;
			mod2_ctr <= 2'b0;
			mod2_out <= 2'b0;
		end else begin
			// sd-modulator is running

			if (fetch_ctr === 8'd0) begin
			// fetch_ctr finished, restart with proper cycle count
			// depending on osr
				case (osr_i)
					OSR32:		fetch_ctr <= CTR_OSR32;
					OSR64:		fetch_ctr <= CTR_OSR64;
					OSR128:		fetch_ctr <= CTR_OSR128;
					OSR256:		fetch_ctr <= CTR_OSR256;
					default:	fetch_ctr <= 8'bx;
				endcase
			end else
				//just keep counting down
				fetch_ctr <= fetch_ctr - 1'b1;
		
			if (mode_i === ORD1) begin
				// delta-sigma modulator 1st order
				// this simple structure works if everything
				// is UINT
				{ds_o,accu1} <= audio_scaled + accu1;
			
			end else if (mode_i === ORD2) begin
				// delta-sigma modulator 2nd order
				// the first stage runs on clk/4, the second
				// stage runs on clk

				if (mod2_ctr === 2'b0) begin
					// this only happens every 4th clk
					// cycle
					{mod2_out,accu1} <= {2'b00,audio_scaled} 
								+ {1'b0,accu1,1'b0} 
								+ 18'h10000 
								- {2'b0,accu2};
					accu2 <= accu1;
				end

				// this is the clk divider for the 1st stage
				mod2_ctr <= mod2_ctr + 1'b1;
				
				// this simple structure is the 2nd stage
				// running on clk
				{ds_o,accu3} <= mod2_out + accu3;
			end
		end
	end
endmodule // audiodac_dsmod

`endif
`default_nettype wire
