// This program was cloned from: https://github.com/toivoh/tt07-basilisc-2816-cpu
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Toivo Henningsson <toivo.h.h@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module memory_interface #( parameter IO_BITS=2, TX_CMD_BITS=2, PAYLOAD_CYCLES=8 ) (
		input wire clk, reset,


		input wire tx_command_valid, // When high, try to start a new TX command
		input wire [TX_CMD_BITS-1:0] tx_command, // Keep stable at least one cycle after tx_command_started goes high
		output wire tx_command_started, // Starting to run tx_command this cycle
		output wire tx_active,

		input wire [IO_BITS-1:0] tx_data, // User must stream tx data after starting a TX command
		output wire tx_data_next, // When high, current tx_data bits sent
		output wire [$clog2(PAYLOAD_CYCLES)+1-1:0] tx_counter,
		output wire tx_done, // When high, tx command finishes this cycle


		output wire rx_started,
		output wire rx_active,
		output reg [IO_BITS-1:0] rx_sbs, // Start bits from last start
		output wire rx_sbs_valid,
		output wire rx_data_valid, // High when rx_pins holds data
		output wire [$clog2(PAYLOAD_CYCLES)+1-1:0] rx_counter,
		output wire rx_done, // High during last cycle of rx

		output wire [IO_BITS-1:0] tx_pins,
		input wire [IO_BITS-1:0] rx_pins
	);

	localparam SBIO_COUNTER_BITS = $clog2(PAYLOAD_CYCLES) + 1;

	// TX
	// ==
	//wire tx_active; //, tx_started;
	//wire [SBIO_COUNTER_BITS-1:0] tx_counter;
	sbio_monitor #(
		.IO_BITS(IO_BITS), .SENS_BITS(1), .COUNTER_BITS(SBIO_COUNTER_BITS),
		//.INACTIVE_COUNTER_VALUE(2**SBIO_COUNTER_BITS-2)
		.INACTIVE_COUNTER_VALUE({{(SBIO_COUNTER_BITS-1){1'b1}}, 1'b0}) // = 2**SBIO_COUNTER_BITS-2
	) tx_monitor (
		.clk(clk), .reset(reset),
		.pins(tx_pins),
		//.start(tx_started), // Not needed, we should know when we start it
		.active(tx_active), .done(tx_done), .counter(tx_counter)
	);

	// TODO: Limit number of outstanding (unanswered) transactions
	//wire tx_start = !reset && !tx_active && tx_command_valid;
	wire tx_start = !tx_active && tx_command_valid;
	assign tx_command_started = tx_start;

	wire tx_send_payload = (tx_counter[SBIO_COUNTER_BITS-1] == 0); // High if transmitting data. Low during start bits and header.

	// Choose tx data source
	//assign tx_pins = (reset || !tx_active) ? {{(IO_BITS-1){1'b0}}, tx_start} : (tx_send_payload ? tx_data : tx_command);
	assign tx_pins = !tx_active ? {{(IO_BITS-1){1'b0}}, tx_start} : (tx_send_payload ? tx_data : tx_command);

	assign tx_data_next = tx_send_payload;
	assign tx_done = (tx_counter == PAYLOAD_CYCLES - 1);


	// RX
	// ==
	//wire rx_started;
	//wire [SBIO_COUNTER_BITS-1:0] rx_counter;
	sbio_monitor #(
		.IO_BITS(IO_BITS), .SENS_BITS(2), .COUNTER_BITS(SBIO_COUNTER_BITS),
		//.INACTIVE_COUNTER_VALUE(2**SBIO_COUNTER_BITS-1)
		//.INACTIVE_COUNTER_VALUE({SBIO_COUNTER_BITS{1'b1}}) // = 2**SBIO_COUNTER_BITS-1
		.INACTIVE_COUNTER_VALUE({{(SBIO_COUNTER_BITS-1){1'b1}}, 1'b0}) // = 2**SBIO_COUNTER_BITS-2
	) sbio_rx (
		.clk(clk), .reset(reset),
		.pins(rx_pins),
		.start(rx_started), .active(rx_active), .done(rx_done), .counter(rx_counter)
	);

	always @(posedge clk) begin
		if (rx_started) rx_sbs <= rx_pins;
	end

	// rx_active goes high the cycle after we have received the start bits
	assign rx_sbs_valid = rx_active;
	//assign rx_data_valid = rx_active;
	assign rx_data_valid = rx_counter[SBIO_COUNTER_BITS-1] == 0;

	// Assumes that all messages have length described by PAYLOAD_CYCLES
	assign rx_done = (rx_counter == PAYLOAD_CYCLES - 1);
endmodule : memory_interface
