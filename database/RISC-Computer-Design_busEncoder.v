// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module BusEncoder(
	input R0Out,
	input R1Out,
	input R2Out,
	input R3Out, 
	input R4Out,
	input R5Out,
	input R6Out,
	input R7Out,
	input R8Out, 
	input R9Out, 
	input R10Out, 
	input R11Out,
	input R12Out,
	input R13Out, 
	input R14Out,
	input R15Out,
	
	input HIOut,
	input LOWOut,
	input ZHighOut,
	input ZLowOut,
	input PCOut, 
	input MDROut,
	input InPortOut,
	input COut,
	
	
	output S0,
	output S1,
	output S2,
	output S3,
	output S4
);


assign S0 = (R1Out || R3Out || R5Out || R7Out || R9Out || R11Out || R13Out || R15Out || LOWOut || ZLowOut || MDROut || COut);
assign S1 = (R2Out || R3Out || R6Out || R7Out || R10Out || R11Out || R14Out || R15Out || ZHighOut || ZLowOut || InPortOut || COut);
assign S2 = (R4Out || R5Out || R6Out || R7Out || R12Out || R13Out || R14Out || R15Out || PCOut || MDROut || InPortOut || COut);
assign S3 = (R8Out || R9Out || R10Out || R11Out || R12Out || R13Out || R14Out || R15Out);
assign S4 = (HIOut || LOWOut || ZHighOut || ZLowOut || PCOut || MDROut || InPortOut || COut);	
	
endmodule
