module MUX_PC(PC_Sel_D,PC_Sel_M,ADD4,NPC,EPC,NextPC);
//interface
	input [31:0] PC_Sel_D;
	input [31:0] PC_Sel_M;
	
	input [31:0] ADD4;
	input [31:0] NPC;
	input [31:0] EPC;
	
	output reg [31:0] NextPC;	//real NPC to output

//select logic
	parameter ADD4_NPC=0,
			  NPC_NPC=1,
			  CP0_EPC=2;
	
	always @(*)
		begin
			NextPC=ADD4;				//avoid latch
			if(PC_Sel_M==2)NextPC=EPC;	//i.e. eret is at MEM
			else
				begin
					case(PC_Sel_D)		//not jump until eret at MEM
						ADD4_NPC:NextPC=ADD4;
						NPC_NPC:NextPC=NPC;
					endcase
				end
		end
	
endmodule

module MUX_ALU_B(ALU_B_Sel,RT,Ext,B);
//interface
	input [31:0] ALU_B_Sel;
	
	input [31:0] RT;
	input [31:0] Ext;
	
	output reg [31:0] B;
	
//select logic
	always @(*)
		begin
			B=RT;
			case(ALU_B_Sel)
				0:B=RT;
				1:B=Ext;
			endcase
		end

endmodule

module MUX_RF_A3(RF_A3_Sel,Ins,A3);
//interface
	input [31:0] RF_A3_Sel;

	input [31:0] Ins;
	
	output reg [4:0] A3;
	
//select logic
	always @(*)
		begin
			A3=Ins[20:16];
			case(RF_A3_Sel)
				0:A3=Ins[20:16];	//RT
				1:A3=Ins[15:11];	//RD
				2:A3=32'd31;		//0x31
			endcase
		end
	
endmodule

module MUX_RF_WD(RF_WD_Sel,AO,RD,PC8,HI,LO,CP0_RD,RF_WD);
//interface
	input [31:0] RF_WD_Sel;

	input [31:0] AO;
	input [31:0] RD;
	input [31:0] PC8;
	input [31:0] HI;
	input [31:0] LO;
	input [31:0] CP0_RD;

//select logic
	output reg [31:0] RF_WD;

	always @(*)
		begin
			RF_WD=AO;
			case(RF_WD_Sel)
				0:RF_WD=AO;		//ALU.RST
				1:RF_WD=RD;		//DM.RD
				2:RF_WD=PC8;	//PC8
				3:RF_WD=HI;		//HI
				4:RF_WD=LO;		//LO
				5:RF_WD=CP0_RD;	//CP0.RD
			endcase
		end

endmodule

module MUX_RD_RAW(RD_RAW_Sel,DM_RD,Pr_RD,RD_RAW);
//interface
	input [31:0] RD_RAW_Sel;

	input [31:0] DM_RD;
	input [31:0] Pr_RD;

	output reg [31:0] RD_RAW;

//select logic
	always @(*)
		begin
			case(RD_RAW_Sel)
				0:RD_RAW=DM_RD;
				1:RD_RAW=Pr_RD;
			endcase
		end
endmodule