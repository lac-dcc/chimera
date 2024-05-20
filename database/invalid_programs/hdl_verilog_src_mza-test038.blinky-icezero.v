// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// originally lifted from https://github.com/thekroko/icezero-blinky.git
// last updated 2020-06-01 by mza

`define icezero
`include "lib/synchronizer.v"
`include "lib/easypll.v"

module top (
	input clock100,
	input btn,
	input rpi_gpio22,
	input rpi_gpio24,
	input rpi_gpio25,
	output led1,
	output led2,
	output led3
);
	reg reset = 1;
	reg [7:0] reset_counter = 0;
	always @(posedge clock100) begin
		if (reset) begin
			if (reset_counter[7]) begin
				reset <= 0;
			end else begin
				reset_counter <= reset_counter + 1'b1;
			end
		end
	end
	wire clock16, pll_locked;
`ifdef TESTBENCH
	assign clock16 = clock100, pll_locked = 1;
`else
	easypll #(.DIVR(4'd3), .DIVF(7'd40), .DIVQ(3'd6)) mp (.clock_input(clock100), .reset_active_low(~reset), .global_clock_output(clock16), .pll_is_locked(pll_locked));
	//pll_pad #(.DIVR(4'd3), .DIVF(7'd40), .DIVQ(3'd6)) mp (.clock_input_pad(clock100), .reset(reset), .global_clock_output(clock16), .pll_is_locked(pll_locked));
`endif
	reg [23:0] counter = 0;
	if (1) begin
		assign led1 = rpi_gpio22;
		assign led2 = rpi_gpio24;
		assign led3 = rpi_gpio25;
	end else if (0) begin
		wire button_clock;
		button_debounce #(.DEBOUNCE_CLOCK_PERIODS(1678)) bd (.clock(clock16), .button_raw(btn), .button_just_went_inactive(button_clock));
		always @(posedge button_clock) begin
			if (reset) begin
				counter <= 0;
			end else begin
				counter <= counter + 1'b1;
			end
		end
		assign led1 = counter[2];
		assign led2 = counter[1];
		assign led3 = counter[0];
	end else begin
		always @(posedge clock16) begin
			if (reset) begin
				counter <= 0;
			end else begin
				counter <= counter + 1'b1;
			end
		end
		assign led1 = counter[23];
		assign led2 = counter[22];
		assign led3 = counter[21];
	end
endmodule

