// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module BUS (
	R0out, 
	R1out,  
	R2out, 
	R3out,  
	R4out, 
	R5out, 
	R6out,
	R7out, 
	R8out, 
	R9out, 
	R10out, 
	R11out, 
	R12out, 
	R13out, 
	R14out,
	R15out, 
	PCout, 
	Zhighout, 
	Zlowout, 
	MDRout, 
	HIout,
	LOout, 
	Cout, 
	InPortout, 
	R0dataOut, 
	R1dataOut,  
	R2dataOut, 
	R3dataOut,
	R4dataOut, 
	R5dataOut, 
	R6dataOut, 
	R7dataOut, 
	R8dataOut, 
	R9dataOut,
	R10dataOut, 
	R11dataOut, 
	R12dataOut, 
	R13dataOut, 
	R14dataOut, 
	R15dataOut,
	PCdataOut, 
	HIdataOut, 
	LOdataOut,  
	ZhighdataOut, 
	ZlowdataOut, 
	MDRdataOut,
	InPortdataOut, 
	CSignExtdataOut, 
	BusMuxOut,
	IRdataOut,
	IRout
);

///all inputs

//select values
//registers
input wire R0out, R1out,  R2out, R3out,  R4out, R5out, R6out, R7out,
R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
//everything else
input wire PCout, Zhighout, Zlowout, MDRout, HIout,
 LOout, Cout, InPortout, IRout;
 
//actaul contents acting as inputs for the bus mux 
//registers 
input wire [31:0] R0dataOut, R1dataOut,  R2dataOut, R3dataOut, R4dataOut,
R5dataOut, R6dataOut, R7dataOut, R8dataOut, R9dataOut, R10dataOut,
R11dataOut, R12dataOut, R13dataOut, R14dataOut, R15dataOut;

//everything else
input wire [31:0] PCdataOut, HIdataOut, LOdataOut,  ZhighdataOut, ZlowdataOut,
 MDRdataOut, InPortdataOut, CSignExtdataOut, IRdataOut;
 
output reg[31:0] BusMuxOut;

//default Cout?
always@(*) begin 

	if(R0out) BusMuxOut = R0dataOut;
	else if (MDRout) BusMuxOut <= MDRdataOut;
	else if (R1out) BusMuxOut <= R1dataOut;
	else if (R2out) BusMuxOut = R2dataOut;
	else if (R3out) BusMuxOut <= R3dataOut;
	else if (R4out) BusMuxOut <= R4dataOut;
	else if (R5out) BusMuxOut = R5dataOut;
	else if (R6out) BusMuxOut = R6dataOut;
	else if (R7out) BusMuxOut <= R7dataOut;
	else if (R8out) BusMuxOut <= R8dataOut;
	else if (R9out) BusMuxOut <= R9dataOut;
	else if (R10out) BusMuxOut <= R10dataOut;
	else if (R11out) BusMuxOut <= R11dataOut;
	else if (R12out) BusMuxOut <= R12dataOut;
	else if (R13out) BusMuxOut <= R13dataOut;
	else if (R14out) BusMuxOut <= R14dataOut;
	else if (R15out) BusMuxOut <= R15dataOut;
	else if (HIout) BusMuxOut <= HIdataOut;
	else if (LOout) BusMuxOut <= LOdataOut;
	else if (Zhighout) BusMuxOut <= ZhighdataOut;
	else if (Zlowout) BusMuxOut <= ZlowdataOut;
	else if (PCout) BusMuxOut <= PCdataOut;
	else if (InPortout) BusMuxOut <= InPortdataOut;
	else if (IRout) BusMuxOut <= IRdataOut;
	else 	  	 			  BusMuxOut <= CSignExtdataOut;
	
end


endmodule
