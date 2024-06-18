// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

`timescale 1ns/10ps
module tb_datapath;
	reg clk;
	reg clk10;
	reg reset;
	
	
	reg[3:0] ALUcontrol;
	reg[31:0] MdataIn;
	reg MDRead;
	
	
	reg R0Select;
	reg R1Select;
	reg R2Select;
	reg R3Select;
	reg R4Select;
	reg R5Select;
	reg R6Select;
	reg R7Select;
	reg R8Select;
	reg R9Select;
	reg R10Select;
	reg R11Select;
	reg R12Select;
	reg R13Select;
	reg R14Select;
	reg R15Select;
	
	reg HISelect;
	reg LOWSelect;
	reg ZHighSelect;
	reg ZLowSelect;
	reg PCSelect;
	reg MDRSelect;
	reg InPortSelect;
	reg COutSelect;
	
	reg IRSelect;
	reg RYSelect;
	reg RZSelect;
	reg MARSelect;
	
	
	reg R0In;
	reg R1In;
	reg R2In;
	reg R3In;
	reg R4In;
	reg R5In;
	reg R6In;
	reg R7In;
	reg R8In;
	reg R9In;
	reg R10In;
	reg R11In;
	reg R12In;
	reg R13In;
	reg R14In;
	reg R15In;
	
	reg HIIn;
	reg LOWIn;
	reg ZHighIn;
	reg ZLowIn;
	reg PCIn;
	reg MDRIn;
	reg InPortIn;
	reg COutIn;
	
	reg IRIn;
	reg RYIn;
	reg RZIn;
	reg MARIn;
	
	parameter Default = 4'b0000,
					Reg_load1a = 4'b0001, 
					Reg_load1b = 4'b0010, 
					Reg_load2a = 4'b0011,
					Reg_load2b = 4'b0100, 
					Reg_load3a = 4'b0101, 
					Reg_load3b = 4'b0110, 
	
					T0 = 4'b0111,
					T1 = 4'b1000, 
					T2 = 4'b1001, 
					T3 = 4'b1010, 
					T4 = 4'b1011, 
					T5 = 4'b1100;
	
	reg [3:0] PresentState = Default;
	
	reg R0Out;
	reg R1Out;
	reg R2Out;
	reg R3Out;
	reg R4Out;
	reg R5Out;
	reg R6Out;
	reg R7Out;
	reg R8Out;
	reg R9Out;
	reg R10Out;
	reg R11Out;
	reg R12Out;
	reg R13Out;
	reg R14Out;
	reg R15Out;
	
	reg HIOut;
	reg LOWOut;
	reg ZHighOut;
	reg ZLowOut;
	reg PCOut;
	reg MDROut;
	reg InPortOut;
	reg COutOut;
	
	reg IROut;
	reg RYOut;
	reg RZOut;
	reg MAROut;

CPU DUT(
	.clk(clk),
	.reset(reset),
	
	
	.ALUcontrol(ALUcontrol),
	.MdataIn(MdataIn),
	.MDRead(MDRead),
	
	
	.R0Select(R0Select),
	.R1Select(R1Select),
	.R2Select(R2Select),
	.R3Select(R3Select),
	.R4Select(R4Select),
	.R5Select(R5Select),
	.R6Select(R6Select),
	.R7Select(R7Select),
	.R8Select(R8Select),
	.R9Select(R9Select),
	.R10Select(R10Select),
	.R11Select(R11Select),
	.R12Select(R12Select),
	.R13Select(R13Select),
	.R14Select(R14Select),
	.R15Select(R15Select),

	.HISelect(HISelect),
	.LOWSelect(LOWSelect),
	.ZHighSelect(ZHighSelect),
	.ZLowSelect(ZLowSelect),
	.PCSelect(PCSelect),
	.MDRSelect(MDRSelect),
	.InPortSelect(InPortSelect),
	.COutSelect(COutSelect),
	
	.IRSelect(IRSelect),
	.RYSelect(RYSelect),
	.RZSelect(RZSelect),
	.MARSelect(MARSelect),

	
	.R0In(R0In),
	.R1In(R1In),
	.R2In(R2In),
	.R3In(R3In),
	.R4In(R4In),
	.R5In(R5In),
	.R6In(R6In),
	.R7In(R7In),
	.R8In(R8In),
	.R9In(R9In),
	.R10In(R10In),
	.R11In(R11In),
	.R12In(R12In),
	.R13In(R13In),
	.R14In(R14In),
	.R15In(R15In),
	
	.HIIn(HIIn),
	.LOWIn(LOWIn),
	.ZHighIn(ZHighIn),
	.ZLowIn(ZLowIn),
	.PCIn(PCIn),
	.MDRIn(MDRIn),
	.InPortIn(InPortIn),
	.COutIn(COutIn),
	
	.IRIn(IRIn),
	.RYIn(RYIn),
	.RZIn(RZIn),
	.MARIn(MARIn)
);


integer i;
// add test logic here
initial begin
	clk = 0;
	clk10 = 0;
	for(i = 0; i < 250; i = i + 1) begin
		#10 clk = ~clk;
		
		if(i % 10 == 0) begin
			clk10 = ~clk10;
		end
	end
	
	
end




// finite state machine; if clk rising-edge
always @(posedge clk10) begin
	case(PresentState)
		Reg_load1a : PresentState = Reg_load1b;
		Reg_load1b : PresentState = Reg_load2a;
		Reg_load2a : PresentState = Reg_load2b;
		Reg_load2b : PresentState = Reg_load3a;
		Reg_load3a : PresentState = Reg_load3b;
		Reg_load3b : PresentState = T0;
		
		T0 : PresentState = T1;
		T1 : PresentState = T2;
		T2 : PresentState = T3;
		T3 : PresentState = T4;
		T4 : PresentState = T5;
		
		Default : PresentState = Reg_load1a;

	endcase
end

// do the required job in each state 
always @(PresentState) begin 
	case(PresentState) // assert the required signals in each clk cycle
		Default: begin
			$display("Initializing pins");
			reset <= 0;
			
			
			ALUcontrol <= 0;
			MdataIn <= 32'b0;
			MDRead <= 0;
			
			
			R0Select <= 0;
			R1Select <= 0;
			R2Select <= 0;
			R3Select <= 0;
			R4Select <= 0;
			R5Select <= 0;
			R6Select <= 0;
			R7Select <= 0;
			R8Select <= 0;
			R9Select <= 0;
			R10Select <= 0;
			R11Select <= 0;
			R12Select <= 0;
			R13Select <= 0;
			R14Select <= 0;
			R15Select <= 0;
			
			HISelect <= 0;
			LOWSelect <= 0;
			ZHighSelect <= 0;
			ZLowSelect <= 0;
			PCSelect <= 0;
			MDRSelect <= 0;
			InPortSelect <= 0;
			COutSelect <= 0;
			
			IRSelect <= 0;
			RYSelect <= 0;
			RZSelect <= 0;
			MARSelect <= 0;
			
			
			R0In <= 0;
			R1In <= 0;
			R2In <= 0;
			R3In <= 0;
			R4In <= 0;
			R5In <= 0;
			R6In <= 0;
			R7In <= 0;
			R8In <= 0;
			R9In <= 0;
			R10In <= 0;
			R11In <= 0;
			R12In <= 0;
			R13In <= 0;
			R14In <= 0;
			R15In <= 0;
			
			HIIn <= 0;
			LOWIn <= 0;
			ZHighIn <= 0;
			ZLowIn <= 0;
			PCIn <= 0;
			MDRIn <= 0;
			InPortIn <= 0;
			COutIn <= 0;
			
			IRIn <= 0;
			RYIn <= 0;
			RZIn <= 0;
			MARIn <= 0;
					
			
			R0Out <= 0;
			R1Out <= 0;
			R2Out <= 0;
			R3Out <= 0;
			R4Out <= 0;
			R5Out <= 0;
			R6Out <= 0;
			R7Out <= 0;
			R8Out <= 0;
			R9Out <= 0;
			R10Out <= 0;
			R11Out <= 0;
			R12Out <= 0;
			R13Out <= 0;
			R14Out <= 0;
			R15Out <= 0;
			
			HIOut <= 0;
			LOWOut <= 0;
			ZHighOut <= 0;
			ZLowOut <= 0;
			PCOut <= 0;
			MDROut <= 0;
			InPortOut <= 0;
			COutOut <= 0;
			
			IROut <= 0;
			RYOut <= 0;
			RZOut <= 0;
			MAROut <= 0;
		end
		
		Reg_load1a: begin
			#15;
			$display("Loading value");
			MdataIn <= 10;
			MDRead <= 1; 		//Setup MDRMux
			MDRIn <= 1;
			
			#25;
			MDRead <= 0; 
			MDRIn <= 0;
			
		end

		Reg_load1b: begin
			#15;
			MDROut <= 1; 			//Send from MDR
			MDRSelect <= 1;		//Select MDR as bus source
			R1In <= 1;				//Enable R2
			
			#25;
			MDROut <= 0;
			MDRSelect <= 0;
			R1In <= 0;
			
		end

		Reg_load2a: begin
			#15;
			MdataIn <= 7;		//Load new val
			MDRead<= 1; 		
			MDRIn <= 1;
			
			#25;
			MDRead<= 0; 
			MDRIn <= 0;
			
		end
		
		Reg_load2b: begin
			#15;
			MDROut <= 1; 			//Send from MDR
			MDRSelect <= 1;		//Select MDR as bus source
			R2In <= 1;
			
			#25;
			MDROut <= 0;
			MDRSelect <= 0;
			R2In <= 0;
			
		end

		Reg_load3a: begin
			#15;
			MdataIn <= 32'b0100;		//Load new val
			MDRead<= 1; 		
			MDRIn <= 1;
			
			#25;
			MDRead<= 0; 
			MDRIn <= 0;
			
		end

		Reg_load3b: begin
			#15;
			MDROut <= 1; 			//Send from MDR
			MDRSelect <= 1;		//Select MDR as bus source
			R6In <= 1;
			
			#25;
			MDROut <= 0;
			MDRSelect <= 0;
			R6In <= 0;
			
		end

		T0: begin // see if you need to de-assert these signals 1000
			#15;
			R7In <= 0; 
			MDRSelect <=0;
			PCOut <= 0; 
			MARIn <= 0; 
			PCIn <= 0; 
			RZIn <= 0;
		end

		T1: begin
			#15;
			MdataIn <= 32'h4A920000; // opcode for
			MDRead <= 1; 
			MDRIn <= 1;
			
			#25;
			MDRead<= 0; 
			MDRIn <= 0;
			
			ZLowOut <= 1; 
			PCIn <= 1; 
			
		end

		T2: begin
			#15;
			MDROut <= 1; 
			ZLowOut <= 1; 
			PCIn <= 1; 
			IRIn <= 1;
			
			#25;
			MDROut <= 0; 
			ZLowOut <= 0;
			PCIn <= 0;
			IRIn <= 0;
		end

		T3: begin
			#15;
			R2Select <= 1;  
			RYIn <= 1; 
			
			#25;
			R2Select <= 0;  
			RYIn <= 0;
			
		end

		T4: begin
			#15;
			R1Out <= 1; 
			R1Select <= 1; 
			
			#15;
			ALUcontrol <= 4'b0010; //op code
			LOWIn <= 1; 
			HIIn <= 1; 
			
			#45;
			R1Out <= 0; 
			R1Select <= 0; 
			
			LOWIn <= 0; 
			HIIn <= 0; 
			
		end

		T5: begin
			#15;
			LOWSelect <= 1; 
			LOWOut <= 1; 
			R3In <= 1;
			
			#25;
			LOWSelect <= 0;
			LOWOut <= 0; 
			R3In <= 0;
			
		end

	endcase
	
end

endmodule
