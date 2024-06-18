// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module CPU(
	input wire clk,
	input wire reset,
	
	
	input wire[3:0] ALUcontrol,
	input wire[31:0] MdataIn,
	input wire MDRead,
	
	
	input wire R0Select,
	input wire R1Select,
	input wire R2Select,
	input wire R3Select,
	input wire R4Select,
	input wire R5Select,
	input wire R6Select,
	input wire R7Select,
	input wire R8Select,
	input wire R9Select,
	input wire R10Select,
	input wire R11Select,
	input wire R12Select,
	input wire R13Select,
	input wire R14Select,
	input wire R15Select,
	
	input wire HISelect,
	input wire LOWSelect,
	input wire ZHighSelect,
	input wire ZLowSelect,
	input wire PCSelect,
	input wire MDRSelect,
	input wire InPortSelect,
	input wire COutSelect,
	
	input wire IRSelect,
	input wire RYSelect,
	input wire RZSelect,
	input wire MARSelect,
	
	
	input wire R0In,
	input wire R1In,
	input wire R2In,
	input wire R3In,
	input wire R4In,
	input wire R5In,
	input wire R6In,
	input wire R7In,
	input wire R8In,
	input wire R9In,
	input wire R10In,
	input wire R11In,
	input wire R12In,
	input wire R13In,
	input wire R14In,
	input wire R15In,
	
	input wire HIIn,
	input wire LOWIn,
	input wire ZHighIn,
	input wire ZLowIn,
	input wire PCIn,
	input wire MDRIn,
	input wire InPortIn,
	input wire COutIn,
	
	input wire IRIn,
	input wire RYIn,
	input wire RZIn,
	input wire MARIn
	
	
);

	wire[31:0] BusMuxOut;
	wire[4:0] BusSel;
	
	wire[31:0] R0Output_Q;
	wire[31:0] R1Output_Q;
	wire[31:0] R2Output_Q;
	wire[31:0] R3Output_Q;
	wire[31:0] R4Output_Q;
	wire[31:0] R5Output_Q;
	wire[31:0] R6Output_Q;
	wire[31:0] R7Output_Q;
	wire[31:0] R8Output_Q;
	wire[31:0] R9Output_Q;
	wire[31:0] R10Output_Q;
	wire[31:0] R11Output_Q;
	wire[31:0] R12Output_Q;
	wire[31:0] R13Output_Q;
	wire[31:0] R14Output_Q;
	wire[31:0] R15Output_Q;
	
	wire[31:0] HIOutput_Q;
	wire[31:0] LOWOutput_Q;
	wire[31:0] ZHighOutput_Q;
	wire[31:0] ZLowOutput_Q;
	wire[31:0] PCOutput_Q;
	wire[31:0] MDROutput_Q;
	wire[31:0] InPortOutput_Q;
	wire[31:0] COutOutput_Q;
	
	wire[31:0] IROutput_Q;
	wire[31:0] RYOutput_Q;
	wire[31:0] RZOutput_Q;
	wire[31:0] MAROutput_Q;
	wire[31:0] MDMuxOutput_Q;
	
	wire[31:0] toRZ;
	
	wire[31:0] ZLowInput;
	wire[31:0] ZHighInput;

//Registers

Register R0(
	.clk(clk),
	.clr(reset),
	.W_E(R0In),
	.input_D(BusMuxOut),
	.output_Q(R0Output_Q)
);

Register R1(
	.clk(clk),
	.clr(reset),
	.W_E(R1In),
	.input_D(BusMuxOut),
	.output_Q(R1Output_Q)
);

Register R2(
	.clk(clk),
	.clr(reset),
	.W_E(R2In),
	.input_D(BusMuxOut),
	.output_Q(R2Output_Q)
);

Register R3(
	.clk(clk),
	.clr(reset),
	.W_E(R3In),
	.input_D(BusMuxOut),
	.output_Q(R3Output_Q)
);

Register R4(
	.clk(clk),
	.clr(reset),
	.W_E(R4In),
	.input_D(BusMuxOut),
	.output_Q(R4Output_Q)
);

Register R5(
	.clk(clk),
	.clr(reset),
	.W_E(R5In),
	.input_D(BusMuxOut),
	.output_Q(R5Output_Q)
);

Register R6(
	.clk(clk),
	.clr(reset),
	.W_E(R6In),
	.input_D(BusMuxOut),
	.output_Q(R6Output_Q)
);

Register R7(
	.clk(clk),
	.clr(reset),
	.W_E(R7In),
	.input_D(BusMuxOut),
	.output_Q(R7Output_Q)
);

Register R8(
	.clk(clk),
	.clr(reset),
	.W_E(R8In),
	.input_D(BusMuxOut),
	.output_Q(R8Output_Q)
);

Register R9(
	.clk(clk),
	.clr(reset),
	.W_E(R9In),
	.input_D(BusMuxOut),
	.output_Q(R9Output_Q)
);

Register R10(
	.clk(clk),
	.clr(reset),
	.W_E(R10In),
	.input_D(BusMuxOut),
	.output_Q(R10Output_Q)
);

Register R11(
	.clk(clk),
	.clr(reset),
	.W_E(R11In),
	.input_D(BusMuxOut),
	.output_Q(R11Output_Q)
);

