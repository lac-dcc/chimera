// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module DataMemory
(
	input CLOCK,
	input [63:0] inputAddress,
	input [63:0] inputData,
	input memRead,
	input memWrite,
	output reg [63:0] outputData
);

	reg [63:0] memoryData[127:0];
	initial begin
		memoryData[0]  = 64'd0;
		memoryData[8]  = 64'd1;
		memoryData[16] = 64'd2;
		memoryData[24] = 64'd3;
		memoryData[32] = 64'd4;
		memoryData[40] = 64'd5;
		memoryData[48] = 64'd6;
		memoryData[56] = 64'd7;
		memoryData[64] = 64'd8;
		memoryData[72] = 64'd9;
		memoryData[80] = 64'd10;
		memoryData[88] = 64'd11;
		memoryData[96] = 64'd12;
	end

	always @(posedge CLOCK) begin
		if (memWrite == 1) begin
			memoryData[inputAddress] <= inputData;
		end
	end

	always @(negedge CLOCK) begin
		if (memRead == 1) begin
			outputData <= memoryData[inputAddress];
		end
	end
endmodule