// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// 100ns 4096k*8bit ROM

module rom_v2(
	input [21:0] ADDR,
	output [7:0] OUT,
	input nROMOE
);

	reg [7:0] ROMDATA[0:4194303];
	wire [7:0] DATAOUT;

	initial begin
		$readmemh("data_v2.txt", ROMDATA);
	end

	assign #100 DATAOUT = ROMDATA[ADDR];
	assign OUT = nROMOE ? 8'bzzzzzzzz : DATAOUT;

endmodule
