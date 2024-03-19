
/*************************************************************************** 
	Design: Chain of switch
	Author: Durga Prasad Sahoo (dpsahoo.cs@gmail.com)
	Last update: 23/12/2014
   *************************************************************************
	Copyright@SEAL IIT Kharagpur
****************************************************************************/

module switchChain #( parameter nStage = 16)(
      inT,
		inB,
		c,
		outT,
		outB
	);
	
	input inT,inB;
	input [nStage-1:0]  c;
	output outT;
	output outB;

	wire [nStage:0] netT;
	wire [nStage:0] netB;
	
	// Output signal from upper and lower paths
	assign outT = netT[nStage];
	assign outB = netB[nStage];
	
	// Input trigger signal for puf
	assign netT[0] = inT;
	assign netB[0] = inB;
	
	
	// Generate chain of switches
	genvar i;
	generate 
		for(i = 0; i < nStage; i = i + 1) begin:STAGE 
		
					//(*KEEP_HIERARCHY = "TRUE"*)				
					sw_dolut SW(
						.iT(netT[i]),
						.iB(netB[i]),
						.c(c[i]),
						.vcc(1'b1),
						.oT(netT[i+1]),
						.oB(netB[i+1])
					);
				
		end
	endgenerate
		
endmodule 