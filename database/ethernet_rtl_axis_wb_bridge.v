// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module axis_wb_bridge (
	input clk,
	input rst,

	output reg s_axis_ready,
	input s_axis_valid,
	input [7:0] s_axis_data,

	input m_axis_ready,
	output reg m_axis_valid,
	output reg [7:0] m_axis_data,

	/* Wishbone */
	input wb_ack, wb_err,
	output reg wb_cyc, wb_stb, wb_we,
	output reg [ADDR_WIDTH - 1:0] wb_addr,
	output reg [DATA_WIDTH - 1:0] wb_data_write,
	input [DATA_WIDTH - 1:0] wb_data_read,

	input overflow
);

	parameter ADDR_WIDTH	= 32;
	generate if (ADDR_WIDTH % 8)
		     $error("Unsupported ADDR_WIDTH");
	endgenerate
	/* The data width is not parametric for now */
	localparam DATA_WIDTH	= 16;

	localparam IDLE		= 0;
	localparam ADDR3	= 1;
	localparam ADDR2	= 2;
	localparam ADDR1	= 3;
	localparam ADDR0	= 4;
	localparam DATA1	= 5;
	localparam DATA0	= 6;
	localparam BUS		= 7;
	localparam RESP2	= 8;
	localparam RESP1	= 9;
	localparam RESP0	= 10;

	reg s_axis_ready_next, m_axis_valid_next;
	reg [7:0] m_axis_data_next;
	reg wb_ack_last, wb_err_last;
	reg wb_stb_next, wb_we_next;
	reg [ADDR_WIDTH - 1:0] wb_addr_next;
	reg [DATA_WIDTH - 1:0] wb_data_write_next, wb_data_latch, wb_data_latch_next;
	reg [3:0] state, state_next;
	reg overflow_latch, overflow_latch_next, postinc, postinc_next;

	always @(*) begin
		s_axis_ready_next = s_axis_ready;
		m_axis_valid_next = m_axis_valid;
		m_axis_data_next = m_axis_data;

		wb_cyc = wb_stb;
		wb_stb_next = wb_stb;
		wb_we_next = wb_we;
		wb_addr_next = wb_addr;
		wb_data_write_next = wb_data_write;
		if (wb_stb && (wb_err || wb_ack))
			wb_data_latch_next = wb_data_read;
		else
			wb_data_latch_next = wb_data_latch;

		state_next = state;
		postinc_next = postinc;
		overflow_latch_next = overflow_latch || overflow;

		case (state)
		IDLE: if (s_axis_valid && s_axis_ready) begin
			if (s_axis_data[0])
				wb_addr_next = {ADDR_WIDTH{1'b0}};
			wb_we_next = s_axis_data[1];
			postinc_next = s_axis_data[2];
			case (s_axis_data[4:3])
			2'd3: state_next = ADDR3;
			2'd2: state_next = ADDR1;
			2'd1: state_next = ADDR0;
			2'd0: if (wb_we_next) begin
				state_next = DATA1;
			end else begin
				state_next = BUS;
				wb_stb_next = 1;
				s_axis_ready_next = 0;
			end
			endcase
		end
		ADDR3: if (s_axis_valid && s_axis_ready) begin
			if (ADDR_WIDTH >= 32)
				wb_addr_next[31:24] = s_axis_data;
			state_next = ADDR2;
		end
		ADDR2: if (s_axis_valid && s_axis_ready) begin
			if (ADDR_WIDTH >= 24)
				wb_addr_next[23:16] = s_axis_data;
			state_next = ADDR1;
		end
		ADDR1: if (s_axis_valid && s_axis_ready) begin
			if (ADDR_WIDTH >= 16)
				wb_addr_next[15:8] = s_axis_data;
			state_next = ADDR0;
		end
		ADDR0: if (s_axis_valid && s_axis_ready) begin
			if (ADDR_WIDTH >= 8)
				wb_addr_next[7:0] = s_axis_data;
			if (wb_we) begin
				state_next = DATA1;
			end else begin
				state_next = BUS;
				wb_stb_next = 1;
				s_axis_ready_next = 0;
			end
		end
		DATA1: if (s_axis_valid && s_axis_ready) begin
			wb_data_write_next = { wb_data_write[7:0], s_axis_data };
			state_next = DATA0;
		end
		DATA0: if(s_axis_valid && s_axis_ready) begin
			wb_data_write_next = { wb_data_write[7:0], s_axis_data };
			state_next = BUS;
			wb_stb_next = 1;
			s_axis_ready_next = 0;
		end
		BUS: if (wb_ack || wb_err) begin
			wb_stb_next = 0;
			wb_addr_next[7:0] = wb_addr[7:0] + postinc;
			m_axis_valid_next = 1;
			m_axis_data_next = { 4'b0, overflow_latch_next, 1'b0, wb_err, wb_we };
			overflow_latch_next = 0;
			state_next = wb_we || wb_err ? RESP0 : RESP2;
		end
		RESP2: if (m_axis_ready && m_axis_valid) begin
			m_axis_data_next = wb_data_latch[15:8];
			state_next = RESP1;
		end
		RESP1: if (m_axis_ready && m_axis_valid) begin
			m_axis_data_next = wb_data_latch[7:0];
			state_next = RESP0;
		end
		RESP0: if (m_axis_ready && m_axis_valid) begin
			m_axis_valid_next = 0;
			s_axis_ready_next = 1;
			state_next = IDLE;
		end
		endcase
	end

	always @(posedge clk) begin
		m_axis_data <= m_axis_data_next;
		wb_we <= wb_we_next;
		wb_addr <= wb_addr_next;
		wb_data_write <= wb_data_write_next;
		wb_data_latch <= wb_data_latch_next;
		postinc <= postinc_next;
	end

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			s_axis_ready <= 1;
			m_axis_valid <= 0;
			wb_ack_last <= 0;
			wb_err_last <= 0;
			wb_stb <= 0;
			state <= IDLE;
			overflow_latch <= 0;
		end else begin
			s_axis_ready <= s_axis_ready_next;
			m_axis_valid <= m_axis_valid_next;
			wb_ack_last <= wb_ack;
			wb_err_last <= wb_err;
			wb_stb <= wb_stb_next;
			state <= state_next;
			overflow_latch <= overflow_latch_next;
		end
	end

`ifndef SYNTHESIS
	reg [255:0] state_text;

	always @(*) begin
		case (state)
		IDLE: state_text = "IDLE";
		ADDR3: state_text = "ADDR3";
		ADDR2: state_text = "ADDR2";
		ADDR1: state_text = "ADDR1";
		ADDR0: state_text = "ADDR0";
		DATA1: state_text = "DATA1";
		DATA0: state_text = "DATA0";
		BUS: state_text = "BUS";
		RESP2: state_text = "RESP2";
		RESP1: state_text = "RESP1";
		RESP0: state_text = "RESP0";
		endcase
	end
`endif

endmodule
