/*
 * Copyright (c) 2011, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
 * All rights reserved.
 *
 * Redistribution and use in source and non-source forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in non-source form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 * THIS WORK IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * WORK, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module wb_port #(
	parameter BUF_WIDTH = 3
)
(
	// Wishbone
	input			wb_clk,
	input			wb_rst,
	input		[31:0]	wb_adr_i,
	input			wb_stb_i,
	input			wb_cyc_i,
	input		[2:0]	wb_cti_i,
	input		[1:0]	wb_bte_i,
	input			wb_we_i,
	input		[3:0]	wb_sel_i,
	input		[31:0]	wb_dat_i,
	output		[31:0]	wb_dat_o,
	output reg		wb_ack_o,

	// Internal interface
	input			sdram_rst,
	input			sdram_clk,
	input		[31:0]	adr_i,
	output		[31:0]	adr_o,
	input		[15:0]	dat_i,
	output		[15:0]	dat_o,
	output		[1:0]	sel_o,
	output reg		acc_o,
	input			ack_i,
	output reg		we_o,

	// Buffer write
	input [31:0]		bufw_adr_i,
	input [31:0]		bufw_dat_i,
	input [3:0]		bufw_sel_i,
	input			bufw_we_i
);

	wire				wb_cycle;
	reg				wb_cycle_r;
	wire				wb_cycle_edge;
	reg				wb_req;
	wire				wb_ack;
	wire [31:0]			next_wb_adr;
	reg  [31:0]			buf_data[(1<<BUF_WIDTH)-1:0];
	reg  [31:BUF_WIDTH+2]		buf_adr;
	reg  [(1<<BUF_WIDTH)-1:0]	buf_clean;
	reg  [(1<<BUF_WIDTH)-1:0]	buf_clean_wb;
	reg  [31:0]			dat_r;
	reg  [3:0]			sel_r;
	reg  [31:0]			adr_o_r;
	wire				bufhit;
	wire				next_bufhit;
	wire				adrhit;
	reg				read_done;
	reg				read_done_ack;
	reg				write_done;
	reg				write_done_ack;
	wire				even_adr;
	reg  [31:0]			cycle_count;
	reg  [31:0]			ack_count;
	reg  [2:0]			state;
	reg				read_invalid;

	parameter [2:0]
		IDLE	= 3'd0,
		READ	= 3'd1,
		WRITE	= 3'd2;

	parameter [2:0]
		CLASSIC      = 3'b000,
		CONST_BURST  = 3'b001,
		INC_BURST    = 3'b010,
		END_BURST    = 3'b111;

	parameter [1:0]
		LINEAR_BURST = 2'b00,
		WRAP4_BURST  = 2'b01,
		WRAP8_BURST  = 2'b10,
		WRAP16_BURST = 2'b11;

	assign wb_cycle      = wb_stb_i & wb_cyc_i & !wb_ack_o;
	assign wb_cycle_edge = wb_cycle & !wb_cycle_r;
	assign next_wb_adr   = (wb_bte_i == LINEAR_BURST) ?
			       (wb_adr_i[31:0] + 32'd4) :
			       (wb_bte_i == WRAP4_BURST ) ?
			       {wb_adr_i[31:4], wb_adr_i[3:0] + 4'd4} :
			       (wb_bte_i == WRAP8_BURST ) ?
			       {wb_adr_i[31:5], wb_adr_i[4:0] + 5'd4} :
			     /*(wb_bte_i == WRAP16_BURST) ?*/
			       {wb_adr_i[31:6], wb_adr_i[5:0] + 6'd4};

	assign bufhit	     = (buf_adr == wb_adr_i[31:BUF_WIDTH+2]);
	assign next_bufhit   = (buf_adr == next_wb_adr[31:BUF_WIDTH+2]);
	assign adrhit	     = (adr_i[31:2] == wb_adr_i[31:2]);
	assign wb_dat_o      = buf_data[wb_adr_i[BUF_WIDTH+1:2]];
	assign wb_ack	     = (((buf_clean_wb[wb_adr_i[BUF_WIDTH+1:2]] &
			       bufhit & !wb_ack_o) |
			       (buf_clean_wb[next_wb_adr[BUF_WIDTH+1:2]] &
			       next_bufhit & (wb_cti_i == INC_BURST) &
			       wb_ack_o)) & wb_stb_i & wb_cyc_i & !wb_we_i) |
			       ((!wb_we_i & read_done & !read_done_ack) |
			       (wb_we_i & write_done & !write_done_ack) &
			       wb_cycle);

	assign even_adr	     = (adr_i[1] == 1'b0);
	// output lower 16 bits after first write ack
	assign adr_o	     = ((state == WRITE) & ack_i) ?
			       adr_o_r + 2 : adr_o_r;
	assign dat_o	     = ((state == WRITE) & ack_i) ?
			       dat_r[15:0] : dat_r[31:16];
	assign sel_o	     = ((state == WRITE) & ack_i) ?
			       sel_r[1:0]  : sel_r[3:2];

	//
	// WB clock domain
	//
	always @(posedge wb_clk)
		if (read_done)
			read_done_ack <= 1'b1;
		else
			read_done_ack <= 1'b0;

	always @(posedge wb_clk)
		if (write_done)
			write_done_ack <= 1'b1;
		else
			write_done_ack <= 1'b0;

	always @(posedge wb_clk)
		if (wb_rst)
			wb_ack_o <= 1'b0;
		else
			wb_ack_o <= wb_ack;

	always @(posedge wb_clk)
		buf_clean_wb <= buf_clean;

	//
	// SDRAM clock domain
	//
	always @(posedge sdram_clk)
		wb_cycle_r <= wb_cycle;

	always @(posedge sdram_clk) begin
		if (sdram_rst) begin
			buf_clean <= {(1<<BUF_WIDTH){1'b0}};
		end else if (!wb_we_i & wb_cycle_edge & !bufhit) begin
			buf_clean <= {(1<<BUF_WIDTH){1'b0}};
		end else if ((state == READ) & !even_adr &
			(ack_i | (ack_count > 0 & cycle_count < 7)) &
			!read_invalid) begin
			buf_clean[adr_i[BUF_WIDTH+1:2]] <= 1'b1;
		end
	end

	always @(posedge sdram_clk) begin
		if (sdram_rst) begin
			state <= IDLE;
			acc_o <= 1'b0;
			we_o <= 1'b0;
			cycle_count <= 0;
			ack_count <= 0;
			read_done <= 1'b0;
			write_done <= 1'b0;
			buf_adr <= 0;
		end else begin
			if (ack_i)
				ack_count <= ack_count + 1;

			if (wb_cycle_edge)
				wb_req <= 1'b1;

			cycle_count <= cycle_count + 1;

			case (state)
			IDLE: begin
				wb_req <= 1'b0;
				we_o <= 1'b0;
				read_invalid <= 0;
				if (wb_we_i & (wb_cycle_edge | wb_req & wb_cycle)) begin
					/*
					 FIXME?: acking without knowing that
					 we have control over the SDRAM
					 interface is a bit bold, consider
					 adding a "in control" input signal
					 */
					write_done <= 1'b1;
					state <= WRITE;
					dat_r <= wb_dat_i;
					sel_r <= wb_sel_i;
					adr_o_r <= {wb_adr_i[31:2], 2'b00};
					acc_o <= 1'b1;
					we_o <= 1'b1;
					ack_count <= 0;
					if (bufhit & wb_sel_i[3])
						buf_data[wb_adr_i[BUF_WIDTH+1:2]][31:24] <= wb_dat_i[31:24];
					if (bufhit & wb_sel_i[2])
						buf_data[wb_adr_i[BUF_WIDTH+1:2]][23:16] <= wb_dat_i[23:16];
					if (bufhit & wb_sel_i[1])
						buf_data[wb_adr_i[BUF_WIDTH+1:2]][15:8]  <= wb_dat_i[15:8];
					if (bufhit & wb_sel_i[0])
						buf_data[wb_adr_i[BUF_WIDTH+1:2]][7:0]   <= wb_dat_i[7:0];
				end else if (!wb_we_i & (wb_cycle_edge | (wb_req & wb_cycle)) &
					     (!bufhit | !buf_clean[wb_adr_i[BUF_WIDTH+1:2]])) begin
					state <= READ;
					adr_o_r <= {wb_adr_i[31:2], 2'b00};
					acc_o <= 1'b1;
					ack_count <= 0;
				end
			end

			READ: begin
				if (ack_i) begin
					cycle_count <= 0;
					acc_o <= 1'b0;
				end

				if (ack_i | (ack_count > 0 & cycle_count < 7)) begin
					if (even_adr) begin
						buf_data[adr_i[BUF_WIDTH+1:2]][31:16] <= dat_i;
					end else begin
						buf_data[adr_i[BUF_WIDTH+1:2]][15:0] <= dat_i;
						// only signal read done on first burst
						if (adrhit & ack_count < 2 ) begin
							read_done <= 1'b1;
							buf_adr <= adr_i[31:BUF_WIDTH+2];
						end
					end
				end

				/* FIXME: Hardcoded to 2*burst of 8 */
				if (ack_count == 1 & cycle_count == 2) begin
					adr_o_r[BUF_WIDTH+1:2] <= adr_o_r[BUF_WIDTH+1:2] + 4;
					acc_o <= 1'b1;
				end else if (ack_count == 2 & cycle_count == 7) begin
					acc_o <= 1'b0;
					state <= IDLE;
				end
				/* Incoming access that is not to the current read */
				if(!wb_we_i & wb_cycle_edge & !bufhit)
					read_invalid = 1;
			end

			WRITE: begin
				if (ack_i) begin
					acc_o <= 1'b0;
					state <= IDLE;					
				end
			end
			endcase

			if (bufw_we_i & (bufw_adr_i[31:BUF_WIDTH+2] == buf_adr)) begin
				if (bufw_sel_i[3])
					buf_data[bufw_adr_i[BUF_WIDTH+1:2]][31:24] <= bufw_dat_i[31:24];
				if (bufw_sel_i[2])
					buf_data[bufw_adr_i[BUF_WIDTH+1:2]][23:16] <= bufw_dat_i[23:16];
				if (bufw_sel_i[1])
					buf_data[bufw_adr_i[BUF_WIDTH+1:2]][15:8]  <= bufw_dat_i[15:8];
				if (bufw_sel_i[0])
					buf_data[bufw_adr_i[BUF_WIDTH+1:2]][7:0]   <= bufw_dat_i[7:0];
			end

			if (read_done_ack)
				read_done <= 1'b0;

			if (write_done_ack)
				write_done <= 1'b0;
		end
	end
endmodule