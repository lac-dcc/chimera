// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module BusMux(
	input wire S0,
	input wire S1,
	input wire S2,
	input wire S3,
	input wire S4,
	
	input wire[31:0] BusMuxInR0,
	input wire[31:0] BusMuxInR1,
	input wire[31:0] BusMuxInR2,
	input wire[31:0] BusMuxInR3,
	input wire[31:0] BusMuxInR4,
	input wire[31:0] BusMuxInR5,
	input wire[31:0] BusMuxInR6,
	input wire[31:0] BusMuxInR7,
	input wire[31:0] BusMuxInR8,
	input wire[31:0] BusMuxInR9,
	input wire[31:0] BusMuxInR10,
	input wire[31:0] BusMuxInR11,
	input wire[31:0] BusMuxInR12,
	input wire[31:0] BusMuxInR13,
	input wire[31:0] BusMuxInR14,
	input wire[31:0] BusMuxInR15,
	
	input wire[31:0] BusMuxInHI,
	input wire[31:0] BusMuxInLOW,
	input wire[31:0] BusMuxInZHigh,
	input wire[31:0] BusMuxInZLow,
	input wire[31:0] BusMuxInPC,
	input wire[31:0] BusMuxInMDR,
	
	input wire[31:0] BusMuxInInport,
	input wire[31:0] CSignExtended,
	
	output reg[31:0] BusOut
);

reg[4:0] sel = 5'b0;

always @(S0, S1, S2, S3, S4) begin
	sel = {S4, S3, S2, S1, S0};
	
	case(sel)
	
		5'b00000:	BusOut <= BusMuxInR0;
		5'b00001:	BusOut <= BusMuxInR1;
		5'b00010:	BusOut <= BusMuxInR2;
		5'b00011:	BusOut <= BusMuxInR3;
		5'b00100:	BusOut <= BusMuxInR4;
		5'b00101:	BusOut <= BusMuxInR5;
		5'b00110:	BusOut <= BusMuxInR6;
		5'b00111:	BusOut <= BusMuxInR7;
		5'b01000:	BusOut <= BusMuxInR8;
		5'b01001:	BusOut <= BusMuxInR9;
		5'b01010:	BusOut <= BusMuxInR10;
		5'b01011:	BusOut <= BusMuxInR11;
		5'b01100:	BusOut <= BusMuxInR12;
		5'b01101:	BusOut <= BusMuxInR13;
		5'b01110:	BusOut <= BusMuxInR14;
		5'b01111:	BusOut <= BusMuxInR15;
		
		5'b10000:	BusOut <= BusMuxInHI;
		5'b10001:	BusOut <= BusMuxInLOW;
		5'b10010:	BusOut <= BusMuxInZHigh;
		5'b10011:	BusOut <= BusMuxInZLow;
		5'b10100:	BusOut <= BusMuxInPC;
		5'b10101:	BusOut <= BusMuxInMDR;
		5'b10110:	BusOut <= BusMuxInInport;
		5'b10111:	BusOut <= CSignExtended;
		
		default:		BusOut <= 31'b0;
		
	endcase
end

endmodule