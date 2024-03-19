
module ixor_apuf #(parameter N1=16, N2=N1+1, K1=2, K2=2, POS=N1/2)(
	clk,
	tigSig_t,
	tigSig_b,
	c,
	respReady_t,
	respReady,
	respBitA,
	respBit
	);

	input clk;                        // Clock
	input tigSig_t;                   // Trigger signal for upper XOR APUF
	input tigSig_b;                   // Trigger signal for lower XOR APUF
	input [N1-1:0] c;                 // Challenge
	output respReady_t;               // Response ready status signal for upper XOR APUF
	output respReady;                 // Response ready status signal of iXOR APUF 
	output [K1+K2-1:0] respBitA;          // Response bits of all APUFs
	output respBit;                   // Response of iXOR APUF

	
	wire [N2-1:0] c_b;                   // Challenge for lower xor PUF
	wire [K1-1:0] respBitA_t;         // Responses of APUFs in uppuer XOR PUF
	wire [K2-1:0] respBitA_b;         // Responses of APUFs in lower XOR PUF
	
	wire respBit_t;                   // Response of uppuer XOR PUF
	   
	assign respBitA = {respBitA_t,respBitA_b}; 
	assign c_b = {c[N1-1:POS+1], respBit_t, c[POS:0]}; 	
	
    // UPPER XOR APUF
	(*KEEP_HIERARCHY="TRUE"*)
	xor_apuf #(.N(N1),.K(K1)) XAPUF_T(
	   .clk(clk),
		.tigSignal(tigSig_t),
		.c(c),
		.respReady(respReady_t),
		.respBitA(respBitA_t),
		.respBit(respBit_t)
	);
	
	// LOWER XOR APUF
	(*KEEP_HIERARCHY="TRUE"*)
	xor_apuf #(.N(N2),.K(K2)) XAPUF_B(
		.clk(clk),
		.tigSignal(tigSig_b),
		.c(c_b),
		.respReady(respReady),
		.respBitA(respBitA_b),
		.respBit(respBit)
	);
	
		
endmodule
