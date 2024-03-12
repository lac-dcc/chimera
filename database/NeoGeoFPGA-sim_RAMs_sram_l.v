`timescale 1ns/1ns

// 120ns 32768*8bit RAM

module sram_l(
	input [14:0] ADDR,
	inout [7:0] DATA,
	input nCE,
	input nOE,
	input nWE
);

	reg [7:0] RAMDATA[0:32767];
	wire [7:0] DATA_OUT;
	
	integer k;
	initial begin
		//Clean init to 0 since the speed-patched system ROM skips SRAM init
		//for (k = 0; k < 32767; k = k + 1)
		//	 RAMDATA[k] = 0;
		$readmemh("raminit_sram_l.txt", RAMDATA);
	end

	assign #120 DATA_OUT = RAMDATA[ADDR];
	assign DATA = (!nCE && !nOE) ? DATA_OUT : 8'bzzzzzzzz;

	always @(nCE or nWE)
		if (!nCE && !nWE)
			#30 RAMDATA[ADDR] <= DATA;
	
	// DEBUG begin
	always @(nWE or nCE)
		if (!nWE && !nOE)
			$display("ERROR: SRAML: nOE and nWE are both active !");
	
	//always @(negedge nWE)
	//	if (!nCE) $display("Wrote %H to SRAML %H", DATA, ADDR);
	// DEBUG end

endmodule
