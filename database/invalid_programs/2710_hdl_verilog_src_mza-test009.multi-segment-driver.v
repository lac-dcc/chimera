// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-07-31 by mza
// based on mza-test007.7-segment-driver.v and mza-test003.double-dabble.v
// updated 2020-06-01 by mza
// last updated 2021-02-05 by mza

`define icestick
`include "lib/hex2bcd.v"
`include "lib/segmented_display_driver.v"

module mytop (
	input clock,
	output [5:1] LED,
	inout [7:0] J1,
	inout [7:0] J2,
	inout [7:0] J3
);
	wire reset = 0;
	wire [35:0] bcd;
	wire [23:0] data = 24'd00112233;
	if (1) begin
		// for an HDSP-B04E mounted pin7=pin14 justified on an icestick-test revA ZIF-socket board (IDL_18_027)
		//wire [6:0] segment;
		//assign { J3[3], J1[2], J2[0], J3[0], J3[2], J3[5], J1[1] } = segment;
		wire [7:0] segment;
		assign { J3[3], J1[2], J2[0], J3[0], J3[2], J3[5], J1[1], J1[7] } = segment; // the J1[7] is just a dummy extra segment
		assign J3[1] = 1; // dp/colon
		wire [3:0] anode;
		assign J3[4] = anode[0]; // connected via resistor to anode0001 for least significant digit
		assign J1[4] = anode[1]; // connected via resistor to anode0010
		assign J1[3] = anode[2]; // connected via resistor to anode0100
		assign J1[0] = anode[3]; // connected via resistor to anode1000 for most significant digit
		//segmented_display_driver #(.NUMBER_OF_SEGMENTS(7), .NUMBER_OF_NYBBLES(4)) my_instance_name (.clock(clock), .data(bcd[15:0]), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode(), dp(0));
		segmented_display_driver #(.NUMBER_OF_SEGMENTS(8), .NUMBER_OF_NYBBLES(4)) my_instance_name (.clock(clock), .data(bcd[15:0]), .dp(4'h0), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode());
		hex2bcd #(.INPUT_SIZE_IN_NYBBLES(4)) h2binst ( .clock(clock), .reset(reset), .hex_in(data[15:0]), .bcd_out(bcd[23:0]), .sync() );
		assign J3[7] = 0;
		assign J3[6] = 0;
		assign J2[7] = 0;
		assign J2[6] = 0;
		assign J2[5] = 0;
		assign J2[4] = 0;
		assign J2[3] = 0;
		assign J2[2] = 0;
		assign J2[1] = 0;
		assign J1[6] = 0;
		assign J1[5] = 0;
	end else if (0) begin
		// for an LTP587HR mounted pin16=pin14 justified on an icestick-test revA ZIF-socket board (IDL_18_027)
		wire [15:0] segment;
		assign { J1[3], J1[4], J1[4], J3[3], J1[0], J1[1], J2[7], J2[0], J3[0], J3[1], J3[2], J3[2], J3[4], J3[5], J1[2], J2[3], J2[1], J2[4] } = segment;
		assign J1[5]  = 1; // dp/colon
		assign J2[6]  = anode[0]; // res+pot connected to anode
		assign J1[6]  = anode[0]; // res+pot connected to anode
		wire [1:0] anode;
		segmented_display_driver #(.number_of_segments(16), .number_of_nybbles(2)) my_instance_name (.clock(clock), .data(bcd[7:0]), .dp(2'h0), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode());
		hex2bcd #(.input_size_in_nybbles(4)) h2binst ( .clock(clock), .reset(reset), .hex_in(data), .bcd_out(bcd), .sync() );
	end else begin
		// for a pair of 4-digit 7-segment(+dp) TCMG1050M displays on a "icestick frequency counter revA" board
		//wire [6:0] segment;
		//assign { J1[4], J1[1], J3[4], J3[5], J1[2], J1[5], J1[3] } = segment; // segments g,f,e,d,c,b,a ; dp=J3[2]
		//assign J3[2] = 1;
		wire [7:0] segment;
		assign { J1[4], J1[1], J3[4], J3[5], J1[2], J1[5], J1[3], J3[2] } = segment; // segments g,f,e,d,c,b,a,dp
		wire [7:0] anode;
		assign { J2[7], J2[4], J2[5], J2[6], J3[6], J3[7], J3[3], J3[1] } = anode; // anodes 7,6,5,4,3,2,1,0
		//segmented_display_driver #(.number_of_segments(7), .number_of_nybbles(8)) my_segmented_display_driver (.clock(clock), .data(bcd[31:0]), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode(signal_output), .dp(0));
		segmented_display_driver #(.number_of_segments(8), .number_of_nybbles(8)) my_segmented_display_driver (.clock(clock), .data(bcd[31:0]), .dp(8'b00010000), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode(signal_output));
//		assign J3[0] = 0; // an input, so be careful here
//		assign J2[3] = 0; // an input, so be careful here
		assign J2[2] = 0;
		assign J2[1] = 0;
//		assign J2[0] = 0; // an input, so be careful here
		assign J1[7] = 0;
		assign J1[6] = 0;
		hex2bcd #(.input_size_in_nybbles(6)) h2binst ( .clock(clock), .reset(reset), .hex_in(data), .bcd_out(bcd), .sync() );
		wire signal_output;
		assign J1[0] = signal_output; // trigger_out on PCB
	end
	assign LED = 0;
	reg [40:0] raw_counter = 0;
	reg [40:0] alternate_counter = 0;
	//wire clock_1Hz;
	wire [15:0] counter_1000Hz = alternate_counter[26:12]; // really about 1.024 kHz
	//wire [15:0] counter_100Hz;
	wire [15:0] counter_10Hz = alternate_counter[34:19]; // really about 7.629 Hz
	wire [15:0] counter_1Hz = alternate_counter[37:22]; // really about 1.048576 Hz
	reg [2:0] clock_token = 0;
	always @(posedge clock) begin
		if (raw_counter[40:10]==0) begin
			clock_token <= 3'b001;
		end else begin
			clock_token <= { clock_token[1:0], clock_token[2] }; // barrel shifter
		end
		if (clock_token == 3'b001) begin
			alternate_counter++;
		end
		raw_counter++;
	end
//	always @(posedge clock) begin
	//always begin
//		counter_1Hz <= raw_counter[39:24]; // really about 1.34 Hz
//		counter_10Hz <= raw_counter[35:20]; // really about 11.444 Hz
//		counter_1000Hz <= alternate_counter[26:12]; // really about 1.024 kHz
//	counter_10Hz = alternate_counter[34:19]; // really about 7.629 Hz
//		counter_1Hz <= alternate_counter[37:22]; // really about 1.048576 Hz
		//data <= counter_10Hz;
//		data <= 24'd00112233;
//	end
endmodule // top

module top (
	input CLK,
	output LED1, LED2, LED3, LED4, LED5,
	output J1_3, J1_4, J1_5, J1_6, J1_7, J1_8, J1_9, J1_10,
	output J2_1, J2_2, J2_3, J2_4, J2_7, J2_8, J2_9, J2_10,
	output J3_3, J3_4, J3_5, J3_6, J3_7, J3_8, J3_9, J3_10,
	output DCDn, DSRn, CTSn, TX, IR_TX, IR_SD,
	input DTRn, RTSn, RX, IR_RX
);
	wire [7:0] J1 = { J1_10, J1_9, J1_8, J1_7, J1_6, J1_5, J1_4, J1_3 };
	wire [7:0] J2 = { J2_10, J2_9, J2_8, J2_7, J2_4, J2_3, J2_2, J2_1 };
	wire [7:0] J3 = { J3_10, J3_9, J3_8, J3_7, J3_6, J3_5, J3_4, J3_3 };
	wire [5:1] LED = { LED5, LED4, LED3, LED2, LED1 };
	assign { DCDn, DSRn, CTSn } = 1;
	assign { IR_TX, IR_SD } = 0;
	assign TX = 0;
	mytop mytop_instance (.clock(CLK), .LED(LED), .J1(J1), .J2(J2), .J3(J3));
endmodule // icestick

