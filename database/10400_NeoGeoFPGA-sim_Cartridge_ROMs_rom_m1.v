// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// 100ns 128k*8bit ROM

module rom_m1(
	input [16:0] ADDR,
	output [7:0] OUT,
	input nCE,
	input nOE
);

	reg [7:0] ROMDATA[0:131071];
	wire [7:0] DATAOUT;

	initial begin
		$readmemh("data_m1.txt", ROMDATA);
	end

	assign #100 DATAOUT = ROMDATA[ADDR];
	assign OUT = (nCE | nOE) ? 8'bzzzzzzzz : DATAOUT;

endmodule
