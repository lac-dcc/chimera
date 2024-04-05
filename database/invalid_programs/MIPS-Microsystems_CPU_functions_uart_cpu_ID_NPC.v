`include "Op.v"

module NPC(NPCOp,Ins,PC,RS,equ,zero_greater,zero_equ,zero_less,NPC,PC8);
//interface
	input [31:0] NPCOp;

	input [31:0] Ins;
	input [31:0] PC;
	input [31:0] RS;
	
	input equ;		//whether two reg equal
	
	input zero_greater;
	input zero_equ;
	input zero_less;
	
	output reg [31:0] NPC;
	output [31:0] PC8;
	
//conbinational logic	
	wire [15:0] Imm;
	wire [25:0] index;
	
	assign Imm=Ins[15:0];
	assign index=Ins[25:0];
	
	always @(*)
		begin
			NPC=PC+4;		//eret at D will set NPC=PC+4
			case(NPCOp)
				`PC_4:NPC=PC+4;
				`PC_beq:
					begin
						if(equ)NPC=$signed(PC)+4+$signed(Imm)*4;
						else NPC=PC+8;
					end
				`PC_jal:NPC={PC[31:28],index,2'b0};
				`PC_jr:NPC=RS;
				`PC_bgez:
					begin
						if(zero_greater||zero_equ)NPC=$signed(PC)+4+$signed(Imm)*4;
						else NPC=PC+8;
					end
				`PC_bne:
					begin
						if(!equ)NPC=$signed(PC)+4+$signed(Imm)*4;
						else NPC=PC+8;
					end
				`PC_blez:
					begin
						if(zero_equ||zero_less)NPC=$signed(PC)+4+$signed(Imm)*4;
						else NPC=PC+8;
					end
				`PC_bltz:
					begin
						if(zero_less)NPC=$signed(PC)+4+$signed(Imm)*4;
						else NPC=PC+8;
					end
				`PC_bgtz:
					begin
						if(zero_greater)NPC=$signed(PC)+4+$signed(Imm)*4;
						else NPC=PC+8;
					end
			endcase
		end
	
	assign PC8=PC+8;

endmodule
