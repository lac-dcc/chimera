// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-09-20 by mza
// last updated 2021-07-02 by mza

`include "lib/generic.v"
//`include "lib/plldcm.v"
`include "mza-test031.clock509_and_revo_generator.althea.v"
`include "mza-test032.pll_509divider_and_revo_encoder_plus_calibration_serdes.althea.v"
`include "mza-test035.SCROD_XRM_clock_and_revo_receiver_frame9_and_trigger_generator.v"

module joestrummer_and_rafferty_tb;
	reg joestrummer_local_clock50_in_p = 0, joestrummer_local_clock50_in_n = 1;
	reg joestrummer_local_clock509_in_p = 0, joestrummer_local_clock509_in_n = 1;
	wire joestrummer_trg36_p, joestrummer_trg36_n;
	wire joestrummer_lemo;
	wire joestrummer_led_0, joestrummer_led_1, joestrummer_led_2, joestrummer_led_3, joestrummer_led_4, joestrummer_led_5, joestrummer_led_6, joestrummer_led_7;
	wire raw_recovered_revo;
	wire rafferty_clk78_p;
	wire rafferty_clk78_n;
	wire rafferty_trg36_p;
	wire rafferty_trg36_n;
	assign raw_recovered_revo = rafferty_clk78_p ^ rafferty_trg36_p;
	reg recovered_revo = 0;
	mza_test031_clock509_and_revo_generator_althea joestrummer (
		.local_clock50_in_p(joestrummer_local_clock50_in_p), .local_clock50_in_n(joestrummer_local_clock50_in_n),
		.local_clock509_in_p(joestrummer_local_clock509_in_p), .local_clock509_in_n(joestrummer_local_clock509_in_n),
		.clk78_p(), .clk78_n(),
		.trg_se(),
		.clk_se(),
		.trg36_p(joestrummer_trg36_p), .trg36_n(joestrummer_trg36_n),
		.lemo(joestrummer_lemo),
		.led_0(joestrummer_led_0), .led_1(joestrummer_led_1), .led_2(joestrummer_led_2), .led_3(joestrummer_led_3),
		.led_4(joestrummer_led_4), .led_5(joestrummer_led_5), .led_6(joestrummer_led_6), .led_7(joestrummer_led_7)
	);
	wire remote_clock_p, remote_clock_n;
	wire flaky_clock;
	reg flaky_clock_select = 0;
	BUFGMUX forky (.I0(joestrummer_lemo), .I1(1'b0), .S(flaky_clock_select), .O(flaky_clock));
	OBUFDS comparator (.I(flaky_clock), .O(remote_clock_p), .OB(remote_clock_n));
	reg delay_select = 0;
	initial begin
		joestrummer_local_clock509_in_p = 0; joestrummer_local_clock509_in_n = 1;
		joestrummer_local_clock50_in_p = 0; joestrummer_local_clock50_in_n = 1;
		rafferty_local_clock50_in_p <= 0; rafferty_local_clock50_in_n <= 1;
		rafferty_local_clock509_in_p <= 0; rafferty_local_clock509_in_n <= 1;
		rafferty_clock_select <= 0;
		recovered_revo <= 0;
		flaky_clock_select <= 0;
		delay_select <= 0;
		#60000;
		flaky_clock_select <= 1;
		#4000;
		flaky_clock_select <= 0;
		#10000;
		flaky_clock_select <= 1;
		#8000;
		delay_select <= 1;
		#2000;
		flaky_clock_select <= 0;
	end
	wire intermediate0_trg36_p, intermediate0_trg36_n;
	clocked_1ns_delay snip0_p (.in(joestrummer_trg36_p), .out(intermediate0_trg36_p));
	clocked_1ns_delay snip0_n (.in(joestrummer_trg36_n), .out(intermediate0_trg36_n));
	wire intermediate1_trg36_p, intermediate1_trg36_n;
	clocked_2ns_delay snip1_p (.in(joestrummer_trg36_p), .out(intermediate1_trg36_p));
	clocked_2ns_delay snip1_n (.in(joestrummer_trg36_n), .out(intermediate1_trg36_n));
	wire intermediate_trg36_p, intermediate_trg36_n;
	mux mucks_p (.I0(intermediate0_trg36_p), .I1(intermediate1_trg36_p), .S(delay_select), .O(intermediate_trg36_p));
	mux mucks_n (.I0(intermediate0_trg36_n), .I1(intermediate1_trg36_n), .S(delay_select), .O(intermediate_trg36_n));
	always begin
		#1;
		joestrummer_local_clock509_in_p <= ~joestrummer_local_clock509_in_p; joestrummer_local_clock509_in_n <= ~joestrummer_local_clock509_in_n;
	end
	always begin
		#10;
		joestrummer_local_clock50_in_p <= ~joestrummer_local_clock50_in_p; joestrummer_local_clock50_in_n <= ~joestrummer_local_clock50_in_n;
	end
	// Inputs
	reg rafferty_local_clock50_in_p = 0;
	reg rafferty_local_clock50_in_n = 1;
	reg rafferty_local_clock509_in_p = 0;
	reg rafferty_local_clock509_in_n = 1;
	// Outputs
	wire rafferty_out1_p;
	wire rafferty_out1_n;
	wire rafferty_outa_p;
	wire rafferty_outa_n;
	wire rafferty_rsv54_p;
	wire rafferty_rsv54_n;
	wire rafferty_lemo;
	wire rafferty_ack12_p;
	wire rafferty_ack12_n;
	wire rafferty_led_revo;
	wire rafferty_led_rfclock;
	wire rafferty_driven_high;
	reg rafferty_clock_select = 0;
	wire rafferty_led_0;
	wire rafferty_led_1;
	wire rafferty_led_2;
	wire rafferty_led_3;
	wire rafferty_led_4;
	wire rafferty_led_5;
	wire rafferty_led_6;
	wire rafferty_led_7;
	mza_test032_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea #(
			.PLL_NOT_LOCKED_COUNTER_MAX(50),
			.PULSE_COUNT_MIN(10)
	) rafferty (
		.local_clock50_in_p(rafferty_local_clock50_in_p), .local_clock50_in_n(rafferty_local_clock50_in_n),
		.local_clock509_in_p(1'b0), .local_clock509_in_n(1'b1),
		.remote_clock509_in_p(remote_clock_p), .remote_clock509_in_n(remote_clock_n),
		.remote_revo_in_p(intermediate_trg36_p), .remote_revo_in_n(intermediate_trg36_n),
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
	always begin
		#1;
		rafferty_local_clock509_in_p <= ~rafferty_local_clock509_in_p; rafferty_local_clock509_in_n <= ~rafferty_local_clock509_in_n;
	end
	always begin
		#10;
		rafferty_local_clock50_in_p <= ~rafferty_local_clock50_in_p; rafferty_local_clock50_in_n <= ~rafferty_local_clock50_in_n;
	end
	always @(negedge rafferty_clk78_p) begin
		recovered_revo <= raw_recovered_revo;
	end
endmodule

module joestrummer_and_rafferty_and_scrod_tb;
	reg joestrummer_local_clock50_in_p = 0, joestrummer_local_clock50_in_n = 1;
	reg joestrummer_local_clock509_in_p = 0, joestrummer_local_clock509_in_n = 1;
	wire joestrummer_trg36_p, joestrummer_trg36_n;
	wire joestrummer_lemo;
	wire joestrummer_led_0, joestrummer_led_1, joestrummer_led_2, joestrummer_led_3, joestrummer_led_4, joestrummer_led_5, joestrummer_led_6, joestrummer_led_7;
	wire raw_recovered_revo;
	wire rafferty_clk78_p;
	wire rafferty_clk78_n;
	wire rafferty_trg36_p;
	wire rafferty_trg36_n;
	assign raw_recovered_revo = rafferty_clk78_p ^ rafferty_trg36_p;
	reg recovered_revo = 0;
	mza_test031_clock509_and_revo_generator_althea joestrummer (
		.local_clock50_in_p(joestrummer_local_clock50_in_p), .local_clock50_in_n(joestrummer_local_clock50_in_n),
		.local_clock509_in_p(joestrummer_local_clock509_in_p), .local_clock509_in_n(joestrummer_local_clock509_in_n),
		.clk78_p(), .clk78_n(),
		.trg_se(),
		.clk_se(),
		.trg36_p(joestrummer_trg36_p), .trg36_n(joestrummer_trg36_n),
		.lemo(joestrummer_lemo),
		.led_0(joestrummer_led_0), .led_1(joestrummer_led_1), .led_2(joestrummer_led_2), .led_3(joestrummer_led_3),
		.led_4(joestrummer_led_4), .led_5(joestrummer_led_5), .led_6(joestrummer_led_6), .led_7(joestrummer_led_7)
	);
	reg [24:0] scrod_bunch_marker_a_position = 0;
	reg [24:0] scrod_bunch_marker_b_position = 1;
	reg [24:0] scrod_bunch_marker_c_position = 2;
	reg [24:0] scrod_bunch_marker_d_position = 3;
	reg rafferty_clock_select = 0;
	reg scrod_reset = 1;
	reg scrod_xrm_trigger_enabled = 0;
	reg [4:0] scrod_trig_prescale_N_log2 = 12;
	initial begin
		joestrummer_local_clock509_in_p = 0; joestrummer_local_clock509_in_n = 1;
		joestrummer_local_clock50_in_p = 0; joestrummer_local_clock50_in_n = 1;
		rafferty_local_clock50_in_p <= 0; rafferty_local_clock50_in_n <= 1;
		rafferty_local_clock509_in_p <= 0; rafferty_local_clock509_in_n <= 1;
		rafferty_clock_select <= 0;
		recovered_revo <= 0;
		scrod_reset <= 1;
		#100;
		scrod_reset <= 0;
		#100;
		scrod_xrm_trigger_enabled <= 1;
		scrod_bunch_marker_a_position[12:2] <= 0; scrod_bunch_marker_a_position[24:16] <= 9'b111111111;
		scrod_bunch_marker_b_position[12:2] <= 2; scrod_bunch_marker_b_position[24:16] <= 9'b000000001;
		scrod_bunch_marker_c_position[12:2] <= 3; scrod_bunch_marker_c_position[24:16] <= 9'b100000000;
		scrod_bunch_marker_d_position[12:2] <= 4; scrod_bunch_marker_d_position[24:16] <= 9'b000111000;
		scrod_trig_prescale_N_log2 <= 2;
	end
	always begin
		#1;
		joestrummer_local_clock509_in_p <= ~joestrummer_local_clock509_in_p; joestrummer_local_clock509_in_n <= ~joestrummer_local_clock509_in_n;
	end
	always begin
		#10;
		joestrummer_local_clock50_in_p <= ~joestrummer_local_clock50_in_p; joestrummer_local_clock50_in_n <= ~joestrummer_local_clock50_in_n;
	end
	// Inputs
	reg rafferty_local_clock50_in_p = 0;
	reg rafferty_local_clock50_in_n = 1;
	reg rafferty_local_clock509_in_p = 0;
	reg rafferty_local_clock509_in_n = 1;
	// Outputs
	wire rafferty_out1_p;
	wire rafferty_out1_n;
	wire rafferty_outa_p;
	wire rafferty_outa_n;
	wire rafferty_rsv54_p = 0;
	wire rafferty_rsv54_n = 1;
	wire rafferty_lemo;
	wire rafferty_ack12_p = 0;
	wire rafferty_ack12_n = 1;
	wire rafferty_led_revo;
	wire rafferty_led_rfclock;
	wire rafferty_driven_high;
	wire rafferty_led_0;
	wire rafferty_led_1;
	wire rafferty_led_2;
	wire rafferty_led_3;
	wire rafferty_led_4;
	wire rafferty_led_5;
	wire rafferty_led_6;
	wire rafferty_led_7;
	wire remote_clock_p, remote_clock_n;
	OBUFDS samwise (.I(joestrummer_lemo), .O(remote_clock_p), .OB(remote_clock_n));
	mza_test032_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea #(
			.PLL_NOT_LOCKED_COUNTER_MAX(50),
			.PULSE_COUNT_MIN(10)
	) rafferty (
		.local_clock50_in_p(rafferty_local_clock50_in_p), .local_clock50_in_n(rafferty_local_clock50_in_n),
		.local_clock509_in_p(1'b0), .local_clock509_in_n(1'b1),
		.remote_clock509_in_p(remote_clock_p), .remote_clock509_in_n(remote_clock_n),
		.remote_revo_in_p(joestrummer_trg36_p), .remote_revo_in_n(joestrummer_trg36_n),
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
	always begin
		#1;
		rafferty_local_clock509_in_p <= ~rafferty_local_clock509_in_p; rafferty_local_clock509_in_n <= ~rafferty_local_clock509_in_n;
	end
	always begin
		#10;
		rafferty_local_clock50_in_p <= ~rafferty_local_clock50_in_p; rafferty_local_clock50_in_n <= ~rafferty_local_clock50_in_n;
	end
	always @(negedge rafferty_clk78_p) begin
		recovered_revo <= raw_recovered_revo;
	end
	wire scrod_xrm_trigger;
	wire scrod_frame;
	wire scrod_frame9;
	XRM_clock_and_revo_receiver_frame9_and_trigger_generator scrod (
		.remote_clock127_p(rafferty_clk78_p), .remote_clock127_n(rafferty_clk78_n),
		.remote_revo_p(rafferty_trg36_p), .remote_revo_n(rafferty_trg36_n),
		.rsv_p(), .rsv_n(),
		.ack_p(), .ack_n(),
		.reset(scrod_reset),
		.xrm_trigger_enabled(scrod_xrm_trigger_enabled), // from config.xrm_trigger_enabled
		.trig_prescale_N_log2(scrod_trig_prescale_N_log2), // from config.trig_prescale_N_log2
		.config_bunch_marker_a_position(scrod_bunch_marker_a_position), // from config.bunch_marker_a
		.config_bunch_marker_b_position(scrod_bunch_marker_b_position), // from config.bunch_marker_b
		.config_bunch_marker_c_position(scrod_bunch_marker_c_position), // from config.bunch_marker_c
		.config_bunch_marker_d_position(scrod_bunch_marker_d_position), // from config.bunch_marker_d
		.config_desired_trigger_quantity_for_bunch_marker_a(32'b0),
		.config_desired_trigger_quantity_for_bunch_marker_b(32'b0),
		.config_desired_trigger_quantity_for_bunch_marker_c(32'b0),
		.config_desired_trigger_quantity_for_bunch_marker_d(32'b0),
		.config_clear_count_of_triggers_for_bunch_markers(4'b0),
		.xrm_trigger(scrod_xrm_trigger),
		.allTrigs(1'b0),
		.frameCount(),
		.frame9Count(),
		.clockout(),
		.oserdes_bit_clock(1'b0),
		.oserdes_pulsetrain(),
		.config_oserdes_word_trig(32'b0),
		.triggerCount(),
		.frame(scrod_frame),
		.frame9(scrod_frame9)
	);
endmodule

