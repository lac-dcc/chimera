/*
 * flash_lock.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module flash_lock #(
	// Lock sequence
	parameter LOCK_DATA = {
		2'b01, 8'h50,	// WRITE_ENABLE_VOLATILE

		2'b00, 8'h01,	// WRITE_SR
		2'b00, 8'h28,	// SR1 value
		2'b11, 8'h03	// SR2 value
	}
)(
	// SPI
	output reg  spi_mosi,
	input  wire spi_miso,
	output reg  spi_clk,
	output reg  spi_cs_n,

	// Control
	input  wire go,
	output wire rdy,

	// Clock / Reset
	input  wire clk,
	input  wire rst
);

	localparam LOCK_N = $bits(LOCK_DATA) / 10;


	// Signals
	// -------

	// Lock sequence memory
	reg  [9:0] im_mem[0:LOCK_N-1];
	reg  [3:0] im_raddr;

	(* keep *)
	wire [9:0] im_rdata;


	// FSM
	localparam
		ST_IDLE         = 0,
		ST_CMD_START    = 1,
		ST_CMD_SHIFT_LO = 2,
		ST_CMD_SHIFT_HI = 3,
		ST_CMD_PAUSE    = 4;

	reg  [2:0] state;
	reg  [2:0] state_nxt;

	// Counters
	reg  [3:0] bit_cnt;
	wire       bit_last;

	// Current command byte
	wire       cmd_load;
	reg  [7:0] cmd_byte_data;
	reg        cmd_byte_last;
	reg        cmd_last;


	// Lock sequence ROM
	// -----------------

	initial
	begin : im_mem_init
		integer i;
		for (i=0; i<LOCK_N; i=i+1)
			im_mem[i] <= LOCK_DATA[(LOCK_N-1-i)*10+:10];
	end

	assign im_rdata = im_mem[im_raddr];


	// FSM
	// ---

	// State register
	always @(posedge clk)
		if (rst)
			state <= ST_IDLE;
		else
			state <= state_nxt;

	// Next-state
	always @(*)
	begin
		// Default
		state_nxt = state;

		// Transitions
		case (state)
			ST_IDLE:
				if (go)
					state_nxt = ST_CMD_START;

			ST_CMD_START:
				state_nxt = ST_CMD_SHIFT_LO;

			ST_CMD_SHIFT_LO:
				state_nxt = ST_CMD_SHIFT_HI;

			ST_CMD_SHIFT_HI:
				state_nxt = (bit_last & cmd_byte_last) ?
					ST_CMD_PAUSE :
					ST_CMD_SHIFT_LO;

			ST_CMD_PAUSE:
				if (bit_last)
					state_nxt = cmd_last ? ST_IDLE : ST_CMD_START;
		endcase

	end

	assign rdy = (state == ST_IDLE);


	// Counters
	// --------

	// When to load shift reg
	assign cmd_load =
		(state == ST_CMD_START) |
		((state == ST_CMD_SHIFT_HI) & bit_last & ~cmd_byte_last);

	// Read address from ROM
	always @(posedge clk)
		if (state == ST_IDLE)
			im_raddr <= 4'h0;
		else if (cmd_load)
			im_raddr <= im_raddr + 1;

	// Load command
	always @(posedge clk)
		if (cmd_load) begin
			cmd_byte_last <= im_rdata[8];
			cmd_last <= im_rdata[9];
		end

	always @(posedge clk)
		if (cmd_load)
			cmd_byte_data <= im_rdata[7:0];
		else if (state == ST_CMD_SHIFT_HI)
			cmd_byte_data <= { cmd_byte_data[6:0], 1'b0 };

	// Bit Counter
	always @(posedge clk)
		if (state == ST_CMD_START)
			bit_cnt <= 4'd6;
		else if ((state == ST_CMD_SHIFT_HI) | (state == ST_CMD_PAUSE))
			bit_cnt <= bit_last ? 4'd6 : (bit_cnt - 1);

	assign bit_last = bit_cnt[3];


	// IOs
	// ---

	always @(posedge clk)
	begin
		// Default
		spi_mosi <= 1'b0;
		spi_clk  <= 1'b0;
		spi_cs_n <= 1'b1;

		// Act depending on state
		case (state)
			ST_CMD_START: begin
				spi_cs_n <= 1'b0;
			end

			ST_CMD_SHIFT_LO: begin
				spi_mosi <= cmd_byte_data[7];
				spi_clk  <= 1'b0;
				spi_cs_n <= 1'b0;
			end

			ST_CMD_SHIFT_HI: begin
				spi_mosi <= cmd_byte_data[7];
				spi_clk  <= 1'b1;
				spi_cs_n <= 1'b0;
			end
		endcase
	end

endmodule // flash_lock
