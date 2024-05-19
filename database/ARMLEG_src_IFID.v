// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module IFID
(
	input CLOCK,
	input IFID_Write,
	input [63:0] programCounter_in,
	input [31:0] CPUInstruction_in,
	output reg [63:0] programCounter_out,
	output reg [31:0] CPUInstruction_out
);

	always @(posedge CLOCK) begin
		if(IFID_Write) begin
			programCounter_out <= programCounter_in;
			CPUInstruction_out <= CPUInstruction_in;
		end
	end
endmodule