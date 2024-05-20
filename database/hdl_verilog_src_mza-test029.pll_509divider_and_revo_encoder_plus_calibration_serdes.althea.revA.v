// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-08-14 by mza
// last updated 2022-09-23 by mza

// ERROR: Unroutable signal: mything/mylei/difficult_pll_TR/rawclock_nx_plladv pin: mything/mylei/difficult_pll_TR/simon1/I

// todo: auto-fallover for missing 509; and auto-fake revo when that happens

`define althea_revA

module ssynchronizer_90_270 #(
	parameter WIDTH=1
) (
	input clock1,
	input clock2, clock1_90, clock1_270,
	input reset,
	input [WIDTH-1:0] in1,
	output [WIDTH-1:0] out2
);
	reg [WIDTH-1:0] intermediate_f1;
	reg [WIDTH-1:0] intermediate_f2;
	reg [WIDTH-1:0] intermediate_f3;
	reg [WIDTH-1:0] intermediate_f4;
	reg [WIDTH-1:0] intermediate_s1;
	reg [WIDTH-1:0] intermediate_s2;
//	(* KEEP = "TRUE" *) wire [WIDTH-1:0] cdc;
	always @(posedge clock1) begin
		if (reset) begin
			intermediate_f1 <= 0;
		end else begin
			intermediate_f1 <= in1;
		end
	end
	always @(posedge clock1_270) begin
		if (reset) begin
			intermediate_f2 <= 0;
		end else begin
			intermediate_f2 <= intermediate_f1;
		end
	end
	always @(negedge clock1) begin
		if (reset) begin
			intermediate_f3 <= 0;
		end else begin
			intermediate_f3 <= intermediate_f2;
		end
	end
	always @(posedge clock1_90) begin
		if (reset) begin
			intermediate_f4 <= 0;
		end else begin
			intermediate_f4 <= intermediate_f3;
		end
	end
//	assign cdc = intermediate_f4;
	always @(negedge clock2) begin
		if (reset) begin
			intermediate_s1 <= 0;
		end else begin
			//intermediate_s1 <= cdc;
			intermediate_s1 <= intermediate_f4;
		end
	end
	always @(posedge clock2) begin
		if (reset) begin
			intermediate_s2 <= 0;
		end else begin
			intermediate_s2 <= intermediate_s1;
		end
	end
	assign out2 = intermediate_s2;
endmodule

module ssynchronizer_pnppp #(
	parameter WIDTH=1
) (
	input clock1, clock2,
	input reset,
	input [WIDTH-1:0] in1,
	output [WIDTH-1:0] out2
);
	reg [WIDTH-1:0] intermediate_f1;
	reg [WIDTH-1:0] intermediate_f2;
	reg [WIDTH-1:0] intermediate_f3;
	reg [WIDTH-1:0] intermediate_s1;
	reg [WIDTH-1:0] intermediate_s2;
	(* KEEP = "TRUE" *) wire [WIDTH-1:0] cdc;
//  242 pos neg neg pos pos
//  332 pos neg neg neg pos
// 1030 pos pos neg neg pos
// 1759 pos neg neg pos neg
	always @(posedge clock1) begin
		if (reset) begin
			intermediate_f1 <= 0;
		end else begin
			intermediate_f1 <= in1;
		end
	end
	always @(negedge clock1) begin
		if (reset) begin
			intermediate_f2 <= 0;
		end else begin
			intermediate_f2 <= intermediate_f1;
		end
	end
	always @(negedge clock1) begin
		if (reset) begin
			intermediate_f3 <= 0;
		end else begin
			intermediate_f3 <= intermediate_f2;
		end
	end
	assign cdc = intermediate_f3;
	always @(posedge clock2) begin
		if (reset) begin
			intermediate_s1 <= 0;
		end else begin
			intermediate_s1 <= cdc;
		end
	end
	always @(posedge clock2) begin
		if (reset) begin
			intermediate_s2 <= 0;
		end else begin
			intermediate_s2 <= intermediate_s1;
		end
	end
	assign out2 = intermediate_s2;
endmodule

module asynchronizer (
	input clock,
	input reset,
	input async_in,
	output reg sync_out
);
// https://daffy1108.wordpress.com/2014/06/08/synchronizers-for-asynchronous-signals/
	reg intermediate_s1;
	reg intermediate_s2;
	reg intermediate_s3;
//	(* KEEP = "TRUE" *) wire cdc;
	wire randy;
	assign randy = reset | ((~async_in) & intermediate_s3);
	always @(posedge async_in) begin
		if (randy) begin
			intermediate_s1 <= 0;
		end else begin
			intermediate_s1 <= 1;
		end
	end
//	assign cdc = intermediate_s1;
	always @(posedge clock) begin
		if (randy) begin
			intermediate_s2 <= 0;
		end else begin
			intermediate_s2 <= intermediate_s1; // cdc;
		end
	end
	always @(posedge clock) begin
		if (reset) begin
			intermediate_s3 <= 0;
			sync_out <= 0;
		end else begin
			sync_out <= intermediate_s3;
			intermediate_s3 <= intermediate_s2;
		end
	end
endmodule

module mza_test029_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea (
	input local_clock50_in_p, input local_clock50_in_n,
	input local_clock509_in_p, input local_clock509_in_n,
	input remote_clock509_in_p, input remote_clock509_in_n,
	input remote_revo_in_p, input remote_revo_in_n,
	output clock127_out_p, output clock127_out_n,
	output trg_out_p, output trg_out_n,
	output out1_p, output out1_n,
	output outa_p, output outa_n,
	output rsv_p, output rsv_n,
	input lemo,
	input ack_p, input ack_n,
	output reg led_revo,
	output reg led_rfclock,
	output driven_high,
	input clock_select,
	output led_0, output led_1, output led_2, output led_3, output led_4, output led_5, output led_6, output led_7
);
	wire ack;
	IBUFGDS ackbuf (.I(ack_p), .IB(ack_n), .O(ack));
	// ----------------------------------------------------------------------
	wire remote_clock509;
	wire local_clock509;
	wire clock509;
	IBUFGDS remote_input_clock509_instance (.I(remote_clock509_in_p), .IB(remote_clock509_in_n), .O(remote_clock509));
	IBUFGDS local_input_clock509_instance (.I(local_clock509_in_p), .IB(local_clock509_in_n), .O(local_clock509));
	assign driven_high = 1;
	BUFGMUX #(.CLK_SEL_TYPE("ASYNC")) clock_selection_instance (.I0(remote_clock509), .I1(local_clock509), .S(clock_select), .O(clock509));
	// ----------------------------------------------------------------------
	reg reset = 1;
	reg [11:0] reset_counter = 0;
	wire local_clock50;
	IBUFGDS local_input_clock50_instance (.I(local_clock50_in_p), .IB(local_clock50_in_n), .O(local_clock50));
	always @(posedge local_clock50) begin
		if (reset) begin
			led_revo <= 0;
			led_rfclock <= 0;
		end
		if (reset_counter[10]) begin
			reset <= 0;
		end
		reset_counter <= reset_counter + 1'b1;
	end
	// ----------------------------------------------------------------------
	wire rawclock127;
	wire rawclock127b;
	wire rawclock254;
	wire rawclock254b;
	wire rawclock509_1;
	wire rawclock509_3;
	wire locked1;
	simplepll_BASE #(.OVERALL_DIVIDE(2), .MULTIPLY(4), .PERIOD(1.965), .COMPENSATION("INTERNAL"),
		.DIVIDE0(8), .DIVIDE1(8), .DIVIDE2(4), .DIVIDE3(4), .DIVIDE4(2), .DIVIDE5(2),
		.PHASE0(0.0), .PHASE1(180.0), .PHASE2(0.0), .PHASE3(180.0), .PHASE4(90.0), .PHASE5(270.0)
	) mypll (.clockin(clock509), .reset(reset), .locked(locked1),
		.clock0out(rawclock127), .clock1out(rawclock127b),
		.clock2out(rawclock254), .clock3out(rawclock254b),
		.clock4out(rawclock509_90), .clock5out(rawclock509_270)
	);
	wire clock127;
	wire clock127b;
	BUFG mybufg0 (.I(rawclock127), .O(clock127));
	BUFG mybufg1 (.I(rawclock127b), .O(clock127b));
	wire clock254;
	wire clock254b;
	BUFG mybufg2 (.I(rawclock254), .O(clock254));
	BUFG mybufg3 (.I(rawclock254b), .O(clock254b));
	wire clock254_90;
	wire clock254_270;
	BUFG mybufg4 (.I(rawclock254_90), .O(clock254_90));
	BUFG mybufg5 (.I(rawclock254_270), .O(clock254_270));
	// ----------------------------------------------------------------------
	reg [3:0] phase;
	reg trg, trg_inv1, should_trg;
	parameter TRGSTREAM_WIDTH = 8'd16;
	parameter TRG_MAX_DURATION = 8'd8;
	reg [TRGSTREAM_WIDTH-1:0] trgstream509;
	wire [TRGSTREAM_WIDTH-1:0] trgstream254;
	reg [TRGSTREAM_WIDTH-TRG_MAX_DURATION-1:0] upper;
	reg [TRG_MAX_DURATION-1:0] lower;
	reg u, l;
	wire rawtrg, rawtrg2;
	IBUFGDS trigger_input_instance (.I(remote_revo_in_p), .IB(remote_revo_in_n), .O(rawtrg));
	always @(posedge clock509) begin
		if (reset) begin
			trgstream509 <= 0;
		end else begin
			trgstream509 <= { trgstream509[TRGSTREAM_WIDTH-2:0], rawtrg2 };
		end
	end
	//ssynchronizer #(.WIDTH(TRGSTREAM_WIDTH)) ts_sync (.clock1(clock509), .clock2(clock254), .reset(reset), .in1(trgstream509), .out2(trgstream254));
	ssynchronizer_pnppp #(.WIDTH(TRGSTREAM_WIDTH)) ts_sync (.clock1(clock509), .clock2(clock254), .reset(reset), .in1(trgstream509), .out2(trgstream254));
	//ssynchronizer_90_270 #(.WIDTH(TRGSTREAM_WIDTH)) ts_sync (.clock1(clock509), .clock1_90(clock254_90), .clock1_270(clock254_270), .clock2(clock254), .reset(reset), .in1(trgstream509), .out2(trgstream254));
	//assign rawtrg2 = rawtrg;
	asynchronizer rawtrg_sync (.clock(clock509), .reset(reset), .async_in(rawtrg), .sync_out(rawtrg2));
	always @(posedge clock127) begin
		if (reset) begin
			phase <= 4'b0001;
			trg <= 0;
			trg_inv1 <= 1;
			should_trg <= 0;
			upper <= 0;
			lower <= 0;
			u <= 0;
			l <= 0;
		end else begin
			if (phase == 4'b0001) begin
				//led_revo <= 0;
				if (should_trg) begin
					trg <= 1;
					trg_inv1 <= 0;
				end else begin
					trg <= 0;
					trg_inv1 <= 1;
				end
				//if (trgstream[TRGSTREAM_WIDTH-1:TRG_MAX_DURATION] == 0 && trgstream[TRG_MAX_DURATION-1:0] != 0) begin
				upper <= trgstream254[TRGSTREAM_WIDTH-1:TRG_MAX_DURATION];
				lower <= trgstream254[TRG_MAX_DURATION-1:0];
			end else if (phase == 4'b0010) begin
				u <= |upper;
				l <= |lower;
				should_trg <= 0;
			end else if (phase == 4'b0100) begin
				if (l) begin
					should_trg <= 1;
				end
			end else begin
				if (u) begin
					should_trg <= 0;
				end
//				if (l) begin
//					if (u) begin
//						should_trg <= 0;
//					end else begin
//						should_trg <= 1;
//					end
//				end
			end
			phase <= { phase[2:0], phase[3] };
		end
	end
	// ----------------------------------------------------------------------
	wire locked2;
	assign led_7 = locked2;
	assign led_6 = 0;//phase[0];
	assign led_5 = reset;
	assign led_4 = 0;//lemo;
	assign led_3 = clock_select;
	assign led_2 = trg;
	assign led_1 = 0;//rawtrg;
	assign led_0 = locked1;
	// ----------------------------------------------------------------------
	wire data;
	wire word_clock;
	reg [7:0] word;
	wire [7:0] word_null = 8'b11000000;
	wire [7:0] word_trg  = 8'b00111111;
	ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(3.93), .DIVIDE(2), .MULTIPLY(8)) mylei (.clock_in(clock254), .reset(reset), .word_clock_out(word_clock), .word_in(word), .D_out(data), .locked(locked2));
	always @(posedge word_clock) begin
		if (reset) begin
			word <= word_null;
		end else begin
			if (trg) begin
				word <= word_trg;
			end else begin
				word <= word_null;
			end
		end
	end
	// ----------------------------------------------------------------------
	OBUFDS rsv (.I(data), .O(rsv_p), .OB(rsv_n));
//	OBUFDS rsv (.I(0), .O(rsv_p), .OB(rsv_n));
	wire clock127_oddr1;
	ODDR2 doughnut0 (.C0(clock127), .C1(clock127b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(reset), .S(1'b0), .Q(clock127_oddr1));
	OBUFDS supercool1 (.I(clock127_oddr1), .O(clock127_out_p), .OB(clock127_out_n));
//	OBUFDS supercool1 (.I(0), .O(clock127_out_p), .OB(clock127_out_n));
//	wire clock127_oddr2;
//	ODDR2 doughnut1 (.C0(clock127), .C1(clock127b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(reset), .S(1'b0), .Q(clock127_oddr2));
//	OBUFDS outa (.I(clock127_oddr2), .O(outa_p), .OB(outa_n));
//	OBUFDS outa (.I(data), .O(outa_p), .OB(outa_n));
	OBUFDS outa (.I(rawtrg), .O(outa_p), .OB(outa_n));
	wire clock127_encoded_trg_oddr1;
	ODDR2 doughnut2 (.C0(clock127), .C1(clock127b), .CE(trg_inv1),  .D0(1'b0), .D1(1'b1), .R(reset), .S(1'b0), .Q(clock127_encoded_trg_oddr1));
	OBUFDS supercool2 (.I(clock127_encoded_trg_oddr1), .O(trg_out_p), .OB(trg_out_n));
//	OBUFDS supercool2 (.I(0), .O(trg_out_p), .OB(trg_out_n));
//	wire clock127_encoded_trg_oddr2;
//	ODDR2 doughnut3 (.C0(clock127), .C1(clock127b), .CE(trg_inv2),  .D0(1'b0), .D1(1'b1), .R(reset), .S(1'b0), .Q(clock127_encoded_trg_oddr2));
//	OBUFDS out1 (.I(clock127_encoded_trg_oddr2), .O(out1_p), .OB(out1_n));
	OBUFDS out1 (.I(trg), .O(out1_p), .OB(out1_n));
endmodule

module mything_tb;
	// Inputs
	reg remote_clock50_in_p;
	reg remote_clock50_in_n;
	reg remote_clock509_in_p;
	reg remote_clock509_in_n;
	reg local_clock509_in_p;
	reg local_clock509_in_n;
	reg remote_revo_in_p;
	reg remote_revo_in_n;
	// Outputs
	wire clock127_out_p;
	wire clock127_out_n;
	wire trg_out_p;
	wire trg_out_n;
	wire out1_p;
	wire out1_n;
	wire outa_p;
	wire outa_n;
	wire rsv_p;
	wire rsv_n;
	reg lemo;
	reg ack_p;
	reg ack_n;
	wire led_revo;
	wire led_rfclock;
	wire driven_high;
	reg clock_select = 0;
	wire led_0;
	wire led_1;
	wire led_2;
	wire led_3;
	wire led_4;
	wire led_5;
	wire led_6;
	wire led_7;
	// Instantiate the Unit Under Test (UUT)
	mza_test029_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea uut (
		.remote_clock50_in_p(remote_clock50_in_p), .remote_clock50_in_n(remote_clock50_in_n),
		.remote_clock509_in_p(remote_clock509_in_p), .remote_clock509_in_n(remote_clock509_in_n),
		.remote_revo_in_p(remote_revo_in_p), .remote_revo_in_n(remote_revo_in_n),
		.clock127_out_p(clock127_out_p), .clock127_out_n(clock127_out_n),
		.trg_out_p(trg_out_p), .trg_out_n(trg_out_n),
		.rsv_p(rsv_p), .rsv_n(rsv_n),
		.ack_p(ack_p), .ack_n(ack_n),
		.out1_p(out1_p), .out1_n(out1_n),
		.outa_p(outa_p), .outa_n(outa_n),
		.lemo(lemo),
		.led_revo(l_p),
		.led_rfclock(l_n),
		.clock_select(clock_select),
		.driven_high(driven_high),
		.led_0(led_0),
		.led_1(led_1),
		.led_2(led_2),
		.led_3(led_3),
		.led_4(led_4),
		.led_5(led_5),
		.led_6(led_6),
		.led_7(led_7)
	);
	wire raw_recovered_revo;
	assign raw_recovered_revo = clock127_out_p ^ trg_out_p;
	reg recovered_revo;
	initial begin
		// Initialize Inputs
		remote_clock50_in_p <= 0; remote_clock50_in_n <= 1;
		remote_clock509_in_p <= 0; remote_clock509_in_n <= 1;
		local_clock509_in_p <= 0; local_clock509_in_n <= 1;
		remote_revo_in_p <= 0; remote_revo_in_n <= 1;
		recovered_revo <= 0; lemo <= 0; ack_p <= 0; ack_n <= 1;
		clock_select <= 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		#5000;
		remote_revo_in_p = 1; remote_revo_in_n = 0;
		#2;
		remote_revo_in_p = 0; remote_revo_in_n = 1;
		#50;
		remote_revo_in_p = 1; remote_revo_in_n = 0;
		#8;
		remote_revo_in_p = 0; remote_revo_in_n = 1;
		#50;
		remote_revo_in_p = 1; remote_revo_in_n = 0;
		#30;
		remote_revo_in_p = 0; remote_revo_in_n = 1;
	end
	always begin
		#1;
		local_clock509_in_p <= ~local_clock509_in_p;
		#1;
		local_clock509_in_n <= ~local_clock509_in_n;
	end
	always begin
		#1;
		remote_clock509_in_p <= ~remote_clock509_in_p;
		#1;
		remote_clock509_in_n <= ~remote_clock509_in_n;
	end
	always begin
		#10;
		remote_clock50_in_p <= ~remote_clock50_in_p;
		#10;
		remote_clock50_in_n <= ~remote_clock50_in_n;
	end
	always @(negedge clock127_out_p) begin
		recovered_revo <= raw_recovered_revo;
	end
endmodule

module mza_test029_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea_top (
	input clock50_p, clock50_n,
	input a_p, a_n,
	output b_p, b_n,
	output c_p, c_n,
	output d_p, d_n,
	output e_p, e_n,
	input h_p, h_n,
	input j_p, j_n,
	input k_p, k_n,
	input lemo,
	output l_p, l_n,
	input g_n, output g_p,
	output led_0, output led_1, output led_2, output led_3,
	output led_4, output led_5, output led_6, output led_7
);
	mza_test029_pll_509divider_and_revo_encoder_plus_calibration_serdes_althea mything (
		.local_clock50_in_p(clock50_p), .local_clock50_in_n(clock50_n),
		.local_clock509_in_p(j_p), .local_clock509_in_n(j_n),
		.remote_clock509_in_p(k_p), .remote_clock509_in_n(k_n),
		.remote_revo_in_p(h_p), .remote_revo_in_n(h_n),
		.clock127_out_p(d_p), .clock127_out_n(d_n),
		.trg_out_p(f_p), .trg_out_n(f_n),
		.rsv_p(c_p), .rsv_n(c_n),
		.ack_p(a_p), .ack_n(a_n),
		.out1_p(e_p), .out1_n(e_n),
		.outa_p(b_p), .outa_n(b_n),
		.lemo(lemo),
		.led_revo(l_p),
		.led_rfclock(l_n),
		.driven_high(g_p), .clock_select(g_n),
		.led_0(led_0), .led_1(led_1), .led_2(led_2), .led_3(led_3),
		.led_4(led_4), .led_5(led_5), .led_6(led_6), .led_7(led_7)
	);
endmodule

