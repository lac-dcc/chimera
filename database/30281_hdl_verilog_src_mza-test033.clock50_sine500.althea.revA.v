// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-08-26 by mza
// last updated 2021-07-02 by mza

module mza_test033_clock50_sine500_althea (
	input local_clock50_in_p, local_clock50_in_n,
	output lemo,
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	wire clock50;
	IBUFGDS local_input_clock50_instance (.I(local_clock50_in_p), .IB(local_clock50_in_n), .O(clock50));
	reg reset = 1;
	reg [25:0] counter = 0;
	always @(posedge clock50) begin
		if (counter[10]) begin
			reset <= 0;
		end
		counter <= counter + 1'b1;
	end
	parameter clock_word = 8'b10101010;
	wire other_pll_locked;
	wire oserdes_pll_locked;
	assign led_7 = other_pll_locked;
	assign led_6 = oserdes_pll_locked;
	assign led_5 = 0;
	assign led_4 = 0;
	assign led_3 = reset;
	assign led_2 = 0;
	assign led_1 = 0;
	assign led_0 = counter[25];
	wire rawclock125;
	simplepll_BASE #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE0(4), .PHASE0(0.0), .PERIOD(20.0)) other (.clockin(clock50), .reset(reset), .clock0out(rawclock125), .locked(other_pll_locked)); // 50->125
	wire clock125;
	BUFG mrt (.I(rawclock125), .O(clock125));
	wire clock500_oddr;
	ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL"), .MODE("WORD_CLOCK_IN")) mylei (.clock_in(clock125), .reset(reset), .word_clock_out(), .word_in(clock_word), .D_out(clock500_oddr), .locked(oserdes_pll_locked));
	assign lemo = clock500_oddr;
endmodule

module mza_test033_clock50_sine500_althea_top (
	input clock50_p, clock50_n,
	output lemo,
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	mza_test033_clock50_sine500_althea sharona (
		.local_clock50_in_p(clock50_p), .local_clock50_in_n(clock50_n),
		.lemo(lemo),
		.led_0(led_0), .led_1(led_1), .led_2(led_2), .led_3(led_3),
		.led_4(led_4), .led_5(led_5), .led_6(led_6), .led_7(led_7)
	);
endmodule

