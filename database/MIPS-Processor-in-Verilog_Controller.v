module Controller(Clk,Reset);
	input Clk;
	input Reset;
	wire [31:0] PreInstruction_IF,Instruction_IF,PreInstruction_ID,Instruction_ID,Instruction_EX,Instruction_MEM,Instruction_WB;
	wire [31:0] PCNext4_IF,PCNext4_ID,PCNext4_EX,PCNext4_MEM,PCNext4_WB;
	wire [31:0] PCNow_IF,PCNow_ID,PCNow_EX;
	wire [31:0] PCTarget,JumpTarget;
	wire PCNextSel;
	
	wire [31:0] ReadData1,ReadData1_ID,ReadData1_EX,ReadData1_MEM,ReadData1_WB;
	wire [31:0] ReadData2,ReadData2_ID,ReadData2_EX,ReadData2_MEM;
	wire [31:0] ReadData1Final,ReadData2Final;
	wire ReadData1Sel_ID,ReadData2Sel_ID;
	wire [1:0] ReadData1Sel_EX,ReadData2Sel_EX;
	reg RegWrite;
	wire RegWrite_EX,RegWrite_MEM,RegWrite_WB;
	wire RegWriteFinal_MEM,RegWriteFinal_WB;
	reg [1:0] RegDst;
	wire [1:0] RegDst_EX,RegDst_MEM,RegDst_WB;
	reg RegWriteSel;
	wire RegWriteSel_EX,RegWriteSel_MEM,RegWriteSel_WB;
	wire [31:0] WriteDataToReg;
	wire [4:0] ReadRegister1, ReadRegister2;
	wire [31:0] Extended15to0Inst,Extended15to0Inst_EX;
	wire [4:0] WriteRegAddress,WriteRegAddress_EX,WriteRegAddress_MEM,WriteRegAddress_WB;
	
	reg [3:0] ALUControl;
	wire [3:0] ALUControl_EX;
	wire [31:0] ALUResult_EX,ALUResult_MEM,ALUResult_WB;
	reg [1:0] ALUASrc;
	wire [1:0] ALUASrc_EX;
	reg [3:0] ALUBSrc;
	wire [3:0] ALUBSrc_EX;
	wire [31:0] ALUSrcInA,ALUSrcInB;
	wire Zero_EX,Zero_MEM,Zero_WB;
	reg BranchEqual,BranchNotEqual,BranchBLTZ_BGTZ,BranchBGEZ;
	wire BranchEqual_EX,BranchNotEqual_EX,BranchBLTZ_BGTZ_EX,BranchBGEZ_EX;
	wire BranchOut1,BranchOut2,BranchOut3,BranchOut4,BranchOutTotal;
	reg BranchFlush;
	wire BranchFlush_EX;
	wire [31:0] BranchTarget_ID,BranchTarget_EX,BranchTargetFinal;
	wire [31:0] BranchTargetCorrection;
	wire PredictionError,BranchFinal,ErrorType,Prediction;
	wire BranchInstExists_ID,BranchInstExists_EX;
	
	
	reg [1:0] BHW;
	wire [1:0] BHW_EX,BHW_MEM;
	reg [1:0] MemtoReg;
	wire [1:0] MemtoReg_EX,MemtoReg_MEM,MemtoReg_WB;
	reg MemWrite;
	wire MemWrite_EX,MemWrite_MEM;
	reg MemRead;
	wire MemRead_EX,MemRead_MEM;
	reg DataMemExtendSign;
	wire DataMemExtendSign_EX,DataMemExtendSign_MEM;
	wire [31:0] WriteDataToMem;
	wire [31:0] RegData_MEM;
	wire [31:0] ReadDataFromMem,ReadDataFromMem_WB;
	
	reg JumpFlush,Jump,NOOP,ExtendSign;
	reg JumpSel;

	wire IF_ID_Reset,ID_EX_Reset,EX_MEM_Reset,MEM_WB_Reset;
	wire InstructionSel_IF,InstructionSel_ID,PCWrite,IF_ID_Write,Stall;
	
	
	InstructionFetchUnit IF(PreInstruction_IF,Reset,Clk,PCTarget,PCNextSel,PCNow_IF,PCNext4_IF,PCWrite);
	RegisterFile RF(ReadRegister1,ReadRegister2,WriteRegAddress_WB,WriteDataToReg,RegWriteFinal_WB,Clk,ReadData1,ReadData2);
	ALU32Bit ALU(ALUControl_EX, ALUSrcInA, ALUSrcInB, ALUResult_EX, Zero_EX);
	DataMemory DMem(ALUResult_MEM, ReadData2_MEM, Clk, MemWrite_MEM, MemRead_MEM, ReadDataFromMem,BHW_MEM,DataMemExtendSign_MEM);
	sign_extension InstExtend(Extended15to0Inst,Instruction_ID[15:0],ExtendSign);
	mux_4to1_32bit RegDataMux(WriteDataToReg, ALUResult_WB, ReadDataFromMem_WB,PCNext4_WB,ReadData1_WB, MemtoReg_WB);
	mux_4to1_5bit WriteRegAddressMux(WriteRegAddress,Instruction_ID[20:16],Instruction_ID[15:11],5'd31,5'h0,RegDst);
	mux_4to1_32bit ALUAInputMux(ALUSrcInA,ReadData1Final,ReadData2Final,Extended15to0Inst_EX,32'b0,ALUASrc_EX);
	mux_16to1_32bit ALUBInputMux(ALUSrcInB,ReadData2Final,Extended15to0Inst_EX,32'd0,32'd1,{27'd0,Instruction_EX[10:6]},
									ReadData1Final,32'd16,{26'd0,Instruction_EX[21],Instruction_EX[10:6]},
									{26'd0,Instruction_EX[6],ReadData1Final[4:0]},32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,32'd0,ALUBSrc_EX);
	mux_2to1_1bit RegWriteMux(RegWriteFinal_WB,RegWrite_WB,Zero_WB,RegWriteSel_WB);
	
	mux_2to1_32bit PCTargetMux(PCTarget,JumpTarget,BranchTargetFinal,BranchFinal);
	mux_2to1_32bit jumpsel(JumpTarget, {PCNow_ID[31:26],(Instruction_ID[25:0]<<2)}, ReadData1, JumpSel);
	
	mux_2to1_32bit BranchTargetMux(BranchTargetFinal,BranchTarget_ID,BranchTargetCorrection,PredictionError);
	mux_2to1_32bit BranchTargetCorrectionMux(BranchTargetCorrection,BranchTarget_EX,PCNext4_EX,ErrorType);
	
	
	ForwardingControl forward(Instruction_ID[25:21],Instruction_ID[20:16],Instruction_EX[25:21],Instruction_EX[20:16],RegWriteFinal_MEM,WriteRegAddress_MEM,
								RegWriteFinal_WB,WriteRegAddress_WB,ReadData1Sel_ID,ReadData2Sel_ID,ReadData1Sel_EX,ReadData2Sel_EX);
	mux_2to1_32bit ReadData1SelMux_ID(ReadData1_ID,ReadData1,WriteDataToReg,ReadData1Sel_ID);
	mux_2to1_32bit ReadData2SelMux_ID(ReadData2_ID,ReadData2,WriteDataToReg,ReadData2Sel_ID);
	mux_4to1_32bit ReadData1SelMux_EX(ReadData1Final,ReadData1_EX,RegData_MEM,WriteDataToReg,32'b0,ReadData1Sel_EX);
	mux_4to1_32bit ReadData2SelMux_EX(ReadData2Final,ReadData2_EX,RegData_MEM,WriteDataToReg,32'b0,ReadData2Sel_EX);
	mux_4to1_32bit RegDataMux_MEM(RegData_MEM,ALUResult_MEM,ReadDataFromMem,PCNext4_MEM,ReadData1_MEM,MemtoReg_MEM);
	mux_2to1_1bit RegWriteMux_MEM(RegWriteFinal_MEM,RegWrite_MEM,Zero_MEM,RegWriteSel_MEM);
	
	HazardDetector hazardDetector(MemRead_EX,PreInstruction_ID[25:21],PreInstruction_ID[20:16],Instruction_EX[20:16],Stall,Reset);
	mux_2to1_32bit InstructionMux_IF(Instruction_IF,PreInstruction_IF,32'b0,InstructionSel_IF);
	mux_2to1_32bit InstructionMux_ID(Instruction_ID,PreInstruction_ID,32'b0,InstructionSel_ID);
	
	BranchPredictor BranchPredictor(Reset,BranchInstExists_ID,BranchInstExists_EX,BranchOutTotal,Prediction);
	
	
	if_id_reg  IF_ID_REG(Clk,IF_ID_Reset,IF_ID_Write,Instruction_IF,PCNow_IF,PCNext4_IF,PreInstruction_ID,PCNow_ID,PCNext4_ID);
	
	ID_EX_REG  id_ex_reg(Clk, ID_EX_Reset,MemWrite, MemRead,RegWrite,RegWriteSel,MemtoReg,DataMemExtendSign,BranchBLTZ_BGTZ,BranchBGEZ,
						BranchNotEqual,BranchEqual,RegDst,ALUASrc,BHW,ALUBSrc,ALUControl,ReadData1_ID, 
						ReadData2_ID,Instruction_ID,Extended15to0Inst,BranchFlush,PCNow_ID,PCNext4_ID,WriteRegAddress,Prediction,MemWrite_EX, MemRead_EX,RegWrite_EX,RegWriteSel_EX,
						MemtoReg_EX,DataMemExtendSign_EX,BranchBLTZ_BGTZ_EX,BranchBGEZ_EX,BranchNotEqual_EX,BranchEqual_EX,
						RegDst_EX,ALUASrc_EX,BHW_EX,ALUBSrc_EX,ALUControl_EX,ReadData1_EX, ReadData2_EX,
						Instruction_EX,Extended15to0Inst_EX,BranchFlush_EX,PCNow_EX,PCNext4_EX,WriteRegAddress_EX,Prediction_EX); 
						
	EX_MEM_Reg EX_MEM_Reg(Clk,EX_MEM_Reset,MemRead_EX,MemWrite_EX,BHW_EX,DataMemExtendSign_EX,ReadData1_EX,
						ReadData2_EX,RegWrite_EX,RegDst_EX,RegWriteSel_EX,MemtoReg_EX,
						ALUResult_EX,Zero_EX,PCNext4_EX,Instruction_EX,WriteRegAddress_EX,MemRead_MEM,MemWrite_MEM,BHW_MEM,DataMemExtendSign_MEM,
						ReadData1_MEM,ReadData2_MEM,RegWrite_MEM,RegDst_MEM,RegWriteSel_MEM,
						MemtoReg_MEM,ALUResult_MEM,Zero_MEM,PCNext4_MEM,Instruction_MEM,WriteRegAddress_MEM);
						
	MEM_WB_REG mem_wb_reg(Clk, MEM_WB_Reset,ALUResult_MEM,Instruction_MEM,ReadDataFromMem, MemtoReg_MEM, RegWrite_MEM,RegWriteSel_MEM,
						ReadData1_MEM,Zero_MEM,RegDst_MEM,PCNext4_MEM,WriteRegAddress_MEM,ALUResult_WB,Instruction_WB,ReadDataFromMem_WB, MemtoReg_WB, 
						RegWrite_WB,RegWriteSel_WB,ReadData1_WB,RegDst_WB,Zero_WB,PCNext4_WB,WriteRegAddress_WB	);					

	assign ReadRegister1 = Instruction_ID[25:21];// rs
	assign ReadRegister2 = Instruction_ID[20:16];// rt
	assign WriteDataToMem = ReadData2;
	assign BranchOut1 = BranchEqual_EX & Zero_EX; // Represents AND gate
	assign BranchOut2 = BranchNotEqual_EX & (~Zero_EX);
	assign BranchOut3 = BranchBLTZ_BGTZ_EX & ALUResult_EX[0];
	assign BranchOut4 = BranchBGEZ_EX & ~(ALUResult_EX[0]);
	assign BranchOutTotal = BranchOut1 | BranchOut2 | BranchOut3 | BranchOut4;
	assign IF_ID_Reset = PredictionError | Reset;
	assign ID_EX_Reset = Reset;
	assign EX_MEM_Reset = Reset;
	assign MEM_WB_Reset = Reset;
	assign PCNextSel = Prediction | PredictionError | Jump;
	assign BranchTarget_ID = PCNow_ID + (Extended15to0Inst<<2);
	assign BranchTarget_EX = PCNow_EX + (Extended15to0Inst_EX<<2);
	assign PredictionError = Prediction_EX ^ BranchOutTotal;
	assign BranchFinal = Prediction | PredictionError;
	assign ErrorType = Prediction_EX;
	assign BranchInstExists_ID = BranchEqual | BranchNotEqual | BranchBLTZ_BGTZ | BranchBGEZ;
	assign BranchInstExists_EX = BranchEqual_EX | BranchNotEqual_EX | BranchBLTZ_BGTZ_EX | BranchBGEZ_EX;
	assign InstructionSel_IF = Prediction | JumpFlush;
	assign InstructionSel_ID = Stall;
	assign PCWrite = ~Stall;
	assign IF_ID_Write = ~Stall;
	 

	always @(Reset) begin
		Jump <= 0;
		JumpSel <= 0;
		JumpFlush <= 0;
		MemRead <= 0;
		MemtoReg <= 0;
		MemWrite <= 0;
		ALUControl <= 0;
		ALUASrc <= 0;
		ALUBSrc <= 0;
		ExtendSign <= 0;
		BranchEqual <= 0;
		BranchNotEqual <= 0;
		BranchBLTZ_BGTZ <= 0;
		BranchBGEZ <= 0;
		BranchFlush <= 0;
		RegWrite <= 0;
		RegWriteSel <= 0;
		RegDst <= 0;
		BHW <= 0;
		DataMemExtendSign <= 0;
	end
 
	always @(Instruction_ID) begin
	
		
//			Jump <= 0;
//			JumpSel <= 0;
//			JumpFlush <= 0;
//			MemRead <= 0;
//			MemtoReg <= 0;
//			MemWrite <= 0;
//			ALUControl <= 0;
//			ALUASrc <= 0;
//			ALUBSrc <= 0;
//			ExtendSign <= 0;
//			BranchEqual <= 0;
//			BranchNotEqual <= 0;
//			BranchBLTZ_BGTZ <= 0;
//			BranchBGEZ <= 0;
//			BranchFlush <= 0;
//			RegWrite <= 0;
//			RegWriteSel <= 0;
//			RegDst <= 0;
//			BHW <= 0;
//			DataMemExtendSign <= 0;
			


		if (Instruction_ID != 0) begin
			case (Instruction_ID[31:26]) 
				0: begin // R-type or SPECIAL
					case (Instruction_ID[5:0]) 
						32: begin // ADD
							ALUControl <= 2;
							RegWrite <= 1;
							ALUBSrc <= 0;
							ALUASrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						33: begin // ADDU
							ALUControl <= 2;
							RegWrite <= 1;
							ALUBSrc <= 0;
							ALUASrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						36:begin // AND
							ALUControl <= 0;
							RegWrite <= 1;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						37: begin // OR
							ALUControl <= 1;
							RegWrite <= 1;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						34:begin // SUB
							ALUControl <= 6;
							RegWrite <= 1;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						42:begin // SLT
							ALUControl <= 7;
							RegWrite <= 1;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						39: begin // NOR
							ALUControl <= 3;
							RegWrite <= 1;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						0: begin // SLL
							ALUControl <= 10;
							RegWrite <= 1;
							ALUBSrc <= 4;
							ALUASrc <= 1;
							Jump <= 0;
							JumpFlush <= 0;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						8: begin // JR
							Jump <= 1;
							JumpSel <= 1;
							JumpFlush <= 1;
							RegWrite <= 0;
							RegWriteSel <= 0;
							MemtoReg <= 0;
						end
						10: begin // MOVZ
							Jump <= 0;
							JumpFlush <= 0;
							MemtoReg <= 3;
							ALUControl <= 6;
							ALUASrc <= 1;
							ALUBSrc <= 2;
							RegWriteSel <= 1;
							//RegDataSel <= 2;
						end
						2: begin // ROTR & SRL
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 13;
							ALUASrc <= 1;
							ALUBSrc <= 7;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						6: begin // ROTRV & SRLV
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 13;
							ALUASrc <= 1;
							ALUBSrc <= 8;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						38: begin // XOR
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 4;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						4: begin // SLLV
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 10;
							ALUASrc <= 1;
							ALUBSrc <= 4;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						35: begin // SUBU
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 6;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							MemtoReg <= 0;
						end
						43: begin // SLTU
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 14;
							ALUASrc <= 0;
							ALUBSrc <= 0;
							RegWrite <= 1;
							//RegDataSel <= 0;
							RegDst <= 1;
							RegWriteSel <= 0;
							MemtoReg <= 0;
						end
						3: begin // SRA
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 15;
							ALUASrc <= 1;
							ALUBSrc <= 4;
							RegWrite <= 1;
							RegWriteSel <= 0;
							MemtoReg <= 0;
						end
						7: begin // SRAV
							Jump <= 0;
							JumpFlush <= 0;
							ALUControl <= 15;
							ALUASrc <= 1;
							ALUBSrc <= 5;
							RegWrite <= 1;
							RegWriteSel <= 0;
							MemtoReg <= 0;
						end
						default:
						RegWrite <= 0;
						
					endcase
					RegDst <= 1;
					MemRead <= 0;
					MemWrite <= 0;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
				end
				28: begin // SPECIAL2
					case (Instruction_ID[5:0])
						33: begin // CLO
							Jump <= 0;
							RegDst <= 1;
							BranchEqual <= 0;
							MemRead <= 0;
							MemtoReg <= 0;
							MemWrite <= 0;
							ALUControl <= 12;
							RegWrite <= 1;
							BranchNotEqual <= 0;
							ALUASrc <= 0;
							ALUBSrc <= 3;
							BranchBLTZ_BGTZ <= 0;
							BranchBGEZ <= 0;
							//RegDataSel <= 0;
						end
						32: begin // CLZ
							Jump <= 0;
							RegDst <= 1;
							BranchEqual <= 0;
							MemRead <= 0;
							MemtoReg <= 0;
							MemWrite <= 0;
							ALUControl <= 12;
							RegWrite <= 1;
							BranchNotEqual <= 0;
							ALUASrc <= 0;
							ALUBSrc <= 2;
							BranchBLTZ_BGTZ <= 0;
							BranchBGEZ <= 0;
							//RegDataSel <= 0;
						end
					endcase
					RegWriteSel <= 0;
					JumpFlush <= 0;
					BranchFlush <= 0;
				end
				8: begin // ADDI
					Jump <= 0;
					JumpFlush <= 0;
					RegDst <= 0;
					BranchEqual <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUBSrc <= 1;
					RegWrite <= 1;
					//RegDataSel <= 0;
					ALUControl <= 2;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					ALUASrc <= 0;
					ExtendSign <= 1;
					RegWriteSel <= 0;
				end
				9: begin //ADDIU
					Jump <= 0;
					JumpFlush <= 0;
					RegDst <= 0;
					BranchEqual <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUBSrc <= 1;
					RegWrite <= 1;
					//RegDataSel <= 0;
					ALUControl <= 2;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					ALUASrc <= 0;
					ExtendSign <= 0;
					RegWriteSel <= 0;
				end
				12: begin // ANDI
					Jump <= 0;
					JumpFlush <= 0;
					RegDst <= 0;
					BranchEqual <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUBSrc <= 1;
					RegWrite <= 1;
					//RegDataSel <= 0;
					ALUControl <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					ALUASrc <= 0;
					ExtendSign <= 0;
					RegWriteSel <= 0;
				end
				13: begin // ORI
					Jump <= 0;
					JumpFlush <= 0;
					RegDst <= 0;
					BranchEqual <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					RegWrite <= 1;
					//RegDataSel <= 0;
					ALUControl <= 1;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					ExtendSign <= 0;
					RegWriteSel <= 0;
				end
				4: begin // BEQ
					BranchEqual <= 1;
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUASrc <= 0;
					ALUBSrc <= 0;
					RegWrite <= 0;
					ALUControl <= 6;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 1;
					ExtendSign <= 0;
					RegWriteSel <= 0;
				end
				2: begin // Jump
					Jump <= 1;
					JumpSel <= 0;
					JumpFlush <= 1;
					MemRead <= 0;
					MemWrite <= 0;
					RegWrite <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWriteSel <= 0;
				end
				35: begin // LW
					Jump <= 0;
					JumpFlush <= 0;
					RegDst <= 0;
					BranchEqual <= 0;
					MemRead <= 1;
					MemtoReg <= 1;
					MemWrite <= 0;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					RegWrite <= 1;
					//RegDataSel <= 0;
					ALUControl <= 2;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					ExtendSign <= 0;
					RegWriteSel <= 0;
					BHW <= 2;
					DataMemExtendSign <= 1;
				end
				43: begin // SW
					Jump <= 0;
					JumpFlush <= 0;
					RegDst <= 0;
					BranchEqual <= 0;
					MemWrite <= 1;
					MemRead <= 0;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					RegWrite <= 0;
					ALUControl <= 2;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					ExtendSign <= 0;
					RegWriteSel <= 0;
					BHW <= 2;
					DataMemExtendSign <= 1;
				end
				5: begin // BNE
					Jump <= 0;
					JumpFlush <= 0;
					BranchEqual <= 0;
					MemWrite <= 0;
					MemRead <= 0;
					ALUASrc <= 0;
					ALUBSrc <= 0;
					RegWrite <= 0;
					ALUControl <= 6;
					BranchNotEqual <= 1;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 1;
					ExtendSign <= 1;
					RegWriteSel <= 0;
				end
				28: begin // MUL 
					RegDst <= 1;
					Jump <= 0;
					JumpFlush <= 0;
					BranchEqual <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					MemRead <= 0;
					ALUASrc <= 0;
					ALUBSrc <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					ALUControl <= 9;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWriteSel <= 0;
				end
				1: begin // BGEZ & BLTZ 
					case (Instruction_ID[20:16])
						0: begin // BLTZ
							BranchBLTZ_BGTZ <= 1;
							BranchBGEZ <= 0;
						end
						1: begin // BGEZ
							BranchBGEZ <= 1;
							BranchBLTZ_BGTZ <= 0;
						end
					endcase
					Jump <= 0;
					JumpFlush <= 0;
					BranchEqual <= 0;
					MemRead <= 0;
					MemWrite <= 0;
					ALUBSrc <= 2;
					ALUControl <= 7;
					RegWrite <= 0;
					BranchNotEqual <= 0;
					ALUASrc <= 0;
					ExtendSign <= 0;
					RegWriteSel <= 0;
					BranchFlush <= 1;
				end
				7: begin // BGTZ
					Jump <= 0;
					JumpFlush <= 0;
					BranchEqual <= 0;
					MemRead <= 0;
					MemWrite <= 0;
					ALUBSrc <= 2;
					ALUControl <= 11;
					RegWrite <= 0;
					BranchNotEqual <= 0;
					ALUASrc <= 0;
					ExtendSign <= 0;
					BranchBGEZ <= 0;
					BranchBLTZ_BGTZ <= 1;
					BranchFlush <= 1;
					RegWriteSel <= 0;
				end
				3: begin // JAL
					Jump <= 1;
					JumpSel <= 0;
					JumpFlush <= 1;
					RegDst <= 2;
					MemRead <= 0;
					MemWrite <= 0;
					MemtoReg <= 2;
					RegWrite <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					//RegDataSel <= 1;
					RegWriteSel <= 0;
				end
				14: begin // XORI
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUControl <= 4;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					RegDst <= 0;
					RegWriteSel <= 0;
					ExtendSign <= 0;
				end
				10: begin // SLTI
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUControl <= 7;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					RegDst <= 0;
					RegWriteSel <= 0;
					ExtendSign <= 1;
				end
				11: begin // SLTIU
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUControl <= 14;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					RegDst <= 0;
					RegWriteSel <= 0;
					ExtendSign <= 0;
				end
				15: begin // LUI
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					ALUControl <= 10;
					ALUASrc <= 2;
					ALUBSrc <= 6;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					RegDst <= 0;
					RegWriteSel <= 0;
					ExtendSign <= 0;
				end
				32: begin // LB
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 1;
					MemtoReg <= 1;
					MemWrite <= 0;
					ALUControl <= 2;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					RegDst <= 0;
					RegWriteSel <= 0;
					ExtendSign <= 1;
					BHW <= 0;
					DataMemExtendSign <= 1;
				end
				36: begin // LBU
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 1;
					MemtoReg <= 1;
					MemWrite <= 0;
					ALUControl <= 2;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					RegWrite <= 1;
					//RegDataSel <= 0;
					RegDst <= 0;
					RegWriteSel <= 0;
					ExtendSign <= 1;
					BHW <= 0;
					DataMemExtendSign <= 0;
					BranchFlush <= 0;
				end
				33: begin // LH
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 1;
					MemtoReg <= 1;
					MemWrite <= 0;
					ALUControl <= 2;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					ExtendSign <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					RegWriteSel <= 0;
					//RegDataSel <= 0;
					RegDst <= 0;
					BHW <= 1;
					DataMemExtendSign <= 1;
				end
				37: begin // LHU
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 1;
					MemtoReg <= 1;
					MemWrite <= 0;
					ALUControl <= 2;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					ExtendSign <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 1;
					RegWriteSel <= 0;
					//RegDataSel <= 0;
					RegDst <= 0;
					BHW <= 1;
					DataMemExtendSign <= 0;
				end
				40: begin // SB
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemWrite <= 1;
					ALUControl <= 2;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					ExtendSign <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 0;
					RegWriteSel <= 0;
					BHW <= 0;
					DataMemExtendSign <= 1;
				end
				41: begin // SH
					Jump <= 0;
					JumpFlush <= 0;
					MemRead <= 0;
					MemWrite <= 1;
					ALUControl <= 2;
					ALUASrc <= 0;
					ALUBSrc <= 1;
					ExtendSign <= 1;
					BranchEqual <= 0;
					BranchNotEqual <= 0;
					BranchBLTZ_BGTZ <= 0;
					BranchBGEZ <= 0;
					BranchFlush <= 0;
					RegWrite <= 0;
					RegWriteSel <= 0;
					BHW <= 1;
					DataMemExtendSign <= 1;
				end
				31: begin // SPECIAL3
					case (Instruction_ID[10:6])
						16: begin // SEB
							Jump <= 0;
							MemRead <= 0;
							MemtoReg <= 0;
							MemWrite <= 0;
							ALUControl <= 5;
							ALUASrc <= 1;
							ALUBSrc <= 2;
							BranchEqual <= 0;
							BranchNotEqual <= 0;
							BranchBLTZ_BGTZ <= 0;
							BranchBGEZ <= 0;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							RegDst <= 1;
						end
						24: begin // SEH
							Jump <= 0;
							MemRead <= 0;
							MemtoReg <= 0;
							MemWrite <= 0;
							ALUControl <= 5;
							ALUASrc <= 1;
							ALUBSrc <= 3;
							BranchEqual <= 0;
							BranchNotEqual <= 0;
							BranchBLTZ_BGTZ <= 0;
							BranchBGEZ <= 0;
							RegWrite <= 1;
							RegWriteSel <= 0;
							//RegDataSel <= 0;
							RegDst <= 1;
						end
					endcase
					JumpFlush <= 0;
					BranchFlush <= 0;
				end
			endcase
			NOOP <= 0;
		end else begin
			NOOP <= 1;
			Jump <= 0;
			JumpSel <= 0;
			JumpFlush <= 0;
			MemRead <= 0;
			MemtoReg <= 0;
			MemWrite <= 0;
			ALUControl <= 0;
			ALUASrc <= 0;
			ALUBSrc <= 0;
			ExtendSign <= 0;
			BranchEqual <= 0;
			BranchNotEqual <= 0;
			BranchBLTZ_BGTZ <= 0;
			BranchBGEZ <= 0;
			BranchFlush <= 0;
			RegWrite <= 0;
			RegWriteSel <= 0;
			//RegDataSel <= 0;
			RegDst <= 0;
			BHW <= 0;
			DataMemExtendSign <= 0;
		end
	end


	
	


endmodule