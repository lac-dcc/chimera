`timescale 1ns/1ns

// 35ns 2048*8bit RAM

module vram_fast_u(
	input [10:0] ADDR,
	inout [7:0] DATA,
	input nCE,
	input nOE,
	input nWE
);

	reg [7:0] RAMDATA[0:2047];
	wire [7:0] DATA_OUT;
	
	integer k;
	initial begin
		for (k = 0; k < 2047; k = k + 1)
			RAMDATA[k] = 0;
		#50
		$readmemh("data_fvram_u.txt", RAMDATA);
	end

	assign #35 DATA_OUT = RAMDATA[ADDR];
	assign DATA = (!nCE && !nOE && nWE) ? DATA_OUT : 8'bzzzzzzzz;

	always @(nCE or nWE)
		if (!nCE && !nWE)
			#20 RAMDATA[ADDR] <= DATA;
	
	// nWE has priority over nOE, as nOE is tied to ground
	/*
	always @(nWE or nCE)
		if (!nWE && !nOE)
			$display("ERROR: VRAMUU: nOE and nWE are both active !");
	*/

endmodule
