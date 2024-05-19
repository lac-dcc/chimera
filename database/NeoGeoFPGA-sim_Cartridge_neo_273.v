// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module neo_273(
	input [19:0] PBUS,
	input PCK1B,
	input PCK2B,
	output reg [19:0] C_LATCH,
	output reg [15:0] S_LATCH
);
	
	always @(posedge PCK1B)
	begin
		C_LATCH <= {PBUS[15:0], PBUS[19:16]};
	end
	
	always @(posedge PCK2B)
	begin
		S_LATCH <= {PBUS[11:0], PBUS[15:12]};
	end

endmodule
