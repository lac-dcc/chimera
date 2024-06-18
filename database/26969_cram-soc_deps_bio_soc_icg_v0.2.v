// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// `define FPGA 1
module ICG(CK,EN,SE,CKG);
input	CK,EN,SE;
output	CKG;

`ifdef FPGA
// BUFGCE: General Clock Buffer with Clock Enable
// UltraScale
// Xilinx HDL Libraries Guide, version 2014.1
    BUFGCE #(
    .CE_TYPE("SYNC"), // SYNC, ASYNC
    .IS_CE_INVERTED(1'b0), // Programmable inversion on CE
    .IS_I_INVERTED(1'b0) // Programmable inversion on I
    )
    BUFGCE_inst (
    .O(CKG), // 1-bit output: Buffer
    .CE(EN), // 1-bit input: Buffer enable
    .I(CK) // 1-bit input: Buffer
    );
// End of BUFGCE_inst instantiation
`else

    STN_CKGTPLT_V5_2 uicg(.Q(CKG), .CK(CK), .EN(EN), .SE(SE));

`endif

endmodule

`ifdef SIM
module STN_CKGTPLT_V5_2 (Q, CK, EN, SE);
input	CK,EN,SE;
output	Q;
wire	CK,EN,Q;

	wire    or_out;
	reg     EN1;
	
	assign or_out = EN;
	
	always  @(CK or or_out) if(!CK) EN1 = or_out;
	
	assign Q = ( SE | EN1 ) & CK;

endmodule
/*
module STN_INV_S_8( A, X);
    input A;
    output X;
    wire A,X;
    assign X=A;
endmodule
*/
`endif







