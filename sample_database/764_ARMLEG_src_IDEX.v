// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module IDEX
(
	input CLOCK,
	input [1:0] ALUop_in, // EX Stage
	input ALUsrc_in, // EX Stage
	input isBranch_in, // M Stage
	input memRead_in, // M Stage
	input memWrite_in, // M Stage
	input regWrite_in, // WB Stage
	input memToReg_in, // WB Stage
	input [63:0] programCounter_in,
	input [63:0] regData1_in,
	input [63:0] regData2_in,
	input [63:0] signExtend_in,
	input [10:0] ALUcontrol_in,
	input [4:0] registerRm_in,
	input [4:0] registerRn_in,
	input [4:0] writeReg_in,
	output reg [1:0] ALUop_out, // EX Stage
	output reg ALUsrc_out, // EX Stage
	output reg isBranch_out, // M Stage
	output reg memRead_out, // M Stage
	output reg memWrite_out, // M Stage
	output reg regWrite_out, // WB Stage
	output reg memToReg_out, // WB Stage
	output reg [63:0] programCounter_out,
	output reg [63:0] regData1_out,
	output reg [63:0] regData2_out,
	output reg [63:0] signExtend_out,
	output reg [10:0] ALUcontrol_out,
	output reg [4:0] registerRm_out,
	output reg [4:0] registerRn_out,
	output reg [4:0] writeReg_out
);

	always @(posedge CLOCK) begin
		/* Values for EX */
		ALUop_out <= ALUop_in;
		ALUsrc_out <= ALUsrc_in;

		/* Values for M */
		isBranch_out <= isBranch_in;
		memRead_out <= memRead_in;
		memWrite_out <= memWrite_in;

		/* Values for WB */
		regWrite_out <= regWrite_in;
		memToReg_out <= memToReg_in;

		/* Values for all Stages */
		programCounter_out <= programCounter_in;
		regData1_out <= regData1_in;
		regData2_out <= regData2_in;

		/* Values for variable stages */
		signExtend_out <= signExtend_in;
		ALUcontrol_out <= ALUcontrol_in;
		writeReg_out <= writeReg_in;
		registerRm_out <= registerRm_in;
	    registerRn_out <= registerRn_in;
	end
endmodule