// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module HazardDetectionUnit
(
	input IDEX_MemRead,
	input EXMEM_RegWrite,
	input [4:0] IDEX_RegisterRd,
	input [4:0] IFID_RegisterRm,
	input [4:0] IFID_RegisterRn,
	output reg IFID_Write,
	output reg PCWire,
	output reg ControlWire
);
	initial begin
		IFID_Write = 1'b1;
		PCWire = 1'b1;
		ControlWire = 1'b1;
	end

	always @(*) begin
		if (((EXMEM_RegWrite==1'b0) || IDEX_MemRead) && ((IDEX_RegisterRd == IFID_RegisterRn) || (IDEX_RegisterRd == IFID_RegisterRm))) begin
			IFID_Write = 1'b0;
			PCWire = 1'b0;
			ControlWire = 1'b0;
		end else begin
			IFID_Write = 1'b1;
			PCWire = 1'b1;
			ControlWire = 1'b1;
		end
	end
endmodule
