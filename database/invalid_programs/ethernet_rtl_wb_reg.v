// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module wb_reg (
	input clk, rst,

	output reg s_ack, s_err,
	input s_cyc, s_stb, s_we,
	input [ADDR_WIDTH - 1:0] s_addr,
	input [DATA_WIDTH - 1:0] s_data_write,
	output reg [DATA_WIDTH - 1:0] s_data_read,

	input m_ack, m_err,
	output reg m_cyc, m_stb, m_we,
	output reg [ADDR_WIDTH - 1:0] m_addr,
	output reg [DATA_WIDTH - 1:0] m_data_write,
	input [DATA_WIDTH - 1:0] m_data_read
);

	parameter ADDR_WIDTH	= 16;
	parameter DATA_WIDTH	= 16;

	initial begin
		s_ack = 0;
		s_err = 0;
		m_cyc = 0;
		m_stb = 0;
	end

	always @(posedge clk) begin
		if (rst) begin
			s_ack <= 0;
			s_err <= 0;
			m_cyc <= 0;
			m_stb <= 0;
		end else begin
			s_ack <= m_ack && s_cyc && s_stb;
			s_err <= m_err && s_cyc && s_stb;
			m_cyc <= s_cyc && !(m_ack || m_err);
			m_stb <= s_stb && !(m_ack || m_err);
		end
		s_data_read <= m_data_read;
		m_we <= s_we;
		m_addr <= s_addr;
		m_data_write <= s_data_write;
	end

endmodule
