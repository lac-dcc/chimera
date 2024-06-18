// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-07-26 by mza
// based on mza-test006.7-segment-driver.v
// updated 2020-06-01 by mza
// last updated 2021-02-04 by mza

`define icestick
`include "lib/segmented_display_driver.v"

module top(
	input CLK,
	output reg LED1 = 0,
	output reg LED2 = 0,
	output reg LED3 = 0,
	output reg LED4 = 0,
	output reg LED5 = 0,
	output J1_3, J1_4, J1_5, J1_6, J1_7, J1_8, J1_9, J1_10,
	output J2_1, J2_2, J2_3, J2_4, J2_7, J2_8, J2_9, J2_10,
	output J3_3, J3_4, J3_5, J3_6, J3_7, J3_8, J3_9, J3_10
);
	wire [6:0] segment;
	assign J1_4  = segment[0];
	assign J3_8  = segment[1];
	assign J3_5  = segment[2];
	assign J3_3  = segment[3];
	assign J2_1  = segment[4];
	assign J1_5  = segment[5];
	assign J3_6  = segment[6];
	assign J3_4 = 1; // dp/colon
	wire [3:0] anode;
	assign J3_7 = anode[0]; // connected via resistor to anode0001 for least significant digit
	assign J1_7 = anode[1]; // connected via resistor to anode0010
	assign J1_6 = anode[2]; // connected via resistor to anode0100
	assign J1_3 = anode[3]; // connected via resistor to anode1000 for most significant digit

	reg [40:0] raw_counter = 0;
	reg [40:0] alternate_counter = 0;
	//wire clock_1Hz;
//	wire [15:0] counter_1000Hz;
//	wire [15:0] counter_100Hz;
	wire [15:0] counter_10Hz;
//	wire [15:0] counter_1Hz;
	wire [15:0] data;
	reg [2:0] clock_token = 0;
	always @(posedge CLK) begin
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
//		counter_1Hz <= raw_counter[39:24]; // really about 1.34 Hz
//		counter_10Hz <= raw_counter[35:20]; // really about 11.444 Hz
//		counter_1000Hz <= alternate_counter[26:12]; // really about 1.024 kHz
	assign counter_10Hz = alternate_counter[34:19]; // really about 7.629 Hz
//		counter_1Hz <= alternate_counter[37:22]; // really about 1.048576 Hz
	assign data = counter_10Hz;
	segmented_display_driver #(.NUMBER_OF_SEGMENTS(7), .NUMBER_OF_NYBBLES(4)) my_instance_name (.clock(CLK), .data(data), .dp(4'h0), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode());
endmodule // top

