// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module MEMWB
(
	input CLOCK,
	input [63:0] memAddress_in,
	input [63:0] memData_in,
	input [4:0] writeReg_in,
	input regWrite_in,
	input memToReg_in,
	output reg [63:0] memAddress_out,
	output reg [63:0] memData_out,
	output reg [4:0] writeReg_out,
	output reg regWrite_out,
	output reg memToReg_out
);

	always @(posedge CLOCK) begin
		regWrite_out <= regWrite_in;
		memToReg_out <= memToReg_in;
		memAddress_out <= memAddress_in;
		memData_out <= memData_in;
		writeReg_out <= writeReg_in;
	end
endmodule