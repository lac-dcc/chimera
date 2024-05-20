// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-09-09 by mza
// based partly off mza-test029
// last updated 2021-07-02 by mza
// this code runs on an althea connected to a RAFFERTY board

// todo: auto-fallover for missing 509; and auto-fake revo when that happens

`define althea_revA
`include "lib/serdes_pll.v"
`include "lib/plldcm.v"
`include "lib/synchronizer.v"

module mza_test032_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea #(
	parameter PLL_NOT_LOCKED_COUNTER_MAX = 16384, // simulation only needed ~30, but 512 isn't enough for reality, so picked this
	parameter PULSE_COUNT_MIN = 131072
) (
	input local_clock50_in_p, local_clock50_in_n,
	input local_clock509_in_p, local_clock509_in_n,
	input remote_clock509_in_p, remote_clock509_in_n,
	input remote_revo_in_p, remote_revo_in_n,
	input ack12_p, ack12_n,
	output trg36_p, trg36_n,
	input rsv54_p, rsv54_n,
	output clk78_p, clk78_n,
	output out1_p, out1_n,
	output outa_p, outa_n,
	output lemo,
	output reg led_revo = 0,
	output led_rfclock,
	output driven_high,
	input clock_select,
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	wire remote_clock509;
	wire local_clock509;
	wire clock509;
	IBUFGDS remote_input_clock509_instance (.I(remote_clock509_in_p), .IB(remote_clock509_in_n), .O(remote_clock509));
	IBUFGDS local_input_clock509_instance (.I(local_clock509_in_p), .IB(local_clock509_in_n), .O(local_clock509));
	assign driven_high = 1;
//	BUFGMUX #(.CLK_SEL_TYPE("ASYNC")) clock_selection_instance (.I0(remote_clock509), .I1(local_clock509), .S(clock_select), .O(clock509));
	assign clock509 = remote_clock509;
	// ----------------------------------------------------------------------
	wire rawtrg;
	IBUFDS trigger_input_instance (.I(remote_revo_in_p), .IB(remote_revo_in_n), .O(rawtrg));
	reg saw_a_trigger_recently = 0;
	reg acknowledge_that_we_saw_a_trigger_recently = 0;
	wire pll_127_127_locked;
	always @(posedge rawtrg or negedge pll_127_127_locked or posedge acknowledge_that_we_saw_a_trigger_recently) begin
		if (~pll_127_127_locked | acknowledge_that_we_saw_a_trigger_recently) begin
			saw_a_trigger_recently <= 0;
		end else begin
			saw_a_trigger_recently <= 1;
		end
	end
	// ----------------------------------------------------------------------
	reg iserdes_reset = 1;
	reg pll_127_127_reset_1 = 1;
	reg pll_127_127_reset_2 = 0;
	wire pll_127_127_reset;
	assign pll_127_127_reset = pll_127_127_reset_1 | pll_127_127_reset_2;
	reg [25:0] counter = 0;
	reg [20:0] pll_not_locked_counter = 0;
	reg pll_lost_lock = 0;
	wire local_clock50;
	IBUFGDS local_input_clock50_instance (.I(local_clock50_in_p), .IB(local_clock50_in_n), .O(local_clock50));
	//always @(posedge local_clock50 or negedge pll_127_127_locked) begin
	always @(posedge local_clock50) begin
		if (iserdes_reset) begin
			led_revo <= 0;
			acknowledge_that_we_saw_a_trigger_recently <= 0;
		end
		if ((~pll_127_127_reset) & (~pll_127_127_locked)) begin
			if (PLL_NOT_LOCKED_COUNTER_MAX < pll_not_locked_counter) begin
				pll_lost_lock <= 1;
			end
			pll_not_locked_counter <= pll_not_locked_counter + 1'b1;
		end
		if (counter[10]) begin
			iserdes_reset <= 0;
		end
		if (counter[11]) begin
			pll_127_127_reset_1 <= 0;
		end
		if (counter[18:0]==0) begin
			if (saw_a_trigger_recently) begin
				led_revo <= 1;
				acknowledge_that_we_saw_a_trigger_recently <= 1;
			end else begin
				led_revo <= 0;
				acknowledge_that_we_saw_a_trigger_recently <= 0;
			end
		end
		if (pll_lost_lock) begin
			pll_127_127_reset_2 <= 1;
			pll_lost_lock <= 0;
			pll_not_locked_counter <= 0;
		end else begin
			pll_127_127_reset_2 <= 0;
		end
		counter <= counter + 1'b1;
	end
	// ----------------------------------------------------------------------
	wire [3:0] revo_stream127;
	wire revo_stream_clock127;
	iserdes_single4 revo_iserdes (.sample_clock(clock509), .data_in(rawtrg), .reset(iserdes_reset), .word_clock(revo_stream_clock127), .word_out(revo_stream127));
//	idelay nirvana (.clock(revo_stream_clock127), .reset(iserdes_reset), .inc_not_dec(inc_not_dec), .strobe(strobe), .bit_clock(clock509), .bit_in(rawtrg), .bit_out(delayed_rawtrg), .initiate_cal(1'b0), .busy());
	// ----------------------------------------------------------------------
	wire rawclock127_0;
	wire rawclock127_90;
	wire rawclock127_180;
	wire rawclock127_270;
//	wire raw_clock509a, raw_clock509b;
	assign led_rfclock = pll_127_127_locked;
	simplepll_BASE #(.OVERALL_DIVIDE(2), .MULTIPLY(16), .PERIOD(7.86), .COMPENSATION("INTERNAL"),
		.DIVIDE0(8), .DIVIDE1(8), .DIVIDE2(8), .DIVIDE3(8), .DIVIDE4(2), .DIVIDE5(2),
		.PHASE0(0.0), .PHASE1(90.0), .PHASE2(180.0), .PHASE3(270.0), .PHASE4(0.0), .PHASE5(180.0)
	) pll_127_127 (.clockin(revo_stream_clock127), .reset(pll_127_127_reset), .locked(pll_127_127_locked),
		.clock0out(rawclock127_0), .clock1out(rawclock127_90),
		.clock2out(rawclock127_180), .clock3out(rawclock127_270),
		.clock4out(), .clock5out()
		//.clock4out(raw_clock509a), .clock5out(raw_clock509b)
	);
	// ----------------------------------------------------------------------
	wire [3:0] pulse_revo_stream127;
	edge_to_pulse #(.WIDTH(4)) revo_stream_edger (.clock(revo_stream_clock127), .in(revo_stream127), .reset(iserdes_reset), .out(pulse_revo_stream127));
	reg select0s = 0;
	reg select1s = 0;
	reg [1:0] select2 = 0;
	reg [1:0] selectsx = 0;
	reg phase_locked = 0;
	reg revo_stream_synchronizer_reset = 1;
	// 508887500 Hz / 5120 buckets_per_revolution ~= 99392.09 revolutions_per_second
	// 24 hours_per_day * 3600 seconds_per_hour = 86400 seconds_per_day
	// 99392.09 * 86400 ~= 8.6 billion, so a 33 bit counter will roll over about once per day
	reg [32:0] histogram00 = 0;
	reg [32:0] histogram01 = 0;
	reg [32:0] histogram10 = 0;
	reg [32:0] histogram11 = 0;
	reg [32:0] histogram0s = 0;
	reg [32:0] histogram1s = 0;
	reg [34:0] pulse_count = 0;
	always @(posedge revo_stream_clock127 or posedge pll_127_127_reset or negedge pll_127_127_locked) begin
		if (iserdes_reset | pll_127_127_reset | (~pll_127_127_locked)) begin
			revo_stream_synchronizer_reset <= 1;
			phase_locked <= 0;
			pulse_count <= 0;
			select2 <= 0;
			selectsx <= 0;
			select0s <= 0;
			select1s <= 0;
			histogram0s <= 0;
			histogram1s <= 0;
			histogram00 <= 0;
			histogram01 <= 0;
			histogram10 <= 0;
			histogram11 <= 0;
		end else begin
			if (phase_locked) begin
				revo_stream_synchronizer_reset <= 0;
			end else if (PULSE_COUNT_MIN < pulse_count) begin
				revo_stream_synchronizer_reset <= 1;
				select2 <= selectsx;
				phase_locked <= 1;
				// maybe clear the count and histograms at this point?  Or add a pulse_count_max to do that...
			end
			if (histogram0s < histogram1s) begin // slight preference for 2'b0x here
				selectsx <= { 1'b1, select1s };
			end else begin
				selectsx <= { 1'b0, select0s };
			end
			if (histogram00 < histogram01) begin // slight preference for 2'b00 here
				select0s <= 1;
				histogram0s <= histogram01;
			end else begin
				select0s <= 0;
				histogram0s <= histogram00;
			end
			if (histogram10 < histogram11) begin // slight preference for 2'b10 here
				select1s <= 1;
				histogram1s <= histogram11;
			end else begin
				select1s <= 0;
				histogram1s <= histogram10;
			end
			case (pulse_revo_stream127)
				4'b1111 : begin histogram11 <= histogram11 + 1'b1; pulse_count <= pulse_count + 1'b1; end
				4'b1110 : begin histogram00 <= histogram00 + 1'b1; pulse_count <= pulse_count + 1'b1; end
				4'b1100 : begin histogram01 <= histogram01 + 1'b1; pulse_count <= pulse_count + 1'b1; end
				4'b1000 : begin histogram10 <= histogram10 + 1'b1; pulse_count <= pulse_count + 1'b1; end
			default : begin end
			endcase
		end
	end
	wire clock127_0s;
	wire clock127_1s;
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_0s (.I0(rawclock127_0),   .I1(rawclock127_90),  .S(select2[0]), .O(clock127_0s));
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_1s (.I0(rawclock127_180), .I1(rawclock127_270), .S(select2[0]), .O(clock127_1s));
	wire clock127;
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_sx (.I0(clock127_0s), .I1(clock127_1s), .S(select2[1]), .O(clock127));
	wire clock127b;
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_b (.I0(clock127_0s), .I1(clock127_1s), .S(~select2[1]), .O(clock127b));
	// ----------------------------------------------------------------------
	wire [3:0] other_revo_stream127;
	ssynchronizer_pnp #(.WIDTH(4)) revo_stream_synchronizer (.clock1(revo_stream_clock127), .clock2(clock127), .reset1(revo_stream_synchronizer_reset), .reset2(1'b0), .in1(pulse_revo_stream127), .out2(other_revo_stream127));
	reg long_trg = 0;
	wire short_trg;
	reg trg = 0;
	reg trg_inv = 1;
	edge_to_pulse #(.WIDTH(1)) long_to_short_trg (.clock(clock127), .in(long_trg), .reset(revo_stream_synchronizer_reset), .out(short_trg));
	reg oserdes_reset = 1;
	always @(posedge clock127 or posedge revo_stream_synchronizer_reset) begin
		if (revo_stream_synchronizer_reset) begin
			trg <= 0;
			trg_inv <= 1;
			long_trg <= 0;
			oserdes_reset <= 1;
		end else begin
			oserdes_reset <= 0;
			if (short_trg) begin
				trg <= 1;
				trg_inv <= 0;
			end else begin
				trg <= 0;
				trg_inv <= 1;
			end
			if (other_revo_stream127) begin
				long_trg <= 1;
			end else begin
				long_trg <= 0;
			end
		end
	end
	// ----------------------------------------------------------------------
	wire pll_oserdes_locked;
	if (0) begin
		wire data;
		wire word_clock;
		reg [7:0] word;
		wire [7:0] word_null = 8'b00000000;
		wire [7:0] word_trg  = 8'b11001100;
		ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(7.86), .DIVIDE(2), .MULTIPLY(16), .SCOPE("BUFPLL")) mylei (.clock_in(clock127), .reset(oserdes_reset), .word_clock_out(word_clock), .word_in(word), .D_out(data), .locked(pll_oserdes_locked));
		wire trg_again;
		ssynchronizer_pnp trg_synchronizer (.clock1(clock127), .clock2(word_clock), .reset1(oserdes_reset), .reset2(1'b0), .in1(trg), .out2(trg_again));
		always @(posedge word_clock or posedge oserdes_reset or negedge pll_oserdes_locked) begin
			if (oserdes_reset | ~pll_oserdes_locked) begin
				word <= word_null;
			end else begin
				if (trg_again) begin
					word <= word_trg;
				end else begin
					word <= word_null;
				end
			end
		end
		//assign lemo = data;
		OBUF lemo_cal (.I(data), .O(lemo));
	end else begin
		assign pll_oserdes_locked = 0;
		assign lemo = 0;
	end
	// ----------------------------------------------------------------------
	wire clock127_oddr;
	if (0) begin
		ODDR2 o127 (.C0(clock127), .C1(clock127b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_oddr));
	end else begin
		ODDR2 o127 (.C0(clock127), .C1(clock127b), .CE(1'b1), .D0(1'b1), .D1(1'b0), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_oddr));
	end
	wire clock127_encoded_trg_oddr;
	if (0) begin
		ODDR2 revoenc (.C0(clock127), .C1(clock127b), .CE(1'b1),  .D0(trg), .D1(trg_inv), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_encoded_trg_oddr));
	end else begin
		ODDR2 revoenc (.C0(clock127), .C1(clock127b), .CE(1'b1),  .D0(trg_inv), .D1(trg), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_encoded_trg_oddr));
	end
//	wire clock509a, clock509b;
//	BUFG a (.I(raw_clock509a), .O(clock509a));
//	BUFG b (.I(raw_clock509b), .O(clock509b));
//	wire clock509_oddr;
//	ODDR2 doughnut509 (.C0(raw_clock509a), .C1(raw_clock509b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock509_oddr));
	if (0) begin
		// test performance
//		OBUFDS ack12 (.I(rawtrg), .O(ack12_p), .OB(ack12_n));
//		OBUFDS trg36 (.I(clock509_oddr), .O(trg36_p), .OB(trg36_n));
//		OBUFDS rsv54 (.I(trg), .O(rsv54_p), .OB(rsv54_n));
		OBUFDS clk78 (.I(clock127_oddr), .O(clk78_p), .OB(clk78_n));
	end else if (0) begin
		// miscellaneous debug/troubleshoot
//		OBUFDS ack12 (.I(long_trg), .O(ack12_p), .OB(ack12_n));
//		OBUFDS ack12 (.I(select4[3]), .O(ack12_p), .OB(ack12_n));
//		OBUFDS trg36 (.I(select4[2]), .O(trg36_p), .OB(trg36_n));
//		OBUFDS rsv54 (.I(select4[1]), .O(rsv54_p), .OB(rsv54_n));
//		OBUFDS clk78 (.I(select4[0]), .O(clk78_p), .OB(clk78_n));
//		OBUFDS rsv54 (.I(rawtrg), .O(rsv54_p), .OB(rsv54_n));
//		OBUFDS supercool1 (.I(clock127_oddr), .O(clk78_p), .OB(clk78_n));
//		OBUFDS supercool1 (.I(0'b0), .O(clk78_p), .OB(clk78_n));
//		OBUFDS supercool2 (.I(select2[1]), .O(trg36_p), .OB(trg36_n));
//		OBUFDS supercool2 (.I(trg), .O(trg36_p), .OB(trg36_n));
//		OBUFDS out1 (.I(select2[1]), .O(out1_p), .OB(out1_n));
//		OBUFDS outa (.I(clock127_oddr), .O(outa_p), .OB(outa_n));
//		OBUFDS outa (.I(data), .O(outa_p), .OB(outa_n));
//		OBUFDS outa (.I(rawtrg), .O(outa_p), .OB(outa_n));
//		OBUFDS outa (.I(clock509_oddr), .O(outa_p), .OB(outa_n));
	end else begin
		// normal operation
//		OBUFDS ack12 (.I(long_trg), .O(ack12_p), .OB(ack12_n));
		OBUFDS trg36 (.I(clock127_encoded_trg_oddr), .O(trg36_p), .OB(trg36_n));
//		OBUFDS rsv54 (.I(data), .O(rsv54_p), .OB(rsv54_n));
		OBUFDS clk78 (.I(clock127_oddr), .O(clk78_p), .OB(clk78_n));
		wire ack12;
		IBUFDS ackbuf (.I(ack12_p), .IB(ack12_n), .O(ack12));
		wire rsv54;
		IBUFDS rsvbuf (.I(rsv54_p), .IB(rsv54_n), .O(rsv54));
		if (0) begin
			OBUFDS out1 (.I(rawtrg), .O(out1_p), .OB(out1_n));
			OBUFDS outa (.I(trg), .O(outa_p), .OB(outa_n));
		end else if (0) begin
			wire clock127_oddr2;
			ODDR2 doughnut127a (.C0(clock127), .C1(clock127b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_oddr2));
			OBUFDS outa (.I(clock127_oddr2), .O(outa_p), .OB(outa_n));
			wire clock127_encoded_trg_oddr2;
			ODDR2 doughnut2a (.C0(clock127), .C1(clock127b), .CE(1'b1),  .D0(trg), .D1(trg_inv), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_encoded_trg_oddr2));
			OBUFDS out1 (.I(clock127_encoded_trg_oddr2), .O(out1_p), .OB(out1_n));
		end else if (0) begin
			OBUFDS out1 (.I(rsv54), .O(out1_p), .OB(out1_n));
			OBUFDS outa (.I(ack12), .O(outa_p), .OB(outa_n));
		end else begin
			wire recovered_ack_0, recovered_ack_1;
			IDDR2 #(.DDR_ALIGNMENT("NONE")) ackack (.D(ack12), .C0(clock127), .C1(clock127b), .CE(1'b1), .R(1'b0), .S(1'b0), .Q0(recovered_ack_0), .Q1(recovered_ack_1));
			wire recovered_rsv_0, recovered_rsv_1;
			IDDR2 #(.DDR_ALIGNMENT("NONE")) rsvrsv (.D(rsv54), .C0(clock127), .C1(clock127b), .CE(1'b1), .R(1'b0), .S(1'b0), .Q0(recovered_rsv_0), .Q1(recovered_rsv_1));
			OBUFDS out1 (.I(recovered_rsv_0), .O(out1_p), .OB(out1_n));
			OBUFDS outa (.I(recovered_ack_0), .O(outa_p), .OB(outa_n));
		end
//		         if (0) begin
//		end else if (0) begin
//			OBUFDS outa (.I(long_trg), .O(outa_p), .OB(outa_n));
//		end else if (0) begin
//			OBUFDS outa (.I(short_trg), .O(outa_p), .OB(outa_n));
//		end else if (0) begin
//			OBUFDS outa (.I(|other_revo_stream127), .O(outa_p), .OB(outa_n));
//		end else if (0) begin
//			OBUFDS outa (.I(trg_inv), .O(outa_p), .OB(outa_n));
//		end else begin
//			wire clock127_oddr2;
//			ODDR2 doughnut127_2 (.C0(clock127), .C1(clock127b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(revo_stream_synchronizer_reset), .S(1'b0), .Q(clock127_oddr2));
//			OBUFDS outa (.I(clock127_oddr2), .O(outa_p), .OB(outa_n));
//		end
	end
	if (0) begin
		assign led_7 = pll_127_127_locked;
		assign led_6 = phase_locked;
		assign led_5 = revo_stream_synchronizer_reset;
		assign led_4 = pll_oserdes_locked;
		assign led_3 = selectsx[1];
		assign led_2 = selectsx[0];
		assign led_1 = select2[1];
		assign led_0 = select2[0];
	end else begin
		assign led_7 = iserdes_reset;
		assign led_6 = 0;
		assign led_5 = pll_127_127_reset;
		assign led_4 = 0;
		assign led_3 = ~pll_127_127_locked;
		assign led_2 = 0;
		assign led_1 = revo_stream_synchronizer_reset;
		assign led_0 = 0;
	end
endmodule

module rafferty_tb;
	// Inputs
	reg rafferty_local_clock50_in_p = 0, rafferty_local_clock50_in_n = 1;
	reg rafferty_remote_clock509_in_p = 0, rafferty_remote_clock509_in_n = 1;
	reg rafferty_local_clock509_in_p = 0, rafferty_local_clock509_in_n = 1;
	reg rafferty_remote_revo_in_p = 0, rafferty_remote_revo_in_n = 1;
	// Outputs
	wire rafferty_clk78_p, rafferty_clk78_n;
	wire rafferty_trg36_p, rafferty_trg36_n;
	wire rafferty_out1_p, rafferty_out1_n;
	wire rafferty_outa_p, rafferty_outa_n;
	reg rafferty_rsv54_p = 0, rafferty_rsv54_n = 0;
	wire rafferty_lemo;
	reg rafferty_ack12_p = 0, rafferty_ack12_n = 0;
	wire rafferty_led_revo;
	wire rafferty_led_rfclock;
	wire rafferty_driven_high;
	reg rafferty_clock_select = 0;
	wire rafferty_led_0, rafferty_led_1, rafferty_led_2, rafferty_led_3;
	wire rafferty_led_4, rafferty_led_5, rafferty_led_6, rafferty_led_7;
	mza_test032_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea #(
			.PLL_NOT_LOCKED_COUNTER_MAX(50),
			.PULSE_COUNT_MIN(10)
		) rafferty (
		.local_clock50_in_p(rafferty_local_clock50_in_p), .local_clock50_in_n(rafferty_local_clock50_in_n),
		.remote_clock509_in_p(rafferty_remote_clock509_in_p), .remote_clock509_in_n(rafferty_remote_clock509_in_n),
		.remote_revo_in_p(rafferty_remote_revo_in_p), .remote_revo_in_n(rafferty_remote_revo_in_n),
		.clk78_p(rafferty_clk78_p), .clk78_n(rafferty_clk78_n),
		.trg36_p(rafferty_trg36_p), .trg36_n(rafferty_trg36_n),
		.rsv54_p(rafferty_rsv54_p), .rsv54_n(rafferty_rsv54_n),
		.ack12_p(rafferty_ack12_p), .ack12_n(rafferty_ack12_n),
		.out1_p(rafferty_out1_p), .out1_n(rafferty_out1_n),
		.outa_p(rafferty_outa_p), .outa_n(rafferty_outa_n),
		.lemo(rafferty_lemo),
		.led_revo(rafferty_led_revo),
		.led_rfclock(rafferty_led_rfclock),
		.clock_select(rafferty_clock_select),
		.driven_high(rafferty_driven_high),
		.led_0(rafferty_led_0), .led_1(rafferty_led_1), .led_2(rafferty_led_2), .led_3(rafferty_led_3),
		.led_4(rafferty_led_4), .led_5(rafferty_led_5), .led_6(rafferty_led_6), .led_7(rafferty_led_7)
	);
	wire raw_recovered_revo;
	assign raw_recovered_revo = rafferty_clk78_p ^ rafferty_trg36_p;
	reg recovered_revo = 0;
	initial begin
		// Initialize Inputs
		rafferty_ack12_p <= 0; rafferty_ack12_n <= 1;
		rafferty_rsv54_p <= 0; rafferty_rsv54_n <= 1;
		rafferty_local_clock50_in_p <= 0; rafferty_local_clock50_in_n <= 1;
		rafferty_remote_clock509_in_p <= 0; rafferty_remote_clock509_in_n <= 1;
		rafferty_local_clock509_in_p <= 0; rafferty_local_clock509_in_n <= 1;
		rafferty_remote_revo_in_p <= 0; rafferty_remote_revo_in_n <= 1;
		recovered_revo <= 0;
		rafferty_clock_select <= 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		#25000;
		rafferty_remote_revo_in_p = 1; rafferty_remote_revo_in_n = 0;
		#2;
		rafferty_remote_revo_in_p = 0; rafferty_remote_revo_in_n = 1;
		#50;
		rafferty_remote_revo_in_p = 1; rafferty_remote_revo_in_n = 0;
		#8;
		rafferty_remote_revo_in_p = 0; rafferty_remote_revo_in_n = 1;
		#10240;
		rafferty_remote_revo_in_p = 1; rafferty_remote_revo_in_n = 0;
		#8;
		rafferty_remote_revo_in_p = 0; rafferty_remote_revo_in_n = 1;
		#10240;
		rafferty_remote_revo_in_p = 1; rafferty_remote_revo_in_n = 0;
		#30;
		rafferty_remote_revo_in_p = 0; rafferty_remote_revo_in_n = 1;
	end
	always begin
		#1;
		rafferty_local_clock509_in_p <= ~rafferty_local_clock509_in_p; rafferty_local_clock509_in_n <= ~rafferty_local_clock509_in_n;
	end
	always begin
		#1;
		rafferty_remote_clock509_in_p <= ~rafferty_remote_clock509_in_p; rafferty_remote_clock509_in_n <= ~rafferty_remote_clock509_in_n;
	end
	always begin
		#10;
		rafferty_local_clock50_in_p <= ~rafferty_local_clock50_in_p; rafferty_local_clock50_in_n <= ~rafferty_local_clock50_in_n;
	end
	always @(negedge rafferty_clk78_p) begin
		recovered_revo <= raw_recovered_revo;
	end
endmodule

module mza_test032_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea_top (
	input clock50_p, clock50_n,
	input a_p, a_n,
	output b_p, b_n,
	input c_p, c_n,
	output d_p, d_n,
	output e_p, e_n,
	output f_p, f_n,
	input g_n, output g_p,
	input h_p, h_n,
	input j_p, j_n,
	input k_p, k_n,
	output l_p, l_n,
	output lemo,
	output led_0, output led_1, output led_2, output led_3,
	output led_4, output led_5, output led_6, output led_7
);
	mza_test032_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea rafferty (
		.local_clock50_in_p(clock50_p), .local_clock50_in_n(clock50_n),
		.local_clock509_in_p(j_p), .local_clock509_in_n(j_n),
		.remote_clock509_in_p(k_p), .remote_clock509_in_n(k_n),
		.remote_revo_in_p(h_p), .remote_revo_in_n(h_n),
		.ack12_p(a_p), .ack12_n(a_n),
		.trg36_p(f_p), .trg36_n(f_n),
		.rsv54_p(c_p), .rsv54_n(c_n),
		.clk78_p(d_p), .clk78_n(d_n),
		.out1_p(e_p), .out1_n(e_n),
		.outa_p(b_p), .outa_n(b_n),
		.lemo(lemo),
		.led_revo(l_n),
		.led_rfclock(l_p),
		.driven_high(g_p), .clock_select(g_n),
		.led_0(led_0), .led_1(led_1), .led_2(led_2), .led_3(led_3),
		.led_4(led_4), .led_5(led_5), .led_6(led_6), .led_7(led_7)
	);
endmodule

