`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:09 11/23/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );

	`define op 31:26
	`define rs 25:21
	`define rt 20:16
	`define rd 15:11
	`define shamt 10:6
	`define func 5:0
	`define imm16 15:0
	`define imm26 25:0
	
	 wire PC_en;
	 wire[1:0] PC_sel;
    wire[31:0] PC;
	 wire[31:0] PC4;
	 wire[31:0] Instr;
	 wire ID_en;
	 wire EX_en;
	 wire MEM_en;
	 wire WB_en;
	 wire ID_reset;
	 wire EX_reset;
	 wire MEM_reset;
	 wire WB_reset;
	 wire[31:0] IR_D;
	 wire[31:0] PC_D;
    wire[31:0] PC4_D;
    wire[31:0] PC8_D;
	 wire[31:0] IR_E;
	 wire[31:0] PC_E;
    wire[31:0] PC4_E;
    wire[31:0] PC8_E;
	 wire[31:0] IR_M;
	 wire[31:0] PC_M;
    wire[31:0] PC4_M;
    wire[31:0] PC8_M;
	 wire[31:0] IR_W;
	 wire[31:0] PC_W;
    wire[31:0] PC4_W;
    wire[31:0] PC8_W;
	 wire Zero;
    wire Branch;
	 wire if_j;
	 wire[1:0] EXTop;
	 
	 wire[2:0] ALUCtrl;
    wire[1:0] RegDst;
    wire ALUASrc;
	 wire ALUBSrc;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire [1:0] MemtoReg;
	 
    wire [31:0] RS_E;
    wire [31:0] RT_E;
    wire [31:0] EXT_E; 
	 wire [31:0] AO_M; 
	 wire [31:0] RT_M; 
	 wire [31:0] DR_W; 
	 wire [31:0] AO_W; 
	 
    wire[4:0] MUX_A3;
    wire[31:0] MUX_WD;
    wire[31:0] RF_RD1;
    wire[31:0] RF_RD2;
	 wire[31:0] MFRSD;
	 wire[31:0] MFRTD;
    wire[31:0] MFRSE;
    wire[31:0] MFRTE;
    wire[31:0] MFRTM;
	 wire[31:0] EXT_out;
	 wire[31:0] ALU_A;
	 wire[31:0] ALU_B;
	 wire[31:0] ALU_out;
	 wire[31:0] DM_out;
	 wire[31:0] next_pc;
	 wire[2:0] ForwardRSD;
	 wire[2:0] ForwardRTD;	
	 wire[2:0] ForwardRSE;	
	 wire[2:0] ForwardRTE;	
	 wire[2:0] ForwardRTM;
		
	 assign EX_en = 1;
	 assign MEM_en = 1;
	 assign WB_en = 1;
	 assign ID_reset = 0;
	 assign MEM_reset = 0;
	 assign WB_reset = 0;
	 assign PC4 = PC + 4;
	 
	 pc my_pc(clk,reset,PC_en,next_pc,PC);
	 im my_im(PC,Instr);
	 
	 ID my_ID(clk,ID_reset||reset,ID_en,Instr,PC,IR_D,PC_D,PC4_D,PC8_D);
	 controller my_controllerD(.op(IR_D[`op]),.func(IR_D[`func]),.ExtOp(EXTop),.Branch(Branch),.if_j(if_j),.PCsel(PC_sel));
	 grf my_grf(clk,reset,RegWrite,IR_D[`rs],IR_D[`rt],MUX_A3,MUX_WD,PC_W,RF_RD1,RF_RD2);
	 cmp my_cmp(MFRSD,MFRTD,Zero);
	 ext my_ext(IR_D[`imm16],EXTop,EXT_out);
	 npc my_npc(PC4,PC4_D,IR_D[`imm26],MFRSD,Zero,Branch,if_j,PC_sel,next_pc);
	 
	 EX my_EX(clk,EX_reset||reset,EX_en,IR_D,PC_D,PC4_D,PC8_D,MFRSD,MFRTD,EXT_out,IR_E,PC_E,PC4_E,PC8_E,RS_E,RT_E,EXT_E);
	 controller my_controllerE(.op(IR_E[`op]),.func(IR_E[`func]),.ALUCtrl(ALUCtrl),.ALUASrc(ALUASrc),.ALUBSrc(ALUBSrc));
	 alu my_alu(ALU_A,ALU_B,ALUCtrl,ALU_out);
	 
	 MEM my_MEM(clk,MEM_reset||reset,MEM_en,IR_E,PC_E,PC4_E,PC8_E,ALU_out,MFRTE,IR_M,PC_M,PC4_M,PC8_M,AO_M,RT_M);
	 controller my_controllerM(.op(IR_M[`op]),.func(IR_M[`func]),.MemRead(MemRead),.MemWrite(MemWrite));
	 dm my_dm(clk,reset,MemWrite,MemRead,AO_M,MFRTM,PC_M,DM_out);
	 
	 WB my_WB(clk,WB_reset||reset,WB_en,IR_M,PC_M,PC4_M,PC8_M,AO_M,DM_out,IR_W,PC_W,PC4_W,PC8_W,AO_W,DR_W);
	 controller my_controllerW(.op(IR_W[`op]),.func(IR_W[`func]),.RegDst(RegDst),.RegWrite(RegWrite),.MemtoReg(MemtoReg));
	 
	 mux my_mux(EXT_E,IR_E,IR_W,DR_W,AO_W,PC8_W,MFRSE,MFRTE,ALUASrc,ALUBSrc,RegDst,MemtoReg,ALU_A,ALU_B,MUX_A3,MUX_WD);
	 forward_mux my_forward(RS_E,RT_E,RT_M,MUX_WD,AO_M,PC8_E,PC8_M,PC8_W,RF_RD1,RF_RD2,ForwardRSD,ForwardRTD,ForwardRSE,ForwardRTE,ForwardRTM,MFRSD,MFRTD,MFRSE,MFRTE,MFRTM);
	 hazardUnit my_hazard(IR_D,IR_E,IR_M,IR_W,ID_en,EX_reset,PC_en,ForwardRSD,ForwardRTD,ForwardRSE,ForwardRTE,ForwardRTM);
endmodule
