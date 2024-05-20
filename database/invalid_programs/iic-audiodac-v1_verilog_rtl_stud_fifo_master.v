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

`ifndef _FIFO_MASTER_
`define _FIFO_MASTER_

`include "stud_fifo.v"
`include "stud_sine_generator.v"

module stud_fifo_master #(parameter FIFO_LENGTH = 128, SIGNAL_WIDTH = 16, WB_DATA_WIDTH = 32, WB_SEL_WIDTH = 4, SYNC_LEN = 2)
	(
    	input [SIGNAL_WIDTH-1:0] 	fifo_i,
    	input [3:0] 			test_sine_psc_i,
	input fifo_rdy_i, audio_rd_i, rst_n_i, clk_i, test_mode_i, 
    	output reg [SIGNAL_WIDTH-1:0] 	audio_o,
    	output fifo_ack_o, fifo_full_o, fifo_empty_o 
	);
    	/* Internal signals */
    	wire [SIGNAL_WIDTH-1:0] fifo_audio_o, sine_audio_o, sine_buffered_o;
    	reg [SIGNAL_WIDTH-1:0] fifo_data_internal;
    	reg fifo_data_rdy;
    
	/* MODULES */
    	stud_fifo #(FIFO_LENGTH, SIGNAL_WIDTH, SYNC_LEN) fifo1(
		.fifo_i(fifo_data_internal),
		.fifo_rdy_i(fifo_data_rdy),
		.audio_rd_i(audio_rd_i),
		.rst_n_i(rst_n_i),
		.clk_i(clk_i),
		.fifo_ack_o(fifo_ack_o),
		.fifo_full_o(fifo_full_o),
		.fifo_empty_o(fifo_empty_o),
		.audio_o(fifo_audio_o)
	);
    
    	stud_sine_generator sine_gen1 (
        	.clk_i(clk_i),
        	.rst_n_i(rst_n_i),
        	.psc_i(test_sine_psc_i),
        	.sine_o(sine_audio_o)
    	);
    
    	stud_synchronizer #(1, SIGNAL_WIDTH) sine_buffer (
		.clk_i(audio_rd_i),
		.rst_n_i(rst_n_i),
		.input_i(sine_audio_o),
		.output_o(sine_buffered_o)
	);
	
	always @(posedge clk_i)
	begin
        	// If test mode is active, connect sine generator buffer to output
		if(test_mode_i) begin
            		audio_o <= sine_buffered_o;
		end else begin
			audio_o <= fifo_audio_o;
		end
			
		fifo_data_internal <= fifo_i;
		fifo_data_rdy <= fifo_rdy_i;
    	end
endmodule
`endif
