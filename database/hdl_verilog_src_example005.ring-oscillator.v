// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// from http://svn.clifford.at/handicraft/2015/ringosc/ringosc.v

// last updated 2020-06-01 by mza
`define icestick

module top(input CLK, output J1_10, LED5, LED1, LED2, LED3, LED4);
	wire chain_in, chain_out, resetn;
	assign J1_10 = chain_out;

	// reset generator

	reg [7:0] reset_count = 0;
	assign resetn = &reset_count;

	always @(posedge CLK) begin
		if (!(&reset_count))
			reset_count <= reset_count + 1;
	end

	// ring oscillator

	wire [99:0] buffers_in, buffers_out;
	assign buffers_in = {buffers_out[98:0], chain_in};
	assign chain_out = buffers_out[99];
	assign chain_in = resetn ? !chain_out : 0;

	SB_LUT4 #(
		.LUT_INIT(16'd2)
	) buffers [99:0] (
		.O(buffers_out),
		.I0(buffers_in),
		.I1(1'b0),
		.I2(1'b0),
		.I3(1'b0)
	);

	// frequency counter

	reg [19:0] counter = 23;
	reg do_count, do_reset;
	always @(posedge chain_out) begin
		if (do_reset)
			counter <= 0;
		else if (do_count)
			counter <= counter + 1;
	end

	// control

	reg [1:0] state;
	reg [15:0] wait_cnt;
	reg [19:0] last_counter;
	reg [19:0] this_counter;
	reg [2:0] debounce;
	reg [4:0] leds;

	assign {LED4, LED3, LED2, LED1, LED5} = leds;

	always @(posedge CLK) begin
		wait_cnt <= wait_cnt + 1;
		do_reset <= state == 0;
		do_count <= state == 1;

		if (!resetn) begin
			state <= 0;
			wait_cnt <= 0;
			leds <= 1;
		end else
		if (&wait_cnt) begin
			if (state == 2) begin
				last_counter <= this_counter;
				this_counter <= counter;
			end
			if (state == 3) begin
				if (last_counter > this_counter+5) begin
					if (!debounce)
						leds <= {1'b1, leds[0], leds[3:1]};
					debounce <= ~0;
				end else begin
					if (debounce)
						debounce <= debounce-1;
					else
						leds[4] <= 0;
				end
			end
			state <= state + 1;
		end
	end
endmodule

