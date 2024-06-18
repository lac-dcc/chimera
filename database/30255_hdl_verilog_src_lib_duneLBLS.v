// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2024-03-11 by mza
// based on mza-test058.palimpsest.protodune-LBLS-DAQ.althea.revBLM.v
// based on mza-test066.palimpsest.protodune-LBLS-DAQ.ampoliros48.revA.v
// last updated 2024-05-08 by mza

`ifndef duneLBLS_LIB
`define duneLBLS_LIB
`timescale 1ns / 1ps

module LBLS_bank #(
	parameter CLOCK_PERIODS_TO_ACCUMULATE = $int(62500000*0.2), // should roughly match gui update period (roughly 0.2 s)
	parameter COUNTER_WIDTH = 32,
	parameter SCALER_WIDTH = 16
) (
	input clock, reset,
	input [12:1] hit_mask,
	input [12:1] inversion_mask,
	input gate, clear_channel_counters, trigger_active,
	input [7:0] win1, win2, win3, win4, win5, win6, win7, win8, win9, win10, win11, win12,
	output [SCALER_WIDTH-1:0] sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8, sc9, sc10, sc11, sc12,
	output [7:0] tot1, tot2, tot3, tot4, tot5, tot6, tot7, tot8, tot9, tot10, tot11, tot12,
	output [COUNTER_WIDTH-1:0] c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12,
	output reg any = 0
);
	genvar i;
	wire [7:0] word [12:1];
	assign word[1] = win1; assign word[2]  = win2;  assign word[3]  = win3;  assign word[4]  = win4;
	assign word[5] = win5; assign word[6]  = win6;  assign word[7]  = win7;  assign word[8]  = win8;
	assign word[9] = win9; assign word[10] = win10; assign word[11] = win11; assign word[12] = win12;
	wire [7:0] word_maybe_inverted [12:1];
	wire [7:0] word_maybe_inverted_and_maybe_masked [12:1];
	reg [7:0] word_buffered_and_maybe_inverted_a [12:1];
	reg [7:0] word_buffered_and_maybe_inverted_b [12:1];
	reg [7:0] previous_time_over_threshold [12:1];
	reg [7:0] time_over_threshold [12:1];
//	localparam CHANNEL_ONES_COUNTER_NUMBER_OF_BITS = 24;
//	localparam CHANNEL_ONES_COUNTER_UPPER_NYBBLE = 4'he;
//	reg [CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-1:0] channel_ones_counter [12:1];
//	wire [CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-1:0] channel_ones_counter_max_count;
//	wire [3:0] word_ones_counter_before [12:1];
	wire [3:0] word_ones_counter_after [12:1];
	wire [COUNTER_WIDTH-1:0] channel_counter [12:1];
	reg [12:1] iserdes_word_hit;
	for (i=1; i<=12; i=i+1) begin : raw_readout_registers_mapping
//		assign bank0[i] = { 8'd0, channel_ones_counter[i] };
//		assign bank1[i] = { word_buffered_and_maybe_inverted_a[i], word_maybe_inverted_and_maybe_masked[i], word_maybe_inverted[i], word[i] };
		assign word_maybe_inverted[i] = word[i] ^ {8{inversion_mask[i]}};
		assign word_maybe_inverted_and_maybe_masked[i] = (word[i] ^ {8{inversion_mask[i]}}) & {8{hit_mask[i]&gate}};
	end
//	reg [12:1] suggested_inversion_map;
	for (i=1; i<=12; i=i+1) begin : channel_counter_mapping
		iserdes_counter #(.BIT_DEPTH(8), .REGISTER_WIDTH(COUNTER_WIDTH)) channel_counter (.clock(clock), .reset(clear_channel_counters), .in(word_maybe_inverted[i]), .out(channel_counter[i]));
	end
	assign c1 = channel_counter[1]; assign c2  = channel_counter[2];  assign c3  = channel_counter[3];  assign c4  = channel_counter[4];
	assign c5 = channel_counter[5]; assign c6  = channel_counter[6];  assign c7  = channel_counter[7];  assign c8  = channel_counter[8];
	assign c9 = channel_counter[9]; assign c10 = channel_counter[10]; assign c11 = channel_counter[11]; assign c12 = channel_counter[12];
	iserdes_scaler_array12 #(.BIT_DEPTH(8), .REGISTER_WIDTH(SCALER_WIDTH), .CLOCK_PERIODS_TO_ACCUMULATE(CLOCK_PERIODS_TO_ACCUMULATE), .NUMBER_OF_CHANNELS(12)) channel_scaler_a_array12 (.clock(clock), .reset(1'b0),
		.in01(word_maybe_inverted[1]), .in02(word_maybe_inverted[2]), .in03(word_maybe_inverted[3]), .in04(word_maybe_inverted[4]),
		.in05(word_maybe_inverted[5]), .in06(word_maybe_inverted[6]), .in07(word_maybe_inverted[7]), .in08(word_maybe_inverted[8]),
		.in09(word_maybe_inverted[9]), .in10(word_maybe_inverted[10]), .in11(word_maybe_inverted[11]), .in12(word_maybe_inverted[12]),
		.out01(sc1), .out02(sc2),  .out03(sc3),  .out04(sc4),
		.out05(sc5), .out06(sc6),  .out07(sc7),  .out08(sc8),
		.out09(sc9), .out10(sc10), .out11(sc11), .out12(sc12)
	);
	for (i=1; i<=12; i=i+1) begin : iserdes_buffer_1_mapping
		always @(posedge clock) begin
			if (reset) begin
				word_buffered_and_maybe_inverted_a[i] <= 0;
			end else begin
				//word_buffered_and_maybe_inverted_a[i] <= {8{|hitmask[i]}} & ~word[i];
				//word_buffered_and_maybe_inverted_a[i] <= {8{hit_mask[i] & inversion_mask[i]}} ^ word[i];
				//word_buffered_and_maybe_inverted_a[i] <= (word[i] ^ {8{inversion_mask[i]}}) & {8{hit_mask[i]&gate}};
				word_buffered_and_maybe_inverted_a[i] <= word_maybe_inverted_and_maybe_masked[i];
			end
		end
	end
	for (i=1; i<=12; i=i+1) begin : iserdes_buffer_2_mapping
		always @(posedge clock) begin
			if (reset) begin
				word_buffered_and_maybe_inverted_b[i] <= 0;
			end else begin
				word_buffered_and_maybe_inverted_b[i] <= word_buffered_and_maybe_inverted_a[i];
			end
		end
	end
	for (i=1; i<=12; i=i+1) begin : iserdes_word_hit_mapping
		always @(posedge clock) begin
			if (reset) begin
				iserdes_word_hit[i] <= 0;
			end else begin
				//iserdes_word_hit[i] <= |hitmask[i] && ~|word[i]; // this result will be available when word_buffered_and_maybe_inverted_a corresponds
				//iserdes_word_hit[i] <= hit_mask[i] & inversion_mask[i] ^ (|word[i]); // this result will be available when word_buffered_and_maybe_inverted_a corresponds
				//iserdes_word_hit[i] <= ((|word[i]) ^ inversion_mask[i]) & hit_mask[i] & gate; // this result will be available when word_buffered_and_maybe_inverted_a corresponds
				iserdes_word_hit[i] <= |word_maybe_inverted_and_maybe_masked[i];
			end
		end
	end
//	for (i=1; i<=12; i=i+1) begin : channel_ones_counter_adder
//		always @(posedge clock) begin
//			if (reset) begin
//				channel_ones_counter[i] <= 0;
//			end else begin
//				if (clear_channel_ones_counters) begin
//					channel_ones_counter[i] <= 0;
//				end else begin
//					if (channel_ones_counter[i]<channel_ones_counter_max_count) begin
//						channel_ones_counter[i] <= channel_ones_counter[i] + word_ones_counter_before[i];
//					end else begin
//						channel_ones_counter[i] <= channel_ones_counter_max_count;
//					end
//				end
//			end
//		end
//	end
//	for (i=1; i<=12; i=i+1) begin : suggested_inversion_map_mapping
//		always @(posedge clock) begin
//			if (reset) begin
//				suggested_inversion_map[i] <= 0;
//			end else begin
//				if (channel_ones_counter_suggestion_threshold<channel_ones_counter[i]) begin
//					suggested_inversion_map[i] <= 1'b1;
//				end else begin
//					suggested_inversion_map[i] <= 0;
//				end
//			end
//		end
//	end
//	wire [255:0] [12:1];
//	wire [CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-1:0] channel_ones_counter_suggestion_threshold;
//	assign channel_ones_counter_suggestion_threshold[CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-1:CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-4] = 0;
//	assign channel_ones_counter_suggestion_threshold[CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-5:CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-8] = CHANNEL_ONES_COUNTER_UPPER_NYBBLE;
//	assign channel_ones_counter_suggestion_threshold[CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-8:0] = 0;
//	assign channel_ones_counter_max_count[CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-1:CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-4] = CHANNEL_ONES_COUNTER_UPPER_NYBBLE;
//	assign channel_ones_counter_max_count[CHANNEL_ONES_COUNTER_NUMBER_OF_BITS-5:0] = 0;
	for (i=1; i<=12; i=i+1) begin : ones_counter_mapping
//		count_ones c1s_before (.clock(clock), .data_in(word[i]), .count_out(word_ones_counter_before[i]));
		count_ones c1s_after (.clock(clock), .data_in(word_buffered_and_maybe_inverted_a[i]), .count_out(word_ones_counter_after[i]));
	end
	reg old_trigger_active = 0;
	for (i=1; i<=12; i=i+1) begin : time_over_threshold_mapping
		always @(posedge clock) begin
//			fifo_write_enable[i] <= 0;
			if (reset) begin
				previous_time_over_threshold[i] <= 0;
				time_over_threshold[i] <= 0;
				old_trigger_active <= 0;
			end else begin
				if (trigger_active) begin
					time_over_threshold[i] <= time_over_threshold[i] + word_ones_counter_after[i];
				end else if (old_trigger_active) begin
					previous_time_over_threshold[i] <= time_over_threshold[i];
					if (time_over_threshold[i]) begin
//						fifo_write_enable[i] <= 1;
						time_over_threshold[i] <= 0;
					end
				end
				old_trigger_active <= trigger_active;
			end
		end
	end
	assign tot1  = previous_time_over_threshold[1];
	assign tot2  = previous_time_over_threshold[2];
	assign tot3  = previous_time_over_threshold[3];
	assign tot4  = previous_time_over_threshold[4];
	assign tot5  = previous_time_over_threshold[5];
	assign tot6  = previous_time_over_threshold[6];
	assign tot7  = previous_time_over_threshold[7];
	assign tot8  = previous_time_over_threshold[8];
	assign tot9  = previous_time_over_threshold[9];
	assign tot10 = previous_time_over_threshold[10];
	assign tot11 = previous_time_over_threshold[11];
	assign tot12 = previous_time_over_threshold[12];
	always @(posedge clock) begin
		if (reset) begin
			any <= 0;
		end else begin
			any <= |iserdes_word_hit; // this result will be available when word_buffered_and_maybe_inverted_b corresponds
		end
	end
endmodule

`endif

