// This program was cloned from: https://github.com/abnoname/iceZ0mb1e
// License: MIT License

//
// iceZ0mb1e - FPGA 8-Bit TV80 SoC for Lattice iCE40
// with complete open-source toolchain flow using yosys and SDCC
//
// Copyright (c) 2018 Franz Neumann (netinside2000@gmx.de)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

module simplei2c(
	input clk,
	input clk_i2c_en,
	input reset,

	output req_next,

	input start,
	input restart,
	input stop,
	input mode_rw,
	input ack_sda,

	input[7:0] data_write,
	output[7:0] data_read,

	input i2c_sda_in,
	output i2c_sda_out,
	output i2c_sda_oen,
	output i2c_scl_out
);

	localparam STATE_IDLE = 4'h0;
	localparam STATE_START_L = 4'h1;
	localparam STATE_START_H = 4'h2;
	localparam STATE_DATA_L = 4'h3;
	localparam STATE_DATA_H = 4'h4;
	localparam STATE_ACK_L = 4'h5;
	localparam STATE_ACK_H = 4'h6;
	localparam STATE_REQ1 = 4'h7;
	localparam STATE_REQ2 = 4'h8;
	localparam STATE_STOP_L = 4'h9;
	localparam STATE_STOP_H = 4'hA;

    `define MODE_WR 1'b0
    `define MODE_RD 1'b1

	reg [7:0] data_read;
	wire req_next;

	reg [3:0] fsm_state;
	reg [7:0] bit_count;
	reg i2c_sda;
	reg i2c_scl;
	wire i2c_scl_out = i2c_scl;
	wire i2c_sda_out = i2c_sda;
	wire i2c_sda_oen;

	assign i2c_sda_oen = ((i2c_sda) == 1'b0) ? 1'b1 : 1'b0; //drive low -> driver enable

	assign req_next = (fsm_state == STATE_REQ1) | (fsm_state == STATE_IDLE);

	always @(posedge clk) begin
		if (reset == 1'b1) begin
			fsm_state <= STATE_IDLE;
		end	else begin
			if (start == 1'b1) begin
				bit_count <= 8'd7;
			end
			case(fsm_state)
				STATE_IDLE: begin
					i2c_sda <= 1'b1;
					i2c_scl <= 1'b1;
					if (start == 1'b1) begin
						fsm_state <= STATE_START_L;
					end
				end

				STATE_START_L: begin
					i2c_sda <= 1'b0;
					i2c_scl <= 1'b1;
					if (clk_i2c_en == 1'b1) begin
						fsm_state <= STATE_START_H;
					end
				end
				STATE_START_H: begin
					i2c_scl <= 1'b0;
					if (clk_i2c_en == 1'b1) begin
						fsm_state <= STATE_DATA_L;
					end
				end

				STATE_DATA_L: begin
					i2c_scl <= 1'b0;
					i2c_sda <= (mode_rw == `MODE_WR) ? data_write[bit_count] : 1'b1; //high z
					if (clk_i2c_en == 1'b1) begin
						fsm_state <= STATE_DATA_H;
					end
				end
				STATE_DATA_H: begin
					i2c_scl <= 1'b1;
					data_read[bit_count] <= i2c_sda_in;
					if (clk_i2c_en == 1'b1) begin
						if (bit_count == 8'd0) begin
							fsm_state <= STATE_ACK_L;
						end else begin
							fsm_state <= STATE_DATA_L;
							bit_count <= bit_count - 1;
						end
					end
				end

				STATE_ACK_L: begin
					i2c_scl <= 1'b0;
					i2c_sda <= ack_sda;
					if (clk_i2c_en == 1'b1) begin
						fsm_state <= STATE_ACK_H;
					end
				end
				STATE_ACK_H: begin
					i2c_scl <= 1'b1;
					i2c_sda <= ack_sda;
					if (clk_i2c_en == 1'b1) begin
						if ( stop == 1'b1 ) begin
							fsm_state <= STATE_STOP_L;
						end else begin
							fsm_state <= STATE_REQ1;
						end
					end
				end

				STATE_REQ1: begin
					if (start == 1'b1) begin
						fsm_state <= STATE_REQ2;
					end
				end
				STATE_REQ2: begin
					if (clk_i2c_en == 1'b1) begin
						if ( restart == 1'b1 ) begin
							fsm_state <= STATE_START_L;
						end else begin
							fsm_state <= STATE_DATA_L;
						end
					end
				end

				STATE_STOP_L: begin
					i2c_scl <= 1'b0;
					i2c_sda <= 1'b0;
					if (clk_i2c_en == 1'b1) begin
						fsm_state <= STATE_STOP_H;
					end
				end
				STATE_STOP_H: begin
					i2c_scl <= 1'b1;
					if (clk_i2c_en == 1'b1) begin
						fsm_state <= STATE_IDLE;
					end
				end
			endcase
		end
	end
endmodule
