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

`ifndef _FIFO_
`define _FIFO_

`include "stud_synchronizer.v"

module stud_fifo 
       #( parameter LENGTH = 128,
	  parameter WIDTH = 16,
	  parameter SYNC_LEN = 2
  	)
	(
	  input [WIDTH-1:0] fifo_i,
	  input fifo_rdy_i, audio_rd_i, rst_n_i, clk_i,
	  output reg fifo_ack_o, fifo_full_o, fifo_empty_o,
	  output [WIDTH-1:0] audio_o
	);

	/* Internal buffers */
	reg [WIDTH-1:0] buffer [LENGTH - 1 : 0];
	reg [$clog2(LENGTH)-1:0] buffer_r_ind;
	reg [$clog2(LENGTH)-1:0] buffer_w_ind;
	wire fifo_rdy; // Synchronous fifo_rdy
	reg [WIDTH-1:0] audio_tmp;
	reg fifo_ack_next;
	reg fifo_rdy_last;
	reg audio_rd_last;

	/* External modules */
	stud_synchronizer #(SYNC_LEN,1) fifo_rdy_sync(
		.clk_i(clk_i),
		.rst_n_i(rst_n_i),
		.input_i(fifo_rdy_i),
		.output_o(fifo_rdy)
	);

	/* CLK_i process */
	always @(posedge clk_i) begin
		if(~rst_n_i) begin
			/* Reset whole buffer, for loops are allowed (according to internet) */
			buffer[0] <= {WIDTH{1'b0}};
			buffer_r_ind <= {$clog2(LENGTH){1'b0}};
			buffer_w_ind <= {$clog2(LENGTH){1'b0}};
			audio_tmp <= {WIDTH{1'b0}};
			fifo_empty_o <= 1'b1;
			fifo_full_o <= 1'b0;
			fifo_ack_o <= 1'b0;
			fifo_ack_next <= 1'b0;
		end else begin

			/* FIFO WRITE */
			if(fifo_rdy && ! fifo_rdy_last && !fifo_full_o) begin
				buffer[buffer_w_ind] <= fifo_i;
				buffer_w_ind <= buffer_w_ind + 1'b1;
				fifo_ack_next <= 1'b1;
			end else begin
				buffer[buffer_w_ind] <= buffer[buffer_w_ind];
				buffer_w_ind <= buffer_w_ind;
				fifo_ack_next <= 1'b0;
			end

			/* FIFO READ */
			if(audio_rd_i && !audio_rd_last && !fifo_empty_o) begin
				audio_tmp <= buffer[buffer_r_ind];
				buffer_r_ind <= buffer_r_ind + 1'b1;
			end else begin
				audio_tmp <= audio_tmp;
				buffer_r_ind <= buffer_r_ind;
			end

			/* FIFO status */
			if (buffer_r_ind == buffer_w_ind) begin
				fifo_empty_o <= 1'b1;
			end else begin
				fifo_empty_o <= 1'b0;
			end
			if(buffer_w_ind == (buffer_r_ind - 1'b1)) begin
				fifo_full_o <= 1'b1;
			end else begin
				fifo_full_o <= 1'b0;
			end

			fifo_ack_o <= fifo_ack_next;
			fifo_rdy_last <= fifo_rdy;
			audio_rd_last <= audio_rd_i;
		end
	end
	assign audio_o = audio_tmp;
endmodule
`endif
