module MAIN_CTRL(Ins,RD1,RD2,AO,NPCOp,EXTOp,ALUOp,MDOp,RF_A3_Sel,RF_WD_Sel,ALU_B_Sel,PC_Sel,RD_RAW_Sel,RFWe,DMWe,CP0We,load,both,single,Ready_E,byte_op,half_op,unsigned_op,Start,md,lwr,mfc0,eret,undef,branch,flow_sus,EXL_Clr);
//interface
	input [31:0] Ins;
	
	input [31:0] RD1;
	input [31:0] RD2;

	input [31:0] AO;
	
	output reg [31:0] NPCOp;
	output reg [31:0] EXTOp;
	output reg [31:0] ALUOp;
	output reg [31:0] MDOp;
	
	output reg [31:0] RF_A3_Sel;
	output reg [31:0] RF_WD_Sel;
	output reg [31:0] ALU_B_Sel;
	output reg [31:0] PC_Sel;
	output reg [31:0] RD_RAW_Sel;
	
	output reg RFWe;
	output reg DMWe;
	output reg CP0We;
	
	output reg load;
	output reg both;
	output reg single;

	output reg Ready_E;
	
	output reg byte_op;
	output reg half_op;
	
	output reg unsigned_op;		//lbu&lhu

	output reg Start;
	output reg md;
	
	output lwr;
	output mfc0;
	output eret;

	output undef;
	output branch;
	output flow_sus;
	output reg EXL_Clr;

