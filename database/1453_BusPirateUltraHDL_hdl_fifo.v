// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

/*
 *  IcoProg -- Programmer and Debug Tool for the IcoBoard
 *
 *  Copyright (C) 2016  Clifford Wolf <clifford@clifford.at>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
 //https://github.com/cliffordwolf/icotools/blob/master/icosoc/common/icosoc_crossclkfifo.v
`ifndef __FIFO__
`define __FIFO__
module fifo #(
	parameter WIDTH = 16,
	parameter DEPTH = 512
) (
	input 								 reset,
	input                  in_clock,
	input                  in_shift,
	input      [WIDTH-1:0] in_data,
	output reg             in_full,
	output reg             in_nempty,

	input 								out_clock,
	input                  out_pop,
	output  reg  [WIDTH-1:0] out_data,
	output reg             out_nempty
);
	localparam integer ABITS = $clog2(DEPTH);

	initial begin
		in_full = 0;
		in_nempty = 0;
		out_nempty = 0;
	end

	reg [ABITS-1:0] in_pos = 0;
	reg [ABITS-1:0] out_pos = 0;

	reg [WIDTH-1:0] memory [0:DEPTH-1];

	wire [ABITS-1:0] next_in_pos = (in_pos == DEPTH-1) ? 0 : in_pos + 1;
	wire [ABITS-1:0] next_next_in_pos = (next_in_pos == DEPTH-1) ? 0 : next_in_pos + 1;

	wire [ABITS-1:0] next_out_pos = (out_pos == DEPTH-1) ? 0 : out_pos + 1;
	//reg [WIDTH-1:0] out_data_d = 0;

	//assign out_data = out_nempty ? out_data_d : 0; //this is from Clifords example, but it won't automatically infer BRAM if we use it....

	always @(posedge in_clock) begin
		if (reset) begin
			in_pos<=0;
		end else if(in_shift && !in_full) begin
			memory[in_pos] <= in_data;
			in_full <= (next_next_in_pos == out_pos);
			in_nempty <= 1;
			in_pos <= next_in_pos;
		end else begin
			in_full <= (next_in_pos == out_pos);
			in_nempty <= (in_pos != out_pos);
		end
	end

	always @(posedge out_clock) begin
	if (reset) begin
		out_pos<=0;
	end else if (out_pop && out_nempty) begin
			out_data <= memory[next_out_pos];
			out_nempty <= (next_out_pos != in_pos);
			out_pos <= next_out_pos;
		end else begin
			out_data <= memory[out_pos];
			out_nempty <= (out_pos != in_pos);
		end
	end


endmodule
`endif
