`timescale 1ns/1ns

// 100ns 128k*8bit ROM

module rom_sfix(
	input [16:0] ADDR,
	output [7:0] OUT,
	input OE
);

	reg [7:0] ROMDATA[0:131071];

	initial begin
		$readmemh("rom_sfix.txt", ROMDATA);
	end

	assign #100 OUT = OE ? 8'bzzzzzzzz : ROMDATA[ADDR];

endmodule
