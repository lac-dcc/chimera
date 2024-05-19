// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module ProgramCounter
(
	input CLOCK,
	input RESET,
	input PCWire,
	input [63:0] programCounter_in,
	output reg [63:0] programCounter_out
);

	always @(posedge CLOCK) begin
		if(PCWire) begin
			if (programCounter_in === 64'bx) begin
				programCounter_out  <= 0;
			end	else begin
				programCounter_out <= programCounter_in;
			end
		end
	end

	always @(RESET) begin
		programCounter_out = 0;
	end
endmodule
