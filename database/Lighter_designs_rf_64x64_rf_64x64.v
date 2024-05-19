// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

module rf_64x64 (
	input			HCLK,							// System clock
	input			WR,
	input [ 5:0]	RA,
	input [ 5:0]	RB,
	input [ 5:0]	RW,
	input [63:0]	DW, 
	output [63:0]	DA, 
	output [63:0]	DB
);
 	reg [63:0] RF [63:0];

	assign DA = RF[RA] & {64{~(RA==6'd0)}};
	assign DB = RF[RB] & {64{~(RB==6'd0)}};
	
	always @ (posedge HCLK) 
		if(WR)
			if(RW!=6'd0) begin 
				RF[RW] <= DW;
				//#1 $display("Write: RF[%d]=0x%X []", RW, RF[RW]);
			end
endmodule
