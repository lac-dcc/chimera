`timescale 1ns/1ns

// 120ns 1024k*16bit (2048kB) ROM

module rom_p1(
	input [19:0] ADDR,
	output [15:0] OUT,
	input nCE,
	input nOE
);

	reg [15:0] ROMDATA[0:1048575];
	wire [15:0] DATAOUT;

	initial begin
		$readmemh("data_p1_skipclear.txt", ROMDATA);
	end

	assign #120 DATAOUT = ROMDATA[ADDR];
	assign OUT = (nCE | nOE) ? 16'bzzzzzzzzzzzzzzzz : {DATAOUT[7:0], DATAOUT[15:8]};

endmodule
