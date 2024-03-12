`timescale 1ns/1ns

// 250ns 2048k*16bit (4096kB) ROM

module rom_c3(
	input [20:0] ADDR,
	output [15:0] OUT,
	input nCE
);

	reg [15:0] ROMDATA[0:2097151];
	wire [15:0] DATAOUT;

	initial begin
		$readmemh("data_c3.txt", ROMDATA);
	end

	assign #250 DATAOUT = ROMDATA[ADDR];
	assign OUT = nCE ? 16'bzzzzzzzzzzzzzzzz : DATAOUT;
	
endmodule
