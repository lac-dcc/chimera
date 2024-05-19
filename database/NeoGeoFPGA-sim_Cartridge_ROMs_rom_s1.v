// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// 200ns 128k*8bit ROM (should be 250ns at extreme worst)

module rom_s1(
	input [16:0] ADDR,
	output [7:0] OUT
);

	reg [7:0] ROMDATA[0:131071];
	//wire [7:0] DATAOUT;
	
	initial begin
		$readmemh("data_s1.txt", ROMDATA);
	end

	// S1 ROM always enabled
	assign #200 OUT = ROMDATA[ADDR];

endmodule
