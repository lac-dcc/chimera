// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-09-27 by mza
// based on mza-test014.duration-timer.uart.v
// updated for icestick-frequency-counter revB
// updated 2020-06-02 by mza
// last updated 2021-02-07 by mza

`define icestick
`include "lib/hex2bcd.v"
`include "lib/segmented_display_driver.v"
`include "lib/frequency_counter.v"
//`include "lib/uart.v"
//`include "lib/fifo.v"

module mytop (
	input clock,
	output [5:1] LED,
	inout [7:0] J1,
	inout [7:0] J2,
	inout [7:0] J3,
	input RX,
	output TX
);
	reg [31:0] counter = 0;
	wire [31:0] result;
	reg [31:0] result2 = 32'h87654321;
//	reg [23:0] value1;
	reg [23:0] value2 = 24'd12345678;
//	reg [31:0] bcd1;
	wire [31:0] bcd2;
//	reg [31:0] buffered_bcd1;
	reg [31:0] buffered_bcd2 = 32'h88888888;
	wire external_reference_clock;
	wire raw_external_clock_to_measure;
	wire mirror_of_raw_external_clock_to_measure;
	reg external_clock_to_measure = 0;
	wire reference_clock;
	wire signal_output;
//	assign signal_output = trigger_active;
	assign signal_output = clock;
	assign J2[1] = signal_output; // 1,2 pair (ACK)
	assign J2[2] = signal_output; // 5,4 pair (RSV)
	//assign external_reference_clock = J2[0]; // 3,6 pair (TRG)
	assign external_reference_clock = J1[6]; // clipped sine wave oscillator
	//assign raw_external_clock_to_measure = counter[4]; // something internal (in this case, 12 MHz / (i+1))
//	assign raw_external_clock_to_measure = clock; // something internal (in this case, 12 MHz)
	assign raw_external_clock_to_measure = J1[7]; // trigger_in LEMO
//	assign raw_external_clock_to_measure = J2[3]; // 7,8 pair (CLK)
//	assign reference_clock = external_clock_to_measure; // 127216025 / N (or an unknown frequency)
	assign reference_clock = external_reference_clock; // 100000280 / N
	assign J1[0] = signal_output; // trigger_out on PCB
//	assign J3[0] = mirror_of_raw_external_clock_to_measure;
//	assign J3[0] = clock;
	assign J3[0] = J1[7];
	localparam N = 1; // N for N_Hz calculations
	wire frequency_counter_sync;
	frequency_counter #(.FREQUENCY_OF_REFERENCE_CLOCK(25000000), .LOG2_OF_DIVIDE_RATIO(25), .N(N)) fc (.reference_clock(reference_clock), .unknown_clock(raw_external_clock_to_measure), .frequency_of_unknown_clock(result), .valid(frequency_counter_sync));
	// for a pair of 4-digit 7-segment(+dp) TCMG1050M displays on a "icestick frequency counter revA" board
	wire [7:0] segment;
	assign { J1[4], J1[1], J3[4], J3[5], J1[2], J1[5], J1[3], J3[2] } = segment; // segments g,f,e,d,c,b,a,dp
	wire [7:0] anode;
	assign { J2[7], J2[4], J2[5], J2[6], J3[6], J3[7], J3[3], J3[1] } = anode; // anodes 7,6,5,4,3,2,1,0
	wire [7:0] dp = (N==1) ? 8'b01000000 : (N==10) ? 8'b00100000 : 8'b00010000;
//	reg [7:0] dp = 8'b00000001;
//	wire [7:0] dp = 8'b01000000;
//	always @(*) begin
//		case (N)
//			      1: dp = 8'b01000000;
//			     10: dp = 8'b00100000;
//			    100: dp = 8'b00010000;
//			default: dp = 8'b00001000;
//		endcase
//	end
	wire segmented_display_driver_sync;
	segmented_display_driver #(.NUMBER_OF_SEGMENTS(8), .NUMBER_OF_NYBBLES(8)) my_segmented_display_driver (.clock(clock), .data(buffered_bcd2), .dp(dp), .cathode(segment), .anode(anode), .sync_anode(segmented_display_driver_sync), .sync_cathode());
	wire hex2bcd_sync;
	assign LED[5] = 0;
	assign LED[4] = signal_output;
	assign LED[3] = segmented_display_driver_sync;
	assign LED[2] = hex2bcd_sync;
	assign LED[1] = frequency_counter_sync;
//	localparam length_of_line = 6+6+2;
//	reg [7:0] uart_character_counter;
//	reg uart_transfers_are_allowed;
//	localparam uart_character_pickoff = 11; // this is already close to the limit for 115200
	localparam uart_line_pickoff = 22;
	localparam slow_clock_pickoff = 19; // 12 MHz / 2^n
//	reg [15:0] uart_line_counter;
	reg reset = 1;
	wire uart_resetb;
	assign uart_resetb = ~reset;
//	reg [msb_of_counters:0] previous_number_of_pulses = 0;
//	reg [msb_of_counters:0] number_of_pulses = 0;
	always @(posedge clock) begin
		counter <= counter + 1'b1;
		if (reset) begin
//			uart_line_counter <= 0;
//			uart_character_counter <= length_of_line - 1;
//			uart_transfers_are_allowed <= 0;
			if (counter[10]) begin
				reset <= 0;
			end
			value2 <= 24'd12345678;
			result2 <= 32'h87654321;
			buffered_bcd2 <= 32'h88888888;
		end
		if (counter[slow_clock_pickoff:0]==0) begin
			buffered_bcd2 <= bcd2;
			//buffered_bcd2 <= 32'h01234567;
			//dp <= { dp[6:0], dp[7] };
		end else if (counter[slow_clock_pickoff:0]==1) begin
			value2 <= result2[23:0]; // frequency counter mode
			//value2 <= 24'd13578642;
		end else if (counter[slow_clock_pickoff:0]==2) begin
			result2 <= result;
		end
