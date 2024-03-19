/*
 * codec_fix.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module codec_fix (
	// Shared I2C + Button/LED
	inout  wire scl_led,
	inout  wire sda_btn,

	// Internal alt-function
	output reg  btn,
	input  wire led,

	// Control
	input  wire go,
	output wire rdy,

	// Clock / Reset
	input  wire clk,
	input  wire rst
);

	// Signals
	// -------

	// FSM
		// Values encode type 'state'.
		// [3]   == 1  : Issue master command
		// [3:2] == 01 : Pause (timer running)
	localparam
		ST_IDLE         = 0,
		ST_PRE_PAUSE    = 4,
		ST_CMD_START    = 8,
		ST_CMD_I2C_ADDR = 9,
		ST_CMD_REG_HI   = 10,
		ST_CMD_REG_LO   = 11,
		ST_CMD_VAL_HI   = 12,
		ST_CMD_VAL_LO   = 13,
		ST_CMD_STOP     = 14,
		ST_POST_PAUSE   = 5;

	reg   [3:0] state;
	reg   [3:0] state_nxt;

	// Timer for pauses
	reg  [15:0] timer_cnt;
	wire        timer_tick;
	wire        timer_rst;

	// IOB
	wire        iob_scl_oe, iob_sda_oe;
	wire        iob_scl_o,  iob_sda_o;
	wire        iob_scl_i,  iob_sda_i;

	// I2C IOs from master core
	wire        i2c_io_scl_oe;
	wire        i2c_io_sda_oe;
	wire        i2c_io_scl_i;
	wire        i2c_io_sda_i;

	// I2C Master IF
	reg   [7:0] i2c_m_data_in;
	wire        i2c_m_ack_in;
	reg   [1:0] i2c_m_cmd;
	reg         i2c_m_stb;
	wire        i2c_m_ready;


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
					state_nxt = ST_PRE_PAUSE;

			ST_PRE_PAUSE:
				if (timer_tick)
					state_nxt = ST_CMD_START;

			ST_CMD_START:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_CMD_I2C_ADDR;

			ST_CMD_I2C_ADDR:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_CMD_REG_HI;

			ST_CMD_REG_HI:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_CMD_REG_LO;

			ST_CMD_REG_LO:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_CMD_VAL_HI;

			ST_CMD_VAL_HI:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_CMD_VAL_LO;

			ST_CMD_VAL_LO:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_CMD_STOP;

			ST_CMD_STOP:
				if (i2c_m_ready & ~i2c_m_stb)
					state_nxt = ST_POST_PAUSE;

			ST_POST_PAUSE:
				if (timer_tick)
					state_nxt = ST_IDLE;

			default:
					state_nxt = ST_IDLE;
		endcase
	end

	assign rdy = (state == ST_IDLE);


	// Timer
	// -----

	always @(posedge clk)
		if (timer_rst)
			timer_cnt <= 0;
		else
			timer_cnt <= timer_cnt + 1;

	assign timer_tick = timer_cnt[15];
	assign timer_rst  = timer_tick | (state[3:2] != 2'b01);


	// IO
	// --

	// Instance
	SB_IO #(
		.PIN_TYPE(6'b1010_01),	// PIN_OUTPUT_TRISTATE / PIN_INPUT
		.PULLUP(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) i2c[1:0] (
		.PACKAGE_PIN   ({scl_led,    sda_btn}),
		.OUTPUT_ENABLE ({iob_scl_oe, iob_sda_oe}),
		.D_OUT_0       ({iob_scl_o,  iob_sda_o }),
		.D_IN_0        ({iob_scl_i,  iob_sda_i })
	);

	// Muxing
		// Always open-drain drive
	assign iob_scl_o = 1'b0;
	assign iob_sda_o = 1'b0;

		// If not IDLE, driven by the master core
	assign iob_scl_oe = (state == ST_IDLE) ? led  : i2c_io_scl_oe;
	assign iob_sda_oe = (state == ST_IDLE) ? 1'b0 : i2c_io_sda_oe;

		// We don't support clock stretch
	assign i2c_io_scl_i = 1'b0;

		// We never do reads or check ACK's
	assign i2c_io_sda_i = 1'b0;

		// Only update button state if IDLE
	always @(posedge clk)
		if (state == ST_IDLE)
			btn <= iob_sda_i;


	// I2C master
	// ----------

	// Instance
	i2c_master #(
		.DW(3)
	) master_I (
		.scl_oe   (i2c_io_scl_oe),
		.sda_oe   (i2c_io_sda_oe),
		.scl_i    (i2c_io_scl_i),
		.sda_i    (i2c_io_sda_i),
		.data_in  (i2c_m_data_in),
		.ack_in   (i2c_m_ack_in),
		.cmd      (i2c_m_cmd),
		.stb      (i2c_m_stb),
		.data_out (),
		.ack_out  (),
		.ready    (i2c_m_ready),
		.clk      (clk),
		.rst      (rst)
	);

	// Control
	always @(*)
		case (state)
			ST_CMD_I2C_ADDR: i2c_m_data_in = 8'b00010100;
			ST_CMD_REG_HI:   i2c_m_data_in = 8'b00000000;
			ST_CMD_REG_LO:   i2c_m_data_in = 8'b00110000;
			ST_CMD_VAL_HI:   i2c_m_data_in = 8'b01000000;
			ST_CMD_VAL_LO:   i2c_m_data_in = 8'b01100000;
			default:         i2c_m_data_in = 8'bxxxxxxxx;
		endcase

	assign i2c_m_ack_in = 1'b0;

	always @(*)
		case (state)
			ST_CMD_START:    i2c_m_cmd = 2'b00;
			ST_CMD_I2C_ADDR: i2c_m_cmd = 2'b10;
			ST_CMD_REG_HI:   i2c_m_cmd = 2'b10;
			ST_CMD_REG_LO:   i2c_m_cmd = 2'b10;
			ST_CMD_VAL_HI:   i2c_m_cmd = 2'b10;
			ST_CMD_VAL_LO:   i2c_m_cmd = 2'b10;
			ST_CMD_STOP:     i2c_m_cmd = 2'b01;
			default:         i2c_m_cmd = 2'bxx;
		endcase

	always @(posedge clk)
		i2c_m_stb <= (state_nxt != ST_IDLE) & (state_nxt != state) & state_nxt[3];

endmodule // codec_fix
