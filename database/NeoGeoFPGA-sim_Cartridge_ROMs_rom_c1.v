// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// 250ns 2048k*16bit (4096kB) ROM

module rom_c1(
	input [20:0] ADDR,
	output [15:0] OUT,
	input nCE
);

	reg [15:0] ROMDATA[0:2097151];
	wire [15:0] DATAOUT;

	initial begin
		$readmemh("data_c1.txt", ROMDATA);
	end

	assign #250 DATAOUT = ROMDATA[ADDR];
	assign OUT = nCE ? 16'bzzzzzzzzzzzzzzzz : DATAOUT;
	
endmodule