//		if (counter[uart_line_pickoff:0]==0) begin // less frequent
//			if (previous_number_of_pulses!=number_of_pulses) begin
//				uart_transfers_are_allowed <= 1;
//				uart_line_counter++;
//				previous_number_of_pulses <= number_of_pulses;
//			end
//		end
//		if (counter[uart_character_pickoff:0]==1) begin // more frequent
//			if (uart_transfers_are_allowed==1) begin
//				if (uart_character_counter<=length_of_line) begin
//					start_uart_transfer <= 1;
//					uart_character_counter++;
//				end else begin
//					uart_transfers_are_allowed <= 0;
//					uart_character_counter = 0;
//				end
//			end
//		end else begin
//			start_uart_transfer <= 0;
//		end
//		if (uart_character_counter==length_of_line) begin
//			byte_to_send <= 8'h0d; // cr
//		end else if (uart_character_counter==length_of_line+1) begin
//			byte_to_send <= 8'h0a; // nl
//		end else if (uart_character_counter==1) begin
//			byte_to_send <= { 4'h3, buffered_bcd1[23:20] };
//		end else if (uart_character_counter==2) begin
//			byte_to_send <= { 4'h3, buffered_bcd1[19:16] };
//		end else if (uart_character_counter==3) begin
//			byte_to_send <= { 4'h3, buffered_bcd1[15:12] };
//		end else if (uart_character_counter==4) begin
//			byte_to_send <= { 4'h3, buffered_bcd1[11:08] };
//		end else if (uart_character_counter==5) begin
//			byte_to_send <= { 4'h3, buffered_bcd1[07:04] };
//		end else if (uart_character_counter==6) begin
//			byte_to_send <= { 4'h3, buffered_bcd1[03:00] };
//		end else if (uart_character_counter==7) begin
//			byte_to_send <= 8'h20;
//		end else if (uart_character_counter==8) begin
//			byte_to_send <= { 4'h3, buffered_bcd2[23:20] };
//		end else if (uart_character_counter==9) begin
//			byte_to_send <= { 4'h3, buffered_bcd2[19:16] };
//		end else if (uart_character_counter==10) begin
//			byte_to_send <= { 4'h3, buffered_bcd2[15:12] };
//		end else if (uart_character_counter==11) begin
//			byte_to_send <= { 4'h3, buffered_bcd2[11:08] };
//		end else if (uart_character_counter==12) begin
//			byte_to_send <= { 4'h3, buffered_bcd2[07:04] };
//		end else if (uart_character_counter==13) begin
//			byte_to_send <= { 4'h3, buffered_bcd2[03:00] };
//		end else begin
//			byte_to_send <= 8'h20;
//		end
	end
//	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(6)) h2binst1 ( .clock(clock), .reset(~uart_resetb), .hex_in(value1), .bcd_out(bcd1), .sync() );
	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(6)) h2binst2 ( .clock(clock), .reset(~uart_resetb), .hex_in(value2), .bcd_out(bcd2), .sync(hex2bcd_sync) );
//	assign bcd2 = { 0, value2 };
//	reg uart_busy;
//	reg start_uart_transfer;
//	reg [7:0] byte_to_send;
//	syn_fifo myfifo (.clk(clock), .rst(reset), .empty(), .full(),
//		.wr_cs(), .wr_en(), .data_in(),
//		.rd_cs(), .rd_en(), .data_out()
//	);
//	reg [7:0] byte_we_are_sending;
//	assign byte_we_are_sending = byte_to_send;
//	wire uart_character_clock;
//	assign uart_character_clock = counter[uart_character_pickoff];
//	uart my_uart_instance (.clk(clock), .resetq(uart_resetb), .uart_busy(uart_busy), .uart_tx(TX), .uart_wr_i(start_uart_transfer), .uart_dat_i(byte_we_are_sending));
	assign TX = 0;
endmodule // mytop

module top (
	input CLK,
	output LED1, LED2, LED3, LED4, LED5,
	output J1_3, J1_4, J1_5, J1_6, J1_7, J1_8,
	output       J2_2, J2_3,       J2_7, J2_8, J2_9, J2_10,
	output J3_3, J3_4, J3_5, J3_6, J3_7, J3_8, J3_9, J3_10,
	input J2_4, J2_1, J1_9, J1_10,
	output DCDn, DSRn, CTSn, TX, IR_TX, IR_SD,
	input DTRn, RTSn, RX, IR_RX
);
	wire [7:0] J1 = { J1_10, J1_9, J1_8, J1_7, J1_6, J1_5, J1_4, J1_3 };
	wire [7:0] J2 = { J2_10, J2_9, J2_8, J2_7, J2_4, J2_3, J2_2, J2_1 };
	wire [7:0] J3 = { J3_10, J3_9, J3_8, J3_7, J3_6, J3_5, J3_4, J3_3 };
	wire [5:1] LED = { LED5, LED4, LED3, LED2, LED1 };
	assign { DCDn, DSRn, CTSn } = 1;
	assign { IR_TX, IR_SD } = 0;
	mytop mytop_instance (.clock(CLK), .LED(LED), .J1(J1), .J2(J2), .J3(J3), .TX(TX), .RX(RX));
endmodule

