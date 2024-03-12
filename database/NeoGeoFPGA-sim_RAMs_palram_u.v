`timescale 1ns/1ns

// 100ns 8192*8bit RAM

module palram_u(
	input [12:0] ADDR,
	inout [7:0] DATA,
	input nCE,
	input nOE,
	input nWE
);

	reg [7:0] RAMDATA[0:8191];
	wire [7:0] DATA_OUT;
	
	initial begin
		$readmemh("data_pal_u.txt", RAMDATA);
	end

	assign #100 DATA_OUT = RAMDATA[ADDR];
	assign DATA = (!nCE && !nOE && nWE) ? DATA_OUT : 8'bzzzzzzzz;

	always @(nCE or nWE)
		if (!nCE && !nWE)
			#10 RAMDATA[ADDR] <= DATA;
	
	// nWE has priority over nOE, as nOE is tied to ground
	/*
	always @(nWE or nCE)
		if (!nWE && !nOE)
			$display("ERROR: PRAMU: nOE and nWE are both active !");
	*/

endmodule
