// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-08-26 by mza
// this code runs on an althea revA connected to a JoeStrummer board
// last updated 2021-01-23 by mza

`define althea_revA
`include "lib/superkekb.v"
`include "lib/serdes_pll.v"

module mza_test031_clock509_and_revo_generator_althea #(
	parameter PHASE = 45.0
) (
	input local_clock50_in_p, local_clock50_in_n,
	input local_clock509_in_p, local_clock509_in_n,
	output clk78_p, clk78_n,
	output trg36_p, trg36_n,
	output clk_se,
	output trg_se,
	output lemo,
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	wire clock50;
	wire clock509;
	IBUFGDS local_input_clock50_instance (.I(local_clock50_in_p), .IB(local_clock50_in_n), .O(clock50));
	IBUFGDS local_input_clock509_instance (.I(local_clock509_in_p), .IB(local_clock509_in_n), .O(clock509));
	reg reset = 1;
	reg superkekb_reset = 1;
	reg [25:0] counter = 0;
	always @(posedge clock50) begin
		if (counter[9]) begin
			reset <= 0;
		end
		if (counter[11]) begin
			superkekb_reset <= 0;
		end
		counter <= counter + 1'b1;
	end
	wire [7:0] clock_word = 8'b10101010;
	wire [7:0] revo_word;
	wire oserdes_pll_locked1;
	wire oserdes_pll_locked2;
	wire revo;
	assign led_7 = oserdes_pll_locked1;
	assign led_6 = oserdes_pll_locked2;
	assign led_5 = 0;
	assign led_4 = revo;
	assign led_3 = 0;
	assign led_2 = reset;
	assign led_1 = superkekb_reset;
	assign led_0 = counter[25];
	wire clock509_oddr;
	wire revo_oddr;
	wire word_clock2;
	superkekb skb (.clock(word_clock2), .reset(superkekb_reset), .revo(revo), .revo_word(revo_word));
	wire rawclock127;
	BUFIO2 #(
		.DIVIDE(4), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("FALSE")
	) sally (
		.I(clock509), .DIVCLK(rawclock127), .IOCLK(), .SERDESSTROBE()
	);
	wire clock127;
	BUFG peter (.I(rawclock127), .O(clock127));
	ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(7.86), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL"), .MODE("WORD_CLOCK_IN"), .PHASE(0.0)) mylei1 (.clock_in(clock127), .reset(reset), .word_clock_out(), .word_in(clock_word), .D_out(clock509_oddr), .locked(oserdes_pll_locked1));
	ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(7.86), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL"), .MODE("WORD_CLOCK_IN"), .PHASE(PHASE)) mylei2 (.clock_in(clock127), .reset(reset), .word_clock_out(word_clock2), .word_in(revo_word), .D_out(revo_oddr), .locked(oserdes_pll_locked2));
//	ocyrus_double8 #(.BIT_DEPTH(8), .PERIOD(1.965), .DIVIDE(2), .MULTIPLY(4), .SCOPE("BUFPLL")) mylei1 (.clock_in(clock509), .reset(reset), .word_clock_out(word_clock), .word0_in(clock_word), .word1_in(revo_word), .D0_out(clock509_oddr), .D1_out(revo_oddr), .locked(oserdes_pll_locked));
//	ocyrus_double8 #(.BIT_DEPTH(8), .PERIOD(1.965), .DIVIDE(2), .MULTIPLY(4), .SCOPE("BUFPLL")) mylei2 (.clock_in(clock509), .reset(reset), .word_clock_out(word_clock2), .word0_in(clock_word), .word1_in(revo_word), .D0_out(clock509_oddr2), .D1_out(revo_oddr2), .locked(oserdes_pll_locked2));
	OBUFDS out1 (.I(1'b0), .O(clk78_p), .OB(clk78_n));
	OBUFDS out2 (.I(revo_oddr), .O(trg36_p), .OB(trg36_n));
	assign lemo = clock509_oddr;
	assign clk_se = 0;
	assign trg_se = 0;
endmodule

module joestrummer_tb;
	reg joestrummer_local_clock50_in_p = 0, joestrummer_local_clock50_in_n = 1;
	reg joestrummer_local_clock509_in_p = 0, joestrummer_local_clock509_in_n = 1;
	wire joestrummer_trg36_p, joestrummer_trg36_n;
	wire joestrummer_lemo;
	wire joestrummer_led_0, joestrummer_led_1, joestrummer_led_2, joestrummer_led_3, joestrummer_led_4, joestrummer_led_5, joestrummer_led_6, joestrummer_led_7;
	mza_test031_clock509_and_revo_generator_althea joestrummer (
		.local_clock50_in_p(joestrummer_local_clock50_in_p), .local_clock50_in_n(joestrummer_local_clock50_in_n),
		.local_clock509_in_p(joestrummer_local_clock509_in_p), .local_clock509_in_n(joestrummer_local_clock509_in_n),
		.clk78_p(), .clk78_n(),
		.trg36_p(joestrummer_trg36_p), .trg36_n(joestrummer_trg36_n),
		.lemo(joestrummer_lemo),
		.led_0(joestrummer_led_0), .led_1(joestrummer_led_1), .led_2(joestrummer_led_2), .led_3(joestrummer_led_3),
		.led_4(joestrummer_led_4), .led_5(joestrummer_led_5), .led_6(joestrummer_led_6), .led_7(joestrummer_led_7)
	);
	initial begin
		joestrummer_local_clock509_in_p = 0; joestrummer_local_clock509_in_n = 1;
		joestrummer_local_clock50_in_p = 0; joestrummer_local_clock50_in_n = 1;
	end
	always begin
		#1;
		joestrummer_local_clock509_in_p <= ~joestrummer_local_clock509_in_p; joestrummer_local_clock509_in_n <= ~joestrummer_local_clock509_in_n;
	end
	always begin
		#10;
		joestrummer_local_clock50_in_p <= ~joestrummer_local_clock50_in_p; joestrummer_local_clock50_in_n <= ~joestrummer_local_clock50_in_n;
	end
endmodule

module mza_test031_clock509_and_revo_generator_althea_top (
	input clock50_p, clock50_n,
	output a_p, a_n,
	output b_p, b_n,
	input d_p, d_n,
	output h_p, k_p,
	output lemo,
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	mza_test031_clock509_and_revo_generator_althea mything (
		.local_clock50_in_p(clock50_p), .local_clock50_in_n(clock50_n),
		.local_clock509_in_p(d_p), .local_clock509_in_n(d_n),
		.clk78_p(a_p), .clk78_n(a_n),
		.trg36_p(b_p), .trg36_n(b_n),
		.clk_se(k_p),
		.trg_se(h_p),
		.lemo(lemo),
		.led_0(led_0), .led_1(led_1), .led_2(led_2), .led_3(led_3),
		.led_4(led_4), .led_5(led_5), .led_6(led_6), .led_7(led_7)
	);
endmodule

