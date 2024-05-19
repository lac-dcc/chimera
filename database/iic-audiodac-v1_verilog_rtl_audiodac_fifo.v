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
* AUDIODAC_FIFO -- Generic FIFO design for use with delta-sigma modulator
*/

`default_nettype none
`ifndef __AUDIODAC_FIFO
`define __AUDIODAC_FIFO

module audiodac_fifo
	#(parameter AUDIO_WIDTH=16, FIFO_SIZE=9, FIFO_ASYNC=1) (
	// 0=sync, 1=async write I/F

	input 		[AUDIO_WIDTH-1:0]	fifo_data_i,
	input					fifo_rdy_i,
	// note that fifo_rdy_i/fifo_data_i can originate from an asynchronous
	// clk domain, so potentially needs to be synchronized; 
	// use FIFO_ASYNC to select the proper behaviour
	output reg				fifo_ack_o,
	output wire				fifo_full_o,
	output wire				fifo_empty_o,

	output wire	[AUDIO_WIDTH-1:0]	audio_data_o,
	input					audio_rd_i,
	
	input					rst_n_i,
	input					clk_i,

	input					tst_fifo_loop_i
);

	reg		[FIFO_SIZE-1:0]		read_ptr, write_ptr;
	wire		[FIFO_SIZE-1:0]		next_write;
	reg		[AUDIO_WIDTH-1:0]	fifo_reg[0:(1<<FIFO_SIZE)-1];

	// needed for asynch. I/F synchronization (use 2 stages)
	reg     				fifo_rdy_del1, fifo_rdy_del2;
	reg		[AUDIO_WIDTH-1:0]	fifo_data_del1, fifo_data_del2;


	assign fifo_full_o = (next_write === read_ptr);
	assign fifo_empty_o = (write_ptr === read_ptr);

	assign audio_data_o = fifo_reg[read_ptr];
	assign next_write = write_ptr + 1'b1;

	wire _fifo_rdy = FIFO_ASYNC ? fifo_rdy_del2 : fifo_rdy_i;
	wire [AUDIO_WIDTH-1:0] _fifo_data = FIFO_ASYNC ? fifo_data_del2 : fifo_data_i;

	always @(posedge clk_i) begin
		if (!rst_n_i) begin
			// reset all registers
			fifo_ack_o <= 1'b0;
			read_ptr <= {FIFO_SIZE{1'b0}};
			write_ptr <= {FIFO_SIZE{1'b0}};

			// for FIFO only first entry needs reset, so that
			// first read is OK
			// reset to midscale of UINT
              		fifo_reg[0] <= {1'b1,{(AUDIO_WIDTH-1){1'b0}}};

			fifo_rdy_del1 <= 1'b0;
			fifo_rdy_del2 <= 1'b0;
			fifo_data_del1 <= {AUDIO_WIDTH{1'b0}};
			fifo_data_del2 <= {AUDIO_WIDTH{1'b0}};
		end else begin
                       	// use two stages to sync-in fifo_rdy_i
                       	fifo_rdy_del2 <= fifo_rdy_del1;
                       	fifo_rdy_del1 <= fifo_rdy_i;
                       	// use two stages to sync-in fifo_data_i
                       	fifo_data_del2 <= fifo_data_del1;
                       	fifo_data_del1 <= fifo_data_i;

			// manage the FIFO read process, if audio_rd is asserted
			// the read pointer location is increased, as long as
			// the FIFO is not empty
			if (audio_rd_i && (!fifo_empty_o || tst_fifo_loop_i))
				read_ptr <= read_ptr + 1'b1;
		
			// manage the FIFO write process. if fifo_rdy is
			// asserted, and the FIFO is not full, and no pending ack,
			// then the write pointer is increased and the datum is 
			// written into the FIFO. further ack is asserted
			if (_fifo_rdy && !fifo_ack_o && !fifo_full_o) begin
				write_ptr <= next_write;
				fifo_reg[next_write] <= _fifo_data;
				fifo_ack_o <= 1'b1;
			end

			if (!_fifo_rdy)
				fifo_ack_o <= 1'b0;
		end
	end

endmodule // audiodac_fifo

`endif
`default_nettype wire
