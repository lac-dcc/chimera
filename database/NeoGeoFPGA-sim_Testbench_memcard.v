`timescale 1ns/1ns

// 2K memory card (100ns 2048*8bit RAM)

module memcard(
	input [23:0] CDA,
	inout [15:0] CDD,
	input nCE,
	input nOE,
	input nWE,
	input nREG,				// Ignore
	output nCD1, nCD2,
	output nWP
);

	parameter nINSERTED = 1'b1;		// Memcard not inserted !
	//parameter nINSERTED = 1'b0;		// Memcard inserted :)
	parameter nPROTECT = 1'b1;			// And not protected

	reg [7:0] RAMDATA[0:2047];
	wire [7:0] DATA_OUT;
	
	integer k;
	initial begin
		//for (k = 0; k < 2047; k = k + 1)
		//	RAMDATA[k] = k & 255;
		$readmemh("raminit_memcard.txt", RAMDATA);
	end
	
	assign nCD1 = nINSERTED;
	assign nCD2 = nINSERTED;
	assign nWP = nPROTECT;
	
	assign #100 DATA_OUT = RAMDATA[CDA[10:0]];
	assign CDD[15:8] = 8'b11111111;		// 8bit memcard
	assign CDD[7:0] = (!nCE && !nOE) ? DATA_OUT : 8'bzzzzzzzz;

	always @(nCE or nWE)
		if (!nCE && !nWE)
			#50 RAMDATA[CDA[10:0]] = CDD[7:0];
	
	// DEBUG begin
	always @(nWE or nOE)
		if (!nWE && !nOE)
			$display("ERROR: MEMCARD: nOE and nWE are both active !");
	
	always @(negedge nWE)
		if (!nCE) $display("MEMCARD: Wrote value 0x%H @ 0x%H", CDD, CDA);
		
	always @(negedge nOE)
		if (!nCE) $display("MEMCARD: Read value 0x%H @ 0x%H", RAMDATA[CDA[10:0]], CDA);
	// DEBUG end

endmodule
