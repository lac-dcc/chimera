
module regfile (
	input			HCLK,							// System clock
	input			WR,
	input [ 4:0]	RA,
	input [ 4:0]	RB,
	input [ 4:0]	RW,
	input [31:0]	DW, 
	output [31:0]	DA, 
	output [31:0]	DB
);
 	reg [31:0] RF [31:0];

	assign DA = RF[RA] & {32{~(RA==5'd0)}};
	assign DB = RF[RB] & {32{~(RB==5'd0)}};
	
	always @ (posedge HCLK) 
		if(WR)
			if(RW!=5'd0) begin 
				RF[RW] <= DW;
				//#1 $display("Write: RF[%d]=0x%X []", RW, RF[RW]);
			end
endmodule