Register R12(
	.clk(clk),
	.clr(reset),
	.W_E(R12In),
	.input_D(BusMuxOut),
	.output_Q(R12Output_Q)
);

Register R13(
	.clk(clk),
	.clr(reset),
	.W_E(R13In),
	.input_D(BusMuxOut),
	.output_Q(R13Output_Q)
);

Register R14(
	.clk(clk),
	.clr(reset),
	.W_E(R14In),
	.input_D(BusMuxOut),
	.output_Q(R14Output_Q)
);

Register R15(
	.clk(clk),
	.clr(reset),
	.W_E(R15In),
	.input_D(BusMuxOut),
	.output_Q(R15Output_Q)
);

Register PC(
	.clk(clk),
	.clr(reset),
	.W_E(PCIn),
	.input_D(BusMuxOut),
	.output_Q(PCOutput_Q)
);

Register IR(
	.clk(clk),
	.clr(reset),
	.W_E(IRIn),
	.input_D(BusMuxOut),
	.output_Q(IROutput_Q)
);

Register RY(
	.clk(clk),
	.clr(reset),
	.W_E(RYIn),
	.input_D(BusMuxOut),
	.output_Q(RYOutput_Q)
);

Register RZ(
	.clk(clk),
	.clr(reset),
	.W_E(RZIn),
	.input_D(BusMuxOut),
	.output_Q(RZOutput_Q)
);

Register MAR(
	.clk(clk),
	.clr(reset),
	.W_E(MARIn),
	.input_D(BusMuxOut),
	.output_Q(MAROutput_Q)
);

Register HI(
	.clk(clk),
	.clr(reset),
	.W_E(HIIn),
	.input_D(ZHighInput),
	.output_Q(HIOutput_Q)
);

Register LOW(
	.clk(clk),
	.clr(reset),
	.W_E(LOWIn),
	.input_D(ZLowInput),
	.output_Q(LOWOutput_Q)
);

//Register MDR(
//	.clk(clk),
//	.clr(reset),
//	.W_E(MDRIn),
//	.input_D(BusMuxOut),
//	.output_Q(MDROutput_Q)
//);


//other elements

//bus encoder
BusEncoder TheEncoder(
	.R0Out(R0Select),
	.R1Out(R1Select),
	.R2Out(R2Select),
	.R3Out(R3Select),
	.R4Out(R4Select),
	.R5Out(R5Select),
	.R6Out(R6Select),
	.R7Out(R7Select),
	.R8Out(R8Select),
	.R9Out(R9Select),
	.R10Out(R10Select),
	.R11Out(R11Select),
	.R12Out(R12Select),
	.R13Out(R13Select),
	.R14Out(R14Select),
	.R15Out(R15Select),
	
	.HIOut(HISelect),
	.LOWOut(LOWSelect),
	.ZHighOut(ZHighSelect),
	.ZLowOut(ZLowSelect),
	.PCOut(PCSelect),
	.MDROut(MDRSelect),
	.InPortOut(InPortSelect),
	.COut(COutSelect),
	
	.S0(BusSel[0]),
	.S1(BusSel[1]),
	.S2(BusSel[2]),
	.S3(BusSel[3]),
	.S4(BusSel[4])
);

BusMux TheMux(
	.S0(BusSel[0]),
	.S1(BusSel[1]),
	.S2(BusSel[2]),
	.S3(BusSel[3]),
	.S4(BusSel[4]),
	
	.BusMuxInR0(R0Output_Q),
	.BusMuxInR1(R1Output_Q),
	.BusMuxInR2(R2Output_Q),
	.BusMuxInR3(R3Output_Q),
	.BusMuxInR4(R4Output_Q),
	.BusMuxInR5(R5Output_Q),
	.BusMuxInR6(R6Output_Q),
	.BusMuxInR7(R7Output_Q),
	.BusMuxInR8(R8Output_Q),
	.BusMuxInR9(R9Output_Q),
	.BusMuxInR10(R10Output_Q),
	.BusMuxInR11(R11Output_Q),
	.BusMuxInR12(R12Output_Q),
	.BusMuxInR13(R13Output_Q),
	.BusMuxInR14(R14Output_Q),
	.BusMuxInR15(R15Output_Q),
	
	.BusMuxInHI(HIOutput_Q),
	.BusMuxInLOW(LOWOutput_Q),
	.BusMuxInZHigh(ZHighOutput_Q),
	.BusMuxInZLow(ZLowOutput_Q),
	.BusMuxInPC(PCOutput_Q),
	.BusMuxInMDR(MDROutput_Q),
	
	.BusMuxInInport(InPortOutput_Q),
	.CSignExtended(COutOutput_Q),
	
	.BusOut(BusMuxOut)
);

MDR TheMDR(
	.clk(clk),
	.Clear(reset),
	 
	.BusMuxOut(BusMuxOut),
	.MDataIn(MdataIn),
	.MDRead(MDRead),
	.MDRIn(MDRIn),
	.Q(MDROutput_Q)
);

ALU TheALU(
	.A(BusMuxOut),
	.B(RYOutput_Q),
	.Op(ALUcontrol),
	.alu_out(ZLowInput),
	.alu_out2(ZHighInput)
);


always @(posedge clk) begin
	
end


endmodule
