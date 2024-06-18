// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-09-22 by mza
// updated 2019-09-22 by mza
// last updated 2021-02-03 by mza

module clocked_1ns_delay #(
	parameter WIDTH = 1
) (
	input [WIDTH-1:0] in,
	output reg [WIDTH-1:0] out
);
	reg clock = 0;
	always @(posedge clock) begin
		out <= in;
	end
	initial begin
		clock <= 0;
	end
	always begin
		#0.5;
		clock <= ~clock;
	end
endmodule

module clocked_2ns_delay #(
	parameter WIDTH = 1
) (
	input [WIDTH-1:0] in,
	output reg [WIDTH-1:0] out
);
	reg clock = 0;
	always @(posedge clock) begin
		out <= in;
	end
	initial begin
		clock <= 0;
	end
	always begin
		#1;
		clock <= ~clock;
	end
endmodule

//module cable_1ns_delay #(
//	WIDTH = 1
//) (
//	input [WIDTH-1:0] in,
//	output reg [WIDTH-1:0] out
//);
//	always begin
//		out <= #1 in;
//	end
//endmodule

//module cable_delay #(
//	parameter DELAY_NS = 1.0,
//	WIDTH = 1
//) (
//	input [WIDTH-1:0] in,
//	output reg [WIDTH-1:0] out
//);
//	always begin
//		out <= #(DELAY_NS) in;
//	end
//endmodule

