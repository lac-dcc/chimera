// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-09-20 by mza
// based on vhdl version I wrote in late 2018 / early 2019 (from ScrodRevB_b2tt.vhd in UH svn repo)
// last updated 2021-01-23 by mza

module ocyrus7series (
	input bit_clock,
	output word_clock,
	input reset,
	input [7:0] input_word,
	output output_bit
);
	// ug471 says CLK and DIVCLK must either:
	// both come from a single MMCM/PLL
	// or
	// CLK must be from a BUFIO and CLKDIV must be from a BUFR
	wire raw_word_clock;
	BUFR #(.BUFR_DIVIDE("4"), .SIM_DEVICE("7SERIES")) deviate (.I(bit_clock), .O(raw_word_clock), .CLR(reset), .CE(1'b1));
	assign word_clock = raw_word_clock;
	// from ug768:
	OSERDESE2 #(
		.DATA_RATE_OQ("DDR"), // DDR, SDR
		.DATA_RATE_TQ("DDR"), // DDR, BUF, SDR
		.DATA_WIDTH(8), // Parallel data width (2-8,10,14)
		.INIT_OQ(1'b0), // Initial value of OQ output (1'b0,1'b1)
		.INIT_TQ(1'b0), // Initial value of TQ output (1'b0,1'b1)
		.SERDES_MODE("MASTER"), // M*****, S****
		.SRVAL_OQ(1'b0), // OQ output value when SR is used (1'b0,1'b1)
		.SRVAL_TQ(1'b0), // TQ output value when SR is used (1'b0,1'b1)
		.TBYTE_CTL("FALSE"), // Enable tristate byte operation (FALSE, TRUE)
		.TBYTE_SRC("FALSE"), // Tristate byte source (FALSE, TRUE)
		.TRISTATE_WIDTH(1) // 3-state converter width (1,4)
	) OSERDESE2_instance (
		.OFB(), // 1-bit output: Feedback path for data
		.OQ(output_bit), // 1-bit output: Data path output
		.SHIFTOUT1(), .SHIFTOUT2(), // SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
		.CLK(bit_clock), // 1-bit input: High speed clock
		.CLKDIV(raw_word_clock), // 1-bit input: Divided clock
		.D1(input_word[7]), .D2(input_word[6]), .D3(input_word[5]), .D4(input_word[4]), // D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
		.D5(input_word[3]), .D6(input_word[2]), .D7(input_word[1]), .D8(input_word[0]),
		.OCE(1'b1), // 1-bit input: Output data clock enable
		.RST(reset), // 1-bit input: Reset
		.SHIFTIN1(1'b0), .SHIFTIN2(1'b0), // SHIFTIN1 / SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
		.TBYTEOUT(), // 1-bit output: Byte group tristate
		.TFB(), // 1-bit output: 3-state control
		.TQ(), // 1-bit output: 3-state control
		.T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0), // T1 - T4: 1-bit (each) input: Parallel 3-state inputs
		.TBYTEIN(1'b0), // 1-bit input: Byte group tristate
		.TCE(1'b0) // 1-bit input: 3-state clock enable
	);
endmodule

module XRM_clock_and_revo_receiver_frame9_and_trigger_generator (
	input remote_clock127_p, remote_clock127_n,
	input remote_revo_p, remote_revo_n,
	output rsv_p, rsv_n,
	output ack_p, ack_n,
	input reset,
	input xrm_trigger_enabled, // from config.xrm_trigger_enabled
	input [4:0] trig_prescale_N_log2, // from config.trig_prescale_N_log2
	input [24:0] config_bunch_marker_a_position, // from config.bunch_marker_a
	input [24:0] config_bunch_marker_b_position, // from config.bunch_marker_b
	input [24:0] config_bunch_marker_c_position, // from config.bunch_marker_c
	input [24:0] config_bunch_marker_d_position, // from config.bunch_marker_d
	input [31:0] config_desired_trigger_quantity_for_bunch_marker_a, // from config.desired_trigger_quantity_for_bunch_marker_a
	input [31:0] config_desired_trigger_quantity_for_bunch_marker_b, // from config.desired_trigger_quantity_for_bunch_marker_b
	input [31:0] config_desired_trigger_quantity_for_bunch_marker_c, // from config.desired_trigger_quantity_for_bunch_marker_c
	input [31:0] config_desired_trigger_quantity_for_bunch_marker_d, // from config.desired_trigger_quantity_for_bunch_marker_d
	input [3:0] config_clear_count_of_triggers_for_bunch_markers,
	input allTrigs,
	output [31:0] triggerCount,
	output [31:0] frame9Count,
	output [31:0] frameCount,
	output clockout,
	output xrm_trigger,
	input oserdes_bit_clock,
	output oserdes_pulsetrain,
	input [31:0] config_oserdes_word_trig,
	output reg frame = 0,
	output reg frame9 = 0
);
	wire clock127;
	IBUFGDS clock127_instance (.I(remote_clock127_p), .IB(remote_clock127_n), .O(clock127));
	assign clockout = clock127;
	reg [7:0] oserdes_word = 0;
	reg [7:0] oserdes_word_null = 0;
	reg [7:0] oserdes_word_trig = 0;
	//reg xrm_trigger_s0 = 0;
	wire clock127_prime;
	always @(posedge clock127_prime) begin
		if (reset) begin
			oserdes_word <= 0;
			oserdes_word_null <= 0;
			oserdes_word_trig <= 0;
		end else begin
			oserdes_word <= oserdes_word_null;
			if (xrm_trigger) begin
				oserdes_word <= oserdes_word_trig;
			end
		end
		//oserdes_word_trig_s0 <= oserdes_word_trig_s1;
		//oserdes_word_trig_s1 <= oserdes_word_trig_s2;
		oserdes_word_null <= config_oserdes_word_trig[23:16];
		oserdes_word_trig <= config_oserdes_word_trig[7:0];
		//xrm_trigger_s0 <= xrm_trigger_s2;
		//xrm_trigger_s1 <= xrm_trigger_s2;
		//xrm_trigger_s0 <= xrm_trigger;
	end
	ocyrus7series smiley (.bit_clock(oserdes_bit_clock), .reset(reset), .word_clock(clock127_prime), .input_word(oserdes_word), .output_bit(oserdes_pulsetrain));
	parameter FTSW_CLOCKS_IN_ONE_BEAM_ORBIT_MINUS_ONE = 1280 - 1;
	wire remote_revo_encoded;
	IBUFGDS revo_instance (.I(remote_revo_p), .IB(remote_revo_n), .O(remote_revo_encoded));
	wire remote_revo;
	IDDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) iddr_inst (.C(clock127), .CE(1'b1), .R(1'b0), .S(1'b0), .D(remote_revo_encoded), .Q1(remote_revo), .Q2());
	reg local_revo = 0;
	reg xrm_trigger_active_for_bunch_marker_a = 0;
	reg xrm_trigger_active_for_bunch_marker_b = 0;
	reg xrm_trigger_active_for_bunch_marker_c = 0;
	reg xrm_trigger_active_for_bunch_marker_d = 0;
	reg [31:0] count_of_triggers_sent_out_for_bunch_marker_a = 0;
	reg [31:0] count_of_triggers_sent_out_for_bunch_marker_b = 0;
	reg [31:0] count_of_triggers_sent_out_for_bunch_marker_c = 0;
	reg [31:0] count_of_triggers_sent_out_for_bunch_marker_d = 0;
	reg [8:0] frame9_token = 9'b100000000;
	reg bunch_marker_a = 0;
	reg bunch_marker_b = 0;
	reg bunch_marker_c = 0;
	reg bunch_marker_d = 0;
	reg [10:0] clock127_counter = 0; // 0 to 1279
	reg [31:0] frame9_counter = 1;
	reg [31:0] frame9_prescale = 0;
	reg [24:0] bunch_marker_a_position = 0;
	reg [24:0] bunch_marker_b_position = 0;
	reg [24:0] bunch_marker_c_position = 0;
	reg [24:0] bunch_marker_d_position = 0;
	reg [31:0] desired_trigger_quantity_for_bunch_marker_a = 0;
	reg [31:0] desired_trigger_quantity_for_bunch_marker_b = 0;
	reg [31:0] desired_trigger_quantity_for_bunch_marker_c = 0;
	reg [31:0] desired_trigger_quantity_for_bunch_marker_d = 0;
	assign xrm_trigger = bunch_marker_a | bunch_marker_b | bunch_marker_c | bunch_marker_d;
	reg [31:0] total_frame9_counter = 0;
	assign frame9Count = total_frame9_counter;
	reg [31:0] total_frame_counter = 0;
	assign frameCount = total_frame_counter;
	reg [31:0] total_triggerCount = 0;
	assign triggerCount = total_triggerCount;
	always @(posedge clock127) begin
		if (reset) begin
			frame <= 0;
			frame9 <= 0;
			frame9_token <= 9'b100000000;
			clock127_counter <= 0;
			frame9_counter <= 1;
			total_frame9_counter <= 0;
			total_frame_counter <= 0;
			xrm_trigger_active_for_bunch_marker_a <= 0;
			xrm_trigger_active_for_bunch_marker_b <= 0;
			xrm_trigger_active_for_bunch_marker_c <= 0;
			xrm_trigger_active_for_bunch_marker_d <= 0;
			count_of_triggers_sent_out_for_bunch_marker_a <= 0;
			count_of_triggers_sent_out_for_bunch_marker_b <= 0;
			count_of_triggers_sent_out_for_bunch_marker_c <= 0;
			count_of_triggers_sent_out_for_bunch_marker_d <= 0;
			local_revo <= 0;
			bunch_marker_a <= 0;
			bunch_marker_b <= 0;
			bunch_marker_c <= 0;
			bunch_marker_d <= 0;
			total_triggerCount <= 0;
		end else begin
			if (allTrigs) begin
				total_triggerCount <= total_triggerCount + 1;
			end
			frame <= local_revo;
			frame9 <= frame9_token[8];
			bunch_marker_a <= 0;
			bunch_marker_b <= 0;
			bunch_marker_c <= 0;
			bunch_marker_d <= 0;
			if (xrm_trigger_active_for_bunch_marker_a) begin
				if (clock127_counter == bunch_marker_a_position[12:2]) begin
					if (bunch_marker_a_position[24:16] & frame9_token) begin
						bunch_marker_a <= 1;
						count_of_triggers_sent_out_for_bunch_marker_a <= count_of_triggers_sent_out_for_bunch_marker_a + 1;
					end
				end
			end
			if (xrm_trigger_active_for_bunch_marker_b) begin
				if (clock127_counter == bunch_marker_b_position[12:2]) begin
					if (bunch_marker_b_position[24:16] & frame9_token) begin
						bunch_marker_b <= 1;
						count_of_triggers_sent_out_for_bunch_marker_b <= count_of_triggers_sent_out_for_bunch_marker_b + 1;
					end
				end
			end
			if (xrm_trigger_active_for_bunch_marker_c) begin
				if (clock127_counter == bunch_marker_c_position[12:2]) begin
					if (bunch_marker_c_position[24:16] & frame9_token) begin
						bunch_marker_c <= 1;
						count_of_triggers_sent_out_for_bunch_marker_c <= count_of_triggers_sent_out_for_bunch_marker_c + 1;
					end
				end
			end
			if (xrm_trigger_active_for_bunch_marker_d) begin
				if (clock127_counter == bunch_marker_d_position[12:2]) begin
					if (bunch_marker_d_position[24:16] & frame9_token) begin
						bunch_marker_d <= 1;
						count_of_triggers_sent_out_for_bunch_marker_d <= count_of_triggers_sent_out_for_bunch_marker_d + 1;
					end
				end
			end
			if (config_clear_count_of_triggers_for_bunch_markers[0]) begin
				count_of_triggers_sent_out_for_bunch_marker_a <= 0;
			end
			if (config_clear_count_of_triggers_for_bunch_markers[1]) begin
				count_of_triggers_sent_out_for_bunch_marker_b <= 0;
			end
			if (config_clear_count_of_triggers_for_bunch_markers[2]) begin
				count_of_triggers_sent_out_for_bunch_marker_c <= 0;
			end
			if (config_clear_count_of_triggers_for_bunch_markers[3]) begin
				count_of_triggers_sent_out_for_bunch_marker_d <= 0;
			end
			local_revo <= 0;
			if (remote_revo | (FTSW_CLOCKS_IN_ONE_BEAM_ORBIT_MINUS_ONE<=clock127_counter)) begin
				total_frame_counter <= total_frame_counter + 1;
				clock127_counter <= 0;
				local_revo <= 1;
				if (frame9_token == 9'b000000001) begin
					total_frame9_counter <= total_frame9_counter + 1;
					xrm_trigger_active_for_bunch_marker_a <= 0;
					xrm_trigger_active_for_bunch_marker_b <= 0;
					xrm_trigger_active_for_bunch_marker_c <= 0;
					xrm_trigger_active_for_bunch_marker_d <= 0;
					if (xrm_trigger_enabled) begin
						if (frame9_counter < frame9_prescale) begin
							frame9_counter <= frame9_counter + 1;
						end else begin
							if (desired_trigger_quantity_for_bunch_marker_a==0 || count_of_triggers_sent_out_for_bunch_marker_a<desired_trigger_quantity_for_bunch_marker_a) begin
								xrm_trigger_active_for_bunch_marker_a <= 1;
							end
							if (desired_trigger_quantity_for_bunch_marker_b==0 || count_of_triggers_sent_out_for_bunch_marker_b<desired_trigger_quantity_for_bunch_marker_b) begin
								xrm_trigger_active_for_bunch_marker_b <= 1;
							end
							if (desired_trigger_quantity_for_bunch_marker_c==0 || count_of_triggers_sent_out_for_bunch_marker_c<desired_trigger_quantity_for_bunch_marker_c) begin
								xrm_trigger_active_for_bunch_marker_c <= 1;
							end
							if (desired_trigger_quantity_for_bunch_marker_d==0 || count_of_triggers_sent_out_for_bunch_marker_d<desired_trigger_quantity_for_bunch_marker_d) begin
								xrm_trigger_active_for_bunch_marker_d <= 1;
							end
							frame9_counter <= 1;
						end
					end
					frame9_prescale <= 0;
					frame9_prescale[trig_prescale_N_log2] <= 1;
					bunch_marker_a_position <= config_bunch_marker_a_position;
					bunch_marker_b_position <= config_bunch_marker_b_position;
					bunch_marker_c_position <= config_bunch_marker_c_position;
					bunch_marker_d_position <= config_bunch_marker_d_position;
					desired_trigger_quantity_for_bunch_marker_a <= config_desired_trigger_quantity_for_bunch_marker_a;
					desired_trigger_quantity_for_bunch_marker_b <= config_desired_trigger_quantity_for_bunch_marker_b;
					desired_trigger_quantity_for_bunch_marker_c <= config_desired_trigger_quantity_for_bunch_marker_c;
					desired_trigger_quantity_for_bunch_marker_d <= config_desired_trigger_quantity_for_bunch_marker_d;
				end
				frame9_token <= { frame9_token[0], frame9_token[8:1] };
			end else begin
				clock127_counter = clock127_counter + 1'b1;
			end
		end
	end
//	wire remote_revo_raw;
//	assign remote_revo_raw = clock127 ^ remote_revo_encoded;
//	reg remote_revo_pipeline0 = 0;
//	reg remote_revo_pipeline1 = 0;
//	reg remote_revo_pipeline2 = 0;
//	always @(negedge clock127) begin
//		if (reset) begin
//			remote_revo_pipeline0 <= 0;
//		end else begin
//			remote_revo_pipeline0 <= remote_revo_raw;
//		end
//	end
//	always @(negedge clock127) begin
//		if (reset) begin
//			remote_revo_pipeline1 <= 0;
//		end else begin
//			remote_revo_pipeline1 <= remote_revo_pipeline0;
//		end
//	end
//	always @(posedge clock127) begin
//		if (reset) begin
//			remote_revo_pipeline2 <= 0;
//		end else begin
//			remote_revo_pipeline2 <= remote_revo_pipeline1;
//		end
//	end
//	always @(posedge clock127) begin
//		if (reset) begin
//			remote_revo <= 0;
//		end else begin
//			remote_revo <= remote_revo_pipeline2;
//		end
//	end
	if (0) begin
		OBUFDS rsv (.I(xrm_trigger), .O(rsv_p), .OB(rsv_n));
		OBUFDS ack (.I(frame9), .O(ack_p), .OB(ack_n));
	end else if (0) begin
//		OBUFDS rsv (.I(remote_revo_raw), .O(rsv_p), .OB(rsv_n));
		OBUFDS ack (.I(remote_revo), .O(ack_p), .OB(ack_n));
	end else if (0) begin
		OBUFDS rsv (.I(clock127), .O(rsv_p), .OB(rsv_n));
		OBUFDS ack (.I(remote_revo_encoded), .O(ack_p), .OB(ack_n));
	end
//	wire xrm_trigger_oddr;
//	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) (.C(clock127), .CE(1'b1), .D1(xrm_trigger), .D2(~xrm_trigger), .R(1'b0), .S(1'b0), .Q(xrm_trigger_oddr));
	wire frame_oddr;
	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) oddr_inst1 (.C(clock127), .CE(1'b1), .D1(frame), .D2(~frame), .R(1'b0), .S(1'b0), .Q(frame_oddr));
	wire frame9_oddr;
	//ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) (.C(clock127), .CE(1'b1), .D1(frame9), .D2(~frame9), .R(1'b0), .S(1'b0), .Q(frame9_oddr));
	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) oddr_inst2 (.C(clock127), .CE(1'b1), .D1(frame9), .D2(~frame9), .R(1'b0), .S(1'b0), .Q(frame9_oddr));
	OBUFDS rsv (.I(frame_oddr), .O(rsv_p), .OB(rsv_n));
	OBUFDS ack (.I(frame9_oddr), .O(ack_p), .OB(ack_n));
endmodule

module XRM_clock_and_revo_receiver_frame9_and_trigger_generator_tb;
	reg scrod_remote_clock127_p = 0, scrod_remote_clock127_n = 1;
	reg scrod_remote_revo_p = 0, scrod_remote_revo_n = 0;
	wire ack_p, ack_n;
	wire rsv_p, rsv_n;
	reg scrod_reset = 1;
	reg scrod_xrm_trigger_enabled = 0;
	reg [4:0] scrod_trig_prescale_N_log2 = 2;
	reg [24:0] scrod_config_bunch_marker_a_position = { 9'b111000000, 16'd4 };
	reg [24:0] scrod_config_bunch_marker_b_position = 0;
	reg [24:0] scrod_config_bunch_marker_c_position = 0;
	reg [24:0] scrod_config_bunch_marker_d_position = 0;
	reg [31:0] scrod_config_desired_trigger_quantity_for_bunch_marker_a = 6;
	reg [31:0] scrod_config_desired_trigger_quantity_for_bunch_marker_b = 6;
	reg [31:0] scrod_config_desired_trigger_quantity_for_bunch_marker_c = 6;
	reg [31:0] scrod_config_desired_trigger_quantity_for_bunch_marker_d = 6;
	reg [3:0] scrod_config_clear_count_of_triggers_for_bunch_markers = 0;
	reg scrod_allTrigs = 0;
	wire [31:0] scrod_triggerCount;
	wire [31:0] scrod_frame9Count;
	wire scrod_clockout;
	wire scrod_xrm_trigger;
	reg scrod_oserdes_bit_clock = 0;
	wire scrod_oserdes_pulsetrain;
	reg [31:0] scrod_config_oserdes_word_trig = 8'ha5;
	wire scrod_frame;
	wire scrod_frame9;
	XRM_clock_and_revo_receiver_frame9_and_trigger_generator scrod (
		.remote_clock127_p(scrod_remote_clock127_p), .remote_clock127_n(scrod_remote_clock127_n),
		.remote_revo_p(scrod_remote_revo_p), .remote_revo_n(scrod_remote_revo_n),
		.ack_p(ack_p), .ack_n(ack_n),
		.rsv_p(rsv_p), .rsv_n(rsv_n),
		.reset(scrod_reset),
		.xrm_trigger_enabled(scrod_xrm_trigger_enabled), // from config.xrm_trigger_enabled
		.trig_prescale_N_log2(scrod_trig_prescale_N_log2), // from config.trig_prescale_N_log2
		.config_bunch_marker_a_position(scrod_config_bunch_marker_a_position), // from config.bunch_marker_a
		.config_bunch_marker_b_position(scrod_config_bunch_marker_b_position), // from config.bunch_marker_b
		.config_bunch_marker_c_position(scrod_config_bunch_marker_c_position), // from config.bunch_marker_c
		.config_bunch_marker_d_position(scrod_config_bunch_marker_d_position), // from config.bunch_marker_d
		.config_desired_trigger_quantity_for_bunch_marker_a(scrod_config_desired_trigger_quantity_for_bunch_marker_a),
		.config_desired_trigger_quantity_for_bunch_marker_b(scrod_config_desired_trigger_quantity_for_bunch_marker_b),
		.config_desired_trigger_quantity_for_bunch_marker_c(scrod_config_desired_trigger_quantity_for_bunch_marker_c),
		.config_desired_trigger_quantity_for_bunch_marker_d(scrod_config_desired_trigger_quantity_for_bunch_marker_d),
		.config_clear_count_of_triggers_for_bunch_markers(scrod_config_clear_count_of_triggers_for_bunch_markers),
		.allTrigs(scrod_allTrigs),
		.triggerCount(scrod_triggerCount),
		.frame9Count(scrod_frame9Count),
		.clockout(scrod_clockout),
		.xrm_trigger(scrod_xrm_trigger),
		.oserdes_bit_clock(scrod_oserdes_bit_clock),
		.oserdes_pulsetrain(scrod_oserdes_pulsetrain),
		.config_oserdes_word_trig(scrod_config_oserdes_word_trig),
		.frame(scrod_frame),
		.frame9(scrod_frame9)
	);
	initial begin
		scrod_remote_clock127_p <= 0; scrod_remote_clock127_n <= 1;
		scrod_remote_revo_p <= 0; scrod_remote_revo_n <= 1;
		scrod_reset <= 1;
		#100;
		scrod_reset <= 0;
		#500;
		scrod_xrm_trigger_enabled <= 1;
		//scrod_bunch_marker_a_position[12:2] <= 0; scrod_bunch_marker_a_position[24:16] <= 9'b111111111;
		//scrod_bunch_marker_b_position[12:2] <= 2; scrod_bunch_marker_b_position[24:16] <= 9'b000000001;
		//scrod_bunch_marker_c_position[12:2] <= 3; scrod_bunch_marker_c_position[24:16] <= 9'b100000000;
		//scrod_bunch_marker_d_position[12:2] <= 4; scrod_bunch_marker_d_position[24:16] <= 9'b000111000;
		//scrod_trig_prescale_N_log2 <= 2;
	end
	always begin
		#1;
		scrod_oserdes_bit_clock <= ~scrod_oserdes_bit_clock;
	end
	always begin
		#4;
		scrod_remote_clock127_p <= ~scrod_remote_clock127_p; scrod_remote_clock127_n <= ~scrod_remote_clock127_n;
	end
	//always begin
	//	#4;
	//	scrod_remote_revo_p <= ~scrod_remote_revo_p; scrod_remote_revo_n <= ~scrod_remote_revo_n;
	//end
endmodule

