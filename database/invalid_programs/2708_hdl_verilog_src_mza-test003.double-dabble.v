// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-06-29 by mza
// updated 2020-06-01 by mza
// last updated 2021-02-04 by mza

`define icestick
`include "lib/hex2bcd.v"
`include "lib/segmented_display_driver.v"

module top (
	input CLK,
	output LED1, LED2, LED3, LED4, LED5,
	output J1_3, J1_4, J1_5, J1_6, J1_7, J1_8, J1_9, J1_10,
	output J2_1, J2_2, J2_3, J2_4, J2_7, J2_8, J2_9, J2_10,
	output J3_3, J3_4, J3_5, J3_6, J3_7, J3_8, J3_9, J3_10
);
	reg [39:0] counter = 0;
	reg reset = 1;
	always @(posedge CLK) begin
		if (reset) begin
			if (counter[10]) begin
				reset <= 0;
			end
		end
		counter <= counter + 1'b1;
	end
	wire [23:0] bcd;
	wire [15:0] data = counter[39:24];
	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(4)) h2binst ( .clock(CLK), .reset(reset), .hex_in(data), .bcd_out(bcd), .sync() );
	if (1) begin
		assign LED5 = bcd[4];
		assign LED4 = bcd[3];
		assign LED3 = bcd[2];
		assign LED2 = bcd[1];
		assign LED1 = bcd[0];
	end else begin
		assign LED5 = 0;
		assign LED4 = bcd[7];
		assign LED3 = bcd[6];
		assign LED2 = bcd[5];
		assign LED1 = bcd[4];
	end
	if (1) begin
		// for an HDSP-B04E mounted pin7=pin14 justified on an icestick-test revA ZIF-socket board (IDL_18_027)
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
		segmented_display_driver #(.NUMBER_OF_SEGMENTS(7), .NUMBER_OF_NYBBLES(4)) my_instance_name (.clock(CLK), .data(bcd[15:0]), .dp(4'd0), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode());
	end else begin
		// for an LTP587HR mounted pin16=pin14 justified on an icestick-test revA ZIF-socket board (IDL_18_027)
		wire [15:0] segment;
		assign J2_7  = segment[00];
		assign J2_2  = segment[01];
		assign J2_4  = segment[02];
		assign J1_5  = segment[03];
		assign J3_8  = segment[04];
		assign J3_7  = segment[05];
		assign J3_5  = segment[06];
		assign J3_4  = segment[07];
		assign J3_3  = segment[08];
		assign J2_1  = segment[09];
		assign J2_10 = segment[10];
		assign J1_4  = segment[11];
		assign J1_3  = segment[12];
		assign J3_6  = segment[13];
		assign J1_7  = segment[14];
		assign J1_6  = segment[15];
		assign J1_8  = 1; // dp/colon
		wire [1:0] anode;
		assign J2_9  = anode[0]; // res+pot connected to anode
		assign J1_9  = anode[0]; // res+pot connected to anode
		segmented_display_driver #(.NUMBER_OF_SEGMENTS(16), .NUMBER_OF_NYBBLES(2)) my_instance_name (.clock(CLK), .data(bcd[7:0]), .dp(2'd0), .cathode(segment), .anode(anode), .sync_anode(), .sync_cathode());
	end
endmodule // top

