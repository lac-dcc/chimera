`timescale 1ns/1ns

// 120ns 2048*8bit RAM

module z80ram(
	input [10:0] ADDR,
	inout [7:0] DATA,
	input nCE,
	input nOE,
	input nWE
);

	reg [7:0] RAMDATA[0:2047];
	wire [7:0] DATAOUT;
	
	integer k;
	initial begin
		for (k = 0; k < 2047; k = k + 1)
			RAMDATA[k] = k & 255;
		//$readmemh("raminit_z80.txt", RAMDATA);
	end

	assign #100 DATAOUT = RAMDATA[ADDR];
	assign DATA = (!nCE && !nOE && nWE) ? DATAOUT : 8'bzzzzzzzz;

	always @(*)
		if (!nCE && !nWE)
			#20 RAMDATA[ADDR] <= DATA;
	
	always @(*)
		if (!nWE && !nOE)
			$display("ERROR: Z80RAM: nOE and nWE are both active !");

endmodule
