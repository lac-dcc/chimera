// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-09-17 by mza
// last updated 2020-05-29 by mza

`define SCROD_revA3

module mza_test018_clock_in_to_toggle_out (
	input clock_p,
	input clock_n,
	output ttl_trig_output,
	output led0,
	output led1,
	output led2
	//output lvds_trig_output_p,
	//output lvds_trig_output_n
);
	reg trigout = 0;
	assign ttl_trig_output = trigout;
	wire clock;
	reg [31:0] counter = 0;
	assign led0 = counter[28];
	assign led1 = reset;
	assign led2 = ~reset;
	reg reset = 1;
	IBUFGDS clockbuf (.I(clock_p), .IB(clock_n), .O(clock)); // 250 MHz
	always @(posedge clock) begin
		if (reset) begin
			if (counter[10]) begin
				reset <= 0;
			end
		end
		trigout <= ~trigout;
		counter <= counter + 1'b1;
	end
endmodule
