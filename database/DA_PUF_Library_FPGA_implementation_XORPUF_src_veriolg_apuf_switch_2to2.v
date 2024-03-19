
/*************************************************************************** 
	Design: 2 by 2 switch
	Author: Durga Prasad Sahoo (dpsahoo.cs@gmail.com)
	Last update: 23/12/2014
   *************************************************************************
	Copyright@SEAL IIT Kharagpur
****************************************************************************/

module switch_2to2(
		inT,
		inB,
		cT,
      cB,
		outT,
		outB
	);
	
	input  inT;              // Upper input signal 
	input  inB;              // lower input signal
	input  cT;               // Control input
	input  cB;               // Control input
	output outT;             // Upper output signal
	output outB;             // Lower output signal
	
	(*LOCK_PINS = "all"*)
    mux_n21 #(.nCTRL(1)) MUXU(
        .ins({inB,inT}),
        .ctrls(cT),
        .out(outT)
    );
    
    (*LOCK_PINS = "all"*)
    mux_n21 #(.nCTRL(1)) MUXL(
        .ins({inT,inB}),
        .ctrls(cB),
        .out(outB)
    );
    
endmodule 
	