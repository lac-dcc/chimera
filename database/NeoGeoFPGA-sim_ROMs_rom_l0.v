`timescale 1ns/1ns

// 120ns 65536*8bit ROM

module rom_l0(
	input [15:0] ADDR,
	output [7:0] OUT,
	input nCE
);

	reg [7:0] ROMDATA[0:65535];
	wire [7:0] DATA_OUT;

	initial begin
		$readmemh("rom_l0.txt", ROMDATA);
	end

	assign #120 DATA_OUT = ROMDATA[ADDR];
	assign OUT = nCE ? 8'bzzzzzzzz : DATA_OUT;

endmodule
