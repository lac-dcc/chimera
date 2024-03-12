// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 *
 * A wishbone mux with extremely-simple address decoding.
 */

`include "common.vh"

module wb_mux (
	/* Wishbone master */
	output reg m_ack, m_err,
	input m_cyc, m_stb, m_we,
	input [ADDR_WIDTH + SLAVES - 1:0] m_addr,
	input [DATA_WIDTH - 1:0] m_data_write,
	output reg [DATA_WIDTH - 1:0] m_data_read,

	input [SLAVES - 1:0] s_ack, s_err,
	output reg [SLAVES - 1:0] s_cyc, s_stb, s_we,
	output reg [ADDR_WIDTH * SLAVES - 1:0] s_addr,
	output reg [DATA_WIDTH * SLAVES - 1:0] s_data_write,
	input [DATA_WIDTH * SLAVES - 1:0] s_data_read
);

	parameter ADDR_WIDTH	= 5;
	parameter DATA_WIDTH	= 16;
	parameter SLAVES	= 4;

	integer i;
	reg selected;

	always @(*) begin
		s_cyc = {SLAVES{m_cyc}};
		s_stb = {SLAVES{1'b0}};
		s_we = {SLAVES{m_we}};
		s_addr = {SLAVES{m_addr[ADDR_WIDTH - 1:0]}};
		s_data_write = {SLAVES{m_data_write}};
		m_ack = 0;
		m_err = 0;
		m_data_read = {DATA_WIDTH{1'bX}};
		selected = 0;

		for (i = 0; i < SLAVES; i = i + 1) begin
			if (m_addr[ADDR_WIDTH + i] && !selected) begin
				m_ack = s_ack[i];
				m_err = s_err[i];
				m_data_read = s_data_read[i * DATA_WIDTH +: DATA_WIDTH];
				s_stb[i] = m_stb;
				s_we[i] = m_we;
				selected = 1;
			end
		end

		if (m_cyc && m_stb && !selected) begin
			m_ack = 0;
			m_err = 1;
		end
	end

endmodule
