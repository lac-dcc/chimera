// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"
`include "pcs.vh"

`timescale 1ns/1ns

/* Transmit process */
module pcs_tx (
	/* MII */
	input clk,
	input ce,
	input enable,
	input [3:0] data,
	input err,

	/* PMA */
	output bits,
	input link_status,

	/* Internal */
	output reg tx
);

	localparam IDLE		= 0;
	localparam START_J	= 1;
	localparam START_K	= 2;
	localparam ERROR_J	= 3;
	localparam ERROR_K	= 4;
	localparam ERROR	= 5;
	localparam DATA		= 6;
	localparam END_T	= 7;
	localparam END_R	= 8;

	reg [3:0] last_data;
	reg tx_next;
	reg [4:0] code, code_next;
	reg [3:0] state, state_next;

	initial tx = 0;
	initial code = `CODE_I;
	initial state = IDLE;

	always @(*) begin
		case (last_data)
		4'h0: code_next = `CODE_0;
		4'h1: code_next = `CODE_1;
		4'h2: code_next = `CODE_2;
		4'h3: code_next = `CODE_3;
		4'h4: code_next = `CODE_4;
		4'h5: code_next = `CODE_5;
		4'h6: code_next = `CODE_6;
		4'h7: code_next = `CODE_7;
		4'h8: code_next = `CODE_8;
		4'h9: code_next = `CODE_9;
		4'hA: code_next = `CODE_A;
		4'hB: code_next = `CODE_B;
		4'hC: code_next = `CODE_C;
		4'hD: code_next = `CODE_D;
		4'hE: code_next = `CODE_E;
		4'hF: code_next = `CODE_F;
		endcase

		tx_next = tx;
		if (enable) begin
			if (err)
				state_next = ERROR;
			else
				state_next = DATA;
		end else begin
			state_next = END_T;
		end

		case (state)
		IDLE: begin
			tx_next = 0;
			code_next = `CODE_I;
			state_next = IDLE;
			if (enable) begin
				tx_next = 1;
				if (err)
					state_next = ERROR_J;
				else
					state_next = START_J;
			end
		end
		START_J: begin
			code_next = `CODE_J;
			if (err)
				state_next = ERROR_K;
			else
				state_next = START_K;
		end
		START_K: begin
			code_next = `CODE_K;
		end
		ERROR_J: begin
			code_next = `CODE_J;
			state_next = ERROR_K;
		end
		ERROR_K: begin
			code_next = `CODE_K;
			state_next = ERROR;
		end
		ERROR: begin
			code_next = `CODE_H;
		end
		DATA: ;
		END_T: begin
			tx_next = 0;
			code_next = `CODE_T;
			state_next = END_R;
		end
		END_R: begin
			code_next = `CODE_R;
			state_next = IDLE;
		end
		endcase

		if (!link_status) begin
			tx_next = 0;
			code_next = `CODE_I;
			state_next = IDLE;
		end
	end

	always @(posedge clk) begin
		if (ce) begin
			last_data <= data;
			tx <= tx_next;
			code <= code_next;
			state <= state_next;
		end else begin
			code <= code << 1;
		end
	end

`ifndef SYNTHESIS
	reg [255:0] state_text;

	always @(*) begin
		case (state)
		IDLE: state_text = "IDLE";
		START_J: state_text = "START_J";
		START_K: state_text = "START_K";
		ERROR_J: state_text = "ERROR_J";
		ERROR_K: state_text = "ERROR_K";
		ERROR: state_text = "ERROR";
		DATA: state_text = "DATA";
		END_T: state_text = "END_T";
		END_R: state_text = "END_R";
		endcase
	end
`endif

	/* Transmit bits process */
	assign bits = code[4];
endmodule
