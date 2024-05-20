// This program was cloned from: https://github.com/toivoh/tt07-basilisc-2816-cpu
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Toivo Henningsson
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_toivoh_basilisc_2816 #( parameter IO_BITS=2 )(
		input  wire [7:0] ui_in,    // Dedicated inputs
		output wire [7:0] uo_out,   // Dedicated outputs
		input  wire [7:0] uio_in,   // IOs: Input path
		output wire [7:0] uio_out,  // IOs: Output path
		output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
		input  wire       ena,      // always 1 when the design is powered, so you can ignore it
		input  wire       clk,      // clock
		input  wire       rst_n     // reset_n - low to reset
	);

	wire reset = !rst_n;

	wire [7:0] uo_out0;
	reg [7:0] ui_in_reg, uo_out_reg;
	always @(posedge clk) begin
		if (reset) uo_out_reg <= 0;
		else uo_out_reg <= uo_out0;
		//uo_out_reg <= uo_out0;
		ui_in_reg <= ui_in;
	end
	assign uo_out = uo_out_reg;

	wire tx_fetch, tx_jump;
	wire [IO_BITS-1:0] tx_pins;
	wire [IO_BITS-1:0] rx_pins;

	CPU #( .IO_BITS(IO_BITS) ) cpu (
		.clk(clk), .reset(reset),
		.tx_fetch(tx_fetch), .tx_jump(tx_jump), .tx_pins(tx_pins), .rx_pins(rx_pins)
	);

	assign uo_out0 = {4'd0, tx_jump, tx_fetch, tx_pins};
	assign rx_pins = ui_in_reg[1:0];

	assign uio_out = 0;
	assign uio_oe  = 0;
endmodule
