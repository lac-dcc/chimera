
module xor_apuf #(parameter N=16,K=8)(clk,tigSignal,c,respReady,respBitA,respBit);

	input clk;
	input tigSignal;
	input [N-1:0] c;
	output respReady;
	output [K-1:0] respBitA;
	output respBit;

	wire [K-1:0] respReadyA;
	
	assign respReady = &respReadyA;    // When response is ready for sampling
	assign respBit = ^respBitA;        // XOR-ed response

	// APUF 
	genvar i;
	generate
		for(i=0; i<K; i=i+1) begin: PUFList
		
			(* KEEP_HIERARCHY = "TRUE" *)
			apufClassic #(.nStage(N)) APUF(
				.clk(clk), 
				.tigSignal(tigSignal), 
				.vcc(1'b1),
				.c(c),
				.respReady(respReadyA[i]), 
				.respBit(respBitA[i])
			);
			
		end
	endgenerate
		
endmodule
