
/*************************************************************************** 
	Design: Classical Arbiter PUF
	Author: Durga Prasad Sahoo (dpsahoo.cs@gmail.com)
	Last update: 23/12/2014
   
****************************************************************************/
	 
module apufClassic #(parameter nStage = 64)(
	clk, 
	tigSignal, 
	vcc,
	c,
	respReady, 
	respBit
	);
	
	input clk;
	input tigSignal;
	input vcc;
	input [nStage-1:0] c;    // Challenge 
	output respReady;            
	output respBit;
	
	wire pathT;
	wire pathB;
	reg tigReg;

	
	// status of response
	assign respReady = (pathT & pathB);
	
	// Latch the trigger signal to reduce the bias in trigger siganl
	always@(posedge clk) begin 
	 if(tigSignal)
		 tigReg <= vcc; 
	 else 
		 tigReg <= 1'b0; 
	end 

	 // Chain of switches 
	 (*KEEP_HIERARCHY = "TRUE"*)
	 switchChain  #(.nStage(nStage) ) SWITCH_CHAIN( 
		 .inT(tigReg), 
		 .inB(tigReg), 
		 .c(c),
		 .outT(pathT),      // to arbiter 
		 .outB(pathB)       // to arbiter  
	 );

	 // Arbiter 
	 //(*KEEP_HIERARCHY = "TRUE"*)
	/* dflop ARBITER( 
		 .din(pathT), 
		 .clk(pathB), 
		 .dout(respBit) 
	 );
   */
	
   (*KEEP_HIERARCHY = "TRUE"*)
	nandLatch ARBITER(
		.s(pathT),
		.r(pathB),
		.q(respBit),
		.qbar()
	 );
	 
	
endmodule
