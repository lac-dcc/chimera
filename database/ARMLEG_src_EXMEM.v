// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module EXMEM
(
	input CLOCK,
	input isBranch_in, // M Stage
	input memRead_in, // M Stage
	input memWrite_in, // M Stage
	input regWrite_in, // WB Stage
	input memToReg_in, // WB Stage
	input [63:0] shiftedProgramCounter_in,
	input ALUzero_in,
	input [63:0] ALUresult_in,
	input [63:0] writeDataMem_in,
	input [4:0] writeReg_in,

	output reg isBranch_out, // M Stage
	output reg memRead_out, // M Stage
	output reg memWrite_out, // M Stage
	output reg regWrite_out, // WB Stage
	output reg memToReg_out, // WB Stage
	output reg [63:0] shiftedProgramCounter_out,
	output reg ALUzero_out,
	output reg [63:0] ALUresult_out,
	output reg [63:0] writeDataMem_out,
	output reg [4:0] writeReg_out
);

	always @(posedge CLOCK) begin
		/* Values for M */
		isBranch_out <= isBranch_in;

		memRead_out <= memRead_in;
		memWrite_out <= memWrite_in;

		/* Values for WB */
		regWrite_out <= regWrite_in;
		memToReg_out <= memToReg_in;

		/* Values for all Stages */
		shiftedProgramCounter_out <= shiftedProgramCounter_in;
		ALUzero_out <= ALUzero_in;
		ALUresult_out <= ALUresult_in;
		writeDataMem_out <= writeDataMem_in;
		writeReg_out <= writeReg_in;
	end
endmodule