`timescale 1ns/1ns

// 120ns 128k*16bit ROM

module rom_sps2(
	input [15:0] ADDR,
	output [15:0] OUT,
	input nOE
);

	reg [15:0] ROMDATA[0:65535];
	wire [15:0] DATA;

	initial begin
		$readmemh("rom_sp-s2_fast.txt", ROMDATA);
	end

	assign #120 DATA = ROMDATA[ADDR][15:0];
	assign #50 OUT = nOE ? 16'bzzzzzzzzzzzzzzzz : DATA;	// 50ns from OE to data valid

endmodule
