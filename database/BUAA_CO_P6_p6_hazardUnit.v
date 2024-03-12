`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:59 11/24/2018 
// Design Name: 
// Module Name:    hazardUnit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hazardUnit(
	 input [31:0] IR_D,
	 input [31:0] IR_E,
	 input [31:0] IR_M,
	 input [31:0] IR_W,
	 input Busy,
	 input start,
	 output IR_D_en,
	 output IR_E_clr,
	 output PC_en,
	 output [2:0]ForwardRSD,	
	 output [2:0]ForwardRTD,
	 output [2:0]ForwardRSE,	
	 output [2:0]ForwardRTE,	
	 output [2:0]ForwardRTM
    );

	`define op 31:26
	`define rs 25:21
	`define rt 20:16
	`define rd 15:11
	`define shamt 10:6
	`define func 5:0
	`define imm16 15:0
	
	`define R 6'b000000
	`define lw 6'b100011
	`define lb 6'b100000
	`define lbu 6'b100100
	`define lh 6'b100001
	`define lhu 6'b100101
	`define sw 6'b101011
	`define sb 6'b101000
	`define sh 6'b101001
	`define lui 6'b001111
	`define ori 6'b001101
	`define andi 6'b001100
	`define xori 6'b001110
	`define addi 6'b001000
	`define addiu 6'b001001
	`define slti 6'b001010
	`define sltiu 6'b001011
	`define beq 6'b000100
	`define bne 6'b000101
	`define bgtz 6'b000111
	`define blez 6'b000110
	`define jal 6'b000011
	`define addu 6'b100001
	`define add 6'b100000 
	`define subu 6'b100011
	`define sub 6'b100010
	`define and_ 6'b100100
	`define or_ 6'b100101
	`define xor_ 6'b100110
	`define nor_ 6'b100111
	`define sll 6'b000000
	`define srl b'b000010
	`define sra b'b000011
	`define sllv 6'b000100
	`define srlv b'b000110
	`define srav b'b000111
	`define jr 6'b001000
	`define jalr 6'b001001
	`define mult 6'b011000
	`define multu 6'b011001
	`define div 6'b011010
	`define divu 6'b011011 
	`define mfhi 6'b010000
	`define mflo 6'b010010
	`define mthi 6'b010001
	`define mtlo 6'b010011
	
	`define cal_r_D (IR_D[`op]==`R&&IR_D[`func]!=`jalr&&IR_D[`func]!=`jr&&IR_D[`func]!=`mfhi&&IR_D[`func]!=`mflo&&IR_D!=0)
	`define cal_r_E (IR_E[`op]==`R&&IR_E[`func]!=`jalr&&IR_E[`func]!=`jr&&IR_E[`func]!=`mfhi&&IR_E[`func]!=`mflo&&IR_E!=0)
	`define cal_r_M (IR_M[`op]==`R&&IR_M[`func]!=`jalr&&IR_M[`func]!=`jr&&IR_M[`func]!=`mfhi&&IR_M[`func]!=`mflo&&IR_M!=0)
	`define cal_r_W (IR_W[`op]==`R&&IR_W[`func]!=`jalr&&IR_W[`func]!=`jr&&IR_W[`func]!=`mfhi&&IR_W[`func]!=`mflo&&IR_W!=0)
	
	`define cal_i_D (IR_D[`op]==`lui||IR_D[`op]==`ori||IR_D[`op]==`addi||IR_D[`op]==`addiu||IR_D[`op]==`andi||IR_D[`op]==`xori||IR_D[`op]==`slti||IR_D[`op]==`sltiu)
	`define cal_i_E (IR_E[`op]==`lui||IR_E[`op]==`ori||IR_E[`op]==`addi||IR_E[`op]==`addiu||IR_E[`op]==`andi||IR_E[`op]==`xori||IR_E[`op]==`slti||IR_E[`op]==`sltiu)
	`define cal_i_M (IR_M[`op]==`lui||IR_M[`op]==`ori||IR_M[`op]==`addi||IR_M[`op]==`addiu||IR_M[`op]==`andi||IR_M[`op]==`xori||IR_M[`op]==`slti||IR_M[`op]==`sltiu)
	`define cal_i_W (IR_W[`op]==`lui||IR_W[`op]==`ori||IR_W[`op]==`addi||IR_W[`op]==`addiu||IR_W[`op]==`andi||IR_W[`op]==`xori||IR_W[`op]==`slti||IR_W[`op]==`sltiu)
	
	`define load_D (IR_D[`op]==`lw||IR_D[`op]==`lb||IR_D[`op]==`lbu||IR_D[`op]==`lh||IR_D[`op]==`lhu)
	`define load_E (IR_E[`op]==`lw||IR_E[`op]==`lb||IR_E[`op]==`lbu||IR_E[`op]==`lh||IR_E[`op]==`lhu)
	`define load_M (IR_M[`op]==`lw||IR_M[`op]==`lb||IR_M[`op]==`lbu||IR_M[`op]==`lh||IR_M[`op]==`lhu)
	`define load_W (IR_W[`op]==`lw||IR_W[`op]==`lb||IR_W[`op]==`lbu||IR_W[`op]==`lh||IR_W[`op]==`lhu)
	
	`define store_D (IR_D[`op]==`sw||IR_D[`op]==`sh||IR_D[`op]==`sb)
	`define store_E (IR_E[`op]==`sw||IR_E[`op]==`sh||IR_E[`op]==`sb)
	`define store_M (IR_M[`op]==`sw||IR_M[`op]==`sh||IR_M[`op]==`sb)
	`define store_W (IR_W[`op]==`sw||IR_W[`op]==`sh||IR_W[`op]==`sb)
	
	`define beq_D (IR_D[`op]==`beq||IR_D[`op]==`bne||IR_D[`op]==`bgtz||IR_D[`op]==`blez||(IR_D[`op]==6'b000001&&(IR_D[`rt]==5'b00000||IR_D[`rt]==5'b00001)))
	`define beq_E (IR_E[`op]==`beq||IR_E[`op]==`bne||IR_E[`op]==`bgtz||IR_E[`op]==`blez||(IR_E[`op]==6'b000001&&(IR_E[`rt]==5'b00000||IR_E[`rt]==5'b00001)))
	`define beq_M (IR_M[`op]==`beq||IR_M[`op]==`bne||IR_M[`op]==`bgtz||IR_M[`op]==`blez||(IR_M[`op]==6'b000001&&(IR_M[`rt]==5'b00000||IR_M[`rt]==5'b00001)))
	`define beq_W (IR_W[`op]==`beq||IR_W[`op]==`bne||IR_W[`op]==`bgtz||IR_W[`op]==`blez||(IR_W[`op]==6'b000001&&(IR_W[`rt]==5'b00000||IR_W[`rt]==5'b00001)))
	
	`define jal_D (IR_D[`op]==`jal)
	`define jal_E (IR_E[`op]==`jal)
	`define jal_M (IR_M[`op]==`jal)
	`define jal_W (IR_W[`op]==`jal)
	
	`define jalr_D (IR_D[`op]==`R&&IR_D[`func]==`jalr)
	`define jalr_E (IR_E[`op]==`R&&IR_E[`func]==`jalr)
	`define jalr_M (IR_M[`op]==`R&&IR_M[`func]==`jalr)
	`define jalr_W (IR_W[`op]==`R&&IR_W[`func]==`jalr)
	
	`define jr_D (IR_D[`op]==`R&&IR_D[`func]==`jr)
	`define jr_E (IR_E[`op]==`R&&IR_E[`func]==`jr)
	`define jr_M (IR_M[`op]==`R&&IR_M[`func]==`jr)
	`define jr_W (IR_W[`op]==`R&&IR_W[`func]==`jr)
	
	`define mfhi_D (IR_D[`op]==`R&&IR_D[`func]==`mfhi)
	`define mfhi_E (IR_E[`op]==`R&&IR_E[`func]==`mfhi)
	`define mfhi_M (IR_M[`op]==`R&&IR_M[`func]==`mfhi)
	`define mfhi_W (IR_W[`op]==`R&&IR_W[`func]==`mfhi)
	
	`define mflo_D (IR_D[`op]==`R&&IR_D[`func]==`mflo)
	`define mflo_E (IR_E[`op]==`R&&IR_E[`func]==`mflo)
	`define mflo_M (IR_M[`op]==`R&&IR_M[`func]==`mflo)
	`define mflo_W (IR_W[`op]==`R&&IR_W[`func]==`mflo)
	
	`define mf_D (`mfhi_D||`mflo_D)
	`define mf_E (`mfhi_E||`mflo_E)
	`define mf_M (`mfhi_M||`mflo_M)
	`define mf_W (`mfhi_W||`mflo_W)
	
	reg stall=0;
	wire stall_b,stall_cal_r,stall_cal_i,stall_load,stall_store,stall_jr,stall_jalr,stall_busy,stall_mfmt;
	
	assign stall_b = (`beq_D & `cal_r_E & (IR_D[`rs]==IR_E[`rd]&IR_E[`rd]!=0||IR_D[`rt]==IR_E[`rd]&IR_E[`rd]!=0))||
						  (`beq_D & `cal_i_E & (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0||IR_D[`rt]==IR_E[`rt]&IR_E[`rt]!=0))||
						  (`beq_D & `load_E  & (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0||IR_D[`rt]==IR_E[`rt]&IR_E[`rt]!=0))||
						  (`beq_D & `load_M  & (IR_D[`rs]==IR_M[`rt]&IR_M[`rt]!=0||IR_D[`rt]==IR_M[`rt]&IR_M[`rt]!=0));
	assign stall_cal_r = (`cal_r_D) && (`load_E) && (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0||IR_D[`rt]==IR_E[`rt]&IR_E[`rt]!=0);
	assign stall_cal_i = (`cal_i_D) && (`load_E) && (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0);
	assign stall_load =  (`load_D)  && (`load_E) && (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0);
	assign stall_store = (`store_D) && (`load_E) && (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0);
	assign stall_jr = (`jr_D & (`cal_r_E) & (IR_D[`rs]==IR_E[`rd]&IR_E[`rd]!=0))||
							(`jr_D & (`cal_i_E) & (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0))||
							(`jr_D & (`load_E)  & (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0))||
							(`jr_D & (`load_M)  & (IR_D[`rs]==IR_M[`rt]&IR_M[`rt]!=0));
	assign stall_jalr =  (`jalr_D & (`cal_r_E) & (IR_D[`rs]==IR_E[`rd]&IR_E[`rd]!=0))||
								(`jalr_D & (`cal_i_E) & (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0))||
								(`jalr_D & (`load_E)  & (IR_D[`rs]==IR_E[`rt]&IR_E[`rt]!=0))||
								(`jalr_D & (`load_M)  & (IR_D[`rs]==IR_M[`rt]&IR_M[`rt]!=0));
	assign stall_busy = (IR_D[`op]==`R&(IR_D[`func]==`mult||IR_D[`func]==`multu||IR_D[`func]==`div||IR_D[`func]==`divu||
	IR_D[`func]==`mflo||IR_D[`func]==`mfhi||IR_D[`func]==`mthi||IR_D[`func]==`mtlo)) & (Busy||start);
	//assign stall_mfmt = (IR_D[`op]==`R&(IR_D[`func]==`mult||IR_D[`func]==`multu||IR_D[`func]==`div||IR_D[`func]==`divu||
	//	IR_D[`func]==`mflo||IR_D[`func]==`mfhi||IR_D[`func]==`mthi||IR_D[`func]==`mtlo))
	//	&(IR_E[`op]==`R&(IR_E[`func]==`mult||IR_E[`func]==`multu||IR_E[`func]==`div||IR_E[`func]==`divu));
	always@(*) begin
		stall <= stall_b||stall_cal_r||stall_cal_i||stall_load||stall_store||stall_jr||stall_jalr||stall_busy;
	end
	
	assign IR_D_en = !stall;
	assign IR_E_clr = stall;
	assign PC_en = !stall;
	
	`define RSD (`cal_r_D||`cal_i_D||`load_D||`store_D||`beq_D||`jr_D||`jalr_D)
	`define RTD (`cal_r_D||`store_D||`beq_D)
	`define RSE (`cal_r_E||`cal_i_E||`load_E||`store_E)
	`define RTE (`cal_r_E||`store_E)
	`define RTM (`store_M)
	
	assign ForwardRSD = (`RSD & `jal_E   & IR_D[`rs]==31 & IR_D[`rs]!=0) ? 3 :
							  (`RSD & `jalr_E	 & IR_D[`rs]==IR_E[`rd] & IR_D[`rs]!=0) ? 3 :
							  (`RSD & `mf_E	 & IR_D[`rs]==IR_E[`rd] & IR_D[`rs]!=0) ? 6 :
							  (`RSD & `cal_r_M & IR_D[`rs]==IR_M[`rd] & IR_D[`rs]!=0) ? 1 :
							  (`RSD & `cal_i_M & IR_D[`rs]==IR_M[`rt] & IR_D[`rs]!=0) ? 1 :
							  (`RSD & `jal_M	 & IR_D[`rs]==31        & IR_D[`rs]!=0) ? 4 :
							  (`RSD & `jalr_M	 & IR_D[`rs]==IR_M[`rd] & IR_D[`rs]!=0) ? 4 :
							  (`RSD & `mf_M	 & IR_D[`rs]==IR_M[`rd] & IR_D[`rs]!=0) ? 7 :
							  (`RSD & `cal_r_W & IR_D[`rs]==IR_W[`rd] & IR_D[`rs]!=0) ? 2 :
							  (`RSD & `cal_i_W & IR_D[`rs]==IR_W[`rt] & IR_D[`rs]!=0) ? 2 :
							  (`RSD & `load_W  & IR_D[`rs]==IR_W[`rt] & IR_D[`rs]!=0) ? 2 :
							  (`RSD & `mf_W    & IR_D[`rs]==IR_W[`rd] & IR_D[`rs]!=0) ? 2 :
							  (`RSD & `jal_W	 & IR_D[`rs]==31        & IR_D[`rs]!=0) ? 5 :
							  (`RSD & `jalr_W  & IR_D[`rs]==IR_W[`rd] & IR_D[`rs]!=0) ? 5 : 0 ;
							  
	assign ForwardRTD = (`RTD & `jal_E	 & IR_D[`rt]==31 & IR_D[`rt]!=0) ? 3 :
							  (`RTD & `jalr_E	 & IR_D[`rt]==IR_E[`rd] & IR_D[`rt]!=0) ? 3 :
							  (`RTD & `mf_E	 & IR_D[`rt]==IR_E[`rd] & IR_D[`rt]!=0) ? 6 :
							  (`RTD & `cal_r_M & IR_D[`rt]==IR_M[`rd] & IR_D[`rt]!=0) ? 1 :
							  (`RTD & `cal_i_M & IR_D[`rt]==IR_M[`rt] & IR_D[`rt]!=0) ? 1 :
							  (`RTD & `jal_M	 & IR_D[`rt]==31        & IR_D[`rt]!=0) ? 4 :
							  (`RTD & `jalr_M	 & IR_D[`rt]==IR_M[`rd] & IR_D[`rt]!=0) ? 4 :
							  (`RTD & `mf_M	 & IR_D[`rt]==IR_M[`rd] & IR_D[`rt]!=0) ? 7 :
							  (`RTD & `cal_r_W & IR_D[`rt]==IR_W[`rd] & IR_D[`rt]!=0) ? 2 :
							  (`RTD & `cal_i_W & IR_D[`rt]==IR_W[`rt] & IR_D[`rt]!=0) ? 2 :
							  (`RTD & `load_W  & IR_D[`rt]==IR_W[`rt] & IR_D[`rt]!=0) ? 2 :
							  (`RTD & `mf_W    & IR_D[`rt]==IR_W[`rd] & IR_D[`rt]!=0) ? 2 :
							  (`RTD & `jal_W	 & IR_D[`rt]==31        & IR_D[`rt]!=0) ? 5 :
							  (`RTD & `jalr_W	 & IR_D[`rt]==IR_W[`rd] & IR_D[`rt]!=0) ? 5 : 0; 
							  
	assign ForwardRSE	= (`RSE & `cal_r_M & (IR_E[`rs]==IR_M[`rd]) & IR_E[`rs]!=0) ? 1 :
							  (`RSE & `cal_i_M & (IR_E[`rs]==IR_M[`rt]) & IR_E[`rs]!=0) ? 1 :
							  (`RSE & `jal_M   & (IR_E[`rs]==31)        & IR_E[`rs]!=0) ? 4 :
							  (`RSE & `jalr_M  & (IR_E[`rs]==IR_M[`rd]) & IR_E[`rs]!=0) ? 4 :
							  (`RSE & `mf_M    & (IR_E[`rs]==IR_M[`rd]) & IR_E[`rs]!=0) ? 7 :
							  (`RSE & `cal_r_W & (IR_E[`rs]==IR_W[`rd]) & IR_E[`rs]!=0) ? 2 :
							  (`RSE & `cal_i_W & (IR_E[`rs]==IR_W[`rt]) & IR_E[`rs]!=0) ? 2 :
							  (`RSE & `load_W  & (IR_E[`rs]==IR_W[`rt]) & IR_E[`rs]!=0) ? 2 :
							  (`RSE & `mf_W    & (IR_E[`rs]==IR_W[`rd]) & IR_E[`rs]!=0) ? 2 :
							  (`RSE & `jal_W   & (IR_E[`rs]==31)        & IR_E[`rs]!=0) ? 5 :
							  (`RSE & `jalr_W  & (IR_E[`rs]==IR_W[`rd]) & IR_E[`rs]!=0) ? 5 : 0;
							  
	assign ForwardRTE	= (`RTE & `cal_r_M & (IR_E[`rt]==IR_M[`rd]) & IR_E[`rt]!=0) ? 1 :
							  (`RTE & `cal_i_M & (IR_E[`rt]==IR_M[`rt]) & IR_E[`rt]!=0) ? 1 :
							  (`RTE & `jal_M   & (IR_E[`rt]==31)        & IR_E[`rt]!=0) ? 4 :
							  (`RTE & `jalr_M  & (IR_E[`rt]==IR_M[`rd]) & IR_E[`rt]!=0) ? 4 :
							  (`RTE & `mf_M    & (IR_E[`rt]==IR_M[`rd]) & IR_E[`rt]!=0) ? 7 :
							  (`RTE & `cal_r_W & (IR_E[`rt]==IR_W[`rd]) & IR_E[`rt]!=0) ? 2 :
							  (`RTE & `cal_i_W & (IR_E[`rt]==IR_W[`rt]) & IR_E[`rt]!=0) ? 2 :
							  (`RTE & `load_W  & (IR_E[`rt]==IR_W[`rt]) & IR_E[`rt]!=0) ? 2 :
							  (`RTE & `mf_W    & (IR_E[`rt]==IR_W[`rd]) & IR_E[`rt]!=0) ? 2 :
							  (`RTE & `jal_W   & (IR_E[`rt]==31)        & IR_E[`rt]!=0) ? 5 :
							  (`RTE & `jalr_W  & (IR_E[`rt]==IR_W[`rd]) & IR_E[`rt]!=0) ? 5 : 0;
							  
	assign ForwardRTM	= (`RTM & `cal_r_W & (IR_M[`rt]==IR_W[`rd]) & IR_M[`rt]!=0) ? 2 :
							  (`RTM & `cal_i_W & (IR_M[`rt]==IR_W[`rt]) & IR_M[`rt]!=0) ? 2 :
							  (`RTM & `load_W  & (IR_M[`rt]==IR_W[`rt]) & IR_M[`rt]!=0) ? 2 :
							  (`RTM & `mf_W    & (IR_M[`rt]==IR_W[`rd]) & IR_M[`rt]!=0) ? 2 :
							  (`RTM & `jal_W   & (IR_M[`rt]==31) & IR_M[`rt]!=0) ? 5 :
							  (`RTM & `jalr_W  & (IR_M[`rt]==IR_W[`rd]) & IR_M[`rt]!=0) ? 5 : 0;
endmodule