//get_Ins(capital for overlap names)
	wire ADD,ADDU,SUB,SUBU,AND,NOR,OR,XOR;
	wire ADDI,ADDIU,ANDI,LUI,ORI,XORI;
	wire BEQ,BLEZ,BLTZ,BGEZ,BGTZ,BNE,BGEZAL;
	wire SLT,SLTU,SLTI,SLTIU;
	wire SLL,SLLV,SRA,SRAV,SRLV,SRL;
	wire LW,LH,LHU,LB,LBU,SW,SH,SB;
	wire JAL,JR,J,JALR;
	wire MULT,MULTU,MTHI,MTLO,MFHI,MFLO,MADD,MADDU,MSUB,MSUBU,DIV,DIVU;
	wire MOVZ;
	wire LWR;
	wire CLZ;
	wire MFC0,MTC0;
	wire ERET;
	wire NOP;
	
	wire [31:26] op;
	wire [5:0] func;
	wire Rtype;
	
	assign op=Ins[31:26];
	assign func=Ins[5:0];
	assign Rtype=(op==6'b000000);

//R
	assign ADDU=Rtype&&(func==6'b100001);
	assign SUBU=Rtype&&(func==6'b100011);
	assign SLTU=Rtype&&(func==6'b101011);
	assign JR=Rtype&&(func==6'b001000);
	assign SLT=Rtype&&(func==6'b101010);
	assign OR=Rtype&&(func==6'b100101);
	assign JALR=Rtype&&(func==6'b001001);
	assign SLL=Rtype&&(func==6'b000000)&&(Ins!=0);
	assign AND=Rtype&&(func==6'b100100);
	assign SLLV=Rtype&&(func==6'b000100);
	assign SRA=Rtype&&(func==6'b000011);
	assign ADD=Rtype&&(func==6'b100000);
	assign SUB=Rtype&&(func==6'b100010);
	assign SRLV=Rtype&&(func==6'b000110);
	assign NOR=Rtype&&(func==6'b100111);
	assign XOR=Rtype&&(func==6'b100110);
	assign SRAV=Rtype&&(func==6'b000111);
	assign SRL=Rtype&&(func==6'b000010);
	assign MULT=Rtype&&(func==6'b011000);
	assign MULTU=Rtype&&(func==6'b011001);
	assign DIV=Rtype&&(func==6'b011010);
	assign DIVU=Rtype&&(func==6'b011011);
	assign MTHI=Rtype&&(func==6'b010001);
	assign MTLO=Rtype&&(func==6'b010011);
	assign MFHI=Rtype&&(func==6'b010000);
	assign MFLO=Rtype&&(func==6'b010010);
	assign MADD=(op==6'b011100)&&(func==6'b000000);
	assign MSUB=(op==6'b011100)&&(func==6'b000100);
	assign MADDU=(op==6'b011100)&&(func==6'b000001);
	assign MOVZ=Rtype&&(func==6'b001010);
	assign CLZ=(op==6'b011100)&&(func==6'b100000);
	assign MSUBU=(op==6'b011100)&&(func==6'b000101);
	assign MFC0=(op==6'b010000)&&(Ins[25:21]==5'b00000);
	assign MTC0=(op==6'b010000)&&(Ins[25:21]==5'b00100);
	assign ERET=(Ins==32'b010000_1000_0000_0000_0000_0000_011000);
	
//I
	assign LUI=(op==6'b001111);
	assign ORI=(op==6'b001101);
	assign LW=(op==6'b100011);
	assign SW=(op==6'b101011);
	assign BEQ=(op==6'b000100);
	assign LB=(op==6'b100000);
	assign SB=(op==6'b101000);
	assign ADDIU=(op==6'b001001);
	assign BGEZ=(op==6'b000001)&&(Ins[20:16]==5'b00001);		//BGEZ&BGE share the same opcode
	assign SH=(op==6'b101001);
	assign XORI=(op==6'b001110);
	assign BNE=(op==6'b000101);
	assign BLEZ=(op==6'b000110);
	assign SLTI=(op==6'b001010);
	assign LH=(op==6'b100001);
	assign ADDI=(op==6'b001000);
	assign ANDI=(op==6'b001100);
	assign BLTZ=(op==6'b000001)&&(Ins[20:16]==5'b00000);
	assign SLTIU=(op==6'b001011);
	assign LBU=(op==6'b100100);
	assign BGTZ=(op==6'b000111);
	assign LHU=(op==6'b100101);
	assign LWR=(op==6'b100110);
	assign BGEZAL=(op==6'b000001)&&(Ins[20:16]==5'b10001);

//J
	assign JAL=(op==6'b000011);
	assign J=(op==6'b000010);
	
//NOP
	assign NOP=(Ins==32'd0);
	
//signals with special operation 
	assign lwr=LWR;
	assign mfc0=MFC0;
	assign eret=ERET;
	
	assign undef=!(ADD||ADDU||SUB||SUBU||AND||NOR||OR||XOR||ADDI||ADDIU||ANDI||LUI||ORI||XORI||BEQ||BLEZ||BLTZ||BGEZ||BGTZ||BNE||BGEZAL||SLT||SLTU||SLTI||SLTIU||SLL||SLLV||SRA||SRAV||SRLV||SRL||LW||LH||LHU||LB||LBU||SW||SH||SB||JAL||JR||J||JALR||MULT||MULTU||MTHI||MTLO||MFHI||MFLO||MADD||MADDU||MSUB||MSUBU||DIV||DIVU||MOVZ||LWR||CLZ||MTC0||MFC0||ERET||NOP);	//62 in total
	assign branch=(BEQ||BLEZ||BLTZ||BGEZ||BGTZ||BNE||BGEZAL||JAL||JR||J||JALR);
	assign flow_sus=(ADD||ADDI||SUB);

//mem chip select
	always @(*)
		begin
			RD_RAW_Sel=0;
			if(AO>=32'h0000_0000&&AO<=32'h0000_1fff)RD_RAW_Sel=0;		//DM.RD
			else if(AO>=32'h0000_7f00&&AO<=32'h0000_7f0b)RD_RAW_Sel=1;	//Pr.RD
            else if(AO>=32'h0000_7f10&&AO<=32'h0000_7f43)RD_RAW_Sel=1;	//Pr.RD
		end

//generate signals
	always @(*)
		begin
			if(undef)	//avoid latch
				begin
					NPCOp=0;		
					EXTOp=0;		
					ALUOp=0;		
					MDOp=0;		
					RF_A3_Sel=0;
					RF_WD_Sel=0;
					ALU_B_Sel=0;
					PC_Sel=0;	
					RFWe=0;		
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end
			
			if(ADD)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(ADDI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(ADDIU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(ADDU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(AND)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=8;		//and
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(ANDI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=8;		//and
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BEQ)
				begin
					NPCOp=1;		//PC_beq
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=1;		//1
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BGEZ)
				begin
					NPCOp=4;		//PC_bgez
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BGEZAL)
				begin
					NPCOp=4;		//PC_bgez
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=2;		//0x1F
					RF_WD_Sel=2;		//NPC.PC8
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=$signed(RD1)>=0;		//RD1>=0
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=1;		//1
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BGTZ)
				begin
					NPCOp=8;		//PC_bgtz
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BLEZ)
				begin
					NPCOp=6;		//PC_blez
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BLTZ)
				begin
					NPCOp=7;		//PC_bltz
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(BNE)
				begin
					NPCOp=5;		//PC_bne
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=1;		//1
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(CLZ)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=17;		//clz
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(DIV)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=2;		//div
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(DIVU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=3;		//divu
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(J)
				begin
					NPCOp=2;		//PC_jal
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(JAL)
				begin
					NPCOp=2;		//PC_jal
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=2;		//0x1F
					RF_WD_Sel=2;		//NPC.PC8
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=1;		//1
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(JALR)
				begin
					NPCOp=3;		//PC_jr
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=2;		//NPC.PC8
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=1;		//1
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(JR)
				begin
					NPCOp=3;		//PC_jr
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=1;		//NPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=1;		//1
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(LB)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=5;		//lb
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=1;		//DM.RD
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=1;		//1
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(LBU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=1;		//DM.RD
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=1;		//1
					half_op=0;
					unsigned_op=1;		//1
					Start=0;
					EXL_Clr=0;
				end

			if(LH)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=1;		//DM.RD
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=1;		//1
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(LHU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=1;		//DM.RD
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=1;		//1
					unsigned_op=1;		//1
					Start=0;
					EXL_Clr=0;
				end

			if(LUI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=2;		//rear_ext
					ALUOp=7;		//load_i
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(LW)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=1;		//DM.RD
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(LWR)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=1;		//DM.RD
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=1;		//1
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MADD)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=6;		//madd
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(MADDU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=8;		//maddu
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(MFHI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=3;		//HI
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MFLO)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=4;		//LO
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MOVZ)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=16;		//movz
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=RD2==0;		//RD2==0
					DMWe=0;
					CP0We=0;
					load=0;
					both=1;		//1
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MSUB)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=7;		//msub
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(MSUBU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=9;		//msubu
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(MTHI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=4;		//mthi
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MTLO)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=5;		//mtlo
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MULT)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(MULTU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=1;		//multu
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=1;		//1
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=1;		//1
					EXL_Clr=0;
				end

			if(NOP)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(NOR)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=13;		//nor
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(OR)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=2;		//or
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(ORI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=2;		//or
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SB)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=5;		//lb
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=1;		//1
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=1;		//1
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SH)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=1;		//1
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=1;		//1
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SLL)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=6;		//sll
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SLLV)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=10;		//sllv
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SLT)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=3;		//slt
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SLTI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=3;		//slt
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SLTIU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=4;		//sltu
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SLTU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=4;		//sltu
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SRA)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=11;		//sra
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SRAV)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=14;		//srav
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SRL)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=15;		//srl
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SRLV)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=12;		//srlv
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SUB)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=1;		//sub
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SUBU)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=1;		//sub
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(SW)
				begin
					NPCOp=0;		//PC_4
					EXTOp=1;		//sign_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=1;		//1
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(XOR)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=9;		//xor
					MDOp=0;		//mult
					RF_A3_Sel=1;		//IM.D[15:11]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(XORI)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=9;		//xor
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=1;		//EXT.Ext
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MFC0)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=5;		//CP0.RD
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=1;		//1
					DMWe=0;
					CP0We=0;
					load=1;		//1
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(MTC0)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=0;		//ADD4
					RFWe=0;
					DMWe=0;
					CP0We=1;		//1
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=0;
				end

			if(ERET)
				begin
					NPCOp=0;		//PC_4
					EXTOp=0;		//zero_ext
					ALUOp=0;		//add
					MDOp=0;		//mult
					RF_A3_Sel=0;		//IM.D[20:16]
					RF_WD_Sel=0;		//ALU.C
					ALU_B_Sel=0;		//RF.RD2
					PC_Sel=2;		//EPC
					RFWe=0;
					DMWe=0;
					CP0We=0;
					load=0;
					both=0;
					single=0;
					md=0;
					Ready_E=0;
					byte_op=0;
					half_op=0;
					unsigned_op=0;
					Start=0;
					EXL_Clr=1;		//1
				end
		end

endmodule
