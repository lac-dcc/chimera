`timescale 1ns / 1ps

module RegisterFile (

		input clock,
		input reset,

		input [4:0] readAddressA,
		output [31:0] readDataA,
		input [4:0] readAddressB,
		output [31:0] readDataB,

		input shouldWrite,
		input [4:0] writeAddress,
		input [31:0] writeData,

		output [32 * 32 - 1 : 0] debug_registers
	);

	reg [31:0] registers [1:31];
	integer i;
	initial begin
		for (i = 1; i < 32; i = i + 1) begin
			registers[i] = 0;
		end
	end

	assign readDataA = readAddressA == 0 ? 32'b0 : registers[readAddressA];
	assign readDataB = readAddressB == 0 ? 32'b0 : registers[readAddressB];

	integer j;
	always @(negedge clock) begin
		if (reset) begin
			for (j = 1; j < 32; j = j + 1) begin
				registers[j] <= 0;
			end
		end else if (shouldWrite && writeAddress != 0) begin
			registers[writeAddress] <= writeData;
		end
	end

	assign debug_registers = {registers[31], registers[30], registers[29],
			registers[28], registers[27], registers[26], registers[25],
			registers[24], registers[23], registers[22], registers[21],
			registers[20], registers[19], registers[18], registers[17],
			registers[16], registers[15], registers[14], registers[13],
			registers[12], registers[11], registers[10], registers[9],
			registers[8], registers[7], registers[6], registers[5],
			registers[4], registers[3], registers[2], registers[1], 32'b0};
endmodule
